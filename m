Content-Type: multipart/mixed; boundary="===============1228551231824948778=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm] 3484b2de949: -46.2% aim7.jobs-per-min
Date: Fri, 27 Feb 2015 15:21:36 +0800
Message-ID: <1425021696.10337.55.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1228551231824948778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 3484b2de9499df23c4604a513b36f96326ae81ad ("mm: rearrange zone fields=
 into read-only, page alloc, statistics and page reclaim lines")

The perf cpu-cycles for spinlock (zone->lock) increased a lot.  I suspect t=
here are some cache ping-pong or false sharing.


testbox/testcase/testparams: brickland1/aim7/performance-6000-page_test

24b7e5819ad5cbef  3484b2de9499df23c4604a513b  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    152288 =C2=B1  0%     -46.2%      81911 =C2=B1  0%  aim7.jobs-per-min
       237 =C2=B1  0%     +85.6%        440 =C2=B1  0%  aim7.time.elapsed_t=
ime
       237 =C2=B1  0%     +85.6%        440 =C2=B1  0%  aim7.time.elapsed_t=
ime.max
     25026 =C2=B1  0%     +70.7%      42712 =C2=B1  0%  aim7.time.system_ti=
me
   2186645 =C2=B1  5%     +32.0%    2885949 =C2=B1  4%  aim7.time.voluntary=
_context_switches
   4576561 =C2=B1  1%     +24.9%    5715773 =C2=B1  0%  aim7.time.involunta=
ry_context_switches
       695 =C2=B1  0%      -3.7%        669 =C2=B1  1%  aim7.time.user_time
      5.37 =C2=B1  8%    +303.5%      21.67 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_lock.get_page_from_freelist.__alloc_pages_nodemask.alloc_pag=
es_vma.handle_mm_fault
     13.53 =C2=B1 18%    +244.5%      46.61 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_lock.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_pag=
e_list.release_pages
      7.88 =C2=B1 24%    +495.3%      46.89 =C2=B1  3%  perf-profile.cpu-cy=
cles.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_page_list.release_=
pages.free_pages_and_swap_cache
       362 =C2=B1 14%    +621.7%       2617 =C2=B1  8%  numa-vmstat.node2.n=
r_inactive_anon
      0.22 =C2=B1 38%   +8387.7%      18.39 =C2=B1  4%  perf-profile.cpu-cy=
cles.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma.handle_m=
m_fault.__do_page_fault
      7.99 =C2=B1  5%     -98.5%       0.12 =C2=B1 27%  perf-profile.cpu-cy=
cles.do_brk.sys_brk.system_call_fastpath
        12 =C2=B1 29%    +352.8%         54 =C2=B1 38%  sched_debug.cfs_rq[=
86]:/.tg_load_contrib
         2 =C2=B1 40%   +2133.3%         44 =C2=B1 27%  sched_debug.cfs_rq[=
52]:/.nr_spread_over
         2 =C2=B1 46%   +1337.5%         38 =C2=B1 25%  sched_debug.cfs_rq[=
87]:/.nr_spread_over
         2 =C2=B1 40%   +2533.3%         52 =C2=B1 14%  sched_debug.cfs_rq[=
53]:/.nr_spread_over
         3 =C2=B1  0%   +1377.8%         44 =C2=B1 29%  sched_debug.cfs_rq[=
48]:/.nr_spread_over
         1 =C2=B1 28%   +2620.0%         45 =C2=B1 30%  sched_debug.cfs_rq[=
47]:/.nr_spread_over
         4 =C2=B1 28%   +1276.9%         59 =C2=B1 12%  sched_debug.cfs_rq[=
117]:/.load
         4 =C2=B1 28%   +1276.9%         59 =C2=B1 12%  sched_debug.cpu#117=
.load
      2685 =C2=B1 19%    +348.6%      12046 =C2=B1 48%  sched_debug.cpu#116=
.ttwu_count
         1 =C2=B1 28%   +2240.0%         39 =C2=B1 10%  sched_debug.cfs_rq[=
63]:/.nr_spread_over
         5 =C2=B1  8%    +912.5%         54 =C2=B1 24%  sched_debug.cpu#65.=
load
         2 =C2=B1 40%   +1950.0%         41 =C2=B1 13%  sched_debug.cfs_rq[=
113]:/.nr_spread_over
      1508 =C2=B1 11%    +581.1%      10271 =C2=B1  6%  numa-meminfo.node2.=
Inactive(anon)
         2 =C2=B1 35%   +1512.5%         43 =C2=B1 21%  sched_debug.cfs_rq[=
112]:/.nr_spread_over
         5 =C2=B1  8%    +912.5%         54 =C2=B1 24%  sched_debug.cfs_rq[=
65]:/.load
         6 =C2=B1 41%   +2036.8%        135 =C2=B1 20%  sched_debug.cpu#0.l=
oad
         1 =C2=B1 28%   +3220.0%         55 =C2=B1 22%  sched_debug.cfs_rq[=
66]:/.nr_spread_over
         5 =C2=B1 48%   +1093.3%         59 =C2=B1 23%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.nr_running
         6 =C2=B1 41%   +2036.8%        135 =C2=B1 20%  sched_debug.cfs_rq[=
0]:/.load
        14 =C2=B1 37%    +563.6%         97 =C2=B1 43%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
        20 =C2=B1 20%    +437.7%        109 =C2=B1 40%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
         5 =C2=B1 29%   +1752.9%        105 =C2=B1 48%  sched_debug.cpu#1.l=
oad
         7 =C2=B1 34%    +672.7%         56 =C2=B1  7%  sched_debug.cfs_rq[=
110]:/.blocked_load_avg
         5 =C2=B1 29%   +1752.9%        105 =C2=B1 48%  sched_debug.cfs_rq[=
1]:/.load
         5 =C2=B1 28%   +1286.7%         69 =C2=B1 32%  sched_debug.cpu#2.l=
oad
         1 =C2=B1 35%   +2975.0%         41 =C2=B1  8%  sched_debug.cfs_rq[=
68]:/.nr_spread_over
         2 =C2=B1 20%   +1685.7%         41 =C2=B1 15%  sched_debug.cfs_rq[=
109]:/.nr_spread_over
        16 =C2=B1 49%    +446.0%         91 =C2=B1 32%  sched_debug.cfs_rq[=
68]:/.tg_load_contrib
         5 =C2=B1 28%   +1280.0%         69 =C2=B1 33%  sched_debug.cfs_rq[=
2]:/.load
         5 =C2=B1 16%    +860.0%         48 =C2=B1 35%  sched_debug.cpu#3.l=
oad
         8 =C2=B1 34%    +428.0%         44 =C2=B1 25%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
         5 =C2=B1 31%   +1912.5%        107 =C2=B1 27%  sched_debug.cfs_rq[=
39]:/.load
         5 =C2=B1 31%   +1912.5%        107 =C2=B1 27%  sched_debug.cpu#39.=
load
         5 =C2=B1 16%    +680.0%         39 =C2=B1  7%  sched_debug.cfs_rq[=
3]:/.load
         4 =C2=B1 20%   +1933.3%         81 =C2=B1 14%  sched_debug.cfs_rq[=
38]:/.load
      0.00 =C2=B1  0%  +7.2e+14% 7171133.21 =C2=B1 29%  sched_debug.cfs_rq[=
38]:/.max_vruntime
      0.00 =C2=B1  0%  +7.2e+14% 7171133.21 =C2=B1 29%  sched_debug.cfs_rq[=
38]:/.MIN_vruntime
         4 =C2=B1 20%   +1933.3%         81 =C2=B1 14%  sched_debug.cpu#38.=
load
         6 =C2=B1 37%    +560.0%         44 =C2=B1  9%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
         0 =C2=B1  0%      +Inf%          1 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.nr_running
         2 =C2=B1 46%   +2087.5%         58 =C2=B1 10%  sched_debug.cfs_rq[=
77]:/.nr_spread_over
         4 =C2=B1 10%   +1514.3%         75 =C2=B1 49%  sched_debug.cfs_rq[=
101]:/.load
      0.00 =C2=B1  0%    +1e+15% 10289272.67 =C2=B1 11%  sched_debug.cfs_rq=
[101]:/.max_vruntime
      0.00 =C2=B1  0%    +1e+15% 10289272.67 =C2=B1 11%  sched_debug.cfs_rq=
[101]:/.MIN_vruntime
         1 =C2=B1 35%   +3600.0%         49 =C2=B1 22%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
         5 =C2=B1 44%   +1064.7%         66 =C2=B1 37%  sched_debug.cpu#9.l=
oad
   2133469 =C2=B1 15%    +393.5%   10527887 =C2=B1 28%  sched_debug.cfs_rq[=
100]:/.max_vruntime
   2133469 =C2=B1 15%    +393.5%   10527887 =C2=B1 28%  sched_debug.cfs_rq[=
100]:/.MIN_vruntime
         2 =C2=B1 40%   +1733.3%         36 =C2=B1  8%  sched_debug.cfs_rq[=
78]:/.nr_spread_over
         5 =C2=B1 44%   +1064.7%         66 =C2=B1 37%  sched_debug.cfs_rq[=
9]:/.load
         1 =C2=B1 28%   +3480.0%         59 =C2=B1 38%  sched_debug.cfs_rq[=
79]:/.nr_spread_over
         9 =C2=B1 22%    +442.9%         50 =C2=B1 35%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
         1 =C2=B1  0%   +3000.0%         31 =C2=B1 28%  sched_debug.cfs_rq[=
30]:/.nr_spread_over
         5 =C2=B1 16%    +826.7%         46 =C2=B1 33%  sched_debug.cfs_rq[=
29]:/.load
         3 =C2=B1 46%    +972.7%         39 =C2=B1 34%  sched_debug.cfs_rq[=
29]:/.nr_spread_over
         4 =C2=B1 35%   +3491.7%        143 =C2=B1 42%  sched_debug.cfs_rq[=
97]:/.load
        18 =C2=B1 26%    +710.9%        148 =C2=B1 26%  sched_debug.cpu#82.=
load
         5 =C2=B1  8%    +768.8%         46 =C2=B1 33%  sched_debug.cpu#29.=
load
         4 =C2=B1 35%   +3491.7%        143 =C2=B1 42%  sched_debug.cpu#97.=
load
         7 =C2=B1 39%    +840.9%         69 =C2=B1 32%  sched_debug.cfs_rq[=
96]:/.load
         7 =C2=B1 11%    +681.0%         54 =C2=B1 25%  sched_debug.cfs_rq[=
28]:/.load
         2 =C2=B1 20%   +1557.1%         38 =C2=B1  6%  sched_debug.cfs_rq[=
13]:/.nr_spread_over
         7 =C2=B1 11%    +681.0%         54 =C2=B1 25%  sched_debug.cpu#28.=
load
         7 =C2=B1 39%    +840.9%         69 =C2=B1 32%  sched_debug.cpu#96.=
load
      0.00 =C2=B1  0%  +5.3e+14% 5307632.34 =C2=B1 17%  sched_debug.cfs_rq[=
14]:/.MIN_vruntime
      0.00 =C2=B1  0%  +5.3e+14% 5307632.57 =C2=B1 17%  sched_debug.cfs_rq[=
14]:/.max_vruntime
        18 =C2=B1 26%    +765.5%        158 =C2=B1 31%  sched_debug.cfs_rq[=
82]:/.load
         2 =C2=B1 20%   +1257.1%         31 =C2=B1 19%  sched_debug.cfs_rq[=
15]:/.nr_spread_over
         1 =C2=B1  0%   +5866.7%         59 =C2=B1 41%  sched_debug.cfs_rq[=
26]:/.nr_spread_over
         6 =C2=B1 26%   +1400.0%         95 =C2=B1 24%  sched_debug.cpu#84.=
load
         6 =C2=B1 18%   +1500.0%        106 =C2=B1 35%  sched_debug.cfs_rq[=
25]:/.load
         6 =C2=B1 18%   +1500.0%        106 =C2=B1 35%  sched_debug.cpu#25.=
load
         6 =C2=B1 26%   +1400.0%         95 =C2=B1 24%  sched_debug.cfs_rq[=
84]:/.load
         7 =C2=B1 30%    +847.6%         66 =C2=B1 36%  sched_debug.cfs_rq[=
24]:/.load
         6 =C2=B1 40%    +583.3%         41 =C2=B1 22%  sched_debug.cfs_rq[=
24]:/.nr_spread_over
         6 =C2=B1 29%    +647.4%         47 =C2=B1 24%  sched_debug.cfs_rq[=
17]:/.nr_spread_over
         1 =C2=B1 28%   +2460.0%         42 =C2=B1 20%  sched_debug.cfs_rq[=
90]:/.nr_spread_over
         7 =C2=B1 30%    +847.6%         66 =C2=B1 36%  sched_debug.cpu#24.=
load
         2 =C2=B1 20%   +1857.1%         45 =C2=B1 28%  sched_debug.cfs_rq[=
23]:/.nr_spread_over
   2673866 =C2=B1 23%    +273.9%    9996605 =C2=B1 30%  sched_debug.cfs_rq[=
83]:/.max_vruntime
   2673866 =C2=B1 23%    +273.9%    9996605 =C2=B1 30%  sched_debug.cfs_rq[=
83]:/.MIN_vruntime
         6 =C2=B1 13%    +372.2%         28 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
        11 =C2=B1 40%    +408.8%         57 =C2=B1  5%  sched_debug.cfs_rq[=
52]:/.blocked_load_avg
      8.75 =C2=B1 23%    +440.4%      47.26 =C2=B1  3%  perf-profile.cpu-cy=
cles.free_hot_cold_page.free_hot_cold_page_list.release_pages.free_pages_an=
d_swap_cache.tlb_flush_mmu_free
        13 =C2=B1 22%    +387.2%         63 =C2=B1  5%  sched_debug.cfs_rq[=
110]:/.tg_load_contrib
        12 =C2=B1 23%    +310.8%         50 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
     10.03 =C2=B1 21%    +375.4%      47.70 =C2=B1  3%  perf-profile.cpu-cy=
cles.free_hot_cold_page_list.release_pages.free_pages_and_swap_cache.tlb_fl=
ush_mmu_free.tlb_finish_mmu
   1949810 =C2=B1 43%    +367.8%    9120805 =C2=B1 21%  sched_debug.cfs_rq[=
25]:/.MIN_vruntime
   1949810 =C2=B1 43%    +367.8%    9120805 =C2=B1 21%  sched_debug.cfs_rq[=
25]:/.max_vruntime
      2575 =C2=B1 47%    +233.4%       8586 =C2=B1 18%  sched_debug.cpu#42.=
ttwu_local
      0.20 =C2=B1  7%    +345.0%       0.89 =C2=B1  8%  perf-profile.cpu-cy=
cles._raw_spin_lock.get_page_from_freelist.__alloc_pages_nodemask.alloc_pag=
es_current.__pmd_alloc
         8 =C2=B1 36%    +162.5%         21 =C2=B1 40%  sched_debug.cfs_rq[=
96]:/.runnable_load_avg
         8 =C2=B1 27%    +146.2%         21 =C2=B1 37%  sched_debug.cpu#96.=
cpu_load[0]
        23 =C2=B1 46%    +147.9%         58 =C2=B1 36%  sched_debug.cfs_rq[=
90]:/.tg_load_contrib
      2042 =C2=B1 16%    +282.6%       7813 =C2=B1 48%  sched_debug.cpu#116=
.ttwu_local
      4017 =C2=B1 10%    +247.4%      13959 =C2=B1 27%  sched_debug.cpu#87.=
ttwu_count
        17 =C2=B1 30%    +258.5%         63 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
        14 =C2=B1 18%    +274.4%         53 =C2=B1 25%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
      1.96 =C2=B1 29%    +169.8%       5.30 =C2=B1 13%  perf-profile.cpu-cy=
cles.cpu_stopper_thread.smpboot_thread_fn.kthread.ret_from_fork
      1.98 =C2=B1 29%    +167.7%       5.30 =C2=B1 13%  perf-profile.cpu-cy=
cles.smpboot_thread_fn.kthread.ret_from_fork
      1.99 =C2=B1 29%    +166.9%       5.30 =C2=B1 13%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
      1.99 =C2=B1 29%    +166.9%       5.30 =C2=B1 13%  perf-profile.cpu-cy=
cles.ret_from_fork
         7 =C2=B1 17%    +195.5%         21 =C2=B1 18%  sched_debug.cfs_rq[=
84]:/.runnable_load_avg
   2608707 =C2=B1 46%    +217.3%    8276853 =C2=B1 42%  sched_debug.cfs_rq[=
73]:/.max_vruntime
   2608707 =C2=B1 46%    +217.3%    8276853 =C2=B1 42%  sched_debug.cfs_rq[=
73]:/.MIN_vruntime
      1.74 =C2=B1 30%    +183.7%       4.95 =C2=B1 14%  perf-profile.cpu-cy=
cles.multi_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread.ret_from_f=
ork
        11 =C2=B1 31%    +262.9%         42 =C2=B1 39%  sched_debug.cfs_rq[=
88]:/.tg_load_contrib
        18 =C2=B1 46%    +201.9%         54 =C2=B1 34%  sched_debug.cfs_rq[=
118]:/.tg_load_contrib
      4472 =C2=B1 43%     +95.8%       8756 =C2=B1 25%  sched_debug.cpu#98.=
ttwu_count
         5 =C2=B1 16%    +213.3%         15 =C2=B1 18%  sched_debug.cpu#0.c=
pu_load[1]
        24 =C2=B1 16%    +243.8%         83 =C2=B1 17%  sched_debug.cfs_rq[=
76]:/.nr_spread_over
      2267 =C2=B1 25%    +215.1%       7145 =C2=B1 23%  sched_debug.cpu#91.=
ttwu_local
   2000856 =C2=B1 40%    +218.4%    6369750 =C2=B1 27%  sched_debug.cfs_rq[=
52]:/.max_vruntime
   2000856 =C2=B1 40%    +218.4%    6369750 =C2=B1 27%  sched_debug.cfs_rq[=
52]:/.MIN_vruntime
   2288564 =C2=B1 29%    +169.4%    6164335 =C2=B1 27%  sched_debug.cfs_rq[=
59]:/.MIN_vruntime
   2288564 =C2=B1 29%    +169.4%    6164335 =C2=B1 27%  sched_debug.cfs_rq[=
59]:/.max_vruntime
        13 =C2=B1 43%    +269.2%         48 =C2=B1 13%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
   1796249 =C2=B1 30%     -56.7%     777468 =C2=B1 11%  sched_debug.cpu#30.=
max_idle_balance_cost
      4093 =C2=B1 28%    +228.7%      13457 =C2=B1 34%  sched_debug.cpu#91.=
ttwu_count
      8.21 =C2=B1 25%    +179.4%      22.94 =C2=B1  2%  perf-profile.cpu-cy=
cles.alloc_pages_vma.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
      2250 =C2=B1 36%    +238.9%       7625 =C2=B1 32%  sched_debug.cpu#113=
.ttwu_local
        19 =C2=B1 37%    +159.3%         51 =C2=B1 37%  sched_debug.cfs_rq[=
117]:/.blocked_load_avg
      8540 =C2=B1 22%    +132.3%      19837 =C2=B1 22%  sched_debug.cpu#16.=
ttwu_count
      4596 =C2=B1 20%    +156.6%      11797 =C2=B1 13%  sched_debug.cpu#99.=
ttwu_count
        22 =C2=B1 36%    +109.1%         46 =C2=B1 29%  sched_debug.cfs_rq[=
81]:/.tg_load_contrib
        24 =C2=B1 34%    +140.3%         57 =C2=B1 32%  sched_debug.cfs_rq[=
117]:/.tg_load_contrib
      8954 =C2=B1 30%     -49.9%       4486 =C2=B1 26%  numa-meminfo.node3.=
Mapped
      3637 =C2=B1 17%    +187.0%      10440 =C2=B1 27%  sched_debug.cpu#73.=
ttwu_count
         5 =C2=B1  8%    +225.0%         17 =C2=B1 31%  sched_debug.cpu#0.c=
pu_load[2]
        14 =C2=B1 46%     -64.3%          5 =C2=B1 16%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
        15 =C2=B1 24%    +160.0%         39 =C2=B1 20%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
      2162 =C2=B1 31%     -46.7%       1152 =C2=B1 28%  numa-vmstat.node3.n=
r_mapped
      4443 =C2=B1 34%    +146.0%      10933 =C2=B1  6%  sched_debug.cpu#30.=
ttwu_local
      6492 =C2=B1 22%    +112.6%      13800 =C2=B1 35%  sched_debug.cpu#37.=
ttwu_local
      8100 =C2=B1 35%    +110.5%      17049 =C2=B1  2%  sched_debug.cpu#30.=
ttwu_count
         7 =C2=B1 30%    +195.2%         20 =C2=B1 46%  sched_debug.cfs_rq[=
82]:/.runnable_load_avg
        18 =C2=B1 29%    +212.5%         58 =C2=B1 18%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
      5889 =C2=B1 49%     +85.7%      10934 =C2=B1 18%  sched_debug.cpu#112=
.ttwu_count
  31004066 =C2=B1 12%    +133.0%   72248414 =C2=B1  8%  cpuidle.C1E-IVT-4S.=
time
        32 =C2=B1 49%    +118.6%         70 =C2=B1 22%  sched_debug.cfs_rq[=
116]:/.tg_load_contrib
   1326640 =C2=B1 27%    +139.7%    3180074 =C2=B1 41%  sched_debug.cfs_rq[=
71]:/.spread0
      3474 =C2=B1 29%    +107.2%       7198 =C2=B1 25%  sched_debug.cpu#22.=
ttwu_local
     10.20 =C2=B1 22%    +137.8%      24.27 =C2=B1  3%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_vma.handle_mm_fault.__do_page_fault=
.do_page_fault
      9557 =C2=B1 21%    +109.7%      20040 =C2=B1 31%  sched_debug.cpu#3.t=
twu_count
        10 =C2=B1 32%     -53.3%          4 =C2=B1 20%  sched_debug.cpu#46.=
cpu_load[2]
      3289 =C2=B1 26%    +114.8%       7064 =C2=B1 16%  sched_debug.cpu#105=
.ttwu_local
      5542 =C2=B1 34%    +107.9%      11524 =C2=B1 31%  sched_debug.cpu#16.=
ttwu_local
       470 =C2=B1  7%    +119.1%       1030 =C2=B1 39%  sched_debug.cpu#42.=
sched_goidle
      7359 =C2=B1 20%    +115.1%      15831 =C2=B1 11%  sched_debug.cpu#45.=
ttwu_count
      1215 =C2=B1 11%     +99.3%       2421 =C2=B1 28%  sched_debug.cpu#119=
.nr_uninterruptible
         8 =C2=B1 36%    +145.8%         19 =C2=B1 46%  sched_debug.cpu#74.=
cpu_load[1]
         7 =C2=B1 32%    +156.5%         19 =C2=B1 46%  sched_debug.cpu#74.=
cpu_load[0]
      6066 =C2=B1 47%    +142.4%      14706 =C2=B1 22%  sched_debug.cpu#42.=
ttwu_count
      2633 =C2=B1 19%    +219.9%       8426 =C2=B1 46%  sched_debug.cpu#87.=
ttwu_local
        10 =C2=B1 31%     -50.0%          5 =C2=B1  8%  sched_debug.cpu#46.=
cpu_load[4]
        10 =C2=B1 31%     -53.1%          5 =C2=B1 16%  sched_debug.cpu#46.=
cpu_load[3]
         5 =C2=B1 16%    +133.3%         11 =C2=B1 31%  sched_debug.cpu#0.c=
pu_load[0]
         5 =C2=B1 16%    +133.3%         11 =C2=B1 31%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
        24 =C2=B1 27%    +113.7%         52 =C2=B1 40%  sched_debug.cfs_rq[=
109]:/.tg_load_contrib
         8 =C2=B1 24%    +120.0%         18 =C2=B1 35%  sched_debug.cpu#96.=
cpu_load[1]
   1807256 =C2=B1 40%    +167.0%    4824533 =C2=B1 45%  sched_debug.cfs_rq[=
107]:/.MIN_vruntime
   1807256 =C2=B1 40%    +167.0%    4824533 =C2=B1 45%  sched_debug.cfs_rq[=
107]:/.max_vruntime
   1556425 =C2=B1  5%     -58.0%     653884 =C2=B1  2%  sched_debug.cpu#9.m=
ax_idle_balance_cost
   2624527 =C2=B1 26%     -48.7%    1347263 =C2=B1 10%  sched_debug.cpu#30.=
avg_idle
      5750 =C2=B1 41%     +75.6%      10099 =C2=B1 20%  sched_debug.cpu#41.=
ttwu_local
         3 =C2=B1 25%    +100.0%          7 =C2=B1 17%  sched_debug.cpu#90.=
cpu_load[4]
       188 =C2=B1  9%    +138.4%        449 =C2=B1 10%  sched_debug.cpu#67.=
sched_goidle
   1123782 =C2=B1 43%    +169.5%    3028424 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.spread0
      3297 =C2=B1 11%    +118.8%       7213 =C2=B1 17%  sched_debug.cpu#99.=
ttwu_local
      4304 =C2=B1 25%    +125.4%       9703 =C2=B1 23%  sched_debug.cpu#38.=
ttwu_local
         7 =C2=B1 17%    +122.7%         16 =C2=B1 42%  sched_debug.cpu#84.=
cpu_load[0]
         8 =C2=B1 31%    +112.0%         17 =C2=B1 35%  sched_debug.cpu#98.=
nr_running
         7 =C2=B1 17%    +122.7%         16 =C2=B1 42%  sched_debug.cpu#84.=
cpu_load[1]
      6489 =C2=B1 26%    +164.1%      17137 =C2=B1 10%  sched_debug.cpu#12.=
ttwu_count
      4901 =C2=B1 43%     +80.5%       8847 =C2=B1 30%  sched_debug.cpu#56.=
ttwu_count
   1581915 =C2=B1 26%     -55.6%     702853 =C2=B1 11%  sched_debug.cpu#42.=
max_idle_balance_cost
         8 =C2=B1 14%    +108.0%         17 =C2=B1  9%  sched_debug.cpu#102=
.nr_running
      1209 =C2=B1 41%    +170.8%       3276 =C2=B1 18%  sched_debug.cpu#89.=
nr_uninterruptible
      8743 =C2=B1 36%     +96.9%      17218 =C2=B1 14%  sched_debug.cpu#68.=
ttwu_count
    263566 =C2=B1 43%     -49.9%     132010 =C2=B1 24%  numa-meminfo.node1.=
FilePages
     65848 =C2=B1 43%     -49.9%      32982 =C2=B1 24%  numa-vmstat.node1.n=
r_file_pages
      4262 =C2=B1 32%    +111.3%       9005 =C2=B1 17%  sched_debug.cpu#36.=
ttwu_local
      3728 =C2=B1 22%    +146.3%       9185 =C2=B1 22%  sched_debug.cpu#12.=
ttwu_local
       548 =C2=B1 28%     +74.1%        954 =C2=B1 28%  sched_debug.cpu#12.=
sched_goidle
      4998 =C2=B1 30%    +114.9%      10738 =C2=B1 27%  sched_debug.cpu#118=
.ttwu_count
      4858 =C2=B1 44%     +82.5%       8867 =C2=B1 20%  sched_debug.cpu#77.=
ttwu_local
      7965 =C2=B1 35%     -51.7%       3850 =C2=B1  5%  numa-meminfo.node0.=
Mapped
         7 =C2=B1 30%    +123.8%         15 =C2=B1 48%  sched_debug.cpu#82.=
cpu_load[1]
         6 =C2=B1 25%    +155.0%         17 =C2=B1 37%  sched_debug.cpu#0.c=
pu_load[3]
         7 =C2=B1 30%    +100.0%         14 =C2=B1 44%  sched_debug.cpu#82.=
cpu_load[2]
         7 =C2=B1 40%    +117.4%         16 =C2=B1 31%  sched_debug.cpu#0.c=
pu_load[4]
         6 =C2=B1 25%    +110.0%         14 =C2=B1 44%  sched_debug.cpu#82.=
cpu_load[4]
      7724 =C2=B1 35%     +96.7%      15196 =C2=B1 24%  sched_debug.cpu#93.=
ttwu_count
       222 =C2=B1 14%     +86.7%        415 =C2=B1 26%  sched_debug.cpu#118=
.sched_goidle
     21.77 =C2=B1 10%    +122.1%      48.34 =C2=B1  3%  perf-profile.cpu-cy=
cles.release_pages.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_=
mmu.unmap_region
         8 =C2=B1 34%    +136.0%         19 =C2=B1 46%  sched_debug.cpu#74.=
cpu_load[2]
      4035 =C2=B1 31%     +83.7%       7412 =C2=B1 23%  sched_debug.cpu#26.=
ttwu_local
     22.13 =C2=B1 10%    +118.8%      48.43 =C2=B1  3%  perf-profile.cpu-cy=
cles.free_pages_and_swap_cache.tlb_flush_mmu_free.tlb_finish_mmu.unmap_regi=
on.do_munmap
     22.20 =C2=B1 10%    +118.2%      48.43 =C2=B1  3%  perf-profile.cpu-cy=
cles.tlb_flush_mmu_free.tlb_finish_mmu.unmap_region.do_munmap.sys_brk
     22.30 =C2=B1 10%    +117.6%      48.52 =C2=B1  3%  perf-profile.cpu-cy=
cles.tlb_finish_mmu.unmap_region.do_munmap.sys_brk.system_call_fastpath
      2562 =C2=B1 27%    +112.5%       5444 =C2=B1 25%  sched_debug.cpu#73.=
ttwu_local
   1505413 =C2=B1 27%     -44.5%     835772 =C2=B1 17%  sched_debug.cpu#33.=
max_idle_balance_cost
      9000 =C2=B1 36%    +106.2%      18563 =C2=B1 32%  sched_debug.cpu#31.=
ttwu_count
       232 =C2=B1 41%     +83.8%        427 =C2=B1  5%  sched_debug.cpu#89.=
sched_goidle
      0.55 =C2=B1 24%     +97.0%       1.08 =C2=B1  6%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__pmd_alloc.handle_mm_fault=
.__do_page_fault
        31 =C2=B1 33%     +56.4%         49 =C2=B1 30%  sched_debug.cfs_rq[=
56]:/.blocked_load_avg
      7036 =C2=B1 28%     -42.0%       4078 =C2=B1 15%  sched_debug.cpu#65.=
ttwu_local
     57267 =C2=B1  9%    +110.9%     120775 =C2=B1  5%  cpuidle.C6-IVT-4S.u=
sage
      8107 =C2=B1 43%    +101.0%      16298 =C2=B1 15%  sched_debug.cpu#9.t=
twu_count
       477 =C2=B1 14%     +95.7%        935 =C2=B1 30%  sched_debug.cpu#40.=
sched_goidle
   2534332 =C2=B1 21%     -49.0%    1291932 =C2=B1 11%  sched_debug.cpu#42.=
avg_idle
      9820 =C2=B1 39%     +75.4%      17227 =C2=B1 21%  sched_debug.cpu#41.=
ttwu_count
      6719 =C2=B1 21%    +149.5%      16768 =C2=B1 37%  sched_debug.cpu#38.=
ttwu_count
         5 =C2=B1 23%    +112.5%         11 =C2=B1 29%  sched_debug.cpu#22.=
cpu_load[4]
         9 =C2=B1 36%     -50.0%          4 =C2=B1 20%  sched_debug.cpu#46.=
cpu_load[1]
         4 =C2=B1 47%     +61.5%          7 =C2=B1 20%  sched_debug.cpu#44.=
cpu_load[4]
         4 =C2=B1 28%    +138.5%         10 =C2=B1 38%  sched_debug.cfs_rq[=
83]:/.runnable_load_avg
      7995 =C2=B1 30%     -51.6%       3867 =C2=B1  7%  numa-meminfo.node1.=
Mapped
      2745 =C2=B1 36%    +113.2%       5852 =C2=B1 24%  sched_debug.cpu#56.=
ttwu_local
      7737 =C2=B1 31%    +108.3%      16115 =C2=B1 28%  sched_debug.cpu#36.=
ttwu_count
   3128964 =C2=B1 47%    +153.5%    7932574 =C2=B1 15%  sched_debug.cfs_rq[=
69]:/.MIN_vruntime
   3128964 =C2=B1 47%    +153.5%    7932574 =C2=B1 15%  sched_debug.cfs_rq[=
69]:/.max_vruntime
   1344853 =C2=B1 14%     -50.5%     665504 =C2=B1  4%  sched_debug.cpu#16.=
max_idle_balance_cost
      8106 =C2=B1 28%     +67.7%      13597 =C2=B1 17%  sched_debug.cpu#77.=
ttwu_count
      6142 =C2=B1 40%    +105.8%      12643 =C2=B1 21%  sched_debug.cpu#105=
.ttwu_count
      7961 =C2=B1 34%     -51.9%       3827 =C2=B1  8%  sched_debug.cpu#75.=
ttwu_local
      7398 =C2=B1 19%     +95.3%      14449 =C2=B1 32%  sched_debug.cpu#26.=
ttwu_count
   1457355 =C2=B1 10%     -49.2%     740916 =C2=B1 15%  sched_debug.cpu#76.=
max_idle_balance_cost
     14560 =C2=B1 31%     +90.6%      27746 =C2=B1  7%  proc-vmstat.pgactiv=
ate
      3687 =C2=B1 37%    +114.8%       7919 =C2=B1 27%  sched_debug.cpu#48.=
ttwu_local
   1928296 =C2=B1 43%    +161.5%    5042966 =C2=B1 33%  sched_debug.cfs_rq[=
37]:/.MIN_vruntime
   1928296 =C2=B1 43%    +161.5%    5042966 =C2=B1 33%  sched_debug.cfs_rq[=
37]:/.max_vruntime
      2.57 =C2=B1  0%     -48.4%       1.33 =C2=B1  3%  turbostat.Pkg%pc6
   1353942 =C2=B1 26%     -45.8%     734298 =C2=B1  6%  sched_debug.cpu#46.=
max_idle_balance_cost
       233 =C2=B1 23%     +83.1%        426 =C2=B1  6%  sched_debug.cpu#66.=
sched_goidle
        36 =C2=B1 29%     +52.8%         55 =C2=B1 28%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
   2243220 =C2=B1 23%     -39.4%    1359766 =C2=B1 10%  sched_debug.cpu#33.=
avg_idle
   1397744 =C2=B1 19%     -45.1%     766710 =C2=B1  9%  sched_debug.cpu#51.=
max_idle_balance_cost
         9 =C2=B1 22%     +82.1%         17 =C2=B1 24%  sched_debug.cpu#74.=
nr_running
        10 =C2=B1 25%     +48.4%         15 =C2=B1 25%  sched_debug.cpu#99.=
nr_running
         8 =C2=B1 24%     +88.0%         15 =C2=B1 31%  sched_debug.cpu#96.=
cpu_load[2]
         9 =C2=B1 15%     +70.4%         15 =C2=B1 13%  sched_debug.cpu#42.=
nr_running
    101062 =C2=B1  3%     +83.6%     185547 =C2=B1  1%  sched_debug.cfs_rq[=
80]:/.exec_clock
    102313 =C2=B1  2%     +81.4%     185589 =C2=B1  1%  sched_debug.cfs_rq[=
61]:/.exec_clock
    101160 =C2=B1  2%     +83.1%     185178 =C2=B1  0%  sched_debug.cfs_rq[=
67]:/.exec_clock
   1335294 =C2=B1 21%     -47.8%     697529 =C2=B1 15%  sched_debug.cpu#85.=
max_idle_balance_cost
    101420 =C2=B1  2%     +82.6%     185195 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.exec_clock
       205 =C2=B1 13%     +86.2%        383 =C2=B1 15%  sched_debug.cpu#99.=
sched_goidle
    101218 =C2=B1  2%     +82.5%     184755 =C2=B1  2%  sched_debug.cfs_rq[=
71]:/.exec_clock
    101454 =C2=B1  2%     +83.9%     186548 =C2=B1  0%  sched_debug.cfs_rq[=
104]:/.exec_clock
    101437 =C2=B1  2%     +81.7%     184331 =C2=B1  1%  sched_debug.cfs_rq[=
82]:/.exec_clock
  37386253 =C2=B1 13%    +110.4%   78643981 =C2=B1 10%  cpuidle.C1-IVT-4S.t=
ime
    101153 =C2=B1  2%     +81.3%     183428 =C2=B1  1%  sched_debug.cfs_rq[=
60]:/.exec_clock
       237 =C2=B1  0%     +85.6%        440 =C2=B1  0%  time.elapsed_time.m=
ax
       237 =C2=B1  0%     +85.6%        440 =C2=B1  0%  time.elapsed_time
    102196 =C2=B1  2%     +82.1%     186102 =C2=B1  1%  sched_debug.cfs_rq[=
94]:/.exec_clock
  27203013 =C2=B1  5%     +81.5%   49381527 =C2=B1  1%  sched_debug.cfs_rq[=
78]:/.min_vruntime
    101863 =C2=B1  2%     +81.5%     184893 =C2=B1  2%  sched_debug.cfs_rq[=
72]:/.exec_clock
    101737 =C2=B1  2%     +82.4%     185546 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.exec_clock
        12 =C2=B1 18%     -33.3%          8 =C2=B1 27%  sched_debug.cpu#61.=
cpu_load[4]
         7 =C2=B1 32%    +113.0%         16 =C2=B1 33%  sched_debug.cpu#100=
.nr_running
        12 =C2=B1 11%     -33.3%          8 =C2=B1 27%  sched_debug.cpu#61.=
cpu_load[3]
    102912 =C2=B1  2%     +82.2%     187552 =C2=B1  0%  sched_debug.cfs_rq[=
91]:/.exec_clock
    101227 =C2=B1  1%     +83.4%     185699 =C2=B1  1%  sched_debug.cfs_rq[=
90]:/.exec_clock
    101261 =C2=B1  2%     +82.0%     184266 =C2=B1  1%  sched_debug.cfs_rq[=
73]:/.exec_clock
    101233 =C2=B1  2%     +82.0%     184281 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.exec_clock
    100721 =C2=B1  2%     +84.1%     185432 =C2=B1  2%  sched_debug.cfs_rq[=
65]:/.exec_clock
    100943 =C2=B1  2%     +82.7%     184431 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.exec_clock
    101944 =C2=B1  2%     +82.5%     186020 =C2=B1  0%  sched_debug.cfs_rq[=
100]:/.exec_clock
      1892 =C2=B1 32%     -48.4%        976 =C2=B1  3%  numa-vmstat.node0.n=
r_mapped
    101427 =C2=B1  2%     +81.9%     184495 =C2=B1  1%  sched_debug.cfs_rq[=
66]:/.exec_clock
    101615 =C2=B1  2%     +81.7%     184592 =C2=B1  1%  sched_debug.cfs_rq[=
70]:/.exec_clock
    101534 =C2=B1  2%     +82.5%     185266 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.exec_clock
    101957 =C2=B1  2%     +81.3%     184884 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.exec_clock
  26799107 =C2=B1  4%     +80.0%   48245402 =C2=B1  5%  sched_debug.cfs_rq[=
57]:/.min_vruntime
    101400 =C2=B1  2%     +82.7%     185228 =C2=B1  0%  sched_debug.cfs_rq[=
81]:/.exec_clock
    101306 =C2=B1  2%     +81.2%     183566 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.exec_clock
    101824 =C2=B1  2%     +80.8%     184114 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.exec_clock
    101564 =C2=B1  2%     +81.0%     183830 =C2=B1  1%  sched_debug.cfs_rq[=
77]:/.exec_clock
  26553407 =C2=B1  4%     +82.3%   48417772 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.min_vruntime
    101847 =C2=B1  2%     +82.4%     185725 =C2=B1  0%  sched_debug.cfs_rq[=
103]:/.exec_clock
    101060 =C2=B1  2%     +82.1%     184007 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.exec_clock
    101793 =C2=B1  2%     +81.2%     184462 =C2=B1  1%  sched_debug.cfs_rq[=
57]:/.exec_clock
    100971 =C2=B1  2%     +81.3%     183037 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.exec_clock
        32 =C2=B1 35%    +125.0%         72 =C2=B1 15%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
    101684 =C2=B1  2%     +81.8%     184905 =C2=B1  1%  sched_debug.cfs_rq[=
85]:/.exec_clock
      1157 =C2=B1 26%     +58.7%       1836 =C2=B1 28%  sched_debug.cpu#15.=
sched_goidle
    101440 =C2=B1  2%     +80.4%     182973 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.exec_clock
    100286 =C2=B1  2%     +81.4%     181960 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.exec_clock
    100725 =C2=B1  1%     +81.8%     183083 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.exec_clock
   1256666 =C2=B1 17%     -43.8%     706338 =C2=B1 12%  sched_debug.cpu#10.=
max_idle_balance_cost
      9153 =C2=B1 31%     +89.8%      17374 =C2=B1 15%  sched_debug.cpu#69.=
ttwu_count
    101750 =C2=B1  2%     +81.6%     184801 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.exec_clock
    101860 =C2=B1  2%     +80.0%     183309 =C2=B1  1%  sched_debug.cfs_rq[=
62]:/.exec_clock
    102080 =C2=B1  2%     +80.7%     184434 =C2=B1  1%  sched_debug.cfs_rq[=
56]:/.exec_clock
    101290 =C2=B1  2%     +81.5%     183795 =C2=B1  1%  sched_debug.cfs_rq[=
75]:/.exec_clock
    101514 =C2=B1  2%     +82.0%     184723 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.exec_clock
    101599 =C2=B1  2%     +80.9%     183823 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.exec_clock
    100950 =C2=B1  2%     +81.2%     182964 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.exec_clock
    100964 =C2=B1  3%     +81.9%     183605 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.exec_clock
    101815 =C2=B1  2%     +81.6%     184860 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.exec_clock
    101743 =C2=B1  2%     +82.4%     185570 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.exec_clock
    100726 =C2=B1  2%     +82.1%     183459 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.exec_clock
  25946174 =C2=B1  4%     +80.6%   46856738 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.min_vruntime
    101074 =C2=B1  2%     +81.4%     183383 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.exec_clock
    101965 =C2=B1  2%     +81.5%     185029 =C2=B1  0%  sched_debug.cfs_rq[=
96]:/.exec_clock
    101774 =C2=B1  2%     +80.6%     183808 =C2=B1  1%  sched_debug.cfs_rq[=
28]:/.exec_clock
    101457 =C2=B1  2%     +81.4%     184061 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.exec_clock
    101304 =C2=B1  1%     +81.2%     183554 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.exec_clock
    101665 =C2=B1  2%     +80.4%     183417 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.exec_clock
    101851 =C2=B1  2%     +80.3%     183636 =C2=B1  1%  sched_debug.cfs_rq[=
69]:/.exec_clock
    101135 =C2=B1  2%     +80.4%     182419 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.exec_clock
    101428 =C2=B1  2%     +82.0%     184635 =C2=B1  1%  sched_debug.cfs_rq[=
102]:/.exec_clock
         5 =C2=B1 22%     +76.5%         10 =C2=B1 21%  sched_debug.cpu#13.=
cpu_load[4]
    101580 =C2=B1  2%     +79.4%     182280 =C2=B1  2%  sched_debug.cfs_rq[=
97]:/.exec_clock
    102153 =C2=B1  2%     +81.8%     185698 =C2=B1  0%  sched_debug.cfs_rq[=
95]:/.exec_clock
    100891 =C2=B1  2%     +78.8%     180412 =C2=B1  1%  sched_debug.cfs_rq[=
47]:/.exec_clock
    101592 =C2=B1  2%     +80.5%     183385 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.exec_clock
  27458570 =C2=B1  5%     +79.8%   49375221 =C2=B1  4%  sched_debug.cfs_rq[=
117]:/.min_vruntime
    101926 =C2=B1  2%     +81.5%     185027 =C2=B1  1%  sched_debug.cfs_rq[=
117]:/.exec_clock
    102134 =C2=B1  2%     +79.5%     183374 =C2=B1  2%  sched_debug.cfs_rq[=
68]:/.exec_clock
    101045 =C2=B1  2%     +79.1%     181006 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.exec_clock
  27390900 =C2=B1  2%     +78.1%   48788289 =C2=B1  3%  sched_debug.cfs_rq[=
73]:/.min_vruntime
    101288 =C2=B1  2%     +81.5%     183825 =C2=B1  1%  sched_debug.cfs_rq[=
22]:/.exec_clock
    101820 =C2=B1  2%     +80.3%     183600 =C2=B1  1%  sched_debug.cfs_rq[=
51]:/.exec_clock
    101850 =C2=B1  2%     +79.9%     183196 =C2=B1  1%  sched_debug.cfs_rq[=
58]:/.exec_clock
    101010 =C2=B1  2%     +80.1%     181959 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.exec_clock
    101383 =C2=B1  2%     +80.8%     183257 =C2=B1  2%  sched_debug.cfs_rq[=
89]:/.exec_clock
    102604 =C2=B1  2%     +79.8%     184489 =C2=B1  1%  sched_debug.cfs_rq[=
93]:/.exec_clock
    102435 =C2=B1  2%     +79.8%     184173 =C2=B1  1%  sched_debug.cfs_rq[=
64]:/.exec_clock
    101445 =C2=B1  2%     +79.9%     182458 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.exec_clock
    101568 =C2=B1  1%     +81.6%     184421 =C2=B1  0%  sched_debug.cfs_rq[=
115]:/.exec_clock
  26692197 =C2=B1  1%     +83.6%   49006366 =C2=B1  2%  sched_debug.cfs_rq[=
88]:/.min_vruntime
    101323 =C2=B1  2%     +80.9%     183292 =C2=B1  1%  sched_debug.cfs_rq[=
78]:/.exec_clock
    101514 =C2=B1  2%     +80.7%     183420 =C2=B1  1%  sched_debug.cfs_rq[=
86]:/.exec_clock
      3507 =C2=B1  8%    +135.7%       8269 =C2=B1 38%  sched_debug.cpu#47.=
ttwu_local
    101437 =C2=B1  2%     +79.0%     181547 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.exec_clock
    102073 =C2=B1  2%     +79.7%     183393 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.exec_clock
    101703 =C2=B1  2%     +81.2%     184322 =C2=B1  1%  sched_debug.cfs_rq[=
84]:/.exec_clock
    101396 =C2=B1  2%     +78.8%     181320 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.exec_clock
    102099 =C2=B1  2%     +79.7%     183447 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.exec_clock
    102052 =C2=B1  2%     +80.3%     183978 =C2=B1  0%  sched_debug.cfs_rq[=
118]:/.exec_clock
   1298126 =C2=B1 17%     -44.2%     724667 =C2=B1  8%  sched_debug.cpu#100=
.max_idle_balance_cost
    101645 =C2=B1  2%     +79.4%     182355 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.exec_clock
    100805 =C2=B1  3%     +83.0%     184480 =C2=B1  0%  sched_debug.cfs_rq[=
119]:/.exec_clock
    102045 =C2=B1  2%     +79.8%     183508 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.exec_clock
    101501 =C2=B1  2%     +80.1%     182840 =C2=B1  0%  sched_debug.cfs_rq[=
105]:/.exec_clock
    101696 =C2=B1  2%     +80.6%     183656 =C2=B1  1%  sched_debug.cfs_rq[=
87]:/.exec_clock
    101080 =C2=B1  2%     +82.1%     184117 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.exec_clock
    102262 =C2=B1  1%     +80.8%     184856 =C2=B1  0%  sched_debug.cfs_rq[=
108]:/.exec_clock
    101505 =C2=B1  2%     +80.6%     183340 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.exec_clock
    101534 =C2=B1  2%     +80.4%     183130 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.exec_clock
    101034 =C2=B1  2%     +79.3%     181122 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.exec_clock
    102179 =C2=B1  2%     +78.8%     182709 =C2=B1  2%  sched_debug.cfs_rq[=
92]:/.exec_clock
    101151 =C2=B1  2%     +79.2%     181268 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.exec_clock
    102542 =C2=B1  1%     +80.0%     184613 =C2=B1  1%  sched_debug.cfs_rq[=
109]:/.exec_clock
    101684 =C2=B1  1%     +80.5%     183545 =C2=B1  1%  sched_debug.cfs_rq[=
74]:/.exec_clock
     30648 =C2=B1 12%     +50.7%      46198 =C2=B1 15%  sched_debug.cpu#27.=
sched_count
    100820 =C2=B1  2%     +78.1%     179548 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.exec_clock
        25 =C2=B1 43%     +86.8%         47 =C2=B1 16%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
    102489 =C2=B1  2%     +80.5%     185024 =C2=B1  0%  sched_debug.cfs_rq[=
112]:/.exec_clock
    101949 =C2=B1  2%     +80.3%     183856 =C2=B1  1%  sched_debug.cfs_rq[=
79]:/.exec_clock
     99315 =C2=B1  2%     +77.4%     176144 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.exec_clock
    101607 =C2=B1  2%     +77.9%     180741 =C2=B1  1%  sched_debug.cfs_rq[=
48]:/.exec_clock
    100838 =C2=B1  2%     +78.0%     179484 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.exec_clock
  26621023 =C2=B1  4%     +84.3%   49059445 =C2=B1  4%  sched_debug.cfs_rq[=
84]:/.min_vruntime
    100148 =C2=B1  0%     +83.5%     183754 =C2=B1  1%  sched_debug.cfs_rq[=
88]:/.exec_clock
    101809 =C2=B1  1%     +80.3%     183548 =C2=B1  0%  sched_debug.cfs_rq[=
113]:/.exec_clock
  27438729 =C2=B1  3%     +81.2%   49726216 =C2=B1  4%  sched_debug.cfs_rq[=
81]:/.min_vruntime
  26871931 =C2=B1  4%     +78.3%   47914921 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.min_vruntime
    101697 =C2=B1  2%     +79.7%     182756 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.exec_clock
      4680 =C2=B1 25%    +101.2%       9418 =C2=B1  8%  sched_debug.cpu#68.=
ttwu_local
    103202 =C2=B1  1%     +78.2%     183913 =C2=B1  1%  sched_debug.cfs_rq[=
76]:/.exec_clock
      4353 =C2=B1  1%     +92.9%       8399 =C2=B1 26%  sched_debug.cpu#31.=
ttwu_local
    102347 =C2=B1  2%     +79.5%     183678 =C2=B1  0%  sched_debug.cfs_rq[=
114]:/.exec_clock
    101101 =C2=B1  2%     +80.1%     182078 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.exec_clock
    100958 =C2=B1  2%     +77.9%     179582 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.exec_clock
    102141 =C2=B1  2%     +80.8%     184710 =C2=B1  1%  sched_debug.cfs_rq[=
107]:/.exec_clock
     99795 =C2=B1  2%     +78.3%     177916 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.exec_clock
   1309094 =C2=B1 21%     -36.2%     835062 =C2=B1 17%  sched_debug.cpu#92.=
max_idle_balance_cost
    101805 =C2=B1  1%     +79.1%     182380 =C2=B1  0%  sched_debug.cfs_rq[=
116]:/.exec_clock
         5 =C2=B1  8%     +62.5%          8 =C2=B1 14%  sched_debug.cpu#41.=
cpu_load[3]
         5 =C2=B1  8%     +62.5%          8 =C2=B1 23%  sched_debug.cpu#41.=
cpu_load[4]
         5 =C2=B1  8%     +56.3%          8 =C2=B1 11%  sched_debug.cpu#41.=
cpu_load[2]
         4 =C2=B1 26%    +135.7%         11 =C2=B1 46%  sched_debug.cpu#83.=
cpu_load[3]
         5 =C2=B1 29%     +88.2%         10 =C2=B1 28%  sched_debug.cpu#22.=
cpu_load[3]
         4 =C2=B1 21%     +84.6%          8 =C2=B1 17%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
        11 =C2=B1 49%     -58.8%          4 =C2=B1 26%  sched_debug.cfs_rq[=
112]:/.runnable_load_avg
    100434 =C2=B1  2%     +77.1%     177850 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.exec_clock
    101587 =C2=B1  2%     +77.5%     180296 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.exec_clock
  26838464 =C2=B1  5%     +78.9%   48004471 =C2=B1  3%  sched_debug.cfs_rq[=
75]:/.min_vruntime
    101283 =C2=B1  2%     +78.8%     181047 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.exec_clock
    102852 =C2=B1  1%     +78.6%     183721 =C2=B1  0%  sched_debug.cfs_rq[=
110]:/.exec_clock
  26455283 =C2=B1  3%     +79.4%   47466884 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.min_vruntime
  26621833 =C2=B1  1%     +79.9%   47897020 =C2=B1  4%  sched_debug.cfs_rq[=
28]:/.min_vruntime
    103107 =C2=B1  1%     +77.4%     182957 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.exec_clock
    100396 =C2=B1  2%     +74.7%     175411 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.exec_clock
   1179305 =C2=B1 18%     -41.7%     686968 =C2=B1 12%  sched_debug.cpu#87.=
max_idle_balance_cost
       626 =C2=B1 29%     +47.7%        925 =C2=B1 21%  sched_debug.cpu#29.=
sched_goidle
    100064 =C2=B1  2%     +76.7%     176787 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.exec_clock
    102840 =C2=B1  2%     +79.0%     184103 =C2=B1  0%  sched_debug.cfs_rq[=
111]:/.exec_clock
  12677315 =C2=B1 18%     +71.1%   21692326 =C2=B1 10%  cpuidle.C3-IVT-4S.t=
ime
   2001371 =C2=B1 15%     -35.6%    1289682 =C2=B1 10%  sched_debug.cpu#10.=
avg_idle
  27333794 =C2=B1  2%     +81.6%   49643263 =C2=B1  3%  sched_debug.cfs_rq[=
80]:/.min_vruntime
      8922 =C2=B1 29%     +60.9%      14351 =C2=B1  9%  sched_debug.cpu#71.=
ttwu_count
  27279862 =C2=B1  3%     +75.5%   47868960 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.min_vruntime
  27143621 =C2=B1  3%     +81.7%   49330780 =C2=B1  3%  sched_debug.cfs_rq[=
22]:/.min_vruntime
  27591306 =C2=B1  3%     +74.2%   48073762 =C2=B1  1%  sched_debug.cfs_rq[=
87]:/.min_vruntime
  27028818 =C2=B1  2%     +78.5%   48256392 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.min_vruntime
   1376263 =C2=B1 16%     -45.1%     755698 =C2=B1 10%  sched_debug.cpu#78.=
max_idle_balance_cost
    103923 =C2=B1  2%     +76.9%     183852 =C2=B1  0%  sched_debug.cfs_rq[=
106]:/.exec_clock
  26466266 =C2=B1  3%     +83.7%   48605429 =C2=B1  3%  sched_debug.cfs_rq[=
20]:/.min_vruntime
  26952223 =C2=B1  4%     +77.9%   47936242 =C2=B1  3%  sched_debug.cfs_rq[=
65]:/.min_vruntime
  26734375 =C2=B1  3%     +73.9%   46482790 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.min_vruntime
  27615182 =C2=B1  2%     +79.1%   49455144 =C2=B1  3%  sched_debug.cfs_rq[=
82]:/.min_vruntime
   1378865 =C2=B1  4%     -30.7%     955679 =C2=B1 28%  sched_debug.cpu#15.=
max_idle_balance_cost
   1303702 =C2=B1 13%     -39.5%     788630 =C2=B1  8%  sched_debug.cpu#107=
.max_idle_balance_cost
  26538631 =C2=B1  7%     +79.2%   47554705 =C2=B1  3%  sched_debug.cfs_rq[=
54]:/.min_vruntime
  27481450 =C2=B1  5%     +74.9%   48051960 =C2=B1  3%  sched_debug.cfs_rq[=
115]:/.min_vruntime
   1231477 =C2=B1 15%     -37.2%     773854 =C2=B1  9%  sched_debug.cpu#56.=
max_idle_balance_cost
  26970806 =C2=B1  1%     +79.7%   48474886 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.min_vruntime
  28200525 =C2=B1  5%     +73.8%   49008304 =C2=B1  3%  sched_debug.cfs_rq[=
107]:/.min_vruntime
   1371903 =C2=B1 13%     -37.4%     859087 =C2=B1 29%  sched_debug.cpu#75.=
max_idle_balance_cost
   1359440 =C2=B1 19%     -40.6%     807907 =C2=B1 28%  sched_debug.cpu#4.m=
ax_idle_balance_cost
    135178 =C2=B1 49%    +114.6%     290104 =C2=B1 24%  numa-meminfo.node2.=
Shmem
         3 =C2=B1 34%    +100.0%          7 =C2=B1 17%  sched_debug.cpu#90.=
cpu_load[0]
         8 =C2=B1 30%    +129.2%         18 =C2=B1 49%  sched_debug.cpu#74.=
cpu_load[3]
         4 =C2=B1 28%     +76.9%          7 =C2=B1 22%  sched_debug.cpu#72.=
cpu_load[4]
         8 =C2=B1 34%     +68.0%         14 =C2=B1 11%  sched_debug.cpu#70.=
nr_running
      1.87 =C2=B1  1%     -43.0%       1.07 =C2=B1  0%  turbostat.Pkg%pc2
    104837 =C2=B1  4%     +70.2%     178457 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.exec_clock
   2973469 =C2=B1 33%    +194.0%    8741737 =C2=B1 41%  sched_debug.cfs_rq[=
22]:/.max_vruntime
   2973469 =C2=B1 33%    +194.0%    8741737 =C2=B1 41%  sched_debug.cfs_rq[=
22]:/.MIN_vruntime
    103733 =C2=B1  3%     +75.1%     181687 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.exec_clock
   2033976 =C2=B1  6%     -41.0%    1200745 =C2=B1  1%  sched_debug.cpu#16.=
avg_idle
  26819480 =C2=B1  5%     +79.6%   48161949 =C2=B1  6%  sched_debug.cfs_rq[=
60]:/.min_vruntime
      1.18 =C2=B1  6%     +74.9%       2.06 =C2=B1  3%  turbostat.CPU%c1
      3062 =C2=B1  8%     -44.3%       1705 =C2=B1  0%  numa-vmstat.node2.n=
r_alloc_batch
   2556733 =C2=B1 10%     -44.8%    1411192 =C2=B1 15%  sched_debug.cpu#76.=
avg_idle
  27675230 =C2=B1  3%     +75.3%   48523627 =C2=B1  4%  sched_debug.cfs_rq[=
83]:/.min_vruntime
  27174325 =C2=B1  5%     +74.3%   47372226 =C2=B1  5%  sched_debug.cfs_rq[=
59]:/.min_vruntime
  26796563 =C2=B1  5%     +78.7%   47880566 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.min_vruntime
  27612035 =C2=B1  1%     +75.8%   48551086 =C2=B1  2%  sched_debug.cfs_rq[=
79]:/.min_vruntime
       218 =C2=B1  9%     +55.0%        338 =C2=B1 20%  sched_debug.cpu#69.=
sched_goidle
  27543770 =C2=B1  1%     +73.8%   47880110 =C2=B1  3%  sched_debug.cfs_rq[=
25]:/.min_vruntime
  28177961 =C2=B1  7%     +73.3%   48830676 =C2=B1  3%  sched_debug.cfs_rq[=
111]:/.min_vruntime
     33876 =C2=B1 48%    +114.2%      72551 =C2=B1 26%  numa-vmstat.node2.n=
r_shmem
  27039328 =C2=B1  4%     +71.6%   46391238 =C2=B1  6%  sched_debug.cfs_rq[=
4]:/.min_vruntime
  28197115 =C2=B1  6%     +74.2%   49114662 =C2=B1  5%  sched_debug.cfs_rq[=
112]:/.min_vruntime
    105888 =C2=B1  1%     +72.6%     182731 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.exec_clock
  27890316 =C2=B1  3%     +74.4%   48638474 =C2=B1  3%  sched_debug.cfs_rq[=
85]:/.min_vruntime
  27230926 =C2=B1  2%     +76.7%   48122630 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.min_vruntime
  28025228 =C2=B1  6%     +71.4%   48035574 =C2=B1  4%  sched_debug.cfs_rq[=
47]:/.min_vruntime
       233 =C2=B1 22%     +65.9%        387 =C2=B1 24%  sched_debug.cpu#119=
.sched_goidle
  27249686 =C2=B1  1%     +75.6%   47863170 =C2=B1  4%  sched_debug.cfs_rq[=
67]:/.min_vruntime
  27446598 =C2=B1  6%     +74.1%   47784676 =C2=B1  5%  sched_debug.cfs_rq[=
52]:/.min_vruntime
      3601 =C2=B1 37%     +61.6%       5821 =C2=B1 26%  sched_debug.cpu#118=
.ttwu_local
  27513769 =C2=B1  5%     +72.0%   47315703 =C2=B1  3%  sched_debug.cfs_rq[=
17]:/.min_vruntime
  27330261 =C2=B1  7%     +75.8%   48036272 =C2=B1  3%  sched_debug.cfs_rq[=
51]:/.min_vruntime
  26818906 =C2=B1  3%     +74.0%   46656069 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.min_vruntime
  27150746 =C2=B1  3%     +70.9%   46410420 =C2=B1  5%  sched_debug.cfs_rq[=
76]:/.min_vruntime
  28876314 =C2=B1  7%     +61.6%   46656199 =C2=B1  1%  sched_debug.cfs_rq[=
102]:/.min_vruntime
  27466106 =C2=B1  2%     +72.3%   47316775 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.min_vruntime
   1238904 =C2=B1 17%     -42.1%     717411 =C2=B1  8%  sched_debug.cpu#28.=
max_idle_balance_cost
     25026 =C2=B1  0%     +70.7%      42712 =C2=B1  0%  time.system_time
  28253526 =C2=B1  7%     +70.2%   48078369 =C2=B1  3%  sched_debug.cfs_rq[=
118]:/.min_vruntime
      5772 =C2=B1 26%     +86.9%      10786 =C2=B1  4%  sched_debug.cpu#69.=
ttwu_local
   1274510 =C2=B1 11%     -38.1%     788927 =C2=B1 12%  sched_debug.cpu#88.=
max_idle_balance_cost
      1837 =C2=B1 30%     -35.8%       1179 =C2=B1 11%  sched_debug.cpu#4.s=
ched_goidle
  27378468 =C2=B1  3%     +72.3%   47176518 =C2=B1  5%  sched_debug.cfs_rq[=
29]:/.min_vruntime
  27494234 =C2=B1  8%     +71.9%   47265116 =C2=B1  3%  sched_debug.cfs_rq[=
58]:/.min_vruntime
       174 =C2=B1 23%     -33.0%        117 =C2=B1  0%  numa-vmstat.node2.n=
r_mlock
       174 =C2=B1 23%     -33.0%        117 =C2=B1  0%  numa-vmstat.node2.n=
r_unevictable
  27206728 =C2=B1  6%     +74.2%   47384019 =C2=B1  4%  sched_debug.cfs_rq[=
114]:/.min_vruntime
  28142247 =C2=B1  3%     +71.5%   48277760 =C2=B1  4%  sched_debug.cfs_rq[=
53]:/.min_vruntime
  26094619 =C2=B1  4%     +71.4%   44738063 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.min_vruntime
  28848632 =C2=B1  4%     +64.2%   47377792 =C2=B1  1%  sched_debug.cfs_rq[=
93]:/.min_vruntime
       284 =C2=B1  1%     +72.0%        488 =C2=B1  0%  uptime.boot
   1392003 =C2=B1 17%     -36.3%     887367 =C2=B1  4%  sched_debug.cpu#65.=
max_idle_balance_cost
  27139321 =C2=B1  5%     +67.0%   45329173 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.min_vruntime
  27674956 =C2=B1  3%     +74.2%   48210953 =C2=B1  5%  sched_debug.cfs_rq[=
71]:/.min_vruntime
   2176632 =C2=B1 12%     -37.7%    1355560 =C2=B1 11%  sched_debug.cpu#87.=
avg_idle
   2964602 =C2=B1 40%     +56.8%    4648110 =C2=B1 24%  sched_debug.cfs_rq[=
21]:/.MIN_vruntime
   2964602 =C2=B1 40%     +56.8%    4648110 =C2=B1 24%  sched_debug.cfs_rq[=
21]:/.max_vruntime
  28026809 =C2=B1  3%     +69.7%   47563138 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.min_vruntime
  27490315 =C2=B1  2%     +70.2%   46778295 =C2=B1  6%  sched_debug.cfs_rq[=
68]:/.min_vruntime
  27144389 =C2=B1  7%     +72.8%   46915163 =C2=B1  3%  sched_debug.cfs_rq[=
46]:/.min_vruntime
  26837788 =C2=B1  5%     +72.4%   46269925 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      1688 =C2=B1 14%     +69.2%       2857 =C2=B1  3%  numa-vmstat.node2.n=
r_mapped
  27103059 =C2=B1  5%     +72.3%   46696486 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.min_vruntime
  28180142 =C2=B1  6%     +70.7%   48111115 =C2=B1  2%  sched_debug.cfs_rq[=
103]:/.min_vruntime
  27936247 =C2=B1  4%     +70.4%   47607682 =C2=B1  1%  sched_debug.cfs_rq[=
109]:/.min_vruntime
  28315435 =C2=B1  8%     +69.2%   47896596 =C2=B1  3%  sched_debug.cfs_rq[=
106]:/.min_vruntime
  27721329 =C2=B1  3%     +73.4%   48057933 =C2=B1  3%  sched_debug.cfs_rq[=
86]:/.min_vruntime
  27886820 =C2=B1  8%     +70.2%   47466269 =C2=B1  4%  sched_debug.cfs_rq[=
116]:/.min_vruntime
  27396905 =C2=B1  2%     +69.5%   46446865 =C2=B1  4%  sched_debug.cfs_rq[=
119]:/.min_vruntime
  28166905 =C2=B1  3%     +71.3%   48244521 =C2=B1  6%  sched_debug.cfs_rq[=
77]:/.min_vruntime
  27735077 =C2=B1  4%     +68.3%   46681964 =C2=B1  4%  sched_debug.cfs_rq[=
63]:/.min_vruntime
   2093163 =C2=B1  4%     -43.6%    1180095 =C2=B1  7%  sched_debug.cpu#9.a=
vg_idle
      5625 =C2=B1 11%     +53.0%       8607 =C2=B1  8%  sched_debug.cpu#18.=
ttwu_local
  28192307 =C2=B1  2%     +64.0%   46229983 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.min_vruntime
      5076 =C2=B1 19%     +56.2%       7930 =C2=B1 16%  sched_debug.cpu#45.=
ttwu_local
   2212969 =C2=B1 15%     -40.2%    1324292 =C2=B1 12%  sched_debug.cpu#85.=
avg_idle
  28431122 =C2=B1  2%     +68.5%   47919119 =C2=B1  4%  sched_debug.cfs_rq[=
72]:/.min_vruntime
     12891 =C2=B1 14%     +75.2%      22582 =C2=B1 13%  sched_debug.cpu#2.t=
twu_count
        67 =C2=B1 39%     -49.3%         34 =C2=B1 43%  sched_debug.cfs_rq[=
114]:/.tg_load_contrib
         6 =C2=B1 25%     +60.0%         10 =C2=B1 15%  sched_debug.cpu#53.=
cpu_load[4]
         6 =C2=B1 32%     +89.5%         12 =C2=B1 36%  sched_debug.cpu#29.=
cpu_load[4]
         5 =C2=B1 22%     +82.4%         10 =C2=B1 27%  sched_debug.cpu#13.=
cpu_load[3]
         6 =C2=B1 40%     +77.8%         10 =C2=B1 30%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
         6 =C2=B1 32%     +68.4%         10 =C2=B1 30%  sched_debug.cpu#37.=
cpu_load[0]
         6 =C2=B1 32%     +68.4%         10 =C2=B1 30%  sched_debug.cpu#37.=
cpu_load[1]
         6 =C2=B1 32%     +63.2%         10 =C2=B1 27%  sched_debug.cpu#37.=
cpu_load[2]
  27680297 =C2=B1  2%     +68.2%   46566672 =C2=B1  6%  sched_debug.cfs_rq[=
64]:/.min_vruntime
  27184673 =C2=B1  1%     +69.0%   45941045 =C2=B1  4%  sched_debug.cfs_rq[=
8]:/.min_vruntime
       186 =C2=B1 12%     +71.3%        319 =C2=B1 20%  sched_debug.cpu#104=
.sched_goidle
   1395005 =C2=B1 18%     -42.8%     798056 =C2=B1 14%  sched_debug.cpu#25.=
max_idle_balance_cost
  28334086 =C2=B1  6%     +68.2%   47646717 =C2=B1  1%  sched_debug.cfs_rq[=
108]:/.min_vruntime
  29231619 =C2=B1  1%     +65.3%   48333955 =C2=B1  2%  sched_debug.cfs_rq[=
95]:/.min_vruntime
  28631447 =C2=B1  3%     +64.7%   47170091 =C2=B1  4%  sched_debug.cfs_rq[=
96]:/.min_vruntime
   1136411 =C2=B1 28%     -35.6%     731487 =C2=B1 17%  sched_debug.cpu#81.=
max_idle_balance_cost
  27931979 =C2=B1  8%     +70.5%   47636804 =C2=B1  4%  sched_debug.cfs_rq[=
105]:/.min_vruntime
  27587618 =C2=B1  8%     +72.4%   47559163 =C2=B1  3%  sched_debug.cfs_rq[=
55]:/.min_vruntime
  27135866 =C2=B1  3%     +72.0%   46685004 =C2=B1  5%  sched_debug.cfs_rq[=
62]:/.min_vruntime
  28430783 =C2=B1  3%     +71.2%   48685881 =C2=B1  4%  sched_debug.cfs_rq[=
113]:/.min_vruntime
      5219 =C2=B1 14%     +55.6%       8119 =C2=B1  4%  sched_debug.cfs_rq[=
97]:/.tg_load_avg
  29151752 =C2=B1  6%     +58.0%   46050590 =C2=B1  2%  sched_debug.cfs_rq[=
35]:/.min_vruntime
   1738343 =C2=B1 23%     -49.7%     874932 =C2=B1  8%  sched_debug.cpu#26.=
max_idle_balance_cost
  28321876 =C2=B1  3%     +65.0%   46728175 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.min_vruntime
  28223816 =C2=B1  6%     +69.0%   47692852 =C2=B1  3%  sched_debug.cfs_rq[=
56]:/.min_vruntime
      9834 =C2=B1 13%     +51.9%      14936 =C2=B1  7%  cpuidle.C1E-IVT-4S.=
usage
  28242267 =C2=B1  2%     +69.1%   47765761 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.min_vruntime
  27312596 =C2=B1  1%     +73.0%   47245567 =C2=B1  6%  sched_debug.cfs_rq[=
66]:/.min_vruntime
   2317047 =C2=B1 15%     -41.1%    1365345 =C2=B1 10%  sched_debug.cpu#100=
.avg_idle
  27500028 =C2=B1  8%     +68.7%   46401166 =C2=B1  5%  sched_debug.cfs_rq[=
45]:/.min_vruntime
      5013 =C2=B1 14%     +54.4%       7742 =C2=B1 10%  sched_debug.cfs_rq[=
106]:/.tg_load_avg
  27873808 =C2=B1  1%     +72.7%   48137417 =C2=B1  7%  sched_debug.cfs_rq[=
61]:/.min_vruntime
   1932895 =C2=B1 19%     -32.9%    1296385 =C2=B1  2%  sched_debug.cpu#46.=
avg_idle
  27897442 =C2=B1  5%     +68.3%   46942450 =C2=B1  3%  sched_debug.cfs_rq[=
48]:/.min_vruntime
       234 =C2=B1 23%     +47.6%        346 =C2=B1 16%  sched_debug.cpu#86.=
sched_goidle
   2362217 =C2=B1 19%     -35.4%    1526318 =C2=B1 11%  sched_debug.cpu#92.=
avg_idle
  28072066 =C2=B1  2%     +63.5%   45911460 =C2=B1  2%  sched_debug.cfs_rq[=
92]:/.min_vruntime
  28983640 =C2=B1  2%     +62.8%   47192611 =C2=B1  5%  sched_debug.cfs_rq[=
99]:/.min_vruntime
  27287880 =C2=B1  1%     +70.1%   46419381 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.min_vruntime
   1411332 =C2=B1 28%     -47.6%     739234 =C2=B1  9%  sched_debug.cpu#12.=
max_idle_balance_cost
    164302 =C2=B1  0%     +61.8%     265806 =C2=B1  0%  sched_debug.sched_c=
lk
  28549966 =C2=B1  5%     +65.5%   47239054 =C2=B1  5%  sched_debug.cfs_rq[=
50]:/.min_vruntime
       233 =C2=B1 17%     +71.4%        400 =C2=B1  7%  sched_debug.cpu#75.=
sched_goidle
         7 =C2=B1 16%     +69.6%         13 =C2=B1 25%  sched_debug.cpu#101=
.nr_running
         8 =C2=B1 19%     +57.7%         13 =C2=B1 24%  sched_debug.cpu#110=
.nr_running
      5075 =C2=B1 16%     +53.2%       7774 =C2=B1 10%  sched_debug.cfs_rq[=
107]:/.tg_load_avg
      5035 =C2=B1 14%     +56.6%       7883 =C2=B1  6%  sched_debug.cfs_rq[=
103]:/.tg_load_avg
      4925 =C2=B1 11%     +58.3%       7797 =C2=B1  9%  sched_debug.cfs_rq[=
105]:/.tg_load_avg
       485 =C2=B1  4%     +47.3%        714 =C2=B1 15%  sched_debug.cpu#37.=
sched_goidle
    160491 =C2=B1  1%     +62.6%     261038 =C2=B1  1%  sched_debug.ktime
    160491 =C2=B1  1%     +62.6%     261038 =C2=B1  1%  sched_debug.cpu_clk
   2386826 =C2=B1  4%     -31.4%    1637817 =C2=B1 27%  sched_debug.cpu#75.=
avg_idle
    160788 =C2=B1  1%     +62.6%     261480 =C2=B1  1%  sched_debug.cpu#6.c=
lock
    160802 =C2=B1  1%     +62.6%     261518 =C2=B1  1%  sched_debug.cpu#7.c=
lock
    160923 =C2=B1  1%     +62.6%     261714 =C2=B1  1%  sched_debug.cpu#14.=
clock
    160914 =C2=B1  1%     +62.6%     261693 =C2=B1  1%  sched_debug.cpu#13.=
clock
    161267 =C2=B1  1%     +62.6%     262154 =C2=B1  1%  sched_debug.cpu#41.=
clock
    161182 =C2=B1  1%     +62.6%     262091 =C2=B1  1%  sched_debug.cpu#37.=
clock
    160950 =C2=B1  1%     +62.6%     261747 =C2=B1  1%  sched_debug.cpu#16.=
clock
    161199 =C2=B1  1%     +62.6%     262103 =C2=B1  1%  sched_debug.cpu#38.=
clock
    160941 =C2=B1  1%     +62.6%     261729 =C2=B1  1%  sched_debug.cpu#15.=
clock
    160911 =C2=B1  1%     +62.6%     261654 =C2=B1  1%  sched_debug.cpu#12.=
clock
    160856 =C2=B1  1%     +62.6%     261593 =C2=B1  1%  sched_debug.cpu#9.c=
lock
    160774 =C2=B1  1%     +62.6%     261448 =C2=B1  1%  sched_debug.cpu#5.c=
lock
    160995 =C2=B1  1%     +62.6%     261791 =C2=B1  1%  sched_debug.cpu#19.=
clock
    160825 =C2=B1  1%     +62.6%     261559 =C2=B1  1%  sched_debug.cpu#8.c=
lock
    161170 =C2=B1  1%     +62.6%     262059 =C2=B1  1%  sched_debug.cpu#36.=
clock
    160960 =C2=B1  1%     +62.6%     261758 =C2=B1  1%  sched_debug.cpu#17.=
clock
    160862 =C2=B1  1%     +62.6%     261596 =C2=B1  1%  sched_debug.cpu#10.=
clock
    161164 =C2=B1  1%     +62.6%     262042 =C2=B1  1%  sched_debug.cpu#35.=
clock
    161253 =C2=B1  1%     +62.6%     262129 =C2=B1  1%  sched_debug.cpu#40.=
clock
    160875 =C2=B1  1%     +62.6%     261628 =C2=B1  1%  sched_debug.cpu#11.=
clock
    161005 =C2=B1  1%     +62.6%     261806 =C2=B1  1%  sched_debug.cpu#20.=
clock
    160740 =C2=B1  1%     +62.6%     261381 =C2=B1  1%  sched_debug.cpu#4.c=
lock
    161014 =C2=B1  1%     +62.6%     261815 =C2=B1  1%  sched_debug.cpu#21.=
clock
    160978 =C2=B1  1%     +62.6%     261773 =C2=B1  1%  sched_debug.cpu#18.=
clock
    161157 =C2=B1  1%     +62.6%     262026 =C2=B1  1%  sched_debug.cpu#34.=
clock
    161062 =C2=B1  1%     +62.6%     261894 =C2=B1  1%  sched_debug.cpu#25.=
clock
    161283 =C2=B1  1%     +62.5%     262159 =C2=B1  1%  sched_debug.cpu#42.=
clock
    161035 =C2=B1  1%     +62.6%     261853 =C2=B1  1%  sched_debug.cpu#23.=
clock
    161041 =C2=B1  1%     +62.6%     261865 =C2=B1  1%  sched_debug.cpu#24.=
clock
    160715 =C2=B1  1%     +62.6%     261349 =C2=B1  1%  sched_debug.cpu#3.c=
lock
    161145 =C2=B1  1%     +62.6%     262007 =C2=B1  1%  sched_debug.cpu#33.=
clock
    160695 =C2=B1  1%     +62.6%     261297 =C2=B1  1%  sched_debug.cpu#1.c=
lock
    161025 =C2=B1  1%     +62.6%     261823 =C2=B1  1%  sched_debug.cpu#22.=
clock
    161138 =C2=B1  1%     +62.6%     262000 =C2=B1  1%  sched_debug.cpu#32.=
clock
    161124 =C2=B1  1%     +62.6%     261975 =C2=B1  1%  sched_debug.cpu#31.=
clock
    161116 =C2=B1  1%     +62.6%     261958 =C2=B1  1%  sched_debug.cpu#30.=
clock
    161218 =C2=B1  1%     +62.6%     262106 =C2=B1  1%  sched_debug.cpu#39.=
clock
    161097 =C2=B1  1%     +62.6%     261940 =C2=B1  1%  sched_debug.cpu#29.=
clock
    160654 =C2=B1  1%     +62.6%     261225 =C2=B1  1%  sched_debug.cpu#0.c=
lock
    161075 =C2=B1  1%     +62.6%     261904 =C2=B1  1%  sched_debug.cpu#26.=
clock
    161083 =C2=B1  1%     +62.6%     261918 =C2=B1  1%  sched_debug.cpu#27.=
clock
    161379 =C2=B1  1%     +62.5%     262269 =C2=B1  1%  sched_debug.cpu#48.=
clock
    160709 =C2=B1  1%     +62.6%     261317 =C2=B1  1%  sched_debug.cpu#2.c=
lock
    161092 =C2=B1  1%     +62.6%     261919 =C2=B1  1%  sched_debug.cpu#28.=
clock
    161332 =C2=B1  1%     +62.5%     262204 =C2=B1  1%  sched_debug.cpu#44.=
clock
    161368 =C2=B1  1%     +62.5%     262240 =C2=B1  1%  sched_debug.cpu#47.=
clock
    161353 =C2=B1  1%     +62.5%     262229 =C2=B1  1%  sched_debug.cpu#46.=
clock
    161338 =C2=B1  1%     +62.5%     262218 =C2=B1  1%  sched_debug.cpu#45.=
clock
    161320 =C2=B1  1%     +62.5%     262191 =C2=B1  1%  sched_debug.cpu#43.=
clock
    161401 =C2=B1  1%     +62.5%     262289 =C2=B1  1%  sched_debug.cpu#50.=
clock
    161396 =C2=B1  1%     +62.5%     262281 =C2=B1  1%  sched_debug.cpu#49.=
clock
    161407 =C2=B1  1%     +62.5%     262299 =C2=B1  1%  sched_debug.cpu#51.=
clock
    161515 =C2=B1  1%     +62.5%     262444 =C2=B1  1%  sched_debug.cpu#59.=
clock
    161466 =C2=B1  1%     +62.5%     262377 =C2=B1  1%  sched_debug.cpu#54.=
clock
    161512 =C2=B1  1%     +62.5%     262435 =C2=B1  1%  sched_debug.cpu#58.=
clock
    161469 =C2=B1  1%     +62.5%     262386 =C2=B1  1%  sched_debug.cpu#55.=
clock
    161519 =C2=B1  1%     +62.5%     262456 =C2=B1  1%  sched_debug.cpu#60.=
clock
    161443 =C2=B1  1%     +62.5%     262341 =C2=B1  1%  sched_debug.cpu#53.=
clock
    161485 =C2=B1  1%     +62.5%     262388 =C2=B1  1%  sched_debug.cpu#56.=
clock
    161428 =C2=B1  1%     +62.5%     262319 =C2=B1  1%  sched_debug.cpu#52.=
clock
      4960 =C2=B1 14%     +57.6%       7817 =C2=B1  8%  sched_debug.cfs_rq[=
104]:/.tg_load_avg
    161495 =C2=B1  1%     +62.5%     262412 =C2=B1  1%  sched_debug.cpu#57.=
clock
     27927 =C2=B1  5%     +48.5%      41476 =C2=B1 14%  sched_debug.cpu#61.=
nr_switches
    161558 =C2=B1  1%     +62.5%     262519 =C2=B1  1%  sched_debug.cpu#65.=
clock
    161543 =C2=B1  1%     +62.5%     262493 =C2=B1  1%  sched_debug.cpu#63.=
clock
    161539 =C2=B1  1%     +62.5%     262481 =C2=B1  1%  sched_debug.cpu#62.=
clock
    161535 =C2=B1  1%     +62.5%     262465 =C2=B1  1%  sched_debug.cpu#61.=
clock
    161569 =C2=B1  1%     +62.5%     262529 =C2=B1  1%  sched_debug.cpu#66.=
clock
    161556 =C2=B1  1%     +62.5%     262501 =C2=B1  1%  sched_debug.cpu#64.=
clock
  28199750 =C2=B1  6%     +69.6%   47818383 =C2=B1  3%  sched_debug.cfs_rq[=
43]:/.min_vruntime
    161583 =C2=B1  1%     +62.5%     262538 =C2=B1  1%  sched_debug.cpu#67.=
clock
  27815099 =C2=B1  2%     +67.3%   46543638 =C2=B1  5%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    161654 =C2=B1  1%     +62.5%     262634 =C2=B1  1%  sched_debug.cpu#72.=
clock
    161628 =C2=B1  1%     +62.5%     262622 =C2=B1  1%  sched_debug.cpu#70.=
clock
    161603 =C2=B1  1%     +62.5%     262550 =C2=B1  1%  sched_debug.cpu#68.=
clock
    161612 =C2=B1  1%     +62.5%     262563 =C2=B1  1%  sched_debug.cpu#69.=
clock
    161644 =C2=B1  1%     +62.5%     262626 =C2=B1  1%  sched_debug.cpu#71.=
clock
    161732 =C2=B1  1%     +62.4%     262728 =C2=B1  1%  sched_debug.cpu#79.=
clock
    161720 =C2=B1  1%     +62.4%     262704 =C2=B1  1%  sched_debug.cpu#77.=
clock
    161714 =C2=B1  1%     +62.4%     262672 =C2=B1  1%  sched_debug.cpu#76.=
clock
    161699 =C2=B1  1%     +62.4%     262642 =C2=B1  1%  sched_debug.cpu#74.=
clock
    161727 =C2=B1  1%     +62.4%     262711 =C2=B1  1%  sched_debug.cpu#78.=
clock
    161690 =C2=B1  1%     +62.4%     262635 =C2=B1  1%  sched_debug.cpu#73.=
clock
    161711 =C2=B1  1%     +62.4%     262667 =C2=B1  1%  sched_debug.cpu#75.=
clock
    161759 =C2=B1  1%     +62.4%     262754 =C2=B1  1%  sched_debug.cpu#80.=
clock
    161804 =C2=B1  1%     +62.4%     262784 =C2=B1  1%  sched_debug.cpu#83.=
clock
    161780 =C2=B1  1%     +62.4%     262770 =C2=B1  1%  sched_debug.cpu#81.=
clock
    161801 =C2=B1  1%     +62.4%     262775 =C2=B1  1%  sched_debug.cpu#82.=
clock
  27463683 =C2=B1  4%     +65.2%   45357873 =C2=B1  7%  sched_debug.cfs_rq[=
89]:/.min_vruntime
    161838 =C2=B1  1%     +62.4%     262807 =C2=B1  1%  sched_debug.cpu#85.=
clock
    161846 =C2=B1  1%     +62.4%     262820 =C2=B1  1%  sched_debug.cpu#86.=
clock
    161881 =C2=B1  1%     +62.4%     262836 =C2=B1  1%  sched_debug.cpu#88.=
clock
    161830 =C2=B1  1%     +62.4%     262797 =C2=B1  1%  sched_debug.cpu#84.=
clock
    161872 =C2=B1  1%     +62.4%     262825 =C2=B1  1%  sched_debug.cpu#87.=
clock
    161911 =C2=B1  1%     +62.3%     262848 =C2=B1  1%  sched_debug.cpu#89.=
clock
    161944 =C2=B1  1%     +62.3%     262873 =C2=B1  1%  sched_debug.cpu#92.=
clock
    161927 =C2=B1  1%     +62.3%     262864 =C2=B1  1%  sched_debug.cpu#91.=
clock
    161918 =C2=B1  1%     +62.3%     262858 =C2=B1  1%  sched_debug.cpu#90.=
clock
      5629 =C2=B1 24%     +74.2%       9807 =C2=B1 40%  sched_debug.cpu#32.=
ttwu_local
  28953465 =C2=B1  4%     +64.1%   47502972 =C2=B1  0%  sched_debug.cfs_rq[=
101]:/.min_vruntime
    162000 =C2=B1  1%     +62.3%     262896 =C2=B1  1%  sched_debug.cpu#94.=
clock
    162002 =C2=B1  1%     +62.3%     262882 =C2=B1  1%  sched_debug.cpu#93.=
clock
    162012 =C2=B1  1%     +62.3%     262902 =C2=B1  1%  sched_debug.cpu#95.=
clock
    162018 =C2=B1  1%     +62.3%     262919 =C2=B1  1%  sched_debug.cpu#96.=
clock
    162023 =C2=B1  1%     +62.3%     262918 =C2=B1  1%  sched_debug.cpu#97.=
clock
    162036 =C2=B1  1%     +62.3%     262928 =C2=B1  1%  sched_debug.cpu#98.=
clock
    162122 =C2=B1  1%     +62.2%     262987 =C2=B1  1%  sched_debug.cpu#104=
.clock
    162090 =C2=B1  1%     +62.2%     262956 =C2=B1  1%  sched_debug.cpu#101=
.clock
    162130 =C2=B1  1%     +62.2%     262998 =C2=B1  1%  sched_debug.cpu#105=
.clock
    162103 =C2=B1  1%     +62.2%     262982 =C2=B1  1%  sched_debug.cpu#103=
.clock
    162048 =C2=B1  1%     +62.3%     262930 =C2=B1  1%  sched_debug.cpu#99.=
clock
    162098 =C2=B1  1%     +62.2%     262966 =C2=B1  1%  sched_debug.cpu#102=
.clock
    162089 =C2=B1  1%     +62.2%     262948 =C2=B1  1%  sched_debug.cpu#100=
.clock
    162148 =C2=B1  1%     +62.2%     262999 =C2=B1  1%  sched_debug.cpu#106=
.clock
    162155 =C2=B1  1%     +62.2%     263003 =C2=B1  1%  sched_debug.cpu#107=
.clock
   1137981 =C2=B1  5%     -41.4%     667034 =C2=B1  3%  sched_debug.cpu#22.=
max_idle_balance_cost
    162236 =C2=B1  1%     +62.2%     263094 =C2=B1  1%  sched_debug.cpu#113=
.clock
    162185 =C2=B1  1%     +62.2%     263017 =C2=B1  1%  sched_debug.cpu#108=
.clock
    162250 =C2=B1  1%     +62.2%     263100 =C2=B1  1%  sched_debug.cpu#114=
.clock
    162230 =C2=B1  1%     +62.2%     263075 =C2=B1  1%  sched_debug.cpu#112=
.clock
    162208 =C2=B1  1%     +62.2%     263040 =C2=B1  1%  sched_debug.cpu#110=
.clock
    162217 =C2=B1  1%     +62.2%     263050 =C2=B1  1%  sched_debug.cpu#111=
.clock
    162272 =C2=B1  1%     +62.1%     263116 =C2=B1  1%  sched_debug.cpu#117=
.clock
    162269 =C2=B1  1%     +62.1%     263110 =C2=B1  1%  sched_debug.cpu#116=
.clock
    162273 =C2=B1  1%     +62.1%     263122 =C2=B1  1%  sched_debug.cpu#118=
.clock
    162262 =C2=B1  1%     +62.1%     263106 =C2=B1  1%  sched_debug.cpu#115=
.clock
    162197 =C2=B1  1%     +62.2%     263021 =C2=B1  1%  sched_debug.cpu#109=
.clock
    162291 =C2=B1  1%     +62.1%     263120 =C2=B1  1%  sched_debug.cpu#119=
.clock
      5314 =C2=B1 12%     +54.9%       8234 =C2=B1  3%  sched_debug.cfs_rq[=
96]:/.tg_load_avg
  28710836 =C2=B1  1%     +62.0%   46517027 =C2=B1  5%  sched_debug.cfs_rq[=
70]:/.min_vruntime
  29248702 =C2=B1  2%     +60.6%   46981187 =C2=B1  3%  sched_debug.cfs_rq[=
90]:/.min_vruntime
  27932754 =C2=B1  3%     +65.2%   46138545 =C2=B1  4%  sched_debug.cfs_rq[=
40]:/.min_vruntime
  28588795 =C2=B1  1%     +64.3%   46974714 =C2=B1  5%  sched_debug.cfs_rq[=
69]:/.min_vruntime
      7433 =C2=B1 10%     +72.1%      12789 =C2=B1 25%  sched_debug.cpu#2.t=
twu_local
  28987283 =C2=B1  4%     +57.9%   45772264 =C2=B1  2%  sched_debug.cfs_rq[=
42]:/.min_vruntime
         5 =C2=B1  8%     +87.5%         10 =C2=B1 35%  sched_debug.cpu#101=
.cpu_load[3]
         4 =C2=B1 10%     +57.1%          7 =C2=B1 12%  sched_debug.cpu#94.=
cpu_load[2]
         4 =C2=B1 10%     +57.1%          7 =C2=B1 12%  sched_debug.cpu#94.=
cpu_load[3]
         4 =C2=B1 10%     +64.3%          7 =C2=B1  6%  sched_debug.cpu#94.=
cpu_load[4]
         5 =C2=B1  8%     +62.5%          8 =C2=B1 28%  sched_debug.cpu#101=
.cpu_load[4]
         4 =C2=B1 10%     +57.1%          7 =C2=B1 12%  sched_debug.cpu#94.=
cpu_load[1]
         4 =C2=B1 26%    +121.4%         10 =C2=B1 38%  sched_debug.cpu#83.=
cpu_load[2]
         4 =C2=B1 26%    +121.4%         10 =C2=B1 38%  sched_debug.cpu#83.=
cpu_load[1]
         9 =C2=B1 36%     -46.4%          5 =C2=B1 16%  sched_debug.cpu#46.=
cpu_load[0]
  28001170 =C2=B1  3%     +66.3%   46559477 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.min_vruntime
  27914392 =C2=B1  3%     +65.0%   46047332 =C2=B1  3%  sched_debug.cfs_rq[=
36]:/.min_vruntime
   1184985 =C2=B1  9%     -40.7%     702992 =C2=B1  2%  sched_debug.cpu#83.=
max_idle_balance_cost
  29294276 =C2=B1  3%     +63.1%   47768220 =C2=B1  0%  sched_debug.cfs_rq[=
98]:/.min_vruntime
   1246116 =C2=B1  8%     -36.9%     785893 =C2=B1  2%  sched_debug.cpu#82.=
max_idle_balance_cost
       214 =C2=B1 12%     +58.7%        340 =C2=B1 16%  sched_debug.cpu#80.=
sched_goidle
        25 =C2=B1 40%    +135.1%         60 =C2=B1 21%  sched_debug.cfs_rq[=
63]:/.blocked_load_avg
  28130394 =C2=B1  2%     +59.4%   44831870 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.min_vruntime
   1084955 =C2=B1  7%     -34.4%     711689 =C2=B1  5%  sched_debug.cpu#66.=
max_idle_balance_cost
      5070 =C2=B1 14%     +52.5%       7732 =C2=B1  4%  sched_debug.cfs_rq[=
102]:/.tg_load_avg
      5.14 =C2=B1  0%     -36.3%       3.28 =C2=B1  1%  turbostat.CPU%c6
  28782262 =C2=B1  3%     +62.5%   46781968 =C2=B1  4%  sched_debug.cfs_rq[=
34]:/.min_vruntime
      7329 =C2=B1 13%     +74.8%      12810 =C2=B1 20%  sched_debug.cpu#51.=
ttwu_count
  28626263 =C2=B1  2%     +62.0%   46361731 =C2=B1  3%  sched_debug.cfs_rq[=
37]:/.min_vruntime
  27427430 =C2=B1  2%     +68.7%   46269426 =C2=B1  7%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      5200 =C2=B1 15%     +52.4%       7927 =C2=B1  5%  sched_debug.cfs_rq[=
99]:/.tg_load_avg
      4905 =C2=B1 10%     +55.6%       7632 =C2=B1  4%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
       208 =C2=B1  6%     +55.3%        323 =C2=B1  5%  sched_debug.cpu#115=
.sched_goidle
      5239 =C2=B1 21%     +49.1%       7811 =C2=B1 17%  sched_debug.cfs_rq[=
119]:/.tg_load_avg
  29416507 =C2=B1  3%     +63.2%   47994239 =C2=B1  3%  sched_debug.cfs_rq[=
94]:/.min_vruntime
     29656 =C2=B1  5%     +49.0%      44173 =C2=B1 14%  sched_debug.cpu#61.=
sched_count
     11220 =C2=B1  1%     -35.7%       7216 =C2=B1  2%  proc-vmstat.nr_allo=
c_batch
  29127989 =C2=B1  2%     +62.1%   47216255 =C2=B1  4%  sched_debug.cfs_rq[=
100]:/.min_vruntime
  28779496 =C2=B1  4%     +61.8%   46571097 =C2=B1  2%  sched_debug.cfs_rq[=
41]:/.min_vruntime
  29226291 =C2=B1  3%     +55.6%   45477016 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.min_vruntime
  27066866 =C2=B1  4%     +61.5%   43707502 =C2=B1  7%  sched_debug.cfs_rq[=
74]:/.min_vruntime
  28036423 =C2=B1  4%     +61.0%   45129846 =C2=B1  2%  sched_debug.cfs_rq[=
44]:/.min_vruntime
    107909 =C2=B1  1%     +53.4%     165540 =C2=B1  3%  sched_debug.cpu#92.=
nr_load_updates
  28754125 =C2=B1  6%     +67.1%   48047831 =C2=B1  6%  sched_debug.cfs_rq[=
110]:/.min_vruntime
      4918 =C2=B1 10%     +56.7%       7706 =C2=B1  4%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
  29026526 =C2=B1  4%     +62.6%   47205685 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.min_vruntime
      5060 =C2=B1 10%     +51.8%       7679 =C2=B1  2%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
  26942107 =C2=B1  0%     +64.9%   44438451 =C2=B1  7%  sched_debug.cfs_rq[=
14]:/.min_vruntime
      5173 =C2=B1  8%     +47.6%       7634 =C2=B1  0%  sched_debug.cfs_rq[=
89]:/.tg_load_avg
   1222098 =C2=B1 13%     -35.2%     792193 =C2=B1 16%  sched_debug.cpu#61.=
max_idle_balance_cost
    107362 =C2=B1  1%     +52.7%     163932 =C2=B1  2%  sched_debug.cpu#103=
.nr_load_updates
       464 =C2=B1  8%     +85.8%        862 =C2=B1 40%  sched_debug.cpu#41.=
sched_goidle
   4613837 =C2=B1 17%     +76.8%    8156323 =C2=B1 16%  sched_debug.cfs_rq[=
27]:/.MIN_vruntime
   4613837 =C2=B1 17%     +76.8%    8156323 =C2=B1 16%  sched_debug.cfs_rq[=
27]:/.max_vruntime
       192 =C2=B1 19%     +63.1%        313 =C2=B1  6%  sched_debug.cpu#88.=
sched_goidle
   2020781 =C2=B1  7%     -35.2%    1309642 =C2=B1  3%  sched_debug.cpu#66.=
avg_idle
  28456363 =C2=B1  3%     +57.3%   44775761 =C2=B1  3%  sched_debug.cfs_rq[=
30]:/.min_vruntime
    107337 =C2=B1  1%     +53.8%     165069 =C2=B1  1%  sched_debug.cpu#97.=
nr_load_updates
  29224089 =C2=B1  0%     +58.0%   46175403 =C2=B1  4%  sched_debug.cfs_rq[=
91]:/.min_vruntime
    109347 =C2=B1  0%     +53.4%     167708 =C2=B1  3%  sched_debug.cpu#15.=
nr_load_updates
         9 =C2=B1  9%     +44.4%         13 =C2=B1 16%  sched_debug.cpu#95.=
nr_running
    108991 =C2=B1  1%     +52.5%     166234 =C2=B1  2%  sched_debug.cpu#35.=
nr_load_updates
    109437 =C2=B1  0%     +52.4%     166818 =C2=B1  2%  sched_debug.cpu#32.=
nr_load_updates
      5127 =C2=B1 14%     +51.2%       7753 =C2=B1  6%  sched_debug.cfs_rq[=
101]:/.tg_load_avg
    107410 =C2=B1  0%     +52.8%     164098 =C2=B1  2%  sched_debug.cpu#90.=
nr_load_updates
    107654 =C2=B1  1%     +52.6%     164271 =C2=B1  3%  sched_debug.cpu#82.=
nr_load_updates
    107451 =C2=B1  1%     +52.6%     163970 =C2=B1  1%  sched_debug.cpu#98.=
nr_load_updates
    108702 =C2=B1  0%     +53.2%     166482 =C2=B1  1%  sched_debug.cpu#37.=
nr_load_updates
    108765 =C2=B1  0%     +51.6%     164908 =C2=B1  3%  sched_debug.cpu#44.=
nr_load_updates
    110443 =C2=B1  0%     +52.5%     168464 =C2=B1  3%  sched_debug.cpu#18.=
nr_load_updates
    106978 =C2=B1  0%     +51.9%     162474 =C2=B1  2%  sched_debug.cpu#104=
.nr_load_updates
    108440 =C2=B1  0%     +52.1%     164975 =C2=B1  2%  sched_debug.cpu#93.=
nr_load_updates
    108935 =C2=B1  0%     +53.4%     167078 =C2=B1  3%  sched_debug.cpu#45.=
nr_load_updates
    108668 =C2=B1  1%     +53.2%     166513 =C2=B1  2%  sched_debug.cpu#39.=
nr_load_updates
    107883 =C2=B1  0%     +51.9%     163899 =C2=B1  2%  sched_debug.cpu#101=
.nr_load_updates
      2905 =C2=B1  6%     -36.5%       1845 =C2=B1  2%  numa-vmstat.node1.n=
r_alloc_batch
      5003 =C2=B1  9%     +54.5%       7727 =C2=B1  4%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
      5200 =C2=B1 14%     +49.8%       7789 =C2=B1  5%  sched_debug.cfs_rq[=
100]:/.tg_load_avg
    108012 =C2=B1  1%     +52.1%     164245 =C2=B1  3%  sched_debug.cpu#77.=
nr_load_updates
    107888 =C2=B1  1%     +51.3%     163277 =C2=B1  3%  sched_debug.cpu#80.=
nr_load_updates
    107273 =C2=B1  1%     +52.6%     163688 =C2=B1  2%  sched_debug.cpu#99.=
nr_load_updates
    107262 =C2=B1  0%     +52.7%     163754 =C2=B1  3%  sched_debug.cpu#88.=
nr_load_updates
    107872 =C2=B1  0%     +52.9%     164886 =C2=B1  1%  sched_debug.cpu#95.=
nr_load_updates
    107106 =C2=B1  0%     +52.2%     163026 =C2=B1  2%  sched_debug.cpu#102=
.nr_load_updates
    109736 =C2=B1  0%     +51.3%     166061 =C2=B1  3%  sched_debug.cpu#27.=
nr_load_updates
    109125 =C2=B1  0%     +52.4%     166280 =C2=B1  2%  sched_debug.cpu#31.=
nr_load_updates
    107700 =C2=B1  1%     +51.8%     163526 =C2=B1  3%  sched_debug.cpu#78.=
nr_load_updates
      5254 =C2=B1 21%     +44.8%       7609 =C2=B1 16%  sched_debug.cfs_rq[=
117]:/.tg_load_avg
    107716 =C2=B1  0%     +51.6%     163321 =C2=B1  2%  sched_debug.cpu#100=
.nr_load_updates
    107720 =C2=B1  1%     +51.5%     163183 =C2=B1  3%  sched_debug.cpu#89.=
nr_load_updates
    109165 =C2=B1  0%     +52.1%     165997 =C2=B1  2%  sched_debug.cpu#30.=
nr_load_updates
    108596 =C2=B1  1%     +53.2%     166368 =C2=B1  4%  sched_debug.cpu#58.=
nr_load_updates
    107682 =C2=B1  1%     +51.9%     163537 =C2=B1  3%  sched_debug.cpu#86.=
nr_load_updates
    109158 =C2=B1  0%     +51.7%     165558 =C2=B1  3%  sched_debug.cpu#24.=
nr_load_updates
    109865 =C2=B1  0%     +51.7%     166646 =C2=B1  3%  sched_debug.cpu#28.=
nr_load_updates
    109336 =C2=B1  0%     +51.5%     165615 =C2=B1  3%  sched_debug.cpu#25.=
nr_load_updates
    107840 =C2=B1  1%     +51.1%     162988 =C2=B1  3%  sched_debug.cpu#85.=
nr_load_updates
    108834 =C2=B1  0%     +52.7%     166202 =C2=B1  2%  sched_debug.cpu#42.=
nr_load_updates
    109234 =C2=B1  0%     +52.2%     166269 =C2=B1  1%  sched_debug.cpu#34.=
nr_load_updates
      4925 =C2=B1 11%     +55.3%       7649 =C2=B1  5%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
    108152 =C2=B1  0%     +52.7%     165167 =C2=B1  3%  sched_debug.cpu#59.=
nr_load_updates
    109021 =C2=B1  0%     +51.9%     165589 =C2=B1  2%  sched_debug.cpu#43.=
nr_load_updates
    108849 =C2=B1  1%     +52.3%     165824 =C2=B1  3%  sched_debug.cpu#51.=
nr_load_updates
    107509 =C2=B1  0%     +52.1%     163470 =C2=B1  3%  sched_debug.cpu#81.=
nr_load_updates
    107923 =C2=B1  0%     +52.2%     164280 =C2=B1  2%  sched_debug.cpu#94.=
nr_load_updates
    109152 =C2=B1  0%     +51.9%     165841 =C2=B1  2%  sched_debug.cpu#36.=
nr_load_updates
    109233 =C2=B1  0%     +51.7%     165669 =C2=B1  3%  sched_debug.cpu#16.=
nr_load_updates
    794269 =C2=B1  3%     +56.5%    1243280 =C2=B1  1%  proc-vmstat.numa_hi=
nt_faults_local
        35 =C2=B1 12%     +70.8%         60 =C2=B1 32%  sched_debug.cfs_rq[=
91]:/.nr_spread_over
    109376 =C2=B1  0%     +52.4%     166701 =C2=B1  4%  sched_debug.cpu#48.=
nr_load_updates
    109884 =C2=B1  0%     +51.6%     166583 =C2=B1  3%  sched_debug.cpu#76.=
nr_load_updates
    108768 =C2=B1  0%     +52.2%     165524 =C2=B1  2%  sched_debug.cpu#40.=
nr_load_updates
       205 =C2=B1  8%     +68.3%        345 =C2=B1 31%  sched_debug.cpu#102=
.sched_goidle
    107755 =C2=B1  1%     +52.6%     164409 =C2=B1  2%  sched_debug.cpu#75.=
nr_load_updates
    108911 =C2=B1  0%     +51.8%     165300 =C2=B1  2%  sched_debug.cpu#41.=
nr_load_updates
    107700 =C2=B1  1%     +51.2%     162847 =C2=B1  4%  sched_debug.cpu#87.=
nr_load_updates
    109089 =C2=B1  0%     +52.7%     166556 =C2=B1  3%  sched_debug.cpu#50.=
nr_load_updates
    108755 =C2=B1  0%     +52.3%     165588 =C2=B1  4%  sched_debug.cpu#57.=
nr_load_updates
    109446 =C2=B1  0%     +51.1%     165342 =C2=B1  3%  sched_debug.cpu#29.=
nr_load_updates
    109107 =C2=B1  0%     +51.8%     165639 =C2=B1  2%  sched_debug.cpu#38.=
nr_load_updates
    108848 =C2=B1  0%     +53.0%     166487 =C2=B1  3%  sched_debug.cpu#52.=
nr_load_updates
    106969 =C2=B1  0%     +51.7%     162260 =C2=B1  3%  sched_debug.cpu#119=
.nr_load_updates
    106941 =C2=B1  0%     +52.5%     163075 =C2=B1  3%  sched_debug.cpu#115=
.nr_load_updates
    109659 =C2=B1  0%     +51.2%     165776 =C2=B1  3%  sched_debug.cpu#26.=
nr_load_updates
    107508 =C2=B1  0%     +51.7%     163079 =C2=B1  4%  sched_debug.cpu#83.=
nr_load_updates
   2522110 =C2=B1 16%     -33.8%    1668472 =C2=B1  6%  sched_debug.cpu#65.=
avg_idle
    108310 =C2=B1  1%     +51.8%     164390 =C2=B1  3%  sched_debug.cpu#79.=
nr_load_updates
   2775775 =C2=B1  2%     +70.6%    4734115 =C2=B1 20%  sched_debug.cfs_rq[=
29]:/.MIN_vruntime
   2775775 =C2=B1  2%     +70.6%    4734115 =C2=B1 20%  sched_debug.cfs_rq[=
29]:/.max_vruntime
    109087 =C2=B1  0%     +52.3%     166102 =C2=B1  4%  sched_debug.cpu#47.=
nr_load_updates
       235 =C2=B1  7%     +51.8%        357 =C2=B1 19%  sched_debug.cpu#110=
.sched_goidle
    109679 =C2=B1  0%     +52.2%     166887 =C2=B1  2%  sched_debug.cpu#33.=
nr_load_updates
    109126 =C2=B1  0%     +51.6%     165478 =C2=B1  3%  sched_debug.cpu#54.=
nr_load_updates
    107690 =C2=B1  0%     +52.0%     163667 =C2=B1  2%  sched_debug.cpu#96.=
nr_load_updates
      5292 =C2=B1 21%     +45.0%       7672 =C2=B1 16%  sched_debug.cfs_rq[=
118]:/.tg_load_avg
    110492 =C2=B1  0%     +50.8%     166619 =C2=B1  3%  sched_debug.cpu#17.=
nr_load_updates
    108673 =C2=B1  0%     +52.1%     165280 =C2=B1  3%  sched_debug.cpu#56.=
nr_load_updates
    109029 =C2=B1  0%     +52.8%     166601 =C2=B1  4%  sched_debug.cpu#49.=
nr_load_updates
    107054 =C2=B1  0%     +52.6%     163405 =C2=B1  4%  sched_debug.cpu#118=
.nr_load_updates
    107650 =C2=B1  0%     +52.3%     163918 =C2=B1  3%  sched_debug.cpu#107=
.nr_load_updates
      4967 =C2=B1 10%     +52.6%       7577 =C2=B1  6%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
    107748 =C2=B1  0%     +52.2%     164028 =C2=B1  3%  sched_debug.cpu#108=
.nr_load_updates
    109190 =C2=B1  0%     +52.1%     166110 =C2=B1  4%  sched_debug.cpu#46.=
nr_load_updates
    109337 =C2=B1  0%     +52.1%     166310 =C2=B1  3%  sched_debug.cpu#53.=
nr_load_updates
    109296 =C2=B1  0%     +50.9%     164960 =C2=B1  2%  sched_debug.cpu#91.=
nr_load_updates
    107273 =C2=B1  0%     +52.4%     163514 =C2=B1  3%  sched_debug.cpu#105=
.nr_load_updates
    107283 =C2=B1  0%     +51.8%     162892 =C2=B1  3%  sched_debug.cpu#113=
.nr_load_updates
    110338 =C2=B1  0%     +50.6%     166118 =C2=B1  3%  sched_debug.cpu#20.=
nr_load_updates
  28262689 =C2=B1  6%     +57.7%   44576831 =C2=B1  1%  sched_debug.cfs_rq[=
104]:/.min_vruntime
    107669 =C2=B1  0%     +51.4%     162981 =C2=B1  3%  sched_debug.cpu#114=
.nr_load_updates
    109677 =C2=B1  0%     +51.3%     165912 =C2=B1  3%  sched_debug.cpu#23.=
nr_load_updates
      2590 =C2=B1  1%     -33.6%       1720 =C2=B1  4%  numa-vmstat.node3.n=
r_alloc_batch
    108080 =C2=B1  0%     +52.2%     164457 =C2=B1  3%  sched_debug.cpu#110=
.nr_load_updates
    109062 =C2=B1  0%     +51.5%     165250 =C2=B1  3%  sched_debug.cpu#55.=
nr_load_updates
    107194 =C2=B1  1%     +51.8%     162747 =C2=B1  3%  sched_debug.cpu#117=
.nr_load_updates
    110953 =C2=B1  0%     +50.0%     166477 =C2=B1  2%  sched_debug.cpu#2.n=
r_load_updates
     27852 =C2=B1  8%     +41.5%      39400 =C2=B1 10%  sched_debug.cpu#72.=
sched_count
    107830 =C2=B1  1%     +51.2%     163048 =C2=B1  3%  sched_debug.cpu#84.=
nr_load_updates
    107606 =C2=B1  0%     +51.7%     163257 =C2=B1  3%  sched_debug.cpu#112=
.nr_load_updates
    107935 =C2=B1  0%     +51.6%     163607 =C2=B1  4%  sched_debug.cpu#109=
.nr_load_updates
     29741 =C2=B1  4%     +49.0%      44305 =C2=B1  8%  sched_debug.cpu#31.=
sched_count
   1216064 =C2=B1 14%     -30.5%     845359 =C2=B1  1%  sched_debug.cpu#60.=
max_idle_balance_cost
    107059 =C2=B1  0%     +52.0%     162689 =C2=B1  3%  sched_debug.cpu#116=
.nr_load_updates
  29310290 =C2=B1  4%     +55.8%   45652985 =C2=B1  2%  sched_debug.cfs_rq[=
97]:/.min_vruntime
     29578 =C2=B1  4%     +57.3%      46529 =C2=B1 10%  sched_debug.cpu#51.=
sched_count
      8042 =C2=B1 38%     +65.2%      13290 =C2=B1 22%  sched_debug.cpu#48.=
ttwu_count
    109288 =C2=B1  0%     +51.2%     165223 =C2=B1  3%  sched_debug.cpu#106=
.nr_load_updates
   1311713 =C2=B1 14%     -41.4%     769187 =C2=B1 19%  sched_debug.cpu#84.=
max_idle_balance_cost
    109701 =C2=B1  0%     +48.3%     162643 =C2=B1  3%  sched_debug.cpu#13.=
nr_load_updates
    109703 =C2=B1  0%     +51.1%     165809 =C2=B1  3%  sched_debug.cpu#22.=
nr_load_updates
    107554 =C2=B1  1%     +48.5%     159686 =C2=B1  3%  sched_debug.cpu#60.=
nr_load_updates
    109305 =C2=B1  1%     +48.4%     162181 =C2=B1  3%  sched_debug.cpu#61.=
nr_load_updates
      5319 =C2=B1 15%     +52.7%       8124 =C2=B1  6%  sched_debug.cfs_rq[=
98]:/.tg_load_avg
    108496 =C2=B1  0%     +48.5%     161166 =C2=B1  3%  sched_debug.cpu#63.=
nr_load_updates
   1151250 =C2=B1  4%     -28.2%     826707 =C2=B1 21%  sched_debug.cpu#59.=
max_idle_balance_cost
    107688 =C2=B1  0%     +49.0%     160435 =C2=B1  3%  sched_debug.cpu#67.=
nr_load_updates
    108013 =C2=B1  0%     +51.3%     163432 =C2=B1  3%  sched_debug.cpu#111=
.nr_load_updates
     34161 =C2=B1 15%     +31.9%      45069 =C2=B1  7%  sched_debug.cpu#76.=
sched_count
    109384 =C2=B1  0%     +48.7%     162600 =C2=B1  3%  sched_debug.cpu#12.=
nr_load_updates
    110197 =C2=B1  0%     +48.2%     163294 =C2=B1  3%  sched_debug.cpu#9.n=
r_load_updates
      5436 =C2=B1 14%     +43.7%       7814 =C2=B1  1%  sched_debug.cfs_rq[=
92]:/.tg_load_avg
    109524 =C2=B1  0%     +48.5%     162625 =C2=B1  2%  sched_debug.cpu#11.=
nr_load_updates
    111639 =C2=B1  0%     +49.4%     166777 =C2=B1  2%  sched_debug.cpu#19.=
nr_load_updates
    107985 =C2=B1  1%     +48.5%     160360 =C2=B1  3%  sched_debug.cpu#66.=
nr_load_updates
    110171 =C2=B1  0%     +48.2%     163257 =C2=B1  3%  sched_debug.cpu#1.n=
r_load_updates
    109927 =C2=B1  0%     +47.6%     162248 =C2=B1  3%  sched_debug.cpu#7.n=
r_load_updates
    109771 =C2=B1  0%     +48.7%     163258 =C2=B1  2%  sched_debug.cpu#3.n=
r_load_updates
    110205 =C2=B1  1%     +47.4%     162416 =C2=B1  3%  sched_debug.cpu#5.n=
r_load_updates
    109489 =C2=B1  0%     +48.1%     162168 =C2=B1  3%  sched_debug.cpu#14.=
nr_load_updates
    108164 =C2=B1  0%     +48.2%     160297 =C2=B1  3%  sched_debug.cpu#65.=
nr_load_updates
    107902 =C2=B1  0%     +48.8%     160592 =C2=B1  3%  sched_debug.cpu#71.=
nr_load_updates
    110212 =C2=B1  0%     +47.6%     162632 =C2=B1  3%  sched_debug.cpu#6.n=
r_load_updates
     30677 =C2=B1  1%     +47.1%      45133 =C2=B1  4%  sched_debug.cpu#30.=
sched_count
    108799 =C2=B1  0%     +47.8%     160814 =C2=B1  3%  sched_debug.cpu#64.=
nr_load_updates
    108024 =C2=B1  1%     +47.8%     159638 =C2=B1  3%  sched_debug.cpu#70.=
nr_load_updates
    108213 =C2=B1  0%     +49.1%     161366 =C2=B1  3%  sched_debug.cpu#69.=
nr_load_updates
    111428 =C2=B1  2%     +49.2%     166255 =C2=B1  3%  sched_debug.cpu#21.=
nr_load_updates
    109726 =C2=B1  1%     +48.0%     162385 =C2=B1  3%  sched_debug.cpu#8.n=
r_load_updates
     27587 =C2=B1  2%     +44.7%      39928 =C2=B1  4%  sched_debug.cpu#114=
.sched_count
    110432 =C2=B1  1%     +47.9%     163348 =C2=B1  3%  sched_debug.cpu#4.n=
r_load_updates
    108611 =C2=B1  1%     +48.2%     160954 =C2=B1  3%  sched_debug.cpu#62.=
nr_load_updates
    107911 =C2=B1  1%     +48.6%     160379 =C2=B1  3%  sched_debug.cpu#72.=
nr_load_updates
      5220 =C2=B1 13%     +32.5%       6914 =C2=B1  9%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
    109545 =C2=B1  0%     +48.1%     162278 =C2=B1  3%  sched_debug.cpu#10.=
nr_load_updates
    108397 =C2=B1  0%     +48.1%     160543 =C2=B1  3%  sched_debug.cpu#68.=
nr_load_updates
    107763 =C2=B1  0%     +48.6%     160128 =C2=B1  3%  sched_debug.cpu#73.=
nr_load_updates
      5179 =C2=B1  6%     +44.9%       7502 =C2=B1  0%  sched_debug.cfs_rq[=
83]:/.tg_load_avg
    111024 =C2=B1  1%     +46.7%     162924 =C2=B1  2%  sched_debug.cpu#0.n=
r_load_updates
    108178 =C2=B1  0%     +48.2%     160338 =C2=B1  3%  sched_debug.cpu#74.=
nr_load_updates
        12 =C2=B1 13%     -39.5%          7 =C2=B1 26%  sched_debug.cpu#61.=
cpu_load[0]
         3 =C2=B1 34%     +90.9%          7 =C2=B1 20%  sched_debug.cfs_rq[=
90]:/.runnable_load_avg
         5 =C2=B1 17%     +68.8%          9 =C2=B1  9%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
        12 =C2=B1 13%     -36.8%          8 =C2=B1 30%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
         6 =C2=B1 13%    +105.6%         12 =C2=B1 44%  sched_debug.cfs_rq[=
119]:/.runnable_load_avg
         5 =C2=B1  8%     +58.8%          9 =C2=B1 18%  sched_debug.cpu#6.c=
pu_load[3]
         6 =C2=B1 19%     +94.7%         12 =C2=B1 44%  sched_debug.cpu#119=
.cpu_load[3]
         5 =C2=B1  8%     +64.7%          9 =C2=B1 22%  sched_debug.cpu#6.c=
pu_load[4]
         9 =C2=B1 15%     +37.0%         12 =C2=B1  3%  sched_debug.cpu#60.=
nr_running
         6 =C2=B1 13%    +111.1%         12 =C2=B1 46%  sched_debug.cpu#119=
.cpu_load[0]
      5466 =C2=B1 12%     +48.5%       8119 =C2=B1  1%  sched_debug.cfs_rq[=
95]:/.tg_load_avg
     29718 =C2=B1 17%     +36.6%      40592 =C2=B1  9%  sched_debug.cpu#110=
.sched_count
  13922434 =C2=B1  1%     +49.5%   20808272 =C2=B1  1%  softirqs.TIMER
      5162 =C2=B1  4%     +46.1%       7542 =C2=B1  0%  sched_debug.cfs_rq[=
82]:/.tg_load_avg
     26938 =C2=B1  3%     +48.6%      40036 =C2=B1  3%  sched_debug.cpu#42.=
sched_count
      5149 =C2=B1  7%     +48.3%       7638 =C2=B1  1%  sched_debug.cfs_rq[=
87]:/.tg_load_avg
   2332563 =C2=B1 13%     -33.9%    1541851 =C2=B1 13%  sched_debug.cpu#88.=
avg_idle
     27547 =C2=B1  3%     +41.7%      39040 =C2=B1  8%  sched_debug.cpu#64.=
sched_count
        60 =C2=B1  4%     +40.7%         85 =C2=B1 14%  sched_debug.cfs_rq[=
112]:/.load
        60 =C2=B1  4%     +40.7%         85 =C2=B1 14%  sched_debug.cpu#112=
.load
     24782 =C2=B1  7%     +42.3%      35271 =C2=B1  1%  sched_debug.cpu#97.=
nr_switches
     25929 =C2=B1  3%     +46.5%      37986 =C2=B1  2%  sched_debug.cpu#42.=
nr_switches
      5221 =C2=B1 12%     +31.3%       6853 =C2=B1 11%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
   1304697 =C2=B1 22%     -32.6%     879516 =C2=B1 20%  sched_debug.cpu#39.=
max_idle_balance_cost
   1203390 =C2=B1  1%     +50.9%    1816143 =C2=B1  1%  proc-vmstat.numa_hi=
nt_faults
      5079 =C2=B1 11%     +37.3%       6974 =C2=B1  9%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
      4906 =C2=B1 15%     +53.6%       7537 =C2=B1 17%  sched_debug.cfs_rq[=
115]:/.tg_load_avg
      5404 =C2=B1 13%     +43.1%       7732 =C2=B1  1%  sched_debug.cfs_rq[=
91]:/.tg_load_avg
     28540 =C2=B1  9%     +40.2%      40012 =C2=B1  9%  sched_debug.cpu#60.=
sched_count
     30308 =C2=B1  2%     +39.4%      42242 =C2=B1 12%  sched_debug.cpu#14.=
sched_count
     25740 =C2=B1  6%     +44.3%      37150 =C2=B1  3%  sched_debug.cpu#97.=
sched_count
      5090 =C2=B1  8%     +49.5%       7609 =C2=B1  5%  sched_debug.cfs_rq[=
64]:/.tg_load_avg
     27137 =C2=B1  3%     +46.5%      39749 =C2=B1  2%  sched_debug.cpu#119=
.sched_count
      5325 =C2=B1  5%     +41.3%       7524 =C2=B1  1%  sched_debug.cfs_rq[=
88]:/.tg_load_avg
 1.736e+09 =C2=B1  0%     +48.9%  2.585e+09 =C2=B1  1%  cpuidle.C6-IVT-4S.t=
ime
     25353 =C2=B1  1%     +47.2%      37327 =C2=B1  5%  sched_debug.cpu#110=
.nr_switches
     32636 =C2=B1  8%     +40.8%      45953 =C2=B1  7%  sched_debug.cpu#45.=
sched_count
     28275 =C2=B1  9%     +36.6%      38610 =C2=B1  4%  sched_debug.cpu#69.=
sched_count
     26561 =C2=B1  3%     +43.7%      38169 =C2=B1  3%  sched_debug.cpu#105=
.sched_count
   1015481 =C2=B1 10%     -33.9%     670966 =C2=B1  2%  sched_debug.cpu#23.=
max_idle_balance_cost
     28283 =C2=B1  4%     +42.3%      40258 =C2=B1  8%  sched_debug.cpu#59.=
sched_count
      8413 =C2=B1 41%     +55.6%      13090 =C2=B1  7%  sched_debug.cpu#86.=
ttwu_count
     27509 =C2=B1  5%     +44.1%      39633 =C2=B1  6%  sched_debug.cpu#12.=
sched_count
      5500 =C2=B1 13%     +45.0%       7977 =C2=B1  1%  sched_debug.cfs_rq[=
94]:/.tg_load_avg
      1045 =C2=B1 20%     +27.4%       1331 =C2=B1  9%  sched_debug.cpu#33.=
sched_goidle
     27462 =C2=B1  1%     +43.9%      39523 =C2=B1  6%  sched_debug.cpu#68.=
sched_count
     27467 =C2=B1  6%     +41.8%      38947 =C2=B1  2%  sched_debug.cpu#9.s=
ched_count
      5162 =C2=B1  3%     +43.1%       7385 =C2=B1  2%  sched_debug.cfs_rq[=
84]:/.tg_load_avg
     26027 =C2=B1  4%     +47.7%      38436 =C2=B1  0%  sched_debug.cpu#91.=
nr_switches
       577 =C2=B1 12%     +36.5%        788 =C2=B1  1%  sched_debug.cpu#9.s=
ched_goidle
      5628 =C2=B1 11%     +41.2%       7944 =C2=B1  1%  sched_debug.cfs_rq[=
93]:/.tg_load_avg
     32096 =C2=B1  3%     +43.5%      46053 =C2=B1  1%  sched_debug.cpu#18.=
sched_count
      5274 =C2=B1 21%     +44.2%       7606 =C2=B1 19%  sched_debug.cfs_rq[=
116]:/.tg_load_avg
    969427 =C2=B1 12%     -21.0%     765453 =C2=B1 14%  sched_debug.cpu#114=
.max_idle_balance_cost
     26844 =C2=B1  1%     +47.6%      39614 =C2=B1  1%  sched_debug.cpu#77.=
sched_count
    235576 =C2=B1 28%     +65.8%     390538 =C2=B1 18%  numa-meminfo.node2.=
FilePages
      7482 =C2=B1 20%     +43.8%      10758 =C2=B1  7%  numa-meminfo.node2.=
Mapped
     26506 =C2=B1  4%     +39.7%      37034 =C2=B1  5%  sched_debug.cpu#69.=
nr_switches
     29776 =C2=B1 12%     +28.3%      38204 =C2=B1  7%  sched_debug.cpu#11.=
sched_count
      5367 =C2=B1  9%     +43.9%       7724 =C2=B1  0%  sched_debug.cfs_rq[=
90]:/.tg_load_avg
      5153 =C2=B1  4%     +44.5%       7444 =C2=B1  2%  sched_debug.cfs_rq[=
85]:/.tg_load_avg
     27197 =C2=B1  5%     +48.1%      40288 =C2=B1  7%  sched_debug.cpu#118=
.sched_count
     26039 =C2=B1  4%     +42.9%      37202 =C2=B1  2%  sched_debug.cpu#9.n=
r_switches
    473249 =C2=B1  8%     -31.5%     324204 =C2=B1  9%  numa-vmstat.node1.n=
r_active_anon
      5143 =C2=B1  6%     +46.3%       7526 =C2=B1  1%  sched_debug.cfs_rq[=
86]:/.tg_load_avg
     30636 =C2=B1  4%     +37.8%      42219 =C2=B1  6%  sched_debug.cpu#48.=
sched_count
      8036 =C2=B1  6%     -29.7%       5650 =C2=B1  0%  proc-vmstat.nr_mapp=
ed
      2714 =C2=B1 10%     -33.0%       1818 =C2=B1  2%  numa-vmstat.node0.n=
r_alloc_batch
     25864 =C2=B1  5%     +49.3%      38613 =C2=B1  7%  sched_debug.cpu#96.=
sched_count
      5146 =C2=B1 13%     +32.6%       6822 =C2=B1  5%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
     28062 =C2=B1  0%     +38.4%      38825 =C2=B1  6%  sched_debug.cpu#48.=
nr_switches
       520 =C2=B1 21%     +62.0%        843 =C2=B1 19%  sched_debug.cpu#11.=
sched_goidle
     27022 =C2=B1  3%     +34.9%      36441 =C2=B1  7%  sched_debug.cpu#11.=
nr_switches
   2196363 =C2=B1 21%     -36.3%    1400119 =C2=B1 10%  sched_debug.cpu#78.=
avg_idle
         8 =C2=B1 20%     +44.0%         12 =C2=B1 11%  sched_debug.cpu#56.=
nr_running
     28927 =C2=B1  5%     +38.5%      40055 =C2=B1 11%  sched_debug.cpu#14.=
nr_switches
     33663 =C2=B1  7%     -29.1%      23851 =C2=B1  7%  meminfo.Mapped
      6319 =C2=B1  3%     +70.8%      10792 =C2=B1 41%  sched_debug.cpu#106=
.ttwu_count
      5139 =C2=B1  7%     +49.2%       7668 =C2=B1  6%  sched_debug.cfs_rq[=
65]:/.tg_load_avg
     30255 =C2=B1  4%     +34.6%      40733 =C2=B1  5%  sched_debug.cpu#18.=
nr_switches
     58978 =C2=B1 28%     +65.6%      97662 =C2=B1 19%  numa-vmstat.node2.n=
r_file_pages
       236 =C2=B1 12%     +61.8%        382 =C2=B1 18%  sched_debug.cpu#73.=
sched_goidle
   1702406 =C2=B1 14%     -15.1%    1445409 =C2=B1 19%  sched_debug.cpu#81.=
avg_idle
       231 =C2=B1  6%     +78.2%        411 =C2=B1 34%  sched_debug.cpu#72.=
sched_goidle
     25132 =C2=B1  5%     +47.9%      37175 =C2=B1  7%  sched_debug.cpu#96.=
nr_switches
     25897 =C2=B1  2%     +48.0%      38340 =C2=B1  5%  sched_debug.cpu#99.=
sched_count
   2140357 =C2=B1 16%     -36.5%    1359195 =C2=B1  8%  sched_debug.cpu#12.=
avg_idle
       245 =C2=B1  3%     +39.0%        340 =C2=B1 10%  sched_debug.cpu#108=
.sched_goidle
      5183 =C2=B1 14%     +31.3%       6805 =C2=B1  4%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
     26151 =C2=B1  6%     +38.4%      36193 =C2=B1  1%  sched_debug.cpu#73.=
sched_count
      5267 =C2=B1 15%     +45.8%       7676 =C2=B1 10%  sched_debug.cfs_rq[=
108]:/.tg_load_avg
   1130665 =C2=B1  8%     -29.9%     793127 =C2=B1 11%  sched_debug.cpu#105=
.max_idle_balance_cost
     24839 =C2=B1  3%     +48.4%      36863 =C2=B1  6%  sched_debug.cpu#99.=
nr_switches
     26510 =C2=B1  5%     +41.6%      37527 =C2=B1  2%  sched_debug.cpu#38.=
nr_switches
      5218 =C2=B1 11%     +31.2%       6846 =C2=B1  1%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
         6 =C2=B1 18%     +55.0%         10 =C2=B1 19%  sched_debug.cpu#116=
.nr_running
        12 =C2=B1 29%     -36.1%          7 =C2=B1 12%  sched_debug.cfs_rq[=
111]:/.runnable_load_avg
        10 =C2=B1  0%     -26.7%          7 =C2=B1 17%  sched_debug.cpu#111=
.cpu_load[4]
      7279 =C2=B1 41%     +65.2%      12024 =C2=B1  6%  sched_debug.cpu#19.=
ttwu_local
      5025 =C2=B1 11%     +40.3%       7049 =C2=B1 10%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
     28309 =C2=B1  3%     +41.4%      40023 =C2=B1 12%  sched_debug.cpu#66.=
sched_count
     26799 =C2=B1  1%     +41.5%      37929 =C2=B1  6%  sched_debug.cpu#68.=
nr_switches
     25268 =C2=B1  3%     +42.1%      35917 =C2=B1  3%  sched_debug.cpu#116=
.nr_switches
   2215641 =C2=B1 13%     -31.2%    1523682 =C2=B1 12%  sched_debug.cpu#61.=
avg_idle
   2190137 =C2=B1 12%     -30.6%    1518876 =C2=B1  9%  sched_debug.cpu#107=
.avg_idle
       217 =C2=B1  6%     +41.5%        307 =C2=B1 11%  sched_debug.cpu#97.=
sched_goidle
     31974 =C2=B1 17%     +57.5%      50358 =C2=B1 29%  sched_debug.cpu#50.=
sched_count
     28978 =C2=B1  6%     +42.1%      41178 =C2=B1  7%  sched_debug.cpu#10.=
sched_count
     26909 =C2=B1  2%     +39.8%      37624 =C2=B1  3%  sched_debug.cpu#116=
.sched_count
    993513 =C2=B1 12%     -29.7%     698714 =C2=B1 13%  sched_debug.cpu#63.=
max_idle_balance_cost
       611 =C2=B1 26%     +47.1%        899 =C2=B1 11%  sched_debug.cpu#24.=
sched_goidle
     27865 =C2=B1  2%     +52.2%      42425 =C2=B1 17%  sched_debug.cpu#26.=
sched_count
     26493 =C2=B1  4%     +39.1%      36863 =C2=B1  1%  sched_debug.cpu#35.=
nr_switches
      8950 =C2=B1 19%     +27.4%      11401 =C2=B1  5%  sched_debug.cpu#115=
.ttwu_count
     29865 =C2=B1  4%     +45.1%      43332 =C2=B1 12%  sched_debug.cpu#53.=
sched_count
     25579 =C2=B1  3%     +44.6%      36986 =C2=B1  2%  sched_debug.cpu#113=
.sched_count
     27503 =C2=B1  4%     +47.6%      40584 =C2=B1  1%  sched_debug.cpu#91.=
sched_count
     26257 =C2=B1  6%     +34.7%      35374 =C2=B1  1%  sched_debug.cpu#118=
.nr_switches
     25532 =C2=B1  6%     +35.4%      34573 =C2=B1  3%  sched_debug.cpu#73.=
nr_switches
     26796 =C2=B1  3%     +38.8%      37185 =C2=B1  2%  sched_debug.cpu#51.=
nr_switches
     27113 =C2=B1  2%     +42.1%      38532 =C2=B1  7%  sched_debug.cpu#36.=
nr_switches
     27281 =C2=B1  2%     +46.3%      39909 =C2=B1  7%  sched_debug.cpu#31.=
nr_switches
     29467 =C2=B1  3%     +43.1%      42179 =C2=B1  6%  sched_debug.cpu#28.=
sched_count
   1175129 =C2=B1 10%     -36.4%     747032 =C2=B1 10%  sched_debug.cpu#53.=
max_idle_balance_cost
   1767310 =C2=B1  3%     -31.2%    1215759 =C2=B1  5%  sched_debug.cpu#22.=
avg_idle
      1595 =C2=B1 26%     -36.6%       1011 =C2=B1  4%  numa-vmstat.node1.n=
r_mapped
   1033389 =C2=B1  5%     -28.0%     744367 =C2=B1  1%  sched_debug.cpu#55.=
max_idle_balance_cost
   4694027 =C2=B1  2%     +42.8%    6701218 =C2=B1  1%  proc-vmstat.numa_pt=
e_updates
   1972874 =C2=B1 11%     -24.3%    1493774 =C2=B1  5%  sched_debug.cpu#8.a=
vg_idle
   2146277 =C2=B1 17%     -34.6%    1404698 =C2=B1 24%  sched_debug.cpu#4.a=
vg_idle
     24990 =C2=B1  3%     +36.2%      34039 =C2=B1  1%  sched_debug.cpu#82.=
nr_switches
     27712 =C2=B1  0%     +37.6%      38140 =C2=B1  6%  sched_debug.cpu#71.=
sched_count
   1238255 =C2=B1 19%     -36.4%     787212 =C2=B1  9%  sched_debug.cpu#52.=
max_idle_balance_cost
   1927086 =C2=B1 16%     -17.0%    1599072 =C2=B1 16%  sched_debug.cpu#57.=
avg_idle
     10737 =C2=B1 26%     +64.3%      17643 =C2=B1 26%  sched_debug.cpu#20.=
ttwu_count
     28223 =C2=B1  9%     +31.9%      37225 =C2=B1  5%  sched_debug.cpu#63.=
sched_count
   1111919 =C2=B1 19%     -27.2%     809669 =C2=B1 14%  sched_debug.cpu#40.=
max_idle_balance_cost
   1269294 =C2=B1 19%     -38.0%     787044 =C2=B1 10%  sched_debug.cpu#17.=
max_idle_balance_cost
       220 =C2=B1  6%     +48.9%        327 =C2=B1 15%  sched_debug.cpu#95.=
sched_goidle
     37.31 =C2=B1  7%     +38.8%      51.80 =C2=B1  2%  perf-profile.cpu-cy=
cles.unmap_region.do_munmap.sys_brk.system_call_fastpath
         4 =C2=B1 10%     +42.9%          6 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[4]
         4 =C2=B1 10%     +42.9%          6 =C2=B1  7%  sched_debug.cpu#60.=
cpu_load[3]
         4 =C2=B1 21%     +61.5%          7 =C2=B1 11%  sched_debug.cpu#34.=
cpu_load[0]
         4 =C2=B1 21%     +61.5%          7 =C2=B1 11%  sched_debug.cpu#72.=
cpu_load[0]
         4 =C2=B1 26%     +50.0%          7 =C2=B1 11%  sched_debug.cpu#72.=
cpu_load[1]
         5 =C2=B1  0%     +33.3%          6 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[3]
         4 =C2=B1 26%     +57.1%          7 =C2=B1 17%  sched_debug.cpu#72.=
cpu_load[2]
         5 =C2=B1 16%     +80.0%          9 =C2=B1 39%  sched_debug.cpu#108=
.cpu_load[4]
         4 =C2=B1 21%     +61.5%          7 =C2=B1 11%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
         5 =C2=B1  8%     +43.8%          7 =C2=B1 22%  sched_debug.cpu#79.=
cpu_load[1]
         4 =C2=B1 10%     +57.1%          7 =C2=B1 17%  sched_debug.cpu#94.=
cpu_load[0]
         7 =C2=B1 11%     -23.8%          5 =C2=B1  8%  sched_debug.cpu#26.=
cpu_load[0]
         4 =C2=B1 26%     +57.1%          7 =C2=B1 17%  sched_debug.cpu#72.=
cpu_load[3]
         4 =C2=B1 10%     +57.1%          7 =C2=B1 17%  sched_debug.cfs_rq[=
94]:/.runnable_load_avg
     27918 =C2=B1  3%     +42.4%      39757 =C2=B1  1%  sched_debug.cpu#30.=
nr_switches
      4912 =C2=B1 15%     +53.3%       7533 =C2=B1 16%  sched_debug.cfs_rq[=
112]:/.tg_load_avg
     37.35 =C2=B1  7%     +38.7%      51.80 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_munmap.sys_brk.system_call_fastpath
     26816 =C2=B1  2%     +37.6%      36887 =C2=B1  6%  sched_debug.cpu#71.=
nr_switches
     28775 =C2=B1 10%     +34.4%      38664 =C2=B1  3%  sched_debug.cpu#86.=
sched_count
     29274 =C2=B1 12%     +26.7%      37100 =C2=B1  6%  sched_debug.cpu#27.=
nr_switches
   1764342 =C2=B1 11%     -24.0%    1341672 =C2=B1 11%  sched_debug.cpu#63.=
avg_idle
     26782 =C2=B1  2%     +34.7%      36073 =C2=B1  5%  sched_debug.cpu#26.=
nr_switches
     26817 =C2=B1  2%     +36.7%      36651 =C2=B1  2%  sched_debug.cpu#98.=
sched_count
     25729 =C2=B1  3%     +37.6%      35410 =C2=B1  1%  sched_debug.cpu#105=
.nr_switches
   1081473 =C2=B1 12%     -15.4%     914772 =C2=B1 17%  sched_debug.cpu#116=
.max_idle_balance_cost
     26388 =C2=B1  2%     +38.7%      36600 =C2=B1  2%  sched_debug.cpu#119=
.nr_switches
   1357022 =C2=B1 22%     -36.9%     856356 =C2=B1 12%  sched_debug.cpu#18.=
max_idle_balance_cost
     31442 =C2=B1  6%     +39.6%      43888 =C2=B1  2%  sched_debug.cpu#39.=
sched_count
     28981 =C2=B1  5%     +39.2%      40331 =C2=B1  5%  sched_debug.cpu#29.=
sched_count
      5433 =C2=B1  3%     +38.7%       7537 =C2=B1  6%  sched_debug.cfs_rq[=
66]:/.tg_load_avg
      4921 =C2=B1 15%     +51.3%       7448 =C2=B1 16%  sched_debug.cfs_rq[=
114]:/.tg_load_avg
     25228 =C2=B1  2%     +38.5%      34952 =C2=B1  2%  sched_debug.cpu#98.=
nr_switches
      4872 =C2=B1 15%     +54.1%       7508 =C2=B1 17%  sched_debug.cfs_rq[=
113]:/.tg_load_avg
      5456 =C2=B1  3%     +39.7%       7621 =C2=B1  5%  sched_debug.cfs_rq[=
67]:/.tg_load_avg
     26245 =C2=B1  3%     +41.0%      37009 =C2=B1  4%  sched_debug.cpu#12.=
nr_switches
   1806508 =C2=B1 12%     -15.0%    1536103 =C2=B1 17%  sched_debug.cpu#59.=
avg_idle
      5189 =C2=B1  7%     +38.4%       7185 =C2=B1  3%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
     27298 =C2=B1  5%     +36.0%      37117 =C2=B1  1%  sched_debug.cpu#58.=
nr_switches
   2123992 =C2=B1 14%     -30.4%    1477497 =C2=B1 13%  sched_debug.cpu#25.=
avg_idle
      5381 =C2=B1  4%     +41.6%       7618 =C2=B1  7%  sched_debug.cfs_rq[=
68]:/.tg_load_avg
      5206 =C2=B1  4%     +42.4%       7415 =C2=B1  4%  sched_debug.cfs_rq[=
78]:/.tg_load_avg
   1214040 =C2=B1 10%     -31.4%     832296 =C2=B1  3%  sched_debug.cpu#8.m=
ax_idle_balance_cost
     26098 =C2=B1  2%     +32.9%      34687 =C2=B1  5%  sched_debug.cpu#100=
.nr_switches
     27056 =C2=B1  4%     +35.4%      36638 =C2=B1  8%  sched_debug.cpu#70.=
sched_count
      5445 =C2=B1  5%     +35.0%       7353 =C2=B1  7%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
   1348748 =C2=B1 33%     -39.2%     820178 =C2=B1 17%  sched_debug.cpu#115=
.max_idle_balance_cost
       237 =C2=B1  3%     +47.3%        349 =C2=B1 17%  sched_debug.cpu#65.=
sched_goidle
     29166 =C2=B1  4%     +33.8%      39015 =C2=B1  2%  sched_debug.cpu#92.=
sched_count
      5237 =C2=B1  4%     +43.4%       7511 =C2=B1  6%  sched_debug.cfs_rq[=
77]:/.tg_load_avg
     29502 =C2=B1  2%     +35.8%      40055 =C2=B1  5%  sched_debug.cpu#55.=
sched_count
      5131 =C2=B1  5%     +43.2%       7347 =C2=B1  3%  sched_debug.cfs_rq[=
79]:/.tg_load_avg
      6216 =C2=B1 17%     +19.5%       7426 =C2=B1 16%  sched_debug.cpu#28.=
ttwu_local
   1856221 =C2=B1  7%     -29.5%    1309528 =C2=B1  7%  numa-meminfo.node1.=
Active(anon)
   1028819 =C2=B1 15%     -31.3%     706940 =C2=B1 19%  sched_debug.cpu#89.=
max_idle_balance_cost
     27275 =C2=B1  3%     +39.7%      38115 =C2=B1  3%  sched_debug.cpu#93.=
sched_count
     29855 =C2=B1  4%     +35.7%      40525 =C2=B1  2%  sched_debug.cpu#38.=
sched_count
     29007 =C2=B1  5%     +42.6%      41357 =C2=B1  5%  sched_debug.cpu#37.=
sched_count
      5329 =C2=B1  4%     +35.9%       7241 =C2=B1  2%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
     27832 =C2=B1  9%     +32.0%      36745 =C2=B1  6%  sched_debug.cpu#60.=
nr_switches
       222 =C2=B1 20%     +95.5%        435 =C2=B1 37%  sched_debug.cpu#70.=
sched_goidle
      5091 =C2=B1 37%     +63.8%       8338 =C2=B1 15%  sched_debug.cpu#71.=
ttwu_local
   1879246 =C2=B1  7%     -29.1%    1331476 =C2=B1  7%  numa-meminfo.node1.=
Active
     26986 =C2=B1  5%     +43.5%      38734 =C2=B1  4%  sched_debug.cpu#89.=
sched_count
      5150 =C2=B1  7%     +38.5%       7133 =C2=B1  4%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
     28382 =C2=B1  5%     +35.5%      38461 =C2=B1  3%  sched_debug.cpu#41.=
nr_switches
      5352 =C2=B1  1%     +36.3%       7293 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
   1061971 =C2=B1 12%     -30.6%     737057 =C2=B1  2%  sched_debug.cpu#118=
.max_idle_balance_cost
     27541 =C2=B1  9%     +28.8%      35465 =C2=B1  5%  sched_debug.cpu#63.=
nr_switches
     27538 =C2=B1  7%     +36.5%      37600 =C2=B1  2%  sched_debug.cpu#92.=
nr_switches
     26657 =C2=B1  2%     +32.9%      35418 =C2=B1  3%  sched_debug.cpu#95.=
sched_count
     29418 =C2=B1  1%     +34.6%      39588 =C2=B1  3%  sched_debug.cpu#33.=
nr_switches
     27453 =C2=B1  3%     +34.1%      36823 =C2=B1  3%  sched_debug.cpu#55.=
nr_switches
     29552 =C2=B1  6%     +35.7%      40112 =C2=B1  4%  sched_debug.cpu#41.=
sched_count
     30468 =C2=B1  6%     +38.8%      42275 =C2=B1  9%  sched_debug.cpu#1.n=
r_switches
     26283 =C2=B1  5%     +41.4%      37154 =C2=B1  3%  sched_debug.cpu#89.=
nr_switches
       367 =C2=B1 10%     +25.2%        459 =C2=B1 11%  sched_debug.cpu#62.=
sched_goidle
     32787 =C2=B1  4%     +33.3%      43700 =C2=B1  3%  sched_debug.cpu#17.=
sched_count
     24810 =C2=B1  2%     +41.4%      35073 =C2=B1  2%  sched_debug.cpu#113=
.nr_switches
     28737 =C2=B1  2%     +34.1%      38551 =C2=B1  6%  sched_debug.cpu#83.=
sched_count
      5188 =C2=B1  7%     +39.2%       7219 =C2=B1  4%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
     31975 =C2=B1  6%     +43.7%      45939 =C2=B1 13%  sched_debug.cpu#4.s=
ched_count
     27794 =C2=B1  6%     +36.7%      38003 =C2=B1  4%  sched_debug.cpu#50.=
nr_switches
      5053 =C2=B1 15%     +47.9%       7472 =C2=B1 15%  sched_debug.cfs_rq[=
111]:/.tg_load_avg
   2234917 =C2=B1 20%     -31.2%    1536891 =C2=B1 14%  sched_debug.cpu#115=
.avg_idle
     26385 =C2=B1  4%     +33.6%      35241 =C2=B1  9%  sched_debug.cpu#70.=
nr_switches
     27192 =C2=B1  8%     +29.5%      35222 =C2=B1  6%  sched_debug.cpu#72.=
nr_switches
     30013 =C2=B1  9%     +33.4%      40036 =C2=B1  4%  sched_debug.cpu#74.=
sched_count
       191 =C2=B1  9%     +36.7%        262 =C2=B1  9%  sched_debug.cpu#103=
.sched_goidle
     32365 =C2=B1  6%     +37.1%      44370 =C2=B1  9%  sched_debug.cpu#1.s=
ched_count
     25870 =C2=B1  0%     +41.8%      36675 =C2=B1 11%  sched_debug.cpu#87.=
sched_count
     26515 =C2=B1  5%     +35.9%      36034 =C2=B1  0%  sched_debug.cpu#101=
.sched_count
     30573 =C2=B1  9%     +31.4%      40166 =C2=B1  5%  sched_debug.cpu#52.=
sched_count
     25974 =C2=B1  1%     +37.0%      35588 =C2=B1  4%  sched_debug.cpu#77.=
nr_switches
     26327 =C2=B1  2%     +37.2%      36116 =C2=B1  2%  sched_debug.cpu#93.=
nr_switches
     28679 =C2=B1  7%     +34.7%      38643 =C2=B1  4%  sched_debug.cpu#44.=
nr_switches
      5233 =C2=B1  4%     +40.3%       7341 =C2=B1  4%  sched_debug.cfs_rq[=
80]:/.tg_load_avg
   1029635 =C2=B1 17%     -21.5%     808634 =C2=B1 14%  sched_debug.cpu#77.=
max_idle_balance_cost
      5366 =C2=B1 10%     +26.9%       6810 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
       449 =C2=B1  6%     +49.9%        673 =C2=B1 17%  sched_debug.cpu#58.=
sched_goidle
      5240 =C2=B1  4%     +42.2%       7451 =C2=B1  3%  sched_debug.cfs_rq[=
81]:/.tg_load_avg
      5211 =C2=B1  5%     +39.2%       7252 =C2=B1  5%  sched_debug.cfs_rq[=
75]:/.tg_load_avg
       235 =C2=B1 19%     +31.0%        308 =C2=B1 13%  sched_debug.cpu#83.=
sched_goidle
   1702841 =C2=B1 10%     -30.6%    1181187 =C2=B1  3%  sched_debug.cpu#23.=
avg_idle
      5540 =C2=B1  6%     +32.4%       7337 =C2=B1  7%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
     27061 =C2=B1  6%     +41.4%      38276 =C2=B1  3%  sched_debug.cpu#90.=
sched_count
     32534 =C2=B1 11%     +35.5%      44092 =C2=B1 12%  sched_debug.cpu#8.s=
ched_count
   2186645 =C2=B1  5%     +32.0%    2885949 =C2=B1  4%  time.voluntary_cont=
ext_switches
     29185 =C2=B1  3%     +38.0%      40280 =C2=B1  3%  sched_debug.cpu#58.=
sched_count
     27586 =C2=B1  9%     +29.5%      35727 =C2=B1  4%  sched_debug.cpu#43.=
nr_switches
   1093890 =C2=B1 14%     -26.4%     804711 =C2=B1 14%  sched_debug.cpu#71.=
max_idle_balance_cost
     28103 =C2=B1  1%     +45.8%      40961 =C2=B1 13%  sched_debug.cpu#23.=
sched_count
      5396 =C2=B1  5%     +34.5%       7260 =C2=B1  2%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
      5298 =C2=B1 14%     +41.8%       7511 =C2=B1 12%  sched_debug.cfs_rq[=
109]:/.tg_load_avg
      5195 =C2=B1  9%     +36.5%       7093 =C2=B1  3%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
   2152230 =C2=B1  9%     -29.5%    1517828 =C2=B1  3%  sched_debug.cpu#82.=
avg_idle
     26931 =C2=B1  2%     +34.3%      36161 =C2=B1  2%  sched_debug.cpu#103=
.sched_count
     25123 =C2=B1  0%     +38.7%      34839 =C2=B1 10%  sched_debug.cpu#87.=
nr_switches
        30 =C2=B1 24%     +68.1%         51 =C2=B1 21%  sched_debug.cfs_rq[=
98]:/.blocked_load_avg
   1273151 =C2=B1 13%     -30.8%     880690 =C2=B1 11%  sched_debug.cpu#45.=
max_idle_balance_cost
     25763 =C2=B1  1%     +31.7%      33928 =C2=B1  3%  sched_debug.cpu#95.=
nr_switches
     28493 =C2=B1  4%     +33.6%      38060 =C2=B1  7%  sched_debug.cpu#13.=
sched_count
   2245631 =C2=B1 10%     -32.9%    1507645 =C2=B1 18%  sched_debug.cpu#84.=
avg_idle
     25777 =C2=B1  3%     +30.1%      33536 =C2=B1  1%  sched_debug.cpu#78.=
nr_switches
   1822496 =C2=B1 19%     -27.0%    1330059 =C2=B1  4%  sched_debug.cpu#28.=
avg_idle
     28020 =C2=B1  4%     +32.1%      37026 =C2=B1  3%  sched_debug.cpu#52.=
nr_switches
     31099 =C2=B1  1%     +29.2%      40180 =C2=B1  4%  sched_debug.cpu#44.=
sched_count
      5478 =C2=B1  6%     +37.1%       7512 =C2=B1  9%  sched_debug.cfs_rq[=
69]:/.tg_load_avg
      5212 =C2=B1 15%     +44.9%       7552 =C2=B1 15%  sched_debug.cfs_rq[=
110]:/.tg_load_avg
       240 =C2=B1 27%     +52.1%        366 =C2=B1  9%  sched_debug.cpu#114=
.sched_goidle
   1138290 =C2=B1 15%     -20.6%     903719 =C2=B1 12%  sched_debug.cpu#20.=
max_idle_balance_cost
     27438 =C2=B1  4%     +34.0%      36780 =C2=B1  2%  sched_debug.cpu#22.=
nr_switches
     25415 =C2=B1  3%     +36.0%      34559 =C2=B1  0%  sched_debug.cpu#101=
.nr_switches
     26822 =C2=B1  4%     +31.8%      35339 =C2=B1  6%  sched_debug.cpu#59.=
nr_switches
   1947631 =C2=B1 18%     -23.2%    1495390 =C2=B1 15%  sched_debug.cpu#77.=
avg_idle
      8153 =C2=B1 32%     +47.4%      12013 =C2=B1 18%  sched_debug.cpu#72.=
ttwu_count
     26753 =C2=B1  2%     +32.6%      35462 =C2=B1  0%  sched_debug.cpu#78.=
sched_count
     27644 =C2=B1  4%     +34.1%      37071 =C2=B1 11%  sched_debug.cpu#66.=
nr_switches
     30324 =C2=B1 13%     +18.9%      36049 =C2=B1  4%  sched_debug.cpu#100=
.sched_count
     29298 =C2=B1  9%     +30.9%      38343 =C2=B1  4%  sched_debug.cpu#74.=
nr_switches
         5 =C2=B1 22%     +64.7%          9 =C2=B1 28%  sched_debug.cpu#13.=
cpu_load[2]
         5 =C2=B1 28%    +106.7%         10 =C2=B1 38%  sched_debug.cpu#83.=
cpu_load[0]
         5 =C2=B1  8%     +41.2%          8 =C2=B1 10%  sched_debug.cpu#104=
.cpu_load[4]
        12 =C2=B1 10%     -29.7%          8 =C2=B1 14%  sched_debug.cpu#61.=
cpu_load[2]
         5 =C2=B1 22%     +70.6%          9 =C2=B1 31%  sched_debug.cpu#4.c=
pu_load[4]
        11 =C2=B1 17%     +37.1%         16 =C2=B1  5%  sched_debug.cpu#36.=
nr_running
         5 =C2=B1  8%     +41.2%          8 =C2=B1 10%  sched_debug.cpu#2.c=
pu_load[0]
         5 =C2=B1  8%     +41.2%          8 =C2=B1 10%  sched_debug.cpu#2.c=
pu_load[1]
        16 =C2=B1 10%     -25.0%         12 =C2=B1 13%  sched_debug.cpu#28.=
nr_running
         5 =C2=B1  8%     +41.2%          8 =C2=B1 10%  sched_debug.cpu#6.c=
pu_load[2]
       696 =C2=B1 11%     +52.1%       1059 =C2=B1 23%  sched_debug.cpu#25.=
sched_goidle
      5397 =C2=B1  1%     +32.2%       7137 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     27409 =C2=B1  5%     +33.6%      36612 =C2=B1  7%  sched_debug.cpu#67.=
sched_count
   1312754 =C2=B1 29%     -40.7%     777920 =C2=B1 17%  sched_debug.cpu#13.=
max_idle_balance_cost
      5248 =C2=B1  5%     +37.0%       7188 =C2=B1  6%  sched_debug.cfs_rq[=
76]:/.tg_load_avg
      5515 =C2=B1  4%     +32.2%       7292 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
       556 =C2=B1  9%     +62.4%        902 =C2=B1 36%  sched_debug.cpu#31.=
sched_goidle
     27490 =C2=B1  4%     +32.6%      36446 =C2=B1  8%  sched_debug.cpu#13.=
nr_switches
     25880 =C2=B1  4%     +33.0%      34412 =C2=B1  3%  sched_debug.cpu#103=
.nr_switches
     29002 =C2=B1  2%     +33.6%      38756 =C2=B1  6%  sched_debug.cpu#16.=
nr_switches
      5394 =C2=B1  7%     +27.3%       6865 =C2=B1  1%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
      5561 =C2=B1  5%     +30.5%       7257 =C2=B1  7%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      5676 =C2=B1  4%     +32.8%       7538 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
       224 =C2=B1 10%     +38.6%        311 =C2=B1  9%  sched_debug.cpu#116=
.sched_goidle
     27295 =C2=B1  2%     +34.4%      36679 =C2=B1  5%  sched_debug.cpu#112=
.sched_count
     26358 =C2=B1  7%     +37.4%      36226 =C2=B1  4%  sched_debug.cpu#90.=
nr_switches
   1974844 =C2=B1 22%     -32.0%    1342988 =C2=B1  3%  sched_debug.cpu#83.=
avg_idle
     27495 =C2=B1  3%     +36.1%      37423 =C2=B1  3%  sched_debug.cpu#56.=
sched_count
      5233 =C2=B1  6%     +37.3%       7185 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
   1246808 =C2=B1 15%     -24.0%     947735 =C2=B1  9%  sched_debug.cpu#19.=
max_idle_balance_cost
     28012 =C2=B1  8%     +25.8%      35251 =C2=B1  1%  sched_debug.cpu#57.=
nr_switches
     28066 =C2=B1 11%     +29.4%      36323 =C2=B1  2%  sched_debug.cpu#86.=
nr_switches
     29329 =C2=B1  6%     +27.5%      37400 =C2=B1  3%  sched_debug.cpu#43.=
sched_count
     26265 =C2=B1  3%     +32.1%      34685 =C2=B1  4%  sched_debug.cpu#25.=
nr_switches
     27913 =C2=B1  4%     +28.6%      35888 =C2=B1  6%  sched_debug.cpu#65.=
sched_count
     26682 =C2=B1  4%     +33.1%      35500 =C2=B1  1%  sched_debug.cpu#82.=
sched_count
    951444 =C2=B1 14%     -32.2%     644834 =C2=B1  6%  sched_debug.cpu#64.=
max_idle_balance_cost
     27988 =C2=B1  2%     +35.1%      37814 =C2=B1  4%  sched_debug.cpu#28.=
nr_switches
     27940 =C2=B1  4%     +37.9%      38524 =C2=B1  7%  sched_debug.cpu#115=
.sched_count
     30202 =C2=B1  6%     +32.5%      40022 =C2=B1  4%  sched_debug.cpu#39.=
nr_switches
     26356 =C2=B1  4%     +34.4%      35432 =C2=B1  3%  sched_debug.cpu#23.=
nr_switches
     28482 =C2=B1  3%     +31.7%      37521 =C2=B1  4%  sched_debug.cpu#111=
.sched_count
   2542743 =C2=B1 15%     -36.2%    1621241 =C2=B1 14%  sched_debug.cpu#26.=
avg_idle
     28395 =C2=B1  1%     +30.9%      37160 =C2=B1  0%  sched_debug.cpu#46.=
nr_switches
     27609 =C2=B1  2%     +32.2%      36485 =C2=B1  3%  sched_debug.cpu#34.=
nr_switches
     10833 =C2=B1 18%     +40.7%      15242 =C2=B1 15%  sched_debug.cpu#18.=
ttwu_count
      5181 =C2=B1  7%     +38.8%       7191 =C2=B1  4%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     29051 =C2=B1  4%     +33.2%      38708 =C2=B1  4%  sched_debug.cpu#24.=
sched_count
      5597 =C2=B1  4%     +31.7%       7369 =C2=B1  3%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
   1369381 =C2=B1 29%     -31.8%     934348 =C2=B1 14%  sched_debug.cpu#49.=
max_idle_balance_cost
      5351 =C2=B1  5%     +34.1%       7178 =C2=B1  4%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
     30437 =C2=B1  4%     +31.4%      40006 =C2=B1  3%  sched_debug.cpu#47.=
sched_count
   1801226 =C2=B1 13%     -27.9%    1298032 =C2=B1  5%  sched_debug.cpu#3.a=
vg_idle
     29625 =C2=B1  4%     +39.5%      41313 =C2=B1 12%  sched_debug.cpu#8.n=
r_switches
   1817115 =C2=B1 10%     -21.0%    1435255 =C2=B1 13%  sched_debug.cpu#56.=
avg_idle
     28674 =C2=B1  4%     +25.9%      36107 =C2=B1  4%  sched_debug.cpu#53.=
nr_switches
      5507 =C2=B1  6%     +32.9%       7317 =C2=B1  5%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     26512 =C2=B1  1%     +28.4%      34043 =C2=B1  3%  sched_debug.cpu#112=
.nr_switches
     25060 =C2=B1  1%     +28.9%      32293 =C2=B1  5%  sched_debug.cpu#85.=
nr_switches
       215 =C2=B1 10%     +39.7%        300 =C2=B1  8%  sched_debug.cpu#90.=
sched_goidle
      5721 =C2=B1  9%     +36.3%       7796 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      5203 =C2=B1  6%     +41.6%       7367 =C2=B1  8%  sched_debug.cfs_rq[=
74]:/.tg_load_avg
      5414 =C2=B1  6%     +27.3%       6891 =C2=B1  1%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
     27623 =C2=B1  3%     +33.9%      36978 =C2=B1  5%  sched_debug.cpu#102=
.sched_count
     29325 =C2=B1  7%     +28.6%      37717 =C2=B1  4%  sched_debug.cpu#104=
.nr_switches
     30775 =C2=B1  4%     +29.9%      39987 =C2=B1  3%  sched_debug.cpu#17.=
nr_switches
     26588 =C2=B1  3%     +31.7%      35007 =C2=B1  1%  sched_debug.cpu#81.=
sched_count
      5499 =C2=B1  5%     +33.2%       7323 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
     28617 =C2=B1  3%     +29.5%      37068 =C2=B1  4%  sched_debug.cpu#47.=
nr_switches
     31246 =C2=B1  3%     +29.7%      40511 =C2=B1  1%  sched_debug.cpu#46.=
sched_count
   2027799 =C2=B1 23%     -31.5%    1388630 =C2=B1 11%  sched_debug.cpu#17.=
avg_idle
      5495 =C2=B1  4%     +34.0%       7362 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
     94026 =C2=B1  1%     +29.6%     121872 =C2=B1  2%  proc-vmstat.numa_pa=
ges_migrated
     94026 =C2=B1  1%     +29.6%     121872 =C2=B1  2%  proc-vmstat.pgmigra=
te_success
     26345 =C2=B1  2%     +28.3%      33796 =C2=B1  5%  sched_debug.cpu#85.=
sched_count
   1244633 =C2=B1 20%     -27.7%     899308 =C2=B1  7%  sched_debug.cpu#54.=
max_idle_balance_cost
       494 =C2=B1  9%     +24.7%        616 =C2=B1  6%  sched_debug.cpu#57.=
sched_goidle
      5645 =C2=B1  2%     +29.3%       7299 =C2=B1  3%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     30549 =C2=B1  4%     +37.6%      42027 =C2=B1 12%  sched_debug.cpu#3.n=
r_switches
     26592 =C2=B1  5%     +31.6%      34988 =C2=B1  7%  sched_debug.cpu#67.=
nr_switches
     27112 =C2=B1  4%     +31.6%      35672 =C2=B1  3%  sched_debug.cpu#115=
.nr_switches
     31504 =C2=B1  8%     +36.9%      43130 =C2=B1 15%  sched_debug.cpu#20.=
sched_count
     32860 =C2=B1  2%     +32.2%      43448 =C2=B1  2%  sched_debug.cpu#2.n=
r_switches
      5247 =C2=B1  8%     +39.0%       7291 =C2=B1  7%  sched_debug.cfs_rq[=
73]:/.tg_load_avg
     26610 =C2=B1  6%     +23.6%      32887 =C2=B1  2%  sched_debug.cpu#80.=
nr_switches
      5359 =C2=B1  7%     +34.9%       7227 =C2=B1  8%  sched_debug.cfs_rq[=
71]:/.tg_load_avg
     28056 =C2=B1  5%     +34.9%      37854 =C2=B1  5%  sched_debug.cpu#79.=
sched_count
     26386 =C2=B1  2%     +28.8%      33995 =C2=B1  5%  sched_debug.cpu#94.=
nr_switches
      5315 =C2=B1  7%     +35.4%       7199 =C2=B1  9%  sched_debug.cfs_rq[=
72]:/.tg_load_avg
     27169 =C2=B1  4%     +25.7%      34149 =C2=B1  6%  sched_debug.cpu#65.=
nr_switches
     28023 =C2=B1  5%     +30.2%      36494 =C2=B1  5%  sched_debug.cpu#29.=
nr_switches
     27834 =C2=B1  5%     +35.9%      37819 =C2=B1  3%  sched_debug.cpu#37.=
nr_switches
     30353 =C2=B1  5%     +24.5%      37799 =C2=B1  1%  sched_debug.cpu#109=
.sched_count
   1226327 =C2=B1 20%     -22.1%     955059 =C2=B1 12%  sched_debug.cpu#0.m=
ax_idle_balance_cost
         7 =C2=B1 11%     +23.8%          8 =C2=B1  5%  sched_debug.cpu#14.=
cpu_load[2]
         7 =C2=B1 11%     +38.1%          9 =C2=B1 17%  sched_debug.cpu#14.=
cpu_load[4]
         6 =C2=B1 14%    +100.0%         12 =C2=B1 46%  sched_debug.cpu#119=
.cpu_load[1]
         7 =C2=B1 11%     +38.1%          9 =C2=B1 17%  sched_debug.cpu#14.=
cpu_load[3]
         6 =C2=B1 14%     +94.7%         12 =C2=B1 44%  sched_debug.cpu#119=
.cpu_load[2]
   1087052 =C2=B1 20%     -34.3%     714255 =C2=B1  4%  sched_debug.cpu#3.m=
ax_idle_balance_cost
   1778166 =C2=B1  3%     -24.3%    1345995 =C2=B1  7%  sched_debug.cpu#53.=
avg_idle
      5494 =C2=B1  7%     +28.9%       7081 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
      5468 =C2=B1  8%     +28.1%       7006 =C2=B1  3%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
      5679 =C2=B1  4%     +30.7%       7421 =C2=B1  3%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
      5860 =C2=B1 12%     +33.4%       7819 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     32477 =C2=B1  5%     +28.2%      41627 =C2=B1  7%  sched_debug.cpu#16.=
sched_count
     26721 =C2=B1  4%     +31.9%      35235 =C2=B1  4%  sched_debug.cpu#102=
.nr_switches
     31233 =C2=B1  6%     +27.1%      39710 =C2=B1  3%  sched_debug.cpu#49.=
sched_count
     33200 =C2=B1  9%     +32.2%      43880 =C2=B1  6%  sched_debug.cpu#19.=
sched_count
     26316 =C2=B1  3%     +34.2%      35317 =C2=B1  4%  sched_debug.cpu#56.=
nr_switches
   2646863 =C2=B1 11%     -10.7%    2363160 =C2=B1 11%  numa-meminfo.node2.=
MemUsed
     32279 =C2=B1  4%     +37.5%      44369 =C2=B1 11%  sched_debug.cpu#3.s=
ched_count
   1825301 =C2=B1  6%     -23.5%    1395510 =C2=B1 11%  sched_debug.cpu#104=
.avg_idle
      3380 =C2=B1  5%     +23.3%       4169 =C2=B1  1%  sched_debug.cpu#89.=
curr->pid
      5395 =C2=B1  4%     +33.3%       7192 =C2=B1  3%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     29662 =C2=B1  6%     +24.5%      36923 =C2=B1  3%  sched_debug.cpu#49.=
nr_switches
   1817343 =C2=B1 14%     -26.6%    1334015 =C2=B1 18%  sched_debug.cpu#89.=
avg_idle
   1482860 =C2=B1 14%     -19.9%    1187970 =C2=B1  4%  numa-meminfo.node3.=
AnonPages
     34289 =C2=B1  9%     +22.9%      42158 =C2=B1 10%  sched_debug.cpu#5.s=
ched_count
   1131215 =C2=B1 22%     -28.2%     811999 =C2=B1  8%  sched_debug.cpu#24.=
max_idle_balance_cost
       239 =C2=B1 16%     +25.3%        300 =C2=B1  8%  sched_debug.cpu#82.=
sched_goidle
     30120 =C2=B1  8%     +28.9%      38816 =C2=B1 10%  sched_debug.cpu#20.=
nr_switches
     35446 =C2=B1  4%     +34.1%      47517 =C2=B1  7%  sched_debug.cpu#2.s=
ched_count
   1967297 =C2=B1  8%     -24.6%    1484173 =C2=B1 11%  sched_debug.cpu#105=
.avg_idle
      5723 =C2=B1  4%     +29.6%       7419 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
    389145 =C2=B1  2%     -24.8%     292509 =C2=B1  8%  numa-vmstat.node1.n=
r_anon_pages
     29197 =C2=B1 10%     +18.8%      34699 =C2=B1  3%  sched_debug.cpu#117=
.sched_count
   1653002 =C2=B1  9%     -17.3%    1366525 =C2=B1  3%  sched_debug.cpu#55.=
avg_idle
      5633 =C2=B1  3%     +29.8%       7310 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
     27839 =C2=B1  6%     +32.3%      36845 =C2=B1  3%  sched_debug.cpu#10.=
nr_switches
     30726 =C2=B1 11%     +27.2%      39069 =C2=B1  4%  sched_debug.cpu#40.=
sched_count
       226 =C2=B1 23%     +43.0%        323 =C2=B1 12%  sched_debug.cpu#113=
.sched_goidle
   2645436 =C2=B1  5%     -22.5%    2049208 =C2=B1  6%  numa-meminfo.node1.=
MemUsed
   1847392 =C2=B1 11%     -23.7%    1410061 =C2=B1  8%  sched_debug.cpu#24.=
avg_idle
     28233 =C2=B1  7%     +32.0%      37281 =C2=B1  5%  sched_debug.cpu#40.=
nr_switches
     27956 =C2=B1  3%     +31.9%      36868 =C2=B1  7%  sched_debug.cpu#108=
.sched_count
      5752 =C2=B1 11%     +33.7%       7690 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      5439 =C2=B1  9%     +34.6%       7322 =C2=B1  7%  sched_debug.cfs_rq[=
70]:/.tg_load_avg
      5657 =C2=B1  5%     +30.3%       7369 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     28613 =C2=B1  7%     +26.2%      36117 =C2=B1  3%  sched_debug.cpu#94.=
sched_count
       266 =C2=B1  9%     +20.3%        320 =C2=B1  8%  sched_debug.cpu#68.=
sched_goidle
     28845 =C2=B1  6%     +34.4%      38775 =C2=B1 12%  sched_debug.cpu#7.s=
ched_count
   1525284 =C2=B1  2%     -22.4%    1183745 =C2=B1  7%  numa-meminfo.node1.=
AnonPages
      5440 =C2=B1  6%     +31.4%       7150 =C2=B1  2%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
     28527 =C2=B1  4%     +31.0%      37379 =C2=B1  4%  sched_debug.cpu#88.=
sched_count
    960040 =C2=B1  9%     -16.9%     798124 =C2=B1 18%  sched_debug.cpu#104=
.max_idle_balance_cost
     26784 =C2=B1  3%     +33.0%      35620 =C2=B1  9%  sched_debug.cpu#64.=
nr_switches
   1097006 =C2=B1 24%     -28.3%     786424 =C2=B1 11%  sched_debug.cpu#69.=
max_idle_balance_cost
    906449 =C2=B1  3%     -17.9%     744374 =C2=B1  6%  sched_debug.cpu#109=
.max_idle_balance_cost
     41058 =C2=B1 11%     +15.8%      47561 =C2=B1  2%  sched_debug.cpu#0.n=
r_switches
      5939 =C2=B1  7%     +28.5%       7629 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     29504 =C2=B1  4%     +31.8%      38876 =C2=B1  3%  sched_debug.cpu#45.=
nr_switches
      5636 =C2=B1  5%     +30.6%       7361 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     27534 =C2=B1  6%     +33.7%      36827 =C2=B1 12%  sched_debug.cpu#7.n=
r_switches
     31358 =C2=B1  8%     +27.4%      39935 =C2=B1  4%  sched_debug.cpu#19.=
nr_switches
     29002 =C2=B1  4%     +22.2%      35442 =C2=B1  3%  sched_debug.cpu#54.=
nr_switches
   7017225 =C2=B1  5%     -17.1%    5820718 =C2=B1  1%  meminfo.Active(anon)
       524 =C2=B1  8%     +24.1%        650 =C2=B1  4%  sched_debug.cpu#46.=
sched_goidle
         8 =C2=B1 10%     +29.2%         10 =C2=B1 12%  sched_debug.cpu#51.=
nr_running
     27219 =C2=B1  2%     +27.0%      34579 =C2=B1  3%  sched_debug.cpu#111=
.nr_switches
   2011680 =C2=B1  9%     -20.7%    1595763 =C2=B1  0%  sched_debug.cpu#60.=
avg_idle
       340 =C2=B1  9%     +32.0%        448 =C2=B1 11%  sched_debug.cpu#107=
.sched_goidle
     27060 =C2=B1  3%     +28.5%      34766 =C2=B1  5%  sched_debug.cpu#108=
.nr_switches
   7105638 =C2=B1  5%     -16.8%    5909786 =C2=B1  1%  meminfo.Active
   1671225 =C2=B1 13%     -25.5%    1245685 =C2=B1  7%  sched_debug.cpu#64.=
avg_idle
   4576561 =C2=B1  1%     +24.9%    5715773 =C2=B1  0%  time.involuntary_co=
ntext_switches
    922503 =C2=B1 17%     -21.6%     723007 =C2=B1  9%  sched_debug.cpu#97.=
max_idle_balance_cost
      5734 =C2=B1  4%     +27.1%       7289 =C2=B1  4%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     29345 =C2=B1  5%     +21.9%      35761 =C2=B1  3%  sched_debug.cpu#75.=
sched_count
     29638 =C2=B1  4%     +32.3%      39221 =C2=B1  4%  sched_debug.cpu#32.=
nr_switches
      5756 =C2=B1 12%     +31.4%       7561 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     32219 =C2=B1  3%     +22.2%      39367 =C2=B1  5%  sched_debug.cpu#15.=
nr_switches
   1984007 =C2=B1 20%     -31.6%    1357898 =C2=B1 10%  sched_debug.cpu#51.=
avg_idle
   1697256 =C2=B1 13%     -18.5%    1384031 =C2=B1  9%  sched_debug.cpu#97.=
avg_idle
     30898 =C2=B1  7%     +28.9%      39835 =C2=B1 11%  sched_debug.cpu#6.s=
ched_count
   1484902 =C2=B1  5%     -16.2%    1244348 =C2=B1  3%  proc-vmstat.nr_anon=
_pages
     28617 =C2=B1  5%     +27.4%      36466 =C2=B1  3%  sched_debug.cpu#107=
.sched_count
   1748635 =C2=B1  5%     -17.0%    1450658 =C2=B1  2%  proc-vmstat.nr_acti=
ve_anon
      5788 =C2=B1  7%     +25.9%       7288 =C2=B1  7%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
      4379 =C2=B1  8%     -19.7%       3516 =C2=B1 14%  sched_debug.cpu#102=
.curr->pid
   1150238 =C2=B1 16%     -25.0%     862204 =C2=B1  7%  sched_debug.cpu#47.=
max_idle_balance_cost
     27806 =C2=B1  4%     +26.9%      35276 =C2=B1  1%  sched_debug.cpu#24.=
nr_switches
     34173 =C2=B1  3%     +23.9%      42352 =C2=B1  5%  sched_debug.cpu#15.=
sched_count
      4205 =C2=B1  3%     -17.4%       3472 =C2=B1  6%  sched_debug.cpu#27.=
curr->pid
     28487 =C2=B1  3%     +21.2%      34517 =C2=B1  2%  sched_debug.cpu#80.=
sched_count
     25689 =C2=B1  4%     +27.7%      32794 =C2=B1  2%  sched_debug.cpu#81.=
nr_switches
      5740 =C2=B1  5%     +28.5%       7374 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
   5963200 =C2=B1  6%     -16.2%    4997164 =C2=B1  2%  meminfo.AnonPages
      5561 =C2=B1  7%     +27.5%       7093 =C2=B1  4%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
     31633 =C2=B1  5%     +23.5%      39068 =C2=B1  0%  sched_debug.cpu#54.=
sched_count
       294 =C2=B1  8%     +21.5%        357 =C2=B1  3%  sched_debug.cpu#63.=
sched_goidle
     29726 =C2=B1  7%     +25.5%      37296 =C2=B1  9%  sched_debug.cpu#6.n=
r_switches
     29596 =C2=B1  6%     +17.3%      34726 =C2=B1  4%  sched_debug.cpu#109=
.nr_switches
   2054994 =C2=B1 17%     -29.8%    1442181 =C2=B1  8%  sched_debug.cpu#52.=
avg_idle
     26878 =C2=B1  2%     +24.0%      33339 =C2=B1  3%  sched_debug.cpu#114=
.nr_switches
      5744 =C2=B1  5%     +27.0%       7297 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
        49 =C2=B1  9%     -30.4%         34 =C2=B1 34%  sched_debug.cfs_rq[=
34]:/.blocked_load_avg
   1187754 =C2=B1 14%     -24.8%     893289 =C2=B1 18%  sched_debug.cpu#58.=
max_idle_balance_cost
     28510 =C2=B1  6%     +34.4%      38332 =C2=B1 13%  sched_debug.cpu#62.=
sched_count
     27321 =C2=B1  5%     +26.7%      34618 =C2=B1  2%  sched_debug.cpu#79.=
nr_switches
     26879 =C2=B1  3%     +21.8%      32748 =C2=B1  3%  sched_debug.cpu#117=
.nr_switches
   1164295 =C2=B1 13%     -21.5%     913984 =C2=B1  3%  sched_debug.cpu#80.=
max_idle_balance_cost
     40.77 =C2=B1  2%     -18.1%      33.39 =C2=B1  3%  perf-profile.cpu-cy=
cles.page_fault
      5708 =C2=B1  5%     +26.0%       7192 =C2=B1  2%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
   1141082 =C2=B1  5%     -17.9%     936291 =C2=B1  4%  sched_debug.cpu#79.=
max_idle_balance_cost
     27855 =C2=B1  5%     +24.0%      34552 =C2=B1  2%  sched_debug.cpu#107=
.nr_switches
   1975985 =C2=B1 10%     -16.7%    1646645 =C2=B1  4%  sched_debug.cpu#54.=
avg_idle
     32906 =C2=B1  5%     +20.0%      39487 =C2=B1  2%  sched_debug.cpu#35.=
sched_count
   1237982 =C2=B1 39%     -36.6%     785127 =C2=B1  2%  sched_debug.cpu#35.=
max_idle_balance_cost
      9897 =C2=B1  9%     -28.2%       7109 =C2=B1 14%  meminfo.AnonHugePag=
es
   1037987 =C2=B1  8%     -20.1%     829268 =C2=B1  6%  sched_debug.cpu#34.=
max_idle_balance_cost
     27597 =C2=B1  6%     +30.6%      36047 =C2=B1 10%  sched_debug.cpu#62.=
nr_switches
      5616 =C2=B1 14%     +27.3%       7151 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     27484 =C2=B1  3%     +28.2%      35245 =C2=B1  6%  sched_debug.cpu#88.=
nr_switches
       233 =C2=B1  4%     +26.7%        295 =C2=B1 10%  sched_debug.cpu#98.=
sched_goidle
     31608 =C2=B1  4%     +18.1%      37335 =C2=B1  4%  sched_debug.cpu#5.n=
r_switches
     34639 =C2=B1  7%     +25.8%      43586 =C2=B1  7%  sched_debug.cpu#33.=
sched_count
    152174 =C2=B1  4%     -14.6%     129947 =C2=B1  3%  proc-vmstat.nr_page=
_table_pages
      3903 =C2=B1  5%     +14.3%       4462 =C2=B1  4%  sched_debug.cpu#96.=
curr->pid
      5842 =C2=B1 14%     +25.3%       7322 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
   2063762 =C2=B1  8%     -15.0%    1754321 =C2=B1  3%  sched_debug.cpu#80.=
avg_idle
     11014 =C2=B1  6%     +57.7%      17371 =C2=B1 38%  sched_debug.cpu#46.=
ttwu_count
     28538 =C2=B1  5%     +18.2%      33729 =C2=B1  2%  sched_debug.cpu#75.=
nr_switches
   1673095 =C2=B1 12%     -18.6%    1361234 =C2=B1  7%  numa-meminfo.node3.=
Active(anon)
         4 =C2=B1 10%     +35.7%          6 =C2=B1  7%  sched_debug.cpu#60.=
cpu_load[2]
         5 =C2=B1  0%     +33.3%          6 =C2=B1 14%  sched_debug.cfs_rq[=
60]:/.runnable_load_avg
         5 =C2=B1  0%     +26.7%          6 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[1]
         4 =C2=B1 10%     +42.9%          6 =C2=B1 14%  sched_debug.cpu#60.=
cpu_load[1]
         5 =C2=B1  0%     +33.3%          6 =C2=B1 14%  sched_debug.cpu#60.=
cpu_load[0]
         5 =C2=B1  0%     +26.7%          6 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[2]
         5 =C2=B1  0%     +26.7%          6 =C2=B1  7%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
        12 =C2=B1 13%     -28.9%          9 =C2=B1 15%  sched_debug.cpu#61.=
cpu_load[1]
         5 =C2=B1  0%     +26.7%          6 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[0]
   3709346 =C2=B1 45%     +59.4%    5911105 =C2=B1  6%  sched_debug.cfs_rq[=
45]:/.MIN_vruntime
   3709346 =C2=B1 45%     +59.4%    5911105 =C2=B1  6%  sched_debug.cfs_rq[=
45]:/.max_vruntime
      5866 =C2=B1 12%     +30.1%       7632 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     31023 =C2=B1  6%     +26.6%      39279 =C2=B1  4%  sched_debug.cpu#104=
.sched_count
   1694696 =C2=B1 12%     -18.3%    1383800 =C2=B1  7%  numa-meminfo.node3.=
Active
   1890513 =C2=B1 18%     -26.5%    1389035 =C2=B1  3%  sched_debug.cpu#118=
.avg_idle
   1662229 =C2=B1  6%     -17.2%    1375913 =C2=B1  8%  numa-meminfo.node0.=
Active(anon)
      1712 =C2=B1 11%     -20.5%       1362 =C2=B1 11%  sched_debug.cpu#17.=
sched_goidle
   1683702 =C2=B1  6%     -17.0%    1397865 =C2=B1  8%  numa-meminfo.node0.=
Active
      5919 =C2=B1 13%     +31.5%       7783 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
       263 =C2=B1  6%     +35.1%        355 =C2=B1 22%  sched_debug.cpu#94.=
sched_goidle
     43073 =C2=B1  8%      +6.7%      45939 =C2=B1  7%  numa-vmstat.node1.n=
uma_other
     28033 =C2=B1  2%     +24.1%      34785 =C2=B1  6%  sched_debug.cpu#83.=
nr_switches
     30484 =C2=B1  6%     +28.7%      39244 =C2=B1  6%  sched_debug.cpu#4.n=
r_switches
      5864 =C2=B1 13%     +23.7%       7254 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
       562 =C2=B1 18%     +60.8%        904 =C2=B1 32%  sched_debug.cpu#35.=
sched_goidle
     37321 =C2=B1 12%     +40.5%      52452 =C2=B1 21%  cpuidle.C1-IVT-4S.u=
sage
    609130 =C2=B1  4%     -14.4%     521666 =C2=B1  3%  meminfo.PageTables
    420531 =C2=B1  4%     -17.5%     346979 =C2=B1  6%  numa-vmstat.node0.n=
r_active_anon
     38.09 =C2=B1  4%     -15.4%      32.21 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_page_fault.page_fault
     10851 =C2=B1 30%     +33.1%      14438 =C2=B1  3%  sched_debug.cpu#10.=
ttwu_count
      3593 =C2=B1  1%     -12.5%       3145 =C2=B1  2%  vmstat.procs.r
       538 =C2=B1 15%     +40.8%        758 =C2=B1 28%  sched_debug.cpu#59.=
sched_goidle
         8 =C2=B1 17%     -25.0%          6 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.runnable_load_avg
         5 =C2=B1 17%     +93.8%         10 =C2=B1 45%  sched_debug.cpu#63.=
cpu_load[3]
      4324 =C2=B1  0%     -10.5%       3871 =C2=B1  6%  sched_debug.cpu#117=
.curr->pid
   1393435 =C2=B1  3%     -12.6%    1218408 =C2=B1  6%  numa-meminfo.node2.=
AnonPages
     28446 =C2=B1  1%     +22.2%      34748 =C2=B1  6%  sched_debug.cpu#84.=
sched_count
   2296766 =C2=B1 21%     -28.3%    1646601 =C2=B1  7%  sched_debug.cpu#86.=
avg_idle
 5.487e+11 =C2=B1  6%     -10.0%  4.939e+11 =C2=B1  2%  meminfo.Committed_AS
      2767 =C2=B1  4%     +12.0%       3100 =C2=B1  1%  vmstat.procs.b
      5951 =C2=B1 14%     +22.5%       7288 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      3738 =C2=B1 13%     -21.0%       2953 =C2=B1 10%  cpuidle.C3-IVT-4S.u=
sage
     33409 =C2=B1  8%     +15.7%      38662 =C2=B1  7%  sched_debug.cpu#21.=
sched_count
      1300 =C2=B1  6%     +18.2%       1536 =C2=B1  5%  slabinfo.RAW.active=
_objs
      1300 =C2=B1  6%     +18.2%       1536 =C2=B1  5%  slabinfo.RAW.num_ob=
js
       243 =C2=B1  7%     +23.9%        301 =C2=B1 16%  sched_debug.cpu#112=
.sched_goidle
    367782 =C2=B1  7%     -14.5%     314602 =C2=B1  8%  numa-vmstat.node0.n=
r_anon_pages
    996148 =C2=B1  3%     -13.5%     861912 =C2=B1  0%  softirqs.RCU
      5888 =C2=B1 12%     +27.8%       7527 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
     37.34 =C2=B1  4%     -14.2%      32.02 =C2=B1  3%  perf-profile.cpu-cy=
cles.__do_page_fault.do_page_fault.page_fault
     30518 =C2=B1  8%     +21.5%      37079 =C2=B1  4%  sched_debug.cpu#25.=
sched_count
        41 =C2=B1  0%     +15.4%         47 =C2=B1  2%  turbostat.PkgTmp
        41 =C2=B1  1%     +15.3%         47 =C2=B1  1%  turbostat.CoreTmp
      5548 =C2=B1  4%     -11.9%       4888 =C2=B1  9%  sched_debug.cpu#82.=
ttwu_local
   1251765 =C2=B1 22%     -30.6%     868819 =C2=B1  9%  sched_debug.cpu#86.=
max_idle_balance_cost
    819484 =C2=B1  3%     -16.4%     684803 =C2=B1  7%  sched_debug.cpu#73.=
max_idle_balance_cost
      3450 =C2=B1  3%     +14.8%       3961 =C2=B1  1%  proc-vmstat.nr_inac=
tive_anon
   1935049 =C2=B1 21%     -21.5%    1519199 =C2=B1  7%  sched_debug.cpu#47.=
avg_idle
      3297 =C2=B1 11%     +15.9%       3823 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_reclaimable
     13193 =C2=B1 11%     +15.9%      15291 =C2=B1  4%  numa-meminfo.node1.=
SReclaimable
     27183 =C2=B1  4%     +22.7%      33360 =C2=B1  6%  sched_debug.cpu#84.=
nr_switches
     13791 =C2=B1  3%     +15.2%      15884 =C2=B1  2%  meminfo.Inactive(an=
on)
   2041793 =C2=B1 34%     -31.0%    1409086 =C2=B1  6%  sched_debug.cpu#35.=
avg_idle
   2539329 =C2=B1  4%     -12.1%    2232032 =C2=B1  5%  numa-meminfo.node0.=
MemUsed
       852 =C2=B1  3%      +9.5%        934 =C2=B1  1%  sched_debug.cfs_rq[=
95]:/.tg_runnable_contrib
     39475 =C2=B1  4%      +9.4%      43179 =C2=B1  1%  sched_debug.cfs_rq[=
95]:/.avg->runnable_avg_sum
      3925 =C2=B1  4%     +11.1%       4360 =C2=B1  2%  sched_debug.cpu#23.=
curr->pid
      4010 =C2=B1  3%     +13.6%       4556 =C2=B1  2%  sched_debug.cpu#104=
.curr->pid
   1967501 =C2=B1 22%     -24.0%    1495374 =C2=B1 12%  sched_debug.cpu#69.=
avg_idle
      4197 =C2=B1  7%     +12.0%       4699 =C2=B1  2%  sched_debug.cpu#3.c=
urr->pid
     33469 =C2=B1 12%     +15.9%      38807 =C2=B1  2%  sched_debug.cpu#34.=
sched_count
   1570094 =C2=B1  0%     -14.8%    1337145 =C2=B1  8%  sched_debug.cpu#73.=
avg_idle
     21481 =C2=B1  2%     +10.0%      23631 =C2=B1  6%  proc-vmstat.numa_ot=
her
   1641150 =C2=B1  5%     -10.5%    1468708 =C2=B1  5%  sched_debug.cpu#109=
.avg_idle
       673 =C2=B1 27%     +44.9%        975 =C2=B1 21%  sched_debug.cpu#50.=
sched_goidle
       272 =C2=B1  0%     +11.7%        304 =C2=B1  0%  turbostat.PKG_%
      4888 =C2=B1  4%     -11.9%       4306 =C2=B1  1%  sched_debug.cpu#6.c=
urr->pid
   1161012 =C2=B1  9%     -19.0%     940822 =C2=B1 12%  sched_debug.cpu#48.=
max_idle_balance_cost
     38580 =C2=B1  3%     +11.1%      42867 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.avg->runnable_avg_sum
       834 =C2=B1  4%     +10.8%        924 =C2=B1  0%  sched_debug.cfs_rq[=
99]:/.tg_runnable_contrib
     37872 =C2=B1  0%     +12.2%      42512 =C2=B1  1%  sched_debug.cfs_rq[=
97]:/.avg->runnable_avg_sum
     35710 =C2=B1  6%     +20.3%      42961 =C2=B1  8%  sched_debug.cpu#32.=
sched_count
     35.36 =C2=B1  5%     -11.2%      31.41 =C2=B1  3%  perf-profile.cpu-cy=
cles.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
       820 =C2=B1  1%     +12.0%        918 =C2=B1  1%  sched_debug.cfs_rq[=
97]:/.tg_runnable_contrib
      4444 =C2=B1  5%     -13.4%       3851 =C2=B1  4%  sched_debug.cpu#63.=
curr->pid
     10844 =C2=B1  0%      -9.1%       9852 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
     79342 =C2=B1  1%     +10.6%      87737 =C2=B1  0%  numa-meminfo.node2.=
Inactive
       446 =C2=B1  1%    +108.9%        932 =C2=B1  0%  turbostat.CorWatt
       461 =C2=B1  1%    +105.4%        947 =C2=B1  0%  turbostat.PkgWatt
    180657 =C2=B1  0%     -27.7%     130525 =C2=B1  1%  vmstat.system.in
     31683 =C2=B1  0%     -25.5%      23619 =C2=B1  2%  vmstat.system.cs
      1126 =C2=B1  0%      +8.4%       1221 =C2=B1  0%  turbostat.Avg_MHz
     93.66 =C2=B1  0%      +1.0%      94.64 =C2=B1  0%  turbostat.%Busy

brickland1: Brickland Ivy Bridge-EX
Memory: 128G

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


--===============1228551231824948778==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBhaW03CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAKICBt
ZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRl
bmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6
IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDog
CiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0X3dhdGNo
ZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9y
bWFuY2UKY29tbWl0OiA0MTM0ZjI0OWExNGRjZDFkYzA1ZGJhYzg2NDljYWRiMWQzYTZlNjVhCm1v
ZGVsOiBCcmlja2xhbmQgSXZ5IEJyaWRnZS1FWApucl9jcHU6IDEyMAptZW1vcnk6IDEyOEcKaGRk
X3BhcnRpdGlvbnM6ICIvZGV2L3NkYTIiCnN3YXBfcGFydGl0aW9uczogCmFpbTc6CiAgbG9hZDog
NjAwMAogIHRlc3Q6IHBhZ2VfdGVzdAp0ZXN0Ym94OiBicmlja2xhbmQxCnRib3hfZ3JvdXA6IGJy
aWNrbGFuZDEKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTAyLTEzIDA2
OjA4OjI0LjQxMzAyMDg1OCArMDg6MDAKaGVhZF9jb21taXQ6IDQxMzRmMjQ5YTE0ZGNkMWRjMDVk
YmFjODY0OWNhZGIxZDNhNmU2NWEKYmFzZV9jb21taXQ6IGJmYTc2ZDQ5NTc2NTk5YTRiOWY5Yjdh
NzFmMjNkNzNkNmRjZmY3MzUKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTAy
MTYxNAprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsLzQxMzRmMjQ5YTE0ZGNkMWRjMDVkYmFj
ODY0OWNhZGIxZDNhNmU2NWEvdm1saW51ei0zLjE5LjAtd2wtYXRoLTA2MTk5LWc0MTM0ZjI0Igp1
c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5j
Z3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2JyaWNrbGFuZDEvYWltNy9wZXJmb3JtYW5jZS02MDAw
LXBhZ2VfdGVzdC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsLzQxMzRm
MjQ5YTE0ZGNkMWRjMDVkYmFjODY0OWNhZGIxZDNhNmU2NWEvMCIKam9iX2ZpbGU6ICIvbGtwL3Nj
aGVkdWxlZC9icmlja2xhbmQxL2N5Y2xpY19haW03LXBlcmZvcm1hbmNlLTYwMDAtcGFnZV90ZXN0
LXg4Nl82NC1yaGVsLUhFQUQtNDEzNGYyNDlhMTRkY2QxZGMwNWRiYWM4NjQ5Y2FkYjFkM2E2ZTY1
YS0wLTIwMTUwMjEzLTEwMTY4Ni0xd2l6amhlLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wMi0x
NiAxNjoyMDoyNS45NDk0OTE4NTAgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2Zzog
MzE3NS41MyAzNzM2LjIyIDE5MTYuMjUgMS85MzYgMTc2NjEKc3RhcnRfdGltZTogJzE0MjQwNzQ5
MDUnCmVuZF90aW1lOiAnMTQyNDA3NTMyNScKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTAy
MTYtMTIzNjA3Igo=

--===============1228551231824948778==--

