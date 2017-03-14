Content-Type: multipart/mixed; boundary="===============4036014148153453605=="
MIME-Version: 1.0
From: Chao Yu <yuchao0@huawei.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [f2fs] 4ac912427c: -33.7% aim7.jobs-per-min regression
Date: Tue, 14 Mar 2017 10:09:47 +0800
Message-ID: <19cd8c99-ed38-7a5a-24c3-ea81acefb395@huawei.com>
In-Reply-To: <20170313192223.GC41055@jaegeuk.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============4036014148153453605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2017/3/14 3:22, Jaegeuk Kim wrote:
> On 03/13, Thorsten Leemhuis wrote:
>> @Chao Yu/@Jaegeuk Kim: I'm considering to add this to the regressions
>> report for 4.11; or is there a reason why it shouldn't be considered a
>> regression? Ciao, Thorsten
> =

> Hi,
> =

> I'm planning to submit f2fs updates for 4.11-rcX including a patch which
> resolves this issue as well, as I expect.
> =

> https://lkml.org/lkml/2017/3/7/813

Sorry for late repay.

I expect below patches in Jaegeuk's tree could help to recover the performa=
nce
as well

	f2fs: skip scanning free nid bitmap of full NAT blocks
	f2fs: combine nat_bits and free_nid_bitmap cache

Xiaolong, Thorsten

Could you help to test these patches?

Thanks,

> =

> Thanks,
> =

