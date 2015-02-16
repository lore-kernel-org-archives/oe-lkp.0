Content-Type: multipart/mixed; boundary="===============0046311995565961003=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] 10359213d05: -3.1% pigz.time.minor_page_faults, +31.3% meminfo.AnonHugePages, +1.7% will-it-scale.per_thread_ops
Date: Mon, 16 Feb 2015 13:11:28 +0800
Message-ID: <1424063488.5538.45.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0046311995565961003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 10359213d05acf804558bda7cc9b8422a828d1cd ("mm: incorporate read-only=
 pages into transparent huge pages")


testbox/testcase/testparams: xps2/pigz/performance-100%-512K

ba4877b9ca51f80b  10359213d05acf804558bda7cc  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

         %stddev     %change         %stddev
             \          |                \  =

     25068 =C2=B1  3%      +8.1%      27104 =C2=B1  3%  pigz.time.maximum_r=
esident_set_size
     27037 =C2=B1  0%      -3.1%      26197 =C2=B1  1%  pigz.time.minor_pag=
e_faults
     12558 =C2=B1  2%     +31.3%      16493 =C2=B1  3%  meminfo.AnonHugePag=
es
      0.92 =C2=B1 30%     -45.1%       0.51 =C2=B1 25%  perf-profile.cpu-cy=
cles.update_curr.task_tick_fair.scheduler_tick.update_process_times.tick_sc=
hed_handle
      1.12 =C2=B1  3%     +42.1%       1.59 =C2=B1 15%  perf-profile.cpu-cy=
cles.ret_from_fork
      2.46 =C2=B1 21%     -29.4%       1.74 =C2=B1 18%  perf-profile.cpu-cy=
cles.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.pipe=
_write.new_sync_write
    595245 =C2=B1 11%     -26.6%     436928 =C2=B1 23%  sched_debug.cpu#3.a=
vg_idle
    602523 =C2=B1  9%     -25.1%     451132 =C2=B1 15%  sched_debug.cpu#5.a=
vg_idle
     16.26 =C2=B1  9%     -16.0%      13.66 =C2=B1  4%  perf-profile.cpu-cy=
cles.tick_program_event.hrtimer_interrupt.hpet_interrupt_handler.handle_irq=
_event_percpu.handle_irq_event
      0.81 =C2=B1 24%     +30.2%       1.05 =C2=B1  5%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
      1.68 =C2=B1  5%     -22.2%       1.30 =C2=B1 22%  perf-profile.cpu-cy=
cles.copy_page_from_iter_iovec.copy_page_from_iter.pipe_write.new_sync_writ=
e.vfs_write
       150 =C2=B1  2%     -11.8%        132 =C2=B1  8%  sched_debug.cfs_rq[=
3]:/.load
      7785 =C2=B1  6%     +11.4%       8675 =C2=B1  6%  slabinfo.kmalloc-64=
.active_objs
      1986 =C2=B1  3%     -12.4%       1739 =C2=B1  4%  slabinfo.kmalloc-25=
6.active_objs
      8048 =C2=B1  4%      +9.7%       8826 =C2=B1  5%  slabinfo.kmalloc-64=
.num_objs
       321 =C2=B1 28%     +61.6%        520 =C2=B1 28%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
       139 =C2=B1  3%     +14.0%        159 =C2=B1  7%  sched_debug.cpu#1.l=
oad
       121 =C2=B1  2%      +8.2%        131 =C2=B1  3%  sched_debug.cpu#0.c=
pu_load[4]
       122 =C2=B1  2%      +9.2%        134 =C2=B1  3%  sched_debug.cpu#0.c=
pu_load[3]
   1014549 =C2=B1  8%      -9.8%     914927 =C2=B1  4%  cpuidle.C1E-NHM.time
     25068 =C2=B1  3%      +8.1%      27104 =C2=B1  3%  time.maximum_reside=
nt_set_size
    143231 =C2=B1  9%     +11.4%     159600 =C2=B1  2%  softirqs.RCU
       150 =C2=B1  2%     -12.1%        132 =C2=B1  8%  sched_debug.cpu#3.l=
oad

testbox/testcase/testparams: lkp-sbx04/will-it-scale/performance-malloc1

ba4877b9ca51f80b  10359213d05acf804558bda7cc  =

----------------  --------------------------  =

   3954711 =C2=B1  4%     +11.8%    4420591 =C2=B1  8%  will-it-scale.time.=
voluntary_context_switches
   7468699 =C2=B1  1%      +3.4%    7722740 =C2=B1  1%  will-it-scale.time.=
minor_page_faults
      0.02 =C2=B1  0%      -3.7%       0.02 =C2=B1  0%  will-it-scale.scala=
bility
     37784 =C2=B1  0%      +1.7%      38421 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      0.00 =C2=B1  0%  +5.8e+12%   58403.14 =C2=B1 29%  sched_debug.cfs_rq[=
49]:/.MIN_vruntime
      0.00 =C2=B1  0%  +5.8e+12%   58403.14 =C2=B1 29%  sched_debug.cfs_rq[=
49]:/.max_vruntime
         5 =C2=B1 24%    +340.0%         22 =C2=B1 13%  sched_debug.cpu#59.=
cpu_load[1]
         4 =C2=B1 17%    +310.5%         19 =C2=B1 17%  sched_debug.cpu#59.=
cpu_load[0]
        34 =C2=B1 29%    +198.5%        101 =C2=B1 31%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
         5 =C2=B1 24%    +280.0%         19 =C2=B1 15%  sched_debug.cpu#59.=
cpu_load[2]
        19 =C2=B1 41%     -79.5%          4 =C2=B1 50%  sched_debug.cfs_rq[=
26]:/.load
        19 =C2=B1 41%     -79.5%          4 =C2=B1 50%  sched_debug.cpu#26.=
load
     33117 =C2=B1 39%    +159.0%      85783 =C2=B1 15%  sched_debug.cpu#4.s=
ched_goidle
         4 =C2=B1 19%    +211.1%         14 =C2=B1 14%  sched_debug.cpu#59.=
cpu_load[3]
     34216 =C2=B1 41%    +175.2%      94151 =C2=B1 18%  sched_debug.cpu#4.t=
twu_count
         7 =C2=B1 34%    +160.0%         19 =C2=B1 17%  sched_debug.cfs_rq[=
49]:/.load
       124 =C2=B1 21%     -78.8%         26 =C2=B1 43%  sched_debug.cfs_rq[=
48]:/.blocked_load_avg
     66389 =C2=B1 39%    +158.7%     171750 =C2=B1 15%  sched_debug.cpu#4.n=
r_switches
       135 =C2=B1 23%     -74.1%         35 =C2=B1 28%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
      0.00 =C2=B1  1%    +166.2%       0.00 =C2=B1 34%  sched_debug.rt_rq[6=
3]:/.rt_time
         5 =C2=B1 47%     -63.6%          2 =C2=B1  0%  sched_debug.cpu#11.=
cpu_load[2]
     67305 =C2=B1 38%    +155.4%     171876 =C2=B1 15%  sched_debug.cpu#4.s=
ched_count
        47 =C2=B1 40%     -68.3%         15 =C2=B1 20%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
        54 =C2=B1 20%    +149.8%        135 =C2=B1 44%  sched_debug.cfs_rq[=
45]:/.blocked_load_avg
      0.00 =C2=B1  7%     -15.3%       0.00 =C2=B1  4%  sched_debug.rt_rq[7=
]:/.rt_time
         5 =C2=B1 37%     -65.2%          2 =C2=B1  0%  sched_debug.cpu#3.c=
pu_load[1]
         1 =C2=B1 34%    +100.0%          2 =C2=B1 20%  sched_debug.cfs_rq[=
19]:/.nr_spread_over
       136 =C2=B1 42%     -62.3%         51 =C2=B1  8%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
        67 =C2=B1 16%    +124.6%        150 =C2=B1 41%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
        69 =C2=B1 36%    +126.1%        156 =C2=B1 21%  sched_debug.cfs_rq[=
61]:/.blocked_load_avg
         4 =C2=B1 10%    +135.3%         10 =C2=B1 10%  sched_debug.cpu#59.=
cpu_load[4]
         7 =C2=B1 14%     -74.2%          2 =C2=B1 50%  sched_debug.cpu#49.=
nr_uninterruptible
       877 =C2=B1 32%     +64.3%       1442 =C2=B1 30%  sched_debug.cpu#22.=
curr->pid
         7 =C2=B1 29%    +151.6%         19 =C2=B1 28%  sched_debug.cpu#50.=
load
         4 =C2=B1 22%     -57.9%          2 =C2=B1  0%  sched_debug.cpu#3.c=
pu_load[2]
    347606 =C2=B1 36%     -58.7%     143557 =C2=B1  1%  sched_debug.cfs_rq[=
16]:/.min_vruntime
      0.00 =C2=B1 39%     -47.9%       0.00 =C2=B1  0%  sched_debug.rt_rq[5=
5]:/.rt_time
      7757 =C2=B1 45%     -61.5%       2985 =C2=B1  5%  sched_debug.cfs_rq[=
16]:/.exec_clock
        15 =C2=B1 36%     -42.9%          9 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[0]
        77 =C2=B1 32%    +120.7%        170 =C2=B1 16%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
      8767 =C2=B1  9%     +70.0%      14901 =C2=B1 33%  sched_debug.cfs_rq[=
1]:/.exec_clock
       406 =C2=B1 36%     +35.5%        550 =C2=B1 29%  sched_debug.cpu#46.=
ttwu_local
     97714 =C2=B1 37%     +80.7%     176528 =C2=B1 19%  sched_debug.cpu#6.n=
r_switches
     98697 =C2=B1 36%     +79.0%     176658 =C2=B1 19%  sched_debug.cpu#6.s=
ched_count
        88 =C2=B1 14%     -60.0%         35 =C2=B1 23%  sched_debug.cfs_rq[=
62]:/.blocked_load_avg
      0.00 =C2=B1 36%     -48.5%       0.00 =C2=B1 10%  sched_debug.rt_rq[5=
4]:/.rt_time
         1 =C2=B1  0%    +100.0%          2 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.nr_spread_over
         3 =C2=B1 11%     -46.7%          2 =C2=B1  0%  sched_debug.cpu#3.c=
pu_load[3]
      5714 =C2=B1 27%     -37.4%       3577 =C2=B1  4%  sched_debug.cpu#28.=
sched_goidle
       745 =C2=B1 26%     +48.1%       1104 =C2=B1 20%  sched_debug.cpu#15.=
ttwu_local
     11686 =C2=B1 26%     -37.0%       7366 =C2=B1  4%  sched_debug.cpu#28.=
nr_switches
     90749 =C2=B1 11%     +54.3%     140005 =C2=B1 29%  sched_debug.cpu#32.=
sched_goidle
    181994 =C2=B1 11%     +54.1%     280377 =C2=B1 29%  sched_debug.cpu#32.=
nr_switches
    182550 =C2=B1 10%     +53.8%     280771 =C2=B1 29%  sched_debug.cpu#32.=
sched_count
     48790 =C2=B1 37%     +80.7%      88182 =C2=B1 19%  sched_debug.cpu#6.s=
ched_goidle
  48101669 =C2=B1 16%     +58.7%   76337780 =C2=B1 27%  cpuidle.C1-SNB.time
     11390 =C2=B1 16%     +62.0%      18455 =C2=B1 28%  sched_debug.cpu#11.=
ttwu_count
     50734 =C2=B1 38%     +79.4%      91038 =C2=B1 16%  sched_debug.cpu#6.t=
twu_count
        15 =C2=B1 21%     -34.4%         10 =C2=B1  0%  sched_debug.cpu#0.c=
pu_load[1]
        63 =C2=B1 39%     +96.1%        125 =C2=B1 12%  sched_debug.cfs_rq[=
58]:/.blocked_load_avg
       409 =C2=B1  9%     +47.9%        605 =C2=B1 26%  sched_debug.cpu#59.=
ttwu_local
      1267 =C2=B1 23%     +22.4%       1552 =C2=B1 25%  numa-meminfo.node3.=
AnonHugePages
        72 =C2=B1 25%     +92.4%        140 =C2=B1  3%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
      0.00 =C2=B1 32%     -43.6%       0.00 =C2=B1  1%  sched_debug.rt_rq[3=
2]:/.rt_time
      1147 =C2=B1 24%     +44.2%       1654 =C2=B1 10%  sched_debug.cpu#25.=
ttwu_local
         5 =C2=B1 14%     -60.0%          2 =C2=B1 50%  sched_debug.cpu#51.=
nr_uninterruptible
        12 =C2=B1 42%     +95.9%         24 =C2=B1  4%  sched_debug.cfs_rq[=
50]:/.load
     14738 =C2=B1  6%     +53.2%      22584 =C2=B1  7%  sched_debug.cpu#12.=
sched_goidle
     29667 =C2=B1  6%     +52.8%      45321 =C2=B1  7%  sched_debug.cpu#12.=
nr_switches
     14586 =C2=B1  8%     +54.0%      22463 =C2=B1  7%  sched_debug.cpu#12.=
ttwu_count
      1025 =C2=B1 17%     -41.3%        601 =C2=B1 10%  sched_debug.cpu#12.=
ttwu_local
     26504 =C2=B1 33%     +57.3%      41688 =C2=B1 19%  sched_debug.cpu#9.s=
ched_count
        73 =C2=B1 38%     +68.7%        124 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
       707 =C2=B1 20%     +63.1%       1154 =C2=B1  8%  numa-meminfo.node3.=
Shmem
        94 =C2=B1 12%     -50.0%         47 =C2=B1 34%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
       176 =C2=B1 20%     +63.2%        288 =C2=B1  9%  numa-vmstat.node3.n=
r_shmem
      1378 =C2=B1 15%     +15.9%       1597 =C2=B1 21%  sched_debug.cpu#1.c=
urr->pid
        69 =C2=B1 48%     +77.5%        122 =C2=B1  2%  sched_debug.cfs_rq[=
29]:/.blocked_load_avg
       692 =C2=B1  2%     +25.0%        865 =C2=B1 21%  sched_debug.cpu#30.=
curr->pid
        17 =C2=B1 33%     +52.1%         27 =C2=B1 18%  sched_debug.cpu#46.=
load
         3 =C2=B1  0%     -33.3%          2 =C2=B1  0%  sched_debug.cpu#3.c=
pu_load[4]
    390329 =C2=B1  0%     +24.1%     484415 =C2=B1 19%  sched_debug.cfs_rq[=
1]:/.min_vruntime
       635 =C2=B1 20%     +65.9%       1054 =C2=B1  5%  numa-meminfo.node3.=
Inactive(anon)
       158 =C2=B1 20%     +66.2%        263 =C2=B1  5%  numa-vmstat.node3.n=
r_inactive_anon
       140 =C2=B1  4%     +26.7%        178 =C2=B1 16%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      6553 =C2=B1 19%     -31.8%       4467 =C2=B1 17%  sched_debug.cpu#26.=
sched_goidle
      6476 =C2=B1  4%     +26.5%       8195 =C2=B1 16%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
       719 =C2=B1 31%     +46.9%       1056 =C2=B1  3%  sched_debug.cpu#16.=
ttwu_local
    278733 =C2=B1 11%     +28.3%     357584 =C2=B1 11%  cpuidle.C1E-SNB.usa=
ge
     12547 =C2=B1 10%     +35.0%      16933 =C2=B1  6%  sched_debug.cpu#58.=
sched_count
      6341 =C2=B1 10%     +35.5%       8592 =C2=B1  2%  sched_debug.cpu#58.=
ttwu_count
    139557 =C2=B1 14%     +18.4%     165256 =C2=B1 10%  sched_debug.cfs_rq[=
59]:/.spread0
      1767 =C2=B1  3%     +29.4%       2286 =C2=B1  3%  sched_debug.cpu#61.=
curr->pid
    136520 =C2=B1 13%     +16.7%     159351 =C2=B1  9%  sched_debug.cfs_rq[=
63]:/.spread0
    142974 =C2=B1  4%     +16.3%     166215 =C2=B1 14%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     13231 =C2=B1 23%     +29.8%      17174 =C2=B1 12%  sched_debug.cpu#16.=
sched_count
       113 =C2=B1 35%     -34.5%         74 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
        23 =C2=B1 19%     +38.3%         32 =C2=B1 10%  sched_debug.cfs_rq[=
37]:/.load
      1359 =C2=B1 21%     -40.1%        814 =C2=B1 16%  sched_debug.cpu#16.=
curr->pid
    141008 =C2=B1 16%     +16.6%     164377 =C2=B1  9%  sched_debug.cfs_rq[=
61]:/.spread0
       107 =C2=B1 32%     -31.8%         73 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
     39693 =C2=B1  7%     -20.7%      31477 =C2=B1  0%  sched_debug.cpu#44.=
ttwu_count
       960 =C2=B1 14%     +38.2%       1327 =C2=B1  1%  sched_debug.cpu#22.=
ttwu_local
       827 =C2=B1 11%     +20.2%        995 =C2=B1  9%  sched_debug.cpu#23.=
curr->pid
      1819 =C2=B1  5%     +18.8%       2162 =C2=B1  7%  sched_debug.cpu#60.=
curr->pid
      6671 =C2=B1 13%     +24.4%       8297 =C2=B1  8%  sched_debug.cpu#60.=
sched_goidle
     13517 =C2=B1 13%     +24.2%      16793 =C2=B1  8%  sched_debug.cpu#60.=
nr_switches
     13658 =C2=B1 12%     +24.0%      16934 =C2=B1  8%  sched_debug.cpu#60.=
sched_count
     39297 =C2=B1  8%     -19.8%      31521 =C2=B1  1%  sched_debug.cpu#44.=
sched_goidle
       835 =C2=B1 13%     +30.6%       1090 =C2=B1  1%  sched_debug.cpu#18.=
ttwu_local
     78817 =C2=B1  8%     -19.8%      63241 =C2=B1  1%  sched_debug.cpu#44.=
nr_switches
     79478 =C2=B1  8%     -20.0%      63595 =C2=B1  1%  sched_debug.cpu#44.=
sched_count
        14 =C2=B1 10%     -25.4%         11 =C2=B1  9%  sched_debug.cpu#0.c=
pu_load[2]
      1.43 =C2=B1  1%     -20.6%       1.14 =C2=B1  2%  perf-profile.cpu-cy=
cles.up_write.vm_munmap.sys_munmap.system_call_fastpath
      6092 =C2=B1 10%     +28.1%       7803 =C2=B1  0%  sched_debug.cpu#58.=
sched_goidle
       348 =C2=B1 13%     +18.7%        413 =C2=B1 10%  sched_debug.cpu#6.t=
twu_local
     12410 =C2=B1 10%     +27.3%      15796 =C2=B1  0%  sched_debug.cpu#58.=
nr_switches
      7012 =C2=B1 15%     +25.7%       8813 =C2=B1  7%  sched_debug.cpu#60.=
ttwu_count
       377 =C2=B1 11%     +13.5%        428 =C2=B1  7%  sched_debug.cpu#60.=
ttwu_local
      9050 =C2=B1  6%     +15.8%      10476 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.exec_clock
      1762 =C2=B1  2%      +8.1%       1906 =C2=B1  8%  sched_debug.cpu#62.=
curr->pid
   3954711 =C2=B1  4%     +11.8%    4420591 =C2=B1  8%  time.voluntary_cont=
ext_switches
      2045 =C2=B1  5%     +11.9%       2290 =C2=B1  7%  numa-meminfo.node3.=
KernelStack
        14 =C2=B1  8%     -14.3%         12 =C2=B1  0%  sched_debug.cpu#43.=
cpu_load[4]
       371 =C2=B1  1%     -17.0%        308 =C2=B1  5%  sched_debug.cpu#44.=
ttwu_local
        15 =C2=B1 15%     -20.6%         12 =C2=B1  4%  sched_debug.cpu#43.=
cpu_load[3]
        23 =C2=B1  7%     -14.0%         20 =C2=B1  0%  sched_debug.cpu#34.=
cpu_load[3]
      0.00 =C2=B1  4%     -22.2%       0.00 =C2=B1 14%  sched_debug.rt_rq[5=
0]:/.rt_time
    374746 =C2=B1 13%     +18.8%     445099 =C2=B1  3%  sched_debug.cfs_rq[=
50]:/.spread0
    650306 =C2=B1  5%     +13.4%     737674 =C2=B1  2%  sched_debug.cpu#33.=
avg_idle
      2796 =C2=B1  5%      +3.9%       2905 =C2=B1  6%  sched_debug.cpu#36.=
curr->pid
       388 =C2=B1  7%     +14.6%        444 =C2=B1  3%  sched_debug.cpu#63.=
ttwu_local
    641680 =C2=B1  2%      +9.2%     700581 =C2=B1  5%  sched_debug.cpu#39.=
avg_idle
      9736 =C2=B1  8%     +13.1%      11014 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.exec_clock
      3356 =C2=B1  2%      +8.6%       3646 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.avg->runnable_avg_sum
        71 =C2=B1  3%      +8.7%         78 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.tg_runnable_contrib
     16875 =C2=B1  3%      +9.5%      18477 =C2=B1  2%  slabinfo.vm_area_st=
ruct.active_objs
     16875 =C2=B1  3%      +9.5%      18477 =C2=B1  2%  slabinfo.vm_area_st=
ruct.num_objs
      1.17 =C2=B1  4%      -9.0%       1.06 =C2=B1  1%  perf-profile.cpu-cy=
cles.perf_event_mmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.sys_mmap_pgoff
     44305 =C2=B1  4%     -16.1%      37164 =C2=B1  8%  sched_debug.cpu#43.=
ttwu_count
      6430 =C2=B1  1%      +6.4%       6840 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
      2768 =C2=B1  3%      +3.7%       2870 =C2=B1  5%  sched_debug.cpu#38.=
curr->pid
      9224 =C2=B1  2%      +9.8%      10130 =C2=B1  1%  slabinfo.anon_vma.n=
um_objs
      9224 =C2=B1  2%      +9.8%      10130 =C2=B1  1%  slabinfo.anon_vma.a=
ctive_objs
      1816 =C2=B1  4%     +10.1%       2000 =C2=B1  2%  sched_debug.cpu#57.=
curr->pid
     85823 =C2=B1  4%     -15.5%      72483 =C2=B1  7%  sched_debug.cpu#43.=
nr_switches
     86191 =C2=B1  4%     -15.5%      72848 =C2=B1  7%  sched_debug.cpu#43.=
sched_count
     44120 =C2=B1 12%     +18.1%      52091 =C2=B1  4%  sched_debug.cpu#1.n=
r_load_updates
     42455 =C2=B1  5%     -14.9%      36139 =C2=B1  7%  sched_debug.cpu#43.=
sched_goidle
     27096 =C2=B1  3%     +10.6%      29973 =C2=B1  8%  vmstat.system.cs
     18715 =C2=B1  0%      +7.0%      20016 =C2=B1  5%  vmstat.system.in

testbox/testcase/testparams: snb-drag/phoronix-test-suite/performance-encod=
e-ogg-1.4.1

ba4877b9ca51f80b  10359213d05acf804558bda7cc  =

----------------  --------------------------  =

     29266 =C2=B1  0%     -13.0%      25474 =C2=B1  1%  phoronix-test-suite=
.time.minor_page_faults
       320 =C2=B1 35%    +367.6%       1496 =C2=B1 44%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
        63 =C2=B1 35%    +103.1%        129 =C2=B1 28%  sched_debug.cpu#2.c=
pu_load[1]
        68 =C2=B1 37%    +148.7%        171 =C2=B1 26%  sched_debug.cpu#2.c=
pu_load[0]
       126 =C2=B1 37%     +73.5%        219 =C2=B1 38%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
       298 =C2=B1  3%     -25.5%        222 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.load
        35 =C2=B1  8%     +21.8%         43 =C2=B1 10%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     29266 =C2=B1  0%     -13.0%      25474 =C2=B1  1%  time.minor_page_fau=
lts

xps2: Nehalem
Memory: 4G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G

snb-drag: Sandy Bridge
Memory: 6G




                             pigz.time.minor_page_faults

  27400 ++-----------------------------------------------------------------=
-+
  27200 ++                                 *             **                =
 |
        | .*             ***    *.*    ** +:   .** .**  +  :     .* *.*  *.=
 *
  27000 **  ***.***.**  +   + **   * .*  *  :**   *   **   *.** *  *   **  =
*|
  26800 ++            **     *      *       *                  *           =
 |
        |                                                                  =
 |
  26600 ++                                        O                        =
 |
  26400 ++                                    O                            =
 |
  26200 ++ O O    O O    O O  O   O   O OO  O                              =
 |
        O                                                                  =
 |
  26000 +O      O     O   O  O     OO  O        O                          =
 |
  25800 ++    O  O   O         OO                O                         =
 |
        |                                                                  =
 |
  25600 ++  O          O                                                   =
 |
  25400 ++---------------------------------O-O-----------------------------=
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


--===============0046311995565961003==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBwaWd6CmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAKICBt
ZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRl
bmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6
IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDog
CiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0X3dhdGNo
ZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9y
bWFuY2UKY29tbWl0OiBlYTJiYmUzYjliZjkzMDQwOGRiMjA1MzQ0ZmUxMGM4ZjcxOWJhNzM4Cm1v
ZGVsOiBOZWhhbGVtCm1lbW9yeTogNEcKbnJfc3NkX3BhcnRpdGlvbnM6IDEKc3NkX3BhcnRpdGlv
bnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUlOVEVMX1NTRFNDMkNXMjQwQTNfQ1ZDVjIwNDMwM1hC
MjQwQ0dOLXBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJDVzI0MEEzX0NWQ1YyMDQzMDNYQjI0MENHTi1wYXJ0
MiIKbmV0Y29uc29sZV9wb3J0OiA2NjY1CnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKbnJfdGhy
ZWFkczogMTAwJQpwaWd6OgogIGJsb2Nrc2l6ZTogNTEySwp0ZXN0Ym94OiB4cHMyCnRib3hfZ3Jv
dXA6IHhwczIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTAyLTE1IDAx
OjM3OjE3LjkyMjgzODgyMyArMDg6MDAKaGVhZF9jb21taXQ6IGVhMmJiZTNiOWJmOTMwNDA4ZGIy
MDUzNDRmZTEwYzhmNzE5YmE3MzgKYmFzZV9jb21taXQ6IGJmYTc2ZDQ5NTc2NTk5YTRiOWY5Yjdh
NzFmMjNkNzNkNmRjZmY3MzUKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTAy
MTQyMwprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsL2VhMmJiZTNiOWJmOTMwNDA4ZGIyMDUz
NDRmZTEwYzhmNzE5YmE3Mzgvdm1saW51ei0zLjE5LjAtZ2VhMmJiZTMiCnVzZXI6IGxrcApxdWV1
ZTogY3ljbGljCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9v
dDogIi9yZXN1bHQveHBzMi9waWd6L3BlcmZvcm1hbmNlLTEwMCUtNTEySy9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2VhMmJiZTNiOWJmOTMwNDA4ZGIyMDUzNDRmZTEw
YzhmNzE5YmE3MzgvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC94cHMyL2N5Y2xpY19waWd6
LXBlcmZvcm1hbmNlLTEwMCUtNTEySy14ODZfNjQtcmhlbC1IRUFELWVhMmJiZTNiOWJmOTMwNDA4
ZGIyMDUzNDRmZTEwYzhmNzE5YmE3MzgtMC0yMDE1MDIxNS01ODczOC15emZ1amYueWFtbCIKZGVx
dWV1ZV90aW1lOiAyMDE1LTAyLTE1IDAxOjQ5OjQ3LjI5OTM2MTU4OSArMDg6MDAKbnJfY3B1OiAi
JChucHJvYykiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNi42NiA1LjE0IDIuMzEgMS8x
MzIgNTMwOQpzdGFydF90aW1lOiAnMTQyMzkzNjIxMicKZW5kX3RpbWU6ICcxNDIzOTM2NTEzJwp2
ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDIxMy0wOTQ4NDYiCg==

--===============0046311995565961003==--

