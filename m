Content-Type: multipart/mixed; boundary="===============7958667224202556499=="
MIME-Version: 1.0
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [f2fs] 4ac912427c: -33.7% aim7.jobs-per-min regression
Date: Wed, 15 Mar 2017 03:22:06 +0800
Message-ID: <20170314192206.GA8729@jaegeuk.local>
In-Reply-To: <20170314085311.GD26669@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7958667224202556499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/14, Ye Xiaolong wrote:
> On 03/14, Chao Yu wrote:
> >On 2017/3/14 3:22, Jaegeuk Kim wrote:
> >> On 03/13, Thorsten Leemhuis wrote:
> >>> @Chao Yu/@Jaegeuk Kim: I'm considering to add this to the regressions
> >>> report for 4.11; or is there a reason why it shouldn't be considered a
> >>> regression? Ciao, Thorsten
> >>
> >> Hi,
> >>
> >> I'm planning to submit f2fs updates for 4.11-rcX including a patch whi=
ch
> >> resolves this issue as well, as I expect.
> >>
> >> https://lkml.org/lkml/2017/3/7/813
> >
> >Sorry for late repay.
> >
> >I expect below patches in Jaegeuk's tree could help to recover the perfo=
rmance
> >as well
> >
> >	f2fs: skip scanning free nid bitmap of full NAT blocks
> >	f2fs: combine nat_bits and free_nid_bitmap cache
> =

> These 2 patches do help recover the performance back. Details as below.
> =

> Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>
> =

