Content-Type: multipart/mixed; boundary="===============5415114887085602684=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] a15b12ac36a: -46.9% time.voluntary_context_switches +1.5% will-it-scale.per_process_ops
Date: Sun, 04 Jan 2015 08:39:34 +0800
Message-ID: <1420331974.8652.2.camel@intel.com>
In-Reply-To: <4750651419325033@web14h.yandex.ru>
List-Id: <oe-lkp.lists.linux.dev>

--===============5415114887085602684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Kirill,

Sorry for late.

On Tue, 2014-12-23 at 11:57 +0300, Kirill Tkhai wrote:
> Hi, Huang,
> =

> what do these digits mean? What test does?
> =

> 23.12.2014, 08:16, "Huang Ying" <ying.huang@intel.com>:
> > FYI, we noticed the below changes on
> >
> > commit a15b12ac36ad4e7b856a4ae54937ae26a51aebad ("sched: Do not stop cp=
u in set_cpus_allowed_ptr() if task is not running")
> >
> > testbox/testcase/testparams: lkp-g5/will-it-scale/performance-lock1
> >
> > 1ba93d42727c4400  a15b12ac36ad4e7b856a4ae549
> > ----------------  --------------------------

Above is the good commit and the bad commit.

> >          %stddev     %change         %stddev
> >              \          |                \
> >    1517261 =C2=B1  0%      +1.5%    1539994 =C2=B1  0%  will-it-scale.p=
er_process_ops

We have basic description of data above, where %stddev is standard
deviation.

What's more do you want?

Best Regards,
Huang, Ying

> >        247 =C2=B1 30%    +131.8%        573 =C2=B1 49%  sched_debug.cpu=
#61.ttwu_count
> >        225 =C2=B1 22%    +142.8%        546 =C2=B1 34%  sched_debug.cpu=
#81.ttwu_local
> >      15115 =C2=B1 44%     +37.3%      20746 =C2=B1 40%  numa-meminfo.no=
de7.Active
> >       1028 =C2=B1 38%    +115.3%       2214 =C2=B1 36%  sched_debug.cpu=
#16.ttwu_local
> >          2 =C2=B1 19%    +133.3%          5 =C2=B1 43%  sched_debug.cpu=
#89.cpu_load[3]
> >         21 =C2=B1 45%     +88.2%         40 =C2=B1 23%  sched_debug.cfs=
_rq[99]:/.tg_load_contrib
> >        414 =C2=B1 33%     +98.6%        823 =C2=B1 28%  sched_debug.cpu=
#81.ttwu_count
> >          4 =C2=B1 10%     +88.2%          8 =C2=B1 12%  sched_debug.cfs=
_rq[33]:/.runnable_load_avg
> >         22 =C2=B1 26%     +80.9%         40 =C2=B1 24%  sched_debug.cfs=
_rq[103]:/.tg_load_contrib
> >          7 =C2=B1 17%     -41.4%          4 =C2=B1 25%  sched_debug.cfs=
_rq[41]:/.load
> >          7 =C2=B1 17%     -37.9%          4 =C2=B1 19%  sched_debug.cpu=
#41.load
> >          3 =C2=B1 22%    +106.7%          7 =C2=B1 10%  sched_debug.cfs=
_rq[36]:/.runnable_load_avg
> >        174 =C2=B1 13%     +48.7%        259 =C2=B1 31%  sched_debug.cpu=
#112.ttwu_count
> >          4 =C2=B1 19%     +88.9%          8 =C2=B1  5%  sched_debug.cfs=
_rq[35]:/.runnable_load_avg
> >        260 =C2=B1 10%     +55.6%        405 =C2=B1 26%  numa-vmstat.nod=
e3.nr_anon_pages
> >       1042 =C2=B1 10%     +56.0%       1626 =C2=B1 26%  numa-meminfo.no=
de3.AnonPages
> >         26 =C2=B1 22%     +74.3%         45 =C2=B1 16%  sched_debug.cfs=
_rq[65]:/.tg_load_contrib
> >         21 =C2=B1 43%     +71.3%         37 =C2=B1 26%  sched_debug.cfs=
_rq[100]:/.tg_load_contrib
> >       3686 =C2=B1 21%     +40.2%       5167 =C2=B1 19%  sched_debug.cpu=
#16.ttwu_count
> >        142 =C2=B1  9%     +34.4%        191 =C2=B1 24%  sched_debug.cpu=
#112.ttwu_local
> >          5 =C2=B1 18%     +69.6%          9 =C2=B1 15%  sched_debug.cfs=
_rq[35]:/.load
> >          2 =C2=B1 30%    +100.0%          5 =C2=B1 37%  sched_debug.cpu=
#106.cpu_load[1]
> >          3 =C2=B1 23%    +100.0%          6 =C2=B1 48%  sched_debug.cpu=
#106.cpu_load[2]
> >          5 =C2=B1 18%     +69.6%          9 =C2=B1 15%  sched_debug.cpu=
#35.load
> >          9 =C2=B1 20%     +48.6%         13 =C2=B1 16%  sched_debug.cfs=
_rq[7]:/.runnable_load_avg
> >       1727 =C2=B1 15%     +43.9%       2484 =C2=B1 30%  sched_debug.cpu=
#34.ttwu_local
> >         10 =C2=B1 17%     -40.5%          6 =C2=B1 13%  sched_debug.cpu=
#41.cpu_load[0]
> >         10 =C2=B1 14%     -29.3%          7 =C2=B1  5%  sched_debug.cpu=
#45.cpu_load[4]
> >         10 =C2=B1 17%     -33.3%          7 =C2=B1 10%  sched_debug.cpu=
#41.cpu_load[1]
> >       6121 =C2=B1  8%     +56.7%       9595 =C2=B1 30%  sched_debug.cpu=
#13.sched_goidle
> >         13 =C2=B1  8%     -25.9%         10 =C2=B1 17%  sched_debug.cpu=
#39.cpu_load[2]
> >         12 =C2=B1 16%     -24.0%          9 =C2=B1 15%  sched_debug.cpu=
#37.cpu_load[2]
> >        492 =C2=B1 17%     -21.3%        387 =C2=B1 24%  sched_debug.cpu=
#46.ttwu_count
> >       3761 =C2=B1 11%     -23.9%       2863 =C2=B1 15%  sched_debug.cpu=
#93.curr->pid
> >        570 =C2=B1 19%     +43.2%        816 =C2=B1 17%  sched_debug.cpu=
#86.ttwu_count
> >       5279 =C2=B1  8%     +63.5%       8631 =C2=B1 33%  sched_debug.cpu=
#13.ttwu_count
> >        377 =C2=B1 22%     -28.6%        269 =C2=B1 14%  sched_debug.cpu=
#46.ttwu_local
> >       5396 =C2=B1 10%     +29.9%       7007 =C2=B1 14%  sched_debug.cpu=
#16.sched_goidle
> >       1959 =C2=B1 12%     +36.9%       2683 =C2=B1 15%  numa-vmstat.nod=
e2.nr_slab_reclaimable
> >       7839 =C2=B1 12%     +37.0%      10736 =C2=B1 15%  numa-meminfo.no=
de2.SReclaimable
> >          5 =C2=B1 15%     +66.7%          8 =C2=B1  9%  sched_debug.cfs=
_rq[33]:/.load
> >          5 =C2=B1 25%     +47.8%          8 =C2=B1 10%  sched_debug.cfs=
_rq[37]:/.load
> >          2 =C2=B1  0%     +87.5%          3 =C2=B1 34%  sched_debug.cpu=
#89.cpu_load[4]
> >          5 =C2=B1 15%     +66.7%          8 =C2=B1  9%  sched_debug.cpu=
#33.load
> >          6 =C2=B1 23%     +41.7%          8 =C2=B1 10%  sched_debug.cpu=
#37.load
> >          8 =C2=B1 10%     -26.5%          6 =C2=B1  6%  sched_debug.cpu=
#51.cpu_load[1]
> >       7300 =C2=B1 37%     +63.6%      11943 =C2=B1 16%  softirqs.TASKLET
> >       2984 =C2=B1  6%     +43.1%       4271 =C2=B1 23%  sched_debug.cpu=
#20.ttwu_count
> >        328 =C2=B1  4%     +40.5%        462 =C2=B1 25%  sched_debug.cpu=
#26.ttwu_local
> >         10 =C2=B1  7%     -27.5%          7 =C2=B1  5%  sched_debug.cpu=
#43.cpu_load[3]
> >          9 =C2=B1  8%     -30.8%          6 =C2=B1  6%  sched_debug.cpu=
#41.cpu_load[3]
> >          9 =C2=B1  8%     -27.0%          6 =C2=B1  6%  sched_debug.cpu=
#41.cpu_load[4]
> >         10 =C2=B1 14%     -32.5%          6 =C2=B1  6%  sched_debug.cpu=
#41.cpu_load[2]
> >      16292 =C2=B1  6%     +42.8%      23260 =C2=B1 25%  sched_debug.cpu=
#13.nr_switches
> >         14 =C2=B1 28%     +55.9%         23 =C2=B1  8%  sched_debug.cpu=
#99.cpu_load[0]
> >          5 =C2=B1  8%     +28.6%          6 =C2=B1 12%  sched_debug.cpu=
#17.load
> >         13 =C2=B1  7%     -23.1%         10 =C2=B1 12%  sched_debug.cpu=
#39.cpu_load[3]
> >          7 =C2=B1 10%     -35.7%          4 =C2=B1 11%  sched_debug.cfs=
_rq[45]:/.runnable_load_avg
> >       5076 =C2=B1 13%     -21.8%       3970 =C2=B1 11%  numa-vmstat.nod=
e0.nr_slab_unreclaimable
> >      20306 =C2=B1 13%     -21.8%      15886 =C2=B1 11%  numa-meminfo.no=
de0.SUnreclaim
> >         10 =C2=B1 10%     -28.6%          7 =C2=B1  6%  sched_debug.cpu=
#45.cpu_load[3]
> >         11 =C2=B1 11%     -29.5%          7 =C2=B1 14%  sched_debug.cpu=
#45.cpu_load[1]
> >         10 =C2=B1 12%     -26.8%          7 =C2=B1  6%  sched_debug.cpu=
#44.cpu_load[1]
> >         10 =C2=B1 10%     -28.6%          7 =C2=B1  6%  sched_debug.cpu=
#44.cpu_load[0]
> >          7 =C2=B1 17%     +48.3%         10 =C2=B1  7%  sched_debug.cfs=
_rq[11]:/.runnable_load_avg
> >         11 =C2=B1 12%     -34.1%          7 =C2=B1 11%  sched_debug.cpu=
#47.cpu_load[0]
> >         10 =C2=B1 10%     -27.9%          7 =C2=B1  5%  sched_debug.cpu=
#47.cpu_load[1]
> >         10 =C2=B1  8%     -26.8%          7 =C2=B1 11%  sched_debug.cpu=
#47.cpu_load[2]
> >         10 =C2=B1  8%     -28.6%          7 =C2=B1 14%  sched_debug.cpu=
#43.cpu_load[0]
> >         10 =C2=B1 10%     -27.9%          7 =C2=B1 10%  sched_debug.cpu=
#43.cpu_load[1]
> >         10 =C2=B1 10%     -28.6%          7 =C2=B1  6%  sched_debug.cpu=
#43.cpu_load[2]
> >      12940 =C2=B1  3%     +49.8%      19387 =C2=B1 35%  numa-meminfo.no=
de2.Active(anon)
> >       3235 =C2=B1  2%     +49.8%       4844 =C2=B1 35%  numa-vmstat.nod=
e2.nr_active_anon
> >         17 =C2=B1 17%     +36.6%         24 =C2=B1  9%  sched_debug.cpu=
#97.cpu_load[2]
> >      14725 =C2=B1  8%     +21.8%      17928 =C2=B1 11%  sched_debug.cpu=
#16.nr_switches
> >        667 =C2=B1 10%     +45.3%        969 =C2=B1 22%  sched_debug.cpu=
#17.ttwu_local
> >       3257 =C2=B1  5%     +22.4%       3988 =C2=B1 11%  sched_debug.cpu=
#118.curr->pid
> >       3144 =C2=B1 15%     -20.7%       2493 =C2=B1  8%  sched_debug.cpu=
#95.curr->pid
> >       2192 =C2=B1 11%     +50.9%       3308 =C2=B1 37%  sched_debug.cpu=
#18.ttwu_count
> >          6 =C2=B1 11%     +37.5%          8 =C2=B1 19%  sched_debug.cfs=
_rq[22]:/.load
> >         12 =C2=B1  5%     +27.1%         15 =C2=B1  8%  sched_debug.cpu=
#5.cpu_load[1]
> >         11 =C2=B1 12%     -23.4%          9 =C2=B1 13%  sched_debug.cpu=
#37.cpu_load[3]
> >          6 =C2=B1 11%     +37.5%          8 =C2=B1 19%  sched_debug.cpu=
#22.load
> >          8 =C2=B1  8%     -25.0%          6 =C2=B1  0%  sched_debug.cpu=
#51.cpu_load[2]
> >          7 =C2=B1  6%     -20.0%          6 =C2=B1 11%  sched_debug.cpu=
#55.cpu_load[3]
> >         11 =C2=B1  9%     -17.4%          9 =C2=B1  9%  sched_debug.cpu=
#39.cpu_load[4]
> >         12 =C2=B1  5%     -22.9%          9 =C2=B1 11%  sched_debug.cpu=
#38.cpu_load[3]
> >        420 =C2=B1 13%     +43.0%        601 =C2=B1  9%  sched_debug.cpu=
#30.ttwu_local
> >       1682 =C2=B1 14%     +38.5%       2329 =C2=B1 17%  numa-meminfo.no=
de7.AnonPages
> >        423 =C2=B1 13%     +37.0%        579 =C2=B1 16%  numa-vmstat.nod=
e7.nr_anon_pages
> >         15 =C2=B1 13%     +41.9%         22 =C2=B1  5%  sched_debug.cpu=
#99.cpu_load[1]
> >          6 =C2=B1 20%     +44.0%          9 =C2=B1 13%  sched_debug.cfs=
_rq[19]:/.runnable_load_avg
> >          9 =C2=B1  4%     -24.3%          7 =C2=B1  0%  sched_debug.cpu=
#43.cpu_load[4]
> >       6341 =C2=B1  7%     -19.6%       5100 =C2=B1 16%  sched_debug.cpu=
#43.curr->pid
> >       2577 =C2=B1 11%     -11.9%       2270 =C2=B1 10%  sched_debug.cpu=
#33.ttwu_count
> >         13 =C2=B1  6%     -18.5%         11 =C2=B1 12%  sched_debug.cpu=
#40.cpu_load[2]
> >       4828 =C2=B1  6%     +23.8%       5979 =C2=B1  6%  sched_debug.cpu=
#34.curr->pid
> >       4351 =C2=B1 12%     +33.9%       5824 =C2=B1 12%  sched_debug.cpu=
#36.curr->pid
> >         10 =C2=B1  8%     -23.8%          8 =C2=B1  8%  sched_debug.cpu=
#37.cpu_load[4]
> >         10 =C2=B1 14%     -28.6%          7 =C2=B1  6%  sched_debug.cpu=
#45.cpu_load[2]
> >         17 =C2=B1 22%     +40.6%         24 =C2=B1  7%  sched_debug.cpu=
#97.cpu_load[1]
> >         11 =C2=B1  9%     +21.3%         14 =C2=B1  5%  sched_debug.cpu=
#7.cpu_load[2]
> >         10 =C2=B1  8%     -26.2%          7 =C2=B1 10%  sched_debug.cpu=
#36.cpu_load[4]
> >      12853 =C2=B1  2%     +20.0%      15429 =C2=B1 11%  numa-meminfo.no=
de2.AnonPages
> >       4744 =C2=B1  8%     +30.8%       6204 =C2=B1 11%  sched_debug.cpu=
#35.curr->pid
> >       3214 =C2=B1  2%     +20.0%       3856 =C2=B1 11%  numa-vmstat.nod=
e2.nr_anon_pages
> >       6181 =C2=B1  6%     +24.9%       7718 =C2=B1  9%  sched_debug.cpu=
#13.curr->pid
> >       6675 =C2=B1 23%     +27.5%       8510 =C2=B1 10%  sched_debug.cfs=
_rq[91]:/.tg_load_avg
> >     171261 =C2=B1  5%     -22.2%     133177 =C2=B1 15%  numa-numastat.n=
ode0.local_node
> >       6589 =C2=B1 21%     +29.3%       8522 =C2=B1 11%  sched_debug.cfs=
_rq[89]:/.tg_load_avg
> >       6508 =C2=B1 20%     +28.0%       8331 =C2=B1  8%  sched_debug.cfs=
_rq[88]:/.tg_load_avg
> >       6598 =C2=B1 22%     +29.2%       8525 =C2=B1 11%  sched_debug.cfs=
_rq[90]:/.tg_load_avg
> >        590 =C2=B1 13%     -21.4%        464 =C2=B1  7%  sched_debug.cpu=
#105.ttwu_local
> >     175392 =C2=B1  5%     -21.7%     137308 =C2=B1 14%  numa-numastat.n=
ode0.numa_hit
> >         11 =C2=B1  6%     -18.2%          9 =C2=B1  7%  sched_debug.cpu=
#38.cpu_load[4]
> >       6643 =C2=B1 23%     +27.4%       8465 =C2=B1 10%  sched_debug.cfs=
_rq[94]:/.tg_load_avg
> >       6764 =C2=B1  7%     +13.8%       7695 =C2=B1  7%  sched_debug.cpu=
#12.curr->pid
> >         29 =C2=B1 28%     +34.5%         39 =C2=B1  5%  sched_debug.cfs=
_rq[98]:/.tg_load_contrib
> >       1776 =C2=B1  7%     +29.4%       2298 =C2=B1 13%  sched_debug.cpu=
#11.ttwu_local
> >         13 =C2=B1  0%     -19.2%         10 =C2=B1  8%  sched_debug.cpu=
#40.cpu_load[3]
> >          7 =C2=B1  5%     -17.2%          6 =C2=B1  0%  sched_debug.cpu=
#51.cpu_load[3]
> >       7371 =C2=B1 20%     -18.0%       6045 =C2=B1  3%  sched_debug.cpu=
#1.sched_goidle
> >      26560 =C2=B1  2%     +14.0%      30287 =C2=B1  7%  numa-meminfo.no=
de2.Slab
> >      16161 =C2=B1  6%      -9.4%      14646 =C2=B1  1%  sched_debug.cfs=
_rq[27]:/.avg->runnable_avg_sum
> >        351 =C2=B1  6%      -9.3%        318 =C2=B1  1%  sched_debug.cfs=
_rq[27]:/.tg_runnable_contrib
> >       7753 =C2=B1 27%     -22.9%       5976 =C2=B1  5%  sched_debug.cpu=
#2.sched_goidle
> >       3828 =C2=B1  9%     +17.3%       4490 =C2=B1  6%  sched_debug.cpu=
#23.sched_goidle
> >      23925 =C2=B1  2%     +23.0%      29419 =C2=B1 23%  numa-meminfo.no=
de2.Active
> >         47 =C2=B1  6%     -15.8%         40 =C2=B1 19%  sched_debug.cpu=
#42.cpu_load[1]
> >        282 =C2=B1  5%      -9.7%        254 =C2=B1  7%  sched_debug.cfs=
_rq[109]:/.tg_runnable_contrib
> >        349 =C2=B1  5%      -9.3%        317 =C2=B1  1%  sched_debug.cfs=
_rq[26]:/.tg_runnable_contrib
> >       6941 =C2=B1  3%      +8.9%       7558 =C2=B1  7%  sched_debug.cpu=
#61.nr_switches
> >      16051 =C2=B1  5%      -8.9%      14618 =C2=B1  1%  sched_debug.cfs=
_rq[26]:/.avg->runnable_avg_sum
> >     238944 =C2=B1  3%      +9.2%     260958 =C2=B1  5%  numa-vmstat.nod=
e2.numa_local
> >      12966 =C2=B1  5%      -9.5%      11732 =C2=B1  6%  sched_debug.cfs=
_rq[109]:/.avg->runnable_avg_sum
> >       1004 =C2=B1  3%      +8.2%       1086 =C2=B1  4%  sched_debug.cpu=
#118.sched_goidle
> >      20746 =C2=B1  4%      -8.4%      19000 =C2=B1  1%  sched_debug.cfs=
_rq[45]:/.avg->runnable_avg_sum
> >        451 =C2=B1  4%      -8.3%        413 =C2=B1  1%  sched_debug.cfs=
_rq[45]:/.tg_runnable_contrib
> >       3538 =C2=B1  4%     +17.2%       4147 =C2=B1  8%  sched_debug.cpu=
#26.ttwu_count
> >         16 =C2=B1  9%     +13.8%         18 =C2=B1  2%  sched_debug.cpu=
#99.cpu_load[3]
> >       1531 =C2=B1  0%     +11.3%       1704 =C2=B1  1%  numa-meminfo.no=
de7.KernelStack
> >       3569 =C2=B1  3%     +17.2%       4182 =C2=B1 10%  sched_debug.cpu=
#24.sched_goidle
> >       1820 =C2=B1  3%     -12.5%       1594 =C2=B1  8%  slabinfo.taskst=
ats.num_objs
> >       1819 =C2=B1  3%     -12.4%       1594 =C2=B1  8%  slabinfo.taskst=
ats.active_objs
> >       4006 =C2=B1  5%     +19.1%       4769 =C2=B1  8%  sched_debug.cpu=
#17.sched_goidle
> >      21412 =C2=B1 19%     -17.0%      17779 =C2=B1  3%  sched_debug.cpu=
#2.nr_switches
> >         16 =C2=B1  9%     +24.2%         20 =C2=B1  4%  sched_debug.cpu=
#99.cpu_load[2]
> >      10493 =C2=B1  7%     +13.3%      11890 =C2=B1  4%  sched_debug.cpu=
#23.nr_switches
> >       1207 =C2=B1  2%     -46.9%        640 =C2=B1  4%  time.voluntary_=
context_switches
> >
> >                           time.voluntary_context_switches
> >
> >   1300 ++-----------*--*--------------------*--------------------------=
-----+
> >        *..*.*..*.. +      *.*..*..*.*..*..*     .*..*..*.  .*..*.*..*..=
     |
> >   1200 ++         *                            *         *.            =
*.*..*
> >   1100 ++                                                              =
     |
> >        |                                                               =
     |
> >   1000 ++                                                              =
     |
> >        |                                                               =
     |
> >    900 ++                                                              =
     |
> >        |                                                               =
     |
> >    800 ++                                                              =
     |
> >    700 ++                                                              =
     |
> >        O    O     O       O O  O       O  O O  O O       O       O     =
     |
> >    600 ++ O    O    O  O          O O                  O    O  O       =
     |
> >        |                                            O                  =
     |
> >    500 ++--------------------------------------------------------------=
-----+
> >
> >         [*] bisect-good sample
> >         [O] bisect-bad  sample
> >
> > To reproduce:
> >
> >         apt-get install ruby ruby-oj
> >         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp=
-tests.git
> >         cd lkp-tests
> >         bin/setup-local job.yaml # the job file attached in this email
> >         bin/run-local   job.yaml
> >
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> >
> =

> Regards,
> Kirill



--===============5415114887085602684==--

