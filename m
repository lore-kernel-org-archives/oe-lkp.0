Content-Type: multipart/mixed; boundary="===============2279273524573789699=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] df387eae80: blogbench.write_score -59% regression
Date: Sat, 04 Feb 2017 12:49:58 +0800
Message-ID: <20170204044958.GR17561@yexl-desktop>
In-Reply-To: <20170203085904.GA27528@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2279273524573789699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/03, Christoph Hellwig wrote:
>On Fri, Feb 03, 2017 at 04:51:40PM +0800, Ye Xiaolong wrote:
>> >do you also have numbers for the whole branch?  Or should I reorder
>> =

>> Do you mean test data for 7f7bfe47 (xfs: wait for discards before retryi=
ng an allocation due to busy extents) ?
>> I'll need to check whether 0day bot has launched test for it or not.
>
>Actually the interesting number would be for
>57c621ce ("xfs: don't block the log commit handler for discards")
>compared to both the baseline and df387eae80 which was tested here.

I notice that commit id for ("xfs: don't block the log commit handler for d=
iscards")
is actually e5534755e49563f4b2828e1214 on your branch xfs-async-discard.5, =
here
is the comparison for the three. (baseline, df387eae80, e5534755). Seems it=
 restored
performance back a lot, though it still has -15% regression compared to bas=
eline.


testcase/path_params/tbox_group/run: blogbench/1SSD-xfs-performance/lkp-bdw=
-de1

0db1bbdf1b712052  df387eae801490e939f31eab47  e5534755e49563f4b2828e1214  =

----------------  --------------------------  --------------------------  =

     11657             -59%       4762             -15%       9958        b=
logbench.write_score
      1116              24%       1384              -3%       1077        b=
logbench.time.system_time
       391              24%        486              -4%        377        b=
logbench.time.percent_of_cpu_this_job_got
  82650928             -57%   35726988             -15%   70630277        b=
logbench.time.file_system_outputs
   3707593               5%    3904015             -22%    2889536        b=
logbench.time.voluntary_context_switches
  89673636              29%  1.157e+08             -27%   65126677        b=
logbench.time.file_system_inputs
     91317 =C2=B1  4%       166%     243355 =C2=B1  5%       -14%      7840=
5 =C2=B1  3%  interrupts.CAL:Function_call_interrupts
    126196              -9%     115392             -12%     110525        s=
oftirqs.SCHED
   1407817              21%    1704640             -20%    1124039        s=
oftirqs.BLOCK
    154758             -55%      69061             -15%     130950        v=
mstat.io.bo
    150363              28%     192091             -27%     109323        v=
mstat.io.bi
     26160              10%      28689              -8%      24065        v=
mstat.system.in
     39785               5%      41958             -18%      32535        v=
mstat.system.cs
    125.14             -31%      86.16               8%     135.63        i=
ostat.sda.avgqu-sz
      1972             -30%       1384               3%       2039        i=
ostat.sda.w/s
      9.61 =C2=B1  4%       221%      30.80 =C2=B1  6%        -7%       8.9=
0 =C2=B1  5%  iostat.sda.rrqm/s
     10841             -38%       6694 =C2=B1  3%       -10%       9768    =
    iostat.sda.wrqm/s
    176538             -47%      93997             -10%     158873        i=
ostat.sda.wkB/s
      7204              37%       9869             -27%       5266        i=
ostat.sda.r/s
    150359              28%     192088             -27%     109306        i=
ostat.sda.rkB/s
  82650928             -57%   35726988             -15%   70630277        t=
ime.file_system_outputs
  89673636              29%  1.157e+08             -27%   65126677        t=
ime.file_system_inputs
   3707593               5%    3904015             -22%    2889536        t=
ime.voluntary_context_switches
      2.05 =C2=B1  4%       -82%       0.37             -14%       1.77 =C2=
=B1  4%  turbostat.CPU%c6
     14.59               7%      15.62                       14.38        t=
urbostat.RAMWatt
     29.66               5%      31.05                       29.17        t=
urbostat.PkgWatt
     29.57              18%      34.99              -5%      28.21        t=
urbostat.%Busy
       735              18%        871              -5%        702        t=
urbostat.Avg_MHz
     12795 =C2=B1  5%        27%      16266 =C2=B1  5%       210%      3967=
0        slabinfo.kmalloc-256.num_objs
       399 =C2=B1  5%        27%        509 =C2=B1  5%       210%       123=
9        slabinfo.kmalloc-256.active_slabs
       399 =C2=B1  5%        27%        509 =C2=B1  5%       210%       123=
9        slabinfo.kmalloc-256.num_slabs
     11939 =C2=B1  6%        29%      15410 =C2=B1  5%        42%      1692=
6        slabinfo.kmalloc-256.active_objs
     21941 =C2=B1  4%       -43%      12610              -6%      20590 =C2=
=B1  5%  slabinfo.xfs_inode.active_slabs
     21941 =C2=B1  4%       -43%      12610              -6%      20590 =C2=
=B1  5%  slabinfo.xfs_inode.num_slabs
   6185323              15%    7106376             -20%    4936887        c=
puidle.C1-BDW.usage
 1.265e+09                   1.233e+09              10%  1.395e+09        c=
puidle.C1E-BDW.time
 3.624e+08             -56%  1.584e+08              15%  4.154e+08        c=
puidle.C3-BDW.time
  55087062              15%   63367847              -8%   50604063        c=
puidle.POLL.time
    110076              15%     126443             -24%      83996        c=
puidle.POLL.usage
   1781846             -51%     872899             -14%    1529060        m=
eminfo.Inactive
   1763816             -52%     854876             -14%    1511029        m=
eminfo.Inactive(file)
      0.50             -13%       0.44              -4%       0.48        p=
erf-stat.ipc
      0.05 =C2=B1  3%                  0.05 =C2=B1  4%        -5%       0.0=
5 =C2=B1  3%  perf-stat.dTLB-load-miss-rate%
      0.01             -16%       0.01              -8%       0.01        p=
erf-stat.dTLB-store-miss-rate%
      0.53              -8%       0.49                        0.52        p=
erf-stat.branch-miss-rate%
 2.669e+08 =C2=B1  3%         5%  2.812e+08 =C2=B1  5%       -12%   2.36e+0=
8 =C2=B1  3%  perf-stat.dTLB-load-misses
 3.238e+11               5%  3.408e+11              -8%  2.991e+11        p=
erf-stat.branch-instructions
 1.732e+12               3%   1.79e+12              -8%  1.594e+12        p=
erf-stat.instructions
 1.843e+08               8%  1.985e+08             -20%  1.476e+08        p=
erf-stat.iTLB-loads
 5.361e+11               6%  5.658e+11              -7%  4.965e+11        p=
erf-stat.dTLB-loads
 3.454e+12              19%  4.096e+12              -4%    3.3e+12        p=
erf-stat.cpu-cycles
  12055147               5%   12708660             -18%    9870252        p=
erf-stat.context-switches
 3.577e+11               8%  3.853e+11              -7%  3.327e+11        p=
erf-stat.dTLB-stores
 1.726e+09              -3%   1.67e+09             -10%   1.55e+09        p=
erf-stat.branch-misses
  25874347             -10%   23377610             -14%   22224860 =C2=B1  =
3%  perf-stat.dTLB-store-misses
    330308              -7%     307787 =C2=B1  3%       -22%     258972    =
    perf-stat.cpu-migrations
 8.273e+10              24%  1.029e+11              -5%  7.898e+10        p=
erf-stat.cache-references
 8.273e+10              24%  1.029e+11              -5%  7.898e+10        p=
erf-stat.cache-misses

Thanks,
Xiaolong

--===============2279273524573789699==--

