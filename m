Content-Type: multipart/mixed; boundary="===============2091646304661186457=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] fa629d46c4: vm-scalability.throughput 43.5% improvement
Date: Mon, 19 Dec 2016 09:11:55 +0800
Message-ID: <87zijsd8o4.fsf@yhuang-dev.intel.com>
In-Reply-To: <1481825429.2699.19.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2091646304661186457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jeff Layton <jlayton@redhat.com> writes:

> On Mon, 2016-12-05 at 08:52 +0800, kernel test robot wrote:
>> Greeting,
>> =

>> FYI, we noticed a 43.5% improvement of vm-scalability.throughput due to =
commit:
>> =

>> =

>> commit: fa629d46c4da556a77c7b8c7760e734dd88d1f3e ("fs: only set S_VERSIO=
N when updating times if it has been queried")
>> git://git.samba.org/jlayton/linux iversion
>> =

>> in testcase: vm-scalability
>> on test machine: 32 threads Intel(R) Core(TM) i5-2300 CPU @ 2.80GHz with=
 4G memory
>> with following parameters:
>> =

>> 	runtime: 300s
>> 	size: 1T
>> 	test: msync-mt
>> 	cpufreq_governor: performance
>> =

>> test-description: The motivation behind this suite is to exercise functi=
ons and regions of the mm/ of the Linux kernel which are of interest to us.
>> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalabilit=
y.git/
>> =

>> =

>> =

>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>> =

>> =

>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>> =

>> testcase/path_params/tbox_group/run: vm-scalability/300s-1T-msync-mt-per=
formance/lkp-sb02
>> =

>> 142824faf828159d  fa629d46c4da556a77c7b8c776
>> ----------------  --------------------------
>>        fail:runs  %reproduction    fail:runs
>>            |             |             |
>>            :4           25%           1:4     last_state.is_incomplete_r=
un
>>          %stddev      change         %stddev
>>              \          |                \
>> 	              %stddev     %change         %stddev
>>              \          |                \
>>    1920140 =C2=B1  0%     +43.5%    2755159 =C2=B1  0%  vm-scalability.t=
hroughput
>>  7.315e+08 =C2=B1  0%     +42.0%  1.039e+09 =C2=B1  0%  vm-scalability.t=
ime.file_system_outputs
>>    2326217 =C2=B1  3%     +14.4%    2660253 =C2=B1  4%  vm-scalability.t=
ime.involuntary_context_switches
>>       3777 =C2=B1  6%     +71.5%       6478 =C2=B1  2%  vm-scalability.t=
ime.major_page_faults
>>  2.023e+08 =C2=B1  1%     +18.9%  2.405e+08 =C2=B1  0%  vm-scalability.t=
ime.minor_page_faults
>>       1239 =C2=B1  1%     -17.1%       1028 =C2=B1  0%  vm-scalability.t=
ime.system_time
>>     448.56 =C2=B1  0%     +46.6%     657.67 =C2=B1  0%  vm-scalability.t=
ime.user_time
>>  1.338e+08 =C2=B1  1%     -27.8%   96520722 =C2=B1  1%  vm-scalability.t=
ime.voluntary_context_switches
>>  1.097e+08 =C2=B1  1%     +77.4%  1.946e+08 =C2=B1  1%  interrupts.CAL:F=
unction_call_interrupts
>>      800.00 =C2=B1  9%     -41.2%     470.33 =C2=B1 22%  slabinfo.proc_i=
node_cache.active_objs
>>     877.25 =C2=B1  7%     -36.1%     561.00 =C2=B1 21%  slabinfo.proc_in=
ode_cache.num_objs
>>      37662 =C2=B1  4%     +22.0%      45943 =C2=B1  5%  meminfo.Dirty
>>      69585 =C2=B1 21%     -41.9%      40426 =C2=B1  7%  meminfo.Inactive=
(anon)
>>       1695 =C2=B1 17%      -6.1%       1592 =C2=B1 17%  meminfo.Mlocked
>>     413514 =C2=B1  0%     +42.0%     587051 =C2=B1  0%  vmstat.io.bo
>>       2.25 =C2=B1 19%     -55.6%       1.00 =C2=B1  0%  vmstat.memory.bu=
ff
>>     279615 =C2=B1  1%     -27.8%     201810 =C2=B1  1%  vmstat.system.cs
>>     135662 =C2=B1  0%     +71.0%     231976 =C2=B1  1%  vmstat.system.in
>>      65.08 =C2=B1  0%     +10.9%      72.18 =C2=B1  0%  turbostat.%Busy
>>       1909 =C2=B1  0%     +10.8%       2115 =C2=B1  0%  turbostat.Avg_MHz
>>      12.16 =C2=B1  0%     -39.3%       7.38 =C2=B1  1%  turbostat.CPU%c1
>>      21.99 =C2=B1  1%     -10.5%      19.69 =C2=B1  0%  turbostat.CPU%c6
>>      32.35 =C2=B1  0%      +5.6%      34.17 =C2=B1  1%  turbostat.CorWatt
>>      36.37 =C2=B1  0%      +5.5%      38.38 =C2=B1  1%  turbostat.PkgWatt
>> =

>> =

>> =

>>                            vm-scalability.time.user_time
>> =

>>   800 ++----------------------------------------------------------------=
----+
>>       O    O O O O  O                                                   =
    |
>>   700 ++                O O  O O O O  O O O O  O O O O  O O O O  O O O O=
    |
>>   600 ++O                                                               =
    O
>>       |               O                                                 =
    |
>>   500 ++                                                                =
    |
>>       *.*..*.*.*.*..*.*.*.*..*.*.*.*..*.*.*.*..*.*.*.*..*               =
    |
>>   400 ++                                                                =
    |
>>       |                                                                 =
    |
>>   300 ++                                                                =
    |
>>   200 ++                                                                =
    |
>>       |                                                                 =
    |
>>   100 ++                                                                =
    |
>>       |                                                                 =
    |
>>     0 ++----------------------------------------------------------------=
--O-+
>> =

>> =

>>                         vm-scalability.time.file_system_outputs
>> =

>>   1.2e+09 ++O-----------------------------------------------------------=
----+
>>           O   O O  O O O                                                =
    |
>>     1e+09 ++             O O O O O  O O O O O O O O  O O O O O O O O  O =
O   O
>>           |                                                             =
    |
>>           |                                                             =
    |
>>     8e+08 *+*.*.*..*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*..*. .*              =
    |
>>           |                                            *                =
    |
>>     6e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>     4e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>           |                                                             =
    |
>>     2e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>         0 ++------------------------------------------------------------=
--O-+
>> =

>> =

>>                                vm-scalability.throughput
>> =

>>     3e+06 O+--O-O--O-O-O------------------------------------------------=
----+
>>           |                O O O O  O O O O O O O O  O O O O O O O O  O =
O   O
>>   2.5e+06 ++O            O                                              =
    |
>>           |                                                             =
    |
>>           |                                                             =
    |
>>     2e+06 *+*.*.*..*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*..*.*.*              =
    |
>>           |                                                             =
    |
>>   1.5e+06 ++                                                            =
    |
>>           |                                                             =
    |
>>     1e+06 ++                                                            =
    |
>>           |                                                             =
    |
>>           |                                                             =
    |
>>    500000 ++                                                            =
    |
>>           |                                                             =
    |
>>         0 ++------------------------------------------------------------=
--O-+
>> =

>> =

>>                         interrupts.CAL:Function_call_interrupts
>> =

>>   3.5e+08 ++------------------------------------------------------------=
----+
>>           | O                                                           =
    |
>>     3e+08 ++                                                            =
    |
>>           |                                                             =
    |
>>   2.5e+08 O+  O O  O O O O                                              =
    |
>>           |                O O O O                                      =
    |
>>     2e+08 ++                        O O O O O O O O  O O O O O O O O  O =
O   O
>>           |                                                             =
    |
>>   1.5e+08 ++                                                            =
    |
>>           *. .*.*.. .*.*.*.*.*.*.        .*.*.                          =
    |
>>     1e+08 ++*      *             *..*.*.*     *.*.*..*.*.*              =
    |
>>           |                                                             =
    |
>>     5e+07 ++                                                            =
    |
>>           |                                                             =
    |
>>         0 ++------------------------------------------------------------=
--O-+
>> =

>> =

>> 	[*] bisect-good sample
>> 	[O] bisect-bad  sample
>> =

>> =

>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>> =

>> =

>> Thanks,
>> Xiaolong
>
> Hi, I've gotten a couple of these emails recently on a patchset that I'm
> working on but haven't sent upstream for review yet. It's not every day
> that you get a mail that says you improved throughput by 43%.=C2=A0
>
> Could you help me interpret the results here? I'm guessing that this
> patchset allows the kernel to dirty mmapped pages faster?
>
> Also, I've looked at what this test does, and I'm wondering...is this
> simulating some sort of real-world workload? If so, what?

This is a micro-benchmark, I don't think it is simulating some sort of
real-world workload.

Best Regards,
Huang, Ying


--===============2091646304661186457==--

