Content-Type: multipart/mixed; boundary="===============7126001785474663392=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: performance changes on 4400755e: 200.0% fsmark.files_per_sec, -18.1% fsmark.files_per_sec, and few more
Date: Thu, 26 Mar 2015 12:30:05 +0800
Message-ID: <20150326043005.GB20016@yliu-dev.sh.intel.com>
In-Reply-To: <20150325140359.37763fd8@notabene.brown>
List-Id: <oe-lkp.lists.linux.dev>

--===============7126001785474663392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2015 at 02:03:59PM +1100, NeilBrown wrote:
> On Wed, 18 Mar 2015 13:00:30 +0800 Yuanahn Liu <yuanhan.liu@linux.intel=
.com>
> wrote:
> =

> > Hi,
> > =

> > FYI, we noticed performance changes on `fsmark.files_per_sec' by 440075=
5e356f9a2b0b7ceaa02f57b1c7546c3765:
> > =

> >     > commit 4400755e356f9a2b0b7ceaa02f57b1c7546c3765
> >     > Author:     NeilBrown <neilb@suse.de>
> >     > AuthorDate: Thu Feb 26 12:47:56 2015 +1100
> >     > Commit:     NeilBrown <neilb@suse.de>
> >     > CommitDate: Wed Mar 4 13:40:19 2015 +1100
> >     > =

> >     >     md/raid5: allow the stripe_cache to grow and shrink.
> =

> Thanks a lot for this testing!!! I was wondering how I could do some prop=
er
> testing of this patch, and you've done it for me :-)

Welcome!

> =

> The large number of improvements is very encouraging - that is what I was
> hoping for of course.
> =

> The few regressions could be a concern.  I note that are all NoSync.
> That seems to suggest that they could just be writing more data.

It's not a time based test, but size based test:

> >       40G, 30G, 120G: means the total test size

Hence, I doubt it might be writing more data.


> i.e. the data is written a bit earlier (certainly possible) so it happen =
to
> introduce more delay ....
> =

> I guess I'm not really sure how to interpret NoSync results, and suspect =
that
> poor NoSync result don't really reflect much on the underlying block devi=
ce.
> Could that be right?

Sorry, I'm not quite sure I followed you. Poor NoSync result? Do you
mean the small number like 63.133, 57.600? They are of unit of
files_per_sec, and file size is 4M. Hence, it would be 200+ MB/s, which
is not that bad in this case, as it's a 3 hard disk RAID5.

> > 3   8.1               63.133     =C2=B10.5%       3   9.2              =
 55.633     =C2=B10.2%         -11.9% ivb44/fsmark/1x-1t-3HDD-RAID5-btrfs-4=
M-120G-NoSync

Here are few iostat sample from 26089f4902595a2f64c512066af07af6e82eb096
of above test:

    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
               0.00    0.00    0.63    1.67    0.00   97.70
    =

    Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq=
-sz avgqu-sz   await r_await w_await  svctm  %util
    sdb               0.00 30353.00    0.00  240.00     0.00 121860.00  101=
5.50     1.29    5.35    0.00    5.35   3.50  83.90
    sdc               0.00 30353.00    0.00  241.00     0.00 122372.00  101=
5.54     0.66    2.74    0.00    2.74   2.53  60.90
    sda               0.00 30353.00    0.00  242.00     0.00 122884.00  101=
5.57     1.29    5.36    0.00    5.36   3.52  85.20
    md0               0.00     0.00    0.00  956.00     0.00 244736.00   51=
2.00 227231.39    0.00    0.00    0.00   1.05 100.00
    =

    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
               0.02    0.00    0.69    1.69    0.00   97.60
    =

    Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq=
-sz avgqu-sz   await r_await w_await  svctm  %util
    sdb               0.00 30988.00    0.00  247.00     0.00 125444.00  101=
5.74     1.77    7.17    0.00    7.17   4.02  99.40
    sdc               0.00 30988.00    0.00  245.00     0.00 124420.00  101=
5.67     1.19    4.82    0.00    4.82   3.67  89.90
    sda               0.00 30988.00    0.00  247.00     0.00 125444.00  101=
5.74     0.65    2.65    0.00    2.65   2.54  62.70
    md0               0.00     0.00    0.00  976.00     0.00 249856.00   51=
2.00 228206.37    0.00    0.00    0.00   1.02 100.00
    =

    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
               0.00    0.00    0.61    1.67    0.00   97.72
    =

    Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq=
-sz avgqu-sz   await r_await w_await  svctm  %util
    sdb               0.00 29718.00    0.00  235.00     0.00 119300.00  101=
5.32     1.35    5.71    0.00    5.71   3.71  87.20
    sdc               0.00 29718.00    0.00  236.00     0.00 119812.00  101=
5.36     1.19    5.06    0.00    5.06   3.43  80.90
    sda               0.00 29718.00    0.00  235.00     0.00 119300.00  101=
5.32     0.87    3.69    0.00    3.69   2.99  70.20
    md0               0.00     0.00    0.00  936.00     0.00 239616.00   51=
2.00 229157.33    0.00    0.00    0.00   1.07 100.00


And few iostat sample of 4400755e356f9a2b0b7ceaa02f57b1c7546c3765(first bad=
 commit):

    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
               0.02    0.00    1.09    1.54    0.00   97.35
    =

    Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq=
-sz avgqu-sz   await r_await w_await  svctm  %util
    sdb               1.00 27677.00    1.00  206.00     8.00 100516.00   97=
1.25    27.40  130.56  196.00  130.24   4.72  97.70
    sdc               0.00 27677.00    0.00  207.00     0.00 101028.00   97=
6.12    27.05  129.43    0.00  129.43   4.61  95.50
    sda               5.00 27677.00    1.00  211.00    16.00 102984.00   97=
1.70    26.61  127.00  201.00  126.64   4.50  95.50
    md0               0.00     0.00    0.00  824.00     0.00 210944.00   51=
2.00 224122.02    0.00    0.00    0.00   1.21 100.00
    =

    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
               0.00    0.00    0.98    1.54    0.00   97.47
    =

    Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq=
-sz avgqu-sz   await r_await w_await  svctm  %util
    sdb               3.00 21203.00    1.00  218.00    16.00 107060.00   97=
7.86    30.44  147.77  198.00  147.54   4.53  99.10
    sdc               2.00 21203.00    2.00  220.00    16.00 108592.00   97=
8.45    31.12  150.65  208.00  150.13   4.43  98.40
    sda               0.00 21203.00    1.00  220.00    24.00 108020.00   97=
7.77    30.56  150.88  197.00  150.67   4.38  96.80
    md0               0.00     0.00    0.00  720.00     0.00 184320.00   51=
2.00 224963.92    0.00    0.00    0.00   1.39 100.00
    =

    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
               0.02    0.00    0.96    1.63    0.00   97.39
    =

    Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq=
-sz avgqu-sz   await r_await w_await  svctm  %util
    sdb              11.00 29455.00    3.00  213.00    56.00 102958.00   95=
3.83    31.19  134.97  205.00  133.99   4.56  98.40
    sdc               0.00 29454.00    0.00  210.00     0.00 99890.00   951=
.33    29.36  127.07    0.00  127.07   4.36  91.60
    sda               1.00 29454.00    0.00  215.00     0.00 103534.00   96=
3.11    27.54  117.54    0.00  117.54   4.26  91.60
    md0               0.00     0.00    0.00  876.00     0.00 224256.00   51=
2.00 225993.60    0.00    0.00    0.00   1.14 100.10



> > 3   0.5              273.100     =C2=B14.3%       3   0.6              =
223.567     =C2=B16.5%         -18.1% ivb44/fsmark/1x-64t-4BRD_12G-RAID5-bt=
rfs-4M-30G-NoSync
> > 3   8.1               63.133     =C2=B10.5%       3   9.2              =
 55.633     =C2=B10.2%         -11.9% ivb44/fsmark/1x-1t-3HDD-RAID5-btrfs-4=
M-120G-NoSync
> > 3   8.2               64.000     =C2=B10.0%       3   9.2              =
 57.600     =C2=B10.0%         -10.0% ivb44/fsmark/1x-64t-3HDD-RAID5-btrfs-=
4M-120G-NoSync
> =

> Also, I'm a little confused by the
>    fsmark.time.involuntary_context_switches
> statistic:
> =

> >       1235 =C2=B1  2%     -47.5%        649 =C2=B1  3%  fsmark.time.per=
cent_of_cpu_this_job_got
> =

> >        399 =C2=B1  4%     -20.0%        319 =C2=B1  3%  fsmark.time.per=
cent_of_cpu_this_job_got
> =

> Does that means that the ext4 test changed from 12.4 cpus to 6.4, and that
> the btrfs test chnages from 4 cpus to 3.2 ???

fsmark.time.percent_of_cpu_this_job_got is output from /usr/bin/time, which
is from gnu time package. There is the explanation from source code:

    *  P =3D=3D percent of CPU this job got (total cpu time / elapsed time)


	--yliu

> =

> Or does it just not mean anything?
> =

> Thanks,
> NeilBrown
> =

> =

> =

> =

> > =

> > 26089f4902595a2f64c512066af07af6e82eb096     4400755e356f9a2b0b7ceaa02f=
57b1c7546c3765
> > ----------------------------------------     --------------------------=
--------------
> > run time(m)     metric_value     =C2=B1stddev     run time(m)     metri=
c_value     =C2=B1stddev     change   testbox/benchmark/sub-testcase
> > --- ------  ----------------------------     --- ------  --------------=
--------------     -------- ------------------------------
> > 3   18.6               6.400     =C2=B10.0%       5   9.2              =
 19.200     =C2=B10.0%         200.0% ivb44/fsmark/1x-64t-3HDD-RAID5-ext4-4=
M-40G-fsyncBeforeClose
> > 3   24.7               6.400     =C2=B10.0%       3   13.7             =
 12.800     =C2=B10.0%         100.0% ivb44/fsmark/1x-64t-3HDD-RAID5-f2fs-4=
M-40G-fsyncBeforeClose
> > 3   17.5              28.267     =C2=B19.6%       3   12.3             =
 42.833     =C2=B16.5%          51.5% ivb44/fsmark/1x-64t-3HDD-RAID5-f2fs-4=
M-120G-NoSync
> > 3   16.7              30.700     =C2=B11.5%       3   12.6             =
 40.733     =C2=B12.4%          32.7% ivb44/fsmark/1x-1t-3HDD-RAID5-f2fs-4M=
-120G-NoSync
> > 3   29.0               5.867     =C2=B10.8%       5   23.6             =
  7.240     =C2=B10.7%          23.4% ivb44/fsmark/1x-1t-3HDD-RAID5-btrfs-4=
M-40G-fsyncBeforeClose
> > 3   28.5               6.000     =C2=B10.0%       3   23.2             =
  7.367     =C2=B10.6%          22.8% ivb44/fsmark/1x-1t-3HDD-RAID5-f2fs-4M=
-40G-fsyncBeforeClose
> > 5   11.7              14.600     =C2=B10.0%       5   9.7              =
 17.500     =C2=B10.4%          19.9% ivb44/fsmark/1x-1t-3HDD-RAID5-xfs-4M-=
40G-fsyncBeforeClose
> > 3   22.4              25.600     =C2=B10.0%       5   17.9             =
 30.120     =C2=B14.1%          17.7% ivb44/fsmark/1x-64t-3HDD-RAID5-xfs-4M=
-120G-NoSync
> > 5   10.8              47.320     =C2=B10.6%       5   9.3              =
 54.820     =C2=B10.2%          15.8% ivb44/fsmark/1x-1t-3HDD-RAID5-xfs-4M-=
120G-NoSync
> > 1   0.5              252.400     =C2=B10.0%       1   0.5              =
263.300     =C2=B10.0%           4.3% ivb44/fsmark/1x-1t-4BRD_12G-RAID5-ext=
4-4M-30G-NoSync
> > =

> > 3   0.5              273.100     =C2=B14.3%       3   0.6              =
223.567     =C2=B16.5%         -18.1% ivb44/fsmark/1x-64t-4BRD_12G-RAID5-bt=
rfs-4M-30G-NoSync
> > 3   8.1               63.133     =C2=B10.5%       3   9.2              =
 55.633     =C2=B10.2%         -11.9% ivb44/fsmark/1x-1t-3HDD-RAID5-btrfs-4=
M-120G-NoSync
> > 3   8.2               64.000     =C2=B10.0%       3   9.2              =
 57.600     =C2=B10.0%         -10.0% ivb44/fsmark/1x-64t-3HDD-RAID5-btrfs-=
4M-120G-NoSync
> > =

> > =

> > NOTE: here are some more info about those test parameters for you to
> >       understand the testcase better:
> > =

> >       1x: where 'x' means iterations or loop, corresponding to the 'L' =
option of fsmark
> >       1t, 64t: where 't' means thread
> >       4M: means the single file size, corresponding to the '-s' option =
of fsmark
> >       40G, 30G, 120G: means the total test size
> > =

> >       4BRD_12G: BRD is the ramdisk, where '4' means 4 ramdisk, and wher=
e '12G' means
> >                 the size of one ramdisk. So, it would be 48G in total. =
And we made a
> > 		raid on those ramdisk.
> > =

> > =

> > As you can see from above data, interestingly, all performance
> > regressions come from btrfs testing. That's why Chris is also
> > in the cc list, with which just FYI.
> > =

> > =

> > FYI, here I listed more detailed changes for the maximal postive and ne=
gtive changes.
> > =

> > more detailed changes about ivb44/fsmark/1x-64t-3HDD-RAID5-ext4-4M-40G-=
fsyncBeforeClose
> > ---------
> > =

> > 26089f4902595a2f  4400755e356f9a2b0b7ceaa02f  =

> > ----------------  --------------------------  =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >       6.40 =C2=B1  0%    +200.0%      19.20 =C2=B1  0%  fsmark.files_pe=
r_sec
> >  1.015e+08 =C2=B1  1%     -73.6%   26767355 =C2=B1  3%  fsmark.time.vol=
untary_context_switches
> >      13793 =C2=B1  1%     -73.9%       3603 =C2=B1  5%  fsmark.time.sys=
tem_time
> >      78473 =C2=B1  6%     -64.3%      28016 =C2=B1  7%  fsmark.time.inv=
oluntary_context_switches
> >   15789555 =C2=B1  9%     -54.7%    7159485 =C2=B1 13%  fsmark.app_over=
head
> >       1115 =C2=B1  0%     -50.3%        554 =C2=B1  1%  fsmark.time.ela=
psed_time.max
> >       1115 =C2=B1  0%     -50.3%        554 =C2=B1  1%  fsmark.time.ela=
psed_time
> >       1235 =C2=B1  2%     -47.5%        649 =C2=B1  3%  fsmark.time.per=
cent_of_cpu_this_job_got
> >     456465 =C2=B1  1%     -26.7%     334594 =C2=B1  4%  fsmark.time.min=
or_page_faults
> >        275 =C2=B1  0%   +1257.7%       3733 =C2=B1  2%  slabinfo.raid5-=
md0.num_objs
> >        275 =C2=B1  0%   +1257.7%       3733 =C2=B1  2%  slabinfo.raid5-=
md0.active_objs
> >         11 =C2=B1  0%   +1250.9%        148 =C2=B1  2%  slabinfo.raid5-=
md0.active_slabs
> >         11 =C2=B1  0%   +1250.9%        148 =C2=B1  2%  slabinfo.raid5-=
md0.num_slabs
> >       2407 =C2=B1  4%    +293.4%       9471 =C2=B1 26%  numa-meminfo.no=
de0.Writeback
> >        600 =C2=B1  4%    +294.9%       2372 =C2=B1 26%  numa-vmstat.nod=
e0.nr_writeback
> >    1114505 =C2=B1  0%     -77.4%     251696 =C2=B1  2%  softirqs.TASKLET
> >    1808027 =C2=B1  1%     -77.7%     402378 =C2=B1  4%  softirqs.RCU
> >   12158665 =C2=B1  1%     -77.1%    2786069 =C2=B1  4%  cpuidle.C3-IVT.=
usage
> >    1119433 =C2=B1  0%     -77.3%     254192 =C2=B1  2%  softirqs.BLOCK
> >   37824202 =C2=B1  1%     -75.1%    9405078 =C2=B1  4%  cpuidle.C6-IVT.=
usage
> >  1.015e+08 =C2=B1  1%     -73.6%   26767355 =C2=B1  3%  time.voluntary_=
context_switches
> >      13793 =C2=B1  1%     -73.9%       3603 =C2=B1  5%  time.system_time
> >    5971084 =C2=B1  1%     -73.6%    1574912 =C2=B1  5%  softirqs.SCHED
> >   10539492 =C2=B1  3%     -72.0%    2956258 =C2=B1  6%  cpuidle.C1E-IVT=
.usage
> >          2 =C2=B1  0%    +230.0%          6 =C2=B1 12%  vmstat.procs.b
> >      14064 =C2=B1  1%     -71.2%       4049 =C2=B1  6%  softirqs.HRTIMER
> >    7388306 =C2=B1  1%     -71.2%    2129929 =C2=B1  4%  softirqs.TIMER
> >  3.496e+09 =C2=B1  1%     -70.3%   1.04e+09 =C2=B1  1%  cpuidle.C3-IVT.=
time
> >       0.88 =C2=B1  6%    +224.9%       2.87 =C2=B1 11%  turbostat.Pkg%p=
c6
> >   19969464 =C2=B1  2%     -66.2%    6750675 =C2=B1  5%  cpuidle.C1-IVT.=
usage
> >      78473 =C2=B1  6%     -64.3%      28016 =C2=B1  7%  time.involuntar=
y_context_switches
> >       4.23 =C2=B1  5%    +181.4%      11.90 =C2=B1  3%  turbostat.Pkg%p=
c2
> >  2.551e+09 =C2=B1  1%     -61.4%  9.837e+08 =C2=B1  3%  cpuidle.C1E-IVT=
.time
> >       8084 =C2=B1  3%    +142.6%      19608 =C2=B1  3%  meminfo.Writeba=
ck
> >       2026 =C2=B1  4%    +141.6%       4895 =C2=B1  4%  proc-vmstat.nr_=
writeback
> >        165 =C2=B1  4%     -56.9%         71 =C2=B1 14%  numa-vmstat.nod=
e1.nr_inactive_anon
> >  7.748e+09 =C2=B1  3%     -50.3%  3.852e+09 =C2=B1  3%  cpuidle.C1-IVT.=
time
> >        175 =C2=B1  5%     -53.2%         82 =C2=B1 13%  numa-vmstat.nod=
e1.nr_shmem
> >       1115 =C2=B1  0%     -50.3%        554 =C2=B1  1%  time.elapsed_ti=
me.max
> >       1115 =C2=B1  0%     -50.3%        554 =C2=B1  1%  time.elapsed_ti=
me
> >       1147 =C2=B1  0%     -49.0%        585 =C2=B1  1%  uptime.boot
> >    2260889 =C2=B1  0%     -48.8%    1157272 =C2=B1  1%  proc-vmstat.pgf=
ree
> >      16805 =C2=B1  2%     -35.9%      10776 =C2=B1 23%  numa-vmstat.nod=
e1.nr_dirty
> >       1235 =C2=B1  2%     -47.5%        649 =C2=B1  3%  time.percent_of=
_cpu_this_job_got
> >      67245 =C2=B1  2%     -35.9%      43122 =C2=B1 23%  numa-meminfo.no=
de1.Dirty
> >      39041 =C2=B1  0%     -45.7%      21212 =C2=B1  2%  uptime.idle
> >         13 =C2=B1  9%     -49.0%          6 =C2=B1 11%  vmstat.procs.r
> >       3072 =C2=B1 10%     -40.3%       1833 =C2=B1  9%  cpuidle.POLL.us=
age
> >    3045115 =C2=B1  0%     -46.1%    1642053 =C2=B1  1%  proc-vmstat.pgf=
ault
> >        202 =C2=B1  1%     -45.2%        110 =C2=B1  0%  proc-vmstat.nr_=
inactive_anon
> >    4583079 =C2=B1  2%     -31.4%    3143602 =C2=B1 16%  numa-vmstat.nod=
e1.numa_hit
> >      28.03 =C2=B1  0%     +69.1%      47.39 =C2=B1  1%  turbostat.CPU%c6
> >        223 =C2=B1  1%     -41.1%        131 =C2=B1  1%  proc-vmstat.nr_=
shmem
> >    4518820 =C2=B1  3%     -30.8%    3128304 =C2=B1 16%  numa-vmstat.nod=
e1.numa_local
> >    3363496 =C2=B1  3%     -27.4%    2441619 =C2=B1 20%  numa-vmstat.nod=
e1.nr_dirtied
> >    3345346 =C2=B1  3%     -27.4%    2428396 =C2=B1 20%  numa-vmstat.nod=
e1.nr_written
> >       0.18 =C2=B1 18%    +105.6%       0.37 =C2=B1 36%  turbostat.Pkg%p=
c3
> >    3427913 =C2=B1  3%     -27.3%    2492563 =C2=B1 20%  numa-vmstat.nod=
e1.nr_inactive_file
> >   13712431 =C2=B1  3%     -27.3%    9971152 =C2=B1 20%  numa-meminfo.no=
de1.Inactive
> >   13711768 =C2=B1  3%     -27.3%    9970866 =C2=B1 20%  numa-meminfo.no=
de1.Inactive(file)
> >    3444598 =C2=B1  3%     -27.2%    2508920 =C2=B1 20%  numa-vmstat.nod=
e1.nr_file_pages
> >   13778510 =C2=B1  3%     -27.2%   10036287 =C2=B1 20%  numa-meminfo.no=
de1.FilePages
> >    8819175 =C2=B1  1%     -28.3%    6320188 =C2=B1 19%  numa-numastat.n=
ode1.numa_hit
> >    8819051 =C2=B1  1%     -28.3%    6320152 =C2=B1 19%  numa-numastat.n=
ode1.local_node
> >   14350918 =C2=B1  3%     -26.8%   10504070 =C2=B1 19%  numa-meminfo.no=
de1.MemUsed
> >     100892 =C2=B1  3%     -26.0%      74623 =C2=B1 19%  numa-vmstat.nod=
e1.nr_slab_reclaimable
> >     403571 =C2=B1  3%     -26.0%     298513 =C2=B1 19%  numa-meminfo.no=
de1.SReclaimable
> >       3525 =C2=B1 13%     +36.6%       4817 =C2=B1 14%  slabinfo.blkdev=
_requests.active_objs
> >       3552 =C2=B1 13%     +36.3%       4841 =C2=B1 14%  slabinfo.blkdev=
_requests.num_objs
> >      30779 =C2=B1  4%     -34.7%      20084 =C2=B1 12%  proc-vmstat.pgm=
igrate_success
> >      30779 =C2=B1  4%     -34.7%      20084 =C2=B1 12%  proc-vmstat.num=
a_pages_migrated
> >     447400 =C2=B1  2%     -23.2%     343701 =C2=B1 16%  numa-meminfo.no=
de1.Slab
> >  2.532e+10 =C2=B1  0%     -33.1%  1.694e+10 =C2=B1  1%  cpuidle.C6-IVT.=
time
> >       3081 =C2=B1  9%     +28.0%       3945 =C2=B1 12%  slabinfo.mnt_ca=
che.num_objs
> >       3026 =C2=B1  9%     +28.8%       3898 =C2=B1 12%  slabinfo.mnt_ca=
che.active_objs
> >       5822 =C2=B1  4%     +77.8%      10350 =C2=B1 25%  numa-meminfo.no=
de1.Writeback
> >       1454 =C2=B1  4%     +77.3%       2579 =C2=B1 25%  numa-vmstat.nod=
e1.nr_writeback
> >     424984 =C2=B1  1%     -26.5%     312255 =C2=B1  3%  proc-vmstat.num=
a_pte_updates
> >     368001 =C2=B1  1%     -26.8%     269440 =C2=B1  3%  proc-vmstat.num=
a_hint_faults
> >     456465 =C2=B1  1%     -26.7%     334594 =C2=B1  4%  time.minor_page=
_faults
> >       3.86 =C2=B1  3%     -24.4%       2.92 =C2=B1  2%  turbostat.CPU%c3
> >    4661151 =C2=B1  2%     +20.6%    5622999 =C2=B1  9%  numa-vmstat.nod=
e1.nr_free_pages
> >   18644452 =C2=B1  2%     +20.6%   22491300 =C2=B1  9%  numa-meminfo.no=
de1.MemFree
> >        876 =C2=B1  2%     +28.2%       1124 =C2=B1  5%  slabinfo.kmallo=
c-4096.num_objs
> >        858 =C2=B1  3%     +24.0%       1064 =C2=B1  5%  slabinfo.kmallo=
c-4096.active_objs
> >   17767832 =C2=B1  8%     -25.4%   13249545 =C2=B1 17%  cpuidle.POLL.ti=
me
> >     285093 =C2=B1  1%     -23.1%     219372 =C2=B1  5%  proc-vmstat.num=
a_hint_faults_local
> >     105423 =C2=B1  2%     -16.1%      88498 =C2=B1  0%  meminfo.Dirty
> >      26365 =C2=B1  1%     -16.0%      22152 =C2=B1  1%  proc-vmstat.nr_=
dirty
> >      41.04 =C2=B1  1%     -14.1%      35.26 =C2=B1  1%  turbostat.CPU%c1
> >       9385 =C2=B1  4%     -14.3%       8043 =C2=B1  6%  slabinfo.kmallo=
c-192.active_objs
> >       9574 =C2=B1  3%     -13.9%       8241 =C2=B1  6%  slabinfo.kmallo=
c-192.num_objs
> >       2411 =C2=B1  3%     +17.0%       2820 =C2=B1  4%  slabinfo.kmallo=
c-2048.active_objs
> >   12595574 =C2=B1  0%     -10.0%   11338368 =C2=B1  1%  proc-vmstat.pga=
lloc_normal
> >       5262 =C2=B1  1%     +13.3%       5962 =C2=B1  1%  slabinfo.kmallo=
c-1024.num_objs
> >       5262 =C2=B1  1%     +12.7%       5932 =C2=B1  1%  slabinfo.kmallo=
c-1024.active_objs
> >       2538 =C2=B1  3%     +13.7%       2885 =C2=B1  4%  slabinfo.kmallo=
c-2048.num_objs
> >    5299546 =C2=B1  0%      -9.9%    4776351 =C2=B1  0%  slabinfo.buffer=
_head.active_objs
> >    5299546 =C2=B1  0%      -9.9%    4776351 =C2=B1  0%  slabinfo.buffer=
_head.num_objs
> >     135885 =C2=B1  0%      -9.9%     122470 =C2=B1  0%  slabinfo.buffer=
_head.num_slabs
> >     135885 =C2=B1  0%      -9.9%     122470 =C2=B1  0%  slabinfo.buffer=
_head.active_slabs
> >      28.04 =C2=B1  2%    +715.6%     228.69 =C2=B1  3%  iostat.sdb.avgr=
q-sz
> >      28.05 =C2=B1  2%    +708.1%     226.72 =C2=B1  2%  iostat.sdc.avgr=
q-sz
> >       2245 =C2=B1  3%     -81.6%        413 =C2=B1  1%  iostat.sda.w/s
> >       5.33 =C2=B1  1%   +1008.2%      59.07 =C2=B1  1%  iostat.sda.w_aw=
ait
> >       5.85 =C2=B1  1%   +1126.4%      71.69 =C2=B1  4%  iostat.sda.r_aw=
ait
> >       5.36 =C2=B1  1%    +978.6%      57.79 =C2=B1  3%  iostat.sdc.w_aw=
ait
> >       1263 =C2=B1  4%     -85.8%        179 =C2=B1  6%  iostat.sdc.r/s
> >       2257 =C2=B1  3%     -81.6%        414 =C2=B1  2%  iostat.sdb.w/s
> >       1264 =C2=B1  4%     -85.8%        179 =C2=B1  6%  iostat.sdb.r/s
> >       5.55 =C2=B1  0%   +1024.2%      62.37 =C2=B1  4%  iostat.sdb.await
> >       5.89 =C2=B1  1%   +1125.9%      72.16 =C2=B1  6%  iostat.sdb.r_aw=
ait
> >       5.36 =C2=B1  0%   +1014.3%      59.75 =C2=B1  3%  iostat.sdb.w_aw=
ait
> >       5.57 =C2=B1  1%    +987.9%      60.55 =C2=B1  3%  iostat.sdc.await
> >       5.51 =C2=B1  0%   +1017.3%      61.58 =C2=B1  1%  iostat.sda.await
> >       1264 =C2=B1  4%     -85.8%        179 =C2=B1  6%  iostat.sda.r/s
> >      28.09 =C2=B1  2%    +714.2%     228.73 =C2=B1  2%  iostat.sda.avgr=
q-sz
> >       5.95 =C2=B1  2%   +1091.0%      70.82 =C2=B1  6%  iostat.sdc.r_aw=
ait
> >       2252 =C2=B1  3%     -81.5%        417 =C2=B1  2%  iostat.sdc.w/s
> >       4032 =C2=B1  2%    +151.6%      10143 =C2=B1  1%  iostat.sdb.wrqm=
/s
> >       4043 =C2=B1  2%    +151.0%      10150 =C2=B1  1%  iostat.sda.wrqm=
/s
> >       4035 =C2=B1  2%    +151.2%      10138 =C2=B1  1%  iostat.sdc.wrqm=
/s
> >      26252 =C2=B1  1%     -54.0%      12077 =C2=B1  4%  vmstat.system.in
> >      37813 =C2=B1  0%    +101.0%      75998 =C2=B1  1%  vmstat.io.bo
> >      37789 =C2=B1  0%    +101.0%      75945 =C2=B1  1%  iostat.md0.wkB/s
> >        205 =C2=B1  0%     +96.1%        402 =C2=B1  1%  iostat.md0.w/s
> >     164286 =C2=B1  1%     -46.2%      88345 =C2=B1  2%  vmstat.system.cs
> >      27.07 =C2=B1  2%     -46.7%      14.42 =C2=B1  3%  turbostat.%Busy
> >        810 =C2=B1  2%     -46.7%        431 =C2=B1  3%  turbostat.Avg_M=
Hz
> >      15.56 =C2=B1  2%     +71.7%      26.71 =C2=B1  1%  iostat.sda.avgq=
u-sz
> >      15.65 =C2=B1  2%     +69.1%      26.46 =C2=B1  2%  iostat.sdc.avgq=
u-sz
> >      15.67 =C2=B1  2%     +72.7%      27.06 =C2=B1  2%  iostat.sdb.avgq=
u-sz
> >      25151 =C2=B1  0%     +68.3%      42328 =C2=B1  1%  iostat.sda.wkB/s
> >      25153 =C2=B1  0%     +68.2%      42305 =C2=B1  1%  iostat.sdb.wkB/s
> >      25149 =C2=B1  0%     +68.2%      42292 =C2=B1  1%  iostat.sdc.wkB/s
> >      97.45 =C2=B1  0%     -21.1%      76.90 =C2=B1  0%  turbostat.CorWa=
tt
> >      12517 =C2=B1  0%     -20.2%       9994 =C2=B1  1%  iostat.sdc.rkB/s
> >      12517 =C2=B1  0%     -20.0%      10007 =C2=B1  1%  iostat.sda.rkB/s
> >      12512 =C2=B1  0%     -19.9%      10018 =C2=B1  1%  iostat.sdb.rkB/s
> >       1863 =C2=B1  3%     +24.7%       2325 =C2=B1  1%  iostat.sdb.rrqm=
/s
> >       1865 =C2=B1  3%     +24.3%       2319 =C2=B1  1%  iostat.sdc.rrqm=
/s
> >       1864 =C2=B1  3%     +24.6%       2322 =C2=B1  1%  iostat.sda.rrqm=
/s
> >        128 =C2=B1  0%     -16.4%        107 =C2=B1  0%  turbostat.PkgWa=
tt
> >     150569 =C2=B1  0%      -8.7%     137525 =C2=B1  0%  iostat.md0.avgq=
u-sz
> >       4.29 =C2=B1  0%      -5.1%       4.07 =C2=B1  0%  turbostat.RAMWa=
tt
> > =

> > =

> > more detailed changes about ivb44/fsmark/1x-64t-4BRD_12G-RAID5-btrfs-4M=
-30G-NoSync
> > ---------
> > =

> > 26089f4902595a2f  4400755e356f9a2b0b7ceaa02f  =

> > ----------------  --------------------------  =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >        273 =C2=B1  4%     -18.1%        223 =C2=B1  6%  fsmark.files_pe=
r_sec
> >      29.24 =C2=B1  1%     +27.2%      37.20 =C2=B1  8%  fsmark.time.ela=
psed_time.max
> >      29.24 =C2=B1  1%     +27.2%      37.20 =C2=B1  8%  fsmark.time.ela=
psed_time
> >        399 =C2=B1  4%     -20.0%        319 =C2=B1  3%  fsmark.time.per=
cent_of_cpu_this_job_got
> >     129891 =C2=B1 20%     -28.9%      92334 =C2=B1 15%  fsmark.time.vol=
untary_context_switches
> >        266 =C2=B1  0%    +413.4%       1365 =C2=B1  5%  slabinfo.raid5-=
md0.num_objs
> >        266 =C2=B1  0%    +413.4%       1365 =C2=B1  5%  slabinfo.raid5-=
md0.active_objs
> >       0.23 =C2=B1 27%     +98.6%       0.46 =C2=B1 35%  turbostat.CPU%c3
> >   56612063 =C2=B1  9%     +36.7%   77369763 =C2=B1 20%  cpuidle.C1-IVT.=
time
> >    5579498 =C2=B1 14%     -36.0%    3571516 =C2=B1  6%  cpuidle.C1E-IVT=
.time
> >       4668 =C2=B1 38%     +64.7%       7690 =C2=B1 19%  numa-vmstat.nod=
e0.nr_unevictable
> >      18674 =C2=B1 38%     +64.7%      30762 =C2=B1 19%  numa-meminfo.no=
de0.Unevictable
> >       9298 =C2=B1 37%     +64.4%      15286 =C2=B1 19%  proc-vmstat.nr_=
unevictable
> >       4629 =C2=B1 37%     +64.1%       7596 =C2=B1 19%  numa-vmstat.nod=
e1.nr_unevictable
> >      18535 =C2=B1 37%     +63.9%      30385 =C2=B1 19%  numa-meminfo.no=
de1.Unevictable
> >    4270894 =C2=B1 19%     +65.6%    7070923 =C2=B1 21%  cpuidle.C3-IVT.=
time
> >      38457 =C2=B1 37%     +59.0%      61148 =C2=B1 19%  meminfo.Unevict=
able
> >    3748226 =C2=B1 17%     +26.6%    4743674 =C2=B1 16%  numa-vmstat.nod=
e0.numa_local
> >    4495283 =C2=B1 13%     -24.8%    3382315 =C2=B1 17%  numa-vmstat.nod=
e0.nr_free_pages
> >    3818432 =C2=B1 16%     +26.5%    4830938 =C2=B1 16%  numa-vmstat.nod=
e0.numa_hit
> >   17966826 =C2=B1 13%     -24.7%   13537228 =C2=B1 17%  numa-meminfo.no=
de0.MemFree
> >   14901309 =C2=B1 15%     +29.7%   19330906 =C2=B1 12%  numa-meminfo.no=
de0.MemUsed
> >         26 =C2=B1 21%     -32.9%         17 =C2=B1 14%  cpuidle.POLL.us=
age
> >  1.183e+09 =C2=B1  1%     +29.6%  1.533e+09 =C2=B1  8%  cpuidle.C6-IVT.=
time
> >      29.24 =C2=B1  1%     +27.2%      37.20 =C2=B1  8%  time.elapsed_ti=
me
> >      29.24 =C2=B1  1%     +27.2%      37.20 =C2=B1  8%  time.elapsed_ti=
me.max
> >        399 =C2=B1  4%     -20.0%        319 =C2=B1  3%  time.percent_of=
_cpu_this_job_got
> >        850 =C2=B1  4%      -8.6%        777 =C2=B1  5%  slabinfo.blkdev=
_requests.num_objs
> >        850 =C2=B1  4%      -8.6%        777 =C2=B1  5%  slabinfo.blkdev=
_requests.active_objs
> >      14986 =C2=B1  9%     +17.1%      17548 =C2=B1  8%  numa-vmstat.nod=
e0.nr_slab_reclaimable
> >      11943 =C2=B1  5%     -12.6%      10441 =C2=B1  2%  slabinfo.kmallo=
c-192.num_objs
> >      59986 =C2=B1  9%     +17.0%      70186 =C2=B1  8%  numa-meminfo.no=
de0.SReclaimable
> >       3703 =C2=B1  6%     +10.2%       4082 =C2=B1  7%  slabinfo.btrfs_=
delayed_data_ref.num_objs
> >     133551 =C2=B1  6%     +16.1%     154995 =C2=B1  1%  proc-vmstat.pgf=
ault
> >     129891 =C2=B1 20%     -28.9%      92334 =C2=B1 15%  time.voluntary_=
context_switches
> >      11823 =C2=B1  4%     -12.0%      10409 =C2=B1  3%  slabinfo.kmallo=
c-192.active_objs
> >       3703 =C2=B1  6%      +9.7%       4061 =C2=B1  7%  slabinfo.btrfs_=
delayed_data_ref.active_objs
> >      19761 =C2=B1  2%     -11.2%      17542 =C2=B1  6%  slabinfo.anon_v=
ma.active_objs
> >      19761 =C2=B1  2%     -11.2%      17544 =C2=B1  6%  slabinfo.anon_v=
ma.num_objs
> >      13002 =C2=B1  3%     +14.9%      14944 =C2=B1  5%  slabinfo.kmallo=
c-256.num_objs
> >      12695 =C2=B1  3%     +13.8%      14446 =C2=B1  7%  slabinfo.kmallo=
c-256.active_objs
> >       1190 =C2=B1  1%     -11.8%       1050 =C2=B1  3%  slabinfo.mnt_ca=
che.num_objs
> >       1190 =C2=B1  1%     -11.8%       1050 =C2=B1  3%  slabinfo.mnt_ca=
che.active_objs
> >     136862 =C2=B1  1%     -13.8%     117938 =C2=B1  7%  cpuidle.C6-IVT.=
usage
> >    1692630 =C2=B1  3%     +12.3%    1900854 =C2=B1  0%  numa-vmstat.nod=
e0.nr_written
> >       1056 =C2=B1  2%      +8.8%       1149 =C2=B1  3%  slabinfo.mm_str=
uct.active_objs
> >       1056 =C2=B1  2%      +8.8%       1149 =C2=B1  3%  slabinfo.mm_str=
uct.num_objs
> >      24029 =C2=B1 11%     -30.6%      16673 =C2=B1  8%  vmstat.system.cs
> >       8859 =C2=B1  2%     -15.0%       7530 =C2=B1  8%  vmstat.system.in
> >     905630 =C2=B1  2%     -16.8%     753097 =C2=B1  4%  iostat.md0.wkB/s
> >     906433 =C2=B1  2%     -16.9%     753482 =C2=B1  4%  vmstat.io.bo
> >       3591 =C2=B1  2%     -16.9%       2982 =C2=B1  4%  iostat.md0.w/s
> >      13.22 =C2=B1  5%     -16.3%      11.07 =C2=B1  1%  turbostat.%Busy
> >        402 =C2=B1  4%     -15.9%        338 =C2=B1  1%  turbostat.Avg_M=
Hz
> >      54236 =C2=B1  3%     +10.4%      59889 =C2=B1  4%  iostat.md0.avgq=
u-sz
> >       7.67 =C2=B1  1%      +4.5%       8.01 =C2=B1  1%  turbostat.RAMWa=
tt
> > =

> > =

> > =

> > 	--yliu
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
> > the body of a message to majordomo(a)vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/
> =




--===============7126001785474663392==--

