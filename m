Content-Type: multipart/mixed; boundary="===============9016819077180716619=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: performance changes on 4400755e: 200.0% fsmark.files_per_sec, -18.1% fsmark.files_per_sec, and few more
Date: Wed, 25 Mar 2015 14:03:59 +1100
Message-ID: <20150325140359.37763fd8@notabene.brown>
In-Reply-To: <20150318050030.GC30894@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9016819077180716619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Mar 2015 13:00:30 +0800 Yuanahn Liu <yuanhan.liu@linux.intel.c=
om>
wrote:

> Hi,
> =

> FYI, we noticed performance changes on `fsmark.files_per_sec' by 4400755e=
356f9a2b0b7ceaa02f57b1c7546c3765:
> =

>     > commit 4400755e356f9a2b0b7ceaa02f57b1c7546c3765
>     > Author:     NeilBrown <neilb@suse.de>
>     > AuthorDate: Thu Feb 26 12:47:56 2015 +1100
>     > Commit:     NeilBrown <neilb@suse.de>
>     > CommitDate: Wed Mar 4 13:40:19 2015 +1100
>     > =

>     >     md/raid5: allow the stripe_cache to grow and shrink.

Thanks a lot for this testing!!! I was wondering how I could do some proper
testing of this patch, and you've done it for me :-)

The large number of improvements is very encouraging - that is what I was
hoping for of course.

The few regressions could be a concern.  I note that are all NoSync.
That seems to suggest that they could just be writing more data.
i.e. the data is written a bit earlier (certainly possible) so it happen to
introduce more delay ....

I guess I'm not really sure how to interpret NoSync results, and suspect th=
at
poor NoSync result don't really reflect much on the underlying block device.
Could that be right?

Also, I'm a little confused by the
   fsmark.time.involuntary_context_switches
statistic:

>       1235 =C2=B1  2%     -47.5%        649 =C2=B1  3%  fsmark.time.perce=
nt_of_cpu_this_job_got

>        399 =C2=B1  4%     -20.0%        319 =C2=B1  3%  fsmark.time.perce=
nt_of_cpu_this_job_got

Does that means that the ext4 test changed from 12.4 cpus to 6.4, and that
the btrfs test chnages from 4 cpus to 3.2 ???

Or does it just not mean anything?

Thanks,
NeilBrown




> =

> 26089f4902595a2f64c512066af07af6e82eb096     4400755e356f9a2b0b7ceaa02f57=
b1c7546c3765
> ----------------------------------------     ----------------------------=
------------
> run time(m)     metric_value     =C2=B1stddev     run time(m)     metric_=
value     =C2=B1stddev     change   testbox/benchmark/sub-testcase
> --- ------  ----------------------------     --- ------  ----------------=
------------     -------- ------------------------------
> 3   18.6               6.400     =C2=B10.0%       5   9.2               1=
9.200     =C2=B10.0%         200.0% ivb44/fsmark/1x-64t-3HDD-RAID5-ext4-4M-=
40G-fsyncBeforeClose
> 3   24.7               6.400     =C2=B10.0%       3   13.7              1=
2.800     =C2=B10.0%         100.0% ivb44/fsmark/1x-64t-3HDD-RAID5-f2fs-4M-=
40G-fsyncBeforeClose
> 3   17.5              28.267     =C2=B19.6%       3   12.3              4=
2.833     =C2=B16.5%          51.5% ivb44/fsmark/1x-64t-3HDD-RAID5-f2fs-4M-=
120G-NoSync
> 3   16.7              30.700     =C2=B11.5%       3   12.6              4=
0.733     =C2=B12.4%          32.7% ivb44/fsmark/1x-1t-3HDD-RAID5-f2fs-4M-1=
20G-NoSync
> 3   29.0               5.867     =C2=B10.8%       5   23.6               =
7.240     =C2=B10.7%          23.4% ivb44/fsmark/1x-1t-3HDD-RAID5-btrfs-4M-=
40G-fsyncBeforeClose
> 3   28.5               6.000     =C2=B10.0%       3   23.2               =
7.367     =C2=B10.6%          22.8% ivb44/fsmark/1x-1t-3HDD-RAID5-f2fs-4M-4=
0G-fsyncBeforeClose
> 5   11.7              14.600     =C2=B10.0%       5   9.7               1=
7.500     =C2=B10.4%          19.9% ivb44/fsmark/1x-1t-3HDD-RAID5-xfs-4M-40=
G-fsyncBeforeClose
> 3   22.4              25.600     =C2=B10.0%       5   17.9              3=
0.120     =C2=B14.1%          17.7% ivb44/fsmark/1x-64t-3HDD-RAID5-xfs-4M-1=
20G-NoSync
> 5   10.8              47.320     =C2=B10.6%       5   9.3               5=
4.820     =C2=B10.2%          15.8% ivb44/fsmark/1x-1t-3HDD-RAID5-xfs-4M-12=
0G-NoSync
> 1   0.5              252.400     =C2=B10.0%       1   0.5              26=
3.300     =C2=B10.0%           4.3% ivb44/fsmark/1x-1t-4BRD_12G-RAID5-ext4-=
4M-30G-NoSync
> =

> 3   0.5              273.100     =C2=B14.3%       3   0.6              22=
3.567     =C2=B16.5%         -18.1% ivb44/fsmark/1x-64t-4BRD_12G-RAID5-btrf=
s-4M-30G-NoSync
> 3   8.1               63.133     =C2=B10.5%       3   9.2               5=
5.633     =C2=B10.2%         -11.9% ivb44/fsmark/1x-1t-3HDD-RAID5-btrfs-4M-=
120G-NoSync
> 3   8.2               64.000     =C2=B10.0%       3   9.2               5=
7.600     =C2=B10.0%         -10.0% ivb44/fsmark/1x-64t-3HDD-RAID5-btrfs-4M=
-120G-NoSync
> =

> =

> NOTE: here are some more info about those test parameters for you to
>       understand the testcase better:
> =

>       1x: where 'x' means iterations or loop, corresponding to the 'L' op=
tion of fsmark
>       1t, 64t: where 't' means thread
>       4M: means the single file size, corresponding to the '-s' option of=
 fsmark
>       40G, 30G, 120G: means the total test size
> =

>       4BRD_12G: BRD is the ramdisk, where '4' means 4 ramdisk, and where =
'12G' means
>                 the size of one ramdisk. So, it would be 48G in total. An=
d we made a
> 		raid on those ramdisk.
> =

> =

> As you can see from above data, interestingly, all performance
> regressions come from btrfs testing. That's why Chris is also
> in the cc list, with which just FYI.
> =

> =

> FYI, here I listed more detailed changes for the maximal postive and negt=
ive changes.
> =

> more detailed changes about ivb44/fsmark/1x-64t-3HDD-RAID5-ext4-4M-40G-fs=
yncBeforeClose
> ---------
> =

> 26089f4902595a2f  4400755e356f9a2b0b7ceaa02f  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>       6.40 =C2=B1  0%    +200.0%      19.20 =C2=B1  0%  fsmark.files_per_=
sec
>  1.015e+08 =C2=B1  1%     -73.6%   26767355 =C2=B1  3%  fsmark.time.volun=
tary_context_switches
>      13793 =C2=B1  1%     -73.9%       3603 =C2=B1  5%  fsmark.time.syste=
m_time
>      78473 =C2=B1  6%     -64.3%      28016 =C2=B1  7%  fsmark.time.invol=
untary_context_switches
>   15789555 =C2=B1  9%     -54.7%    7159485 =C2=B1 13%  fsmark.app_overhe=
ad
>       1115 =C2=B1  0%     -50.3%        554 =C2=B1  1%  fsmark.time.elaps=
ed_time.max
>       1115 =C2=B1  0%     -50.3%        554 =C2=B1  1%  fsmark.time.elaps=
ed_time
>       1235 =C2=B1  2%     -47.5%        649 =C2=B1  3%  fsmark.time.perce=
nt_of_cpu_this_job_got
>     456465 =C2=B1  1%     -26.7%     334594 =C2=B1  4%  fsmark.time.minor=
_page_faults
>        275 =C2=B1  0%   +1257.7%       3733 =C2=B1  2%  slabinfo.raid5-md=
0.num_objs
>        275 =C2=B1  0%   +1257.7%       3733 =C2=B1  2%  slabinfo.raid5-md=
0.active_objs
>         11 =C2=B1  0%   +1250.9%        148 =C2=B1  2%  slabinfo.raid5-md=
0.active_slabs
>         11 =C2=B1  0%   +1250.9%        148 =C2=B1  2%  slabinfo.raid5-md=
0.num_slabs
>       2407 =C2=B1  4%    +293.4%       9471 =C2=B1 26%  numa-meminfo.node=
0.Writeback
>        600 =C2=B1  4%    +294.9%       2372 =C2=B1 26%  numa-vmstat.node0=
.nr_writeback
>    1114505 =C2=B1  0%     -77.4%     251696 =C2=B1  2%  softirqs.TASKLET
>    1808027 =C2=B1  1%     -77.7%     402378 =C2=B1  4%  softirqs.RCU
>   12158665 =C2=B1  1%     -77.1%    2786069 =C2=B1  4%  cpuidle.C3-IVT.us=
age
>    1119433 =C2=B1  0%     -77.3%     254192 =C2=B1  2%  softirqs.BLOCK
>   37824202 =C2=B1  1%     -75.1%    9405078 =C2=B1  4%  cpuidle.C6-IVT.us=
age
>  1.015e+08 =C2=B1  1%     -73.6%   26767355 =C2=B1  3%  time.voluntary_co=
ntext_switches
>      13793 =C2=B1  1%     -73.9%       3603 =C2=B1  5%  time.system_time
>    5971084 =C2=B1  1%     -73.6%    1574912 =C2=B1  5%  softirqs.SCHED
>   10539492 =C2=B1  3%     -72.0%    2956258 =C2=B1  6%  cpuidle.C1E-IVT.u=
sage
>          2 =C2=B1  0%    +230.0%          6 =C2=B1 12%  vmstat.procs.b
>      14064 =C2=B1  1%     -71.2%       4049 =C2=B1  6%  softirqs.HRTIMER
>    7388306 =C2=B1  1%     -71.2%    2129929 =C2=B1  4%  softirqs.TIMER
>  3.496e+09 =C2=B1  1%     -70.3%   1.04e+09 =C2=B1  1%  cpuidle.C3-IVT.ti=
me
>       0.88 =C2=B1  6%    +224.9%       2.87 =C2=B1 11%  turbostat.Pkg%pc6
>   19969464 =C2=B1  2%     -66.2%    6750675 =C2=B1  5%  cpuidle.C1-IVT.us=
age
>      78473 =C2=B1  6%     -64.3%      28016 =C2=B1  7%  time.involuntary_=
context_switches
>       4.23 =C2=B1  5%    +181.4%      11.90 =C2=B1  3%  turbostat.Pkg%pc2
>  2.551e+09 =C2=B1  1%     -61.4%  9.837e+08 =C2=B1  3%  cpuidle.C1E-IVT.t=
ime
>       8084 =C2=B1  3%    +142.6%      19608 =C2=B1  3%  meminfo.Writeback
>       2026 =C2=B1  4%    +141.6%       4895 =C2=B1  4%  proc-vmstat.nr_wr=
iteback
>        165 =C2=B1  4%     -56.9%         71 =C2=B1 14%  numa-vmstat.node1=
.nr_inactive_anon
>  7.748e+09 =C2=B1  3%     -50.3%  3.852e+09 =C2=B1  3%  cpuidle.C1-IVT.ti=
me
>        175 =C2=B1  5%     -53.2%         82 =C2=B1 13%  numa-vmstat.node1=
.nr_shmem
>       1115 =C2=B1  0%     -50.3%        554 =C2=B1  1%  time.elapsed_time=
.max
>       1115 =C2=B1  0%     -50.3%        554 =C2=B1  1%  time.elapsed_time
>       1147 =C2=B1  0%     -49.0%        585 =C2=B1  1%  uptime.boot
>    2260889 =C2=B1  0%     -48.8%    1157272 =C2=B1  1%  proc-vmstat.pgfree
>      16805 =C2=B1  2%     -35.9%      10776 =C2=B1 23%  numa-vmstat.node1=
.nr_dirty
>       1235 =C2=B1  2%     -47.5%        649 =C2=B1  3%  time.percent_of_c=
pu_this_job_got
>      67245 =C2=B1  2%     -35.9%      43122 =C2=B1 23%  numa-meminfo.node=
1.Dirty
>      39041 =C2=B1  0%     -45.7%      21212 =C2=B1  2%  uptime.idle
>         13 =C2=B1  9%     -49.0%          6 =C2=B1 11%  vmstat.procs.r
>       3072 =C2=B1 10%     -40.3%       1833 =C2=B1  9%  cpuidle.POLL.usage
>    3045115 =C2=B1  0%     -46.1%    1642053 =C2=B1  1%  proc-vmstat.pgfau=
lt
>        202 =C2=B1  1%     -45.2%        110 =C2=B1  0%  proc-vmstat.nr_in=
active_anon
>    4583079 =C2=B1  2%     -31.4%    3143602 =C2=B1 16%  numa-vmstat.node1=
.numa_hit
>      28.03 =C2=B1  0%     +69.1%      47.39 =C2=B1  1%  turbostat.CPU%c6
>        223 =C2=B1  1%     -41.1%        131 =C2=B1  1%  proc-vmstat.nr_sh=
mem
>    4518820 =C2=B1  3%     -30.8%    3128304 =C2=B1 16%  numa-vmstat.node1=
.numa_local
>    3363496 =C2=B1  3%     -27.4%    2441619 =C2=B1 20%  numa-vmstat.node1=
.nr_dirtied
>    3345346 =C2=B1  3%     -27.4%    2428396 =C2=B1 20%  numa-vmstat.node1=
.nr_written
>       0.18 =C2=B1 18%    +105.6%       0.37 =C2=B1 36%  turbostat.Pkg%pc3
>    3427913 =C2=B1  3%     -27.3%    2492563 =C2=B1 20%  numa-vmstat.node1=
.nr_inactive_file
>   13712431 =C2=B1  3%     -27.3%    9971152 =C2=B1 20%  numa-meminfo.node=
1.Inactive
>   13711768 =C2=B1  3%     -27.3%    9970866 =C2=B1 20%  numa-meminfo.node=
1.Inactive(file)
>    3444598 =C2=B1  3%     -27.2%    2508920 =C2=B1 20%  numa-vmstat.node1=
.nr_file_pages
>   13778510 =C2=B1  3%     -27.2%   10036287 =C2=B1 20%  numa-meminfo.node=
1.FilePages
>    8819175 =C2=B1  1%     -28.3%    6320188 =C2=B1 19%  numa-numastat.nod=
e1.numa_hit
>    8819051 =C2=B1  1%     -28.3%    6320152 =C2=B1 19%  numa-numastat.nod=
e1.local_node
>   14350918 =C2=B1  3%     -26.8%   10504070 =C2=B1 19%  numa-meminfo.node=
1.MemUsed
>     100892 =C2=B1  3%     -26.0%      74623 =C2=B1 19%  numa-vmstat.node1=
.nr_slab_reclaimable
>     403571 =C2=B1  3%     -26.0%     298513 =C2=B1 19%  numa-meminfo.node=
1.SReclaimable
>       3525 =C2=B1 13%     +36.6%       4817 =C2=B1 14%  slabinfo.blkdev_r=
equests.active_objs
>       3552 =C2=B1 13%     +36.3%       4841 =C2=B1 14%  slabinfo.blkdev_r=
equests.num_objs
>      30779 =C2=B1  4%     -34.7%      20084 =C2=B1 12%  proc-vmstat.pgmig=
rate_success
>      30779 =C2=B1  4%     -34.7%      20084 =C2=B1 12%  proc-vmstat.numa_=
pages_migrated
>     447400 =C2=B1  2%     -23.2%     343701 =C2=B1 16%  numa-meminfo.node=
1.Slab
>  2.532e+10 =C2=B1  0%     -33.1%  1.694e+10 =C2=B1  1%  cpuidle.C6-IVT.ti=
me
>       3081 =C2=B1  9%     +28.0%       3945 =C2=B1 12%  slabinfo.mnt_cach=
e.num_objs
>       3026 =C2=B1  9%     +28.8%       3898 =C2=B1 12%  slabinfo.mnt_cach=
e.active_objs
>       5822 =C2=B1  4%     +77.8%      10350 =C2=B1 25%  numa-meminfo.node=
1.Writeback
>       1454 =C2=B1  4%     +77.3%       2579 =C2=B1 25%  numa-vmstat.node1=
.nr_writeback
>     424984 =C2=B1  1%     -26.5%     312255 =C2=B1  3%  proc-vmstat.numa_=
pte_updates
>     368001 =C2=B1  1%     -26.8%     269440 =C2=B1  3%  proc-vmstat.numa_=
hint_faults
>     456465 =C2=B1  1%     -26.7%     334594 =C2=B1  4%  time.minor_page_f=
aults
>       3.86 =C2=B1  3%     -24.4%       2.92 =C2=B1  2%  turbostat.CPU%c3
>    4661151 =C2=B1  2%     +20.6%    5622999 =C2=B1  9%  numa-vmstat.node1=
.nr_free_pages
>   18644452 =C2=B1  2%     +20.6%   22491300 =C2=B1  9%  numa-meminfo.node=
1.MemFree
>        876 =C2=B1  2%     +28.2%       1124 =C2=B1  5%  slabinfo.kmalloc-=
4096.num_objs
>        858 =C2=B1  3%     +24.0%       1064 =C2=B1  5%  slabinfo.kmalloc-=
4096.active_objs
>   17767832 =C2=B1  8%     -25.4%   13249545 =C2=B1 17%  cpuidle.POLL.time
>     285093 =C2=B1  1%     -23.1%     219372 =C2=B1  5%  proc-vmstat.numa_=
hint_faults_local
>     105423 =C2=B1  2%     -16.1%      88498 =C2=B1  0%  meminfo.Dirty
>      26365 =C2=B1  1%     -16.0%      22152 =C2=B1  1%  proc-vmstat.nr_di=
rty
>      41.04 =C2=B1  1%     -14.1%      35.26 =C2=B1  1%  turbostat.CPU%c1
>       9385 =C2=B1  4%     -14.3%       8043 =C2=B1  6%  slabinfo.kmalloc-=
192.active_objs
>       9574 =C2=B1  3%     -13.9%       8241 =C2=B1  6%  slabinfo.kmalloc-=
192.num_objs
>       2411 =C2=B1  3%     +17.0%       2820 =C2=B1  4%  slabinfo.kmalloc-=
2048.active_objs
>   12595574 =C2=B1  0%     -10.0%   11338368 =C2=B1  1%  proc-vmstat.pgall=
oc_normal
>       5262 =C2=B1  1%     +13.3%       5962 =C2=B1  1%  slabinfo.kmalloc-=
1024.num_objs
>       5262 =C2=B1  1%     +12.7%       5932 =C2=B1  1%  slabinfo.kmalloc-=
1024.active_objs
>       2538 =C2=B1  3%     +13.7%       2885 =C2=B1  4%  slabinfo.kmalloc-=
2048.num_objs
>    5299546 =C2=B1  0%      -9.9%    4776351 =C2=B1  0%  slabinfo.buffer_h=
ead.active_objs
>    5299546 =C2=B1  0%      -9.9%    4776351 =C2=B1  0%  slabinfo.buffer_h=
ead.num_objs
>     135885 =C2=B1  0%      -9.9%     122470 =C2=B1  0%  slabinfo.buffer_h=
ead.num_slabs
>     135885 =C2=B1  0%      -9.9%     122470 =C2=B1  0%  slabinfo.buffer_h=
ead.active_slabs
>      28.04 =C2=B1  2%    +715.6%     228.69 =C2=B1  3%  iostat.sdb.avgrq-=
sz
>      28.05 =C2=B1  2%    +708.1%     226.72 =C2=B1  2%  iostat.sdc.avgrq-=
sz
>       2245 =C2=B1  3%     -81.6%        413 =C2=B1  1%  iostat.sda.w/s
>       5.33 =C2=B1  1%   +1008.2%      59.07 =C2=B1  1%  iostat.sda.w_await
>       5.85 =C2=B1  1%   +1126.4%      71.69 =C2=B1  4%  iostat.sda.r_await
>       5.36 =C2=B1  1%    +978.6%      57.79 =C2=B1  3%  iostat.sdc.w_await
>       1263 =C2=B1  4%     -85.8%        179 =C2=B1  6%  iostat.sdc.r/s
>       2257 =C2=B1  3%     -81.6%        414 =C2=B1  2%  iostat.sdb.w/s
>       1264 =C2=B1  4%     -85.8%        179 =C2=B1  6%  iostat.sdb.r/s
>       5.55 =C2=B1  0%   +1024.2%      62.37 =C2=B1  4%  iostat.sdb.await
>       5.89 =C2=B1  1%   +1125.9%      72.16 =C2=B1  6%  iostat.sdb.r_await
>       5.36 =C2=B1  0%   +1014.3%      59.75 =C2=B1  3%  iostat.sdb.w_await
>       5.57 =C2=B1  1%    +987.9%      60.55 =C2=B1  3%  iostat.sdc.await
>       5.51 =C2=B1  0%   +1017.3%      61.58 =C2=B1  1%  iostat.sda.await
>       1264 =C2=B1  4%     -85.8%        179 =C2=B1  6%  iostat.sda.r/s
>      28.09 =C2=B1  2%    +714.2%     228.73 =C2=B1  2%  iostat.sda.avgrq-=
sz
>       5.95 =C2=B1  2%   +1091.0%      70.82 =C2=B1  6%  iostat.sdc.r_await
>       2252 =C2=B1  3%     -81.5%        417 =C2=B1  2%  iostat.sdc.w/s
>       4032 =C2=B1  2%    +151.6%      10143 =C2=B1  1%  iostat.sdb.wrqm/s
>       4043 =C2=B1  2%    +151.0%      10150 =C2=B1  1%  iostat.sda.wrqm/s
>       4035 =C2=B1  2%    +151.2%      10138 =C2=B1  1%  iostat.sdc.wrqm/s
>      26252 =C2=B1  1%     -54.0%      12077 =C2=B1  4%  vmstat.system.in
>      37813 =C2=B1  0%    +101.0%      75998 =C2=B1  1%  vmstat.io.bo
>      37789 =C2=B1  0%    +101.0%      75945 =C2=B1  1%  iostat.md0.wkB/s
>        205 =C2=B1  0%     +96.1%        402 =C2=B1  1%  iostat.md0.w/s
>     164286 =C2=B1  1%     -46.2%      88345 =C2=B1  2%  vmstat.system.cs
>      27.07 =C2=B1  2%     -46.7%      14.42 =C2=B1  3%  turbostat.%Busy
>        810 =C2=B1  2%     -46.7%        431 =C2=B1  3%  turbostat.Avg_MHz
>      15.56 =C2=B1  2%     +71.7%      26.71 =C2=B1  1%  iostat.sda.avgqu-=
sz
>      15.65 =C2=B1  2%     +69.1%      26.46 =C2=B1  2%  iostat.sdc.avgqu-=
sz
>      15.67 =C2=B1  2%     +72.7%      27.06 =C2=B1  2%  iostat.sdb.avgqu-=
sz
>      25151 =C2=B1  0%     +68.3%      42328 =C2=B1  1%  iostat.sda.wkB/s
>      25153 =C2=B1  0%     +68.2%      42305 =C2=B1  1%  iostat.sdb.wkB/s
>      25149 =C2=B1  0%     +68.2%      42292 =C2=B1  1%  iostat.sdc.wkB/s
>      97.45 =C2=B1  0%     -21.1%      76.90 =C2=B1  0%  turbostat.CorWatt
>      12517 =C2=B1  0%     -20.2%       9994 =C2=B1  1%  iostat.sdc.rkB/s
>      12517 =C2=B1  0%     -20.0%      10007 =C2=B1  1%  iostat.sda.rkB/s
>      12512 =C2=B1  0%     -19.9%      10018 =C2=B1  1%  iostat.sdb.rkB/s
>       1863 =C2=B1  3%     +24.7%       2325 =C2=B1  1%  iostat.sdb.rrqm/s
>       1865 =C2=B1  3%     +24.3%       2319 =C2=B1  1%  iostat.sdc.rrqm/s
>       1864 =C2=B1  3%     +24.6%       2322 =C2=B1  1%  iostat.sda.rrqm/s
>        128 =C2=B1  0%     -16.4%        107 =C2=B1  0%  turbostat.PkgWatt
>     150569 =C2=B1  0%      -8.7%     137525 =C2=B1  0%  iostat.md0.avgqu-=
sz
>       4.29 =C2=B1  0%      -5.1%       4.07 =C2=B1  0%  turbostat.RAMWatt
> =

> =

> more detailed changes about ivb44/fsmark/1x-64t-4BRD_12G-RAID5-btrfs-4M-3=
0G-NoSync
> ---------
> =

> 26089f4902595a2f  4400755e356f9a2b0b7ceaa02f  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>        273 =C2=B1  4%     -18.1%        223 =C2=B1  6%  fsmark.files_per_=
sec
>      29.24 =C2=B1  1%     +27.2%      37.20 =C2=B1  8%  fsmark.time.elaps=
ed_time.max
>      29.24 =C2=B1  1%     +27.2%      37.20 =C2=B1  8%  fsmark.time.elaps=
ed_time
>        399 =C2=B1  4%     -20.0%        319 =C2=B1  3%  fsmark.time.perce=
nt_of_cpu_this_job_got
>     129891 =C2=B1 20%     -28.9%      92334 =C2=B1 15%  fsmark.time.volun=
tary_context_switches
>        266 =C2=B1  0%    +413.4%       1365 =C2=B1  5%  slabinfo.raid5-md=
0.num_objs
>        266 =C2=B1  0%    +413.4%       1365 =C2=B1  5%  slabinfo.raid5-md=
0.active_objs
>       0.23 =C2=B1 27%     +98.6%       0.46 =C2=B1 35%  turbostat.CPU%c3
>   56612063 =C2=B1  9%     +36.7%   77369763 =C2=B1 20%  cpuidle.C1-IVT.ti=
me
>    5579498 =C2=B1 14%     -36.0%    3571516 =C2=B1  6%  cpuidle.C1E-IVT.t=
ime
>       4668 =C2=B1 38%     +64.7%       7690 =C2=B1 19%  numa-vmstat.node0=
.nr_unevictable
>      18674 =C2=B1 38%     +64.7%      30762 =C2=B1 19%  numa-meminfo.node=
0.Unevictable
>       9298 =C2=B1 37%     +64.4%      15286 =C2=B1 19%  proc-vmstat.nr_un=
evictable
>       4629 =C2=B1 37%     +64.1%       7596 =C2=B1 19%  numa-vmstat.node1=
.nr_unevictable
>      18535 =C2=B1 37%     +63.9%      30385 =C2=B1 19%  numa-meminfo.node=
1.Unevictable
>    4270894 =C2=B1 19%     +65.6%    7070923 =C2=B1 21%  cpuidle.C3-IVT.ti=
me
>      38457 =C2=B1 37%     +59.0%      61148 =C2=B1 19%  meminfo.Unevictab=
le
>    3748226 =C2=B1 17%     +26.6%    4743674 =C2=B1 16%  numa-vmstat.node0=
.numa_local
>    4495283 =C2=B1 13%     -24.8%    3382315 =C2=B1 17%  numa-vmstat.node0=
.nr_free_pages
>    3818432 =C2=B1 16%     +26.5%    4830938 =C2=B1 16%  numa-vmstat.node0=
.numa_hit
>   17966826 =C2=B1 13%     -24.7%   13537228 =C2=B1 17%  numa-meminfo.node=
0.MemFree
>   14901309 =C2=B1 15%     +29.7%   19330906 =C2=B1 12%  numa-meminfo.node=
0.MemUsed
>         26 =C2=B1 21%     -32.9%         17 =C2=B1 14%  cpuidle.POLL.usage
>  1.183e+09 =C2=B1  1%     +29.6%  1.533e+09 =C2=B1  8%  cpuidle.C6-IVT.ti=
me
>      29.24 =C2=B1  1%     +27.2%      37.20 =C2=B1  8%  time.elapsed_time
>      29.24 =C2=B1  1%     +27.2%      37.20 =C2=B1  8%  time.elapsed_time=
.max
>        399 =C2=B1  4%     -20.0%        319 =C2=B1  3%  time.percent_of_c=
pu_this_job_got
>        850 =C2=B1  4%      -8.6%        777 =C2=B1  5%  slabinfo.blkdev_r=
equests.num_objs
>        850 =C2=B1  4%      -8.6%        777 =C2=B1  5%  slabinfo.blkdev_r=
equests.active_objs
>      14986 =C2=B1  9%     +17.1%      17548 =C2=B1  8%  numa-vmstat.node0=
.nr_slab_reclaimable
>      11943 =C2=B1  5%     -12.6%      10441 =C2=B1  2%  slabinfo.kmalloc-=
192.num_objs
>      59986 =C2=B1  9%     +17.0%      70186 =C2=B1  8%  numa-meminfo.node=
0.SReclaimable
>       3703 =C2=B1  6%     +10.2%       4082 =C2=B1  7%  slabinfo.btrfs_de=
layed_data_ref.num_objs
>     133551 =C2=B1  6%     +16.1%     154995 =C2=B1  1%  proc-vmstat.pgfau=
lt
>     129891 =C2=B1 20%     -28.9%      92334 =C2=B1 15%  time.voluntary_co=
ntext_switches
>      11823 =C2=B1  4%     -12.0%      10409 =C2=B1  3%  slabinfo.kmalloc-=
192.active_objs
>       3703 =C2=B1  6%      +9.7%       4061 =C2=B1  7%  slabinfo.btrfs_de=
layed_data_ref.active_objs
>      19761 =C2=B1  2%     -11.2%      17542 =C2=B1  6%  slabinfo.anon_vma=
.active_objs
>      19761 =C2=B1  2%     -11.2%      17544 =C2=B1  6%  slabinfo.anon_vma=
.num_objs
>      13002 =C2=B1  3%     +14.9%      14944 =C2=B1  5%  slabinfo.kmalloc-=
256.num_objs
>      12695 =C2=B1  3%     +13.8%      14446 =C2=B1  7%  slabinfo.kmalloc-=
256.active_objs
>       1190 =C2=B1  1%     -11.8%       1050 =C2=B1  3%  slabinfo.mnt_cach=
e.num_objs
>       1190 =C2=B1  1%     -11.8%       1050 =C2=B1  3%  slabinfo.mnt_cach=
e.active_objs
>     136862 =C2=B1  1%     -13.8%     117938 =C2=B1  7%  cpuidle.C6-IVT.us=
age
>    1692630 =C2=B1  3%     +12.3%    1900854 =C2=B1  0%  numa-vmstat.node0=
.nr_written
>       1056 =C2=B1  2%      +8.8%       1149 =C2=B1  3%  slabinfo.mm_struc=
t.active_objs
>       1056 =C2=B1  2%      +8.8%       1149 =C2=B1  3%  slabinfo.mm_struc=
t.num_objs
>      24029 =C2=B1 11%     -30.6%      16673 =C2=B1  8%  vmstat.system.cs
>       8859 =C2=B1  2%     -15.0%       7530 =C2=B1  8%  vmstat.system.in
>     905630 =C2=B1  2%     -16.8%     753097 =C2=B1  4%  iostat.md0.wkB/s
>     906433 =C2=B1  2%     -16.9%     753482 =C2=B1  4%  vmstat.io.bo
>       3591 =C2=B1  2%     -16.9%       2982 =C2=B1  4%  iostat.md0.w/s
>      13.22 =C2=B1  5%     -16.3%      11.07 =C2=B1  1%  turbostat.%Busy
>        402 =C2=B1  4%     -15.9%        338 =C2=B1  1%  turbostat.Avg_MHz
>      54236 =C2=B1  3%     +10.4%      59889 =C2=B1  4%  iostat.md0.avgqu-=
sz
>       7.67 =C2=B1  1%      +4.5%       8.01 =C2=B1  1%  turbostat.RAMWatt
> =

> =

> =

> 	--yliu
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/


--===============9016819077180716619==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSVZBd1VC
VlJJbG56bnNudDFXWW9HNUFRSmJ2Zy85SC9lQXZYdnlUNzZxVmY4SzVkcWZCRXBXYityVEtzZEUK
dmQ1NWpHYVQwbVVjNG12a1p4SHQ3aExTWENlbjhmZ0JESXcwcTBNVzBIejFMM0plYUVnNmwwMW9B
Mm9DZi80eAprT0FjN0xaaDlEMk04clBNR2RDaldqZlRycjdrZldmd3lSUFBmdFlQaVhBWHJXSGtH
Y2xFWEVlazNRUUhMeUZYCkhxZ3lXNjMzZ3p4Y25KbUxKaG5oL2RKSlYxeDJxQUVtNWdqSXFoMHE3
KzdZbS8yQi9sdyt5SmNEVFhqYmpmaUcKQkwrWnJydFlzUWl1TXcvazc4dG5kQ09HMHplcUhwNTZW
TnN5cHpmcHlKdVZGSm1VYjc5NXpONnFYSm1qY1cyegpJNWlDVEZvc3pjTGw1RUVJTlJxL25hdWg3
UkQ4Z0ZtQ0REUm5CazRtMnNuRkF5aHpWT2RLSW02QWROZUp0TEYzCng4dnAzbWNHUVl2eUZzbTFm
UlpBaHJGVWNKV1QydlRTSmtnSytRM0M3d1E2YmtuaFlEbFFETXJNSXpSUDJvVHIKTlBXZGJBWnE4
Q0d0MEhmYnl2UlFHaHVWSENvNEtybDl2eTZSK1ArTjFlaE5MN0lxcDcvUnNRL1laL3ZVSTdYVgpX
YjE0SFlQUXNDQXQ5UU5XL0FyWTROWWNxR3ZUL3p6anBwOTNXb1dXZmZuSERaUUxuR0FCZ2xBMTJy
U1VCZGwyCjZ2eTY0QW0xa3NRNTc1ZjJ1RUFJN0dmQ2dGclhKMzB3ZFNkWE5aSzVEdG9IMWRhYml4
ckdwbEx5SUpQdDdhMnUKNUpnR3NCRmZHVXhKWXU1TGo3SmlxakxxQUkzbnpBZ01KNjVINVJ5SW84
bjlqNkp4cGFlaFFCTm5KZ0Nrc0RNcApqZDVzTkIrcFBQdz0KPW0xSm8KLS0tLS1FTkQgUEdQIFNJ
R05BVFVSRS0tLS0tCg==

--===============9016819077180716619==--

