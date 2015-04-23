Content-Type: multipart/mixed; boundary="===============9029063634223432477=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: performance changes on c9dc4c65: 9.8% fsmark.files_per_sec
Date: Thu, 23 Apr 2015 09:38:01 +0800
Message-ID: <20150423013801.GP8084@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9029063634223432477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we found performance increasement, which is expected as commit patch s=
ays,
on `fsmark.files_per_sec' by c9dc4c6578502c2085705347375b82089aad18d0:

    > commit c9dc4c6578502c2085705347375b82089aad18d0
    > Author:     Chris Mason <clm@fb.com>
    > AuthorDate: Sat Apr 4 17:14:42 2015 -0700
    > Commit:     Chris Mason <clm@fb.com>
    > CommitDate: Fri Apr 10 14:07:11 2015 -0700
    > =

    >     Btrfs: two stage dirty block group writeout

4c6d1d85ad89fd8e32dc9204b7f944854399bda9     c9dc4c6578502c2085705347375b82=
089aad18d0
----------------------------------------     ------------------------------=
----------
run time(m)     metric_value     =C2=B1stddev     run time(m)     metric_va=
lue     =C2=B1stddev     change   testbox/benchmark/testcase-params
--- ------  ----------------------------     --- ------  ------------------=
----------     -------- ------------------------------
3   7.3              |35.267|    =C2=B10.5        5   6.6              |38.=
740|    =C2=B11.6            9.8% ivb44/fsmark/1x-1t-1HDD-btrfs-4M-60G-NoSy=
nc


NOTE: here are some more explanation about those test parameters for you to
      know what the testcase does better:

      1x: where 'x' means iterations or loop, corresponding to the 'L' opti=
on of fsmark

      1t, 64t: where 't' means thread

      4M: means the single file size, corresponding to the '-s' option of f=
smark
      60G: means the total test size


And FYI, here are more changes by the same commit:

4c6d1d85ad89fd8e  c9dc4c6578502c208570534737  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      9864 =C2=B1  2%    +156.9%      25345 =C2=B1  4%  fsmark.time.volunta=
ry_context_switches
         9 =C2=B1  0%     +17.8%         10 =C2=B1  4%  fsmark.time.percent=
_of_cpu_this_job_got
    462211 =C2=B1  1%     +16.8%     539707 =C2=B1  0%  fsmark.app_overhead
     35.27 =C2=B1  0%      +9.8%      38.74 =C2=B1  1%  fsmark.files_per_sec
       435 =C2=B1  0%      -9.0%        396 =C2=B1  1%  fsmark.time.elapsed=
_time.max
       435 =C2=B1  0%      -9.0%        396 =C2=B1  1%  fsmark.time.elapsed=
_time
      5.20 =C2=B1  2%     -70.3%       1.54 =C2=B1  6%  turbostat.Pkg%pc6
   2447873 =C2=B1 42%     -67.9%     785086 =C2=B1 33%  numa-numastat.node1=
.numa_hit
   2413662 =C2=B1 43%     -68.1%     771115 =C2=B1 31%  numa-numastat.node1=
.local_node
      9864 =C2=B1  2%    +156.9%      25345 =C2=B1  4%  time.voluntary_cont=
ext_switches
    187680 =C2=B1 10%    +126.8%     425676 =C2=B1  7%  numa-vmstat.node1.n=
r_dirty
    747361 =C2=B1  9%    +127.8%    1702809 =C2=B1  7%  numa-meminfo.node1.=
Dirty
   1787510 =C2=B1  1%    +117.0%    3878984 =C2=B1  2%  meminfo.Dirty
    446861 =C2=B1  1%    +117.0%     969472 =C2=B1  2%  proc-vmstat.nr_dirty
   1655962 =C2=B1 37%     -59.3%     673988 =C2=B1 29%  numa-vmstat.node1.n=
uma_local
   1036191 =C2=B1  8%    +110.3%    2179311 =C2=B1  3%  numa-meminfo.node0.=
Dirty
    259069 =C2=B1  8%    +110.3%     544783 =C2=B1  3%  numa-vmstat.node0.n=
r_dirty
   1687987 =C2=B1 37%     -58.6%     698626 =C2=B1 29%  numa-vmstat.node1.n=
uma_hit
         1 =C2=B1  0%    +100.0%          2 =C2=B1  0%  vmstat.procs.b
      0.02 =C2=B1  0%    +100.0%       0.04 =C2=B1 22%  turbostat.CPU%c3
      6.03 =C2=B1  1%     +76.9%      10.67 =C2=B1  1%  turbostat.CPU%c1
 5.189e+08 =C2=B1  0%     +72.6%  8.956e+08 =C2=B1  1%  cpuidle.C1-IVT.time
   2646692 =C2=B1  7%     +75.0%    4630890 =C2=B1 23%  cpuidle.C3-IVT.time
      5301 =C2=B1  6%     -31.7%       3620 =C2=B1  3%  slabinfo.btrfs_orde=
red_extent.active_objs
     10549 =C2=B1 16%     -30.3%       7349 =C2=B1 12%  numa-vmstat.node1.n=
r_slab_reclaimable
      5353 =C2=B1  6%     -31.4%       3670 =C2=B1  3%  slabinfo.btrfs_orde=
red_extent.num_objs
     42169 =C2=B1 16%     -30.3%      29397 =C2=B1 12%  numa-meminfo.node1.=
SReclaimable
   1619825 =C2=B1 22%     +39.4%    2258188 =C2=B1  4%  proc-vmstat.pgfree
      4611 =C2=B1  7%     -28.0%       3318 =C2=B1  1%  slabinfo.btrfs_dela=
yed_ref_head.num_objs
      4471 =C2=B1  8%     -27.0%       3264 =C2=B1  2%  slabinfo.btrfs_dela=
yed_ref_head.active_objs
     67.93 =C2=B1  1%     -24.7%      51.15 =C2=B1  4%  turbostat.Pkg%pc2
   2332975 =C2=B1 21%     +45.6%    3396446 =C2=B1  4%  numa-vmstat.node1.n=
uma_other
   2300949 =C2=B1 22%     +46.5%    3371807 =C2=B1  4%  numa-vmstat.node1.n=
uma_miss
   2300941 =C2=B1 22%     +46.5%    3371793 =C2=B1  4%  numa-vmstat.node0.n=
uma_foreign
      2952 =C2=B1  8%     -23.3%       2263 =C2=B1  3%  slabinfo.btrfs_dela=
yed_data_ref.num_objs
   2570716 =C2=B1  3%     +25.7%    3230157 =C2=B1  2%  numa-meminfo.node1.=
Writeback
    642367 =C2=B1  3%     +25.7%     807533 =C2=B1  2%  numa-vmstat.node1.n=
r_writeback
     95408 =C2=B1 13%     -17.3%      78910 =C2=B1  6%  numa-meminfo.node1.=
Slab
      2803 =C2=B1  7%     -21.1%       2210 =C2=B1  3%  slabinfo.btrfs_dela=
yed_data_ref.active_objs
       240 =C2=B1  9%     +23.1%        295 =C2=B1 16%  numa-vmstat.node0.n=
r_page_table_pages
   4626942 =C2=B1 19%     +49.6%    6924087 =C2=B1 22%  cpuidle.C1E-IVT.time
   5585235 =C2=B1  0%     +25.5%    7011242 =C2=B1  0%  meminfo.Writeback
   1396232 =C2=B1  0%     +25.5%    1752892 =C2=B1  0%  proc-vmstat.nr_writ=
eback
       962 =C2=B1  9%     +23.0%       1184 =C2=B1 16%  numa-meminfo.node0.=
PageTables
         9 =C2=B1  0%     +17.8%         10 =C2=B1  4%  time.percent_of_cpu=
_this_job_got
    754027 =C2=B1  2%     +25.2%     944312 =C2=B1  1%  numa-vmstat.node0.n=
r_writeback
   3018674 =C2=B1  2%     +25.1%    3777338 =C2=B1  1%  numa-meminfo.node0.=
Writeback
     23509 =C2=B1  1%     -16.9%      19530 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_objs
      2972 =C2=B1  1%     +21.4%       3607 =C2=B1  0%  proc-vmstat.nr_allo=
c_batch
     13956 =C2=B1  4%     -15.6%      11773 =C2=B1  8%  slabinfo.kmalloc-19=
2.active_objs
       743 =C2=B1  1%     -16.0%        624 =C2=B1  0%  slabinfo.kmalloc-10=
24.active_slabs
       743 =C2=B1  1%     -16.0%        624 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_slabs
     23790 =C2=B1  1%     -16.0%      19983 =C2=B1  0%  slabinfo.kmalloc-10=
24.num_objs
     68983 =C2=B1  2%     +19.1%      82190 =C2=B1  4%  softirqs.RCU
       222 =C2=B1 11%     +47.0%        326 =C2=B1 25%  cpuidle.POLL.usage
     14177 =C2=B1  0%     +17.8%      16702 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_objs
     14045 =C2=B1  0%     +18.0%      16568 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_objs
       885 =C2=B1  0%     +17.8%       1043 =C2=B1  1%  slabinfo.kmalloc-20=
48.num_slabs
       885 =C2=B1  0%     +17.8%       1043 =C2=B1  1%  slabinfo.kmalloc-20=
48.active_slabs
     14025 =C2=B1  4%     -13.3%      12157 =C2=B1  7%  slabinfo.kmalloc-19=
2.num_objs
   8287205 =C2=B1 10%     +16.0%    9611684 =C2=B1  0%  numa-numastat.node0=
.numa_hit
   8276795 =C2=B1 10%     +15.9%    9592682 =C2=B1  0%  numa-numastat.node0=
.local_node
   2615463 =C2=B1  5%      -9.6%    2365256 =C2=B1  2%  numa-vmstat.node1.n=
r_written
      1814 =C2=B1  5%     -12.7%       1584 =C2=B1 11%  numa-meminfo.node1.=
PageTables
       453 =C2=B1  5%     -12.6%        396 =C2=B1 11%  numa-vmstat.node1.n=
r_page_table_pages
    105943 =C2=B1  6%     +13.6%     120352 =C2=B1  2%  numa-meminfo.node0.=
SReclaimable
     26492 =C2=B1  6%     +13.6%      30086 =C2=B1  2%  numa-vmstat.node0.n=
r_slab_reclaimable
      0.41 =C2=B1  1%     +17.1%       0.48 =C2=B1  4%  time.user_time
      2155 =C2=B1  4%     -11.1%       1916 =C2=B1  5%  slabinfo.btrfs_dela=
yed_tree_ref.active_objs
 2.028e+10 =C2=B1  0%     -11.1%  1.803e+10 =C2=B1  1%  cpuidle.C6-IVT.time
      2155 =C2=B1  4%     -10.8%       1922 =C2=B1  5%  slabinfo.btrfs_dela=
yed_tree_ref.num_objs
      1202 =C2=B1  4%     -11.2%       1067 =C2=B1  9%  slabinfo.btrfs_tran=
s_handle.num_objs
      1202 =C2=B1  4%     -11.2%       1067 =C2=B1  9%  slabinfo.btrfs_tran=
s_handle.active_objs
    192641 =C2=B1  5%      +9.8%     211569 =C2=B1  2%  numa-meminfo.node0.=
Slab
    268137 =C2=B1  0%     +12.2%     300911 =C2=B1  2%  cpuidle.C6-IVT.usage
       435 =C2=B1  0%      -9.0%        396 =C2=B1  1%  time.elapsed_time
       435 =C2=B1  0%      -9.0%        396 =C2=B1  1%  time.elapsed_time.m=
ax
     21057 =C2=B1  0%      -9.0%      19165 =C2=B1  1%  uptime.idle
     29.89 =C2=B1  0%     +37.2%      41.01 =C2=B1  3%  turbostat.CorWatt
     59.95 =C2=B1  0%     +19.6%      71.69 =C2=B1  2%  turbostat.PkgWatt
     18873 =C2=B1  0%     +14.9%      21692 =C2=B1  1%  vmstat.system.cs
        21 =C2=B1  2%      +8.8%         23 =C2=B1  3%  turbostat.Avg_MHz
       135 =C2=B1  0%      +9.1%        147 =C2=B1  0%  iostat.sda.avgqu-sz
      0.69 =C2=B1  2%      +7.2%       0.74 =C2=B1  3%  turbostat.%Busy
      7478 =C2=B1  0%      +5.1%       7861 =C2=B1  0%  iostat.sda.await
      7478 =C2=B1  0%      +5.1%       7861 =C2=B1  0%  iostat.sda.w_await
       239 =C2=B1  0%      +3.6%        247 =C2=B1  0%  iostat.sda.wrqm/s
      3.54 =C2=B1  0%      +3.9%       3.68 =C2=B1  0%  turbostat.RAMWatt
    129619 =C2=B1  0%      +3.2%     133743 =C2=B1  0%  vmstat.io.bo
    128667 =C2=B1  0%      +1.9%     131056 =C2=B1  0%  iostat.sda.wkB/s


	--yliu

--===============9029063634223432477==--

