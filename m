Content-Type: multipart/mixed; boundary="===============5395874677702412701=="
MIME-Version: 1.0
From: kpusukur <kishore.kumar.pusukuri@oracle.com>
To: lkp@lists.01.org
Subject: Re: 8296d37010: vm-scalability.throughput -42.0% regression
Date: Fri, 29 Jul 2016 08:18:51 -0700
Message-ID: <62d36152-cc8b-ccd3-6321-454853b7e2fb@oracle.com>
In-Reply-To: <20160729143336.GA25551@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5395874677702412701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Got you. The content was distorted in my email.

BTW, are these runs on a 4-socket system?



On 07/29/2016 07:33 AM, Ye Xiaolong wrote:
> On 07/29, kpusukur wrote:
>> Many many thanks.
>> Is this metric we should focus? Please clarify.
>>
> I think this line is the metric we should take care:
>
>     79636124 =C2=B1  0%     -42.6%   45729951 =C2=B1  0%  vm-scalability.=
throughput
>
> Thanks,
> Xiaolong
>> vm-scalability.throughput
>>     519.82 =C2=B1  0%     +64.5%     855.11 =C2=B1  0%
>>
>>
>>
>> On 07/28/2016 11:51 PM, Ye Xiaolong wrote:
>>> On 07/28, kpusukur wrote:
>>>> On 07/27/2016 11:58 PM, Ye Xiaolong wrote:
>>>>> On Wed, Jul 27, 2016 at 11:55:29PM -0700, kpusukur wrote:
>>>>>> Huang/Xiolong,
>>>>>>
>>>>>> Since Linux scheduler uniformly distributes threads across sockets/c=
hips and
>>>>>> we create 4 threads to clear 2MB pages on a 4-socket system such as =
"144
>>>>>> threads Brickland Haswell-EX", the 4 threads are separated on the 4 =
sockets
>>>>>> and therefore locality is severely damaged. One quick solution is us=
ing just
>>>>>> 2 threads instead of 4 so that we may get save some locality benefit=
s.
>>>>>>
>>>>>> Could you please evaluate the attached patch. I really appreciate yo=
ur help.
>>>>> Sure, I'll apply the attached patch on top of 8296d37 ("Speeds up cle=
aring huge
>>>>> pages using work queue") and provide compare data later.
>>>> Sorry. I have provided a fresh patch for clearing huge pages. Either
>>>> you apply this patch on top of "fresh" kernel
>>>> or
>>>> change the following in the existing work queue patch you have
>>>> applied already
>>>>
>>>> Please replace
>>>>
>>>> 	if (huge_page_size < 8*1024*1024)
>>>> 		num_workers =3D 4;
>>>>
>>>> with
>>>>
>>>> 	if (huge_page_size < 8*1024*1024)
>>>> 		num_workers =3D 2;
>>>>
>>>>
>>>> Basically if the huge page size is less than 8MB (e.g., 2MB on intel
>>>> x86_64 systems), then use 2 threads instead of 4.
>>>>
>>>> Please let me know if you need anything else.
>>> Hi, kpusukur
>>>
>>> I've rebased your new patch on v4.7-rc7, and here is the comparison res=
ults, seems it doesn't
>>> help to recover performance back.
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/t=
estcase:
>>>    gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/8T=
/lkp-hsx04/anon-w-seq/vm-scalability
>>> commit:
>>>    v4.7-rc7
>>>    ab3499ab35be143e2d921d5602b7e725e53379c2
>>>          v4.7-rc7 ab3499ab35be143e2d921d5602
>>> ---------------- --------------------------
>>>         fail:runs  %reproduction    fail:runs
>>>             |             |             |
>>>            1:17          -6%            :5     last_state.soft_timeout
>>>            1:17          -6%            :5     stderr.NMI_watchdog
>>>            1:17          -6%            :5     kmsg.DHCP/BOOTP:Reply_no=
t_for_us,op[#]xid[#b162]
>>>            1:17          -6%            :5     kmsg.DHCP/BOOTP:Reply_no=
t_for_us,op[#]xid[#e5ca]
>>>            4:17         -24%            :5     kmsg.Error:Driver'pcspkr=
'is_already_registered,aborting
>>>            4:17         -24%            :5     kmsg.ixgbe#:#:#:A_slot_w=
ith_more_lanes_and/or_higher_speed_is_suggested
>>>            4:17         -24%            :5     kmsg.ixgbe#:#:#:For_opti=
mal_performance,at_least#GT/s_of_bandwidth_is_required
>>>            4:17         -24%            :5     kmsg.ixgbe#:#:#:This_is_=
not_sufficient_for_optimal_performance_of_this_card
>>>            3:17         -18%            :5     kmsg.perf:interrupt_took=
_too_long(#>#),lowering_kernel.perf_event_max_sample_rate_to
>>>           %stddev     %change         %stddev
>>>               \          |                \
>>>        0.03 =C2=B1 19%     -74.5%       0.01 =C2=B1  5%  vm-scalability=
.stddev
>>>    79636124 =C2=B1  0%     -42.6%   45729951 =C2=B1  0%  vm-scalability=
.throughput
>>>      519.82 =C2=B1  0%     +64.5%     855.11 =C2=B1  0%  vm-scalability=
.time.elapsed_time
>>>      519.82 =C2=B1  0%     +64.5%     855.11 =C2=B1  0%  vm-scalability=
.time.elapsed_time.max
>>>      489875 =C2=B1  8%   +3806.7%   19137929 =C2=B1  0%  vm-scalability=
.time.involuntary_context_switches
>>>    27243482 =C2=B1  1%      -6.2%   25554144 =C2=B1  1%  vm-scalability=
.time.minor_page_faults
>>>       13145 =C2=B1  0%     -68.9%       4092 =C2=B1  0%  vm-scalability=
.time.percent_of_cpu_this_job_got
>>>       34747 =C2=B1  0%     -26.7%      25469 =C2=B1  0%  vm-scalability=
.time.system_time
>>>       33586 =C2=B1  1%     -71.6%       9531 =C2=B1  0%  vm-scalability=
.time.user_time
>>>       41312 =C2=B1  1%  +67799.0%   28050816 =C2=B1  0%  vm-scalability=
.time.voluntary_context_switches
>>>      247543 =C2=B1146%    +400.1%    1237885 =C2=B1  0%  interrupts.CAL=
:Function_call_interrupts
>>>      780505 =C2=B1  2%      +7.2%     836996 =C2=B1  2%  meminfo.Cached
>>>      291152 =C2=B1  7%     +19.3%     347417 =C2=B1  4%  meminfo.Shmem
>>>        8999 =C2=B1 54%     +80.5%      16243 =C2=B1  2%  numa-numastat.=
node2.numa_foreign
>>>        8999 =C2=B1 54%     +80.5%      16243 =C2=B1  2%  numa-numastat.=
node2.numa_miss
>>>      713.60 =C2=B1  7%     +49.9%       1069 =C2=B1  1%  numa-vmstat.no=
de0.nr_kernel_stack
>>>        1124 =C2=B1 54%    +138.7%       2684 =C2=B1 38%  numa-vmstat.no=
de0.nr_mapped
>>>      385.47 =C2=B1 24%     +89.9%     732.00 =C2=B1  1%  numa-vmstat.no=
de2.nr_kernel_stack
>>>       16021 =C2=B1  4%     +54.8%      24793 =C2=B1  2%  softirqs.NET_RX
>>>     5920536 =C2=B1  9%    +180.2%   16592148 =C2=B1  0%  softirqs.RCU
>>>      549196 =C2=B1 13%   +2411.9%   13795260 =C2=B1  0%  softirqs.SCHED
>>>      134.00 =C2=B1  1%     -35.8%      86.00 =C2=B1  0%  vmstat.procs.r
>>>       13168 =C2=B1 29%   +2723.0%     371764 =C2=B1  0%  vmstat.system.=
cs
>>>      145199 =C2=B1  3%      +6.4%     154556 =C2=B1  0%  vmstat.system.=
in
>>>       11423 =C2=B1  7%     +49.9%      17124 =C2=B1  1%  numa-meminfo.n=
ode0.KernelStack
>>>        4499 =C2=B1 54%    +138.9%      10747 =C2=B1 38%  numa-meminfo.n=
ode0.Mapped
>>>       83624 =C2=B1  6%     +14.5%      95765 =C2=B1  6%  numa-meminfo.n=
ode0.Slab
>>>        6179 =C2=B1 24%     +89.8%      11725 =C2=B1  1%  numa-meminfo.n=
ode2.KernelStack
>>>      519.82 =C2=B1  0%     +64.5%     855.11 =C2=B1  0%  time.elapsed_t=
ime
>>>      519.82 =C2=B1  0%     +64.5%     855.11 =C2=B1  0%  time.elapsed_t=
ime.max
>>>      489875 =C2=B1  8%   +3806.7%   19137929 =C2=B1  0%  time.involunta=
ry_context_switches
>>>       13145 =C2=B1  0%     -68.9%       4092 =C2=B1  0%  time.percent_o=
f_cpu_this_job_got
>>>       34747 =C2=B1  0%     -26.7%      25469 =C2=B1  0%  time.system_ti=
me
>>>       33586 =C2=B1  1%     -71.6%       9531 =C2=B1  0%  time.user_time
>>>       41312 =C2=B1  1%  +67799.0%   28050816 =C2=B1  0%  time.voluntary=
_context_switches
>>>       91.75 =C2=B1  0%     -41.5%      53.72 =C2=B1  0%  turbostat.%Busy
>>>        2653 =C2=B1  0%     -41.5%       1553 =C2=B1  0%  turbostat.Avg_=
MHz
>>>        3.50 =C2=B1 11%   +1053.0%      40.41 =C2=B1  0%  turbostat.CPU%=
c1
>>>        0.02 =C2=B1 28%  +15095.0%       2.53 =C2=B1  0%  turbostat.CPU%=
c3
>>>        4.73 =C2=B1 17%     -29.3%       3.34 =C2=B1  1%  turbostat.CPU%=
c6
>>>        1.33 =C2=B1 19%     -80.5%       0.26 =C2=B1  8%  turbostat.Pkg%=
pc2
>>>
>>> Thanks,
>>> Xiaolong
>>>
>>>>> Thanks,
>>>>> Xiaolong
>>>>>
>>>>>> Thank you.
>>>>>>
>>>>>> Best
>>>>>> Kishore Pusukuri
>>>>>>
>>>>>>
>>>>>> On 07/25/2016 09:57 PM, kpusukur wrote:
>>>>>>> In summary: the patch (the work queue implementation) improves perf=
ormance
>>>>>>> up to 47% on a system with two sockets or less. However, on a syste=
m with
>>>>>>> more than two sockets (e.g., a 4 socket systems: 144 hardware threa=
ds,
>>>>>>> Brickland Haswell-EX), it degrades performance. This is mainly beca=
use of
>>>>>>> not preserving data locality. Since the linux scheduler by default
>>>>>>> uniformly distributes threads across sockets, when we are using mul=
tiple
>>>>>>> kernel threads to clear huge pages, on a system with more than two =
sockets,
>>>>>>> we are loosing the benefit of exploiting parallelism available in c=
learing
>>>>>>> huge pages. One solution is to bind the kernel threads where (on the
>>>>>>> socket) the memory (huge page) is touched. I will soon provide a pa=
tch for
>>>>>>> this.
>>>>>>>
>>>>>>> Thank you.
>>>>>>>
>>>>>>> Best
>>>>>>>
>>>>>>> Kishore Pusukuri
>>>>>>>
>>>>>>>
>>>>>>> On 07/20/2016 05:50 PM, kernel test robot wrote:
>>>>>>>> FYI, we noticed a -42.0% regression of vm-scalability.throughput d=
ue to
>>>>>>>> commit:
>>>>>>>>
>>>>>>>> commit 8296d3701014cd804bf981b5e2bf9a58b5c0e341 ("Speeds up cleari=
ng huge
>>>>>>>> pages using work queue")
>>>>>>>> git://bee.sh.intel.com/git/yhuang/linux.git dbg_clear_huge_page
>>>>>>>>
>>>>>>>> in testcase: vm-scalability
>>>>>>>> on test machine: 144 threads Brickland Haswell-EX with 512G memory
>>>>>>>> with following parameters:
>>>>>>>>     cpufreq_governor: performance
>>>>>>>>             runtime: 300s
>>>>>>>>             size: 8T
>>>>>>>>             test: anon-w-seq
>>>>>>>>
>>>>>>>>
>>>>>>>> In addition to that, the commit also has significant impact on the
>>>>>>>> following tests:
>>>>>>>>
>>>>>>>> +------------------+----------------------------------------------=
------------------------------------+
>>>>>>>>
>>>>>>>> | testcase: change | vm-scalability: vm-scalability.throughput 27.=
7%
>>>>>>>> improvement                      |
>>>>>>>> | test machine     | 72 threads Brickland Haswell-EP with 128G mem=
ory
>>>>>>>> |
>>>>>>>> | test parameters  | cpufreq_governor=3Dperformance |
>>>>>>>> |                  | nr_task=3D1 |
>>>>>>>> |                  | runtime=3D300s |
>>>>>>>> |                  | size=3D8T |
>>>>>>>> |                  | test=3Danon-w-seq |
>>>>>>>> +------------------+----------------------------------------------=
------------------------------------+
>>>>>>>>
>>>>>>>> | testcase: change | vm-scalability: vm-scalability.throughput 33.=
5%
>>>>>>>> improvement                      |
>>>>>>>> | test machine     | 88 threads Broadwell-EP with 128G memory
>>>>>>>> |
>>>>>>>> | test parameters  | cpufreq_governor=3Dperformance |
>>>>>>>> |                  | runtime=3D300s |
>>>>>>>> |                  | size=3D8T |
>>>>>>>> |                  | test=3Danon-w-seq |
>>>>>>>> +------------------+----------------------------------------------=
------------------------------------+
>>>>>>>>
>>>>>>>> | testcase: change | vm-scalability: vm-scalability.throughput 45.=
6%
>>>>>>>> improvement                      |
>>>>>>>> | test machine     | 72 threads Brickland Haswell-EP with 128G mem=
ory
>>>>>>>> |
>>>>>>>> | test parameters  | cpufreq_governor=3Dperformance |
>>>>>>>> |                  | runtime=3D300s |
>>>>>>>> |                  | size=3D8T |
>>>>>>>> |                  | test=3Danon-w-seq |
>>>>>>>> +------------------+----------------------------------------------=
------------------------------------+
>>>>>>>>
>>>>>>>> | testcase: change | vm-scalability: |
>>>>>>>> | test machine     | 4 threads qemu-system-x86_64 -enable-kvm -cpu
>>>>>>>> qemu64,+ssse3 with 4G memory       |
>>>>>>>> | test parameters  | runtime=3D300s |
>>>>>>>> |                  | size=3D2T |
>>>>>>>> |                  | test=3Dshm-pread-seq |
>>>>>>>> +------------------+----------------------------------------------=
------------------------------------+
>>>>>>>>
>>>>>>>> | testcase: change | vm-scalability: |
>>>>>>>> | test machine     | 72 threads Brickland Haswell-EP with 128G mem=
ory
>>>>>>>> |
>>>>>>>> | test parameters  | cpufreq_governor=3Dperformance |
>>>>>>>> |                  | runtime=3D300s |
>>>>>>>> |                  | size=3D8T |
>>>>>>>> |                  | test=3Danon-w-seq |
>>>>>>>> |                  | thp_defrag=3Dnever |
>>>>>>>> |                  | thp_enabled=3Dnever |
>>>>>>>> +------------------+----------------------------------------------=
------------------------------------+
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> Disclaimer:
>>>>>>>> Results have been estimated based on internal Intel analysis and a=
re
>>>>>>>> provided
>>>>>>>> for informational purposes only. Any difference in system hardware=
 or
>>>>>>>> software
>>>>>>>> design or configuration may affect actual performance.
>>>>>>>>
>>>>>>>> Details are as below:
>>>>>>>> ------------------------------------------------------------------=
-------------------------------->
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> To reproduce:
>>>>>>>>
>>>>>>>>          git clone
>>>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
>>>>>>>>          cd lkp-tests
>>>>>>>>          bin/lkp install job.yaml  # job file is attached in this =
email
>>>>>>>>          bin/lkp run     job.yaml
>>>>>>>>
>>>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>>>
>>>>>>>> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/t=
est/testcase:
>>>>>>>>
>>>>>>>> gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/=
8T/lkp-hsx04/anon-w-seq/vm-scalability
>>>>>>>>
>>>>>>>> commit:
>>>>>>>>    v4.7-rc7
>>>>>>>>    8296d37010 ("Speeds up clearing huge pages using work queue")
>>>>>>>>
>>>>>>>>          v4.7-rc7 8296d3701014cd804bf981b5e2
>>>>>>>> ---------------- --------------------------
>>>>>>>>         fail:runs  %reproduction    fail:runs
>>>>>>>>             |             |             |
>>>>>>>>           %stddev     %change         %stddev
>>>>>>>>               \          |                \
>>>>>>>>    79883256 =C2=B1  0%     -42.0%   46349306 =C2=B1  0% vm-scalabi=
lity.throughput
>>>>>>>>      516.98 =C2=B1  0%     +65.4%     855.09 =C2=B1  0%
>>>>>>>> vm-scalability.time.elapsed_time
>>>>>>>>      516.98 =C2=B1  0%     +65.4%     855.09 =C2=B1  0%
>>>>>>>> vm-scalability.time.elapsed_time.max
>>>>>>>>      427347 =C2=B1  1%   +4365.4%   19082862 =C2=B1  0%
>>>>>>>> vm-scalability.time.involuntary_context_switches
>>>>>>>>    27202100 =C2=B1  1%      -3.8%   26170440 =C2=B1  1%
>>>>>>>> vm-scalability.time.minor_page_faults
>>>>>>>>       13276 =C2=B1  0%     -69.6%       4036 =C2=B1  0%
>>>>>>>> vm-scalability.time.percent_of_cpu_this_job_got
>>>>>>>>       34729 =C2=B1  0%     -27.8%      25090 =C2=B1  0%
>>>>>>>> vm-scalability.time.system_time
>>>>>>>>       33909 =C2=B1  0%     -72.2%       9431 =C2=B1  0%
>>>>>>>> vm-scalability.time.user_time
>>>>>>>>       41305 =C2=B1  0%  +69327.1%   28676869 =C2=B1  0%
>>>>>>>> vm-scalability.time.voluntary_context_switches
>>>>>>>>       28541 =C2=B1  0%     +88.3%      53732 =C2=B1  0% meminfo.Ke=
rnelStack
>>>>>>>>       15170 =C2=B1  3%     +42.4%      21607 =C2=B1  4%  softirqs.=
NET_RX
>>>>>>>>     5954845 =C2=B1  1%    +198.8%   17795401 =C2=B1  0%  softirqs.=
RCU
>>>>>>>>      547545 =C2=B1 10%   +2448.4%   13953494 =C2=B1  0%  softirqs.=
SCHED
>>>>>>>>      134.75 =C2=B1  1%     -39.0%      82.20 =C2=B1  0%  vmstat.pr=
ocs.r
>>>>>>>>        7130 =C2=B1  3%   +5610.4%     407164 =C2=B1  0%  vmstat.sy=
stem.cs
>>>>>>>>      147778 =C2=B1  0%      +3.2%     152445 =C2=B1  0%  vmstat.sy=
stem.in
>>>>>>>>       11247 =C2=B1  1%     +56.8%      17639 =C2=B1  0%
>>>>>>>> numa-meminfo.node0.KernelStack
>>>>>>>>        5822 =C2=B1  6%    +106.8%      12037 =C2=B1  1%
>>>>>>>> numa-meminfo.node1.KernelStack
>>>>>>>>        5796 =C2=B1  4%    +111.4%      12253 =C2=B1  1%
>>>>>>>> numa-meminfo.node2.KernelStack
>>>>>>>>        5691 =C2=B1  3%    +108.3%      11852 =C2=B1  0%
>>>>>>>> numa-meminfo.node3.KernelStack
>>>>>>>>        1137 =C2=B1 18%    +703.1%       9135 =C2=B1167% numa-memin=
fo.node3.Shmem
>>>>>>>>      702.75 =C2=B1  1%     +56.8%       1101 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_kernel_stack
>>>>>>>>      363.50 =C2=B1  6%    +106.8%     751.80 =C2=B1  1%
>>>>>>>> numa-vmstat.node1.nr_kernel_stack
>>>>>>>>      361.00 =C2=B1  4%    +112.0%     765.40 =C2=B1  1%
>>>>>>>> numa-vmstat.node2.nr_kernel_stack
>>>>>>>>      355.00 =C2=B1  3%    +108.6%     740.40 =C2=B1  0%
>>>>>>>> numa-vmstat.node3.nr_kernel_stack
>>>>>>>>      283.75 =C2=B1 18%    +704.8%       2283 =C2=B1167% numa-vmsta=
t.node3.nr_shmem
>>>>>>>>      559380 =C2=B1 16%  +6.6e+05%  3.712e+09 =C2=B1  1% cpuidle.C1=
-HSW.time
>>>>>>>>       46260 =C2=B1 23%  +89365.4%   41386703 =C2=B1  1% cpuidle.C1=
-HSW.usage
>>>>>>>>    14628635 =C2=B1 16%  +34618.7%  5.079e+09 =C2=B1  0% cpuidle.C1=
E-HSW.time
>>>>>>>>       28388 =C2=B1  6%    +2e+05%   55926082 =C2=B1  0% cpuidle.C1=
E-HSW.usage
>>>>>>>>    21808226 =C2=B1  3%  +76644.1%  1.674e+10 =C2=B1  0% cpuidle.C3=
-HSW.time
>>>>>>>>       61344 =C2=B1  3%    +1e+05%   63558599 =C2=B1  0% cpuidle.C3=
-HSW.usage
>>>>>>>>   5.555e+09 =C2=B1  3%    +491.3%  3.285e+10 =C2=B1  0% cpuidle.C6=
-HSW.time
>>>>>>>>     5848295 =C2=B1  3%    +758.9%   50232586 =C2=B1  0% cpuidle.C6=
-HSW.usage
>>>>>>>>     6742029 =C2=B1 19%   +1671.8%  1.195e+08 =C2=B1  0%  cpuidle.P=
OLL.time
>>>>>>>>        1012 =C2=B1 18%  +41616.8%     422173 =C2=B1  0% cpuidle.PO=
LL.usage
>>>>>>>>        1783 =C2=B1  0%     +88.3%       3358 =C2=B1  0% proc-vmsta=
t.nr_kernel_stack
>>>>>>>>       41801 =C2=B1  0%     +13.4%      47397 =C2=B1  2% proc-vmsta=
t.numa_foreign
>>>>>>>>       95889 =C2=B1  1%     -80.8%      18393 =C2=B1  0%
>>>>>>>> proc-vmstat.numa_hint_faults
>>>>>>>>       61294 =C2=B1  1%     -92.3%       4715 =C2=B1  1%
>>>>>>>> proc-vmstat.numa_hint_faults_local
>>>>>>>>    13629995 =C2=B1  0%     -32.3%    9230486 =C2=B1  0%
>>>>>>>> proc-vmstat.numa_huge_pte_updates
>>>>>>>>       41801 =C2=B1  0%     +13.4%      47397 =C2=B1  2% proc-vmsta=
t.numa_miss
>>>>>>>>       27943 =C2=B1  1%     -51.4%      13583 =C2=B1  0%
>>>>>>>> proc-vmstat.numa_pages_migrated
>>>>>>>>   6.983e+09 =C2=B1  0%     -32.3%  4.731e+09 =C2=B1  0%
>>>>>>>> proc-vmstat.numa_pte_updates
>>>>>>>>      274.00 =C2=B1  4%    -100.0%       0.00 =C2=B1  0% proc-vmsta=
t.pgmigrate_fail
>>>>>>>>       27943 =C2=B1  1%     -51.4%      13583 =C2=B1  0%
>>>>>>>> proc-vmstat.pgmigrate_success
>>>>>>>>       92.53 =C2=B1  0%     -43.0%      52.74 =C2=B1  0%  turbostat=
.%Busy
>>>>>>>>        2675 =C2=B1  0%     -43.0%       1525 =C2=B1  0%  turbostat=
.Avg_MHz
>>>>>>>>        3.39 =C2=B1  1%   +1107.2%      40.89 =C2=B1  0%  turbostat=
.CPU%c1
>>>>>>>>        0.01 =C2=B1  0%  +33960.0%       3.41 =C2=B1  0%  turbostat=
.CPU%c3
>>>>>>>>        4.07 =C2=B1  4%     -27.2%       2.96 =C2=B1  1%  turbostat=
.CPU%c6
>>>>>>>>       65.00 =C2=B1  2%     -12.6%      56.80 =C2=B1  0%  turbostat=
.CoreTmp
>>>>>>>>        1.72 =C2=B1  6%     -82.0%       0.31 =C2=B1  4%  turbostat=
.Pkg%pc2
>>>>>>>>       67.50 =C2=B1  3%     -12.3%      59.20 =C2=B1  0%  turbostat=
.PkgTmp
>>>>>>>>      603.44 =C2=B1  0%     -12.6%     527.24 =C2=B1  0%  turbostat=
.PkgWatt
>>>>>>>>        1029 =C2=B1  0%     -42.8%     589.21 =C2=B1  0%  turbostat=
.RAMWatt
>>>>>>>>      800.50 =C2=B1 25%    +105.0%       1641 =C2=B1 24%
>>>>>>>> slabinfo.blkdev_requests.active_objs
>>>>>>>>      800.50 =C2=B1 25%    +105.0%       1641 =C2=B1 24%
>>>>>>>> slabinfo.blkdev_requests.num_objs
>>>>>>>>       36464 =C2=B1  3%     -48.9%      18616 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-256.active_objs
>>>>>>>>      583.00 =C2=B1  3%     -39.8%     350.80 =C2=B1  1%
>>>>>>>> slabinfo.kmalloc-256.active_slabs
>>>>>>>>       37354 =C2=B1  3%     -39.8%      22483 =C2=B1  1%
>>>>>>>> slabinfo.kmalloc-256.num_objs
>>>>>>>>      583.00 =C2=B1  3%     -39.8%     350.80 =C2=B1  1%
>>>>>>>> slabinfo.kmalloc-256.num_slabs
>>>>>>>>       50562 =C2=B1  1%     +12.0%      56643 =C2=B1  1%
>>>>>>>> slabinfo.kmalloc-32.active_objs
>>>>>>>>       50573 =C2=B1  1%     +12.0%      56646 =C2=B1  1%
>>>>>>>> slabinfo.kmalloc-32.num_objs
>>>>>>>>       19624 =C2=B1  1%     +13.9%      22350 =C2=B1  5%
>>>>>>>> slabinfo.kmalloc-512.active_objs
>>>>>>>>       19793 =C2=B1  1%     +13.3%      22417 =C2=B1  5%
>>>>>>>> slabinfo.kmalloc-512.num_objs
>>>>>>>>      197.75 =C2=B1 40%    +139.4%     473.40 =C2=B1  6%
>>>>>>>> slabinfo.nfs_read_data.active_objs
>>>>>>>>      197.75 =C2=B1 40%    +139.4%     473.40 =C2=B1  6%
>>>>>>>> slabinfo.nfs_read_data.num_objs
>>>>>>>>       20308 =C2=B1  0%     +18.3%      24024 =C2=B1  1%
>>>>>>>> slabinfo.proc_inode_cache.active_objs
>>>>>>>>       20315 =C2=B1  0%     +18.3%      24024 =C2=B1  1%
>>>>>>>> slabinfo.proc_inode_cache.num_objs
>>>>>>>>        7781 =C2=B1  1%     +14.0%       8867 =C2=B1  1%
>>>>>>>> slabinfo.sighand_cache.active_objs
>>>>>>>>        7901 =C2=B1  1%     +13.5%       8965 =C2=B1  1%
>>>>>>>> slabinfo.sighand_cache.num_objs
>>>>>>>>       11430 =C2=B1  1%     +12.0%      12801 =C2=B1  0%
>>>>>>>> slabinfo.signal_cache.active_objs
>>>>>>>>       11505 =C2=B1  1%     +11.6%      12836 =C2=B1  0%
>>>>>>>> slabinfo.signal_cache.num_objs
>>>>>>>>        2735 =C2=B1  0%     +52.2%       4165 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.active_objs
>>>>>>>>      925.75 =C2=B1  0%     +51.3%       1400 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.active_slabs
>>>>>>>>        2777 =C2=B1  0%     +51.3%       4201 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.num_objs
>>>>>>>>      925.75 =C2=B1  0%     +51.3%       1400 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.num_slabs
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      21653 =C2=B1 46% latency_st=
ats.avg.cgroup_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_=
file_write.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_6=
4_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      22567 =C2=B1 45% latency_st=
ats.avg.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_=
read.entry_SYSCALL_64_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%    3852719 =C2=B1  0% latency_st=
ats.hits.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_hug=
e_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%    4545106 =C2=B1  0% latency_st=
ats.hits.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handl=
e_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%   16172385 =C2=B1  0% latency_st=
ats.hits.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_=
mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>     1321590 =C2=B1  3%     -70.2%     394183 =C2=B1  1% latency_st=
ats.hits.pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_=
fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%     662623 =C2=B1 69% latency_st=
ats.max.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_huge=
_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       21951 =C2=B1 75%    -100.0%       0.00 =C2=B1 -1% latency_st=
ats.max.call_rwsem_down_read_failed.page_lock_anon_vma_read.rmap_walk_anon.=
rmap_walk.try_to_unmap.migrate_pages.migrate_misplaced_page.handle_pte_faul=
t.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        6386 =C2=B1110%     -98.1%     120.20 =C2=B1 97% latency_st=
ats.max.call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_p=
goff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      21653 =C2=B1 46% latency_st=
ats.max.cgroup_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_=
file_write.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_6=
4_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%     662781 =C2=B1 69% latency_st=
ats.max.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle=
_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       7092 =C2=B1 30% latency_st=
ats.max.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_m=
m_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      22567 =C2=B1 45% latency_st=
ats.max.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_=
read.entry_SYSCALL_64_fastpath
>>>>>>>>       27271 =C2=B1 37%    -100.0%       0.00 =C2=B1 -1% latency_st=
ats.max.wait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle=
_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  1.912e+10 =C2=B1  0% latency_st=
ats.sum.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_huge=
_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       97956 =C2=B1 89%    -100.0%       0.00 =C2=B1 -1% latency_st=
ats.sum.call_rwsem_down_read_failed.page_lock_anon_vma_read.rmap_walk_anon.=
rmap_walk.try_to_unmap.migrate_pages.migrate_misplaced_page.handle_pte_faul=
t.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       25625 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1% latency_st=
ats.sum.call_rwsem_down_read_failed.rmap_walk_anon.rmap_walk.remove_migrati=
on_ptes.migrate_pages.migrate_misplaced_page.handle_pte_fault.handle_mm_fau=
lt.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       23289 =C2=B1132%     -97.2%     648.80 =C2=B1 48% latency_st=
ats.sum.call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_p=
goff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      21653 =C2=B1 46% latency_st=
ats.sum.cgroup_kn_lock_live.__cgroup_procs_write.cgroup_procs_write.cgroup_=
file_write.kernfs_fop_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_6=
4_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  2.558e+10 =C2=B1  0% latency_st=
ats.sum.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle=
_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  4.672e+09 =C2=B1  0% latency_st=
ats.sum.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_m=
m_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      22567 =C2=B1 45% latency_st=
ats.sum.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_=
read.entry_SYSCALL_64_fastpath
>>>>>>>>     2506022 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1% latency_st=
ats.sum.wait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle=
_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>   1.143e+12 =C2=B1  0%     +10.4%  1.262e+12 =C2=B1  0%
>>>>>>>> perf-stat.L1-dcache-load-misses
>>>>>>>>   1.354e+13 =C2=B1  0%    +101.2%  2.726e+13 =C2=B1  0% perf-stat.=
L1-dcache-loads
>>>>>>>>   5.788e+12 =C2=B1  0%     +13.9%   6.59e+12 =C2=B1  1% perf-stat.=
L1-dcache-stores
>>>>>>>>   1.518e+10 =C2=B1  2%    +398.1%  7.562e+10 =C2=B1  1%
>>>>>>>> perf-stat.L1-icache-load-misses
>>>>>>>>   8.415e+09 =C2=B1  0%    +192.9%  2.465e+10 =C2=B1  0% perf-stat.=
LLC-load-misses
>>>>>>>>   2.557e+10 =C2=B1  0%    +473.4%  1.466e+11 =C2=B1  0% perf-stat.=
LLC-loads
>>>>>>>>    1.02e+11 =C2=B1  0%     -40.0%  6.116e+10 =C2=B1  0% perf-stat.=
LLC-store-misses
>>>>>>>>   3.893e+11 =C2=B1  0%     -59.1%  1.592e+11 =C2=B1  0% perf-stat.=
LLC-stores
>>>>>>>>   2.226e+13 =C2=B1  0%     +57.8%  3.512e+13 =C2=B1  0%
>>>>>>>> perf-stat.branch-instructions
>>>>>>>>   1.417e+09 =C2=B1  6%   +1809.7%  2.706e+10 =C2=B1  0%
>>>>>>>> perf-stat.branch-load-misses
>>>>>>>>   2.225e+13 =C2=B1  0%     +57.2%  3.497e+13 =C2=B1  0% perf-stat.=
branch-loads
>>>>>>>>   1.458e+09 =C2=B1  3%   +1750.7%  2.699e+10 =C2=B1  0% perf-stat.=
branch-misses
>>>>>>>>    6.66e+12 =C2=B1  0%      -4.2%  6.377e+12 =C2=B1  1% perf-stat.=
bus-cycles
>>>>>>>>   1.111e+11 =C2=B1  0%     -21.4%  8.725e+10 =C2=B1  0% perf-stat.=
cache-misses
>>>>>>>>   4.293e+11 =C2=B1  0%     -14.2%  3.681e+11 =C2=B1  0% perf-stat.=
cache-references
>>>>>>>>     3682641 =C2=B1  3%   +9370.7%  3.488e+08 =C2=B1  0% perf-stat.=
context-switches
>>>>>>>>   1.923e+14 =C2=B1  0%      -4.7%  1.833e+14 =C2=B1  1% perf-stat.=
cpu-cycles
>>>>>>>>      124403 =C2=B1  0%  +22298.6%   27864645 =C2=B1  0% perf-stat.=
cpu-migrations
>>>>>>>>   2.248e+09 =C2=B1 25%    +320.7%  9.457e+09 =C2=B1 14% perf-stat.=
dTLB-load-misses
>>>>>>>>   1.352e+13 =C2=B1  0%    +102.1%  2.732e+13 =C2=B1  0% perf-stat.=
dTLB-loads
>>>>>>>>   3.587e+08 =C2=B1 10%    +169.6%   9.67e+08 =C2=B1 12% perf-stat.=
dTLB-store-misses
>>>>>>>>   5.785e+12 =C2=B1  0%     +14.1%    6.6e+12 =C2=B1  0% perf-stat.=
dTLB-stores
>>>>>>>>   2.533e+08 =C2=B1  1%     +70.1%  4.309e+08 =C2=B1  1% perf-stat.=
iTLB-load-misses
>>>>>>>>    75350482 =C2=B1  1%   +3093.7%  2.406e+09 =C2=B1  1% perf-stat.=
iTLB-loads
>>>>>>>>   7.124e+13 =C2=B1  0%     +63.3%  1.164e+14 =C2=B1  0% perf-stat.=
instructions
>>>>>>>>   1.691e+09 =C2=B1  0%    +919.2%  1.723e+10 =C2=B1  0% perf-stat.=
node-load-misses
>>>>>>>>   6.683e+09 =C2=B1  0%      +9.4%  7.308e+09 =C2=B1  1% perf-stat.=
node-loads
>>>>>>>>   2.729e+08 =C2=B1  0%   +9304.2%  2.566e+10 =C2=B1  0% perf-stat.=
node-store-misses
>>>>>>>>   1.017e+11 =C2=B1  0%     -64.6%  3.603e+10 =C2=B1  1% perf-stat.=
node-stores
>>>>>>>>    1.66e+14 =C2=B1  0%      -4.7%  1.582e+14 =C2=B1  1% perf-stat.=
ref-cycles
>>>>>>>>        1.20 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.__alloc_pages_nodemask.alloc_pages_vma.do_huge_pmd_anonymous_p=
age.handle_mm_fault.__do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      22.47 =C2=B1  5% perf-profi=
le.cycles-pp.__alloc_workqueue_key.clear_huge_page.do_huge_pmd_anonymous_pa=
ge.handle_mm_fault.__do_page_fault
>>>>>>>>       41.58 =C2=B1  6%     -36.6%      26.36 =C2=B1 25%
>>>>>>>> perf-profile.cycles-pp.__do_page_fault.do_page_fault.page_fault.do=
_unit
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      10.67 =C2=B1  5% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.__alloc_workqueue_key.clear_h=
uge_page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      10.73 =C2=B1  4% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.apply_workqueue_attrs.__alloc=
_workqueue_key.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       6.35 =C2=B1  4% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.destroy_workqueue.clear_huge_=
page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      16.46 =C2=B1  3% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.pwq_unbound_release_workfn.pr=
ocess_one_work.worker_thread
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       1.04 =C2=B1  1% perf-profi=
le.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
>>>>>>>>        1.21 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.alloc_pages_vma.do_huge_pmd_anonymous_page.handle_mm_fault.__d=
o_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      11.72 =C2=B1  4% perf-profi=
le.cycles-pp.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do=
_huge_pmd_anonymous_page.handle_mm_fault
>>>>>>>>        0.87 =C2=B1 63%   +2639.6%      23.77 =C2=B1  2%
>>>>>>>> perf-profile.cycles-pp.call_cpuidle.cpu_startup_entry.start_second=
ary
>>>>>>>>        2.04 =C2=B1 15%   +1432.8%      31.31 =C2=B1  4% perf-profi=
le.cycles-pp.clear_huge_page.do_huge_pmd_anonymous_page.handle_mm_fault.__d=
o_page_fault.do_page_fault
>>>>>>>>       50.52 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.clear_page_c_e.do_huge_pmd_anonymous_page.handle_mm_fault.__do=
_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      12.73 =C2=B1  2% perf-profi=
le.cycles-pp.clear_page_c_e.process_one_work.worker_thread.kthread.ret_from=
_fork
>>>>>>>>        0.87 =C2=B1 63%   +2706.2%      24.48 =C2=B1  2%
>>>>>>>> perf-profile.cycles-pp.cpu_startup_entry.start_secondary
>>>>>>>>        0.87 =C2=B1 63%   +2638.9%      23.76 =C2=B1  2% perf-profi=
le.cycles-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
>>>>>>>>        0.85 =C2=B1 63%   +2675.2%      23.52 =C2=B1  2% perf-profi=
le.cycles-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_ent=
ry.start_secondary
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       7.40 =C2=B1  4% perf-profi=
le.cycles-pp.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.h=
andle_mm_fault.__do_page_fault
>>>>>>>>       55.34 =C2=B1  4%     -43.0%      31.56 =C2=B1  4% perf-profi=
le.cycles-pp.do_huge_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_=
page_fault.page_fault
>>>>>>>>       41.59 =C2=B1  6%     -36.6%      26.36 =C2=B1 25%
>>>>>>>> perf-profile.cycles-pp.do_page_fault.page_fault.do_unit
>>>>>>>>       83.81 =C2=B1  6%     -55.9%      36.92 =C2=B1 25%
>>>>>>>> perf-profile.cycles-pp.do_unit
>>>>>>>>        1.18 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma.=
do_huge_pmd_anonymous_page.handle_mm_fault
>>>>>>>>       41.45 =C2=B1  6%     -36.5%      26.33 =C2=B1 25% perf-profi=
le.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.do_un=
it
>>>>>>>>        0.83 =C2=B1 63%   +2693.5%      23.33 =C2=B1  2% perf-profi=
le.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_=
startup_entry
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      32.67 =C2=B1  3%
>>>>>>>> perf-profile.cycles-pp.kthread.ret_from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      10.68 =C2=B1  5% perf-profi=
le.cycles-pp.mutex_lock.__alloc_workqueue_key.clear_huge_page.do_huge_pmd_a=
nonymous_page.handle_mm_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      10.73 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_lock.apply_workqueue_attrs.__alloc_workqueue_key.clear_h=
uge_page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       6.35 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_lock.destroy_workqueue.clear_huge_page.do_huge_pmd_anony=
mous_page.handle_mm_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      16.49 =C2=B1  3% perf-profi=
le.cycles-pp.mutex_lock.pwq_unbound_release_workfn.process_one_work.worker_=
thread.kthread
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      10.64 =C2=B1  5% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.__alloc=
_workqueue_key.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      10.70 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.apply_w=
orkqueue_attrs.__alloc_workqueue_key
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       6.31 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.destroy=
_workqueue.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      16.42 =C2=B1  3% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pwq_unb=
ound_release_workfn.process_one_work
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      10.36 =C2=B1  5% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.__alloc_workqueue_key
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      10.27 =C2=B1  4% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.apply_workqueue_attrs
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       6.02 =C2=B1  5% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.destroy_workqueue
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      16.08 =C2=B1  3% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.pwq_unbound_release_workfn
>>>>>>>>       41.59 =C2=B1  6%     -36.6%      26.36 =C2=B1 25%
>>>>>>>> perf-profile.cycles-pp.page_fault.do_unit
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      31.28 =C2=B1  3%
>>>>>>>> perf-profile.cycles-pp.process_one_work.worker_thread.kthread.ret_=
from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      16.71 =C2=B1  3% perf-profi=
le.cycles-pp.pwq_unbound_release_workfn.process_one_work.worker_thread.kthr=
ead.ret_from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      32.67 =C2=B1  3%
>>>>>>>> perf-profile.cycles-pp.ret_from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       1.07 =C2=B1  2%
>>>>>>>> perf-profile.cycles-pp.schedule.worker_thread.kthread.ret_from_fork
>>>>>>>>        0.88 =C2=B1 63%   +2699.8%      24.50 =C2=B1  2%
>>>>>>>> perf-profile.cycles-pp.start_secondary
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      32.50 =C2=B1  3%
>>>>>>>> perf-profile.cycles-pp.worker_thread.kthread.ret_from_fork
>>>>>>>>       51865 =C2=B1 31%   +1461.5%     809868 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.avg
>>>>>>>>      620221 =C2=B1 31%    +279.3%    2352308 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.stddev
>>>>>>>>      217836 =C2=B1  0%     -15.8%     183318 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.min
>>>>>>>>        1428 =C2=B1 15%   +1692.5%      25603 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.stddev
>>>>>>>>        8371 =C2=B1  6%   +2802.6%     242990 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.load.avg
>>>>>>>>      255027 =C2=B1 31%    +530.6%    1608188 =C2=B1 17%
>>>>>>>> sched_debug.cfs_rq:/.load.max
>>>>>>>>        2774 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.load.min
>>>>>>>>       22973 =C2=B1 28%   +1784.8%     433000 =C2=B1  3%
>>>>>>>> sched_debug.cfs_rq:/.load.stddev
>>>>>>>>       15.98 =C2=B1  7%   +1458.1%     249.03 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.avg
>>>>>>>>      231.17 =C2=B1  4%    +254.2%     818.76 =C2=B1  9%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.max
>>>>>>>>        2.64 =C2=B1 14%   +1206.1%      34.47 =C2=B1  7%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.min
>>>>>>>>       34.87 =C2=B1  5%    +320.6%     146.67 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.stddev
>>>>>>>>       51865 =C2=B1 31%   +1461.5%     809868 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.avg
>>>>>>>>      620221 =C2=B1 31%    +279.3%    2352308 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.stddev
>>>>>>>>    31688756 =C2=B1  0%     -75.3%    7837478 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.avg
>>>>>>>>    32039857 =C2=B1  0%     -73.4%    8530591 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.max
>>>>>>>>    31236174 =C2=B1  0%     -77.1%    7142398 =C2=B1  1%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.min
>>>>>>>>      172847 =C2=B1 16%    +193.9%     508060 =C2=B1  1%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.stddev
>>>>>>>>        0.76 =C2=B1  9%     -21.0%       0.60 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.avg
>>>>>>>>        1.19 =C2=B1  4%     +79.7%       2.15 =C2=B1  8%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.max
>>>>>>>>        0.39 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.min
>>>>>>>>        0.18 =C2=B1 18%    +239.8%       0.63 =C2=B1  1%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.stddev
>>>>>>>>        2.27 =C2=B1 23%    +247.9%       7.90 =C2=B1  3%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.avg
>>>>>>>>        5.72 =C2=B1  5%    +600.3%      40.07 =C2=B1  5%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.avg
>>>>>>>>       82.11 =C2=B1 49%    +306.4%     333.69 =C2=B1  8%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.max
>>>>>>>>        2.22 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.min
>>>>>>>>        7.90 =C2=B1 39%    +797.4%      70.91 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.stddev
>>>>>>>>      -94182 =C2=B1-133%    +218.5%    -299955 =C2=B1 -3%
>>>>>>>> sched_debug.cfs_rq:/.spread0.avg
>>>>>>>>     -545371 =C2=B1-32%     +82.6%    -995615 =C2=B1 -8%
>>>>>>>> sched_debug.cfs_rq:/.spread0.min
>>>>>>>>      173893 =C2=B1 16%    +192.5%     508704 =C2=B1  1%
>>>>>>>> sched_debug.cfs_rq:/.spread0.stddev
>>>>>>>>      795.73 =C2=B1  6%     -35.3%     514.90 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.avg
>>>>>>>>      443.89 =C2=B1 20%     -63.2%     163.16 =C2=B1 11%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.min
>>>>>>>>      986272 =C2=B1  0%     -49.0%     502866 =C2=B1  1%
>>>>>>>> sched_debug.cpu.avg_idle.avg
>>>>>>>>     1024476 =C2=B1  1%     +12.4%    1151269 =C2=B1  1%
>>>>>>>> sched_debug.cpu.avg_idle.max
>>>>>>>>      760003 =C2=B1  4%     -95.7%      32915 =C2=B1 12%
>>>>>>>> sched_debug.cpu.avg_idle.min
>>>>>>>>       37266 =C2=B1 11%    +642.8%     276814 =C2=B1  0%
>>>>>>>> sched_debug.cpu.avg_idle.stddev
>>>>>>>>      290694 =C2=B1  0%     +62.4%     471958 =C2=B1  0% sched_debu=
g.cpu.clock.avg
>>>>>>>>      290826 =C2=B1  0%     +62.3%     472019 =C2=B1  0% sched_debu=
g.cpu.clock.max
>>>>>>>>      290537 =C2=B1  0%     +62.4%     471895 =C2=B1  0% sched_debu=
g.cpu.clock.min
>>>>>>>>       81.82 =C2=B1 24%     -56.4%      35.69 =C2=B1  2%
>>>>>>>> sched_debug.cpu.clock.stddev
>>>>>>>>      290694 =C2=B1  0%     +62.4%     471958 =C2=B1  0%
>>>>>>>> sched_debug.cpu.clock_task.avg
>>>>>>>>      290826 =C2=B1  0%     +62.3%     472019 =C2=B1  0%
>>>>>>>> sched_debug.cpu.clock_task.max
>>>>>>>>      290537 =C2=B1  0%     +62.4%     471895 =C2=B1  0%
>>>>>>>> sched_debug.cpu.clock_task.min
>>>>>>>>       81.82 =C2=B1 24%     -56.4%      35.69 =C2=B1  2%
>>>>>>>> sched_debug.cpu.clock_task.stddev
>>>>>>>>        5.79 =C2=B1  5%    +433.8%      30.90 =C2=B1  8%
>>>>>>>> sched_debug.cpu.cpu_load[0].avg
>>>>>>>>       81.75 =C2=B1 48%    +278.6%     309.48 =C2=B1  9%
>>>>>>>> sched_debug.cpu.cpu_load[0].max
>>>>>>>>        2.22 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cpu.cpu_load[0].min
>>>>>>>>        7.94 =C2=B1 38%    +668.4%      61.02 =C2=B1  6%
>>>>>>>> sched_debug.cpu.cpu_load[0].stddev
>>>>>>>>        9.53 =C2=B1  9%    +741.3%      80.20 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[1].avg
>>>>>>>>      139.67 =C2=B1 15%    +140.0%     335.23 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[1].max
>>>>>>>>        2.42 =C2=B1 22%     -92.8%       0.17 =C2=B1 79%
>>>>>>>> sched_debug.cpu.cpu_load[1].min
>>>>>>>>       20.64 =C2=B1 15%    +263.0%      74.94 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[1].stddev
>>>>>>>>        7.96 =C2=B1  6%    +839.6%      74.83 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[2].avg
>>>>>>>>      104.56 =C2=B1 14%    +178.3%     290.95 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[2].max
>>>>>>>>        2.42 =C2=B1 22%     -70.2%       0.72 =C2=B1 26%
>>>>>>>> sched_debug.cpu.cpu_load[2].min
>>>>>>>>       14.10 =C2=B1 14%    +324.1%      59.81 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[2].stddev
>>>>>>>>        7.05 =C2=B1  4%    +909.5%      71.13 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[3].avg
>>>>>>>>       85.06 =C2=B1 11%    +197.0%     252.63 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[3].max
>>>>>>>>       10.21 =C2=B1 14%    +378.8%      48.89 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[3].stddev
>>>>>>>>        6.47 =C2=B1  4%    +954.6%      68.18 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[4].avg
>>>>>>>>       67.14 =C2=B1 18%    +217.5%     213.15 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[4].max
>>>>>>>>        2.42 =C2=B1 22%     +99.2%       4.81 =C2=B1 18%
>>>>>>>> sched_debug.cpu.cpu_load[4].min
>>>>>>>>        7.64 =C2=B1 18%    +421.8%      39.87 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[4].stddev
>>>>>>>>       16273 =C2=B1  8%     -44.7%       9000 =C2=B1  5%
>>>>>>>> sched_debug.cpu.curr->pid.avg
>>>>>>>>       19035 =C2=B1  0%     +39.9%      26637 =C2=B1  0%
>>>>>>>> sched_debug.cpu.curr->pid.max
>>>>>>>>        6025 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cpu.curr->pid.min
>>>>>>>>        3061 =C2=B1 31%    +283.2%      11731 =C2=B1  1%
>>>>>>>> sched_debug.cpu.curr->pid.stddev
>>>>>>>>        7770 =C2=B1  9%   +2964.7%     238130 =C2=B1  4% sched_debu=
g.cpu.load.avg
>>>>>>>>      171305 =C2=B1 59%    +749.2%    1454745 =C2=B1  9% sched_debu=
g.cpu.load.max
>>>>>>>>        2774 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1% sched_debu=
g.cpu.load.min
>>>>>>>>       16452 =C2=B1 50%   +2477.0%     423970 =C2=B1  1% sched_debu=
g.cpu.load.stddev
>>>>>>>>      512284 =C2=B1  1%     +42.2%     728214 =C2=B1  5%
>>>>>>>> sched_debug.cpu.max_idle_balance_cost.max
>>>>>>>>        1026 =C2=B1 62%   +3364.7%      35570 =C2=B1  5%
>>>>>>>> sched_debug.cpu.max_idle_balance_cost.stddev
>>>>>>>>        0.00 =C2=B1 19%     -34.1%       0.00 =C2=B1  2%
>>>>>>>> sched_debug.cpu.next_balance.stddev
>>>>>>>>      235853 =C2=B1  0%     +40.8%     332030 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.avg
>>>>>>>>      242944 =C2=B1  0%     +55.1%     376822 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.max
>>>>>>>>      230088 =C2=B1  0%     +25.5%     288846 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.min
>>>>>>>>        3297 =C2=B1  1%   +1118.8%      40194 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.stddev
>>>>>>>>        0.79 =C2=B1 12%     -23.6%       0.60 =C2=B1  3%
>>>>>>>> sched_debug.cpu.nr_running.avg
>>>>>>>>        0.39 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cpu.nr_running.min
>>>>>>>>        0.29 =C2=B1 28%    +119.2%       0.64 =C2=B1  3%
>>>>>>>> sched_debug.cpu.nr_running.stddev
>>>>>>>>       12486 =C2=B1  2%   +9429.1%    1189888 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.avg
>>>>>>>>      139358 =C2=B1 11%   +1029.4%    1573851 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.max
>>>>>>>>        1652 =C2=B1  7%  +49792.2%     824412 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.min
>>>>>>>>       22570 =C2=B1  6%   +1314.2%     319200 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.stddev
>>>>>>>>        0.00 =C2=B1 42%  +47866.1%       1.57 =C2=B1  4%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.avg
>>>>>>>>       12.42 =C2=B1 22%  +68644.7%       8535 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.max
>>>>>>>>      -15.08 =C2=B1-27%  +59252.4%      -8952 =C2=B1 -2%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.min
>>>>>>>>        4.38 =C2=B1 11%  +1.8e+05%       7864 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.stddev
>>>>>>>>       12908 =C2=B1  2%   +9123.8%    1190660 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.avg
>>>>>>>>      155343 =C2=B1 11%    +930.8%    1601227 =C2=B1  1%
>>>>>>>> sched_debug.cpu.sched_count.max
>>>>>>>>        1482 =C2=B1  7%  +55508.2%     824530 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.min
>>>>>>>>       24403 =C2=B1  5%   +1211.1%     319962 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.stddev
>>>>>>>>      732.59 =C2=B1  2%  +70220.5%     515160 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.avg
>>>>>>>>        9711 =C2=B1 21%   +7111.8%     700365 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.max
>>>>>>>>      141.94 =C2=B1  9%  +2.4e+05%     338951 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.min
>>>>>>>>        1043 =C2=B1 13%  +14535.0%     152743 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.stddev
>>>>>>>>        5761 =C2=B1  2%  +10460.0%     608462 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.avg
>>>>>>>>       67879 =C2=B1  9%    +957.4%     717750 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.max
>>>>>>>>      681.25 =C2=B1  3%  +74539.0%     508478 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.min
>>>>>>>>       10967 =C2=B1  6%    +674.4%      84933 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.stddev
>>>>>>>>        4609 =C2=B1  4%   +1430.2%      70534 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.avg
>>>>>>>>       64856 =C2=B1 10%     +30.3%      84501 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.max
>>>>>>>>      377.81 =C2=B1  3%  +15018.1%      57117 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.min
>>>>>>>>      290531 =C2=B1  0%     +62.4%     471892 =C2=B1  0% sched_debu=
g.cpu_clk
>>>>>>>>      287233 =C2=B1  1%     +63.5%     469728 =C2=B1  0%  sched_deb=
ug.ktime
>>>>>>>>        0.11 =C2=B1  0%     -40.0%       0.07 =C2=B1  0%
>>>>>>>> sched_debug.rt_rq:/.rt_nr_running.max
>>>>>>>>        0.01 =C2=B1  0%     -35.1%       0.01 =C2=B1 15%
>>>>>>>> sched_debug.rt_rq:/.rt_nr_running.stddev
>>>>>>>>        0.03 =C2=B1 25%     -62.4%       0.01 =C2=B1 22%
>>>>>>>> sched_debug.rt_rq:/.rt_time.avg
>>>>>>>>        2.82 =C2=B1  8%     -61.3%       1.09 =C2=B1 30%
>>>>>>>> sched_debug.rt_rq:/.rt_time.max
>>>>>>>>        0.25 =C2=B1 14%     -61.2%       0.10 =C2=B1 26%
>>>>>>>> sched_debug.rt_rq:/.rt_time.stddev
>>>>>>>>      290531 =C2=B1  0%     +62.4%     471892 =C2=B1  0% sched_debu=
g.sched_clk
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>                                vm-scalability.throughput
>>>>>>>>
>>>>>>>>    8e+07
>>>>>>>> *+--------------------------------*----------------*--------------=
--*
>>>>>>>>          | .. .                                  |
>>>>>>>>    7e+07 ++  . ..                                   |
>>>>>>>>    6e+07 ++   . .                                     |
>>>>>>>>          |     . .                                      |
>>>>>>>>    5e+07 ++     . .                                       |
>>>>>>>>          O       ..       O         .      O O                O
>>>>>>>>    4e+07 ++        . ..                                         |
>>>>>>>>          |          . .                                           |
>>>>>>>>    3e+07 ++          . .                                          =
  |
>>>>>>>>    2e+07 ++           . .                                         =
    |
>>>>>>>>          |             .. .
>>>>>>>> |
>>>>>>>>    1e+07 ++              . ..
>>>>>>>> |
>>>>>>>>          | .                                                 |
>>>>>>>>        0
>>>>>>>> ++---------------*------------------------------------------------=
--+
>>>>>>>>
>>>>>>>>
>>>>>>>>     [*] bisect-good sample
>>>>>>>>     [O] bisect-bad  sample
>>>>>>>>
>>>>>>>> ******************************************************************=
*********************************
>>>>>>>>
>>>>>>>> lkp-hsw-ep2: 72 threads Brickland Haswell-EP with 128G memory
>>>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>>>
>>>>>>>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/size/tbox=
_group/test/testcase:
>>>>>>>>
>>>>>>>> gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/300=
s/8T/lkp-hsw-ep2/anon-w-seq/vm-scalability
>>>>>>>>
>>>>>>>> commit:
>>>>>>>>    v4.7-rc7
>>>>>>>>    8296d37010 ("Speeds up clearing huge pages using work queue")
>>>>>>>>
>>>>>>>>          v4.7-rc7 8296d3701014cd804bf981b5e2
>>>>>>>> ---------------- --------------------------
>>>>>>>>         fail:runs  %reproduction    fail:runs
>>>>>>>>             |             |             |
>>>>>>>>           %stddev     %change         %stddev
>>>>>>>>               \          |                \
>>>>>>>>     2541668 =C2=B1  0%     +27.7%    3245849 =C2=B1  0% vm-scalabi=
lity.throughput
>>>>>>>>        1505 =C2=B1  8%  +81222.9%    1224180 =C2=B1  0%
>>>>>>>> vm-scalability.time.involuntary_context_switches
>>>>>>>>     7675912 =C2=B1  4%     -74.1%    1988431 =C2=B1  0%
>>>>>>>> vm-scalability.time.minor_page_faults
>>>>>>>>       99.00 =C2=B1  0%     -28.3%      71.00 =C2=B1 -1%
>>>>>>>> vm-scalability.time.percent_of_cpu_this_job_got
>>>>>>>>      415.33 =C2=B1  0%     -93.1%      28.47 =C2=B1 -3%
>>>>>>>> vm-scalability.time.system_time
>>>>>>>>      466.24 =C2=B1  0%     +27.9%     596.13 =C2=B1  0%
>>>>>>>> vm-scalability.time.user_time
>>>>>>>>      909.67 =C2=B1  2%  +1.3e+05%    1223534 =C2=B1  0%
>>>>>>>> vm-scalability.time.voluntary_context_switches
>>>>>>>>       18262 =C2=B1 10%     -19.1%      14781 =C2=B1  0%
>>>>>>>> interrupts.CAL:Function_call_interrupts
>>>>>>>>      162441 =C2=B1  5%      -9.7%     146748 =C2=B1  0% meminfo.Di=
rectMap4k
>>>>>>>>        1145 =C2=B1  4%   +2149.1%      25760 =C2=B1  0%  vmstat.sy=
stem.cs
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%    1222419 =C2=B1  0% latency_st=
ats.hits.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_=
mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  2.383e+08 =C2=B1  0% latency_st=
ats.sum.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_m=
m_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       94072 =C2=B1 19%    +499.5%     563946 =C2=B1  0%  softirqs.=
RCU
>>>>>>>>       54289 =C2=B1  2%   +1131.0%     668289 =C2=B1  0%  softirqs.=
SCHED
>>>>>>>>      742038 =C2=B1  0%     +38.0%    1024212 =C2=B1  0%  softirqs.=
TIMER
>>>>>>>>     4039131 =C2=B1  6%     -99.6%      14187 =C2=B1  0%
>>>>>>>> numa-numastat.node0.numa_foreign
>>>>>>>>     2527978 =C2=B1  4%     -71.2%     726885 =C2=B1  0%
>>>>>>>> numa-numastat.node0.numa_miss
>>>>>>>>     1788832 =C2=B1  0%     +26.3%    2260104 =C2=B1  0%
>>>>>>>> numa-numastat.node1.local_node
>>>>>>>>     2529795 =C2=B1  4%     -71.8%     713317 =C2=B1  0%
>>>>>>>> numa-numastat.node1.numa_foreign
>>>>>>>>     1788832 =C2=B1  0%     +26.3%    2260105 =C2=B1  0%
>>>>>>>> numa-numastat.node1.numa_hit
>>>>>>>>     4040948 =C2=B1  6%    -100.0%     619.00 =C2=B1  0%
>>>>>>>> numa-numastat.node1.numa_miss
>>>>>>>>     1552444 =C2=B1 21%    +156.3%    3978652 =C2=B1  0% cpuidle.C1=
-HSW.time
>>>>>>>>      185441 =C2=B1  6%    +202.9%     561626 =C2=B1  0% cpuidle.C1=
-HSW.usage
>>>>>>>>     4576536 =C2=B1 11%   +4216.5%  1.975e+08 =C2=B1  0% cpuidle.C1=
E-HSW.time
>>>>>>>>       24584 =C2=B1 16%   +6947.3%    1732523 =C2=B1  0% cpuidle.C1=
E-HSW.usage
>>>>>>>>    19455172 =C2=B1  5%  +15021.2%  2.942e+09 =C2=B1  0% cpuidle.C3=
-HSW.time
>>>>>>>>       63967 =C2=B1  3%  +11258.7%    7265839 =C2=B1  0% cpuidle.C3=
-HSW.usage
>>>>>>>>   1.596e+08 =C2=B1 19%     -27.9%  1.152e+08 =C2=B1  0%  cpuidle.P=
OLL.time
>>>>>>>>        4311 =C2=B1  7%    +396.5%      21409 =C2=B1  0% cpuidle.PO=
LL.usage
>>>>>>>>      953.33 =C2=B1  5%     +70.8%       1628 =C2=B1  0%
>>>>>>>> slabinfo.blkdev_requests.active_objs
>>>>>>>>      953.33 =C2=B1  5%     +70.8%       1628 =C2=B1  0%
>>>>>>>> slabinfo.blkdev_requests.num_objs
>>>>>>>>       19293 =C2=B1  2%     +17.0%      22580 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-256.active_objs
>>>>>>>>       20002 =C2=B1  2%     +19.7%      23941 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-256.num_objs
>>>>>>>>       15084 =C2=B1  7%     +12.5%      16972 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-512.active_objs
>>>>>>>>       15222 =C2=B1  7%     +11.8%      17014 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-512.num_objs
>>>>>>>>        1385 =C2=B1  4%     +30.3%       1805 =C2=B1  0%
>>>>>>>> slabinfo.mnt_cache.active_objs
>>>>>>>>        1385 =C2=B1  4%     +30.3%       1805 =C2=B1  0% slabinfo.m=
nt_cache.num_objs
>>>>>>>>        5.28 =C2=B1  1%      +7.2%       5.66 =C2=B1-17%  turbostat=
.%Busy
>>>>>>>>      125.33 =C2=B1  1%      +9.3%     137.00 =C2=B1  0%  turbostat=
.Avg_MHz
>>>>>>>>       24.31 =C2=B1  0%     +27.4%      30.97 =C2=B1 -3%  turbostat=
.CPU%c1
>>>>>>>>        0.02 =C2=B1  0%  +19350.0%       3.89 =C2=B1-25%  turbostat=
.CPU%c3
>>>>>>>>       70.38 =C2=B1  0%     -15.5%      59.48 =C2=B1 -1%  turbostat=
.CPU%c6
>>>>>>>>       31.62 =C2=B1  1%     -31.5%      21.67 =C2=B1 -4%  turbostat=
.Pkg%pc2
>>>>>>>>       96.45 =C2=B1  0%      +6.4%     102.66 =C2=B1  0%  turbostat=
.PkgWatt
>>>>>>>>       35.36 =C2=B1  1%      +9.2%      38.61 =C2=B1 -2%  turbostat=
.RAMWatt
>>>>>>>>     6639740 =C2=B1  6%     -90.2%     647733 =C2=B1  0% proc-vmsta=
t.numa_foreign
>>>>>>>>     3542448 =C2=B1  0%     +15.2%    4082184 =C2=B1  0% proc-vmsta=
t.numa_hit
>>>>>>>>      919505 =C2=B1  0%     -20.6%     730368 =C2=B1  0%
>>>>>>>> proc-vmstat.numa_huge_pte_updates
>>>>>>>>     3542447 =C2=B1  0%     +15.2%    4082183 =C2=B1  0% proc-vmsta=
t.numa_local
>>>>>>>>     6639740 =C2=B1  6%     -90.2%     647733 =C2=B1  0% proc-vmsta=
t.numa_miss
>>>>>>>>    4.73e+08 =C2=B1  0%     -20.9%   3.74e+08 =C2=B1  0%
>>>>>>>> proc-vmstat.numa_pte_updates
>>>>>>>>     5894825 =C2=B1  3%     -18.7%    4793507 =C2=B1  0% proc-vmsta=
t.pgalloc_dma32
>>>>>>>>   4.914e+08 =C2=B1  0%     +27.1%  6.247e+08 =C2=B1  0% proc-vmsta=
t.pgalloc_normal
>>>>>>>>     9454924 =C2=B1  4%     -60.4%    3746598 =C2=B1  0% proc-vmsta=
t.pgfault
>>>>>>>>   4.808e+08 =C2=B1  0%     +27.5%   6.13e+08 =C2=B1  0% proc-vmsta=
t.pgfree
>>>>>>>>      921343 =C2=B1  0%     +29.2%    1190559 =C2=B1  0%
>>>>>>>> proc-vmstat.thp_deferred_split_page
>>>>>>>>      953086 =C2=B1  0%     +28.3%    1222419 =C2=B1  0% proc-vmsta=
t.thp_fault_alloc
>>>>>>>>       12910 =C2=B1  6%     -90.5%       1232 =C2=B1  0%
>>>>>>>> proc-vmstat.thp_fault_fallback
>>>>>>>>    15951920 =C2=B1  3%     -33.0%   10681427 =C2=B1  0% numa-memin=
fo.node0.Active
>>>>>>>>    15937037 =C2=B1  3%     -33.1%   10666883 =C2=B1  0%
>>>>>>>> numa-meminfo.node0.Active(anon)
>>>>>>>>    15854293 =C2=B1  3%     -33.0%   10628859 =C2=B1  0%
>>>>>>>> numa-meminfo.node0.AnonHugePages
>>>>>>>>    15914382 =C2=B1  3%     -33.1%   10644541 =C2=B1  0%
>>>>>>>> numa-meminfo.node0.AnonPages
>>>>>>>>       10390 =C2=B1 25%     -35.9%       6658 =C2=B1  0% numa-memin=
fo.node0.Mapped
>>>>>>>>    49241735 =C2=B1  1%     +10.8%   54576665 =C2=B1  0% numa-memin=
fo.node0.MemFree
>>>>>>>>    16644983 =C2=B1  3%     -32.1%   11310054 =C2=B1  0% numa-memin=
fo.node0.MemUsed
>>>>>>>>       32726 =C2=B1  3%     -30.0%      22908 =C2=B1  0%
>>>>>>>> numa-meminfo.node0.PageTables
>>>>>>>>       57921 =C2=B1  7%     +15.2%      66713 =C2=B1  0%
>>>>>>>> numa-meminfo.node0.SUnreclaim
>>>>>>>>    17135973 =C2=B1  2%     +29.0%   22108234 =C2=B1  0% numa-memin=
fo.node1.Active
>>>>>>>>    17121188 =C2=B1  2%     +29.0%   22093251 =C2=B1  0%
>>>>>>>> numa-meminfo.node1.Active(anon)
>>>>>>>>    17065962 =C2=B1  2%     +29.1%   22037536 =C2=B1  0%
>>>>>>>> numa-meminfo.node1.AnonHugePages
>>>>>>>>    17112745 =C2=B1  2%     +28.8%   22046594 =C2=B1  0%
>>>>>>>> numa-meminfo.node1.AnonPages
>>>>>>>>    48333766 =C2=B1  0%     -10.4%   43287833 =C2=B1  0% numa-memin=
fo.node1.MemFree
>>>>>>>>    17696485 =C2=B1  2%     +28.5%   22742414 =C2=B1  0% numa-memin=
fo.node1.MemUsed
>>>>>>>>       34985 =C2=B1  2%     +26.9%      44397 =C2=B1  0%
>>>>>>>> numa-meminfo.node1.PageTables
>>>>>>>>       29141 =C2=B1  2%      -9.3%      26425 =C2=B1  0%
>>>>>>>> numa-meminfo.node1.SReclaimable
>>>>>>>>     3984492 =C2=B1  3%     -33.1%    2666937 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_active_anon
>>>>>>>>     3979198 =C2=B1  3%     -33.1%    2661266 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_anon_pages
>>>>>>>>        7741 =C2=B1  3%     -33.0%       5190 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_anon_transparent_hugepages
>>>>>>>>    12310193 =C2=B1  1%     +10.8%   13643946 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_free_pages
>>>>>>>>        2597 =C2=B1 25%     -35.9%       1664 =C2=B1  0% numa-vmsta=
t.node0.nr_mapped
>>>>>>>>        8184 =C2=B1  3%     -30.0%       5726 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_page_table_pages
>>>>>>>>       14480 =C2=B1  7%     +15.2%      16678 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_slab_unreclaimable
>>>>>>>>     2203159 =C2=B1  2%     -96.3%      81344 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.numa_foreign
>>>>>>>>     1252855 =C2=B1  8%     -69.9%     376939 =C2=B1  0% numa-vmsta=
t.node0.numa_miss
>>>>>>>>     4288953 =C2=B1  3%     +28.8%    5522754 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.nr_active_anon
>>>>>>>>     4282323 =C2=B1  3%     +28.7%    5510523 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.nr_anon_pages
>>>>>>>>        8336 =C2=B1  3%     +29.0%      10758 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.nr_anon_transparent_hugepages
>>>>>>>>    12074772 =C2=B1  0%     -10.4%   10822526 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.nr_free_pages
>>>>>>>>        8751 =C2=B1  2%     +26.8%      11097 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.nr_page_table_pages
>>>>>>>>        7284 =C2=B1  2%      -9.3%       6606 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.nr_slab_reclaimable
>>>>>>>>     1217231 =C2=B1  8%     -73.4%     324012 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.numa_foreign
>>>>>>>>     1146153 =C2=B1  1%     +23.0%    1410186 =C2=B1  0% numa-vmsta=
t.node1.numa_hit
>>>>>>>>     1146153 =C2=B1  1%     +23.0%    1410185 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.numa_local
>>>>>>>>     2167535 =C2=B1  2%     -98.7%      28416 =C2=B1  0% numa-vmsta=
t.node1.numa_miss
>>>>>>>>   7.842e+10 =C2=B1  2%     +30.3%  1.022e+11 =C2=B1  0%
>>>>>>>> perf-stat.L1-dcache-load-misses
>>>>>>>>   9.966e+11 =C2=B1  1%     +20.1%  1.197e+12 =C2=B1  0% perf-stat.=
L1-dcache-loads
>>>>>>>>   5.952e+11 =C2=B1  2%     +26.9%  7.553e+11 =C2=B1  0% perf-stat.=
L1-dcache-stores
>>>>>>>>   2.068e+10 =C2=B1  0%     +16.8%  2.416e+10 =C2=B1  0%
>>>>>>>> perf-stat.L1-icache-load-misses
>>>>>>>>   2.776e+08 =C2=B1  2%    +134.6%  6.513e+08 =C2=B1  0% perf-stat.=
LLC-load-misses
>>>>>>>>    8.58e+09 =C2=B1  1%     +59.0%  1.364e+10 =C2=B1  0% perf-stat.=
LLC-loads
>>>>>>>>   1.001e+09 =C2=B1  3%     +52.9%  1.529e+09 =C2=B1  0% perf-stat.=
LLC-store-misses
>>>>>>>>   4.052e+09 =C2=B1  0%     +56.1%  6.325e+09 =C2=B1  0% perf-stat.=
LLC-stores
>>>>>>>>   1.373e+12 =C2=B1  0%     +24.7%  1.712e+12 =C2=B1  0%
>>>>>>>> perf-stat.branch-instructions
>>>>>>>>    5.29e+09 =C2=B1  3%     +26.3%   6.68e+09 =C2=B1  0%
>>>>>>>> perf-stat.branch-load-misses
>>>>>>>>   1.399e+12 =C2=B1  2%     +21.2%  1.695e+12 =C2=B1  0% perf-stat.=
branch-loads
>>>>>>>>   5.513e+09 =C2=B1  1%     +33.4%  7.353e+09 =C2=B1  0% perf-stat.=
branch-misses
>>>>>>>>   2.717e+11 =C2=B1  0%     +10.2%  2.993e+11 =C2=B1  0% perf-stat.=
bus-cycles
>>>>>>>>   1.352e+09 =C2=B1  0%     +59.2%  2.152e+09 =C2=B1  0% perf-stat.=
cache-misses
>>>>>>>>   2.986e+10 =C2=B1  1%     +51.8%  4.533e+10 =C2=B1  0% perf-stat.=
cache-references
>>>>>>>>     1008305 =C2=B1  4%   +2140.3%   22588837 =C2=B1  0% perf-stat.=
context-switches
>>>>>>>>   6.857e+12 =C2=B1  2%      +8.6%  7.444e+12 =C2=B1  0% perf-stat.=
cpu-cycles
>>>>>>>>       55660 =C2=B1  1%      +9.6%      60990 =C2=B1  0% perf-stat.=
cpu-migrations
>>>>>>>>   2.076e+09 =C2=B1  0%     +22.2%  2.536e+09 =C2=B1  0% perf-stat.=
dTLB-load-misses
>>>>>>>>   9.948e+11 =C2=B1  4%     +12.1%  1.115e+12 =C2=B1  0% perf-stat.=
dTLB-loads
>>>>>>>>   4.047e+08 =C2=B1  0%      -1.9%   3.97e+08 =C2=B1  0% perf-stat.=
dTLB-store-misses
>>>>>>>>   6.139e+11 =C2=B1  0%     +14.0%  6.998e+11 =C2=B1  0% perf-stat.=
dTLB-stores
>>>>>>>>   6.095e+08 =C2=B1  0%      +6.1%  6.466e+08 =C2=B1  0% perf-stat.=
iTLB-load-misses
>>>>>>>>    3.27e+08 =C2=B1  3%     +24.0%  4.055e+08 =C2=B1  0% perf-stat.=
iTLB-loads
>>>>>>>>   4.604e+12 =C2=B1  2%     +25.3%   5.77e+12 =C2=B1  0% perf-stat.=
instructions
>>>>>>>>     9492594 =C2=B1  3%     -60.0%    3798901 =C2=B1  0% perf-stat.=
minor-faults
>>>>>>>>    38705676 =C2=B1  6%    +916.0%  3.933e+08 =C2=B1  0% perf-stat.=
node-load-misses
>>>>>>>>   2.455e+08 =C2=B1  2%      +7.0%  2.627e+08 =C2=B1  0% perf-stat.=
node-loads
>>>>>>>>    25987631 =C2=B1  6%    +209.5%   80421284 =C2=B1  0% perf-stat.=
node-store-misses
>>>>>>>>   9.802e+08 =C2=B1  3%     +43.7%  1.408e+09 =C2=B1  0% perf-stat.=
node-stores
>>>>>>>>     9492659 =C2=B1  3%     -60.0%    3798896 =C2=B1  0% perf-stat.=
page-faults
>>>>>>>>   6.082e+12 =C2=B1  1%     +14.2%  6.945e+12 =C2=B1  0% perf-stat.=
ref-cycles
>>>>>>>>       24.95 =C2=B1 18%     -96.4%       0.91 =C2=B1-109%
>>>>>>>> perf-profile.cycles-pp.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        2.14 =C2=B1  8%     -27.9%       1.54 =C2=B1-64% perf-profi=
le.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interr=
upt.smp_apic_timer_interrupt.apic_timer_interrupt
>>>>>>>>        1.35 =C2=B1  9%     -21.7%       1.06 =C2=B1-94% perf-profi=
le.cycles-pp.__tick_nohz_idle_enter.tick_nohz_irq_exit.irq_exit.smp_apic_ti=
mer_interrupt.apic_timer_interrupt
>>>>>>>>        7.53 =C2=B1  8%     -19.4%       6.07 =C2=B1-16% perf-profi=
le.cycles-pp.apic_timer_interrupt.cpuidle_enter.call_cpuidle.cpu_startup_en=
try.start_secondary
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.call_console_drivers.constprop.23.console_unlock.vprintk_emit.=
vprintk_default.printk
>>>>>>>>       70.21 =C2=B1  5%     +12.1%      78.73 =C2=B1 -1%
>>>>>>>> perf-profile.cycles-pp.call_cpuidle.cpu_startup_entry.start_second=
ary
>>>>>>>>       23.39 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.clear_page_c_e.do_huge_pmd_anonymous_page.handle_mm_fault.__do=
_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      13.46 =C2=B1 -7% perf-profi=
le.cycles-pp.clear_page_c_e.process_one_work.worker_thread.kthread.ret_from=
_fork
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.console_unlock.vprintk_emit.vprintk_default.printk.perf_durati=
on_warn
>>>>>>>>       71.86 =C2=B1  5%     +12.5%      80.87 =C2=B1 -1%
>>>>>>>> perf-profile.cycles-pp.cpu_startup_entry.start_secondary
>>>>>>>>       70.14 =C2=B1  5%     +12.1%      78.64 =C2=B1 -1% perf-profi=
le.cycles-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
>>>>>>>>       61.19 =C2=B1  5%     +17.8%      72.06 =C2=B1 -1% perf-profi=
le.cycles-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_ent=
ry.start_secondary
>>>>>>>>       24.87 =C2=B1 18%     -96.6%       0.84 =C2=B1-119% perf-prof=
ile.cycles-pp.do_huge_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do=
_page_fault.page_fault
>>>>>>>>       24.95 =C2=B1 18%     -96.4%       0.91 =C2=B1-109%
>>>>>>>> perf-profile.cycles-pp.do_page_fault.page_fault
>>>>>>>>       24.93 =C2=B1 18%     -96.5%       0.88 =C2=B1-113% perf-prof=
ile.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        2.94 =C2=B1  8%     -22.4%       2.28 =C2=B1-43% perf-profi=
le.cycles-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_in=
terrupt.apic_timer_interrupt.cpuidle_enter
>>>>>>>>        1.40 =C2=B1  8%     -20.0%       1.12 =C2=B1-89% perf-profi=
le.cycles-pp.irq_enter.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidl=
e_enter.call_cpuidle
>>>>>>>>        1.92 =C2=B1  9%     -17.3%       1.59 =C2=B1-62% perf-profi=
le.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle=
_enter.call_cpuidle
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.irq_work_interrupt.cpuidle_enter.call_cpuidle.cpu_startup_entr=
y.start_secondary
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt.cpuidle=
_enter.call_cpuidle
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_work=
_interrupt.cpuidle_enter
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      15.67 =C2=B1 -6%
>>>>>>>> perf-profile.cycles-pp.kthread.ret_from_fork
>>>>>>>>        3.20 =C2=B1  8%     -22.3%       2.49 =C2=B1-40% perf-profi=
le.cycles-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer=
_interrupt.cpuidle_enter.call_cpuidle
>>>>>>>>       24.96 =C2=B1 18%     -96.4%       0.91 =C2=B1-109%
>>>>>>>> perf-profile.cycles-pp.page_fault
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.perf_duration_warn.irq_work_run_list.irq_work_run.smp_irq_work=
_interrupt.irq_work_interrupt
>>>>>>>>        0.89 =C2=B1 17%     -24.7%       0.67 =C2=B1-149% perf-prof=
ile.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interru=
pt.local_apic_timer_interrupt.smp_apic_timer_interrupt
>>>>>>>>        6.95 =C2=B1 32%    +144.6%      17.01 =C2=B1 -5% perf-profi=
le.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_s=
tartup_entry
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.printk.perf_duration_warn.irq_work_run_list.irq_work_run.smp_i=
rq_work_interrupt
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      14.75 =C2=B1 -6%
>>>>>>>> perf-profile.cycles-pp.process_one_work.worker_thread.kthread.ret_=
from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      15.67 =C2=B1 -6%
>>>>>>>> perf-profile.cycles-pp.ret_from_fork
>>>>>>>>        7.16 =C2=B1  8%     -19.3%       5.78 =C2=B1-17% perf-profi=
le.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter.ca=
ll_cpuidle.cpu_startup_entry
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.smp_irq_work_interrupt.irq_work_interrupt.cpuidle_enter.call_c=
puidle.cpu_startup_entry
>>>>>>>>       72.17 =C2=B1  5%     +12.5%      81.17 =C2=B1 -1%
>>>>>>>> perf-profile.cycles-pp.start_secondary
>>>>>>>>        1.42 =C2=B1 11%     -20.4%       1.13 =C2=B1-88% perf-profi=
le.cycles-pp.tick_nohz_irq_exit.irq_exit.smp_apic_timer_interrupt.apic_time=
r_interrupt.cpuidle_enter
>>>>>>>>        1.02 =C2=B1  8%     -24.3%       0.77 =C2=B1-129% perf-prof=
ile.cycles-pp.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_ir=
q_exit.irq_exit.smp_apic_timer_interrupt
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.vprintk_default.printk.perf_duration_warn.irq_work_run_list.ir=
q_work_run
>>>>>>>>        0.89 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.vprintk_emit.vprintk_default.printk.perf_duration_warn.irq_wor=
k_run_list
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      15.43 =C2=B1 -6%
>>>>>>>> perf-profile.cycles-pp.worker_thread.kthread.ret_from_fork
>>>>>>>>        0.00 =C2=B1  0%    +8e+08%       8.05 =C2=B1-12%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.avg
>>>>>>>>        0.00 =C2=B1  0%  +5.8e+10%     579.51 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.max
>>>>>>>>        0.00 =C2=B1  0%  +4.6e+24%      67.82 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.stddev
>>>>>>>>        6069 =C2=B1  0%     +53.5%       9314 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.avg
>>>>>>>>       47113 =C2=B1 18%     +24.7%      58747 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.max
>>>>>>>>       13592 =C2=B1  9%     +72.6%      23454 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.load.avg
>>>>>>>>      410493 =C2=B1  4%     +96.9%     808227 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.load.max
>>>>>>>>       66987 =C2=B1  6%     +68.7%     112976 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.load.stddev
>>>>>>>>       12.14 =C2=B1  3%     +45.7%      17.69 =C2=B1 -5%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.avg
>>>>>>>>      476.40 =C2=B1 16%     -45.2%     261.07 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.max
>>>>>>>>        0.00 =C2=B1  0%    +8e+08%       8.05 =C2=B1-12%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.avg
>>>>>>>>        0.00 =C2=B1  0%  +5.8e+10%     579.51 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.max
>>>>>>>>        0.00 =C2=B1  0%  +4.6e+24%      67.82 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.stddev
>>>>>>>>       36291 =C2=B1  8%     -52.3%      17303 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.avg
>>>>>>>>      313191 =C2=B1 19%     -69.5%      95523 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.max
>>>>>>>>        1743 =C2=B1 13%     +28.9%       2248 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.min
>>>>>>>>       63122 =C2=B1  7%     -75.7%      15355 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.stddev
>>>>>>>>        0.05 =C2=B1  5%     +16.5%       0.06 =C2=B1-1636%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.avg
>>>>>>>>        0.01 =C2=B1  0%    +100.0%       0.03 =C2=B1-3857%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.avg
>>>>>>>>        0.93 =C2=B1  0%     +50.0%       1.40 =C2=B1-71%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.max
>>>>>>>>        0.11 =C2=B1  0%     +61.2%       0.18 =C2=B1-568%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.stddev
>>>>>>>>        6.26 =C2=B1 12%     -23.0%       4.82 =C2=B1-20%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.avg
>>>>>>>>      406.09 =C2=B1 16%     -52.8%     191.87 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.max
>>>>>>>>       47.79 =C2=B1 16%     -45.1%      26.24 =C2=B1 -3%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.stddev
>>>>>>>>      286209 =C2=B1 19%     -75.2%      70993 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.spread0.max
>>>>>>>>       63124 =C2=B1  7%     -75.7%      15355 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.spread0.stddev
>>>>>>>>       22.63 =C2=B1  0%     +28.5%      29.07 =C2=B1 -3%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.avg
>>>>>>>>      994.69 =C2=B1  0%     -26.9%     727.33 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.max
>>>>>>>>      120.31 =C2=B1  0%     -19.2%      97.22 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.stddev
>>>>>>>>      652924 =C2=B1  4%     -70.7%     191467 =C2=B1  0%
>>>>>>>> sched_debug.cpu.avg_idle.min
>>>>>>>>       62909 =C2=B1  4%    +154.2%     159903 =C2=B1  0%
>>>>>>>> sched_debug.cpu.avg_idle.stddev
>>>>>>>>       31.29 =C2=B1 19%     -89.6%       3.27 =C2=B1-30%
>>>>>>>> sched_debug.cpu.clock.stddev
>>>>>>>>       31.29 =C2=B1 19%     -89.6%       3.27 =C2=B1-30%
>>>>>>>> sched_debug.cpu.clock_task.stddev
>>>>>>>>        6.24 =C2=B1 13%     -54.8%       2.82 =C2=B1-35%
>>>>>>>> sched_debug.cpu.cpu_load[0].avg
>>>>>>>>      405.91 =C2=B1 16%     -70.9%     118.27 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[0].max
>>>>>>>>       47.77 =C2=B1 16%     -67.4%      15.56 =C2=B1 -6%
>>>>>>>> sched_debug.cpu.cpu_load[0].stddev
>>>>>>>>        7.95 =C2=B1  2%     +76.1%      13.99 =C2=B1 -7%
>>>>>>>> sched_debug.cpu.cpu_load[1].avg
>>>>>>>>      449.78 =C2=B1 13%     -51.3%     219.20 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[1].max
>>>>>>>>        7.48 =C2=B1  4%     +86.9%      13.99 =C2=B1 -7%
>>>>>>>> sched_debug.cpu.cpu_load[2].avg
>>>>>>>>      435.38 =C2=B1 14%     -49.9%     218.07 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[2].max
>>>>>>>>        6.95 =C2=B1  7%    +103.7%      14.16 =C2=B1 -7%
>>>>>>>> sched_debug.cpu.cpu_load[3].avg
>>>>>>>>      423.78 =C2=B1 15%     -48.7%     217.47 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[3].max
>>>>>>>>        6.44 =C2=B1 11%    +121.7%      14.29 =C2=B1 -6%
>>>>>>>> sched_debug.cpu.cpu_load[4].avg
>>>>>>>>      411.18 =C2=B1 16%     -46.7%     219.20 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[4].max
>>>>>>>>       13803 =C2=B1 11%     +50.4%      20766 =C2=B1  0% sched_debu=
g.cpu.load.avg
>>>>>>>>      423194 =C2=B1  7%     +50.1%     635245 =C2=B1  0% sched_debu=
g.cpu.load.max
>>>>>>>>       68322 =C2=B1  9%     +42.2%      97131 =C2=B1  0% sched_debu=
g.cpu.load.stddev
>>>>>>>>        0.00 =C2=B1  8%     -64.0%       0.00 =C2=B1-5290916%
>>>>>>>> sched_debug.cpu.next_balance.stddev
>>>>>>>>       13819 =C2=B1  1%    +614.7%      98776 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.avg
>>>>>>>>       56631 =C2=B1 14%    +333.7%     245596 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.max
>>>>>>>>        4329 =C2=B1  4%    +501.6%      26043 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.min
>>>>>>>>       11927 =C2=B1  6%    +301.9%      47932 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.stddev
>>>>>>>>        0.05 =C2=B1  4%     +13.4%       0.06 =C2=B1-1661%
>>>>>>>> sched_debug.cpu.nr_running.avg
>>>>>>>>        7481 =C2=B1  4%   +1919.5%     151094 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.avg
>>>>>>>>       40224 =C2=B1 18%   +1521.6%     652301 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.max
>>>>>>>>      868.31 =C2=B1  9%     +15.1%     999.67 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.min
>>>>>>>>        7780 =C2=B1 13%   +2083.9%     169922 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.stddev
>>>>>>>>        8.00 =C2=B1 10%     +19.2%       9.53 =C2=B1-10%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.max
>>>>>>>>        7550 =C2=B1  5%   +1903.0%     151224 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.avg
>>>>>>>>       58276 =C2=B1 18%   +1012.6%     648402 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.max
>>>>>>>>      588.11 =C2=B1 12%     +20.5%     708.67 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.min
>>>>>>>>       10040 =C2=B1 12%   +1592.6%     169943 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.stddev
>>>>>>>>        3221 =C2=B1  5%   +1975.9%      66868 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.avg
>>>>>>>>       19376 =C2=B1 18%   +1466.6%     303542 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.max
>>>>>>>>      254.87 =C2=B1 10%     +20.0%     305.93 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.min
>>>>>>>>        3709 =C2=B1 14%   +1995.9%      77756 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.stddev
>>>>>>>>        3119 =C2=B1  5%   +2302.0%      74926 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.avg
>>>>>>>>       21818 =C2=B1 32%   +2207.3%     503414 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.max
>>>>>>>>        3351 =C2=B1 23%   +2595.9%      90348 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.stddev
>>>>>>>>      655.26 =C2=B1  4%   +1504.1%      10510 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.avg
>>>>>>>>        3182 =C2=B1 18%   +3784.0%     123596 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.max
>>>>>>>>      170.62 =C2=B1  5%     +23.5%     210.67 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.min
>>>>>>>>      439.43 =C2=B1  0%   +3789.0%      17089 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.stddev
>>>>>>>>        0.00 =C2=B1141%    +200.0%       0.01 =C2=B1-12817%
>>>>>>>> sched_debug.rt_rq:/.rt_nr_running.stddev
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> ******************************************************************=
*********************************
>>>>>>>>
>>>>>>>> lkp-bdw-ep2: 88 threads Broadwell-EP with 128G memory
>>>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>>>
>>>>>>>> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/t=
est/testcase:
>>>>>>>>
>>>>>>>> gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/=
8T/lkp-bdw-ep2/anon-w-seq/vm-scalability
>>>>>>>>
>>>>>>>> commit:
>>>>>>>>    v4.7-rc7
>>>>>>>>    8296d37010 ("Speeds up clearing huge pages using work queue")
>>>>>>>>
>>>>>>>>          v4.7-rc7 8296d3701014cd804bf981b5e2
>>>>>>>> ---------------- --------------------------
>>>>>>>>         fail:runs  %reproduction    fail:runs
>>>>>>>>             |             |             |
>>>>>>>>           %stddev     %change         %stddev
>>>>>>>>               \          |                \
>>>>>>>>        0.06 =C2=B1  7%     -79.8%       0.01 =C2=B1  1% vm-scalabi=
lity.stddev
>>>>>>>>    38146345 =C2=B1  0%     +33.5%   50940657 =C2=B1  0% vm-scalabi=
lity.throughput
>>>>>>>>      554.56 =C2=B1  0%     -26.8%     406.16 =C2=B1  0%
>>>>>>>> vm-scalability.time.elapsed_time
>>>>>>>>      554.56 =C2=B1  0%     -26.8%     406.16 =C2=B1  0%
>>>>>>>> vm-scalability.time.elapsed_time.max
>>>>>>>>      346652 =C2=B1  0%   +2921.7%   10474845 =C2=B1  0%
>>>>>>>> vm-scalability.time.involuntary_context_switches
>>>>>>>>        7889 =C2=B1  0%     -56.7%       3415 =C2=B1  0%
>>>>>>>> vm-scalability.time.percent_of_cpu_this_job_got
>>>>>>>>       22171 =C2=B1  0%     -74.4%       5673 =C2=B1  0%
>>>>>>>> vm-scalability.time.system_time
>>>>>>>>       21583 =C2=B1  0%     -62.0%       8200 =C2=B1  0%
>>>>>>>> vm-scalability.time.user_time
>>>>>>>>       58669 =C2=B1  0%  +20490.9%   12080480 =C2=B1  0%
>>>>>>>> vm-scalability.time.voluntary_context_switches
>>>>>>>>       20909 =C2=B1  5%     +13.7%      23776 =C2=B1  4%
>>>>>>>> interrupts.CAL:Function_call_interrupts
>>>>>>>>        1.33 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> numa-numastat.node0.other_node
>>>>>>>>      594.79 =C2=B1  0%     -25.3%     444.24 =C2=B1  1%  uptime.bo=
ot
>>>>>>>>        8150 =C2=B1  1%     +62.1%      13214 =C2=B1  3%  uptime.id=
le
>>>>>>>>    23305202 =C2=B1  0%     +23.1%   28680490 =C2=B1  0% meminfo.An=
onHugePages
>>>>>>>>       20033 =C2=B1  0%     +43.8%      28799 =C2=B1  0% meminfo.Ke=
rnelStack
>>>>>>>>       51997 =C2=B1  0%     +20.8%      62802 =C2=B1  0% meminfo.Pa=
geTables
>>>>>>>>       81.33 =C2=B1  0%      -9.4%      73.67 =C2=B1  1%  vmstat.pr=
ocs.r
>>>>>>>>        4618 =C2=B1  3%   +5168.1%     243282 =C2=B1  0%  vmstat.sy=
stem.cs
>>>>>>>>       93458 =C2=B1  1%     +13.2%     105783 =C2=B1  0%  vmstat.sy=
stem.in
>>>>>>>>       16988 =C2=B1  1%     -14.3%      14557 =C2=B1  1%  softirqs.=
NET_RX
>>>>>>>>     4355772 =C2=B1  2%     +64.9%    7182335 =C2=B1  0%  softirqs.=
RCU
>>>>>>>>      303674 =C2=B1  0%   +1935.3%    6180796 =C2=B1  0%  softirqs.=
SCHED
>>>>>>>>    22334603 =C2=B1  0%     -40.0%   13394325 =C2=B1  0%  softirqs.=
TIMER
>>>>>>>>        5747 =C2=B1  1%     +20.2%       6906 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_anon_transparent_hugepages
>>>>>>>>      745.00 =C2=B1  1%     +34.0%     998.00 =C2=B1  1%
>>>>>>>> numa-vmstat.node0.nr_kernel_stack
>>>>>>>>        6543 =C2=B1  1%     +18.6%       7763 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_page_table_pages
>>>>>>>>       23141 =C2=B1  3%     +10.3%      25535 =C2=B1  0%
>>>>>>>> numa-vmstat.node0.nr_slab_unreclaimable
>>>>>>>>        5917 =C2=B1  0%     +18.7%       7026 =C2=B1  0%
>>>>>>>> numa-vmstat.node1.nr_anon_transparent_hugepages
>>>>>>>>      506.67 =C2=B1  1%     +58.1%     801.00 =C2=B1  1%
>>>>>>>> numa-vmstat.node1.nr_kernel_stack
>>>>>>>>        1701 =C2=B1  0%     +56.3%       2658 =C2=B1 25% numa-vmsta=
t.node1.nr_mapped
>>>>>>>>        6763 =C2=B1  0%     +16.1%       7854 =C2=B1  1%
>>>>>>>> numa-vmstat.node1.nr_page_table_pages
>>>>>>>>       90.16 =C2=B1  0%     -18.3%      73.69 =C2=B1  0%  turbostat=
.%Busy
>>>>>>>>        2516 =C2=B1  0%     -18.8%       2043 =C2=B1  0%  turbostat=
.Avg_MHz
>>>>>>>>        5.11 =C2=B1  1%    +364.6%      23.74 =C2=B1  0%  turbostat=
.CPU%c1
>>>>>>>>        0.03 =C2=B1  0%   +2444.4%       0.76 =C2=B1  0%  turbostat=
.CPU%c3
>>>>>>>>        4.71 =C2=B1  1%     -61.7%       1.80 =C2=B1  1%  turbostat=
.CPU%c6
>>>>>>>>        1.69 =C2=B1  1%     -87.4%       0.21 =C2=B1 11%  turbostat=
.Pkg%pc2
>>>>>>>>      252.57 =C2=B1  0%      +2.8%     259.69 =C2=B1  0%  turbostat=
.PkgWatt
>>>>>>>>      132.98 =C2=B1  0%      -2.4%     129.82 =C2=B1  0%  turbostat=
.RAMWatt
>>>>>>>>     7716175 =C2=B1 16%  +12917.5%  1.004e+09 =C2=B1  0% cpuidle.C1=
-BDW.time
>>>>>>>>       83323 =C2=B1 13%  +15468.5%   12972137 =C2=B1  0% cpuidle.C1=
-BDW.usage
>>>>>>>>     5597051 =C2=B1  8%  +17317.8%  9.749e+08 =C2=B1  0% cpuidle.C1=
E-BDW.time
>>>>>>>>       36098 =C2=B1  2%  +28933.3%   10480645 =C2=B1  1% cpuidle.C1=
E-BDW.usage
>>>>>>>>    46920966 =C2=B1 12%   +8645.3%  4.103e+09 =C2=B1  0% cpuidle.C3=
-BDW.time
>>>>>>>>      124855 =C2=B1 10%  +13265.3%   16687376 =C2=B1  0% cpuidle.C3=
-BDW.usage
>>>>>>>>   4.774e+09 =C2=B1  1%     -29.4%   3.37e+09 =C2=B1  0% cpuidle.C6=
-BDW.time
>>>>>>>>     5056262 =C2=B1  1%     +25.7%    6355777 =C2=B1  0% cpuidle.C6=
-BDW.usage
>>>>>>>>        1549 =C2=B1 11%   +6459.9%     101634 =C2=B1  1% cpuidle.PO=
LL.usage
>>>>>>>>    11825435 =C2=B1  0%     +19.9%   14173072 =C2=B1  0%
>>>>>>>> numa-meminfo.node0.AnonHugePages
>>>>>>>>       11934 =C2=B1  1%     +34.0%      15989 =C2=B1  1%
>>>>>>>> numa-meminfo.node0.KernelStack
>>>>>>>>       26291 =C2=B1  0%     +18.4%      31133 =C2=B1  1%
>>>>>>>> numa-meminfo.node0.PageTables
>>>>>>>>       92565 =C2=B1  4%     +10.4%     102148 =C2=B1  0%
>>>>>>>> numa-meminfo.node0.SUnreclaim
>>>>>>>>      124198 =C2=B1  4%      +8.7%     134999 =C2=B1  0% numa-memin=
fo.node0.Slab
>>>>>>>>    12226440 =C2=B1  1%     +17.9%   14419573 =C2=B1  0%
>>>>>>>> numa-meminfo.node1.AnonHugePages
>>>>>>>>        8105 =C2=B1  1%     +58.2%      12819 =C2=B1  1%
>>>>>>>> numa-meminfo.node1.KernelStack
>>>>>>>>        6834 =C2=B1  0%     +55.4%      10619 =C2=B1 24% numa-memin=
fo.node1.Mapped
>>>>>>>>       27246 =C2=B1  1%     +15.5%      31478 =C2=B1  1%
>>>>>>>> numa-meminfo.node1.PageTables
>>>>>>>>       11383 =C2=B1  1%     +23.2%      14021 =C2=B1  0%
>>>>>>>> proc-vmstat.nr_anon_transparent_hugepages
>>>>>>>>        1251 =C2=B1  0%     +43.8%       1800 =C2=B1  0% proc-vmsta=
t.nr_kernel_stack
>>>>>>>>       13036 =C2=B1  1%     +20.6%      15719 =C2=B1  0%
>>>>>>>> proc-vmstat.nr_page_table_pages
>>>>>>>>      112629 =C2=B1  3%     -99.6%     415.00 =C2=B1 17%
>>>>>>>> proc-vmstat.numa_hint_faults
>>>>>>>>       88148 =C2=B1  4%     -99.6%     332.00 =C2=B1 17%
>>>>>>>> proc-vmstat.numa_hint_faults_local
>>>>>>>>     6378041 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> proc-vmstat.numa_huge_pte_updates
>>>>>>>>       19227 =C2=B1  3%     -99.8%      32.67 =C2=B1 56%
>>>>>>>> proc-vmstat.numa_pages_migrated
>>>>>>>>   3.272e+09 =C2=B1  0%    -100.0%     668.00 =C2=B1 36%
>>>>>>>> proc-vmstat.numa_pte_updates
>>>>>>>>       10408 =C2=B1  4%      +8.7%      11311 =C2=B1  6% proc-vmsta=
t.pgactivate
>>>>>>>>        1190 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1% proc-vmsta=
t.pgmigrate_fail
>>>>>>>>       19227 =C2=B1  3%     -99.8%      32.67 =C2=B1 56%
>>>>>>>> proc-vmstat.pgmigrate_success
>>>>>>>>       82759 =C2=B1117%     -99.1%     737.33 =C2=B1138% latency_st=
ats.avg.down.console_lock.do_con_write.con_write.n_tty_write.tty_write.redi=
rected_tty_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%     996353 =C2=B1  0% latency_st=
ats.hits.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_hug=
e_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%    1817330 =C2=B1  0% latency_st=
ats.hits.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handl=
e_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%    8326013 =C2=B1  0% latency_st=
ats.hits.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_=
mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>      772874 =C2=B1  6%     -85.9%     109215 =C2=B1  2% latency_st=
ats.hits.pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_=
fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      82817 =C2=B1 49% latency_st=
ats.max.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_huge=
_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      83729 =C2=B1 48% latency_st=
ats.max.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle=
_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>      248080 =C2=B1117%     -99.7%     739.00 =C2=B1137% latency_st=
ats.max.down.console_lock.do_con_write.con_write.n_tty_write.tty_write.redi=
rected_tty_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      12202 =C2=B1  5% latency_st=
ats.max.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_m=
m_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  2.619e+09 =C2=B1  0% latency_st=
ats.sum.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_huge=
_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       41841 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1% latency_st=
ats.sum.call_rwsem_down_read_failed.page_lock_anon_vma_read.rmap_walk_anon.=
rmap_walk.try_to_unmap.migrate_pages.migrate_misplaced_page.handle_pte_faul=
t.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       22928 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1% latency_st=
ats.sum.call_rwsem_down_read_failed.rmap_walk_anon.rmap_walk.remove_migrati=
on_ptes.migrate_pages.migrate_misplaced_page.handle_pte_fault.handle_mm_fau=
lt.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  4.892e+09 =C2=B1  0% latency_st=
ats.sum.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle=
_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>      248278 =C2=B1117%     -99.7%     759.33 =C2=B1132% latency_st=
ats.sum.down.console_lock.do_con_write.con_write.n_tty_write.tty_write.redi=
rected_tty_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%   4.98e+09 =C2=B1  0% latency_st=
ats.sum.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_m=
m_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>     1145012 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1% latency_st=
ats.sum.wait_on_page_bit.__migration_entry_wait.migration_entry_wait.handle=
_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       25922 =C2=B1  1%     -55.4%      11563 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-256.active_objs
>>>>>>>>      414.00 =C2=B1  1%     -41.1%     243.67 =C2=B1  1%
>>>>>>>> slabinfo.kmalloc-256.active_slabs
>>>>>>>>       26521 =C2=B1  1%     -41.1%      15632 =C2=B1  1%
>>>>>>>> slabinfo.kmalloc-256.num_objs
>>>>>>>>      414.00 =C2=B1  1%     -41.1%     243.67 =C2=B1  1%
>>>>>>>> slabinfo.kmalloc-256.num_slabs
>>>>>>>>       43609 =C2=B1  3%     +34.5%      58654 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-32.active_objs
>>>>>>>>      340.33 =C2=B1  3%     +34.5%     457.67 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-32.active_slabs
>>>>>>>>       43620 =C2=B1  3%     +34.5%      58654 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-32.num_objs
>>>>>>>>      340.33 =C2=B1  3%     +34.5%     457.67 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-32.num_slabs
>>>>>>>>       19070 =C2=B1  3%     +33.7%      25496 =C2=B1  5%
>>>>>>>> slabinfo.kmalloc-512.active_objs
>>>>>>>>      298.67 =C2=B1  3%     +33.6%     399.00 =C2=B1  5%
>>>>>>>> slabinfo.kmalloc-512.active_slabs
>>>>>>>>       19171 =C2=B1  3%     +33.4%      25578 =C2=B1  5%
>>>>>>>> slabinfo.kmalloc-512.num_objs
>>>>>>>>      298.67 =C2=B1  3%     +33.6%     399.00 =C2=B1  5%
>>>>>>>> slabinfo.kmalloc-512.num_slabs
>>>>>>>>        5418 =C2=B1  1%      +8.6%       5885 =C2=B1  1%
>>>>>>>> slabinfo.sighand_cache.active_objs
>>>>>>>>        5466 =C2=B1  1%      +8.5%       5931 =C2=B1  1%
>>>>>>>> slabinfo.sighand_cache.num_objs
>>>>>>>>        4158 =C2=B1  4%      +9.9%       4569 =C2=B1  1%
>>>>>>>> slabinfo.sock_inode_cache.active_objs
>>>>>>>>        4158 =C2=B1  4%      +9.9%       4569 =C2=B1  1%
>>>>>>>> slabinfo.sock_inode_cache.num_objs
>>>>>>>>        1796 =C2=B1  0%     +30.4%       2342 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.active_objs
>>>>>>>>      606.33 =C2=B1  0%     +30.3%     790.33 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.active_slabs
>>>>>>>>        1821 =C2=B1  0%     +30.3%       2372 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.num_objs
>>>>>>>>      606.33 =C2=B1  0%     +30.3%     790.33 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.num_slabs
>>>>>>>>   5.736e+11 =C2=B1  0%      +4.8%  6.008e+11 =C2=B1  0%
>>>>>>>> perf-stat.L1-dcache-load-misses
>>>>>>>>   6.828e+12 =C2=B1  0%     +33.2%  9.097e+12 =C2=B1  0% perf-stat.=
L1-dcache-loads
>>>>>>>>   2.914e+12 =C2=B1  0%      +6.0%  3.088e+12 =C2=B1  0% perf-stat.=
L1-dcache-stores
>>>>>>>>    7.84e+09 =C2=B1  0%    +174.9%  2.155e+10 =C2=B1  0%
>>>>>>>> perf-stat.L1-icache-load-misses
>>>>>>>>   3.023e+09 =C2=B1  0%    +118.5%  6.604e+09 =C2=B1  0% perf-stat.=
LLC-load-misses
>>>>>>>>    1.05e+10 =C2=B1  0%    +145.8%  2.581e+10 =C2=B1  0% perf-stat.=
LLC-loads
>>>>>>>>   5.669e+10 =C2=B1  0%     -41.8%    3.3e+10 =C2=B1  0% perf-stat.=
LLC-store-misses
>>>>>>>>   4.157e+11 =C2=B1  0%     -15.6%  3.508e+11 =C2=B1  0% perf-stat.=
LLC-stores
>>>>>>>>   1.117e+13 =C2=B1  0%     +19.6%  1.335e+13 =C2=B1  0%
>>>>>>>> perf-stat.branch-instructions
>>>>>>>>   1.009e+09 =C2=B1  0%    +422.6%  5.272e+09 =C2=B1  0%
>>>>>>>> perf-stat.branch-load-misses
>>>>>>>>   1.117e+13 =C2=B1  0%     +19.7%  1.336e+13 =C2=B1  0% perf-stat.=
branch-loads
>>>>>>>>   1.018e+09 =C2=B1  0%    +420.5%  5.299e+09 =C2=B1  0% perf-stat.=
branch-misses
>>>>>>>>   4.325e+12 =C2=B1  0%     -40.4%  2.576e+12 =C2=B1  0% perf-stat.=
bus-cycles
>>>>>>>>    1.64e+11 =C2=B1  0%     -32.9%  1.101e+11 =C2=B1  0% perf-stat.=
cache-misses
>>>>>>>>   6.914e+11 =C2=B1  0%      -4.8%  6.583e+11 =C2=B1  0% perf-stat.=
cache-references
>>>>>>>>     2556163 =C2=B1  4%   +3779.8%   99173855 =C2=B1  0% perf-stat.=
context-switches
>>>>>>>>    1.21e+14 =C2=B1  0%     -40.6%  7.181e+13 =C2=B1  0% perf-stat.=
cpu-cycles
>>>>>>>>      129774 =C2=B1  0%   +6200.0%    8175820 =C2=B1  0% perf-stat.=
cpu-migrations
>>>>>>>>   2.377e+08 =C2=B1  0%    +306.5%  9.664e+08 =C2=B1  2% perf-stat.=
dTLB-load-misses
>>>>>>>>   6.831e+12 =C2=B1  0%     +33.1%  9.093e+12 =C2=B1  0% perf-stat.=
dTLB-loads
>>>>>>>>     1.3e+08 =C2=B1  0%     +63.0%  2.119e+08 =C2=B1  0% perf-stat.=
dTLB-store-misses
>>>>>>>>   2.917e+12 =C2=B1  0%      +5.9%  3.088e+12 =C2=B1  0% perf-stat.=
dTLB-stores
>>>>>>>>    1.66e+08 =C2=B1  1%      -4.0%  1.594e+08 =C2=B1  0% perf-stat.=
iTLB-load-misses
>>>>>>>>    63264319 =C2=B1  1%    +870.0%  6.136e+08 =C2=B1  0% perf-stat.=
iTLB-loads
>>>>>>>>   3.594e+13 =C2=B1  0%     +22.1%   4.39e+13 =C2=B1  0% perf-stat.=
instructions
>>>>>>>>    22353737 =C2=B1  0%      -1.5%   22022473 =C2=B1  0% perf-stat.=
minor-faults
>>>>>>>>   4.773e+08 =C2=B1  1%    +470.9%  2.725e+09 =C2=B1  0% perf-stat.=
node-load-misses
>>>>>>>>   2.535e+09 =C2=B1  0%     +52.9%  3.877e+09 =C2=B1  1% perf-stat.=
node-loads
>>>>>>>>   1.319e+08 =C2=B1  1%   +1521.6%  2.139e+09 =C2=B1  0% perf-stat.=
node-store-misses
>>>>>>>>   5.666e+10 =C2=B1  0%     -45.6%  3.084e+10 =C2=B1  0% perf-stat.=
node-stores
>>>>>>>>    22353972 =C2=B1  0%      -1.5%   22022566 =C2=B1  0% perf-stat.=
page-faults
>>>>>>>>   9.501e+13 =C2=B1  0%     -40.3%   5.67e+13 =C2=B1  0% perf-stat.=
ref-cycles
>>>>>>>>        1.06 =C2=B1  2%     -37.4%       0.66 =C2=B1  2% perf-profi=
le.cycles-pp.__alloc_pages_nodemask.alloc_pages_vma.do_huge_pmd_anonymous_p=
age.handle_mm_fault.__do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      11.20 =C2=B1  0% perf-profi=
le.cycles-pp.__alloc_workqueue_key.clear_huge_page.do_huge_pmd_anonymous_pa=
ge.handle_mm_fault.__do_page_fault
>>>>>>>>       10.56 =C2=B1  5%     -94.8%       0.55 =C2=B1141%
>>>>>>>> perf-profile.cycles-pp.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       42.60 =C2=B1  0%     -60.2%      16.94 =C2=B1  4%
>>>>>>>> perf-profile.cycles-pp.__do_page_fault.do_page_fault.page_fault.do=
_unit
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       4.53 =C2=B1  4% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.__alloc_workqueue_key.clear_h=
uge_page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       5.26 =C2=B1  4% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.apply_workqueue_attrs.__alloc=
_workqueue_key.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.15 =C2=B1  4% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.destroy_workqueue.clear_huge_=
page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       5.97 =C2=B1  1% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.pwq_unbound_release_workfn.pr=
ocess_one_work.worker_thread
>>>>>>>>        1.07 =C2=B1  2%     -37.7%       0.67 =C2=B1  2% perf-profi=
le.cycles-pp.alloc_pages_vma.do_huge_pmd_anonymous_page.handle_mm_fault.__d=
o_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       6.42 =C2=B1  1% perf-profi=
le.cycles-pp.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do=
_huge_pmd_anonymous_page.handle_mm_fault
>>>>>>>>        1.67 =C2=B1 12%    +831.7%      15.59 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.call_cpuidle.cpu_startup_entry.start_second=
ary
>>>>>>>>        1.69 =C2=B1  1%    +873.4%      16.48 =C2=B1  0% perf-profi=
le.cycles-pp.clear_huge_page.do_huge_pmd_anonymous_page.handle_mm_fault.__d=
o_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       1.36 =C2=B1  1% perf-profi=
le.cycles-pp.clear_mem.process_one_work.worker_thread.kthread.ret_from_fork
>>>>>>>>       48.62 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.clear_page_c_e.do_huge_pmd_anonymous_page.handle_mm_fault.__do=
_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      28.49 =C2=B1  2% perf-profi=
le.cycles-pp.clear_page_c_e.process_one_work.worker_thread.kthread.ret_from=
_fork
>>>>>>>>        1.69 =C2=B1 12%    +857.6%      16.18 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.cpu_startup_entry.start_secondary
>>>>>>>>        1.67 =C2=B1 13%    +833.5%      15.59 =C2=B1  1% perf-profi=
le.cycles-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
>>>>>>>>        1.64 =C2=B1 13%    +841.8%      15.48 =C2=B1  1% perf-profi=
le.cycles-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_ent=
ry.start_secondary
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       4.00 =C2=B1  3% perf-profi=
le.cycles-pp.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.h=
andle_mm_fault.__do_page_fault
>>>>>>>>       52.83 =C2=B1  0%     -67.2%      17.32 =C2=B1  0% perf-profi=
le.cycles-pp.do_huge_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_=
page_fault.page_fault
>>>>>>>>       10.56 =C2=B1  5%     -94.8%       0.55 =C2=B1141%
>>>>>>>> perf-profile.cycles-pp.do_page_fault.page_fault
>>>>>>>>       42.60 =C2=B1  0%     -60.2%      16.95 =C2=B1  4%
>>>>>>>> perf-profile.cycles-pp.do_page_fault.page_fault.do_unit
>>>>>>>>       86.70 =C2=B1  0%     -49.5%      43.82 =C2=B1  3%
>>>>>>>> perf-profile.cycles-pp.do_unit
>>>>>>>>        1.05 =C2=B1  1%     -37.6%       0.65 =C2=B1  2% perf-profi=
le.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma.=
do_huge_pmd_anonymous_page.handle_mm_fault
>>>>>>>>       10.53 =C2=B1  5%     -94.8%       0.54 =C2=B1141% perf-profi=
le.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       42.49 =C2=B1  0%     -60.3%      16.88 =C2=B1  4% perf-profi=
le.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.do_un=
it
>>>>>>>>        1.63 =C2=B1 13%    +842.4%      15.39 =C2=B1  1% perf-profi=
le.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_=
startup_entry
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      38.24 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.kthread.ret_from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       4.54 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_lock.__alloc_workqueue_key.clear_huge_page.do_huge_pmd_a=
nonymous_page.handle_mm_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       5.26 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_lock.apply_workqueue_attrs.__alloc_workqueue_key.clear_h=
uge_page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.16 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_lock.destroy_workqueue.clear_huge_page.do_huge_pmd_anony=
mous_page.handle_mm_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       5.98 =C2=B1  1% perf-profi=
le.cycles-pp.mutex_lock.pwq_unbound_release_workfn.process_one_work.worker_=
thread.kthread
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       4.52 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.__alloc=
_workqueue_key.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       5.24 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.apply_w=
orkqueue_attrs.__alloc_workqueue_key
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.13 =C2=B1  3% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.destroy=
_workqueue.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       5.96 =C2=B1  1% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pwq_unb=
ound_release_workfn.process_one_work
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       4.27 =C2=B1  4% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.__alloc_workqueue_key
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       4.94 =C2=B1  4% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.apply_workqueue_attrs
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.96 =C2=B1  4% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.destroy_workqueue
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       5.69 =C2=B1  1% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.pwq_unbound_release_workfn
>>>>>>>>       10.56 =C2=B1  5%     -94.8%       0.55 =C2=B1141%
>>>>>>>> perf-profile.cycles-pp.page_fault
>>>>>>>>       42.60 =C2=B1  0%     -60.2%      16.95 =C2=B1  4%
>>>>>>>> perf-profile.cycles-pp.page_fault.do_unit
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      37.43 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.process_one_work.worker_thread.kthread.ret_=
from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       6.06 =C2=B1  1% perf-profi=
le.cycles-pp.pwq_unbound_release_workfn.process_one_work.worker_thread.kthr=
ead.ret_from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      38.24 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.ret_from_fork
>>>>>>>>        1.69 =C2=B1 12%    +858.6%      16.20 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.start_secondary
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      38.08 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.worker_thread.kthread.ret_from_fork
>>>>>>>>        5.82 =C2=B1 86%  +7.5e+06%     433918 =C2=B1 21%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.avg
>>>>>>>>      353.62 =C2=B1 73%  +1.1e+06%    3889704 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.max
>>>>>>>>       43.10 =C2=B1 77%  +2.7e+06%    1183052 =C2=B1 12%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.stddev
>>>>>>>>      242739 =C2=B1  0%     -46.6%     129743 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.avg
>>>>>>>>      245391 =C2=B1  0%     -44.4%     136382 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.max
>>>>>>>>      240090 =C2=B1  0%     -48.8%     122991 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.min
>>>>>>>>        1116 =C2=B1  9%    +435.8%       5983 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.stddev
>>>>>>>>       12350 =C2=B1 10%   +2254.6%     290808 =C2=B1  9%
>>>>>>>> sched_debug.cfs_rq:/.load.avg
>>>>>>>>       80177 =C2=B1 80%   +1634.2%    1390400 =C2=B1 22%
>>>>>>>> sched_debug.cfs_rq:/.load.max
>>>>>>>>        5380 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.load.min
>>>>>>>>       12011 =C2=B1 72%   +3401.2%     420562 =C2=B1 10%
>>>>>>>> sched_debug.cfs_rq:/.load.stddev
>>>>>>>>       18.85 =C2=B1 21%   +1747.5%     348.21 =C2=B1  3%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.avg
>>>>>>>>      175.43 =C2=B1 14%    +626.6%       1274 =C2=B1  9%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.max
>>>>>>>>        5.07 =C2=B1 14%    +501.5%      30.48 =C2=B1  9%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.min
>>>>>>>>       33.38 =C2=B1 10%    +787.0%     296.05 =C2=B1  6%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.stddev
>>>>>>>>        5.82 =C2=B1 86%  +7.5e+06%     433918 =C2=B1 21%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.avg
>>>>>>>>      353.62 =C2=B1 73%  +1.1e+06%    3889704 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.max
>>>>>>>>       43.10 =C2=B1 77%  +2.7e+06%    1183052 =C2=B1 12%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.stddev
>>>>>>>>    21470799 =C2=B1  0%     -81.9%    3882202 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.avg
>>>>>>>>    21680860 =C2=B1  0%     -81.5%    4000633 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.max
>>>>>>>>    21243753 =C2=B1  0%     -82.2%    3771272 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.min
>>>>>>>>       91646 =C2=B1  5%     -41.9%      53207 =C2=B1  7%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.stddev
>>>>>>>>        1.03 =C2=B1  4%     +84.3%       1.90 =C2=B1  7%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.max
>>>>>>>>        0.47 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.min
>>>>>>>>        0.17 =C2=B1  8%    +210.4%       0.54 =C2=B1  6%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.stddev
>>>>>>>>        1.67 =C2=B1  1%    +283.5%       6.42 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.avg
>>>>>>>>        2.41 =C2=B1  0%     +25.7%       3.03 =C2=B1  3%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.stddev
>>>>>>>>        0.00 =C2=B1141%  +2.9e+06%      11.02 =C2=B1 29%
>>>>>>>> sched_debug.cfs_rq:/.removed_load_avg.avg
>>>>>>>>        0.03 =C2=B1141%  +1.3e+06%     432.19 =C2=B1 14%
>>>>>>>> sched_debug.cfs_rq:/.removed_load_avg.max
>>>>>>>>        0.00 =C2=B1141%  +1.7e+06%      60.51 =C2=B1 19%
>>>>>>>> sched_debug.cfs_rq:/.removed_load_avg.stddev
>>>>>>>>        0.00 =C2=B1141%  +2.7e+06%      10.17 =C2=B1 29%
>>>>>>>> sched_debug.cfs_rq:/.removed_util_avg.avg
>>>>>>>>        0.03 =C2=B1141%  +1.2e+06%     408.62 =C2=B1 14%
>>>>>>>> sched_debug.cfs_rq:/.removed_util_avg.max
>>>>>>>>        0.00 =C2=B1141%  +1.6e+06%      56.60 =C2=B1 19%
>>>>>>>> sched_debug.cfs_rq:/.removed_util_avg.stddev
>>>>>>>>        9.15 =C2=B1  2%   +1211.4%     120.00 =C2=B1  9%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.avg
>>>>>>>>       30.43 =C2=B1  9%   +2319.7%     736.38 =C2=B1  9%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.max
>>>>>>>>        4.47 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.min
>>>>>>>>        4.26 =C2=B1  2%   +4373.5%     190.39 =C2=B1  7%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.stddev
>>>>>>>>      -62769 =C2=B1-29%    -249.1%      93587 =C2=B1 24%
>>>>>>>> sched_debug.cfs_rq:/.spread0.avg
>>>>>>>>      149462 =C2=B1 19%     +41.8%     211876 =C2=B1 14%
>>>>>>>> sched_debug.cfs_rq:/.spread0.max
>>>>>>>>     -291684 =C2=B1-11%     -94.1%     -17117 =C2=B1-87%
>>>>>>>> sched_debug.cfs_rq:/.spread0.min
>>>>>>>>       92632 =C2=B1  4%     -42.7%      53106 =C2=B1  7%
>>>>>>>> sched_debug.cfs_rq:/.spread0.stddev
>>>>>>>>      812.83 =C2=B1  2%     -18.5%     662.06 =C2=B1  3%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.avg
>>>>>>>>        1008 =C2=B1  0%     +48.2%       1494 =C2=B1  8%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.max
>>>>>>>>      495.03 =C2=B1 14%     -54.3%     226.14 =C2=B1  3%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.min
>>>>>>>>      123.98 =C2=B1 17%    +103.6%     252.44 =C2=B1  6%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.stddev
>>>>>>>>      982698 =C2=B1  0%     -57.2%     420240 =C2=B1  4%
>>>>>>>> sched_debug.cpu.avg_idle.avg
>>>>>>>>      726070 =C2=B1  4%     -93.5%      47424 =C2=B1 46%
>>>>>>>> sched_debug.cpu.avg_idle.min
>>>>>>>>       54806 =C2=B1 17%    +285.3%     211164 =C2=B1  7%
>>>>>>>> sched_debug.cpu.avg_idle.stddev
>>>>>>>>      313402 =C2=B1  0%     -29.7%     220202 =C2=B1  2% sched_debu=
g.cpu.clock.avg
>>>>>>>>      313450 =C2=B1  0%     -29.7%     220215 =C2=B1  2% sched_debu=
g.cpu.clock.max
>>>>>>>>      313351 =C2=B1  0%     -29.7%     220187 =C2=B1  2% sched_debu=
g.cpu.clock.min
>>>>>>>>       28.21 =C2=B1  9%     -72.9%       7.65 =C2=B1 10%
>>>>>>>> sched_debug.cpu.clock.stddev
>>>>>>>>      313402 =C2=B1  0%     -29.7%     220202 =C2=B1  2%
>>>>>>>> sched_debug.cpu.clock_task.avg
>>>>>>>>      313450 =C2=B1  0%     -29.7%     220215 =C2=B1  2%
>>>>>>>> sched_debug.cpu.clock_task.max
>>>>>>>>      313351 =C2=B1  0%     -29.7%     220187 =C2=B1  2%
>>>>>>>> sched_debug.cpu.clock_task.min
>>>>>>>>       28.21 =C2=B1  9%     -72.9%       7.65 =C2=B1 10%
>>>>>>>> sched_debug.cpu.clock_task.stddev
>>>>>>>>        9.14 =C2=B1  3%    +938.7%      94.99 =C2=B1 11%
>>>>>>>> sched_debug.cpu.cpu_load[0].avg
>>>>>>>>       30.60 =C2=B1 10%   +2355.2%     751.29 =C2=B1  5%
>>>>>>>> sched_debug.cpu.cpu_load[0].max
>>>>>>>>        4.47 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cpu.cpu_load[0].min
>>>>>>>>        4.27 =C2=B1  2%   +3974.1%     174.13 =C2=B1  7%
>>>>>>>> sched_debug.cpu.cpu_load[0].stddev
>>>>>>>>       11.26 =C2=B1 19%   +1493.3%     179.38 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[1].avg
>>>>>>>>       78.57 =C2=B1 43%    +882.2%     771.71 =C2=B1  5%
>>>>>>>> sched_debug.cpu.cpu_load[1].max
>>>>>>>>       12.46 =C2=B1 51%   +1510.5%     200.73 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[1].stddev
>>>>>>>>       10.72 =C2=B1 14%   +1531.0%     174.82 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[2].avg
>>>>>>>>       65.97 =C2=B1 21%    +939.0%     685.38 =C2=B1  6%
>>>>>>>> sched_debug.cpu.cpu_load[2].max
>>>>>>>>        4.50 =C2=B1 22%     +37.6%       6.19 =C2=B1 21%
>>>>>>>> sched_debug.cpu.cpu_load[2].min
>>>>>>>>       10.00 =C2=B1 34%   +1618.8%     171.82 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[2].stddev
>>>>>>>>       10.20 =C2=B1 10%   +1571.8%     170.55 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[3].avg
>>>>>>>>       54.53 =C2=B1  1%    +987.1%     592.81 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[3].max
>>>>>>>>        4.57 =C2=B1 20%    +101.3%       9.19 =C2=B1 24%
>>>>>>>> sched_debug.cpu.cpu_load[3].min
>>>>>>>>        7.90 =C2=B1 21%   +1707.9%     142.78 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[3].stddev
>>>>>>>>        9.78 =C2=B1  7%   +1609.8%     167.16 =C2=B1  1%
>>>>>>>> sched_debug.cpu.cpu_load[4].avg
>>>>>>>>       41.93 =C2=B1  8%   +1118.3%     510.86 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[4].max
>>>>>>>>        4.63 =C2=B1 20%    +166.2%      12.33 =C2=B1 26%
>>>>>>>> sched_debug.cpu.cpu_load[4].min
>>>>>>>>        6.14 =C2=B1 15%   +1765.6%     114.47 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[4].stddev
>>>>>>>>       18022 =C2=B1  3%     -56.7%       7803 =C2=B1 10%
>>>>>>>> sched_debug.cpu.curr->pid.avg
>>>>>>>>       20735 =C2=B1  0%     -13.0%      18049 =C2=B1  0%
>>>>>>>> sched_debug.cpu.curr->pid.max
>>>>>>>>        4933 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cpu.curr->pid.min
>>>>>>>>        3449 =C2=B1  3%    +136.8%       8168 =C2=B1  3%
>>>>>>>> sched_debug.cpu.curr->pid.stddev
>>>>>>>>       12358 =C2=B1 10%   +2281.6%     294330 =C2=B1  7% sched_debu=
g.cpu.load.avg
>>>>>>>>       80177 =C2=B1 80%   +1695.8%    1439829 =C2=B1 24% sched_debu=
g.cpu.load.max
>>>>>>>>        5383 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1% sched_debu=
g.cpu.load.min
>>>>>>>>       12027 =C2=B1 72%   +3401.2%     421111 =C2=B1 10% sched_debu=
g.cpu.load.stddev
>>>>>>>>      254203 =C2=B1  0%     -32.7%     171120 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.avg
>>>>>>>>      259100 =C2=B1  0%     -30.5%     180126 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.max
>>>>>>>>      249692 =C2=B1  0%     -34.7%     162940 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.min
>>>>>>>>        2423 =C2=B1  2%    +160.1%       6304 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.stddev
>>>>>>>>        0.47 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cpu.nr_running.min
>>>>>>>>        0.42 =C2=B1 22%     +42.6%       0.59 =C2=B1 10%
>>>>>>>> sched_debug.cpu.nr_running.stddev
>>>>>>>>       14938 =C2=B1  3%   +3239.8%     498931 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.avg
>>>>>>>>       91655 =C2=B1 10%    +499.6%     549576 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.max
>>>>>>>>        3516 =C2=B1  3%  +12749.6%     451805 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.min
>>>>>>>>       17448 =C2=B1  8%    +105.0%      35768 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.stddev
>>>>>>>>        0.00 =C2=B1 81%  +43995.2%       0.50 =C2=B1 10%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.avg
>>>>>>>>        6.50 =C2=B1 10%  +38104.4%       2483 =C2=B1  1%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.max
>>>>>>>>      -19.30 =C2=B1-23%  +12566.7%      -2444 =C2=B1 -2%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.min
>>>>>>>>        3.80 =C2=B1  2%  +57355.5%       2185 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.stddev
>>>>>>>>       15341 =C2=B1  4%   +3155.1%     499372 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.avg
>>>>>>>>       92611 =C2=B1 11%    +537.2%     590150 =C2=B1  7%
>>>>>>>> sched_debug.cpu.sched_count.max
>>>>>>>>        3410 =C2=B1  5%  +13156.9%     452059 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.min
>>>>>>>>       18186 =C2=B1  9%    +102.9%      36899 =C2=B1  5%
>>>>>>>> sched_debug.cpu.sched_count.stddev
>>>>>>>>        1499 =C2=B1  5%  +12195.5%     184417 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.avg
>>>>>>>>        6462 =C2=B1  3%   +3101.8%     206908 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.max
>>>>>>>>      462.57 =C2=B1  2%  +34779.3%     161340 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.min
>>>>>>>>        1063 =C2=B1  7%   +1457.4%      16556 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.stddev
>>>>>>>>        6820 =C2=B1  3%   +3714.4%     260157 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.avg
>>>>>>>>       44755 =C2=B1 11%    +535.6%     284465 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.max
>>>>>>>>        1365 =C2=B1  9%  +17285.7%     237459 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.min
>>>>>>>>        8587 =C2=B1  9%    +105.9%      17678 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.stddev
>>>>>>>>        4993 =C2=B1  4%   +1002.1%      55032 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.avg
>>>>>>>>       42198 =C2=B1  8%     +41.4%      59677 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.max
>>>>>>>>      713.23 =C2=B1  9%   +6994.9%      50603 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.min
>>>>>>>>        8336 =C2=B1  8%     -67.6%       2699 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.stddev
>>>>>>>>      313348 =C2=B1  0%     -29.7%     220186 =C2=B1  2% sched_debu=
g.cpu_clk
>>>>>>>>      309751 =C2=B1  0%     -29.9%     217158 =C2=B1  2%  sched_deb=
ug.ktime
>>>>>>>>        0.10 =C2=B1  0%     +42.9%       0.14 =C2=B1  0%
>>>>>>>> sched_debug.rt_rq:/.rt_nr_running.max
>>>>>>>>        0.01 =C2=B1 16%     +42.9%       0.02 =C2=B1 16%
>>>>>>>> sched_debug.rt_rq:/.rt_nr_running.stddev
>>>>>>>>      313348 =C2=B1  0%     -29.7%     220186 =C2=B1  2% sched_debu=
g.sched_clk
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> ******************************************************************=
*********************************
>>>>>>>>
>>>>>>>> lkp-hsw-ep2: 72 threads Brickland Haswell-EP with 128G memory
>>>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>>>
>>>>>>>> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/t=
est/testcase:
>>>>>>>>
>>>>>>>> gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/=
8T/lkp-hsw-ep2/anon-w-seq/vm-scalability
>>>>>>>>
>>>>>>>> commit:
>>>>>>>>    v4.7-rc7
>>>>>>>>    8296d37010 ("Speeds up clearing huge pages using work queue")
>>>>>>>>
>>>>>>>>          v4.7-rc7 8296d3701014cd804bf981b5e2
>>>>>>>> ---------------- --------------------------
>>>>>>>>         fail:runs  %reproduction    fail:runs
>>>>>>>>             |             |             |
>>>>>>>>           %stddev     %change         %stddev
>>>>>>>>               \          |                \
>>>>>>>>        0.03 =C2=B1 20%     -70.6%       0.01 =C2=B1  2% vm-scalabi=
lity.stddev
>>>>>>>>    35657782 =C2=B1  0%     +45.6%   51931484 =C2=B1  0% vm-scalabi=
lity.throughput
>>>>>>>>      572.79 =C2=B1  0%     -31.1%     394.69 =C2=B1  0%
>>>>>>>> vm-scalability.time.elapsed_time
>>>>>>>>      572.79 =C2=B1  0%     -31.1%     394.69 =C2=B1  0%
>>>>>>>> vm-scalability.time.elapsed_time.max
>>>>>>>>      328341 =C2=B1  0%   +3328.2%   11256045 =C2=B1  0%
>>>>>>>> vm-scalability.time.involuntary_context_switches
>>>>>>>>        6719 =C2=B1  0%     -59.6%       2715 =C2=B1  0%
>>>>>>>> vm-scalability.time.percent_of_cpu_this_job_got
>>>>>>>>       18939 =C2=B1  0%     -84.7%       2897 =C2=B1  0%
>>>>>>>> vm-scalability.time.system_time
>>>>>>>>       19554 =C2=B1  0%     -60.0%       7821 =C2=B1  0%
>>>>>>>> vm-scalability.time.user_time
>>>>>>>>       41413 =C2=B1  0%  +26399.0%   10974014 =C2=B1  0%
>>>>>>>> vm-scalability.time.voluntary_context_switches
>>>>>>>>        3201 =C2=B1 70%    +118.5%       6996 =C2=B1 29%
>>>>>>>> numa-numastat.node1.numa_foreign
>>>>>>>>        3201 =C2=B1 70%    +118.5%       6996 =C2=B1 29%
>>>>>>>> numa-numastat.node1.numa_miss
>>>>>>>>      611.78 =C2=B1  0%     -29.1%     433.60 =C2=B1  0%  uptime.bo=
ot
>>>>>>>>        5217 =C2=B1  0%     +92.8%      10060 =C2=B1  0%  uptime.id=
le
>>>>>>>>        4266 =C2=B1  8%   +4762.3%     207457 =C2=B1  0%  vmstat.sy=
stem.cs
>>>>>>>>       73766 =C2=B1  0%     +11.8%      82478 =C2=B1  0%  vmstat.sy=
stem.in
>>>>>>>>    26142997 =C2=B1  0%     +11.8%   29217123 =C2=B1  1% meminfo.An=
onHugePages
>>>>>>>>       16939 =C2=B1  0%     +38.2%      23407 =C2=B1  0% meminfo.Ke=
rnelStack
>>>>>>>>       57079 =C2=B1  0%     +10.9%      63312 =C2=B1  1% meminfo.Pa=
geTables
>>>>>>>>       12857 =C2=B1  2%     -22.5%       9965 =C2=B1  2%  softirqs.=
NET_RX
>>>>>>>>     3500329 =C2=B1  2%     +59.3%    5576495 =C2=B1  0%  softirqs.=
RCU
>>>>>>>>      254266 =C2=B1  7%   +1879.7%    5033646 =C2=B1  0%  softirqs.=
SCHED
>>>>>>>>    19643831 =C2=B1  0%     -44.4%   10917987 =C2=B1  0%  softirqs.=
TIMER
>>>>>>>>    13096655 =C2=B1  0%     +18.8%   15558240 =C2=B1  5%
>>>>>>>> numa-meminfo.node0.AnonHugePages
>>>>>>>>       10091 =C2=B1  1%     +29.4%      13061 =C2=B1  2%
>>>>>>>> numa-meminfo.node0.KernelStack
>>>>>>>>       28546 =C2=B1  2%     +16.4%      33229 =C2=B1  5%
>>>>>>>> numa-meminfo.node0.PageTables
>>>>>>>>    13486519 =C2=B1  0%     +17.3%   15818216 =C2=B1  4%
>>>>>>>> numa-meminfo.node1.AnonHugePages
>>>>>>>>        6843 =C2=B1  2%     +51.0%      10335 =C2=B1  3%
>>>>>>>> numa-meminfo.node1.KernelStack
>>>>>>>>        8600 =C2=B1 30%     +22.9%      10566 =C2=B1 25% numa-memin=
fo.node1.Mapped
>>>>>>>>       29398 =C2=B1  1%     +16.8%      34329 =C2=B1  3%
>>>>>>>> numa-meminfo.node1.PageTables
>>>>>>>>        6390 =C2=B1  0%     +18.2%       7551 =C2=B1  6%
>>>>>>>> numa-vmstat.node0.nr_anon_transparent_hugepages
>>>>>>>>      630.33 =C2=B1  1%     +29.5%     816.00 =C2=B1  3%
>>>>>>>> numa-vmstat.node0.nr_kernel_stack
>>>>>>>>        7136 =C2=B1  1%     +15.8%       8263 =C2=B1  6%
>>>>>>>> numa-vmstat.node0.nr_page_table_pages
>>>>>>>>        6625 =C2=B1  0%     +16.0%       7683 =C2=B1  5%
>>>>>>>> numa-vmstat.node1.nr_anon_transparent_hugepages
>>>>>>>>      427.33 =C2=B1  2%     +50.8%     644.33 =C2=B1  3%
>>>>>>>> numa-vmstat.node1.nr_kernel_stack
>>>>>>>>        2156 =C2=B1 30%     +22.6%       2644 =C2=B1 25% numa-vmsta=
t.node1.nr_mapped
>>>>>>>>        7390 =C2=B1  2%     +15.6%       8542 =C2=B1  5%
>>>>>>>> numa-vmstat.node1.nr_page_table_pages
>>>>>>>>       12871 =C2=B1  0%     +11.3%      14329 =C2=B1  0%
>>>>>>>> proc-vmstat.nr_anon_transparent_hugepages
>>>>>>>>        1058 =C2=B1  0%     +38.2%       1461 =C2=B1  0% proc-vmsta=
t.nr_kernel_stack
>>>>>>>>       19143 =C2=B1  0%     -98.3%     317.00 =C2=B1 16%
>>>>>>>> proc-vmstat.numa_hint_faults
>>>>>>>>       15441 =C2=B1  1%     -98.3%     260.67 =C2=B1 15%
>>>>>>>> proc-vmstat.numa_hint_faults_local
>>>>>>>>     6677608 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> proc-vmstat.numa_huge_pte_updates
>>>>>>>>        3632 =C2=B1  3%     -99.6%      13.00 =C2=B1 22%
>>>>>>>> proc-vmstat.numa_pages_migrated
>>>>>>>>   3.424e+09 =C2=B1  0%    -100.0%     328.33 =C2=B1 15%
>>>>>>>> proc-vmstat.numa_pte_updates
>>>>>>>>        3632 =C2=B1  3%     -99.6%      13.00 =C2=B1 22%
>>>>>>>> proc-vmstat.pgmigrate_success
>>>>>>>>       93.71 =C2=B1  0%     -18.8%      76.04 =C2=B1  0%  turbostat=
.%Busy
>>>>>>>>        2617 =C2=B1  0%     -18.8%       2124 =C2=B1  0%  turbostat=
.Avg_MHz
>>>>>>>>        3.36 =C2=B1  3%    +540.7%      21.55 =C2=B1  0%  turbostat=
.CPU%c1
>>>>>>>>        0.02 =C2=B1  0%   +3366.7%       0.69 =C2=B1  0%  turbostat=
.CPU%c3
>>>>>>>>        2.91 =C2=B1  4%     -41.2%       1.71 =C2=B1  1%  turbostat=
.CPU%c6
>>>>>>>>        0.87 =C2=B1  9%     -65.8%       0.30 =C2=B1  3%  turbostat=
.Pkg%pc2
>>>>>>>>      265.69 =C2=B1  0%      +4.3%     277.20 =C2=B1  0%  turbostat=
.PkgWatt
>>>>>>>>      143.43 =C2=B1  0%      -1.6%     141.08 =C2=B1  0%  turbostat=
.RAMWatt
>>>>>>>>     1337329 =C2=B1 16%  +51788.7%  6.939e+08 =C2=B1  0% cpuidle.C1=
-HSW.time
>>>>>>>>       87931 =C2=B1 23%  +10151.1%    9013901 =C2=B1  0% cpuidle.C1=
-HSW.usage
>>>>>>>>     5560533 =C2=B1 10%  +12553.8%  7.036e+08 =C2=B1  0% cpuidle.C1=
E-HSW.time
>>>>>>>>       19568 =C2=B1  7%  +39448.8%    7738917 =C2=B1  0% cpuidle.C1=
E-HSW.usage
>>>>>>>>    16491714 =C2=B1  1%  +17911.8%   2.97e+09 =C2=B1  0% cpuidle.C3=
-HSW.time
>>>>>>>>       49321 =C2=B1  1%  +23837.4%   11806348 =C2=B1  0% cpuidle.C3=
-HSW.usage
>>>>>>>>     2735962 =C2=B1  3%     +82.5%    4992792 =C2=B1  0% cpuidle.C6=
-HSW.usage
>>>>>>>>     3336982 =C2=B1 19%    +299.4%   13327904 =C2=B1  1%  cpuidle.P=
OLL.time
>>>>>>>>        1537 =C2=B1 17%   +4546.0%      71408 =C2=B1  1% cpuidle.PO=
LL.usage
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%     670539 =C2=B1  0% latency_st=
ats.hits.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_hug=
e_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%    1429117 =C2=B1  0% latency_st=
ats.hits.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handl=
e_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%    8324214 =C2=B1  0% latency_st=
ats.hits.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_=
mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>      742404 =C2=B1 14%     -86.7%      98838 =C2=B1  0% latency_st=
ats.hits.pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_=
fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      41496 =C2=B1  6% latency_st=
ats.max.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_huge=
_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       15437 =C2=B1 13%     -99.5%      77.00 =C2=B1 28% latency_st=
ats.max.call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_p=
goff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      43960 =C2=B1  2% latency_st=
ats.max.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle=
_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      13836 =C2=B1  4% latency_st=
ats.max.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_m=
m_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  1.464e+09 =C2=B1  0% latency_st=
ats.sum.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do_huge=
_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       23344 =C2=B1 47%     -98.1%     435.00 =C2=B1  6% latency_st=
ats.sum.call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap.vm_mmap_p=
goff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  2.931e+09 =C2=B1  0% latency_st=
ats.sum.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle=
_mm_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%  5.531e+09 =C2=B1  0% latency_st=
ats.sum.flush_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.handle_m=
m_fault.__do_page_fault.do_page_fault.page_fault
>>>>>>>>       21445 =C2=B1  3%     -54.9%       9663 =C2=B1  0%
>>>>>>>> slabinfo.kmalloc-256.active_objs
>>>>>>>>      345.67 =C2=B1  3%     -38.7%     212.00 =C2=B1  2%
>>>>>>>> slabinfo.kmalloc-256.active_slabs
>>>>>>>>       22132 =C2=B1  3%     -38.6%      13593 =C2=B1  2%
>>>>>>>> slabinfo.kmalloc-256.num_objs
>>>>>>>>      345.67 =C2=B1  3%     -38.7%     212.00 =C2=B1  2%
>>>>>>>> slabinfo.kmalloc-256.num_slabs
>>>>>>>>       35878 =C2=B1  0%     +31.6%      47218 =C2=B1  3%
>>>>>>>> slabinfo.kmalloc-32.active_objs
>>>>>>>>       35879 =C2=B1  0%     +31.6%      47218 =C2=B1  3%
>>>>>>>> slabinfo.kmalloc-32.num_objs
>>>>>>>>       14274 =C2=B1  2%     +43.7%      20505 =C2=B1  3%
>>>>>>>> slabinfo.kmalloc-512.active_objs
>>>>>>>>       14469 =C2=B1  1%     +42.6%      20629 =C2=B1  2%
>>>>>>>> slabinfo.kmalloc-512.num_objs
>>>>>>>>        4224 =C2=B1  0%     +12.2%       4742 =C2=B1  0%
>>>>>>>> slabinfo.sighand_cache.active_objs
>>>>>>>>        4270 =C2=B1  0%     +12.1%       4787 =C2=B1  0%
>>>>>>>> slabinfo.sighand_cache.num_objs
>>>>>>>>        1482 =C2=B1  0%     +27.3%       1886 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.active_objs
>>>>>>>>      501.67 =C2=B1  0%     +27.2%     638.33 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.active_slabs
>>>>>>>>        1505 =C2=B1  0%     +27.3%       1916 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.num_objs
>>>>>>>>      501.67 =C2=B1  0%     +27.2%     638.33 =C2=B1  0%
>>>>>>>> slabinfo.task_struct.num_slabs
>>>>>>>>   5.721e+11 =C2=B1  0%      +3.4%  5.915e+11 =C2=B1  0%
>>>>>>>> perf-stat.L1-dcache-load-misses
>>>>>>>>   6.767e+12 =C2=B1  0%     +16.6%   7.89e+12 =C2=B1  0% perf-stat.=
L1-dcache-loads
>>>>>>>>   2.898e+12 =C2=B1  0%      +5.5%  3.058e+12 =C2=B1  0% perf-stat.=
L1-dcache-stores
>>>>>>>>   8.939e+09 =C2=B1  0%    +201.2%  2.692e+10 =C2=B1  0%
>>>>>>>> perf-stat.L1-icache-load-misses
>>>>>>>>   3.817e+09 =C2=B1  0%    +101.6%  7.696e+09 =C2=B1  0% perf-stat.=
LLC-load-misses
>>>>>>>>   1.332e+10 =C2=B1  0%     +95.5%  2.604e+10 =C2=B1  0% perf-stat.=
LLC-loads
>>>>>>>>   4.801e+10 =C2=B1  0%     -37.7%  2.992e+10 =C2=B1  0% perf-stat.=
LLC-store-misses
>>>>>>>>   1.863e+11 =C2=B1  0%     -45.0%  1.025e+11 =C2=B1  0% perf-stat.=
LLC-stores
>>>>>>>>   1.108e+13 =C2=B1  0%      +9.6%  1.214e+13 =C2=B1  0%
>>>>>>>> perf-stat.branch-instructions
>>>>>>>>   8.546e+08 =C2=B1  0%    +449.5%  4.696e+09 =C2=B1  0%
>>>>>>>> perf-stat.branch-load-misses
>>>>>>>>   1.112e+13 =C2=B1  0%      +9.3%  1.216e+13 =C2=B1  0% perf-stat.=
branch-loads
>>>>>>>>   8.867e+08 =C2=B1  2%    +438.9%  4.778e+09 =C2=B1  0% perf-stat.=
branch-misses
>>>>>>>>   3.797e+12 =C2=B1  0%     -44.6%  2.102e+12 =C2=B1  0% perf-stat.=
bus-cycles
>>>>>>>>   5.213e+10 =C2=B1  0%     -27.0%  3.804e+10 =C2=B1  0% perf-stat.=
cache-misses
>>>>>>>>   2.075e+11 =C2=B1  0%     -27.0%  1.515e+11 =C2=B1  0% perf-stat.=
cache-references
>>>>>>>>     2438791 =C2=B1  8%   +3271.1%   82214290 =C2=B1  0% perf-stat.=
context-switches
>>>>>>>>   1.063e+14 =C2=B1  0%     -44.5%  5.894e+13 =C2=B1  0% perf-stat.=
cpu-cycles
>>>>>>>>      109620 =C2=B1  0%   +7027.7%    7813382 =C2=B1  0% perf-stat.=
cpu-migrations
>>>>>>>>   3.539e+08 =C2=B1 12%    +225.6%  1.152e+09 =C2=B1 24% perf-stat.=
dTLB-load-misses
>>>>>>>>   6.759e+12 =C2=B1  0%     +16.8%  7.898e+12 =C2=B1  0% perf-stat.=
dTLB-loads
>>>>>>>>   1.316e+08 =C2=B1  4%    +103.2%  2.673e+08 =C2=B1 20% perf-stat.=
dTLB-store-misses
>>>>>>>>   2.895e+12 =C2=B1  0%      +5.7%   3.06e+12 =C2=B1  0% perf-stat.=
dTLB-stores
>>>>>>>>   1.294e+08 =C2=B1  1%      +6.3%  1.375e+08 =C2=B1  0% perf-stat.=
iTLB-load-misses
>>>>>>>>    47846677 =C2=B1  2%    +971.0%  5.124e+08 =C2=B1  0% perf-stat.=
iTLB-loads
>>>>>>>>   3.571e+13 =C2=B1  0%     +10.9%  3.958e+13 =C2=B1  0% perf-stat.=
instructions
>>>>>>>>   5.943e+08 =C2=B1  1%    +386.3%   2.89e+09 =C2=B1  0% perf-stat.=
node-load-misses
>>>>>>>>   3.221e+09 =C2=B1  0%     +50.3%   4.84e+09 =C2=B1  0% perf-stat.=
node-loads
>>>>>>>>   1.069e+08 =C2=B1  1%   +1941.7%  2.182e+09 =C2=B1  0% perf-stat.=
node-store-misses
>>>>>>>>   4.766e+10 =C2=B1  0%     -41.7%  2.779e+10 =C2=B1  0% perf-stat.=
node-stores
>>>>>>>>   8.724e+13 =C2=B1  0%     -44.5%  4.842e+13 =C2=B1  0% perf-stat.=
ref-cycles
>>>>>>>>        1.16 =C2=B1  1%     -37.2%       0.73 =C2=B1  5% perf-profi=
le.cycles-pp.__alloc_pages_nodemask.alloc_pages_vma.do_huge_pmd_anonymous_p=
age.handle_mm_fault.__do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       6.53 =C2=B1  4% perf-profi=
le.cycles-pp.__alloc_workqueue_key.clear_huge_page.do_huge_pmd_anonymous_pa=
ge.handle_mm_fault.__do_page_fault
>>>>>>>>       46.49 =C2=B1  1%     -77.7%      10.39 =C2=B1  2%
>>>>>>>> perf-profile.cycles-pp.__do_page_fault.do_page_fault.page_fault.do=
_unit
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.27 =C2=B1  3% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.__alloc_workqueue_key.clear_h=
uge_page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.65 =C2=B1  4% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.apply_workqueue_attrs.__alloc=
_workqueue_key.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       1.49 =C2=B1  4% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.destroy_workqueue.clear_huge_=
page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.67 =C2=B1  1% perf-profi=
le.cycles-pp.__mutex_lock_slowpath.mutex_lock.pwq_unbound_release_workfn.pr=
ocess_one_work.worker_thread
>>>>>>>>        1.17 =C2=B1  2%     -37.6%       0.73 =C2=B1  4% perf-profi=
le.cycles-pp.alloc_pages_vma.do_huge_pmd_anonymous_page.handle_mm_fault.__d=
o_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.69 =C2=B1  4% perf-profi=
le.cycles-pp.apply_workqueue_attrs.__alloc_workqueue_key.clear_huge_page.do=
_huge_pmd_anonymous_page.handle_mm_fault
>>>>>>>>        1.35 =C2=B1 24%    +995.5%      14.75 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.call_cpuidle.cpu_startup_entry.start_second=
ary
>>>>>>>>        1.81 =C2=B1  1%    +465.3%      10.21 =C2=B1  0% perf-profi=
le.cycles-pp.clear_huge_page.do_huge_pmd_anonymous_page.handle_mm_fault.__d=
o_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       1.66 =C2=B1  1% perf-profi=
le.cycles-pp.clear_mem.process_one_work.worker_thread.kthread.ret_from_fork
>>>>>>>>       44.34 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1% perf-profi=
le.cycles-pp.clear_page_c_e.do_huge_pmd_anonymous_page.handle_mm_fault.__do=
_page_fault.do_page_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      34.13 =C2=B1  1% perf-profi=
le.cycles-pp.clear_page_c_e.process_one_work.worker_thread.kthread.ret_from=
_fork
>>>>>>>>        1.36 =C2=B1 24%   +1028.4%      15.35 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.cpu_startup_entry.start_secondary
>>>>>>>>        1.35 =C2=B1 24%    +995.5%      14.75 =C2=B1  1% perf-profi=
le.cycles-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
>>>>>>>>        1.32 =C2=B1 24%   +1010.6%      14.66 =C2=B1  1% perf-profi=
le.cycles-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_ent=
ry.start_secondary
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.23 =C2=B1  3% perf-profi=
le.cycles-pp.destroy_workqueue.clear_huge_page.do_huge_pmd_anonymous_page.h=
andle_mm_fault.__do_page_fault
>>>>>>>>       48.10 =C2=B1  1%     -76.7%      11.19 =C2=B1  0% perf-profi=
le.cycles-pp.do_huge_pmd_anonymous_page.handle_mm_fault.__do_page_fault.do_=
page_fault.page_fault
>>>>>>>>       46.49 =C2=B1  1%     -77.7%      10.39 =C2=B1  2%
>>>>>>>> perf-profile.cycles-pp.do_page_fault.page_fault.do_unit
>>>>>>>>       95.56 =C2=B1  1%     -57.5%      40.57 =C2=B1  2%
>>>>>>>> perf-profile.cycles-pp.do_unit
>>>>>>>>        1.14 =C2=B1  2%     -37.1%       0.72 =C2=B1  5% perf-profi=
le.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma.=
do_huge_pmd_anonymous_page.handle_mm_fault
>>>>>>>>       46.37 =C2=B1  1%     -77.8%      10.31 =C2=B1  3% perf-profi=
le.cycles-pp.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.do_un=
it
>>>>>>>>        1.31 =C2=B1 23%   +1010.7%      14.59 =C2=B1  1% perf-profi=
le.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_=
startup_entry
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      41.80 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.kthread.ret_from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.28 =C2=B1  3% perf-profi=
le.cycles-pp.mutex_lock.__alloc_workqueue_key.clear_huge_page.do_huge_pmd_a=
nonymous_page.handle_mm_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.66 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_lock.apply_workqueue_attrs.__alloc_workqueue_key.clear_h=
uge_page.do_huge_pmd_anonymous_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       1.50 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_lock.destroy_workqueue.clear_huge_page.do_huge_pmd_anony=
mous_page.handle_mm_fault
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.68 =C2=B1  1% perf-profi=
le.cycles-pp.mutex_lock.pwq_unbound_release_workfn.process_one_work.worker_=
thread.kthread
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.26 =C2=B1  3% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.__alloc=
_workqueue_key.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.64 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.apply_w=
orkqueue_attrs.__alloc_workqueue_key
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       1.46 =C2=B1  4% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.destroy=
_workqueue.clear_huge_page
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.66 =C2=B1  1% perf-profi=
le.cycles-pp.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pwq_unb=
ound_release_workfn.process_one_work
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.01 =C2=B1  3% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.__alloc_workqueue_key
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       2.39 =C2=B1  4% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.apply_workqueue_attrs
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       1.33 =C2=B1  4% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.destroy_workqueue
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.39 =C2=B1  2% perf-profi=
le.cycles-pp.osq_lock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_loc=
k.pwq_unbound_release_workfn
>>>>>>>>       46.49 =C2=B1  1%     -77.6%      10.39 =C2=B1  2%
>>>>>>>> perf-profile.cycles-pp.page_fault.do_unit
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      41.07 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.process_one_work.worker_thread.kthread.ret_=
from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%       3.75 =C2=B1  1% perf-profi=
le.cycles-pp.pwq_unbound_release_workfn.process_one_work.worker_thread.kthr=
ead.ret_from_fork
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      41.80 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.ret_from_fork
>>>>>>>>        1.36 =C2=B1 24%   +1029.9%      15.37 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.start_secondary
>>>>>>>>        0.00 =C2=B1 -1%      +Inf%      41.62 =C2=B1  1%
>>>>>>>> perf-profile.cycles-pp.worker_thread.kthread.ret_from_fork
>>>>>>>>       22409 =C2=B1141%   +1919.1%     452462 =C2=B1 10%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.avg
>>>>>>>>      808103 =C2=B1141%    +328.0%    3458796 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.max
>>>>>>>>      132594 =C2=B1141%    +756.8%    1136087 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.MIN_vruntime.stddev
>>>>>>>>      252239 =C2=B1  0%     -46.8%     134197 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.avg
>>>>>>>>      253927 =C2=B1  0%     -44.9%     139915 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.max
>>>>>>>>      250010 =C2=B1  0%     -48.4%     128892 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.min
>>>>>>>>      805.28 =C2=B1 11%    +476.1%       4639 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.exec_clock.stddev
>>>>>>>>       14443 =C2=B1  5%   +2332.1%     351292 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.load.avg
>>>>>>>>       64695 =C2=B1 73%   +2781.4%    1864129 =C2=B1 16%
>>>>>>>> sched_debug.cfs_rq:/.load.max
>>>>>>>>       10818 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.load.min
>>>>>>>>        8247 =C2=B1 76%   +5737.8%     481497 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.load.stddev
>>>>>>>>       21.17 =C2=B1  7%   +1806.2%     403.63 =C2=B1  1%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.avg
>>>>>>>>      318.43 =C2=B1 40%    +325.9%       1356 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.max
>>>>>>>>       10.13 =C2=B1  9%    +225.2%      32.95 =C2=B1  9%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.min
>>>>>>>>       44.45 =C2=B1 36%    +660.6%     338.08 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.load_avg.stddev
>>>>>>>>       22409 =C2=B1141%   +1919.1%     452462 =C2=B1 10%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.avg
>>>>>>>>      808103 =C2=B1141%    +328.0%    3458798 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.max
>>>>>>>>      132594 =C2=B1141%    +756.8%    1136087 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.max_vruntime.stddev
>>>>>>>>    18128511 =C2=B1  0%     -81.2%    3407497 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.avg
>>>>>>>>    18245060 =C2=B1  0%     -80.8%    3498104 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.max
>>>>>>>>    17989949 =C2=B1  0%     -81.8%    3275951 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.min_vruntime.min
>>>>>>>>        0.90 =C2=B1  2%     -11.6%       0.79 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.avg
>>>>>>>>        1.03 =C2=B1  4%    +148.8%       2.57 =C2=B1 12%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.max
>>>>>>>>        0.77 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.min
>>>>>>>>        0.09 =C2=B1 51%    +596.9%       0.60 =C2=B1  7%
>>>>>>>> sched_debug.cfs_rq:/.nr_running.stddev
>>>>>>>>        1.75 =C2=B1  4%    +332.2%       7.55 =C2=B1  1%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.avg
>>>>>>>>       13.73 =C2=B1  8%     +19.6%      16.43 =C2=B1  6%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.max
>>>>>>>>        2.31 =C2=B1  2%     +37.5%       3.18 =C2=B1  4%
>>>>>>>> sched_debug.cfs_rq:/.nr_spread_over.stddev
>>>>>>>>       12.22 =C2=B1  0%   +1198.9%     158.75 =C2=B1  6%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.avg
>>>>>>>>       28.70 =C2=B1  5%   +2520.7%     752.14 =C2=B1 11%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.max
>>>>>>>>        9.30 =C2=B1 15%     -99.5%       0.05 =C2=B1141%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.min
>>>>>>>>        3.04 =C2=B1 23%   +7174.2%     221.37 =C2=B1  5%
>>>>>>>> sched_debug.cfs_rq:/.runnable_load_avg.stddev
>>>>>>>>        7245 =C2=B1214%   +1622.3%     124785 =C2=B1 17%
>>>>>>>> sched_debug.cfs_rq:/.spread0.avg
>>>>>>>>      123472 =C2=B1 17%     +74.3%     215249 =C2=B1  9%
>>>>>>>> sched_debug.cfs_rq:/.spread0.max
>>>>>>>>     -132172 =C2=B1-31%     -95.1%      -6489 =C2=B1-60%
>>>>>>>> sched_debug.cfs_rq:/.spread0.min
>>>>>>>>      892.46 =C2=B1  2%     -20.6%     708.40 =C2=B1  0%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.avg
>>>>>>>>        1010 =C2=B1  0%     +57.8%       1594 =C2=B1  2%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.max
>>>>>>>>      767.80 =C2=B1 13%     -70.1%     229.67 =C2=B1 11%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.min
>>>>>>>>       59.95 =C2=B1 57%    +387.2%     292.03 =C2=B1  3%
>>>>>>>> sched_debug.cfs_rq:/.util_avg.stddev
>>>>>>>>      971616 =C2=B1  0%     -59.2%     396870 =C2=B1  3%
>>>>>>>> sched_debug.cpu.avg_idle.avg
>>>>>>>>     1000000 =C2=B1  0%     -11.3%     886566 =C2=B1  4%
>>>>>>>> sched_debug.cpu.avg_idle.max
>>>>>>>>      744054 =C2=B1 17%     -93.5%      48437 =C2=B1 25%
>>>>>>>> sched_debug.cpu.avg_idle.min
>>>>>>>>       47455 =C2=B1 27%    +302.2%     190868 =C2=B1  7%
>>>>>>>> sched_debug.cpu.avg_idle.stddev
>>>>>>>>      311238 =C2=B1  0%     -29.1%     220771 =C2=B1  0% sched_debu=
g.cpu.clock.avg
>>>>>>>>      311271 =C2=B1  0%     -29.1%     220783 =C2=B1  0% sched_debu=
g.cpu.clock.max
>>>>>>>>      311199 =C2=B1  0%     -29.1%     220758 =C2=B1  0% sched_debu=
g.cpu.clock.min
>>>>>>>>       21.85 =C2=B1 23%     -66.2%       7.39 =C2=B1  6%
>>>>>>>> sched_debug.cpu.clock.stddev
>>>>>>>>      311238 =C2=B1  0%     -29.1%     220771 =C2=B1  0%
>>>>>>>> sched_debug.cpu.clock_task.avg
>>>>>>>>      311271 =C2=B1  0%     -29.1%     220783 =C2=B1  0%
>>>>>>>> sched_debug.cpu.clock_task.max
>>>>>>>>      311199 =C2=B1  0%     -29.1%     220758 =C2=B1  0%
>>>>>>>> sched_debug.cpu.clock_task.min
>>>>>>>>       21.85 =C2=B1 23%     -66.2%       7.39 =C2=B1  6%
>>>>>>>> sched_debug.cpu.clock_task.stddev
>>>>>>>>       12.23 =C2=B1  0%   +1045.2%     140.11 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[0].avg
>>>>>>>>       28.70 =C2=B1  5%   +2496.2%     745.10 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[0].max
>>>>>>>>        9.30 =C2=B1 15%     -99.5%       0.05 =C2=B1141%
>>>>>>>> sched_debug.cpu.cpu_load[0].min
>>>>>>>>        3.10 =C2=B1 22%   +6762.8%     213.04 =C2=B1  1%
>>>>>>>> sched_debug.cpu.cpu_load[0].stddev
>>>>>>>>       13.05 =C2=B1  3%   +1522.6%     211.82 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[1].avg
>>>>>>>>       58.90 =C2=B1 32%   +1245.6%     792.57 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[1].max
>>>>>>>>        9.30 =C2=B1 15%     -46.7%       4.95 =C2=B1 15%
>>>>>>>> sched_debug.cpu.cpu_load[1].min
>>>>>>>>        7.37 =C2=B1 38%   +2765.4%     211.08 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[1].stddev
>>>>>>>>       12.87 =C2=B1  1%   +1527.9%     209.56 =C2=B1  2%
>>>>>>>> sched_debug.cpu.cpu_load[2].avg
>>>>>>>>       50.80 =C2=B1  8%   +1255.4%     688.52 =C2=B1  2%
>>>>>>>> sched_debug.cpu.cpu_load[2].max
>>>>>>>>        9.33 =C2=B1 15%     -19.4%       7.52 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[2].min
>>>>>>>>        5.98 =C2=B1  1%   +2866.4%     177.52 =C2=B1  2%
>>>>>>>> sched_debug.cpu.cpu_load[2].stddev
>>>>>>>>       12.79 =C2=B1  1%   +1523.4%     207.56 =C2=B1  2%
>>>>>>>> sched_debug.cpu.cpu_load[3].avg
>>>>>>>>       45.87 =C2=B1 27%   +1177.3%     585.86 =C2=B1  3%
>>>>>>>> sched_debug.cpu.cpu_load[3].max
>>>>>>>>        9.47 =C2=B1 15%     +24.2%      11.76 =C2=B1  4%
>>>>>>>> sched_debug.cpu.cpu_load[3].min
>>>>>>>>        5.39 =C2=B1 21%   +2590.3%     145.12 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[3].stddev
>>>>>>>>       12.63 =C2=B1  1%   +1523.4%     205.07 =C2=B1  1%
>>>>>>>> sched_debug.cpu.cpu_load[4].avg
>>>>>>>>       40.67 =C2=B1 28%   +1172.2%     517.38 =C2=B1  0%
>>>>>>>> sched_debug.cpu.cpu_load[4].max
>>>>>>>>        9.47 =C2=B1 15%    +113.8%      20.24 =C2=B1 11%
>>>>>>>> sched_debug.cpu.cpu_load[4].min
>>>>>>>>        4.63 =C2=B1 27%   +2401.7%     115.79 =C2=B1  1%
>>>>>>>> sched_debug.cpu.cpu_load[4].stddev
>>>>>>>>       17502 =C2=B1  1%     -60.3%       6947 =C2=B1  2%
>>>>>>>> sched_debug.cpu.curr->pid.avg
>>>>>>>>       18194 =C2=B1  0%     -11.1%      16177 =C2=B1  0%
>>>>>>>> sched_debug.cpu.curr->pid.max
>>>>>>>>        3163 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cpu.curr->pid.min
>>>>>>>>        2226 =C2=B1 27%    +230.5%       7360 =C2=B1  1%
>>>>>>>> sched_debug.cpu.curr->pid.stddev
>>>>>>>>       15383 =C2=B1  0%   +2134.6%     343744 =C2=B1  5% sched_debu=
g.cpu.load.avg
>>>>>>>>      132690 =C2=B1  1%   +1116.8%    1614549 =C2=B1 11% sched_debu=
g.cpu.load.max
>>>>>>>>       10818 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1% sched_debu=
g.cpu.load.min
>>>>>>>>       15898 =C2=B1  5%   +2824.4%     464941 =C2=B1  3% sched_debu=
g.cpu.load.stddev
>>>>>>>>      500000 =C2=B1  0%     +21.9%     609488 =C2=B1  4%
>>>>>>>> sched_debug.cpu.max_idle_balance_cost.max
>>>>>>>>      261592 =C2=B1  0%     -33.6%     173665 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.avg
>>>>>>>>      265792 =C2=B1  0%     -31.9%     181000 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.max
>>>>>>>>      257853 =C2=B1  0%     -35.0%     167567 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.min
>>>>>>>>        1923 =C2=B1  3%    +144.5%       4701 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_load_updates.stddev
>>>>>>>>        0.93 =C2=B1  3%     -11.5%       0.82 =C2=B1  1%
>>>>>>>> sched_debug.cpu.nr_running.avg
>>>>>>>>        1.93 =C2=B1  8%     +40.4%       2.71 =C2=B1  8%
>>>>>>>> sched_debug.cpu.nr_running.max
>>>>>>>>        0.77 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%
>>>>>>>> sched_debug.cpu.nr_running.min
>>>>>>>>        0.24 =C2=B1  8%    +172.1%       0.65 =C2=B1  7%
>>>>>>>> sched_debug.cpu.nr_running.stddev
>>>>>>>>       16572 =C2=B1  6%   +3037.0%     519887 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.avg
>>>>>>>>       80913 =C2=B1  9%    +597.0%     563953 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.max
>>>>>>>>        3507 =C2=B1  0%  +13837.1%     488782 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_switches.min
>>>>>>>>       16011 =C2=B1  9%     +24.1%      19876 =C2=B1  2%
>>>>>>>> sched_debug.cpu.nr_switches.stddev
>>>>>>>>       -0.00 =C2=B1-141%    -1e+05%       0.47 =C2=B1  1%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.avg
>>>>>>>>       13.77 =C2=B1 26%  +30608.8%       4227 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.max
>>>>>>>>      -12.77 =C2=B1 -4%  +32511.3%      -4163 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.min
>>>>>>>>        4.76 =C2=B1 11%  +80376.7%       3832 =C2=B1  0%
>>>>>>>> sched_debug.cpu.nr_uninterruptible.stddev
>>>>>>>>       16778 =C2=B1  6%   +2999.5%     520032 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.avg
>>>>>>>>       80047 =C2=B1  9%    +615.6%     572844 =C2=B1  1%
>>>>>>>> sched_debug.cpu.sched_count.max
>>>>>>>>        3396 =C2=B1  0%  +14289.2%     488771 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_count.min
>>>>>>>>       16232 =C2=B1  9%     +25.7%      20407 =C2=B1  2%
>>>>>>>> sched_debug.cpu.sched_count.stddev
>>>>>>>>        1645 =C2=B1 12%  +10331.5%     171604 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.avg
>>>>>>>>        9799 =C2=B1 13%   +1875.0%     193536 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.max
>>>>>>>>      369.83 =C2=B1  3%  +41879.6%     155254 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.min
>>>>>>>>        1796 =C2=B1 21%    +477.6%      10377 =C2=B1  0%
>>>>>>>> sched_debug.cpu.sched_goidle.stddev
>>>>>>>>        7732 =C2=B1  7%   +3459.5%     275252 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.avg
>>>>>>>>       38526 =C2=B1  8%    +699.8%     308129 =C2=B1  1%
>>>>>>>> sched_debug.cpu.ttwu_count.max
>>>>>>>>        1447 =C2=B1  0%  +17406.9%     253482 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_count.min
>>>>>>>>        7835 =C2=B1  9%     +99.2%      15610 =C2=B1  3%
>>>>>>>> sched_debug.cpu.ttwu_count.stddev
>>>>>>>>        5418 =C2=B1 14%   +1227.9%      71951 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.avg
>>>>>>>>       35944 =C2=B1 10%    +112.8%      76482 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.max
>>>>>>>>      796.37 =C2=B1  4%   +8288.8%      66805 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.min
>>>>>>>>        7076 =C2=B1 12%     -57.4%       3016 =C2=B1  0%
>>>>>>>> sched_debug.cpu.ttwu_local.stddev
>>>>>>>>      311196 =C2=B1  0%     -29.1%     220757 =C2=B1  0% sched_debu=
g.cpu_clk
>>>>>>>>      308421 =C2=B1  0%     -29.3%     217995 =C2=B1  0%  sched_deb=
ug.ktime
>>>>>>>>        0.10 =C2=B1  0%     +42.9%       0.14 =C2=B1  0%
>>>>>>>> sched_debug.rt_rq:/.rt_nr_running.max
>>>>>>>>        0.01 =C2=B1 15%     +54.2%       0.02 =C2=B1 21%
>>>>>>>> sched_debug.rt_rq:/.rt_nr_running.stddev
>>>>>>>>        0.75 =C2=B1 41%     +64.9%       1.23 =C2=B1 23%
>>>>>>>> sched_debug.rt_rq:/.rt_time.max
>>>>>>>>      311196 =C2=B1  0%     -29.1%     220757 =C2=B1  0% sched_debu=
g.sched_clk
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Xiaolong
>>>>>> -- =

>>>>>> Kishore Pusukuri
>>>>>> Principal Member of Technical Staff | Oracle Corporation.
>>>>>> 951-313-1007 | kishore.kumar.pusukuri(a)oracle.com
>>>>>>
>>>>> >From 3a4365422d594d161c96d967f7bd3384a576f7eb Mon Sep 17 00:00:00 20=
01
>>>>>> From: Kishore Pusukuri <kishore.kumar.pusukuri@oracle.com>
>>>>>> Date: Thu, 14 Jul 2016 20:02:42 -0400
>>>>>> Subject: [PATCH] Speeds up clearing huge pages using work queue
>>>>>>
>>>>>> The idea is to exploit parallelsim available in large multicore
>>>>>> systems such as SPARC T7/M7 to fill a huge page with zeros
>>>>>> using multiple worker threads.
>>>>>>
>>>>>> Signed-off-by: Kishore Kumar Pusukuri <kishore.kumar.pusukuri@orac=
le.com>
>>>>>> Reviewed-by: Dave Kleikamp <dave.kleikamp@oracle.com>
>>>>>> Reviewed-by: Nitin Gupta <nitin.m.gupta@oracle.com>
>>>>>> Reviewed-by: Rob Gardner <rob.gardner@oracle.com>
>>>>>> ---
>>>>>> mm/memory.c |  113 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++
>>>>>> 1 files changed, 113 insertions(+), 0 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>>> index 22e037e..a1e4ca0 100644
>>>>>> --- a/mm/memory.c
>>>>>> +++ b/mm/memory.c
>>>>>> @@ -61,6 +61,8 @@
>>>>>> #include <linux/string.h>
>>>>>> #include <linux/dma-debug.h>
>>>>>> #include <linux/debugfs.h>
>>>>>> +#include <linux/sched.h>
>>>>>> +#include <linux/workqueue.h>
>>>>>>
>>>>>> #include <asm/io.h>
>>>>>> #include <asm/pgalloc.h>
>>>>>> @@ -3779,10 +3781,121 @@ static void clear_gigantic_page(struct page=
 *page,
>>>>>> 		clear_user_highpage(p, addr + i * PAGE_SIZE);
>>>>>> 	}
>>>>>> }
>>>>>> +
>>>>>> +struct clear_huge_page_work {
>>>>>> +	struct work_struct ws;
>>>>>> +	int index;
>>>>>> +	struct page *page;
>>>>>> +	unsigned long addr;
>>>>>> +	unsigned int pages_per_worker;
>>>>>> +	int is_gigantic_page;
>>>>>> +};
>>>>>> +
>>>>>> +static void clear_mem(struct work_struct *work)
>>>>>> +{
>>>>>> +	int i;
>>>>>> +	struct page *p;
>>>>>> +	struct clear_huge_page_work *w =3D (struct clear_huge_page_work *)=
work;
>>>>>> +	unsigned int start, end;
>>>>>> +
>>>>>> +	/* assume total number of pages is divisible by number of workers =
*/
>>>>>> +	start =3D w->index * w->pages_per_worker;
>>>>>> +	end =3D (w->index + 1) * w->pages_per_worker;
>>>>>> +
>>>>>> +	might_sleep();
>>>>>> +	if (w->is_gigantic_page) {
>>>>>> +		p =3D mem_map_offset(w->page, start);
>>>>>> +		for (i =3D start; i < end; i++, p =3D mem_map_next(p, w->page, i)=
) {
>>>>>> +			cond_resched();
>>>>>> +			clear_user_highpage(p, w->addr + (i * PAGE_SIZE));
>>>>>> +		}
>>>>>> +	} else {
>>>>>> +		for (i =3D start; i < end; i++) {
>>>>>> +			cond_resched();
>>>>>> +			clear_user_highpage((w->page + i),
>>>>>> +						w->addr + (i * PAGE_SIZE));
>>>>>> +		}
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>> +/* use work queue to clear huge pages in parallel */
>>>>>> +static int wq_clear_huge_page(struct page *page, unsigned long addr,
>>>>>> +			unsigned int pages_per_huge_page, int num_workers)
>>>>>> +{
>>>>>> +	int i;
>>>>>> +	struct clear_huge_page_work *work;
>>>>>> +	struct workqueue_struct *wq;
>>>>>> +	unsigned int pages_per_worker;
>>>>>> +	int is_gigantic_page =3D 0;
>>>>>> +
>>>>>> +	if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES))
>>>>>> +		is_gigantic_page =3D 1;
>>>>>> +
>>>>>> +	pages_per_worker =3D pages_per_huge_page/num_workers;
>>>>>> +
>>>>>> +	wq =3D alloc_workqueue("wq_clear_huge_page", WQ_UNBOUND, num_worke=
rs);
>>>>>> +	if (!wq)
>>>>>> +		return -1;
>>>>>> +
>>>>>> +	work =3D kcalloc(num_workers, sizeof(*work), GFP_KERNEL);
>>>>>> +	if (!work) {
>>>>>> +		destroy_workqueue(wq);
>>>>>> +		return -ENOMEM;
>>>>>> +	}
>>>>>> +
>>>>>> +	for (i =3D 0; i < num_workers; i++) {
>>>>>> +		INIT_WORK(&work[i].ws, clear_mem);
>>>>>> +		work[i].index =3D i;
>>>>>> +		work[i].page =3D page;
>>>>>> +		work[i].addr =3D addr;
>>>>>> +		work[i].pages_per_worker =3D pages_per_worker;
>>>>>> +		work[i].is_gigantic_page =3D is_gigantic_page;
>>>>>> +		queue_work(wq, &work[i].ws);
>>>>>> +	}
>>>>>> +
>>>>>> +	flush_workqueue(wq);
>>>>>> +	destroy_workqueue(wq);
>>>>>> +
>>>>>> +	kfree(work);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +
>>>>>> +int derive_num_workers(unsigned int pages_per_huge_page)
>>>>>> +{
>>>>>> +	int num_workers;
>>>>>> +	unsigned long huge_page_size;
>>>>>> +
>>>>>> +	huge_page_size =3D pages_per_huge_page * PAGE_SIZE;
>>>>>> +
>>>>>> +	/* less than 8MB */
>>>>>> +	if (huge_page_size < 8*1024*1024)
>>>>>> +		num_workers =3D 2;
>>>>>> +	else	/* 8MB and larger */
>>>>>> +		num_workers =3D 8;
>>>>>> +
>>>>>> +	return num_workers;
>>>>>> +}
>>>>>> +
>>>>>> +
>>>>>> void clear_huge_page(struct page *page,
>>>>>> 		     unsigned long addr, unsigned int pages_per_huge_page)
>>>>>> {
>>>>>> 	int i;
>>>>>> +	int num_workers;
>>>>>> +
>>>>>> +	/* If the number of vCPUs or hardware threads is greater than 16 t=
hen
>>>>>> +	 * use multiple threads to clear huge pages. Although we could also
>>>>>> +	 * consider overall system load as a factor in deciding this, for =
now,
>>>>>> +	 * let us have a simple implementation.
>>>>>> +	 */
>>>>>> +	if (num_online_cpus() >=3D 16) {
>>>>>> +		num_workers =3D derive_num_workers(pages_per_huge_page);
>>>>>> +		if (wq_clear_huge_page(page, addr, pages_per_huge_page,
>>>>>> +			num_workers) =3D=3D 0)
>>>>>> +			return;
>>>>>> +	}
>>>>>>
>>>>>> 	if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
>>>>>> 		clear_gigantic_page(page, addr, pages_per_huge_page);
>>>>>> -- =

>>>>>> 1.7.1
>>>>>>
>>>> -- =

>>>> Kishore Pusukuri
>>>> Principal Member of Technical Staff | Oracle Corporation.
>>>> 951-313-1007 | kishore.kumar.pusukuri(a)oracle.com
>>>>
>> -- =

>> Kishore Pusukuri
>> Principal Member of Technical Staff | Oracle Corporation.
>> 951-313-1007 | kishore.kumar.pusukuri(a)oracle.com
>>

-- =

Kishore Pusukuri
Principal Member of Technical Staff | Oracle Corporation.
951-313-1007 | kishore.kumar.pusukuri(a)oracle.com


--===============5395874677702412701==--

