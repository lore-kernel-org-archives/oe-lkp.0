Content-Type: multipart/mixed; boundary="===============7384332872475644536=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [f2fs] 465a05fecc2: +147.3% fsmark.files_per_sec
Date: Mon, 20 Apr 2015 08:44:19 +0800
Message-ID: <1429490659.7977.23.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7384332872475644536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 465a05fecc2c7921d50f33cd10621abc049cbabf ("f2fs: enable inline data =
by default")


testbox/testcase/testparams: lkp-st02/fsmark/1x-32t-1HDD-f2fs-9B-400M-fsync=
BeforeClose-16d-256fpd

6a2de6eb3f267ba6  465a05fecc2c7921d50f33cd10  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

       679 =C2=B1  1%    +147.3%       1681 =C2=B1  1%  fsmark.files_per_sec
        15 =C2=B1  3%    +177.4%         43 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
    150.90 =C2=B1  2%     -59.5%      61.13 =C2=B1  1%  fsmark.time.elapsed=
_time.max
    150.90 =C2=B1  2%     -59.5%      61.13 =C2=B1  1%  fsmark.time.elapsed=
_time
   1771558 =C2=B1  2%      +6.2%    1881064 =C2=B1  0%  fsmark.time.file_sy=
stem_outputs
    949761 =C2=B1  0%     +22.2%    1160509 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
      8240 =C2=B1  3%     +80.1%      14840 =C2=B1  4%  fsmark.time.involun=
tary_context_switches
    184.27 =C2=B1  1%     -48.5%      94.88 =C2=B1  0%  uptime.boot
       525 =C2=B1  2%     -12.3%        460 =C2=B1  1%  uptime.idle
     89898 =C2=B1  0%     -60.6%      35417 =C2=B1  0%  softirqs.BLOCK
     30856 =C2=B1  3%     -19.7%      24774 =C2=B1  2%  softirqs.RCU
     34393 =C2=B1  0%      -9.4%      31172 =C2=B1  0%  softirqs.SCHED
      5775 =C2=B1  1%     +44.3%       8335 =C2=B1  0%  vmstat.io.bo
        18 =C2=B1  3%     -47.2%          9 =C2=B1  5%  vmstat.procs.b
     11960 =C2=B1  1%    +141.8%      28918 =C2=B1  0%  vmstat.system.in
     21443 =C2=B1  1%    +152.8%      54201 =C2=B1  0%  vmstat.system.cs
      3093 =C2=B1  2%      +9.5%       3387 =C2=B1  4%  slabinfo.kmalloc-19=
2.active_objs
      3245 =C2=B1  3%      +4.4%       3388 =C2=B1  4%  slabinfo.kmalloc-19=
2.num_objs
      3627 =C2=B1  1%     +16.7%       4233 =C2=B1  5%  slabinfo.vm_area_st=
ruct.active_objs
      3681 =C2=B1  1%     +16.9%       4302 =C2=B1  5%  slabinfo.vm_area_st=
ruct.num_objs
     32653 =C2=B1  2%     +10.9%      36223 =C2=B1  2%  meminfo.Active(anon)
     32637 =C2=B1  2%     +10.4%      36030 =C2=B1  2%  meminfo.AnonPages
      1517 =C2=B1  0%     -68.3%        481 =C2=B1  4%  meminfo.Mlocked
      3562 =C2=B1  1%     +15.9%       4127 =C2=B1  0%  meminfo.PageTables
      1517 =C2=B1  0%     -68.3%        481 =C2=B1  4%  meminfo.Unevictable
    150.90 =C2=B1  2%     -59.5%      61.13 =C2=B1  1%  time.elapsed_time.m=
ax
    150.90 =C2=B1  2%     -59.5%      61.13 =C2=B1  1%  time.elapsed_time
      8240 =C2=B1  3%     +80.1%      14840 =C2=B1  4%  time.involuntary_co=
ntext_switches
        15 =C2=B1  3%    +177.4%         43 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    949761 =C2=B1  0%     +22.2%    1160509 =C2=B1  0%  time.voluntary_cont=
ext_switches
      8162 =C2=B1  2%     +10.9%       9050 =C2=B1  2%  proc-vmstat.nr_acti=
ve_anon
      8157 =C2=B1  2%     +10.4%       9004 =C2=B1  2%  proc-vmstat.nr_anon=
_pages
       150 =C2=B1  6%     -46.8%         80 =C2=B1  4%  proc-vmstat.nr_dirty
       379 =C2=B1  0%     -68.4%        119 =C2=B1  4%  proc-vmstat.nr_mlock
       889 =C2=B1  1%     +15.8%       1029 =C2=B1  0%  proc-vmstat.nr_page=
_table_pages
       379 =C2=B1  0%     -68.4%        119 =C2=B1  4%  proc-vmstat.nr_unev=
ictable
    220865 =C2=B1  2%     -40.2%     131982 =C2=B1  1%  proc-vmstat.nr_writ=
ten
    411249 =C2=B1  0%     -23.1%     316279 =C2=B1  0%  proc-vmstat.numa_hit
    411249 =C2=B1  0%     -23.1%     316279 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     26883 =C2=B1  1%     +45.7%      39168 =C2=B1  2%  proc-vmstat.pgactiv=
ate
    169935 =C2=B1  1%     -22.0%     132534 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
    264529 =C2=B1  1%     -23.3%     202778 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
    231722 =C2=B1  1%     -51.0%     113542 =C2=B1  0%  proc-vmstat.pgfault
    193885 =C2=B1  2%     -49.8%      97263 =C2=B1  3%  proc-vmstat.pgfree
    883675 =C2=B1  2%     -40.2%     528402 =C2=B1  1%  proc-vmstat.pgpgout
       396 =C2=B1  6%     +72.6%        683 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      5121 =C2=B1  6%    +106.0%      10549 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
        50 =C2=B1 12%     +66.8%         84 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
      3813 =C2=B1 10%     -18.1%       3122 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.exec_clock
      2357 =C2=B1 12%     +65.8%       3907 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      5066 =C2=B1  7%    +107.6%      10516 =C2=B1  8%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
       402 =C2=B1  6%     +71.6%        690 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
        47 =C2=B1  2%     +73.8%         83 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      2234 =C2=B1  2%     +71.6%       3832 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
       144 =C2=B1 15%     -34.3%         94 =C2=B1 16%  sched_debug.cfs_rq[=
2]:/.load
      2213 =C2=B1  8%     +94.6%       4307 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
      5026 =C2=B1  7%    +105.0%      10306 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
        47 =C2=B1  9%     +96.3%         93 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
       404 =C2=B1  6%     +70.6%        690 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
        25 =C2=B1 10%     -33.7%         16 =C2=B1 12%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
       591 =C2=B1 33%    +176.1%       1632 =C2=B1 31%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
       620 =C2=B1 32%    +170.6%       1678 =C2=B1 31%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      5004 =C2=B1  7%    +105.0%      10259 =C2=B1  9%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
       408 =C2=B1  5%     +69.8%        693 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
        13 =C2=B1 12%     -25.0%          9 =C2=B1 15%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
      2289 =C2=B1  4%     +64.4%       3763 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
        48 =C2=B1  4%     +67.5%         81 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
        60 =C2=B1 27%     +50.8%         90 =C2=B1 10%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
       412 =C2=B1  5%     +68.9%        696 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      2784 =C2=B1 26%     +49.6%       4166 =C2=B1 10%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
      4946 =C2=B1  8%    +106.3%      10206 =C2=B1  8%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
        55 =C2=B1  8%     +55.9%         85 =C2=B1  7%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
      4907 =C2=B1  8%    +106.6%      10141 =C2=B1  9%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
       415 =C2=B1  6%     +68.1%        698 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      2564 =C2=B1  8%     +53.9%       3947 =C2=B1  7%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
       191 =C2=B1 13%     -33.9%        126 =C2=B1 31%  sched_debug.cfs_rq[=
5]:/.load
      2337 =C2=B1  6%     +66.3%       3888 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
       419 =C2=B1  6%     +67.2%        700 =C2=B1  4%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
      4900 =C2=B1  8%    +106.2%      10103 =C2=B1  9%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
        50 =C2=B1  7%     +69.5%         84 =C2=B1  8%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
      4844 =C2=B1  7%    +106.1%       9983 =C2=B1  9%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      2327 =C2=B1  7%     +79.9%       4185 =C2=B1 15%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
        50 =C2=B1  7%     +81.5%         90 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
       423 =C2=B1  5%     +66.7%        705 =C2=B1  4%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
    295623 =C2=B1 17%     -18.7%     240304 =C2=B1  6%  sched_debug.cpu#0.n=
r_switches
    107733 =C2=B1 24%     -37.6%      67259 =C2=B1 10%  sched_debug.cpu#0.t=
twu_local
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#0.c=
lock_task
    135495 =C2=B1 18%     -23.9%     103117 =C2=B1  7%  sched_debug.cpu#0.s=
ched_goidle
     26384 =C2=B1  7%     -20.4%      20995 =C2=B1 11%  sched_debug.cpu#0.n=
r_load_updates
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#0.c=
lock
    296932 =C2=B1 17%     -18.7%     241501 =C2=B1  6%  sched_debug.cpu#0.s=
ched_count
     30451 =C2=B1  4%     -26.1%      22493 =C2=B1 12%  sched_debug.cpu#1.n=
r_load_updates
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#1.c=
lock_task
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#1.c=
lock
         3 =C2=B1 25%    +153.8%          8 =C2=B1 48%  sched_debug.cpu#1.c=
pu_load[4]
    715589 =C2=B1  5%     -19.1%     578901 =C2=B1 11%  sched_debug.cpu#1.a=
vg_idle
       142 =C2=B1 16%     -33.3%         94 =C2=B1 16%  sched_debug.cpu#2.l=
oad
         5 =C2=B1 31%    +114.3%         11 =C2=B1 15%  sched_debug.cpu#2.c=
pu_load[3]
    126380 =C2=B1 10%     -18.8%     102610 =C2=B1  3%  sched_debug.cpu#2.s=
ched_goidle
       418 =C2=B1 19%     -41.2%        245 =C2=B1 12%  sched_debug.cpu#2.c=
urr->pid
    277074 =C2=B1  9%     -13.8%     238909 =C2=B1  3%  sched_debug.cpu#2.s=
ched_count
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#2.c=
lock_task
    277012 =C2=B1  9%     -13.8%     238854 =C2=B1  3%  sched_debug.cpu#2.n=
r_switches
         9 =C2=B1 28%     +89.5%         18 =C2=B1 27%  sched_debug.cpu#2.c=
pu_load[2]
     98388 =C2=B1 14%     -32.3%      66641 =C2=B1  5%  sched_debug.cpu#2.t=
twu_local
    740677 =C2=B1  2%     -21.0%     584865 =C2=B1  9%  sched_debug.cpu#2.a=
vg_idle
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#2.c=
lock
         3 =C2=B1 31%    +142.9%          8 =C2=B1 31%  sched_debug.cpu#2.c=
pu_load[4]
     25773 =C2=B1  9%     -19.9%      20654 =C2=B1  8%  sched_debug.cpu#2.n=
r_load_updates
    690785 =C2=B1  3%     -14.3%     591985 =C2=B1  6%  sched_debug.cpu#3.a=
vg_idle
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#3.c=
lock_task
     30028 =C2=B1  5%     -30.5%      20877 =C2=B1 13%  sched_debug.cpu#3.n=
r_load_updates
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#3.c=
lock
    113746 =C2=B1 18%     -37.1%      71517 =C2=B1 18%  sched_debug.cpu#4.t=
twu_local
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#4.c=
lock
     27593 =C2=B1  7%     -36.0%      17656 =C2=B1  4%  sched_debug.cpu#4.n=
r_load_updates
    106260 =C2=B1  1%     -40.8%      62862 =C2=B1  0%  sched_debug.cpu#4.c=
lock_task
    141639 =C2=B1 14%     -24.8%     106524 =C2=B1 12%  sched_debug.cpu#4.s=
ched_goidle
       184 =C2=B1 13%     -31.3%        126 =C2=B1 31%  sched_debug.cpu#5.l=
oad
     28115 =C2=B1  9%     -26.4%      20695 =C2=B1 15%  sched_debug.cpu#5.n=
r_load_updates
    106261 =C2=B1  1%     -40.8%      62863 =C2=B1  0%  sched_debug.cpu#5.c=
lock_task
    106261 =C2=B1  1%     -40.8%      62863 =C2=B1  0%  sched_debug.cpu#5.c=
lock
    710881 =C2=B1  5%     -13.0%     618742 =C2=B1 11%  sched_debug.cpu#5.a=
vg_idle
    151901 =C2=B1 11%     -29.7%     106778 =C2=B1  9%  sched_debug.cpu#6.s=
ched_goidle
    106261 =C2=B1  1%     -40.8%      62861 =C2=B1  0%  sched_debug.cpu#6.c=
lock_task
    106261 =C2=B1  1%     -40.8%      62861 =C2=B1  0%  sched_debug.cpu#6.c=
lock
    124231 =C2=B1 14%     -42.0%      72021 =C2=B1 14%  sched_debug.cpu#6.t=
twu_local
     27846 =C2=B1  4%     -38.4%      17152 =C2=B1  3%  sched_debug.cpu#6.n=
r_load_updates
    175655 =C2=B1  9%     -21.3%     138225 =C2=B1  7%  sched_debug.cpu#6.t=
twu_count
    328538 =C2=B1 10%     -25.1%     246230 =C2=B1  8%  sched_debug.cpu#6.n=
r_switches
    328606 =C2=B1 10%     -25.1%     246282 =C2=B1  8%  sched_debug.cpu#6.s=
ched_count
    106261 =C2=B1  1%     -40.8%      62863 =C2=B1  0%  sched_debug.cpu#7.c=
lock
     27346 =C2=B1  9%     -26.6%      20061 =C2=B1 15%  sched_debug.cpu#7.n=
r_load_updates
    106261 =C2=B1  1%     -40.8%      62863 =C2=B1  0%  sched_debug.cpu#7.c=
lock_task
    106261 =C2=B1  1%     -40.8%      62863 =C2=B1  0%  sched_debug.cpu_clk
    106261 =C2=B1  1%     -40.8%      62863 =C2=B1  0%  sched_debug.ktime
    107044 =C2=B1  1%     -40.5%      63646 =C2=B1  0%  sched_debug.sched_c=
lk

testbox/testcase/testparams: nhm4/fsmark/performance-1x-32t-1HDD-f2fs-9B-40=
0M-fsyncBeforeClose-16d-256fpd

6a2de6eb3f267ba6  465a05fecc2c7921d50f33cd10  =

----------------  --------------------------  =

   9381393 =C2=B1  2%     -52.3%    4475975 =C2=B1 15%  fsmark.app_overhead
       559 =C2=B1  0%    +134.7%       1313 =C2=B1  0%  fsmark.files_per_sec
        12 =C2=B1  0%    +214.6%         37 =C2=B1  1%  fsmark.time.percent=
_of_cpu_this_job_got
    183.94 =C2=B1  0%     -57.3%      78.57 =C2=B1  0%  fsmark.time.elapsed=
_time.max
    183.94 =C2=B1  0%     -57.3%      78.57 =C2=B1  0%  fsmark.time.elapsed=
_time
   1839298 =C2=B1  0%      +4.3%    1918608 =C2=B1  0%  fsmark.time.file_sy=
stem_outputs
     22.50 =C2=B1  0%     +30.0%      29.25 =C2=B1  0%  fsmark.time.system_=
time
    761103 =C2=B1  0%     +37.7%    1048153 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     19670 =C2=B1  0%     -30.8%      13615 =C2=B1  3%  fsmark.time.involun=
tary_context_switches
    206.26 =C2=B1  1%     -51.7%      99.57 =C2=B1  0%  uptime.boot
       367 =C2=B1  5%     +42.1%        522 =C2=B1  1%  uptime.idle
     47369 =C2=B1  0%     -65.4%      16377 =C2=B1  0%  softirqs.BLOCK
     29294 =C2=B1  2%     -13.9%      25233 =C2=B1  2%  softirqs.RCU
      2.29 =C2=B1  0%    +151.2%       5.76 =C2=B1  0%  turbostat.%Busy
        68 =C2=B1  0%    +174.0%        187 =C2=B1  0%  turbostat.Avg_MHz
     40.65 =C2=B1  1%     +82.9%      74.36 =C2=B1  0%  turbostat.CPU%c1
     48.36 =C2=B1  0%     -76.3%      11.44 =C2=B1  4%  turbostat.CPU%c3
      4943 =C2=B1  0%     +37.1%       6778 =C2=B1  0%  vmstat.io.bo
        14 =C2=B1  2%     -33.9%          9 =C2=B1 11%  vmstat.procs.b
      5720 =C2=B1  0%    +112.1%      12131 =C2=B1  0%  vmstat.system.in
     18895 =C2=B1  0%    +135.5%      44500 =C2=B1  0%  vmstat.system.cs
     58365 =C2=B1  2%      -8.8%      53258 =C2=B1  0%  meminfo.DirectMap4k
      1541 =C2=B1  0%     -60.0%        616 =C2=B1  0%  meminfo.Mlocked
      1541 =C2=B1  0%     -60.0%        616 =C2=B1  0%  meminfo.Unevictable
    183.94 =C2=B1  0%     -57.3%      78.57 =C2=B1  0%  time.elapsed_time.m=
ax
    183.94 =C2=B1  0%     -57.3%      78.57 =C2=B1  0%  time.elapsed_time
     19670 =C2=B1  0%     -30.8%      13615 =C2=B1  3%  time.involuntary_co=
ntext_switches
        12 =C2=B1  0%    +214.6%         37 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
     22.50 =C2=B1  0%     +30.0%      29.25 =C2=B1  0%  time.system_time
      1.13 =C2=B1  2%     -28.6%       0.80 =C2=B1  3%  time.user_time
    761103 =C2=B1  0%     +37.7%    1048153 =C2=B1  0%  time.voluntary_cont=
ext_switches
    982895 =C2=B1  0%     -28.3%     704285 =C2=B1  0%  cpuidle.C1-NHM.usage
 3.274e+08 =C2=B1  1%     -14.2%   2.81e+08 =C2=B1  1%  cpuidle.C1-NHM.time
    180656 =C2=B1  3%    +254.8%     641058 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
  42872379 =C2=B1  2%     +96.4%   84210125 =C2=B1  0%  cpuidle.C1E-NHM.time
    373512 =C2=B1  0%     -60.1%     149080 =C2=B1  1%  cpuidle.C3-NHM.usage
 7.652e+08 =C2=B1  0%     -85.6%  1.099e+08 =C2=B1  2%  cpuidle.C3-NHM.time
 3.122e+08 =C2=B1  3%     -59.8%  1.254e+08 =C2=B1  1%  cpuidle.C6-NHM.time
    134366 =C2=B1  2%     -25.7%      99891 =C2=B1  1%  cpuidle.C6-NHM.usage
      2400 =C2=B1  1%     +80.8%       4339 =C2=B1  1%  cpuidle.POLL.usage
       143 =C2=B1  2%     -48.3%         74 =C2=B1  6%  proc-vmstat.nr_dirty
       385 =C2=B1  0%     -60.0%        154 =C2=B1  0%  proc-vmstat.nr_mlock
       385 =C2=B1  0%     -60.0%        154 =C2=B1  0%  proc-vmstat.nr_unev=
ictable
    230004 =C2=B1  0%     -40.3%     137234 =C2=B1  0%  proc-vmstat.nr_writ=
ten
    436867 =C2=B1  0%     -25.6%     325170 =C2=B1  0%  proc-vmstat.numa_hit
    436867 =C2=B1  0%     -25.6%     325170 =C2=B1  0%  proc-vmstat.numa_lo=
cal
     24976 =C2=B1  0%     +79.6%      44865 =C2=B1  0%  proc-vmstat.pgactiv=
ate
    467392 =C2=B1  0%     -24.9%     350901 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
    268016 =C2=B1  0%     -51.5%     129939 =C2=B1  0%  proc-vmstat.pgfault
    226937 =C2=B1  1%     -51.6%     109882 =C2=B1  1%  proc-vmstat.pgfree
    919916 =C2=B1  0%     -40.3%     548911 =C2=B1  0%  proc-vmstat.pgpgout
       283 =C2=B1  3%    +131.3%        655 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      7165 =C2=B1  5%     +85.5%      13292 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      6701 =C2=B1  7%     +11.4%       7465 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.min_vruntime
        38 =C2=B1  6%    +133.6%         88 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
      1783 =C2=B1  6%    +129.9%       4100 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      7165 =C2=B1  5%     +85.2%      13270 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
       285 =C2=B1  3%    +130.6%        658 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
        41 =C2=B1 24%    +103.0%         83 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      4678 =C2=B1  4%     +19.4%       5586 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      1920 =C2=B1 24%    +100.2%       3843 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
      4979 =C2=B1  7%     +14.6%       5704 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      1682 =C2=B1  5%    +127.1%       3820 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
      7133 =C2=B1  5%     +86.0%      13267 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
        36 =C2=B1  6%    +129.9%         82 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
       287 =C2=B1  3%    +130.2%        662 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      7125 =C2=B1  5%     +82.1%      12973 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
       290 =C2=B1  4%    +128.4%        663 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
      1624 =C2=B1  4%    +134.6%       3810 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
        34 =C2=B1  5%    +140.9%         82 =C2=B1  9%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
        32 =C2=B1 10%    +149.2%         81 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
       293 =C2=B1  4%    +127.2%        665 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      1172 =C2=B1 29%    +137.4%       2782 =C2=B1 18%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      3666 =C2=B1  4%     +20.7%       4426 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.min_vruntime
      1214 =C2=B1 31%    +138.4%       2893 =C2=B1 17%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      1535 =C2=B1 10%    +143.7%       3741 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
      7125 =C2=B1  5%     +82.3%      12986 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
        34 =C2=B1 17%    +133.8%         79 =C2=B1 15%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
      7121 =C2=B1  5%     +82.8%      13020 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
       294 =C2=B1  4%    +127.2%        669 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      1034 =C2=B1 32%    +123.5%       2312 =C2=B1 23%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
      3739 =C2=B1  2%     +28.2%       4792 =C2=B1 12%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      1589 =C2=B1 16%    +131.5%       3679 =C2=B1 15%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
      1001 =C2=B1 32%    +128.8%       2292 =C2=B1 23%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
      3851 =C2=B1  1%     +19.0%       4583 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.min_vruntime
      1882 =C2=B1  5%     +94.7%       3666 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
       297 =C2=B1  4%    +126.0%        671 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
      7120 =C2=B1  5%     +82.7%      13005 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
        40 =C2=B1  5%     +95.1%         79 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
      3826 =C2=B1  2%     +17.5%       4495 =C2=B1  6%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      7078 =C2=B1  5%     +83.5%      12987 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      1517 =C2=B1  9%    +155.4%       3875 =C2=B1 14%  sched_debug.cfs_rq[=
7]:/.avg->runnable_avg_sum
        32 =C2=B1  9%    +162.5%         84 =C2=B1 15%  sched_debug.cfs_rq[=
7]:/.tg_runnable_contrib
       299 =C2=B1  3%    +125.0%        673 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
    331525 =C2=B1  3%     -34.0%     218740 =C2=B1  5%  sched_debug.cpu#0.n=
r_switches
    142801 =C2=B1  4%     -48.4%      73667 =C2=B1  5%  sched_debug.cpu#0.t=
twu_local
    678550 =C2=B1  7%     -32.7%     456720 =C2=B1 34%  sched_debug.cpu#0.a=
vg_idle
    313488 =C2=B1  1%     -31.1%     215938 =C2=B1  4%  sched_debug.cpu#0.t=
twu_count
    111534 =C2=B1  2%     -49.4%      56460 =C2=B1  3%  sched_debug.cpu#0.c=
lock_task
    155708 =C2=B1  3%     -38.2%      96199 =C2=B1  5%  sched_debug.cpu#0.s=
ched_goidle
     28188 =C2=B1  1%     -33.4%      18783 =C2=B1  3%  sched_debug.cpu#0.n=
r_load_updates
    111534 =C2=B1  2%     -49.4%      56460 =C2=B1  3%  sched_debug.cpu#0.c=
lock
    331695 =C2=B1  3%     -34.0%     218808 =C2=B1  5%  sched_debug.cpu#0.s=
ched_count
    446397 =C2=B1  5%     -18.7%     362850 =C2=B1  3%  sched_debug.cpu#1.s=
ched_count
    208484 =C2=B1  6%     -13.1%     181078 =C2=B1  3%  sched_debug.cpu#1.t=
twu_count
     29358 =C2=B1  2%     -32.6%      19790 =C2=B1  1%  sched_debug.cpu#1.n=
r_load_updates
    111537 =C2=B1  2%     -49.4%      56461 =C2=B1  3%  sched_debug.cpu#1.c=
lock_task
    111537 =C2=B1  2%     -49.4%      56461 =C2=B1  3%  sched_debug.cpu#1.c=
lock
    446310 =C2=B1  5%     -18.7%     362793 =C2=B1  3%  sched_debug.cpu#1.n=
r_switches
    214342 =C2=B1  6%     -22.4%     166319 =C2=B1  3%  sched_debug.cpu#1.s=
ched_goidle
    166966 =C2=B1  8%     -26.5%     122663 =C2=B1  4%  sched_debug.cpu#1.t=
twu_local
    707893 =C2=B1  7%     -31.1%     487966 =C2=B1  9%  sched_debug.cpu#1.a=
vg_idle
    198095 =C2=B1  3%     -11.9%     174593 =C2=B1  9%  sched_debug.cpu#2.s=
ched_goidle
    111536 =C2=B1  2%     -49.4%      56460 =C2=B1  3%  sched_debug.cpu#2.c=
lock_task
    151594 =C2=B1  4%     -12.4%     132847 =C2=B1 11%  sched_debug.cpu#2.t=
twu_local
    711629 =C2=B1  8%     -48.7%     364936 =C2=B1 30%  sched_debug.cpu#2.a=
vg_idle
    111536 =C2=B1  2%     -49.4%      56460 =C2=B1  3%  sched_debug.cpu#2.c=
lock
     28629 =C2=B1  4%     -32.1%      19433 =C2=B1  7%  sched_debug.cpu#2.n=
r_load_updates
    164980 =C2=B1 11%     -32.8%     110931 =C2=B1  7%  sched_debug.cpu#3.t=
twu_local
    441918 =C2=B1  8%     -24.3%     334685 =C2=B1  6%  sched_debug.cpu#3.s=
ched_count
    441832 =C2=B1  8%     -24.3%     334627 =C2=B1  6%  sched_debug.cpu#3.n=
r_switches
    718484 =C2=B1  5%     -34.8%     468267 =C2=B1 21%  sched_debug.cpu#3.a=
vg_idle
    207428 =C2=B1  9%     -18.2%     169613 =C2=B1  6%  sched_debug.cpu#3.t=
twu_count
    111536 =C2=B1  2%     -49.4%      56462 =C2=B1  3%  sched_debug.cpu#3.c=
lock_task
     29300 =C2=B1  4%     -33.8%      19394 =C2=B1  7%  sched_debug.cpu#3.n=
r_load_updates
    111536 =C2=B1  2%     -49.4%      56462 =C2=B1  3%  sched_debug.cpu#3.c=
lock
    212194 =C2=B1  9%     -28.0%     152779 =C2=B1  6%  sched_debug.cpu#3.s=
ched_goidle
      2015 =C2=B1  1%     -36.0%       1290 =C2=B1  1%  sched_debug.cpu#4.n=
r_uninterruptible
     68219 =C2=B1  3%     +16.4%      79412 =C2=B1  3%  sched_debug.cpu#4.t=
twu_count
    111535 =C2=B1  2%     -49.4%      56461 =C2=B1  3%  sched_debug.cpu#4.c=
lock
     15884 =C2=B1  0%     -35.3%      10276 =C2=B1  5%  sched_debug.cpu#4.n=
r_load_updates
    111535 =C2=B1  2%     -49.4%      56461 =C2=B1  3%  sched_debug.cpu#4.c=
lock_task
    101874 =C2=B1 19%     -26.3%      75129 =C2=B1  7%  sched_debug.cpu#5.s=
ched_goidle
     67242 =C2=B1 29%     -39.0%      41027 =C2=B1 11%  sched_debug.cpu#5.t=
twu_local
     16499 =C2=B1  7%     -36.4%      10496 =C2=B1  5%  sched_debug.cpu#5.n=
r_load_updates
    218670 =C2=B1 17%     -19.5%     175923 =C2=B1  6%  sched_debug.cpu#5.n=
r_switches
         3 =C2=B1 25%    +123.1%          7 =C2=B1 46%  sched_debug.cpu#5.c=
pu_load[4]
    111534 =C2=B1  2%     -49.4%      56454 =C2=B1  3%  sched_debug.cpu#5.c=
lock_task
    111534 =C2=B1  2%     -49.4%      56454 =C2=B1  3%  sched_debug.cpu#5.c=
lock
    748334 =C2=B1  5%     -24.6%     563910 =C2=B1 15%  sched_debug.cpu#5.a=
vg_idle
    218737 =C2=B1 17%     -19.6%     175958 =C2=B1  6%  sched_debug.cpu#5.s=
ched_count
    111534 =C2=B1  2%     -49.4%      56460 =C2=B1  3%  sched_debug.cpu#6.c=
lock_task
    111534 =C2=B1  2%     -49.4%      56460 =C2=B1  3%  sched_debug.cpu#6.c=
lock
     15913 =C2=B1  1%     -31.5%      10903 =C2=B1 10%  sched_debug.cpu#6.n=
r_load_updates
    697624 =C2=B1  9%     -19.9%     559027 =C2=B1  3%  sched_debug.cpu#6.a=
vg_idle
    199869 =C2=B1  3%     -17.1%     165770 =C2=B1  8%  sched_debug.cpu#7.s=
ched_count
    199797 =C2=B1  3%     -17.0%     165733 =C2=B1  8%  sched_debug.cpu#7.n=
r_switches
    111533 =C2=B1  2%     -49.4%      56460 =C2=B1  3%  sched_debug.cpu#7.c=
lock
     16124 =C2=B1  2%     -36.8%      10191 =C2=B1  7%  sched_debug.cpu#7.n=
r_load_updates
     57841 =C2=B1  6%     -37.1%      36364 =C2=B1 13%  sched_debug.cpu#7.t=
twu_local
     92125 =C2=B1  3%     -24.0%      70057 =C2=B1  9%  sched_debug.cpu#7.s=
ched_goidle
    111533 =C2=B1  2%     -49.4%      56460 =C2=B1  3%  sched_debug.cpu#7.c=
lock_task
    111537 =C2=B1  2%     -49.4%      56462 =C2=B1  3%  sched_debug.cpu_clk
    111387 =C2=B1  2%     -49.4%      56313 =C2=B1  3%  sched_debug.ktime
    111537 =C2=B1  2%     -49.4%      56462 =C2=B1  3%  sched_debug.sched_c=
lk

lkp-st02: Core2
Memory: 8G

nhm4: Nehalem
Memory: 4G


                                  vmstat.system.cs

  60000 ++-----------------------------------------------------------------=
-+
        |     O  O             O    O  O  O  O  O  O O  O  O  O  O  O O  O =
 O
  50000 O+         O     O        O                                        =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  40000 ++                                                                 =
 |
        |                        .*.                                       =
 |
  30000 ++.*..           *..  .*.   *..                                    =
 |
        *.    *          :  *.                                             =
 |
  20000 ++     :        :              *..*..*..*..*.*..*..*               =
 |
        |      :        :                                                  =
 |
        |       :      :                                                   =
 |
  10000 ++      :      :                                                   =
 |
        |        :    :                                                    =
 |
      0 ++-O-----*-*--O-----O----------------------------------------------=
-+


                                   softirqs.BLOCK

  120000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  100000 *+.*..*          *..*.*..*..*..                                   =
 |
         |     :          :                 .*..*..  .*.  .*               =
 |
         |     :          :             *..*       *.   *.                 =
 |
   80000 ++     :        :                                                 =
 |
         |      :        :                                                 =
 |
   60000 ++     :        :                                                 =
 |
         |      :        :                                                 =
 |
   40000 ++     :       :                                                  =
 |
         O     O:O  O   : O    O  O  O  O  O O  O  O  O O  O  O  O  O O  O =
 O
         |       :      :                                                  =
 |
   20000 ++      :      :                                                  =
 |
         |       :     :                                                   =
 |
       0 ++-O----*--*--O-----O---------------------------------------------=
-+


                               fsmark.files_per_sec

  1800 ++------------------------------------------------------------------=
-+
       O     O  O  O    O     O  O  O  O  O O  O  O  O  O  O  O  O O  O  O =
 O
  1600 ++                                                                  =
 |
  1400 ++                                                                  =
 |
       |                                                                   =
 |
  1200 ++                                                                  =
 |
  1000 ++                       .*..                                       =
 |
       *..*..*          *..*..*.    *..                                    =
 |
   800 ++    :          :                                                  =
 |
   600 ++     :        :               *..*.*..*..*..*..*..*               =
 |
       |      :        :                                                   =
 |
   400 ++      :      :                                                    =
 |
   200 ++      :      :                                                    =
 |
       |        :    :                                                     =
 |
     0 ++-O-----*--*-O-----O-----------------------------------------------=
-+


                     fsmark.time.percent_of_cpu_this_job_got

  45 ++--------------------------------------------------------------------=
-+
     O     O  O  O     O     O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O =
 O
  40 ++                                                                    =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
     |                 *..     .*..                                        =
 |
  20 *+.*..*           :  *..*.    *..                                     =
 |
  15 ++     :         :               *..*.*..*..*..*..*..*                =
 |
     |      :         :                                                    =
 |
  10 ++      :       :                                                     =
 |
   5 ++      :       :                                                     =
 |
     |        :     :                                                      =
 |
   0 ++-O-----*--*--O-----O------------------------------------------------=
-+


                        fsmark.time.voluntary_context_switches

  1.2e+06 ++--------------------O-------O--------O-----------------------O-=
-O
          O     O O  O     O       O  O    O  O    O  O  O  O O  O  O  O   =
 |
    1e+06 ++                                                               =
 |
          *..*..*          *.*..*..*..*.*..*..*..*.*..*..*..*              =
 |
          |     :          :                                               =
 |
   800000 ++    :         :                                                =
 |
          |      :        :                                                =
 |
   600000 ++     :        :                                                =
 |
          |      :        :                                                =
 |
   400000 ++     :       :                                                 =
 |
          |      :       :                                                 =
 |
          |      :       :                                                 =
 |
   200000 ++      :      :                                                 =
 |
          |       :     :                                                  =
 |
        0 ++-O----*--*--O----O---------------------------------------------=
-+


                      fsmark.time.involuntary_context_switches

  16000 ++-----------------------------------------------------------------=
-O
        O     O  O                  O  O  O  O  O    O     O  O  O    O  O =
 |
  14000 ++         O     O     O  O                O    O           O      =
 |
  12000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++               *..                                               =
 |
        *..*..*          :  *..*..*.*..                .*..                =
 |
   8000 ++    :         :              *..*..*..*..*.*.    *               =
 |
        |      :        :                                                  =
 |
   6000 ++     :        :                                                  =
 |
   4000 ++      :      :                                                   =
 |
        |       :      :                                                   =
 |
   2000 ++      :      :                                                   =
 |
        |        :    :                                                    =
 |
      0 ++-O-----*-*--O-----O----------------------------------------------=
-+


                                time.system_time

  30 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  25 O+    O  O  O     O     O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O =
 O
     |                               .*..*.*..*..*..*..*..*                =
 |
     *..*..*           *..*..*..*..*.                                      =
 |
  20 ++    :           :                                                   =
 |
     |      :         :                                                    =
 |
  15 ++     :         :                                                    =
 |
     |      :         :                                                    =
 |
  10 ++      :        :                                                    =
 |
     |       :       :                                                     =
 |
     |       :       :                                                     =
 |
   5 ++      :       :                                                     =
 |
     |        :     :                                                      =
 |
   0 ++-O-----*--*--O-----O------------------------------------------------=
-+


                        time.percent_of_cpu_this_job_got

  45 ++--------------------------------------------------------------------=
-+
     O     O  O  O     O     O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O =
 O
  40 ++                                                                    =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
     |                 *..     .*..                                        =
 |
  20 *+.*..*           :  *..*.    *..                                     =
 |
  15 ++     :         :               *..*.*..*..*..*..*..*                =
 |
     |      :         :                                                    =
 |
  10 ++      :       :                                                     =
 |
   5 ++      :       :                                                     =
 |
     |        :     :                                                      =
 |
   0 ++-O-----*--*--O-----O------------------------------------------------=
-+


                            time.voluntary_context_switches

  1.2e+06 ++--------------------O-------O--------O-----------------------O-=
-O
          O     O O  O     O       O  O    O  O    O  O  O  O O  O  O  O   =
 |
    1e+06 ++                                                               =
 |
          *..*..*          *.*..*..*..*.*..*..*..*.*..*..*..*              =
 |
          |     :          :                                               =
 |
   800000 ++    :         :                                                =
 |
          |      :        :                                                =
 |
   600000 ++     :        :                                                =
 |
          |      :        :                                                =
 |
   400000 ++     :       :                                                 =
 |
          |      :       :                                                 =
 |
          |      :       :                                                 =
 |
   200000 ++      :      :                                                 =
 |
          |       :     :                                                  =
 |
        0 ++-O----*--*--O----O---------------------------------------------=
-+


                          time.involuntary_context_switches

  16000 ++-----------------------------------------------------------------=
-O
        O     O  O                  O  O  O  O  O    O     O  O  O    O  O =
 |
  14000 ++         O     O     O  O                O    O           O      =
 |
  12000 ++                                                                 =
 |
        |                                                                  =
 |
  10000 ++               *..                                               =
 |
        *..*..*          :  *..*..*.*..                .*..                =
 |
   8000 ++    :         :              *..*..*..*..*.*.    *               =
 |
        |      :        :                                                  =
 |
   6000 ++     :        :                                                  =
 |
   4000 ++      :      :                                                   =
 |
        |       :      :                                                   =
 |
   2000 ++      :      :                                                   =
 |
        |        :    :                                                    =
 |
      0 ++-O-----*-*--O-----O----------------------------------------------=
-+


                               proc-vmstat.nr_dirty

  180 ++-------------------------------------------------------------------=
-+
      |  *..                                      *..                      =
 |
  160 ++.                   .*..*..  .*..*..*.. ..     .*..*               =
 |
  140 *+    *           *.*.       *.          *     *.                    =
 |
      |     :           :                                                  =
 |
  120 ++     :         :                                                   =
 |
  100 ++     :         :              O  O  O                              =
 |
      |     O:    O    :O                      O     O     O    O        O =
 |
   80 ++     :         :     O  O  O                         O     O  O    =
 O
   60 O+      :O      :                           O     O                  =
 |
      |       :       :                                                    =
 |
   40 ++      :       :                                                    =
 |
   20 ++      :       :                                                    =
 |
      |        :     :                                                     =
 |
    0 ++-O-----*--*--O----O------------------------------------------------=
-+


                               proc-vmstat.nr_written

  250000 ++----------------------------------------------------------------=
-+
         |    .*                               .*..  .*.                   =
 |
         *..*. :          *..*.*..*..*..*..*.*.    *.   *..*               =
 |
  200000 ++    :          :                                                =
 |
         |     :          :                                                =
 |
         |      :        :                                                 =
 |
  150000 ++     :        :O                                                =
 |
         O     O:O  O    :     O  O  O  O  O O  O  O  O O  O  O  O  O O  O =
 O
  100000 ++     :        :                                                 =
 |
         |      :       :                                                  =
 |
         |      :       :                                                  =
 |
   50000 ++      :      :                                                  =
 |
         |       :      :                                                  =
 |
         |       :     :                                                   =
 |
       0 ++-O----*--*--O-----O---------------------------------------------=
-+


                                 proc-vmstat.pgpgout

   1e+06 ++----------------------------------------------------------------=
-+
  900000 ++   .*                               .*..  .*.                   =
 |
         *..*. :          *..*.*..*..*..*..*.*.    *.   *..*               =
 |
  800000 ++    :          :                                                =
 |
  700000 ++    :          :                                                =
 |
         |      :        :                                                 =
 |
  600000 ++     :        :O                                                =
 |
  500000 O+    O:O  O    :     O  O  O  O  O O  O  O  O O  O  O  O  O O  O =
 O
  400000 ++     :        :                                                 =
 |
         |      :       :                                                  =
 |
  300000 ++     :       :                                                  =
 |
  200000 ++      :      :                                                  =
 |
         |       :      :                                                  =
 |
  100000 ++      :     :                                                   =
 |
       0 ++-O----*--*--O-----O---------------------------------------------=
-+


                               proc-vmstat.pgactivate

  45000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  40000 O+         O     O     O  O O  O  O  O  O  O O  O  O  O  O  O O  O =
 O
  35000 ++    O  O                                                         =
 |
        |                                                                  =
 |
  30000 *+.*..*          *..*..*..*.*..  .*..          .*..                =
 |
  25000 ++    :          :             *.    *..*..*.*.    *               =
 |
        |      :        :                                                  =
 |
  20000 ++     :        :                                                  =
 |
  15000 ++     :        :                                                  =
 |
        |       :      :                                                   =
 |
  10000 ++      :      :                                                   =
 |
   5000 ++      :      :                                                   =
 |
        |        :    :                                                    =
 |
      0 ++-O-----*-*--O-----O----------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============7384332872475644536==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBmc21hcmsKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEt
dm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6IAog
IG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxh
dGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0
czogCiAgbmZzc3RhdDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0
OiAKICBwbWV0ZXI6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHQtd2F0
Y2hkb2dzOgogIHdhdGNoLW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOiAKY29t
bWl0OiBhODk3NDM2ZTBlMjMzZTg0YjY2NGJiN2YzM2M0ZTBkNGQzZTNiZGFkCm1vZGVsOiBDb3Jl
MgptZW1vcnk6IDhHCm5yX2hkZF9wYXJ0aXRpb25zOiAxMgpoZGRfcGFydGl0aW9uczogIi9kZXYv
ZGlzay9ieS1pZC9zY3NpLTM1MDAwYzUwMDA/Pz8/Pz8/Igpzd2FwX3BhcnRpdGlvbnM6IAppdGVy
YXRpb25zOiAxeApucl90aHJlYWRzOiAzMnQKZGlzazogMUhERApmczogZjJmcwpmczI6IApmc21h
cms6CiAgZmlsZXNpemU6IDlCCiAgdGVzdF9zaXplOiA0MDBNCiAgc3luY19tZXRob2Q6IGZzeW5j
QmVmb3JlQ2xvc2UKICBucl9kaXJlY3RvcmllczogMTZkCiAgbnJfZmlsZXNfcGVyX2RpcmVjdG9y
eTogMjU2ZnBkCnRlc3Rib3g6IGxrcC1zdDAyCnRib3hfZ3JvdXA6IGxrcC1zdDAyCmtjb25maWc6
IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wNC0wOCAyMTozOTozNi4wOTIyNDgwNDEg
KzA4OjAwCmhlYWRfY29tbWl0OiBhODk3NDM2ZTBlMjMzZTg0YjY2NGJiN2YzM2M0ZTBkNGQzZTNi
ZGFkCmJhc2VfY29tbWl0OiBmMjJlNmU4NDcxMTVhYmMzYTBlMmFkN2JiMThkMjQzZDQyMjc1YWYx
CmJyYW5jaDogbmV4dC9tYXN0ZXIKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC9hODk3NDM2
ZTBlMjMzZTg0YjY2NGJiN2YzM2M0ZTBkNGQzZTNiZGFkL3ZtbGludXotNC4wLjAtcmM3LW5leHQt
MjAxNTA0MDgiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJvb3RmczogZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvbGtwLXN0MDIvZnNtYXJrLzF4LTMy
dC0xSERELWYyZnMtOUItNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9hODk3NDM2ZTBlMjMzZTg0YjY2NGJiN2Yz
M2M0ZTBkNGQzZTNiZGFkLzAiCkxLUF9TRVJWRVI6IGlubgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1
bGVkL2xrcC1zdDAyL2N5Y2xpY19mc21hcmstMXgtMzJ0LTFIREQtZjJmcy05Qi00MDBNLWZzeW5j
QmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC14ODZfNjQtcmhlbC1IRUFELWE4OTc0MzZlMGUyMzNlODRi
NjY0YmI3ZjMzYzRlMGQ0ZDNlM2JkYWQtMC0yMDE1MDQwOC05NzYyOC0xMzg5NG1vLnlhbWwiCmRl
cXVldWVfdGltZTogMjAxNS0wNC0wOSAwNzoyNDoyMC4zMDc1MDY0NzggKzA4OjAwCm5yX2NwdTog
IiQobnByb2MpIgptYXhfdXB0aW1lOiAxNDcwLjg0Cm1vZHVsZXNfaW5pdHJkOiAiL2tlcm5lbC94
ODZfNjQtcmhlbC9hODk3NDM2ZTBlMjMzZTg0YjY2NGJiN2YzM2M0ZTBkNGQzZTNiZGFkL21vZHVs
ZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
dHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBz
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIuY2d6LC9sa3AvYmVuY2htYXJrcy9mc21hcmsuY2d6
Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDE1LjI4IDUuODEgMi4xMCAxLzE1NSAyMDI0
CnN0YXJ0X3RpbWU6ICcxNDI4NTM1NTA2JwplbmRfdGltZTogJzE0Mjg1MzU1NjgnCnZlcnNpb246
ICIvbGtwL2xrcC8uc3JjLTIwMTUwNDA4LTE3NDAyMyIK

--===============7384332872475644536==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWtmcyAtdCBmMmZzIC9kZXYvc2RiCm1vdW50IC10IGYyZnMgL2Rldi9zZGIgL2ZzL3NkYgouL2Zz
X21hcmsgLWQgL2ZzL3NkYi8xIC1kIC9mcy9zZGIvMiAtZCAvZnMvc2RiLzMgLWQgL2ZzL3NkYi80
IC1kIC9mcy9zZGIvNSAtZCAvZnMvc2RiLzYgLWQgL2ZzL3NkYi83IC1kIC9mcy9zZGIvOCAtZCAv
ZnMvc2RiLzkgLWQgL2ZzL3NkYi8xMCAtZCAvZnMvc2RiLzExIC1kIC9mcy9zZGIvMTIgLWQgL2Zz
L3NkYi8xMyAtZCAvZnMvc2RiLzE0IC1kIC9mcy9zZGIvMTUgLWQgL2ZzL3NkYi8xNiAtZCAvZnMv
c2RiLzE3IC1kIC9mcy9zZGIvMTggLWQgL2ZzL3NkYi8xOSAtZCAvZnMvc2RiLzIwIC1kIC9mcy9z
ZGIvMjEgLWQgL2ZzL3NkYi8yMiAtZCAvZnMvc2RiLzIzIC1kIC9mcy9zZGIvMjQgLWQgL2ZzL3Nk
Yi8yNSAtZCAvZnMvc2RiLzI2IC1kIC9mcy9zZGIvMjcgLWQgL2ZzL3NkYi8yOCAtZCAvZnMvc2Ri
LzI5IC1kIC9mcy9zZGIvMzAgLWQgL2ZzL3NkYi8zMSAtZCAvZnMvc2RiLzMyIC1EIDE2IC1OIDI1
NiAtbiAzMjAwIC1MIDEgLVMgMSAtcyA5Cg==

--===============7384332872475644536==--