> commit:
>   4ac912427c4214d8031d9ad6fbc3bc75e71512df ("f2fs: introduce free nid bit=
map")
>   ced2c7ea8e99b46755a270872cd5ba61c27cffad <=3D parent commit of 4ac91242=
7c
>   c0e39d642e41be12937f4532721fc2538182e264 ("f2fs: combine nat_bits and f=
ree_nid_bitmap cache")

Thank you for testing them.

BTW, I found one missing clear_bit_le conversion from c0e39d642e41b.
I updated the original patch and uploaded it into f2fs.git.

  d00030cf9cd0bb9 ("f2fs: use __set{__clear}_bit_le")
  1382c0f3f9d3f93 ("f2fs: combine nat_bits and free_nid_bitmap cache")

Could you please test the above patches from f2fs.git one more time?
I need to confirm there-in root-cause for next upstream.

Thanks,

> =

> 4ac912427c4214d8 ced2c7ea8e99b46755a270872c c0e39d642e41be12937f453272
> ---------------- -------------------------- --------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>      77863 =C2=B1  0%     +50.8%     117419 =C2=B1  1%     +50.9%     117=
500 =C2=B1  0%  aim7.jobs-per-min
>     231.63 =C2=B1  0%     -33.6%     153.78 =C2=B1  1%     -33.7%     153=
.67 =C2=B1  0%  aim7.time.elapsed_time
>     231.63 =C2=B1  0%     -33.6%     153.78 =C2=B1  1%     -33.7%     153=
.67 =C2=B1  0%  aim7.time.elapsed_time.max
>     896604 =C2=B1  0%     -10.1%     805644 =C2=B1  3%     -20.8%     710=
207 =C2=B1  1%  aim7.time.involuntary_context_switches
>       6240 =C2=B1  0%     -13.3%       5408 =C2=B1  1%     -14.2%       5=
353 =C2=B1  1%  aim7.time.system_time
>    1111357 =C2=B1  3%      -1.3%    1097209 =C2=B1  2%      -7.8%    1024=
716 =C2=B1  0%  aim7.time.voluntary_context_switches
>    5600256 =C2=B1  9%      -9.5%    5066069 =C2=B1  0%      -9.3%    5078=
220 =C2=B1 13%  meminfo.DirectMap2M
>      78738 =C2=B1  8%     +72.1%     135538 =C2=B1  8%     +23.2%      96=
995 =C2=B1  6%  meminfo.Dirty
>     315.50 =C2=B1 12%    +210.8%     980.67 =C2=B1 16%    +123.9%     706=
.40 =C2=B1 22%  meminfo.Writeback
>       1328 =C2=B1 18%    +357.1%       6069 =C2=B1 57%    +231.1%       4=
397 =C2=B1 75%  softirqs.NET_RX
>     669152 =C2=B1  3%      -7.4%     619333 =C2=B1  4%     -14.4%     572=
896 =C2=B1  1%  softirqs.RCU
>     170724 =C2=B1  0%     -25.0%     128030 =C2=B1  2%     -23.0%     131=
531 =C2=B1  4%  softirqs.SCHED
>    2688290 =C2=B1  0%     -13.3%    2331994 =C2=B1  1%     -14.7%    2292=
443 =C2=B1  1%  softirqs.TIMER
>       4948 =C2=B1  3%     +55.6%       7701 =C2=B1  1%     +55.8%       7=
710 =C2=B1  0%  vmstat.io.bo
>      39.00 =C2=B1  2%     +65.8%      64.67 =C2=B1  2%     -52.8%      18=
.40 =C2=B1 30%  vmstat.procs.b
>     171.50 =C2=B1  2%     +94.4%     333.33 =C2=B1  7%     +29.7%     222=
.40 =C2=B1  7%  vmstat.procs.r
>      13425 =C2=B1  1%     +30.6%      17530 =C2=B1  1%     +43.9%      19=
321 =C2=B1 10%  vmstat.system.cs
>      45100 =C2=B1  1%      +5.6%      47642 =C2=B1  1%      +6.3%      47=
957 =C2=B1  0%  vmstat.system.in
>      19068 =C2=B1  0%     +75.8%      33522 =C2=B1  4%     +24.5%      23=
745 =C2=B1  5%  proc-vmstat.nr_dirty
>      80.00 =C2=B1  3%    +195.0%     236.00 =C2=B1 14%    +126.0%     180=
.80 =C2=B1 23%  proc-vmstat.nr_writeback
>      19222 =C2=B1  0%     +76.4%      33907 =C2=B1  4%     +24.9%      24=
004 =C2=B1  5%  proc-vmstat.nr_zone_write_pending
> =

> Thanks,
> Xiaolong
> >
> >Xiaolong, Thorsten
> >
> >Could you help to test these patches?
> >
> >Thanks,
> >
> >>
> >> Thanks,
> >>
> >>>
> >>> On 08.03.2017 02:21, kernel test robot wrote:
> >>>>
> >>>> Greeting,
> >>>>
> >>>> We noticed a -33.7 regression of aim7.jobs-per-min due to commit:
> >>>>
> >>>> commit: 4ac912427c4214d8031d9ad6fbc3bc75e71512df ("f2fs: introduce f=
ree nid bitmap")
> >>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mast=
er
> >>>>
> >>>> in testcase: aim7
> >>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GH=
z with 384G memory
> >>>> with following parameters:
> >>>>
> >>>> 	disk: 1BRD_48G
> >>>> 	fs: f2fs
> >>>> 	test: disk_wrt
> >>>> 	load: 3000
> >>>> 	cpufreq_governor: performance
> >>>>
> >>>> test-description: AIM7 is a traditional UNIX system level benchmark =
suite which is used to test and measure the performance of multiuser system.
> >>>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
> >>>>
> >>>>
> >>>>
> >>>> Details are as below:
> >>>> --------------------------------------------------------------------=
------------------------------>
> >>>>
> >>>>
> >>>> To reproduce:
> >>>>
> >>>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/=
lkp-tests.git
> >>>>         cd lkp-tests
> >>>>         bin/lkp install job.yaml  # job file is attached in this ema=
il
> >>>>         bin/lkp run     job.yaml
> >>>>
> >>>> testcase/path_params/tbox_group/run: aim7/1BRD_48G-f2fs-disk_wrt-300=
0-performance/lkp-ivb-ep01
> >>>>
> >>>> ced2c7ea8e99b467  4ac912427c4214d8031d9ad6fb
> >>>> ----------------  --------------------------
> >>>>          %stddev      change         %stddev
> >>>>              \          |                \
> >>>>     117419 =C2=B1  1%     -33.7%      77863 =C2=B1  0%  aim7.jobs-pe=
r-min
> >>>>     153.78 =C2=B1  1%     +50.6%     231.63 =C2=B1  0%  aim7.time.el=
apsed_time
> >>>>     153.78 =C2=B1  1%     +50.6%     231.63 =C2=B1  0%  aim7.time.el=
apsed_time.max
> >>>>     805644 =C2=B1  3%     +11.3%     896604 =C2=B1  0%  aim7.time.in=
voluntary_context_switches
> >>>>       5408 =C2=B1  1%     +15.4%       6240 =C2=B1  0%  aim7.time.sy=
stem_time
> >>>>    5066069 =C2=B1  0%     +10.5%    5600256 =C2=B1  9%  meminfo.Dire=
ctMap2M
> >>>>     135538 =C2=B1  8%     -41.9%      78738 =C2=B1  8%  meminfo.Dirty
> >>>>     980.67 =C2=B1 16%     -67.8%     315.50 =C2=B1 12%  meminfo.Writ=
eback
> >>>>      71322 =C2=B1 10%     -44.0%      39953 =C2=B1  1%  numa-meminfo=
.node0.Dirty
> >>>>      11158 =C2=B1 18%     -27.1%       8132 =C2=B1  0%  numa-meminfo=
.node0.Mapped
> >>>>      56776 =C2=B1  6%     -32.5%      38309 =C2=B1  0%  numa-meminfo=
.node1.Dirty
> >>>>       9684 =C2=B1 22%     +30.9%      12676 =C2=B1  0%  numa-meminfo=
.node1.Mapped
> >>>>       6069 =C2=B1 57%     -78.1%       1328 =C2=B1 18%  softirqs.NET=
_RX
> >>>>     619333 =C2=B1  4%      +8.0%     669152 =C2=B1  3%  softirqs.RCU
> >>>>     128030 =C2=B1  2%     +33.3%     170724 =C2=B1  0%  softirqs.SCH=
ED
> >>>>    2331994 =C2=B1  1%     +15.3%    2688290 =C2=B1  0%  softirqs.TIM=
ER
> >>>>       7701 =C2=B1  1%     -35.7%       4948 =C2=B1  3%  vmstat.io.bo
> >>>>      64.67 =C2=B1  2%     -39.7%      39.00 =C2=B1  2%  vmstat.procs=
.b
> >>>>     333.33 =C2=B1  7%     -48.5%     171.50 =C2=B1  2%  vmstat.procs=
.r
> >>>>      17530 =C2=B1  1%     -23.4%      13425 =C2=B1  1%  vmstat.syste=
m.cs
> >>>>      47642 =C2=B1  1%      -5.3%      45100 =C2=B1  1%  vmstat.syste=
m.in
> >>>>      33522 =C2=B1  4%     -43.1%      19068 =C2=B1  0%  proc-vmstat.=
nr_dirty
> >>>>     236.00 =C2=B1 14%     -66.1%      80.00 =C2=B1  3%  proc-vmstat.=
nr_writeback
> >>>>      33907 =C2=B1  4%     -43.3%      19222 =C2=B1  0%  proc-vmstat.=
nr_zone_write_pending
> >>>>      28194 =C2=B1 10%     +10.4%      31131 =C2=B1  6%  proc-vmstat.=
pgactivate
> >>>>     746402 =C2=B1  2%     +24.6%     929960 =C2=B1  3%  proc-vmstat.=
pgfault
> >>>>     153.78 =C2=B1  1%     +50.6%     231.63 =C2=B1  0%  time.elapsed=
_time
> >>>>     153.78 =C2=B1  1%     +50.6%     231.63 =C2=B1  0%  time.elapsed=
_time.max
> >>>>     805644 =C2=B1  3%     +11.3%     896604 =C2=B1  0%  time.involun=
tary_context_switches
> >>>>       3524 =C2=B1  0%     -23.4%       2701 =C2=B1  0%  time.percent=
_of_cpu_this_job_got
> >>>>       5408 =C2=B1  1%     +15.4%       6240 =C2=B1  0%  time.system_=
time
> >>>>      12.19 =C2=B1  1%     +36.7%      16.66 =C2=B1  0%  time.user_ti=
me
> >>>>   48260939 =C2=B1  3%     +12.1%   54110616 =C2=B1  2%  cpuidle.C1-I=
VT.time
> >>>>   33149237 =C2=B1  5%     +52.6%   50597349 =C2=B1  1%  cpuidle.C1E-=
IVT.time
> >>>>      89642 =C2=B1  4%     +52.8%     136976 =C2=B1  0%  cpuidle.C1E-=
IVT.usage
> >>>>   13534795 =C2=B1  6%    +276.3%   50934566 =C2=B1 55%  cpuidle.C3-I=
VT.time
> >>>>      42893 =C2=B1  6%    +138.8%     102439 =C2=B1 30%  cpuidle.C3-I=
VT.usage
> >>>>  6.431e+08 =C2=B1  2%    +390.1%  3.152e+09 =C2=B1 10%  cpuidle.C6-I=
VT.time
> >>>>     802009 =C2=B1  2%    +375.3%    3811880 =C2=B1 10%  cpuidle.C6-I=
VT.usage
> >>>>    1535987 =C2=B1  4%    +156.3%    3936830 =C2=B1  4%  cpuidle.POLL=
.time
> >>>>      88.14 =C2=B1  0%     -24.9%      66.17 =C2=B1  3%  turbostat.%B=
usy
> >>>>       2659 =C2=B1  0%     -44.7%       1471 =C2=B1  3%  turbostat.Av=
g_MHz
> >>>>       3016 =C2=B1  0%     -26.3%       2224 =C2=B1  0%  turbostat.Bz=
y_MHz
> >>>>       5.20 =C2=B1  5%    +127.0%      11.80 =C2=B1  2%  turbostat.CP=
U%c1
> >>>>
> >>>>
> >>>>
> >>>>                                 perf-stat.page-faults
> >>>>
> >>>>    1e+06 ++---------------------------------------------------------=
--------+
> >>>>   900000 O+O O   O O  O       O            O O                      =
        |
> >>>>          |     O        O O O   O O O O O          O                =
        |
> >>>>   800000 ++              .*.*.                .*. .*.         .*..  =
        |
> >>>>   700000 ++*.*.*.*.*..*.*     *.*.*.*.*.*..*.*   *   *.*.*.*.*    *.=
*.*.*   *
> >>>>          | :                                                        =
    :   |
> >>>>   600000 ++:                                                        =
    :   |
> >>>>   500000 ++                                                         =
     : :|
> >>>>   400000 ++                                                         =
     : :|
> >>>>          |:                                                         =
     : :|
> >>>>   300000 ++                                                         =
     : :|
> >>>>   200000 ++                                                         =
     : :|
> >>>>          |                                                          =
      : |
> >>>>   100000 ++                                                         =
      : |
> >>>>        0 *+------------------------------------O-O------------------=
------*-+
> >>>>
> >>>>
> >>>>                                perf-stat.minor-faults
> >>>>
> >>>>    1e+06 ++---------------------------------------------------------=
--------+
> >>>>   900000 O+O O   O O  O       O            O O                      =
        |
> >>>>          |     O        O O O   O O O O O          O                =
        |
> >>>>   800000 ++              .*.*.                .*. .*.         .*..  =
        |
> >>>>   700000 ++*.*.*.*.*..*.*     *.*.*.*.*.*..*.*   *   *.*.*.*.*    *.=
*.*.*   *
> >>>>          | :                                                        =
    :   |
> >>>>   600000 ++:                                                        =
    :   |
> >>>>   500000 ++                                                         =
     : :|
> >>>>   400000 ++                                                         =
     : :|
> >>>>          |:                                                         =
     : :|
> >>>>   300000 ++                                                         =
     : :|
> >>>>   200000 ++                                                         =
     : :|
> >>>>          |                                                          =
      : |
> >>>>   100000 ++                                                         =
      : |
> >>>>        0 *+------------------------------------O-O------------------=
------*-+
> >>>>
> >>>>
> >>>>                                   aim7.jobs-per-min
> >>>>
> >>>>   140000 ++---------------------------------------------------------=
--------+
> >>>>          | *.     .*..     .*.*.*.*.*.*.*..*.*.*.*.*.*.             =
        |
> >>>>   120000 ++: *.*.*    *.*.*                            *.*.*.*.*..*.=
*.*.    *
> >>>>          | :                                                        =
    *   |
> >>>>   100000 ++:                                                        =
    :   |
> >>>>          |:                                                         =
    :   |
> >>>>    80000 O+O O O O O  O O O O O O O O O O  O O     O                =
     : :|
> >>>>          |:                                                         =
     : :|
> >>>>    60000 ++                                                         =
     : :|
> >>>>          |:                                                         =
     : :|
> >>>>    40000 ++                                                         =
     : :|
> >>>>          |                                                          =
     : :|
> >>>>    20000 ++                                                         =
      : |
> >>>>          |                                                          =
      : |
> >>>>        0 *+------------------------------------O-O------------------=
------*-+
> >>>>
> >>>>
> >>>>
> >>>> 	[*] bisect-good sample
> >>>> 	[O] bisect-bad  sample
> >>>>
> >>>>
> >>>> Disclaimer:
> >>>> Results have been estimated based on internal Intel analysis and are=
 provided
> >>>> for informational purposes only. Any difference in system hardware o=
r software
> >>>> design or configuration may affect actual performance.
> >>>>
> >>>>
> >>>> Thanks,
> >>>> Xiaolong
> >>>>
> >>
> >> .
> >>
> >

--===============7958667224202556499==--