>>
>> On 08.03.2017 02:21, kernel test robot wrote:
>>>
>>> Greeting,
>>>
>>> We noticed a -33.7 regression of aim7.jobs-per-min due to commit:
>>>
>>> commit: 4ac912427c4214d8031d9ad6fbc3bc75e71512df ("f2fs: introduce free=
 nid bitmap")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>> in testcase: aim7
>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz w=
ith 384G memory
>>> with following parameters:
>>>
>>> 	disk: 1BRD_48G
>>> 	fs: f2fs
>>> 	test: disk_wrt
>>> 	load: 3000
>>> 	cpufreq_governor: performance
>>>
>>> test-description: AIM7 is a traditional UNIX system level benchmark sui=
te which is used to test and measure the performance of multiuser system.
>>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>>>
>>>
>>>
>>> Details are as below:
>>> -----------------------------------------------------------------------=
--------------------------->
>>>
>>>
>>> To reproduce:
>>>
>>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp=
-tests.git
>>>         cd lkp-tests
>>>         bin/lkp install job.yaml  # job file is attached in this email
>>>         bin/lkp run     job.yaml
>>>
>>> testcase/path_params/tbox_group/run: aim7/1BRD_48G-f2fs-disk_wrt-3000-p=
erformance/lkp-ivb-ep01
>>>
>>> ced2c7ea8e99b467  4ac912427c4214d8031d9ad6fb
>>> ----------------  --------------------------
>>>          %stddev      change         %stddev
>>>              \          |                \
>>>     117419 =C2=B1  1%     -33.7%      77863 =C2=B1  0%  aim7.jobs-per-m=
in
>>>     153.78 =C2=B1  1%     +50.6%     231.63 =C2=B1  0%  aim7.time.elaps=
ed_time
>>>     153.78 =C2=B1  1%     +50.6%     231.63 =C2=B1  0%  aim7.time.elaps=
ed_time.max
>>>     805644 =C2=B1  3%     +11.3%     896604 =C2=B1  0%  aim7.time.invol=
untary_context_switches
>>>       5408 =C2=B1  1%     +15.4%       6240 =C2=B1  0%  aim7.time.syste=
m_time
>>>    5066069 =C2=B1  0%     +10.5%    5600256 =C2=B1  9%  meminfo.DirectM=
ap2M
>>>     135538 =C2=B1  8%     -41.9%      78738 =C2=B1  8%  meminfo.Dirty
>>>     980.67 =C2=B1 16%     -67.8%     315.50 =C2=B1 12%  meminfo.Writeba=
ck
>>>      71322 =C2=B1 10%     -44.0%      39953 =C2=B1  1%  numa-meminfo.no=
de0.Dirty
>>>      11158 =C2=B1 18%     -27.1%       8132 =C2=B1  0%  numa-meminfo.no=
de0.Mapped
>>>      56776 =C2=B1  6%     -32.5%      38309 =C2=B1  0%  numa-meminfo.no=
de1.Dirty
>>>       9684 =C2=B1 22%     +30.9%      12676 =C2=B1  0%  numa-meminfo.no=
de1.Mapped
>>>       6069 =C2=B1 57%     -78.1%       1328 =C2=B1 18%  softirqs.NET_RX
>>>     619333 =C2=B1  4%      +8.0%     669152 =C2=B1  3%  softirqs.RCU
>>>     128030 =C2=B1  2%     +33.3%     170724 =C2=B1  0%  softirqs.SCHED
>>>    2331994 =C2=B1  1%     +15.3%    2688290 =C2=B1  0%  softirqs.TIMER
>>>       7701 =C2=B1  1%     -35.7%       4948 =C2=B1  3%  vmstat.io.bo
>>>      64.67 =C2=B1  2%     -39.7%      39.00 =C2=B1  2%  vmstat.procs.b
>>>     333.33 =C2=B1  7%     -48.5%     171.50 =C2=B1  2%  vmstat.procs.r
>>>      17530 =C2=B1  1%     -23.4%      13425 =C2=B1  1%  vmstat.system.cs
>>>      47642 =C2=B1  1%      -5.3%      45100 =C2=B1  1%  vmstat.system.in
>>>      33522 =C2=B1  4%     -43.1%      19068 =C2=B1  0%  proc-vmstat.nr_=
dirty
>>>     236.00 =C2=B1 14%     -66.1%      80.00 =C2=B1  3%  proc-vmstat.nr_=
writeback
>>>      33907 =C2=B1  4%     -43.3%      19222 =C2=B1  0%  proc-vmstat.nr_=
zone_write_pending
>>>      28194 =C2=B1 10%     +10.4%      31131 =C2=B1  6%  proc-vmstat.pga=
ctivate
>>>     746402 =C2=B1  2%     +24.6%     929960 =C2=B1  3%  proc-vmstat.pgf=
ault
>>>     153.78 =C2=B1  1%     +50.6%     231.63 =C2=B1  0%  time.elapsed_ti=
me
>>>     153.78 =C2=B1  1%     +50.6%     231.63 =C2=B1  0%  time.elapsed_ti=
me.max
>>>     805644 =C2=B1  3%     +11.3%     896604 =C2=B1  0%  time.involuntar=
y_context_switches
>>>       3524 =C2=B1  0%     -23.4%       2701 =C2=B1  0%  time.percent_of=
_cpu_this_job_got
>>>       5408 =C2=B1  1%     +15.4%       6240 =C2=B1  0%  time.system_time
>>>      12.19 =C2=B1  1%     +36.7%      16.66 =C2=B1  0%  time.user_time
>>>   48260939 =C2=B1  3%     +12.1%   54110616 =C2=B1  2%  cpuidle.C1-IVT.=
time
>>>   33149237 =C2=B1  5%     +52.6%   50597349 =C2=B1  1%  cpuidle.C1E-IVT=
.time
>>>      89642 =C2=B1  4%     +52.8%     136976 =C2=B1  0%  cpuidle.C1E-IVT=
.usage
>>>   13534795 =C2=B1  6%    +276.3%   50934566 =C2=B1 55%  cpuidle.C3-IVT.=
time
>>>      42893 =C2=B1  6%    +138.8%     102439 =C2=B1 30%  cpuidle.C3-IVT.=
usage
>>>  6.431e+08 =C2=B1  2%    +390.1%  3.152e+09 =C2=B1 10%  cpuidle.C6-IVT.=
time
>>>     802009 =C2=B1  2%    +375.3%    3811880 =C2=B1 10%  cpuidle.C6-IVT.=
usage
>>>    1535987 =C2=B1  4%    +156.3%    3936830 =C2=B1  4%  cpuidle.POLL.ti=
me
>>>      88.14 =C2=B1  0%     -24.9%      66.17 =C2=B1  3%  turbostat.%Busy
>>>       2659 =C2=B1  0%     -44.7%       1471 =C2=B1  3%  turbostat.Avg_M=
Hz
>>>       3016 =C2=B1  0%     -26.3%       2224 =C2=B1  0%  turbostat.Bzy_M=
Hz
>>>       5.20 =C2=B1  5%    +127.0%      11.80 =C2=B1  2%  turbostat.CPU%c1
>>>
>>>
>>>
>>>                                 perf-stat.page-faults
>>>
>>>    1e+06 ++------------------------------------------------------------=
-----+
>>>   900000 O+O O   O O  O       O            O O                         =
     |
>>>          |     O        O O O   O O O O O          O                   =
     |
>>>   800000 ++              .*.*.                .*. .*.         .*..     =
     |
>>>   700000 ++*.*.*.*.*..*.*     *.*.*.*.*.*..*.*   *   *.*.*.*.*    *.*.*=
.*   *
>>>          | :                                                           =
 :   |
>>>   600000 ++:                                                           =
 :   |
>>>   500000 ++                                                            =
  : :|
>>>   400000 ++                                                            =
  : :|
>>>          |:                                                            =
  : :|
>>>   300000 ++                                                            =
  : :|
>>>   200000 ++                                                            =
  : :|
>>>          |                                                             =
   : |
>>>   100000 ++                                                            =
   : |
>>>        0 *+------------------------------------O-O---------------------=
---*-+
>>>
>>>
>>>                                perf-stat.minor-faults
>>>
>>>    1e+06 ++------------------------------------------------------------=
-----+
>>>   900000 O+O O   O O  O       O            O O                         =
     |
>>>          |     O        O O O   O O O O O          O                   =
     |
>>>   800000 ++              .*.*.                .*. .*.         .*..     =
     |
>>>   700000 ++*.*.*.*.*..*.*     *.*.*.*.*.*..*.*   *   *.*.*.*.*    *.*.*=
.*   *
>>>          | :                                                           =
 :   |
>>>   600000 ++:                                                           =
 :   |
>>>   500000 ++                                                            =
  : :|
>>>   400000 ++                                                            =
  : :|
>>>          |:                                                            =
  : :|
>>>   300000 ++                                                            =
  : :|
>>>   200000 ++                                                            =
  : :|
>>>          |                                                             =
   : |
>>>   100000 ++                                                            =
   : |
>>>        0 *+------------------------------------O-O---------------------=
---*-+
>>>
>>>
>>>                                   aim7.jobs-per-min
>>>
>>>   140000 ++------------------------------------------------------------=
-----+
>>>          | *.     .*..     .*.*.*.*.*.*.*..*.*.*.*.*.*.                =
     |
>>>   120000 ++: *.*.*    *.*.*                            *.*.*.*.*..*.*.*=
.    *
>>>          | :                                                           =
 *   |
>>>   100000 ++:                                                           =
 :   |
>>>          |:                                                            =
 :   |
>>>    80000 O+O O O O O  O O O O O O O O O O  O O     O                   =
  : :|
>>>          |:                                                            =
  : :|
>>>    60000 ++                                                            =
  : :|
>>>          |:                                                            =
  : :|
>>>    40000 ++                                                            =
  : :|
>>>          |                                                             =
  : :|
>>>    20000 ++                                                            =
   : |
>>>          |                                                             =
   : |
>>>        0 *+------------------------------------O-O---------------------=
---*-+
>>>
>>>
>>>
>>> 	[*] bisect-good sample
>>> 	[O] bisect-bad  sample
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
>>> Xiaolong
>>>
> =

> .
> =



--===============4036014148153453605==--

