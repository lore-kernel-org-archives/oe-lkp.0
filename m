Content-Type: multipart/mixed; boundary="===============8684453488228648845=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 795ae7a0de: pixz.throughput -9.1% regression
Date: Tue, 07 Jun 2016 12:48:17 +0800
Message-ID: <20160607044817.GC16057@yexl-desktop>
In-Reply-To: <20160606085307.GB2926@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8684453488228648845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2016 at 04:53:07PM +0800, Ye Xiaolong wrote:
>On Fri, Jun 03, 2016 at 06:21:09PM -0400, Johannes Weiner wrote:
>>On Thu, Jun 02, 2016 at 12:07:06PM -0400, Johannes Weiner wrote:
>>> Hi,
>>> =

>>> On Thu, Jun 02, 2016 at 02:45:07PM +0800, kernel test robot wrote:
>>> > FYI, we noticed pixz.throughput -9.1% regression due to commit:
>>> > =

>>> > commit 795ae7a0de6b834a0cc202aa55c190ef81496665 ("mm: scale kswapd wa=
termarks in proportion to memory")
>>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
>>> > =

>>> > in testcase: pixz
>>> > on test machine: ivb43: 48 threads Ivytown Ivy Bridge-EP with 64G mem=
ory with following parameters: cpufreq_governor=3Dperformance/nr_threads=3D=
100%
>>> =

>>> Xiaolong, thanks for the report.
>>> =

>>> It looks like the regression stems from a change in NUMA placement:
>>
>>Scratch that, I was misreading the test results. It's just fewer
>>allocations in general that happen during the fixed testing time.
>>
>>I'm stumped by this report. All this patch does other than affect page
>>reclaim (which is not involved here) is increase the size of the round
>>robin batches in the fair zone allocator. That should *reduce* work in
>>the page allocator, if anything.
>>
>>But I also keep failing to reproduce this - having tried it on the
>>third machine now - neither pixz nor will-it-scale/page_fault1 give me
>>that -8-9% regression:
>>
>>4.5.0-02574-g3ed3a4f:
>>PIXZ-good.log:throughput: 39908733.604941994
>>PIXZ-good.log:throughput: 37067947.25049969
>>PIXZ-good.log:throughput: 38604938.39131216
>>
>>4.5.0-02575-g795ae7a:
>> PIXZ-bad.log:throughput: 39489120.87179377
>> PIXZ-bad.log:throughput: 39307299.288432725
>> PIXZ-bad.log:throughput: 38795994.3329781
>>
>>Is this reliably reproducible with 3ed3a4f vs 795ae7ay?
>
>Yes, it can be stably reproduced in LKP environment, I've run 3ed3a4f0ddff=
ece9 =

>for 4 times, and 795ae7a0de6b834a0cc202aa55 for 7 times.
>
>3ed3a4f0ddffece9 795ae7a0de6b834a0cc202aa55
>---------------- --------------------------
>       fail:runs  %reproduction    fail:runs
>           |             |             |
>           :4           50%           2:7     kmsg.Spurious_LAPIC_timer_in=
terrupt_on_cpu
>         %stddev     %change         %stddev
>             \          |                \
>  78505362 =C2=B1  0%      -9.2%   71298182 =C2=B1  0%  pixz.throughput
>
>
>>
>>Could I ask you to retry the test with Linus's current head as well as
>>with 795ae7a reverted on top of it? (It's a clean revert.)
>>
>
>Sure, I have queued the test tasks for them, will update the comparison
>once I get the results.

FYI, below is the comparison info between 3ed3a4f, 795ae7ay, v4.7-rc2 and t=
he
revert commit (eaa7f0d).

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/testcase:
  gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/ivb43/p=
ixz

commit: =

  3ed3a4f0ddffece942bb2661924d87be4ce63cb7
  795ae7a0de6b834a0cc202aa55c190ef81496665
  v4.7-rc2
  eaa7f0d7239a9508c616f208527cd34eb10ec90f

3ed3a4f0ddffece9 795ae7a0de6b834a0cc202aa55                   v4.7-rc2 eaa7=
f0d7239a9508c616f20852
---------------- -------------------------- -------------------------- ----=
----------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs  %=
reproduction    fail:runs
           |             |             |             |             |       =
      |             |
           :4           50%           2:7            0%            :3      =
     33%           1:6     kmsg.Spurious_LAPIC_timer_interrupt_on_cpu
           :4            0%            :7            0%            :3      =
     33%           1:6     kmsg.igb#:#:#:exceed_max#second
         %stddev     %change         %stddev     %change         %stddev   =
  %change         %stddev
             \          |                \          |                \     =
     |                \
  78505362 =C2=B1  0%      -9.2%   71298182 =C2=B1  0%     -11.4%   6955476=
5 =C2=B1  0%      -9.4%   71129419 =C2=B1  0%  pixz.throughput
   5586220 =C2=B1  2%      -1.6%    5498492 =C2=B1  2%      +6.4%    594221=
7 =C2=B1  2%      +9.6%    6122002 =C2=B1  0%  pixz.time.involuntary_contex=
t_switches
   6560113 =C2=B1  0%      -0.6%    6518532 =C2=B1  0%      -0.6%    651906=
5 =C2=B1  0%      -1.3%    6475587 =C2=B1  0%  pixz.time.maximum_resident_s=
et_size
   4582198 =C2=B1  2%      -3.6%    4416275 =C2=B1  2%      -9.0%    416764=
5 =C2=B1  4%      -6.7%    4275069 =C2=B1  1%  pixz.time.minor_page_faults
      4530 =C2=B1  0%      +1.0%       4575 =C2=B1  0%      -1.7%       445=
4 =C2=B1  0%      -1.5%       4463 =C2=B1  0%  pixz.time.percent_of_cpu_thi=
s_job_got
     92.03 =C2=B1  0%      +5.6%      97.23 =C2=B1 11%     +30.5%     120.0=
8 =C2=B1  1%     +30.0%     119.61 =C2=B1  0%  pixz.time.system_time
     14911 =C2=B1  0%      +2.1%      15218 =C2=B1  0%      -1.1%      1475=
3 =C2=B1  1%      -1.1%      14743 =C2=B1  0%  pixz.time.user_time
   6586930 =C2=B1  0%      -8.4%    6033444 =C2=B1  1%      -4.4%    629887=
4 =C2=B1  1%      -2.4%    6425814 =C2=B1  0%  pixz.time.voluntary_context_=
switches
   2179703 =C2=B1  4%      +4.8%    2285049 =C2=B1  2%      -7.5%    201516=
2 =C2=B1  3%      -9.9%    1963644 =C2=B1  6%  softirqs.RCU
      2237 =C2=B1  2%      -2.9%       2172 =C2=B1  7%     +21.1%       270=
9 =C2=B1  2%     +18.6%       2653 =C2=B1  2%  uptime.idle
   4582198 =C2=B1  2%      -3.6%    4416275 =C2=B1  2%      -9.0%    416764=
5 =C2=B1  4%      -6.7%    4275069 =C2=B1  1%  time.minor_page_faults
     92.03 =C2=B1  0%      +5.6%      97.23 =C2=B1 11%     +30.5%     120.0=
8 =C2=B1  1%     +30.0%     119.61 =C2=B1  0%  time.system_time
     49869 =C2=B1  1%     -12.6%      43583 =C2=B1  8%     -17.9%      4096=
0 =C2=B1  0%     -16.2%      41807 =C2=B1  1%  vmstat.system.cs
     97890 =C2=B1  1%      -0.0%      97848 =C2=B1  3%      +6.9%     10462=
1 =C2=B1  2%      +7.3%     105000 =C2=B1  1%  vmstat.system.in
    105682 =C2=B1  1%      +0.6%     106297 =C2=B1  1%     -85.6%      1525=
7 =C2=B1  1%     -85.1%      15716 =C2=B1  1%  meminfo.Active(file)
    390126 =C2=B1  0%      -0.2%     389529 =C2=B1  0%     +24.0%     48373=
6 =C2=B1  0%     +23.9%     483288 =C2=B1  0%  meminfo.Inactive
    380750 =C2=B1  0%      -0.2%     380141 =C2=B1  0%     +24.6%     47426=
8 =C2=B1  0%     +24.4%     473841 =C2=B1  0%  meminfo.Inactive(file)
      2401 =C2=B1107%     +76.9%       4247 =C2=B1 79%     -99.8%       5.6=
7 =C2=B1 22%     -99.7%       6.17 =C2=B1 34%  numa-numastat.node0.other_no=
de
   2074670 =C2=B1  2%     -11.3%    1840052 =C2=B1 11%     -20.3%    165366=
1 =C2=B1 14%     -25.6%    1543123 =C2=B1  7%  numa-numastat.node1.local_no=
de
   2081648 =C2=B1  2%     -11.4%    1844923 =C2=B1 11%     -20.6%    165367=
1 =C2=B1 14%     -25.9%    1543128 =C2=B1  7%  numa-numastat.node1.numa_hit
      6977 =C2=B1 36%     -30.2%       4871 =C2=B1 66%     -99.9%      10.3=
3 =C2=B1 19%     -99.9%       4.67 =C2=B1 26%  numa-numastat.node1.other_no=
de
  13061458 =C2=B1 19%      -3.3%   12634644 =C2=B1 24%     +69.6%   2215217=
7 =C2=B1  6%    +100.0%   26127040 =C2=B1 10%  cpuidle.C1-IVT.time
    193807 =C2=B1 15%     +26.8%     245657 =C2=B1 76%    +102.5%     39249=
0 =C2=B1 10%     +91.9%     371904 =C2=B1  5%  cpuidle.C1-IVT.usage
    154.75 =C2=B1 10%     -14.8%     131.86 =C2=B1 15%     -20.1%     123.6=
7 =C2=B1  2%     -19.5%     124.50 =C2=B1 16%  cpuidle.C1E-IVT.usage
 8.866e+08 =C2=B1  2%     -15.6%  7.479e+08 =C2=B1  6%     +26.7%  1.124e+0=
9 =C2=B1  6%     +22.7%  1.088e+09 =C2=B1  3%  cpuidle.C6-IVT.time
     93283 =C2=B1  0%     -13.2%      80988 =C2=B1  3%     +20.5%     11236=
4 =C2=B1  4%     +20.3%     112255 =C2=B1  4%  cpuidle.C6-IVT.usage
   8559466 =C2=B1 20%     -39.3%    5195127 =C2=B1 40%    -100.0%     157.6=
7 =C2=B1 36%     -97.5%     211608 =C2=B1167%  cpuidle.POLL.time
    771388 =C2=B1  9%     -53.4%     359081 =C2=B1 52%    -100.0%      32.6=
7 =C2=B1 15%    -100.0%      22.50 =C2=B1 34%  cpuidle.POLL.usage
     94.35 =C2=B1  0%      +1.0%      95.28 =C2=B1  0%      -1.8%      92.6=
9 =C2=B1  0%      -1.6%      92.88 =C2=B1  0%  turbostat.%Busy
      2824 =C2=B1  0%      +1.0%       2851 =C2=B1  0%      -1.8%       277=
4 =C2=B1  0%      -1.6%       2780 =C2=B1  0%  turbostat.Avg_MHz
      3.57 =C2=B1  3%     -20.9%       2.83 =C2=B1  6%     +16.1%       4.1=
5 =C2=B1  6%      +9.0%       3.89 =C2=B1  1%  turbostat.CPU%c1
      2.07 =C2=B1  3%      -8.8%       1.89 =C2=B1 10%     +52.3%       3.1=
6 =C2=B1  6%     +55.6%       3.23 =C2=B1  6%  turbostat.CPU%c6
    157.67 =C2=B1  0%      -0.7%     156.51 =C2=B1  0%      -1.6%     155.2=
0 =C2=B1  0%      -1.5%     155.38 =C2=B1  0%  turbostat.CorWatt
      0.17 =C2=B1 17%      -2.9%       0.17 =C2=B1 23%    +145.7%       0.4=
3 =C2=B1 26%    +121.0%       0.39 =C2=B1 21%  turbostat.Pkg%pc2
    192.71 =C2=B1  0%      -0.8%     191.15 =C2=B1  0%      -1.5%     189.8=
0 =C2=B1  0%      -1.3%     190.11 =C2=B1  0%  turbostat.PkgWatt
     22.36 =C2=B1  0%      -8.4%      20.49 =C2=B1  0%     -10.1%      20.1=
0 =C2=B1  0%      -8.4%      20.48 =C2=B1  0%  turbostat.RAMWatt
    632.75 =C2=B1  3%      -1.6%     622.43 =C2=B1  3%     -19.4%     510.0=
0 =C2=B1  0%     -19.4%     510.00 =C2=B1  0%  slabinfo.RAW.active_objs
    632.75 =C2=B1  3%      -1.6%     622.43 =C2=B1  3%     -19.4%     510.0=
0 =C2=B1  0%     -19.4%     510.00 =C2=B1  0%  slabinfo.RAW.num_objs
      1512 =C2=B1  1%      -0.6%       1502 =C2=B1  1%    -100.0%       0.0=
0 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  slabinfo.UNIX.active_objs
      1512 =C2=B1  1%      -0.6%       1502 =C2=B1  1%    -100.0%       0.0=
0 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  slabinfo.UNIX.num_objs
    766.50 =C2=B1 10%      +7.5%     823.86 =C2=B1 10%    -100.0%       0.0=
0 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  slabinfo.avc_xperms_node.act=
ive_objs
    766.50 =C2=B1 10%      +7.5%     823.86 =C2=B1 10%    -100.0%       0.0=
0 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  slabinfo.avc_xperms_node.num=
_objs
     13334 =C2=B1  4%      +6.9%      14255 =C2=B1  4%     +11.1%      1481=
7 =C2=B1  5%      +6.8%      14243 =C2=B1  7%  slabinfo.kmalloc-512.num_objs
    357.00 =C2=B1  2%      +0.7%     359.43 =C2=B1  1%     +34.5%     480.3=
3 =C2=B1  0%     +32.5%     473.17 =C2=B1  1%  slabinfo.kmalloc-8192.num_ob=
js
      8080 =C2=B1  3%      +1.9%       8233 =C2=B1  4%     +15.1%       930=
0 =C2=B1  5%     +16.0%       9375 =C2=B1  1%  slabinfo.kmalloc-96.active_o=
bjs
      8125 =C2=B1  3%      +1.9%       8281 =C2=B1  4%     +15.1%       934=
9 =C2=B1  5%     +16.3%       9451 =C2=B1  1%  slabinfo.kmalloc-96.num_objs

Thanks,
Xiaolong

>
>Thanks,
>Xiaolong
>
>>Thanks
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============8684453488228648845==--

