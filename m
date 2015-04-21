Content-Type: multipart/mixed; boundary="===============2329436227707246455=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: performance changes on 78373b73: -46.6% fsmark.files_per_sec, and few more
Date: Tue, 21 Apr 2015 12:34:08 +0800
Message-ID: <20150421043408.GH8084@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2329436227707246455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we found changes on `fsmark.files_per_sec' by 78373b7319abdf15050af5b1=
632c4c8b8b398f33:

    > commit 78373b7319abdf15050af5b1632c4c8b8b398f33
    > Author:     Jaegeuk Kim <jaegeuk@kernel.org>
    > AuthorDate: Fri Mar 13 21:44:36 2015 -0700
    > Commit:     Jaegeuk Kim <jaegeuk@kernel.org>
    > CommitDate: Fri Apr 10 15:08:45 2015 -0700
    > =

    >     f2fs: enhance multi-threads performance

3402e87cfb5e762f9c95071bf4a2ad65fd9392a2     78373b7319abdf15050af5b1632c4c=
8b8b398f33
----------------------------------------     ------------------------------=
----------
run time(m)     metric_value     =C2=B1stddev     run time(m)     metric_va=
lue     =C2=B1stddev     change   testbox/benchmark/testcase-params
--- ------  ----------------------------     --- ------  ------------------=
----------     -------- ------------------------------
3   0.3             |490.800|    =C2=B15.7        3   0.5             |262.=
067|    =C2=B10.4          -46.6% ivb44/fsmark/1x-64t-4BRD_12G-RAID0-f2fs-4=
M-30G-fsyncBeforeClose
3   0.3             |468.367|    =C2=B13.5        3   0.5             |264.=
467|    =C2=B10.2          -43.5% ivb44/fsmark/1x-64t-9BRD_6G-RAID0-f2fs-4M=
-30G-fsyncBeforeClose
3   0.6             |211.867|    =C2=B10.7        3   0.7             |191.=
067|    =C2=B10.5           -9.8% ivb44/fsmark/1x-64t-4BRD_12G-RAID5-f2fs-4=
M-30G-fsyncBeforeClose

NOTE: here are some more info about those test parameters for you to
      know what the testcase does better:

      1x: where 'x' means iterations or loop, corresponding to the 'L' opti=
on of fsmark

      1t, 64t: where 't' means thread

      4M: means the single file size, corresponding to the '-s' option of f=
smark
      40G, 30G, 120G: means the total test size

      4BRD_12G: BRD is the ramdisk, where '4' means 4 ramdisk, and where '1=
2G' means
                the size of one ramdisk. So, it would be 48G in total. And =
we made a
                raid on those ramdisk


The change is a bit interesting as you already stated it clear that this
patch is for performance gain. The patch itself is clear, too: remove a
mutex lock. So the only reasonable cause, without too much dig, I can think
of would be the remove of this lock reduces sleep time, and brings more
process to be able run, but somehow increases the context switches and cpu
usage in the meantime at somewhere. I guess this is what the following
changes are trying to tell us:

     29708 =C2=B1  2%   +5720.0%    1729051 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
       302 =C2=B1  0%    +113.8%        647 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     61.05 =C2=B1  0%    +214.0%     191.70 =C2=B1  0%  fsmark.time.system_=
time


FYI, Here I listed all changes for the outstanding change:

3   0.3             |490.800|    =C2=B15.7        3   0.5             |262.=
067|    =C2=B10.4          -46.6% ivb44/fsmark/1x-64t-4BRD_12G-RAID0-f2fs-4=
M-30G-fsyncBeforeClose

3402e87cfb5e762f  78373b7319abdf15050af5b163  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     29708 =C2=B1  2%   +5720.0%    1729051 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
     61.05 =C2=B1  0%    +214.0%     191.70 =C2=B1  0%  fsmark.time.system_=
time
       302 =C2=B1  0%    +113.8%        647 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     10476 =C2=B1  0%     +95.4%      20467 =C2=B1  5%  fsmark.time.minor_p=
age_faults
       490 =C2=B1  5%     -46.6%        262 =C2=B1  0%  fsmark.files_per_sec
     20.21 =C2=B1  0%     +46.7%      29.65 =C2=B1  0%  fsmark.time.elapsed=
_time
     20.21 =C2=B1  0%     +46.7%      29.65 =C2=B1  0%  fsmark.time.elapsed=
_time.max
    226379 =C2=B1  0%     +32.5%     299882 =C2=B1  0%  fsmark.app_overhead
         0 =C2=B1  0%      +Inf%       1045 =C2=B1  2%  proc-vmstat.numa_pa=
ges_migrated
       209 =C2=B1 26%   +3272.3%       7059 =C2=B1  3%  cpuidle.C1E-IVT.usa=
ge
       228 =C2=B1 42%    +686.7%       1799 =C2=B1 14%  numa-meminfo.node0.=
Writeback
     14633 =C2=B1  5%   +7573.2%    1122849 =C2=B1  1%  cpuidle.C1-IVT.usage
         0 =C2=B1  0%      +Inf%       1045 =C2=B1  2%  proc-vmstat.pgmigra=
te_success
     29708 =C2=B1  2%   +5720.0%    1729051 =C2=B1  1%  time.voluntary_cont=
ext_switches
     55663 =C2=B1  0%    +776.9%     488081 =C2=B1  0%  cpuidle.C6-IVT.usage
        56 =C2=B1 42%    +718.8%        464 =C2=B1 11%  numa-vmstat.node0.n=
r_writeback
       535 =C2=B1 29%    +334.4%       2325 =C2=B1 10%  meminfo.Writeback
       129 =C2=B1 30%    +295.6%        511 =C2=B1  4%  proc-vmstat.nr_writ=
eback
     59.25 =C2=B1  5%     -74.2%      15.26 =C2=B1  3%  turbostat.CPU%c6
      2.58 =C2=B1  8%     -74.5%       0.66 =C2=B1 11%  turbostat.Pkg%pc2
 1.551e+08 =C2=B1 14%    +233.4%  5.171e+08 =C2=B1  4%  cpuidle.C1-IVT.time
     32564 =C2=B1 24%    +208.1%     100330 =C2=B1  5%  softirqs.RCU
     61.05 =C2=B1  0%    +214.0%     191.70 =C2=B1  0%  time.system_time
        60 =C2=B1 32%    +165.7%        160 =C2=B1 16%  numa-vmstat.node1.n=
r_writeback
         2 =C2=B1  0%    +200.0%          6 =C2=B1  0%  vmstat.procs.r
      3057 =C2=B1  2%    +166.1%       8136 =C2=B1 22%  numa-vmstat.node0.n=
r_mapped
     12240 =C2=B1  2%    +165.9%      32547 =C2=B1 22%  numa-meminfo.node0.=
Mapped
      6324 =C2=B1  3%    +148.4%      15709 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
     25318 =C2=B1  3%    +148.6%      62931 =C2=B1  0%  meminfo.Mapped
       302 =C2=B1  0%    +113.8%        647 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     34.39 =C2=B1  8%    +102.9%      69.79 =C2=B1  0%  turbostat.CPU%c1
      3247 =C2=B1 32%    +124.9%       7303 =C2=B1 14%  numa-vmstat.node0.n=
r_active_anon
     12994 =C2=B1 32%    +124.8%      29215 =C2=B1 14%  numa-meminfo.node0.=
Active(anon)
      3256 =C2=B1  4%    +132.5%       7569 =C2=B1 23%  numa-vmstat.node1.n=
r_mapped
      3252 =C2=B1 32%    +124.6%       7304 =C2=B1 14%  numa-vmstat.node0.n=
r_anon_pages
     13036 =C2=B1  4%    +132.3%      30279 =C2=B1 23%  numa-meminfo.node1.=
Mapped
     13033 =C2=B1 31%    +124.1%      29214 =C2=B1 14%  numa-meminfo.node0.=
AnonPages
     10476 =C2=B1  0%     +95.4%      20467 =C2=B1  5%  time.minor_page_fau=
lts
    121752 =C2=B1  7%     -35.8%      78122 =C2=B1  2%  numa-meminfo.node0.=
Dirty
     30381 =C2=B1  7%     -36.0%      19456 =C2=B1  2%  numa-vmstat.node0.n=
r_dirty
    113996 =C2=B1  4%     +64.4%     187416 =C2=B1  0%  proc-vmstat.pgfault
     59301 =C2=B1  1%     +60.9%      95414 =C2=B1  1%  softirqs.SCHED
      1.92 =C2=B1  1%     -31.9%       1.31 =C2=B1  4%  turbostat.Pkg%pc6
        16 =C2=B1 35%     +54.2%         24 =C2=B1 10%  cpuidle.POLL.usage
     20.21 =C2=B1  0%     +46.7%      29.65 =C2=B1  0%  time.elapsed_time.m=
ax
     20.21 =C2=B1  0%     +46.7%      29.65 =C2=B1  0%  time.elapsed_time
      7114 =C2=B1  2%     +46.3%      10405 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
     28499 =C2=B1  2%     +46.2%      41659 =C2=B1  0%  meminfo.Active(anon)
     28617 =C2=B1  2%     +45.7%      41692 =C2=B1  0%  meminfo.AnonPages
      7138 =C2=B1  2%     +45.7%      10403 =C2=B1  0%  proc-vmstat.nr_anon=
_pages
     95342 =C2=B1  2%     +44.9%     138177 =C2=B1  6%  numa-meminfo.node0.=
Active
     82347 =C2=B1  2%     +32.3%     108962 =C2=B1  9%  numa-meminfo.node0.=
Active(file)
     20586 =C2=B1  2%     +32.3%      27240 =C2=B1  9%  numa-vmstat.node0.n=
r_active_file
    233023 =C2=B1  3%     -30.7%     161486 =C2=B1  0%  meminfo.Dirty
      0.19 =C2=B1  2%     +36.2%       0.26 =C2=B1  3%  time.user_time
     57900 =C2=B1  3%     -30.5%      40219 =C2=B1  0%  proc-vmstat.nr_dirty
    108006 =C2=B1  8%     -24.6%      81460 =C2=B1  2%  numa-meminfo.node1.=
Dirty
     26896 =C2=B1  8%     -24.4%      20331 =C2=B1  2%  numa-vmstat.node1.n=
r_dirty
    219977 =C2=B1  0%     +32.9%     292456 =C2=B1  1%  softirqs.TIMER
    197382 =C2=B1  1%     +32.6%     261733 =C2=B1  0%  meminfo.Active
     42210 =C2=B1  1%     +30.2%      54947 =C2=B1  0%  proc-vmstat.nr_acti=
ve_file
    168883 =C2=B1  1%     +30.3%     220073 =C2=B1  0%  meminfo.Active(file)
       353 =C2=B1  4%     +21.7%        430 =C2=B1  3%  numa-vmstat.node0.n=
r_page_table_pages
      1425 =C2=B1  4%     +20.2%       1714 =C2=B1  4%  numa-meminfo.node0.=
PageTables
     86494 =C2=B1  2%     +28.0%     110745 =C2=B1 10%  numa-meminfo.node1.=
Active(file)
     21621 =C2=B1  2%     +28.0%      27683 =C2=B1 10%  numa-vmstat.node1.n=
r_active_file
     46.00 =C2=B1  4%     +20.8%      55.56 =C2=B1  3%  uptime.boot
    101939 =C2=B1  4%     +20.8%     123117 =C2=B1  8%  numa-meminfo.node1.=
Active
      1412 =C2=B1  9%     +10.8%       1565 =C2=B1  8%  numa-vmstat.node0.n=
r_alloc_batch
     90644 =C2=B1  6%     +22.4%     110984 =C2=B1  0%  proc-vmstat.pgfree
      2084 =C2=B1  4%     +15.7%       2412 =C2=B1  3%  uptime.idle
     18666 =C2=B1  1%      +9.2%      20390 =C2=B1  4%  slabinfo.anon_vma.n=
um_objs
     18663 =C2=B1  1%      +9.3%      20390 =C2=B1  4%  slabinfo.anon_vma.a=
ctive_objs
    435.51 =C2=B1  0%     -89.9%      43.95 =C2=B1  0%  iostat.md0.avgrq-sz
      6415 =C2=B1  0%    +875.4%      62579 =C2=B1  1%  iostat.md0.w/s
      5595 =C2=B1  1%   +1883.4%     110979 =C2=B1  1%  vmstat.system.cs
    280678 =C2=B1  0%    +315.2%    1165516 =C2=B1  0%  iostat.md0.avgqu-sz
      6.31 =C2=B1  0%    +123.9%      14.14 =C2=B1  0%  turbostat.%Busy
       195 =C2=B1  0%    +116.4%        423 =C2=B1  0%  turbostat.Avg_MHz
     26035 =C2=B1  0%     +76.8%      46037 =C2=B1  0%  vmstat.system.in
   1370424 =C2=B1  0%     -28.1%     985009 =C2=B1  0%  vmstat.io.bo
   1459306 =C2=B1  0%     -28.1%    1048622 =C2=B1  0%  iostat.md0.wkB/s
     72.28 =C2=B1  0%     +29.6%      93.70 =C2=B1  0%  turbostat.CorWatt
       102 =C2=B1  0%     +21.4%        124 =C2=B1  0%  turbostat.PkgWatt
      6.66 =C2=B1  2%      +8.1%       7.19 =C2=B1  0%  turbostat.RAMWatt


--===============2329436227707246455==--

