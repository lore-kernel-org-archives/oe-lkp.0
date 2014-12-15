Content-Type: multipart/mixed; boundary="===============4881601791461886332=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [vfs] 75cbe701a42: +40.5% vmstat.system.in
Date: Mon, 15 Dec 2014 11:21:42 +0100
Message-ID: <20141215102142.GC2650@quack.suse.cz>
In-Reply-To: <1418631955.5745.193.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4881601791461886332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Hello,

On Mon 15-12-14 16:25:55, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> commit 75cbe701a4251fcd8b846d52ae42f88c9a8e5e93 ("vfs: Remove i_dquot
> field from inode")
>
> testbox/testcase/testparams: lkp-nex05/will-it-scale/performance-pwrite3
  So in the first test is there any "user observable" change in results?
E.g. a change in throughput? Or is the only difference in the increased
number of interrupts? I don't see any but maybe I missed something.

  In the second test
(lkp-nex06/vm-scalability/performance-300s-small-allocs) I can also see
increased number of interrupts and also decreased throughput.

  The only idea I have how anything can regress when removing i_dquot field
is that it created some cacheline sharing problem. What filesystem were you
using for the test? Can you also post a kernel config? Thanks!

								Honza

> 507e1fa697097b48  75cbe701a4251fcd8b846d52ae  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>     157162 =C2=B1 12%    +420.1%     817388 =C2=B1 41%  sched_debug.cfs_r=
q[0]:/.min_vruntime
>          6 =C2=B1  7%    +533.8%         41 =C2=B1 42%  sched_debug.cfs_r=
q[22]:/.tg_load_contrib
>          1 =C2=B1  0%    +440.0%          5 =C2=B1 43%  sched_debug.cpu#2=
6.cpu_load[1]
>          0 =C2=B1  0%      +Inf%          5 =C2=B1 45%  sched_debug.cfs_r=
q[26]:/.runnable_load_avg
>          0 =C2=B1  0%      +Inf%          5 =C2=B1 36%  sched_debug.cpu#3=
0.cpu_load[0]
>    8431.40 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_r=
q[34]:/.MIN_vruntime
>    8431.40 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_r=
q[34]:/.max_vruntime
>          0 =C2=B1  0%      +Inf%          3 =C2=B1 19%  sched_debug.cpu#5=
7.cpu_load[4]
>     145948 =C2=B1 31%     -65.3%      50659 =C2=B1 47%  sched_debug.cpu#3=
.sched_count
>          2 =C2=B1 20%    +388.0%         12 =C2=B1 44%  sched_debug.cfs_r=
q[33]:/.runnable_load_avg
>     102647 =C2=B1 42%     -65.2%      35676 =C2=B1 24%  sched_debug.cpu#1=
1.sched_count
>     185980 =C2=B1 17%     -59.1%      76091 =C2=B1 43%  sched_debug.cpu#1=
0.sched_count
>      92451 =C2=B1 16%     -65.8%      31628 =C2=B1 13%  sched_debug.cpu#1=
0.sched_goidle
>     185092 =C2=B1 16%     -65.7%      63435 =C2=B1 13%  sched_debug.cpu#1=
0.nr_switches
>     191359 =C2=B1  6%    +227.3%     626233 =C2=B1 42%  sched_debug.cfs_r=
q[34]:/.min_vruntime
>      87689 =C2=B1 15%     -64.2%      31375 =C2=B1 13%  sched_debug.cpu#1=
0.ttwu_count
>     205303 =C2=B1 10%    +195.9%     607409 =C2=B1 43%  sched_debug.cfs_r=
q[38]:/.min_vruntime
>      40762 =C2=B1 27%     -45.8%      22112 =C2=B1 37%  sched_debug.cpu#2=
5.ttwu_count
>      41187 =C2=B1 23%     -45.7%      22347 =C2=B1 37%  sched_debug.cpu#2=
5.sched_goidle
>      82643 =C2=B1 23%     -45.4%      45095 =C2=B1 37%  sched_debug.cpu#2=
5.nr_switches
>       2702 =C2=B1  9%    +155.2%       6896 =C2=B1 45%  sched_debug.cfs_r=
q[43]:/.avg->runnable_avg_sum
>         58 =C2=B1 10%    +158.3%        149 =C2=B1 46%  sched_debug.cfs_r=
q[43]:/.tg_runnable_contrib
>      83542 =C2=B1 22%     -43.9%      46893 =C2=B1 36%  sched_debug.cpu#2=
5.sched_count
>         51 =C2=B1  8%    +187.4%        148 =C2=B1 42%  sched_debug.cfs_r=
q[49]:/.tg_runnable_contrib
>       2394 =C2=B1  9%    +184.2%       6805 =C2=B1 42%  sched_debug.cfs_r=
q[49]:/.avg->runnable_avg_sum
>     292617 =C2=B1 23%     -41.0%     172597 =C2=B1 42%  sched_debug.cpu#6=
.sched_count
>     145348 =C2=B1 23%     -41.6%      84899 =C2=B1 41%  sched_debug.cpu#6=
.sched_goidle
>     290925 =C2=B1 23%     -41.6%     169994 =C2=B1 41%  sched_debug.cpu#6=
.nr_switches
>      34916 =C2=B1 10%     -45.2%      19148 =C2=B1 31%  sched_debug.cpu#1=
7.sched_goidle
>      70132 =C2=B1 10%     -44.8%      38690 =C2=B1 31%  sched_debug.cpu#1=
7.nr_switches
>       3371 =C2=B1 20%    +542.7%      21665 =C2=B1 42%  sched_debug.cfs_r=
q[13]:/.exec_clock
>      33857 =C2=B1 13%     -43.0%      19297 =C2=B1 29%  sched_debug.cpu#1=
7.ttwu_count
>        464 =C2=B1  0%    +288.4%       1804 =C2=B1 47%  sched_debug.cpu#7=
.curr->pid
>         93 =C2=B1 11%    +128.0%        212 =C2=B1 34%  sched_debug.cfs_r=
q[42]:/.tg_runnable_contrib
>       4288 =C2=B1 11%    +126.8%       9724 =C2=B1 33%  sched_debug.cfs_r=
q[42]:/.avg->runnable_avg_sum
>      70149 =C2=B1 10%     -43.6%      39548 =C2=B1 29%  sched_debug.cpu#1=
7.sched_count
>        310 =C2=B1  6%    +432.2%       1652 =C2=B1 45%  sched_debug.cpu#1=
8.curr->pid
>       2155 =C2=B1  7%    +329.7%       9262 =C2=B1 45%  sched_debug.cfs_r=
q[23]:/.exec_clock
>     166703 =C2=B1 21%     -49.1%      84791 =C2=B1 30%  sched_debug.cpu#2=
.sched_goidle
>     333623 =C2=B1 21%     -49.1%     169785 =C2=B1 30%  sched_debug.cpu#2=
.nr_switches
>     333958 =C2=B1 21%     -44.4%     185671 =C2=B1 35%  sched_debug.cpu#2=
.sched_count
>       9362 =C2=B1  9%    +118.8%      20488 =C2=B1 37%  sched_debug.cfs_r=
q[42]:/.exec_clock
>          0 =C2=B1  0%      +Inf%          2 =C2=B1 41%  sched_debug.cpu#1=
1.cpu_load[4]
>      72346 =C2=B1 28%     -40.5%      43020 =C2=B1 23%  sched_debug.cpu#1=
9.sched_count
>      22735 =C2=B1  9%     -35.8%      14591 =C2=B1 29%  sched_debug.cpu#2=
9.ttwu_count
>      88509 =C2=B1 10%     -42.9%      50561 =C2=B1 32%  sched_debug.cpu#5=
.sched_goidle
>     177345 =C2=B1 10%     -42.8%     101466 =C2=B1 31%  sched_debug.cpu#5=
.nr_switches
>          0 =C2=B1  0%      +Inf%          3 =C2=B1 36%  sched_debug.cpu#1=
1.cpu_load[3]
>     178372 =C2=B1 10%     -39.4%     108021 =C2=B1 19%  sched_debug.cpu#5=
.sched_count
>        176 =C2=B1 46%    +778.8%       1551 =C2=B1 42%  sched_debug.cpu#1=
4.curr->pid
>          1 =C2=B1  0%    +500.0%          6 =C2=B1 34%  sched_debug.cpu#2=
0.cpu_load[0]
>      22743 =C2=B1 12%     -32.4%      15363 =C2=B1 29%  sched_debug.cpu#2=
9.sched_goidle
>      68316 =C2=B1 13%     -27.5%      49497 =C2=B1 33%  sched_debug.cpu#4=
.ttwu_count
>      26811 =C2=B1 16%     -36.8%      16949 =C2=B1 30%  sched_debug.cpu#1=
1.ttwu_count
>      45868 =C2=B1 12%     -31.6%      31356 =C2=B1 29%  sched_debug.cpu#2=
9.nr_switches
>      96945 =C2=B1 12%     -40.3%      57836 =C2=B1 34%  sched_debug.cpu#5=
.ttwu_count
>      25741 =C2=B1 14%     -33.3%      17166 =C2=B1 26%  sched_debug.cpu#1=
1.sched_goidle
>      51764 =C2=B1 13%     -33.0%      34703 =C2=B1 25%  sched_debug.cpu#1=
1.nr_switches
>      63300 =C2=B1 13%     -20.0%      50621 =C2=B1 18%  sched_debug.cpu#2=
6.sched_goidle
>     126782 =C2=B1 13%     -20.0%     101443 =C2=B1 18%  sched_debug.cpu#2=
6.nr_switches
>          5 =C2=B1 40%    +116.0%         10 =C2=B1 15%  sched_debug.cpu#4=
8.cpu_load[4]
>          0 =C2=B1  0%      +Inf%          5 =C2=B1 36%  sched_debug.cfs_r=
q[20]:/.runnable_load_avg
>      59777 =C2=B1 12%     -19.2%      48285 =C2=B1 17%  sched_debug.cpu#2=
6.ttwu_count
>          7 =C2=B1  6%     +52.0%         11 =C2=B1 10%  sched_debug.cpu#4=
0.cpu_load[4]
>          1 =C2=B1 33%    +220.0%          4 =C2=B1 24%  sched_debug.cpu#5=
7.cpu_load[3]
>        483 =C2=B1 19%    +378.2%       2312 =C2=B1 36%  sched_debug.cpu#0=
.curr->pid
>        172 =C2=B1  4%     +71.5%        295 =C2=B1 22%  sched_debug.cfs_r=
q[40]:/.tg_runnable_contrib
>      55388 =C2=B1 24%     -24.6%      41749 =C2=B1 39%  sched_debug.cpu#5=
7.sched_goidle
>       7887 =C2=B1  4%     +71.3%      13512 =C2=B1 23%  sched_debug.cfs_r=
q[40]:/.avg->runnable_avg_sum
>          5 =C2=B1 40%    +120.0%         11 =C2=B1 16%  sched_debug.cpu#4=
8.cpu_load[3]
>      46362 =C2=B1 11%     -25.4%      34597 =C2=B1 24%  sched_debug.cpu#2=
9.sched_count
>         43 =C2=B1 13%    +309.8%        176 =C2=B1 35%  sched_debug.cfs_r=
q[9]:/.tg_runnable_contrib
>         75 =C2=B1 14%    +158.7%        194 =C2=B1 39%  sched_debug.cfs_r=
q[37]:/.tg_runnable_contrib
>       3468 =C2=B1 14%    +157.2%       8919 =C2=B1 39%  sched_debug.cfs_r=
q[37]:/.avg->runnable_avg_sum
>       2015 =C2=B1 13%    +302.0%       8102 =C2=B1 35%  sched_debug.cfs_r=
q[9]:/.avg->runnable_avg_sum
>         32 =C2=B1  9%    +297.5%        127 =C2=B1 42%  sched_debug.cfs_r=
q[15]:/.tg_runnable_contrib
>       1507 =C2=B1  7%    +290.1%       5878 =C2=B1 42%  sched_debug.cfs_r=
q[15]:/.avg->runnable_avg_sum
>       3998 =C2=B1  8%     -14.1%       3433 =C2=B1  9%  cpuidle.C1E-NHM.u=
sage
>     111142 =C2=B1 24%     -24.5%      83920 =C2=B1 39%  sched_debug.cpu#5=
7.nr_switches
>     111162 =C2=B1 24%     -24.3%      84203 =C2=B1 39%  sched_debug.cpu#5=
7.sched_count
>         63 =C2=B1 19%    +187.6%        181 =C2=B1 36%  sched_debug.cfs_r=
q[35]:/.tg_runnable_contrib
>         71 =C2=B1  4%    +145.6%        174 =C2=B1 26%  sched_debug.cfs_r=
q[61]:/.tg_runnable_contrib
>       2927 =C2=B1 18%    +185.8%       8365 =C2=B1 36%  sched_debug.cfs_r=
q[35]:/.avg->runnable_avg_sum
>       3276 =C2=B1  3%    +144.9%       8022 =C2=B1 26%  sched_debug.cfs_r=
q[61]:/.avg->runnable_avg_sum
>        459 =C2=B1 10%     -25.0%        344 =C2=B1 12%  sched_debug.cpu#4=
0.ttwu_local
>        196 =C2=B1  3%     -14.0%        169 =C2=B1 10%  sched_debug.cpu#4=
6.ttwu_local
>     178384 =C2=B1  0%     -32.1%     121086 =C2=B1 29%  sched_debug.cpu#6=
2.ttwu_count
>        252 =C2=B1 24%    +336.6%       1100 =C2=B1 37%  sched_debug.cpu#1=
5.curr->pid
>       2364 =C2=B1  5%    +257.1%       8441 =C2=B1 38%  sched_debug.cfs_r=
q[18]:/.avg->runnable_avg_sum
>          6 =C2=B1  0%    +103.3%         12 =C2=B1 24%  sched_debug.cpu#4=
8.cpu_load[0]
>          4 =C2=B1 33%    +148.9%         11 =C2=B1 19%  sched_debug.cpu#4=
8.cpu_load[2]
>          8 =C2=B1 12%     +45.0%         11 =C2=B1 11%  sched_debug.cpu#4=
0.cpu_load[3]
>          5 =C2=B1 20%    +128.0%         11 =C2=B1 21%  sched_debug.cpu#4=
8.cpu_load[1]
>       8886 =C2=B1  8%    +114.1%      19030 =C2=B1 35%  sched_debug.cfs_r=
q[37]:/.exec_clock
>         51 =C2=B1 11%    +253.7%        180 =C2=B1 36%  sched_debug.cfs_r=
q[22]:/.tg_runnable_contrib
>       2358 =C2=B1 11%    +251.6%       8293 =C2=B1 36%  sched_debug.cfs_r=
q[22]:/.avg->runnable_avg_sum
>        331 =C2=B1  0%     -16.1%        278 =C2=B1  4%  sched_debug.cpu#4=
9.ttwu_local
>      26574 =C2=B1  8%     +47.3%      39151 =C2=B1 16%  sched_debug.cfs_r=
q[34]:/.exec_clock
>       8204 =C2=B1  3%     +65.0%      13540 =C2=B1 24%  sched_debug.cfs_r=
q[36]:/.avg->runnable_avg_sum
>        179 =C2=B1  3%     +65.3%        295 =C2=B1 24%  sched_debug.cfs_r=
q[36]:/.tg_runnable_contrib
>        330 =C2=B1 17%    +325.6%       1404 =C2=B1 37%  sched_debug.cpu#2=
0.curr->pid
>          2 =C2=B1  0%    +180.0%          5 =C2=B1 40%  sched_debug.cfs_r=
q[62]:/.runnable_load_avg
>        597 =C2=B1  5%    +155.0%       1523 =C2=B1 27%  sched_debug.cpu#4=
2.curr->pid
>        555 =C2=B1 23%    +115.5%       1197 =C2=B1 43%  sched_debug.cpu#4=
1.curr->pid
>       8581 =C2=B1  0%     +56.5%      13426 =C2=B1 25%  sched_debug.cfs_r=
q[60]:/.avg->runnable_avg_sum
>        187 =C2=B1  0%     +56.2%        292 =C2=B1 25%  sched_debug.cfs_r=
q[60]:/.tg_runnable_contrib
>          2 =C2=B1 50%    +210.0%          6 =C2=B1 27%  sched_debug.cpu#5=
7.cpu_load[2]
>      71489 =C2=B1  4%     -49.9%      35802 =C2=B1 30%  sched_debug.cpu#5=
5.sched_goidle
>       7457 =C2=B1 17%     +63.9%      12222 =C2=B1 19%  sched_debug.cfs_r=
q[38]:/.avg->runnable_avg_sum
>        163 =C2=B1 17%     +63.4%        266 =C2=B1 19%  sched_debug.cfs_r=
q[38]:/.tg_runnable_contrib
>        923 =C2=B1  9%    +105.2%       1894 =C2=B1 28%  sched_debug.cpu#6=
0.curr->pid
>          4 =C2=B1  0%    +185.0%         11 =C2=B1 48%  sched_debug.cpu#4=
1.cpu_load[0]
>         43 =C2=B1  9%    +202.8%        130 =C2=B1 43%  sched_debug.cfs_r=
q[31]:/.blocked_load_avg
>     143344 =C2=B1  4%     -49.7%      72109 =C2=B1 30%  sched_debug.cpu#5=
5.nr_switches
>     154157 =C2=B1 16%     -41.3%      90499 =C2=B1 24%  sched_debug.cpu#3=
3.sched_goidle
>       7157 =C2=B1 13%     +80.3%      12902 =C2=B1 24%  sched_debug.cfs_r=
q[34]:/.avg->runnable_avg_sum
>     143368 =C2=B1  4%     -49.6%      72207 =C2=B1 30%  sched_debug.cpu#5=
5.sched_count
>     398727 =C2=B1  7%     -25.0%     299212 =C2=B1 33%  sched_debug.cpu#5=
6.ttwu_count
>        331 =C2=B1 38%     -53.2%        154 =C2=B1 38%  sched_debug.cfs_r=
q[45]:/.blocked_load_avg
>        155 =C2=B1 14%     +81.0%        281 =C2=B1 24%  sched_debug.cfs_r=
q[34]:/.tg_runnable_contrib
>         17 =C2=B1 14%     -30.3%         12 =C2=B1 34%  sched_debug.cfs_r=
q[59]:/.runnable_load_avg
>         37 =C2=B1  4%    +202.4%        113 =C2=B1 39%  sched_debug.cfs_r=
q[23]:/.tg_runnable_contrib
>     173012 =C2=B1 19%     -42.7%      99216 =C2=B1 27%  sched_debug.cpu#3=
3.ttwu_count
>      75987 =C2=B1  4%     -50.1%      37929 =C2=B1 31%  sched_debug.cpu#5=
5.ttwu_count
>     308942 =C2=B1 16%     -41.3%     181404 =C2=B1 24%  sched_debug.cpu#3=
3.nr_switches
>          3 =C2=B1 14%    +180.0%          9 =C2=B1 35%  sched_debug.cpu#4=
1.cpu_load[1]
>       1780 =C2=B1  4%    +194.9%       5248 =C2=B1 39%  sched_debug.cfs_r=
q[23]:/.avg->runnable_avg_sum
>          3 =C2=B1 14%    +128.6%          8 =C2=B1 28%  sched_debug.cpu#4=
1.cpu_load[2]
>         29 =C2=B1 10%    +263.4%        105 =C2=B1 46%  sched_debug.cfs_r=
q[21]:/.tg_runnable_contrib
>     308995 =C2=B1 16%     -41.2%     181562 =C2=B1 24%  sched_debug.cpu#3=
3.sched_count
>         74 =C2=B1 14%     -53.5%         34 =C2=B1 45%  sched_debug.cfs_r=
q[12]:/.tg_load_contrib
>       1388 =C2=B1  9%    +250.5%       4865 =C2=B1 45%  sched_debug.cfs_r=
q[21]:/.avg->runnable_avg_sum
>          2 =C2=B1 20%    +180.0%          7 =C2=B1 40%  sched_debug.cfs_r=
q[41]:/.runnable_load_avg
>     191260 =C2=B1 12%     -43.1%     108749 =C2=B1 25%  sched_debug.cpu#4=
5.ttwu_count
>      68784 =C2=B1  0%     -36.6%      43633 =C2=B1 40%  sched_debug.cpu#5=
3.ttwu_count
>     173314 =C2=B1  9%     -45.9%      93834 =C2=B1 26%  sched_debug.cpu#4=
5.sched_goidle
>         40 =C2=B1 17%     -40.0%         24 =C2=B1 21%  sched_debug.cfs_r=
q[32]:/.runnable_load_avg
>      55810 =C2=B1 12%     -26.3%      41131 =C2=B1 30%  sched_debug.cpu#3=
9.sched_goidle
>     179862 =C2=B1  1%     -35.8%     115446 =C2=B1 38%  sched_debug.cpu#5=
0.ttwu_count
>         23 =C2=B1 17%     -43.5%         13 =C2=B1 40%  sched_debug.cpu#5=
9.load
>         23 =C2=B1 17%     -43.5%         13 =C2=B1 40%  sched_debug.cfs_r=
q[59]:/.load
>        211 =C2=B1 21%     -47.3%        111 =C2=B1 36%  sched_debug.cfs_r=
q[5]:/.blocked_load_avg
>         39 =C2=B1 18%     -37.7%         24 =C2=B1 24%  sched_debug.cpu#3=
2.cpu_load[1]
>     347042 =C2=B1  9%     -45.8%     188111 =C2=B1 25%  sched_debug.cpu#4=
5.nr_switches
>         89 =C2=B1 10%     -52.6%         42 =C2=B1 40%  sched_debug.cfs_r=
q[2]:/.tg_load_contrib
>     111996 =C2=B1 12%     -26.2%      82661 =C2=B1 29%  sched_debug.cpu#3=
9.nr_switches
>     347092 =C2=B1  9%     -45.8%     188225 =C2=B1 25%  sched_debug.cpu#4=
5.sched_count
>          9 =C2=B1 26%     -43.2%          5 =C2=B1 44%  sched_debug.cpu#4=
7.cpu_load[1]
>        337 =C2=B1 37%     -51.7%        162 =C2=B1 37%  sched_debug.cfs_r=
q[45]:/.tg_load_contrib
>       6701 =C2=B1 12%    +137.1%      15886 =C2=B1 29%  sched_debug.cfs_r=
q[0]:/.avg->runnable_avg_sum
>     171660 =C2=B1  8%     -33.6%     114067 =C2=B1 27%  sched_debug.cpu#5=
4.ttwu_count
>        146 =C2=B1 12%    +135.8%        345 =C2=B1 29%  sched_debug.cfs_r=
q[0]:/.tg_runnable_contrib
>      60240 =C2=B1 12%     -27.1%      43911 =C2=B1 29%  sched_debug.cpu#3=
9.ttwu_count
>     180017 =C2=B1  5%     -34.2%     118414 =C2=B1 26%  sched_debug.cpu#5=
4.sched_goidle
>          6 =C2=B1  7%     +96.9%         12 =C2=B1 18%  sched_debug.cpu#3=
4.cpu_load[4]
>         48 =C2=B1 19%    +180.0%        135 =C2=B1 44%  sched_debug.cfs_r=
q[31]:/.tg_load_contrib
>       5564 =C2=B1 25%    +196.0%      16471 =C2=B1 49%  sched_debug.cfs_r=
q[1]:/.exec_clock
>     164454 =C2=B1 22%     -39.4%      99729 =C2=B1 29%  sched_debug.cpu#4=
1.sched_goidle
>     113012 =C2=B1 11%     -26.8%      82773 =C2=B1 29%  sched_debug.cpu#3=
9.sched_count
>     184124 =C2=B1  1%     -36.6%     116679 =C2=B1 38%  sched_debug.cpu#5=
0.sched_goidle
>     360271 =C2=B1  5%     -34.2%     237049 =C2=B1 26%  sched_debug.cpu#5=
4.nr_switches
>         39 =C2=B1 18%     -34.7%         25 =C2=B1 23%  sched_debug.cpu#3=
2.cpu_load[0]
>     360327 =C2=B1  5%     -34.2%     237201 =C2=B1 26%  sched_debug.cpu#5=
4.sched_count
>        339 =C2=B1  5%     -16.4%        283 =C2=B1 13%  sched_debug.cpu#5=
1.ttwu_local
>     329307 =C2=B1 22%     -39.3%     199906 =C2=B1 29%  sched_debug.cpu#4=
1.nr_switches
>     329356 =C2=B1 22%     -39.3%     200070 =C2=B1 29%  sched_debug.cpu#4=
1.sched_count
>     368489 =C2=B1  1%     -36.6%     233598 =C2=B1 37%  sched_debug.cpu#5=
0.nr_switches
>         37 =C2=B1 13%     -30.3%         25 =C2=B1 23%  sched_debug.cpu#3=
2.cpu_load[2]
>          6 =C2=B1 16%     -26.7%          4 =C2=B1 23%  sched_debug.cpu#5=
5.cpu_load[3]
>     368543 =C2=B1  1%     -36.3%     234920 =C2=B1 38%  sched_debug.cpu#5=
0.sched_count
>         60 =C2=B1 26%     -24.0%         45 =C2=B1 41%  sched_debug.cfs_r=
q[38]:/.blocked_load_avg
>          1 =C2=B1 33%    +233.3%          5 =C2=B1 35%  sched_debug.cpu#1=
8.cpu_load[1]
>        176 =C2=B1 25%     -29.0%        125 =C2=B1 41%  sched_debug.cfs_r=
q[37]:/.blocked_load_avg
>          9 =C2=B1 11%     -37.8%          5 =C2=B1 24%  sched_debug.cpu#5=
5.cpu_load[2]
>     183394 =C2=B1 27%     -36.5%     116428 =C2=B1 29%  sched_debug.cpu#4=
1.ttwu_count
>        188 =C2=B1 26%     -28.1%        135 =C2=B1 40%  sched_debug.cfs_r=
q[37]:/.tg_load_contrib
>      30994 =C2=B1 21%    +103.6%      63115 =C2=B1 24%  sched_debug.cfs_r=
q[0]:/.exec_clock
>         17 =C2=B1 35%    +103.5%         34 =C2=B1 15%  sched_debug.cfs_r=
q[0]:/.load
>          6 =C2=B1  7%    +100.0%         13 =C2=B1 20%  sched_debug.cpu#3=
4.cpu_load[3]
>        130 =C2=B1 17%     -40.2%         78 =C2=B1 20%  sched_debug.cfs_r=
q[7]:/.tg_load_contrib
>         12 =C2=B1  4%     -42.4%          7 =C2=B1 28%  sched_debug.cpu#5=
5.cpu_load[0]
>      71751 =C2=B1  4%     -40.6%      42585 =C2=B1 38%  sched_debug.cpu#4=
7.ttwu_count
>        216 =C2=B1 20%     -44.6%        120 =C2=B1 34%  sched_debug.cfs_r=
q[5]:/.tg_load_contrib
>        436 =C2=B1 22%     -31.8%        297 =C2=B1 15%  sched_debug.cpu#3=
3.ttwu_local
>         14 =C2=B1 17%    +159.3%         37 =C2=B1 39%  sched_debug.cfs_r=
q[28]:/.tg_load_contrib
>         11 =C2=B1  4%     -42.6%          6 =C2=B1 22%  sched_debug.cpu#5=
5.cpu_load[1]
>      68501 =C2=B1  3%     -41.2%      40278 =C2=B1 38%  sched_debug.cpu#4=
7.sched_goidle
>     137399 =C2=B1  3%     -41.0%      81095 =C2=B1 38%  sched_debug.cpu#4=
7.nr_switches
>        118 =C2=B1 15%     -40.6%         70 =C2=B1 25%  sched_debug.cfs_r=
q[7]:/.blocked_load_avg
>          7 =C2=B1  0%     +88.6%         13 =C2=B1 18%  sched_debug.cpu#3=
4.cpu_load[2]
>     139101 =C2=B1  2%     -41.6%      81205 =C2=B1 37%  sched_debug.cpu#4=
7.sched_count
>         24 =C2=B1 25%     -24.2%         18 =C2=B1 48%  sched_debug.cfs_r=
q[60]:/.load
>  1.571e+10 =C2=B1  1%      -9.5%  1.421e+10 =C2=B1  5%  cpuidle.C3-NHM.ti=
me
>         66 =C2=B1 24%     -14.3%         57 =C2=B1 26%  sched_debug.cfs_r=
q[38]:/.tg_load_contrib
>      40806 =C2=B1  6%     +72.3%      70294 =C2=B1 20%  sched_debug.cpu#0=
.nr_load_updates
>         58 =C2=B1 28%    +160.2%        152 =C2=B1 37%  sched_debug.cfs_r=
q[11]:/.tg_load_contrib
>    3310987 =C2=B1  1%     -30.0%    2316926 =C2=B1 21%  cpuidle.C3-NHM.us=
age
>         67 =C2=B1  0%     +90.5%        128 =C2=B1 28%  sched_debug.cfs_r=
q[9]:/.blocked_load_avg
>         80 =C2=B1 27%    +109.2%        168 =C2=B1 22%  sched_debug.cfs_r=
q[47]:/.blocked_load_avg
>     186538 =C2=B1  0%     -37.4%     116738 =C2=B1 33%  sched_debug.cpu#4=
6.ttwu_count
>          8 =C2=B1  0%     +65.0%         13 =C2=B1 18%  sched_debug.cpu#3=
4.cpu_load[1]
>     194298 =C2=B1  1%     -38.6%     119356 =C2=B1 33%  sched_debug.cpu#4=
6.sched_goidle
>         71 =C2=B1  4%     +89.1%        135 =C2=B1 25%  sched_debug.cfs_r=
q[9]:/.tg_load_contrib
>        188 =C2=B1 15%     +97.7%        372 =C2=B1 33%  sched_debug.cfs_r=
q[59]:/.blocked_load_avg
>     388833 =C2=B1  1%     -38.6%     238921 =C2=B1 33%  sched_debug.cpu#4=
6.nr_switches
>     358921 =C2=B1  1%     -13.8%     309431 =C2=B1  6%  softirqs.SCHED
>       2.34 =C2=B1  2%     -37.8%       1.46 =C2=B1 41%  perf-profile.cpu-=
cycles.__srcu_read_lock.fsnotify.vfs_write.sys_pwrite64.system_call_fastpath
>         53 =C2=B1  3%     -34.0%         35 =C2=B1 13%  sched_debug.cfs_r=
q[32]:/.load
>         50 =C2=B1  8%     -31.1%         34 =C2=B1 13%  sched_debug.cpu#3=
2.load
>        206 =C2=B1 12%     +86.8%        385 =C2=B1 31%  sched_debug.cfs_r=
q[59]:/.tg_load_contrib
>     388897 =C2=B1  1%     -38.5%     239075 =C2=B1 33%  sched_debug.cpu#4=
6.sched_count
>         34 =C2=B1 23%    +163.5%         89 =C2=B1 47%  sched_debug.cfs_r=
q[0]:/.tg_load_contrib
>      62.72 =C2=B1  2%     -15.4%      53.04 =C2=B1 10%  turbostat.%c3
>         82 =C2=B1 10%     -29.0%         58 =C2=B1 15%  sched_debug.cfs_r=
q[32]:/.tg_load_contrib
>     780606 =C2=B1  7%      -7.6%     721141 =C2=B1  5%  sched_debug.cpu#4=
3.avg_idle
>     111634 =C2=B1  4%     -12.2%      97988 =C2=B1 10%  sched_debug.cpu#3=
2.nr_load_updates
>       0.93 =C2=B1  8%     -20.4%       0.74 =C2=B1 27%  perf-profile.cpu-=
cycles.shmem_write_begin.generic_perform_write.__generic_file_write_iter.ge=
neric_file_write_iter.new_sync_write
>     774084 =C2=B1  8%      -8.3%     710179 =C2=B1  4%  sched_debug.cpu#3=
9.avg_idle
>        200 =C2=B1  9%     -16.7%        166 =C2=B1  8%  numa-vmstat.node3=
.nr_unevictable
>        200 =C2=B1  9%     -16.7%        166 =C2=B1  8%  numa-vmstat.node3=
.nr_mlock
>        672 =C2=B1 12%     -12.5%        588 =C2=B1 18%  slabinfo.xfs_buf.=
active_objs
>        672 =C2=B1 12%     -12.5%        588 =C2=B1 18%  slabinfo.xfs_buf.=
num_objs
>     711853 =C2=B1  1%     -12.6%     622436 =C2=B1  7%  sched_debug.cpu#3=
7.avg_idle
>      42208 =C2=B1  2%     +26.6%      53451 =C2=B1  9%  sched_debug.cpu#1=
4.nr_load_updates
>      43074 =C2=B1  5%     +31.3%      56552 =C2=B1  8%  sched_debug.cpu#1=
3.nr_load_updates
>     774013 =C2=B1  6%     -10.1%     696106 =C2=B1  9%  sched_debug.cpu#2=
0.avg_idle
>     742537 =C2=B1  4%     -12.4%     650469 =C2=B1  9%  sched_debug.cpu#8=
.avg_idle
>     657723 =C2=B1  5%     -10.2%     590877 =C2=B1  8%  sched_debug.cpu#6=
.avg_idle
>     779627 =C2=B1  1%     -15.0%     662459 =C2=B1 14%  sched_debug.cpu#2=
4.avg_idle
>      43298 =C2=B1  2%     +25.2%      54214 =C2=B1 12%  sched_debug.cpu#1=
8.nr_load_updates
>      40657 =C2=B1  1%     +11.9%      45515 =C2=B1  8%  sched_debug.cpu#1=
5.nr_load_updates
>     652300 =C2=B1  5%      -8.3%     598417 =C2=B1  2%  sched_debug.cpu#5=
8.avg_idle
>     870884 =C2=B1  4%     -12.9%     758163 =C2=B1  5%  sched_debug.cpu#3=
1.avg_idle
>      44351 =C2=B1  2%     +31.7%      58432 =C2=B1 19%  sched_debug.cpu#2=
4.nr_load_updates
>     763225 =C2=B1  4%     -15.6%     644390 =C2=B1 11%  sched_debug.cpu#1=
2.avg_idle
>     776029 =C2=B1  0%     -13.1%     674169 =C2=B1  8%  sched_debug.cpu#1=
8.avg_idle
>     838004 =C2=B1  2%     -15.9%     704595 =C2=B1  6%  sched_debug.cpu#3=
0.avg_idle
>        193 =C2=B1  3%     -14.3%        165 =C2=B1 11%  sched_debug.cpu#5=
8.ttwu_local
>      54047 =C2=B1  1%      -8.8%      49303 =C2=B1  5%  numa-meminfo.node=
0.Slab
>       1.24 =C2=B1  2%     -19.2%       1.00 =C2=B1  9%  perf-profile.cpu-=
cycles.osq_unlock.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.ge=
neric_file_write_iter
>      40061 =C2=B1  0%     +12.7%      45154 =C2=B1  5%  sched_debug.cpu#2=
3.nr_load_updates
>     795000 =C2=B1  0%     -14.5%     679866 =C2=B1  9%  sched_debug.cpu#1=
3.avg_idle
>     752969 =C2=B1  1%     -11.2%     668306 =C2=B1  5%  sched_debug.cpu#1=
4.avg_idle
>     148074 =C2=B1  4%      -9.5%     133968 =C2=B1  5%  numa-numastat.nod=
e0.local_node
>     298993 =C2=B1  1%      -9.6%     270299 =C2=B1  7%  softirqs.RCU
>     835755 =C2=B1  0%     -11.4%     740167 =C2=B1  8%  sched_debug.cpu#2=
3.avg_idle
>     156339 =C2=B1  4%      -9.0%     142236 =C2=B1  5%  numa-numastat.nod=
e0.numa_hit
>       1785 =C2=B1  5%      -8.0%       1642 =C2=B1  3%  slabinfo.sock_ino=
de_cache.active_objs
>       1785 =C2=B1  5%      -8.0%       1642 =C2=B1  3%  slabinfo.sock_ino=
de_cache.num_objs
>     238242 =C2=B1  3%      -9.7%     215107 =C2=B1  2%  numa-vmstat.node0=
.numa_local
>     826398 =C2=B1  5%      -7.2%     766511 =C2=B1  9%  sched_debug.cpu#1=
9.avg_idle
>     245728 =C2=B1  3%      -9.4%     222564 =C2=B1  2%  numa-vmstat.node0=
.numa_hit
>       1022 =C2=B1  2%      -8.7%        932 =C2=B1  5%  slabinfo.RAW.num_=
objs
>       1022 =C2=B1  2%      -8.7%        932 =C2=B1  5%  slabinfo.RAW.acti=
ve_objs
>     904008 =C2=B1  2%     -16.3%     756394 =C2=B1 18%  sched_debug.cpu#2=
9.avg_idle
>     850180 =C2=B1  0%     -10.3%     762690 =C2=B1  5%  sched_debug.cpu#2=
5.avg_idle
>      15949 =C2=B1  1%      -7.4%      14765 =C2=B1  3%  slabinfo.anon_vma=
.active_objs
>      15949 =C2=B1  1%      -7.4%      14765 =C2=B1  3%  slabinfo.anon_vma=
.num_objs
>         38 =C2=B1 24%     +46.5%         56 =C2=B1 13%  sched_debug.cfs_r=
q[48]:/.blocked_load_avg
>       1179 =C2=B1  3%      -5.1%       1118 =C2=B1  5%  numa-vmstat.node0=
.nr_alloc_batch
>      14112 =C2=B1  3%     +40.5%      19822 =C2=B1 11%  vmstat.system.in
> =

> testbox/testcase/testparams: lkp-nex06/vm-scalability/performance-300s-sm=
all-allocs
> =

> 507e1fa697097b48  75cbe701a4251fcd8b846d52ae  =

> ----------------  --------------------------  =

>       1.35 =C2=B1 17%     -56.0%       0.59 =C2=B1 10%  vm-scalability.st=
ddev
>    8850363 =C2=B1  0%     -19.9%    7092322 =C2=B1  0%  vm-scalability.th=
roughput
>        136 =C2=B1 11%    +429.6%        720 =C2=B1  5%  sched_debug.cfs_r=
q[41]:/.tg_runnable_contrib
>          2 =C2=B1 35%    +575.0%         13 =C2=B1 12%  sched_debug.cpu#4=
1.cpu_load[4]
>       6253 =C2=B1 11%    +429.4%      33102 =C2=B1  5%  sched_debug.cfs_r=
q[41]:/.avg->runnable_avg_sum
>     407488 =C2=B1 11%   +1302.5%    5714993 =C2=B1  1%  sched_debug.cfs_r=
q[40]:/.min_vruntime
>      20998 =C2=B1  4%    +487.3%     123327 =C2=B1  2%  sched_debug.cfs_r=
q[40]:/.exec_clock
>     548704 =C2=B1 13%    +945.3%    5735835 =C2=B1  1%  sched_debug.cfs_r=
q[39]:/.min_vruntime
>    1121563 =C2=B1  6%    +439.2%    6047753 =C2=B1  2%  sched_debug.cfs_r=
q[0]:/.min_vruntime
>     757728 =C2=B1 12%    +716.5%    6186567 =C2=B1  1%  sched_debug.cfs_r=
q[63]:/.min_vruntime
>          2 =C2=B1 19%    +422.2%         11 =C2=B1  9%  sched_debug.cpu#4=
2.cpu_load[4]
>    1112970 =C2=B1  8%    +446.4%    6081015 =C2=B1  0%  sched_debug.cfs_r=
q[1]:/.min_vruntime
>          2 =C2=B1 35%    +500.0%         12 =C2=B1  5%  sched_debug.cpu#3=
7.cpu_load[4]
>     555081 =C2=B1 11%    +934.1%    5740165 =C2=B1  1%  sched_debug.cfs_r=
q[36]:/.min_vruntime
>     566546 =C2=B1  9%    +919.3%    5774630 =C2=B1  0%  sched_debug.cfs_r=
q[35]:/.min_vruntime
>      21140 =C2=B1 15%    +476.2%     121799 =C2=B1  1%  sched_debug.cfs_r=
q[43]:/.exec_clock
>    1113551 =C2=B1  7%    +440.8%    6022454 =C2=B1  1%  sched_debug.cfs_r=
q[4]:/.min_vruntime
>     409522 =C2=B1 17%   +1278.1%    5643706 =C2=B1  1%  sched_debug.cfs_r=
q[43]:/.min_vruntime
>     564685 =C2=B1 11%    +912.5%    5717371 =C2=B1  1%  sched_debug.cfs_r=
q[33]:/.min_vruntime
>     588577 =C2=B1 12%    +879.1%    5762530 =C2=B1  2%  sched_debug.cfs_r=
q[32]:/.min_vruntime
>     510891 =C2=B1  2%     -86.1%      70759 =C2=B1  1%  sched_debug.cpu#3=
1.ttwu_count
>     467778 =C2=B1  4%     -87.5%      58637 =C2=B1  4%  sched_debug.cpu#3=
1.sched_goidle
>     936797 =C2=B1  4%     -87.0%     121998 =C2=B1  4%  sched_debug.cpu#3=
1.nr_switches
>     519499 =C2=B1  2%     -86.5%      70274 =C2=B1  1%  sched_debug.cpu#3=
0.ttwu_count
>     506902 =C2=B1  4%     -87.5%      63322 =C2=B1  1%  sched_debug.cpu#3=
0.sched_goidle
>    1031191 =C2=B1  3%     -87.1%     133375 =C2=B1  1%  sched_debug.cpu#3=
0.sched_count
>      20787 =C2=B1 20%    +493.7%     123415 =C2=B1  2%  sched_debug.cfs_r=
q[44]:/.exec_clock
>     409766 =C2=B1 21%   +1295.5%    5718172 =C2=B1  3%  sched_debug.cfs_r=
q[44]:/.min_vruntime
>    1015080 =C2=B1  4%     -87.0%     131581 =C2=B1  1%  sched_debug.cpu#3=
0.nr_switches
>        127 =C2=B1 25%    +455.2%        709 =C2=B1  2%  sched_debug.cfs_r=
q[44]:/.tg_runnable_contrib
>    1057283 =C2=B1  7%    +462.5%    5947320 =C2=B1  3%  sched_debug.cfs_r=
q[8]:/.min_vruntime
>       5880 =C2=B1 25%    +453.7%      32564 =C2=B1  2%  sched_debug.cfs_r=
q[44]:/.avg->runnable_avg_sum
>     507560 =C2=B1  3%     -85.8%      71967 =C2=B1  1%  sched_debug.cpu#2=
8.ttwu_count
>     529976 =C2=B1  2%     -88.3%      61987 =C2=B1  2%  sched_debug.cpu#2=
8.sched_goidle
>    1081294 =C2=B1  1%     -87.9%     130386 =C2=B1  2%  sched_debug.cpu#2=
8.sched_count
>    1061187 =C2=B1  2%     -87.8%     129262 =C2=B1  2%  sched_debug.cpu#2=
8.nr_switches
>     450376 =C2=B1 19%   +1167.0%    5706353 =C2=B1  2%  sched_debug.cfs_r=
q[45]:/.min_vruntime
>          1 =C2=B1 34%    +240.0%          4 =C2=B1 30%  sched_debug.cfs_r=
q[45]:/.nr_spread_over
>     516365 =C2=B1  2%     -86.1%      71689 =C2=B1  1%  sched_debug.cpu#2=
7.ttwu_count
>     467103 =C2=B1  4%     -87.1%      60129 =C2=B1  5%  sched_debug.cpu#2=
7.sched_goidle
>     935433 =C2=B1  4%     -86.6%     125428 =C2=B1  5%  sched_debug.cpu#2=
7.nr_switches
>    1054821 =C2=B1  2%     -87.2%     134954 =C2=B1  6%  sched_debug.cpu#2=
6.sched_count
>    1283469 =C2=B1  7%    +411.7%    6568077 =C2=B1  0%  sched_debug.cfs_r=
q[25]:/.min_vruntime
>      19517 =C2=B1 19%    +522.5%     121491 =C2=B1  1%  sched_debug.cfs_r=
q[46]:/.exec_clock
>     387725 =C2=B1 23%   +1349.9%    5621538 =C2=B1  1%  sched_debug.cfs_r=
q[46]:/.min_vruntime
>        130 =C2=B1 16%    +463.8%        735 =C2=B1  6%  sched_debug.cfs_r=
q[46]:/.tg_runnable_contrib
>    1296121 =C2=B1  7%    +412.8%    6646523 =C2=B1  0%  sched_debug.cfs_r=
q[24]:/.min_vruntime
>     521743 =C2=B1  4%     -85.6%      75227 =C2=B1  0%  sched_debug.cpu#2=
4.ttwu_count
>     523738 =C2=B1  1%     -87.9%      63237 =C2=B1  4%  sched_debug.cpu#2=
4.sched_goidle
>    1060028 =C2=B1  0%     -87.3%     134602 =C2=B1  5%  sched_debug.cpu#2=
4.sched_count
>       6007 =C2=B1 16%    +463.6%      33854 =C2=B1  6%  sched_debug.cfs_r=
q[46]:/.avg->runnable_avg_sum
>    1048862 =C2=B1  1%     -87.4%     132535 =C2=B1  5%  sched_debug.cpu#2=
4.nr_switches
>     415579 =C2=B1  1%     -84.0%      66558 =C2=B1  1%  sched_debug.cpu#2=
3.ttwu_count
>     399591 =C2=B1  3%     -83.8%      64773 =C2=B1  1%  sched_debug.cpu#2=
3.sched_goidle
>     802364 =C2=B1  3%     -82.0%     144403 =C2=B1  6%  sched_debug.cpu#2=
3.sched_count
>     800051 =C2=B1  3%     -83.2%     134420 =C2=B1  0%  sched_debug.cpu#2=
3.nr_switches
>    1088620 =C2=B1  9%    +445.7%    5940679 =C2=B1  1%  sched_debug.cfs_r=
q[22]:/.min_vruntime
>    1034659 =C2=B1  8%    +474.7%    5946605 =C2=B1  0%  sched_debug.cfs_r=
q[13]:/.min_vruntime
>     417590 =C2=B1  1%     -83.8%      67501 =C2=B1  2%  sched_debug.cpu#2=
2.ttwu_count
>     430636 =C2=B1  4%     -83.5%      70888 =C2=B1  3%  sched_debug.cpu#2=
2.sched_goidle
>     865193 =C2=B1  4%     -81.4%     160862 =C2=B1  9%  sched_debug.cpu#2=
2.sched_count
>    1052369 =C2=B1  8%    +466.8%    5965329 =C2=B1  1%  sched_debug.cfs_r=
q[14]:/.min_vruntime
>     862183 =C2=B1  4%     -83.0%     146429 =C2=B1  3%  sched_debug.cpu#2=
2.nr_switches
>     750218 =C2=B1 13%    +733.4%    6252541 =C2=B1  1%  sched_debug.cfs_r=
q[62]:/.min_vruntime
>      19311 =C2=B1 11%    +527.4%     121159 =C2=B1  0%  sched_debug.cfs_r=
q[47]:/.exec_clock
>     387976 =C2=B1 13%   +1346.7%    5612772 =C2=B1  1%  sched_debug.cfs_r=
q[47]:/.min_vruntime
>     409721 =C2=B1  3%     -83.7%      66715 =C2=B1  1%  sched_debug.cpu#2=
1.ttwu_count
>     407184 =C2=B1  2%     -83.2%      68502 =C2=B1 11%  sched_debug.cpu#2=
1.sched_goidle
>         20 =C2=B1 40%    +379.3%         98 =C2=B1 30%  sched_debug.cpu#2=
1.nr_uninterruptible
>     815235 =C2=B1  2%     -82.5%     142411 =C2=B1 11%  sched_debug.cpu#2=
1.nr_switches
>    1080091 =C2=B1  9%    +455.0%    5994880 =C2=B1  1%  sched_debug.cfs_r=
q[20]:/.min_vruntime
>     415446 =C2=B1  1%     -83.8%      67443 =C2=B1  2%  sched_debug.cpu#2=
0.ttwu_count
>     442408 =C2=B1  1%     -84.4%      68875 =C2=B1  1%  sched_debug.cpu#2=
0.sched_goidle
>     888757 =C2=B1  1%     -82.5%     155372 =C2=B1  7%  sched_debug.cpu#2=
0.sched_count
>     885847 =C2=B1  1%     -83.9%     142506 =C2=B1  1%  sched_debug.cpu#2=
0.nr_switches
>    1091055 =C2=B1  9%    +453.4%    6038436 =C2=B1  1%  sched_debug.cfs_r=
q[19]:/.min_vruntime
>     417773 =C2=B1  1%     -83.9%      67398 =C2=B1  1%  sched_debug.cpu#1=
9.ttwu_count
>     398066 =C2=B1  3%     -83.9%      63958 =C2=B1  2%  sched_debug.cpu#1=
9.sched_goidle
>     500150 =C2=B1 16%   +1041.3%    5708010 =C2=B1  1%  sched_debug.cfs_r=
q[48]:/.min_vruntime
>         17 =C2=B1 33%    +360.6%         81 =C2=B1 16%  sched_debug.cpu#1=
9.nr_uninterruptible
>     797029 =C2=B1  3%     -83.4%     132566 =C2=B1  2%  sched_debug.cpu#1=
9.nr_switches
>        133 =C2=B1 25%    +446.0%        727 =C2=B1  3%  sched_debug.cfs_r=
q[48]:/.tg_runnable_contrib
>    1093025 =C2=B1  9%    +448.3%    5993418 =C2=B1  1%  sched_debug.cfs_r=
q[18]:/.min_vruntime
>     417854 =C2=B1  1%     -84.0%      66789 =C2=B1  2%  sched_debug.cpu#1=
8.ttwu_count
>     428863 =C2=B1  3%     -84.3%      67425 =C2=B1  3%  sched_debug.cpu#1=
8.sched_goidle
>     860091 =C2=B1  2%     -79.7%     174594 =C2=B1 28%  sched_debug.cpu#1=
8.sched_count
>     858626 =C2=B1  3%     -83.7%     139729 =C2=B1  3%  sched_debug.cpu#1=
8.nr_switches
>       6134 =C2=B1 25%    +445.2%      33448 =C2=B1  3%  sched_debug.cfs_r=
q[48]:/.avg->runnable_avg_sum
>    1069314 =C2=B1  8%    +465.0%    6041367 =C2=B1  0%  sched_debug.cfs_r=
q[17]:/.min_vruntime
>    1084018 =C2=B1  8%    +455.3%    6020039 =C2=B1  1%  sched_debug.cfs_r=
q[16]:/.min_vruntime
>     415085 =C2=B1  3%     -83.5%      68307 =C2=B1  2%  sched_debug.cpu#1=
6.ttwu_count
>    1073942 =C2=B1  8%    +447.6%    5881393 =C2=B1  2%  sched_debug.cfs_r=
q[21]:/.min_vruntime
>     435899 =C2=B1  1%     -83.8%      70769 =C2=B1  2%  sched_debug.cpu#1=
6.sched_goidle
>     876150 =C2=B1  1%     -78.0%     193078 =C2=B1 38%  sched_debug.cpu#1=
6.sched_count
>     872710 =C2=B1  1%     -83.2%     146906 =C2=B1  2%  sched_debug.cpu#1=
6.nr_switches
>    1042616 =C2=B1 10%    +470.0%    5943066 =C2=B1  0%  sched_debug.cfs_r=
q[15]:/.min_vruntime
>     392967 =C2=B1  3%     -81.6%      72239 =C2=B1  3%  sched_debug.cpu#1=
5.ttwu_count
>     380826 =C2=B1  2%     -81.3%      71372 =C2=B1  2%  sched_debug.cpu#1=
5.sched_goidle
>     762638 =C2=B1  2%     -80.4%     149503 =C2=B1  2%  sched_debug.cpu#1=
5.nr_switches
>     395697 =C2=B1  3%     -81.9%      71526 =C2=B1  3%  sched_debug.cpu#1=
4.ttwu_count
>     411944 =C2=B1  3%     -82.5%      72082 =C2=B1  1%  sched_debug.cpu#1=
4.sched_goidle
>     834606 =C2=B1  2%     -80.6%     162017 =C2=B1  5%  sched_debug.cpu#1=
4.sched_count
>         13 =C2=B1 26%    +463.0%         76 =C2=B1 34%  sched_debug.cpu#2=
3.nr_uninterruptible
>     824706 =C2=B1  3%     -81.8%     150178 =C2=B1  2%  sched_debug.cpu#1=
4.nr_switches
>     390571 =C2=B1  3%     -81.8%      71105 =C2=B1  2%  sched_debug.cpu#1=
3.ttwu_count
>     384103 =C2=B1  2%     -81.6%      70579 =C2=B1  1%  sched_debug.cpu#1=
3.sched_goidle
>     785013 =C2=B1  2%     -80.3%     155000 =C2=B1  3%  sched_debug.cpu#1=
3.sched_count
>    1090952 =C2=B1  9%    +444.6%    5941241 =C2=B1  1%  sched_debug.cfs_r=
q[23]:/.min_vruntime
>     512564 =C2=B1 14%   +1013.4%    5706910 =C2=B1  1%  sched_debug.cfs_r=
q[50]:/.min_vruntime
>     769118 =C2=B1  2%     -80.8%     147440 =C2=B1  2%  sched_debug.cpu#1=
3.nr_switches
>          1 =C2=B1 34%    +280.0%          4 =C2=B1 31%  sched_debug.cfs_r=
q[12]:/.nr_spread_over
>    1044080 =C2=B1  7%    +462.3%    5871045 =C2=B1  2%  sched_debug.cfs_r=
q[12]:/.min_vruntime
>     391582 =C2=B1  3%     -81.7%      71718 =C2=B1  3%  sched_debug.cpu#1=
2.ttwu_count
>     421874 =C2=B1  2%     -81.5%      77886 =C2=B1  9%  sched_debug.cpu#1=
2.sched_goidle
>     862416 =C2=B1  2%     -79.9%     172919 =C2=B1 13%  sched_debug.cpu#1=
2.sched_count
>     844625 =C2=B1  2%     -80.7%     162752 =C2=B1  9%  sched_debug.cpu#1=
2.nr_switches
>    1058728 =C2=B1  8%    +465.3%    5985054 =C2=B1  0%  sched_debug.cfs_r=
q[11]:/.min_vruntime
>         16 =C2=B1 33%    +662.7%        127 =C2=B1 22%  sched_debug.cpu#1=
1.nr_uninterruptible
>    1062298 =C2=B1  8%    +464.6%    5997504 =C2=B1  1%  sched_debug.cfs_r=
q[10]:/.min_vruntime
>     517857 =C2=B1 19%   +1001.2%    5702462 =C2=B1  1%  sched_debug.cfs_r=
q[51]:/.min_vruntime
>    1048051 =C2=B1  7%    +471.3%    5987193 =C2=B1  1%  sched_debug.cfs_r=
q[9]:/.min_vruntime
>     392612 =C2=B1  3%     -81.3%      73222 =C2=B1  2%  sched_debug.cpu#9=
.ttwu_count
>     384344 =C2=B1  1%     -81.0%      73003 =C2=B1  6%  sched_debug.cpu#9=
.sched_goidle
>     740882 =C2=B1 11%    +736.6%    6197903 =C2=B1  1%  sched_debug.cfs_r=
q[61]:/.min_vruntime
>     957109 =C2=B1  3%     -86.7%     127218 =C2=B1  5%  sched_debug.cpu#2=
7.sched_count
>         18 =C2=B1 47%    +529.7%        116 =C2=B1 23%  sched_debug.cpu#9=
.nr_uninterruptible
>     769524 =C2=B1  1%     -80.3%     151526 =C2=B1  6%  sched_debug.cpu#9=
.nr_switches
>     399029 =C2=B1  3%     -82.0%      71669 =C2=B1  0%  sched_debug.cpu#8=
.ttwu_count
>     420425 =C2=B1  1%     -81.0%      79992 =C2=B1 10%  sched_debug.cpu#8=
.sched_goidle
>     843535 =C2=B1  1%     -80.3%     166159 =C2=B1 10%  sched_debug.cpu#8=
.nr_switches
>    1117965 =C2=B1  8%    +435.3%    5984125 =C2=B1  0%  sched_debug.cfs_r=
q[7]:/.min_vruntime
>     511997 =C2=B1  9%   +1015.9%    5713356 =C2=B1  0%  sched_debug.cfs_r=
q[52]:/.min_vruntime
>    1119452 =C2=B1  8%    +438.3%    6025524 =C2=B1  1%  sched_debug.cfs_r=
q[6]:/.min_vruntime
>    1107077 =C2=B1  7%    +438.6%    5963136 =C2=B1  1%  sched_debug.cfs_r=
q[5]:/.min_vruntime
>          2 =C2=B1 35%    +550.0%         13 =C2=B1  5%  sched_debug.cpu#5=
3.cpu_load[4]
>     507924 =C2=B1 15%   +1034.2%    5760828 =C2=B1  1%  sched_debug.cfs_r=
q[53]:/.min_vruntime
>     462841 =C2=B1  3%     -85.0%      69313 =C2=B1  4%  sched_debug.cpu#4=
.sched_goidle
>     978113 =C2=B1  7%     -84.5%     151685 =C2=B1  7%  sched_debug.cpu#4=
.sched_count
>     926708 =C2=B1  3%     -84.5%     143697 =C2=B1  5%  sched_debug.cpu#4=
.nr_switches
>    1122648 =C2=B1  9%    +435.9%    6016455 =C2=B1  1%  sched_debug.cfs_r=
q[3]:/.min_vruntime
>     941488 =C2=B1  4%     -86.9%     123539 =C2=B1  3%  sched_debug.cpu#3=
1.sched_count
>     430229 =C2=B1  2%     -83.3%      71773 =C2=B1  1%  sched_debug.cpu#3=
.ttwu_count
>     415077 =C2=B1  4%     -83.8%      67085 =C2=B1  4%  sched_debug.cpu#3=
.sched_goidle
>          2 =C2=B1 50%    +575.0%         13 =C2=B1 12%  sched_debug.cpu#5=
4.cpu_load[4]
>     514866 =C2=B1 15%   +1015.3%    5742085 =C2=B1  1%  sched_debug.cfs_r=
q[54]:/.min_vruntime
>     831241 =C2=B1  4%     -83.2%     139398 =C2=B1  4%  sched_debug.cpu#3=
.nr_switches
>    1132874 =C2=B1  9%    +434.5%    6055152 =C2=B1  1%  sched_debug.cfs_r=
q[2]:/.min_vruntime
>     396510 =C2=B1 13%   +1326.7%    5656886 =C2=B1  1%  sched_debug.cfs_r=
q[41]:/.min_vruntime
>     510648 =C2=B1 17%   +1017.0%    5703966 =C2=B1  0%  sched_debug.cfs_r=
q[55]:/.min_vruntime
>     432018 =C2=B1  2%     -82.4%      76046 =C2=B1  1%  sched_debug.cpu#1=
.ttwu_count
>     435032 =C2=B1  3%     -84.2%      68773 =C2=B1  5%  sched_debug.cpu#1=
.sched_goidle
>     898167 =C2=B1  6%     -82.8%     154598 =C2=B1  9%  sched_debug.cpu#1=
.sched_count
>     871402 =C2=B1  3%     -83.6%     143032 =C2=B1  5%  sched_debug.cpu#1=
.nr_switches
>     439884 =C2=B1  3%     -81.6%      81117 =C2=B1  0%  sched_debug.cpu#0=
.ttwu_count
>     467463 =C2=B1  4%     -83.4%      77658 =C2=B1 11%  sched_debug.cpu#0=
.sched_goidle
>     968052 =C2=B1  5%     -79.3%     200488 =C2=B1 26%  sched_debug.cpu#0=
.sched_count
>     939022 =C2=B1  4%     -82.6%     163789 =C2=B1 11%  sched_debug.cpu#0=
.nr_switches
>     728509 =C2=B1  9%    +763.8%    6292757 =C2=B1  0%  sched_debug.cfs_r=
q[56]:/.min_vruntime
>     733898 =C2=B1 12%    +758.7%    6302006 =C2=B1  1%  sched_debug.cfs_r=
q[57]:/.min_vruntime
>     752642 =C2=B1 12%    +739.9%    6321565 =C2=B1  1%  sched_debug.cfs_r=
q[58]:/.min_vruntime
>   34452061 =C2=B1  0%     -82.4%    6069487 =C2=B1  0%  cpuidle.C1-NHM.us=
age
>     563860 =C2=B1 14%    +920.1%    5751802 =C2=B1  0%  sched_debug.cfs_r=
q[37]:/.min_vruntime
>     753969 =C2=B1 10%    +729.8%    6256638 =C2=B1  0%  sched_debug.cfs_r=
q[59]:/.min_vruntime
>          3 =C2=B1  0%    +416.7%         15 =C2=B1  3%  sched_debug.cpu#5=
7.cpu_load[4]
>     522652 =C2=B1 15%    +986.5%    5678738 =C2=B1  1%  sched_debug.cfs_r=
q[49]:/.min_vruntime
>          3 =C2=B1 23%    +375.0%         14 =C2=B1 10%  sched_debug.cpu#6=
0.cpu_load[4]
>     735034 =C2=B1 12%    +746.0%    6218721 =C2=B1  1%  sched_debug.cfs_r=
q[60]:/.min_vruntime
>     419503 =C2=B1 25%   +1238.4%    5614621 =C2=B1  0%  sched_debug.cfs_r=
q[42]:/.min_vruntime
>      20513 =C2=B1 10%    +496.7%     122398 =C2=B1  0%  sched_debug.cfs_r=
q[41]:/.exec_clock
>    1278013 =C2=B1  7%    +402.3%    6419733 =C2=B1  0%  sched_debug.cfs_r=
q[29]:/.min_vruntime
>    1288072 =C2=B1  8%    +401.4%    6458783 =C2=B1  1%  sched_debug.cfs_r=
q[27]:/.min_vruntime
>    1289452 =C2=B1  8%    +402.9%    6484674 =C2=B1  0%  sched_debug.cfs_r=
q[26]:/.min_vruntime
>    1273611 =C2=B1  8%    +405.4%    6436316 =C2=B1  0%  sched_debug.cfs_r=
q[28]:/.min_vruntime
>     883280 =C2=B1  6%     -80.0%     176592 =C2=B1  8%  sched_debug.cpu#8=
.sched_count
>        143 =C2=B1 25%    +392.9%        708 =C2=B1  2%  sched_debug.cfs_r=
q[50]:/.tg_runnable_contrib
>       6628 =C2=B1 25%    +391.8%      32593 =C2=B1  2%  sched_debug.cfs_r=
q[50]:/.avg->runnable_avg_sum
>    1273326 =C2=B1  8%    +402.6%    6399707 =C2=B1  1%  sched_debug.cfs_r=
q[31]:/.min_vruntime
>     819313 =C2=B1  1%     -80.6%     159234 =C2=B1 14%  sched_debug.cpu#2=
1.sched_count
>    1288398 =C2=B1  8%    +394.4%    6370426 =C2=B1  0%  sched_debug.cfs_r=
q[30]:/.min_vruntime
>     798719 =C2=B1  4%     -79.7%     162260 =C2=B1 11%  sched_debug.cpu#9=
.sched_count
>        426 =C2=B1 14%    +391.4%       2093 =C2=B1 14%  sched_debug.cpu#4=
7.ttwu_local
>        502 =C2=B1 43%    +296.1%       1991 =C2=B1 10%  sched_debug.cpu#3=
3.curr->pid
>        151 =C2=B1 12%    +375.9%        721 =C2=B1  7%  sched_debug.cfs_r=
q[54]:/.tg_runnable_contrib
>       6970 =C2=B1 12%    +375.1%      33114 =C2=B1  6%  sched_debug.cfs_r=
q[54]:/.avg->runnable_avg_sum
>        394 =C2=B1 33%    +379.3%       1890 =C2=B1  6%  sched_debug.cpu#4=
8.curr->pid
>          2 =C2=B1 36%    +477.8%         13 =C2=B1 19%  sched_debug.cpu#4=
9.cpu_load[4]
>          2 =C2=B1 20%    +420.0%         13 =C2=B1  9%  sched_debug.cpu#5=
1.cpu_load[4]
>          3 =C2=B1 33%    +323.1%         13 =C2=B1 10%  sched_debug.cpu#3=
8.cpu_load[4]
>          2 =C2=B1 39%    +390.9%         13 =C2=B1  3%  sched_debug.cfs_r=
q[48]:/.runnable_load_avg
>          2 =C2=B1 39%    +372.7%         13 =C2=B1 19%  sched_debug.cpu#4=
9.cpu_load[3]
>     251433 =C2=B1  3%     -78.1%      55111 =C2=B1  4%  sched_debug.cpu#6=
1.sched_goidle
>     251186 =C2=B1  2%     -78.1%      54906 =C2=B1  4%  sched_debug.cpu#6=
3.sched_goidle
>     269668 =C2=B1  4%     -78.0%      59278 =C2=B1  2%  sched_debug.cpu#6=
0.sched_goidle
>      27195 =C2=B1 12%    +352.0%     122916 =C2=B1  0%  sched_debug.cfs_r=
q[55]:/.exec_clock
>       5673 =C2=B1 19%    +423.4%      29691 =C2=B1  5%  sched_debug.cfs_r=
q[47]:/.avg->runnable_avg_sum
>        123 =C2=B1 19%    +425.0%        645 =C2=B1  5%  sched_debug.cfs_r=
q[47]:/.tg_runnable_contrib
>     861367 =C2=B1  8%     -82.7%     148638 =C2=B1 10%  sched_debug.cpu#7=
.sched_count
>      27168 =C2=B1 11%    +355.5%     123756 =C2=B1  0%  sched_debug.cfs_r=
q[54]:/.exec_clock
>      27600 =C2=B1 15%    +345.5%     122946 =C2=B1  1%  sched_debug.cfs_r=
q[51]:/.exec_clock
>      23537 =C2=B1 15%    +422.8%     123064 =C2=B1  1%  sched_debug.cfs_r=
q[45]:/.exec_clock
>     862841 =C2=B1  7%     -82.4%     151999 =C2=B1  8%  sched_debug.cpu#3=
.sched_count
>     504662 =C2=B1  4%     -77.1%     115592 =C2=B1  4%  sched_debug.cpu#6=
1.sched_count
>     503667 =C2=B1  3%     -77.3%     114372 =C2=B1  4%  sched_debug.cpu#6=
1.nr_switches
>     264568 =C2=B1  1%     -77.6%      59369 =C2=B1  0%  sched_debug.cpu#6=
2.sched_goidle
>     503203 =C2=B1  2%     -77.3%     113986 =C2=B1  4%  sched_debug.cpu#6=
3.nr_switches
>     503461 =C2=B1  2%     -77.2%     114736 =C2=B1  4%  sched_debug.cpu#6=
3.sched_count
>     540170 =C2=B1  4%     -77.3%     122790 =C2=B1  2%  sched_debug.cpu#6=
0.nr_switches
>     540222 =C2=B1  4%     -77.2%     122950 =C2=B1  3%  sched_debug.cpu#6=
0.sched_count
>      26706 =C2=B1 12%    +364.5%     124058 =C2=B1  1%  sched_debug.cfs_r=
q[53]:/.exec_clock
>     264009 =C2=B1  3%     -77.6%      59237 =C2=B1  5%  sched_debug.cpu#5=
8.sched_goidle
>      27131 =C2=B1  6%    +353.8%     123122 =C2=B1  0%  sched_debug.cfs_r=
q[52]:/.exec_clock
>     253780 =C2=B1  3%     -77.5%      57202 =C2=B1  7%  sched_debug.cpu#5=
9.sched_goidle
>     769924 =C2=B1  2%     -75.5%     188277 =C2=B1 32%  sched_debug.cpu#1=
5.sched_count
>       7048 =C2=B1 14%    +357.6%      32254 =C2=B1  1%  sched_debug.cfs_r=
q[53]:/.avg->runnable_avg_sum
>        153 =C2=B1 14%    +358.2%        702 =C2=B1  1%  sched_debug.cfs_r=
q[53]:/.tg_runnable_contrib
>     529978 =C2=B1  1%     -76.8%     122764 =C2=B1  0%  sched_debug.cpu#6=
2.nr_switches
>          2 =C2=B1 30%    +372.7%         13 =C2=B1  5%  sched_debug.cpu#5=
2.cpu_load[4]
>          3 =C2=B1 23%    +325.0%         12 =C2=B1  6%  sched_debug.cpu#5=
3.cpu_load[3]
>          2 =C2=B1 36%    +477.8%         13 =C2=B1  5%  sched_debug.cpu#3=
3.cpu_load[4]
>          2 =C2=B1 20%    +410.0%         12 =C2=B1  6%  sched_debug.cpu#5=
9.cpu_load[4]
>          3 =C2=B1 40%    +316.7%         12 =C2=B1 14%  sched_debug.cfs_r=
q[49]:/.runnable_load_avg
>          3 =C2=B1 23%    +300.0%         12 =C2=B1 21%  sched_debug.cfs_r=
q[36]:/.runnable_load_avg
>     264953 =C2=B1  3%     -76.9%      61283 =C2=B1  3%  sched_debug.cpu#5=
6.sched_goidle
>      26622 =C2=B1 12%    +361.8%     122941 =C2=B1  1%  sched_debug.cfs_r=
q[48]:/.exec_clock
>        457 =C2=B1 12%    +337.7%       2003 =C2=B1 20%  sched_debug.cpu#3=
6.curr->pid
>     765141 =C2=B1  1%     -79.3%     158075 =C2=B1  7%  sched_debug.cpu#1=
1.sched_count
>     530129 =C2=B1  1%     -76.6%     123998 =C2=B1  1%  sched_debug.cpu#6=
2.sched_count
>        516 =C2=B1 41%    +282.1%       1972 =C2=B1 10%  sched_debug.cpu#5=
4.curr->pid
>      27223 =C2=B1 11%    +351.4%     122887 =C2=B1  1%  sched_debug.cfs_r=
q[50]:/.exec_clock
>     529094 =C2=B1  3%     -76.8%     122624 =C2=B1  5%  sched_debug.cpu#5=
8.nr_switches
>     530320 =C2=B1  3%     -76.6%     123934 =C2=B1  5%  sched_debug.cpu#5=
8.sched_count
>     855966 =C2=B1  5%     -80.6%     166023 =C2=B1  9%  sched_debug.cpu#1=
0.sched_count
>     413120 =C2=B1  2%     -82.1%      73890 =C2=B1  2%  sched_debug.cpu#1=
0.sched_goidle
>     828115 =C2=B1  2%     -81.4%     154252 =C2=B1  3%  sched_debug.cpu#1=
0.nr_switches
>        158 =C2=B1 18%    +360.1%        727 =C2=B1  2%  sched_debug.cfs_r=
q[51]:/.tg_runnable_contrib
>       7287 =C2=B1 18%    +358.8%      33434 =C2=B1  2%  sched_debug.cfs_r=
q[51]:/.avg->runnable_avg_sum
>      29543 =C2=B1 13%    +317.6%     123370 =C2=B1  1%  sched_debug.cfs_r=
q[38]:/.exec_clock
>     555797 =C2=B1  9%    +929.8%    5723364 =C2=B1  1%  sched_debug.cfs_r=
q[34]:/.min_vruntime
>     508378 =C2=B1  3%     -76.6%     118881 =C2=B1  7%  sched_debug.cpu#5=
9.nr_switches
>     508565 =C2=B1  3%     -76.5%     119331 =C2=B1  7%  sched_debug.cpu#5=
9.sched_count
>     275963 =C2=B1  5%     -75.9%      66628 =C2=B1  1%  sched_debug.cpu#6=
3.ttwu_count
>     279203 =C2=B1  2%     -76.0%      67079 =C2=B1  0%  sched_debug.cpu#5=
9.ttwu_count
>     530676 =C2=B1  3%     -76.1%     127010 =C2=B1  3%  sched_debug.cpu#5=
6.nr_switches
>     531314 =C2=B1  4%     -75.8%     128404 =C2=B1  4%  sched_debug.cpu#5=
6.sched_count
>      27764 =C2=B1 12%    +342.0%     122721 =C2=B1  1%  sched_debug.cfs_r=
q[49]:/.exec_clock
>       1327 =C2=B1 12%    +196.1%       3930 =C2=B1 49%  sched_debug.cpu#1=
3.ttwu_local
>     399237 =C2=B1  2%     -81.9%      72338 =C2=B1  3%  sched_debug.cpu#1=
0.ttwu_count
>          4 =C2=B1 25%    +287.5%         15 =C2=B1  5%  sched_debug.cfs_r=
q[57]:/.runnable_load_avg
>     274076 =C2=B1  6%     -75.4%      67499 =C2=B1  0%  sched_debug.cpu#5=
8.ttwu_count
>        158 =C2=B1 19%    +349.8%        714 =C2=B1  3%  sched_debug.cfs_r=
q[52]:/.tg_runnable_contrib
>       7300 =C2=B1 19%    +349.4%      32806 =C2=B1  3%  sched_debug.cfs_r=
q[52]:/.avg->runnable_avg_sum
>      28800 =C2=B1  9%    +329.2%     123619 =C2=B1  0%  sched_debug.cfs_r=
q[39]:/.exec_clock
>     267405 =C2=B1  3%     -75.0%      66863 =C2=B1  0%  sched_debug.cpu#6=
1.ttwu_count
>     264134 =C2=B1  4%     -74.7%      66769 =C2=B1  0%  sched_debug.cpu#6=
0.ttwu_count
>      29402 =C2=B1  6%    +320.8%     123727 =C2=B1  1%  sched_debug.cfs_r=
q[36]:/.exec_clock
>      30362 =C2=B1  4%    +309.9%     124471 =C2=B1  0%  sched_debug.cfs_r=
q[35]:/.exec_clock
>     560496 =C2=B1 16%    +922.0%    5728023 =C2=B1  1%  sched_debug.cfs_r=
q[38]:/.min_vruntime
>          3 =C2=B1 40%    +308.3%         12 =C2=B1 14%  sched_debug.cpu#3=
9.cpu_load[4]
>          2 =C2=B1 44%    +390.0%         12 =C2=B1  3%  sched_debug.cpu#4=
4.cpu_load[4]
>          2 =C2=B1 36%    +444.4%         12 =C2=B1 20%  sched_debug.cpu#3=
6.cpu_load[4]
>          3 =C2=B1 24%    +228.6%         11 =C2=B1 13%  sched_debug.cpu#4=
2.cpu_load[3]
>          5 =C2=B1 34%    +200.0%         15 =C2=B1 12%  sched_debug.cfs_r=
q[61]:/.runnable_load_avg
>          3 =C2=B1 40%    +300.0%         12 =C2=B1  5%  sched_debug.cpu#3=
7.cpu_load[3]
>          4 =C2=B1 17%    +293.8%         15 =C2=B1  6%  sched_debug.cpu#5=
7.cpu_load[0]
>          3 =C2=B1 42%    +228.6%         11 =C2=B1  4%  sched_debug.cfs_r=
q[37]:/.runnable_load_avg
>          4 =C2=B1 43%    +206.2%         12 =C2=B1  8%  sched_debug.cpu#3=
7.cpu_load[1]
>          1 =C2=B1 34%    +160.0%          3 =C2=B1 39%  sched_debug.cfs_r=
q[47]:/.nr_spread_over
>          3 =C2=B1 23%    +291.7%         11 =C2=B1 21%  sched_debug.cpu#3=
6.cpu_load[3]
>     426620 =C2=B1  2%     -83.6%      69920 =C2=B1  1%  sched_debug.cpu#6=
.ttwu_count
>      30042 =C2=B1  8%    +310.5%     123314 =C2=B1  0%  sched_debug.cfs_r=
q[33]:/.exec_clock
>     264870 =C2=B1  4%     -74.4%      67820 =C2=B1  0%  sched_debug.cpu#5=
7.ttwu_count
>        177 =C2=B1 12%    +299.6%        707 =C2=B1  3%  sched_debug.cfs_r=
q[33]:/.tg_runnable_contrib
>     514194 =C2=B1  3%     -85.5%      74348 =C2=B1  1%  sched_debug.cpu#2=
5.ttwu_count
>          3 =C2=B1 45%    +307.7%         13 =C2=B1  6%  sched_debug.cpu#3=
3.cpu_load[2]
>       7350 =C2=B1 11%    +320.9%      30942 =C2=B1  4%  sched_debug.cfs_r=
q[55]:/.avg->runnable_avg_sum
>       8172 =C2=B1 12%    +297.8%      32506 =C2=B1  3%  sched_debug.cfs_r=
q[33]:/.avg->runnable_avg_sum
>     488344 =C2=B1  1%     -88.0%      58541 =C2=B1  5%  sched_debug.cpu#2=
5.sched_goidle
>        159 =C2=B1 11%    +321.4%        673 =C2=B1  3%  sched_debug.cfs_r=
q[55]:/.tg_runnable_contrib
>     978040 =C2=B1  1%     -87.4%     122822 =C2=B1  5%  sched_debug.cpu#2=
5.nr_switches
>          3 =C2=B1 39%    +293.3%         14 =C2=B1  7%  sched_debug.cpu#6=
1.cpu_load[4]
>        510 =C2=B1  8%    +261.4%       1843 =C2=B1  7%  sched_debug.cpu#4=
1.ttwu_local
>      31508 =C2=B1  8%    +294.5%     124313 =C2=B1  2%  sched_debug.cfs_r=
q[32]:/.exec_clock
>       6215 =C2=B1 20%    +420.7%      32363 =C2=B1  4%  sched_debug.cfs_r=
q[43]:/.avg->runnable_avg_sum
>        134 =C2=B1 20%    +423.0%        703 =C2=B1  4%  sched_debug.cfs_r=
q[43]:/.tg_runnable_contrib
>     423696 =C2=B1  1%     -83.7%      69089 =C2=B1  1%  sched_debug.cpu#7=
.ttwu_count
>     985152 =C2=B1  1%     -87.3%     125087 =C2=B1  4%  sched_debug.cpu#2=
5.sched_count
>        176 =C2=B1  7%    +293.3%        693 =C2=B1  7%  sched_debug.cfs_r=
q[39]:/.tg_runnable_contrib
>       8113 =C2=B1  7%    +293.2%      31898 =C2=B1  7%  sched_debug.cfs_r=
q[39]:/.avg->runnable_avg_sum
>        158 =C2=B1 14%    +346.4%        706 =C2=B1 11%  sched_debug.cfs_r=
q[49]:/.tg_runnable_contrib
>        588 =C2=B1 43%    +204.5%       1791 =C2=B1  5%  sched_debug.cpu#4=
2.ttwu_local
>       7280 =C2=B1 14%    +346.0%      32470 =C2=B1 11%  sched_debug.cfs_r=
q[49]:/.avg->runnable_avg_sum
>        189 =C2=B1 11%    +276.3%        711 =C2=B1  2%  sched_debug.cfs_r=
q[32]:/.tg_runnable_contrib
>          3 =C2=B1 22%    +273.3%         14 =C2=B1  8%  sched_debug.cpu#6=
2.cpu_load[4]
>          3 =C2=B1 29%    +266.7%         13 =C2=B1  9%  sched_debug.cfs_r=
q[60]:/.runnable_load_avg
>          4 =C2=B1 38%    +223.5%         13 =C2=B1 11%  sched_debug.cpu#4=
6.cpu_load[3]
>          4 =C2=B1 17%    +250.0%         14 =C2=B1 11%  sched_debug.cpu#6=
0.cpu_load[3]
>          5 =C2=B1 46%    +175.0%         13 =C2=B1 11%  sched_debug.cpu#4=
6.cpu_load[2]
>          6 =C2=B1 19%    +103.7%         13 =C2=B1 13%  sched_debug.cpu#1=
1.cpu_load[0]
>          3 =C2=B1 22%    +286.7%         14 =C2=B1  7%  sched_debug.cpu#5=
8.cpu_load[4]
>          3 =C2=B1 39%    +330.8%         14 =C2=B1 12%  sched_debug.cpu#4=
6.cpu_load[4]
>          3 =C2=B1 33%    +350.0%         13 =C2=B1 15%  sched_debug.cpu#5=
4.cpu_load[3]
>       8706 =C2=B1 11%    +275.5%      32690 =C2=B1  2%  sched_debug.cfs_r=
q[32]:/.avg->runnable_avg_sum
>     415474 =C2=B1  5%     -84.4%      64948 =C2=B1  2%  sched_debug.cpu#7=
.sched_goidle
>     161883 =C2=B1 18%    +221.3%     520122 =C2=B1 28%  sched_debug.cfs_r=
q[25]:/.spread0
>     831974 =C2=B1  5%     -83.8%     135081 =C2=B1  2%  sched_debug.cpu#7=
.nr_switches
>     932620 =C2=B1  9%     -83.7%     151771 =C2=B1  4%  sched_debug.cpu#6=
.sched_count
>     448439 =C2=B1  5%     -84.1%      71489 =C2=B1  4%  sched_debug.cpu#6=
.sched_goidle
>     897830 =C2=B1  5%     -83.5%     148047 =C2=B1  4%  sched_debug.cpu#6=
.nr_switches
>        474 =C2=B1 19%    +304.2%       1916 =C2=B1  4%  sched_debug.cpu#4=
4.ttwu_local
>     408625 =C2=B1  3%     -84.3%      64169 =C2=B1  5%  sched_debug.cpu#1=
7.sched_goidle
>     818333 =C2=B1  3%     -83.7%     133510 =C2=B1  5%  sched_debug.cpu#1=
7.nr_switches
>      57425 =C2=B1  2%    +124.8%     129088 =C2=B1  0%  sched_debug.cfs_r=
q[13]:/.exec_clock
>       9922 =C2=B1  7%    +278.2%      37525 =C2=B1  2%  sched_debug.cfs_r=
q[57]:/.avg->runnable_avg_sum
>        216 =C2=B1  7%    +276.9%        814 =C2=B1  2%  sched_debug.cfs_r=
q[57]:/.tg_runnable_contrib
>      57426 =C2=B1  6%    +127.5%     130639 =C2=B1  2%  sched_debug.cfs_r=
q[15]:/.exec_clock
>     409805 =C2=B1  3%     -83.5%      67449 =C2=B1  2%  sched_debug.cpu#1=
7.ttwu_count
>        646 =C2=B1 25%    +207.4%       1987 =C2=B1 10%  sched_debug.cpu#7=
.curr->pid
>        553 =C2=B1  8%    +280.4%       2104 =C2=B1 12%  sched_debug.cpu#3=
8.curr->pid
>          7 =C2=B1 17%     +92.9%         13 =C2=B1 15%  sched_debug.cpu#1=
1.cpu_load[1]
>          6 =C2=B1 20%    +128.0%         14 =C2=B1  5%  sched_debug.cpu#1=
8.cpu_load[4]
>        124 =C2=B1  9%    +434.9%        663 =C2=B1  7%  sched_debug.cfs_r=
q[42]:/.tg_runnable_contrib
>       5723 =C2=B1  9%    +432.6%      30482 =C2=B1  7%  sched_debug.cfs_r=
q[42]:/.avg->runnable_avg_sum
>     820458 =C2=B1  3%     -82.6%     142803 =C2=B1  5%  sched_debug.cpu#1=
7.sched_count
>        907 =C2=B1  6%    +109.9%       1905 =C2=B1  7%  sched_debug.cpu#1=
8.curr->pid
>       7596 =C2=B1 27%    +317.1%      31685 =C2=B1  5%  sched_debug.cfs_r=
q[45]:/.avg->runnable_avg_sum
>          3 =C2=B1 43%    +246.7%         13 =C2=B1  5%  sched_debug.cpu#3=
3.cpu_load[1]
>      60531 =C2=B1  4%    +113.4%     129160 =C2=B1  0%  sched_debug.cfs_r=
q[23]:/.exec_clock
>         48 =C2=B1 39%    +205.2%        147 =C2=B1 34%  sched_debug.cfs_r=
q[33]:/.tg_load_contrib
>     453444 =C2=B1  4%     -84.1%      72012 =C2=B1  4%  sched_debug.cpu#2=
.sched_goidle
>     907983 =C2=B1  4%     -83.5%     149609 =C2=B1  4%  sched_debug.cpu#2=
.nr_switches
>     974782 =C2=B1 10%     -83.9%     157156 =C2=B1  2%  sched_debug.cpu#2=
.sched_count
>        165 =C2=B1 27%    +317.1%        688 =C2=B1  5%  sched_debug.cfs_r=
q[45]:/.tg_runnable_contrib
>        522 =C2=B1 12%    +239.3%       1771 =C2=B1 12%  sched_debug.cpu#3=
9.ttwu_local
>      22377 =C2=B1 19%    +441.3%     121128 =C2=B1  0%  sched_debug.cfs_r=
q[42]:/.exec_clock
>     167866 =C2=B1 22%    +160.2%     436709 =C2=B1 34%  sched_debug.cfs_r=
q[26]:/.spread0
>          3 =C2=B1 29%    +226.7%         12 =C2=B1 21%  sched_debug.cpu#3=
6.cpu_load[1]
>          4 =C2=B1 17%    +231.2%         13 =C2=B1  6%  sched_debug.cpu#5=
9.cpu_load[0]
>          3 =C2=B1 42%    +278.6%         13 =C2=B1  9%  sched_debug.cfs_r=
q[54]:/.runnable_load_avg
>          3 =C2=B1 31%    +285.7%         13 =C2=B1 12%  sched_debug.cpu#4=
1.cpu_load[3]
>          3 =C2=B1 47%    +246.7%         13 =C2=B1  9%  sched_debug.cpu#6=
3.cpu_load[4]
>          6 =C2=B1 20%    +112.5%         12 =C2=B1 14%  sched_debug.cpu#1=
1.cpu_load[4]
>          3 =C2=B1 11%    +226.7%         12 =C2=B1 21%  sched_debug.cpu#3=
6.cpu_load[0]
>          4 =C2=B1 35%    +225.0%         13 =C2=B1  7%  sched_debug.cpu#5=
3.cpu_load[1]
>          5 =C2=B1 47%    +140.9%         13 =C2=B1  9%  sched_debug.cpu#4=
6.cpu_load[1]
>          4 =C2=B1 25%    +205.9%         13 =C2=B1 12%  sched_debug.cpu#5=
3.cpu_load[0]
>        500 =C2=B1 18%    +262.1%       1810 =C2=B1 15%  sched_debug.cpu#4=
5.ttwu_local
>        451 =C2=B1  8%    +230.7%       1493 =C2=B1 19%  sched_debug.cpu#5=
4.ttwu_local
>  1.156e+10 =C2=B1  0%     -71.2%  3.326e+09 =C2=B1  1%  cpuidle.C1-NHM.ti=
me
>     799819 =C2=B1  2%     -82.4%     140789 =C2=B1  6%  sched_debug.cpu#1=
9.sched_count
>         50 =C2=B1 16%     +93.0%         97 =C2=B1 15%  sched_debug.cpu#3=
1.nr_uninterruptible
>        228 =C2=B1  4%    +239.6%        776 =C2=B1  4%  sched_debug.cfs_r=
q[58]:/.tg_runnable_contrib
>      10517 =C2=B1  4%    +239.3%      35688 =C2=B1  4%  sched_debug.cfs_r=
q[58]:/.avg->runnable_avg_sum
>     156424 =C2=B1 23%    +137.7%     371749 =C2=B1 37%  sched_debug.cfs_r=
q[29]:/.spread0
>         44 =C2=B1 41%    +201.7%        133 =C2=B1 37%  sched_debug.cfs_r=
q[33]:/.blocked_load_avg
>          7 =C2=B1 17%     +79.3%         13 =C2=B1 15%  sched_debug.cpu#1=
1.cpu_load[2]
>          7 =C2=B1 15%     +72.4%         12 =C2=B1  4%  sched_debug.cfs_r=
q[18]:/.runnable_load_avg
>          6 =C2=B1 13%     +96.0%         12 =C2=B1 12%  sched_debug.cpu#2=
1.cpu_load[4]
>      38958 =C2=B1  6%    +249.7%     136223 =C2=B1  0%  sched_debug.cfs_r=
q[56]:/.exec_clock
>     166485 =C2=B1 27%    +146.8%     410810 =C2=B1 40%  sched_debug.cfs_r=
q[27]:/.spread0
>        903 =C2=B1  9%    +122.0%       2006 =C2=B1  2%  sched_debug.cpu#2=
5.curr->pid
>      10608 =C2=B1  7%    +232.5%      35277 =C2=B1  5%  sched_debug.cfs_r=
q[62]:/.avg->runnable_avg_sum
>        231 =C2=B1  7%    +232.4%        767 =C2=B1  5%  sched_debug.cfs_r=
q[62]:/.tg_runnable_contrib
>     510864 =C2=B1  4%     -85.9%      71998 =C2=B1  0%  sched_debug.cpu#2=
9.ttwu_count
>        497 =C2=B1 14%    +258.9%       1783 =C2=B1 30%  sched_debug.cpu#5=
5.ttwu_local
>        584 =C2=B1 27%    +251.9%       2057 =C2=B1  9%  sched_debug.cpu#5=
8.curr->pid
>        577 =C2=B1 14%    +214.3%       1815 =C2=B1 12%  sched_debug.cpu#5=
1.curr->pid
>     424410 =C2=B1  4%     -84.9%      64153 =C2=B1  1%  sched_debug.cpu#5=
.sched_goidle
>        464 =C2=B1 14%     -39.7%        280 =C2=B1  6%  sched_debug.cpu#2=
4.nr_uninterruptible
>     849809 =C2=B1  4%     -84.3%     133474 =C2=B1  1%  sched_debug.cpu#5=
.nr_switches
>          6 =C2=B1 19%     +88.9%         12 =C2=B1 14%  sched_debug.cpu#1=
1.cpu_load[3]
>     893664 =C2=B1  8%     -84.3%     140385 =C2=B1  2%  sched_debug.cpu#5=
.sched_count
>       1050 =C2=B1 22%     +92.7%       2023 =C2=B1  4%  sched_debug.cpu#1=
4.curr->pid
>          6 =C2=B1 41%     +84.0%         11 =C2=B1  9%  sched_debug.cpu#2=
0.cpu_load[0]
>        562 =C2=B1 26%    +264.2%       2049 =C2=B1  2%  sched_debug.cpu#5=
6.curr->pid
>     484950 =C2=B1  3%     -87.6%      60072 =C2=B1  4%  sched_debug.cpu#2=
9.sched_goidle
>        631 =C2=B1 20%    +204.4%       1921 =C2=B1 13%  sched_debug.cpu#3=
5.curr->pid
>        400 =C2=B1  9%     +91.0%        765 =C2=B1  3%  sched_debug.cfs_r=
q[29]:/.tg_runnable_contrib
>     221437 =C2=B1  4%     -69.0%      68559 =C2=B1  1%  sched_debug.cpu#3=
2.sched_goidle
>     151736 =C2=B1 28%    +131.8%     351711 =C2=B1 34%  sched_debug.cfs_r=
q[31]:/.spread0
>      39350 =C2=B1  8%    +241.4%     134348 =C2=B1  0%  sched_debug.cfs_r=
q[60]:/.exec_clock
>     424957 =C2=B1  2%     -83.4%      70675 =C2=B1  2%  sched_debug.cpu#4=
.ttwu_count
>     399685 =C2=B1  1%     -82.2%      71004 =C2=B1  0%  sched_debug.cpu#1=
1.ttwu_count
>     971165 =C2=B1  3%     -87.1%     125255 =C2=B1  4%  sched_debug.cpu#2=
9.nr_switches
>     423917 =C2=B1  3%     -83.7%      69106 =C2=B1  1%  sched_debug.cpu#5=
.ttwu_count
>          8 =C2=B1 19%     +63.6%         13 =C2=B1 15%  sched_debug.cpu#2=
2.cpu_load[1]
>          7 =C2=B1 19%     +71.0%         13 =C2=B1 12%  sched_debug.cpu#2=
2.cpu_load[2]
>          6 =C2=B1 19%     +96.3%         13 =C2=B1 12%  sched_debug.cpu#2=
2.cpu_load[3]
>        608 =C2=B1 20%    +258.9%       2182 =C2=B1  6%  sched_debug.cpu#5=
7.curr->pid
>          4 =C2=B1 30%    +205.9%         13 =C2=B1  5%  sched_debug.cpu#3=
3.cpu_load[0]
>     376316 =C2=B1  1%     -81.4%      70115 =C2=B1  2%  sched_debug.cpu#1=
1.sched_goidle
>     754666 =C2=B1  1%     -80.6%     146300 =C2=B1  2%  sched_debug.cpu#1=
1.nr_switches
>     511244 =C2=B1  3%     -87.5%      63857 =C2=B1  6%  sched_debug.cpu#2=
6.sched_goidle
>    1023764 =C2=B1  3%     -87.0%     133252 =C2=B1  6%  sched_debug.cpu#2=
6.nr_switches
>          2 =C2=B1 35%    +600.0%         14 =C2=B1  5%  sched_debug.cpu#4=
8.cpu_load[4]
>          6 =C2=B1 30%     +76.0%         11 =C2=B1  6%  sched_debug.cfs_r=
q[20]:/.runnable_load_avg
>      39811 =C2=B1  7%    +236.6%     134001 =C2=B1  1%  sched_debug.cfs_r=
q[61]:/.exec_clock
>         76 =C2=B1 17%     +64.7%        126 =C2=B1 12%  sched_debug.cpu#2=
8.nr_uninterruptible
>          8 =C2=B1 16%     +57.1%         13 =C2=B1 14%  sched_debug.cpu#2=
3.cpu_load[0]
>      58133 =C2=B1  3%    +126.1%     131423 =C2=B1  2%  sched_debug.cfs_r=
q[14]:/.exec_clock
>     516681 =C2=B1  2%     -85.9%      72656 =C2=B1  1%  sched_debug.cpu#2=
6.ttwu_count
>     206503 =C2=B1  3%     -68.6%      64766 =C2=B1  1%  sched_debug.cpu#3=
2.ttwu_count
>      18371 =C2=B1  9%     +91.0%      35082 =C2=B1  3%  sched_debug.cfs_r=
q[29]:/.avg->runnable_avg_sum
>          3 =C2=B1 33%    +308.3%         12 =C2=B1  6%  sched_debug.cpu#5=
5.cpu_load[4]
>          3 =C2=B1 14%    +257.1%         12 =C2=B1  4%  sched_debug.cpu#5=
9.cpu_load[3]
>          4 =C2=B1 33%    +161.1%         11 =C2=B1 13%  sched_debug.cpu#4=
2.cpu_load[2]
>          4 =C2=B1 30%    +225.0%         13 =C2=B1  9%  sched_debug.cpu#3=
2.cpu_load[3]
>          3 =C2=B1 31%    +264.3%         12 =C2=B1 11%  sched_debug.cpu#3=
5.cpu_load[4]
>          3 =C2=B1 29%    +240.0%         12 =C2=B1 11%  sched_debug.cfs_r=
q[53]:/.runnable_load_avg
>          3 =C2=B1 29%    +240.0%         12 =C2=B1  6%  sched_debug.cpu#5=
3.cpu_load[2]
>          3 =C2=B1 22%    +246.7%         13 =C2=B1  5%  sched_debug.cpu#5=
2.cpu_load[3]
>          3 =C2=B1 31%    +257.1%         12 =C2=B1  8%  sched_debug.cpu#5=
1.cpu_load[3]
>          3 =C2=B1 39%    +300.0%         13 =C2=B1  5%  sched_debug.cpu#3=
2.cpu_load[4]
>          4 =C2=B1 30%    +212.5%         12 =C2=B1  4%  sched_debug.cpu#4=
0.cpu_load[2]
>          4 =C2=B1 38%    +194.1%         12 =C2=B1  4%  sched_debug.cpu#4=
0.cpu_load[1]
>          2 =C2=B1 19%    +466.7%         12 =C2=B1  8%  sched_debug.cpu#4=
0.cpu_load[4]
>          2 =C2=B1 47%    +372.7%         13 =C2=B1  5%  sched_debug.cpu#3=
3.cpu_load[3]
>          4 =C2=B1 10%    +200.0%         12 =C2=B1  6%  sched_debug.cpu#5=
9.cpu_load[1]
>          4 =C2=B1 38%    +194.1%         12 =C2=B1  4%  sched_debug.cpu#4=
0.cpu_load[0]
>          3 =C2=B1 29%    +220.0%         12 =C2=B1 21%  sched_debug.cpu#3=
6.cpu_load[2]
>          4 =C2=B1 17%    +212.5%         12 =C2=B1 14%  sched_debug.cpu#3=
9.cpu_load[3]
>          4 =C2=B1 27%    +147.4%         11 =C2=B1 19%  sched_debug.cpu#4=
2.cpu_load[1]
>          4 =C2=B1  0%    +287.5%         15 =C2=B1  3%  sched_debug.cpu#5=
7.cpu_load[3]
>          4 =C2=B1  0%    +212.5%         12 =C2=B1  4%  sched_debug.cpu#5=
9.cpu_load[2]
>     190817 =C2=B1  7%     -69.0%      59123 =C2=B1  5%  sched_debug.cpu#3=
7.sched_goidle
>        683 =C2=B1  5%    +204.3%       2080 =C2=B1  9%  sched_debug.cpu#6=
1.curr->pid
>        109 =C2=B1 10%     +37.0%        150 =C2=B1 21%  sched_debug.cpu#2=
6.nr_uninterruptible
>        528 =C2=B1 18%    +232.1%       1755 =C2=B1 12%  sched_debug.cpu#5=
5.curr->pid
>        540 =C2=B1 32%    +257.9%       1934 =C2=B1  9%  sched_debug.cpu#3=
9.curr->pid
>     429861 =C2=B1  1%     -82.7%      74351 =C2=B1  1%  sched_debug.cpu#2=
.ttwu_count
>      39439 =C2=B1  8%    +245.8%     136399 =C2=B1  0%  sched_debug.cfs_r=
q[57]:/.exec_clock
>        973 =C2=B1 25%    +110.9%       2052 =C2=B1 10%  sched_debug.cpu#0=
.curr->pid
>      40253 =C2=B1  9%    +235.4%     135015 =C2=B1  0%  sched_debug.cfs_r=
q[62]:/.exec_clock
>   73690739 =C2=B1  3%     -67.6%   23868773 =C2=B1 10%  cpuidle.C1E-NHM.t=
ime
>     443566 =C2=B1  4%     -67.9%     142393 =C2=B1  1%  sched_debug.cpu#3=
2.nr_switches
>        133 =C2=B1 15%    +429.1%        705 =C2=B1  5%  sched_debug.cfs_r=
q[40]:/.tg_runnable_contrib
>     247383 =C2=B1  3%     -77.8%      54929 =C2=B1  5%  sched_debug.cpu#5=
7.sched_goidle
>       6128 =C2=B1 15%    +428.5%      32386 =C2=B1  5%  sched_debug.cfs_r=
q[40]:/.avg->runnable_avg_sum
>        586 =C2=B1  9%    +204.9%       1787 =C2=B1  8%  sched_debug.cpu#3=
6.ttwu_local
>          5 =C2=B1 27%    +177.3%         15 =C2=B1  9%  sched_debug.cpu#6=
1.cpu_load[2]
>          4 =C2=B1  9%    +236.8%         16 =C2=B1  4%  sched_debug.cpu#5=
7.cpu_load[1]
>          9 =C2=B1 20%     +45.9%         13 =C2=B1  3%  sched_debug.cpu#3=
0.cpu_load[4]
>          2 =C2=B1 30%    +400.0%         13 =C2=B1  3%  sched_debug.cpu#4=
8.cpu_load[3]
>        230 =C2=B1  5%    +224.5%        748 =C2=B1  2%  sched_debug.cfs_r=
q[59]:/.tg_runnable_contrib
>        625 =C2=B1 32%    +207.4%       1922 =C2=B1 17%  sched_debug.cpu#3=
2.curr->pid
>     984354 =C2=B1  2%     -87.2%     126424 =C2=B1  5%  sched_debug.cpu#2=
9.sched_count
>     181989 =C2=B1 11%     -65.9%      62130 =C2=B1  1%  sched_debug.cpu#4=
9.ttwu_count
>        473 =C2=B1  7%    +219.2%       1512 =C2=B1 22%  sched_debug.cpu#5=
2.ttwu_local
>      10613 =C2=B1  5%    +224.4%      34424 =C2=B1  2%  sched_debug.cfs_r=
q[59]:/.avg->runnable_avg_sum
>        581 =C2=B1 12%    +185.7%       1661 =C2=B1 17%  sched_debug.cpu#4=
8.ttwu_local
>      40432 =C2=B1  8%    +237.9%     136634 =C2=B1  1%  sched_debug.cfs_r=
q[58]:/.exec_clock
>     193465 =C2=B1  9%     -67.5%      62936 =C2=B1  1%  sched_debug.cpu#3=
7.ttwu_count
>        308 =C2=B1 10%    +140.7%        742 =C2=B1  5%  sched_debug.cfs_r=
q[9]:/.tg_runnable_contrib
>        176 =C2=B1 11%    +288.1%        683 =C2=B1  5%  sched_debug.cfs_r=
q[37]:/.tg_runnable_contrib
>     187261 =C2=B1  7%     -68.1%      59804 =C2=B1  6%  sched_debug.cpu#3=
5.sched_goidle
>       8109 =C2=B1 10%    +287.2%      31401 =C2=B1  5%  sched_debug.cfs_r=
q[37]:/.avg->runnable_avg_sum
>      14139 =C2=B1  9%    +141.3%      34124 =C2=B1  5%  sched_debug.cfs_r=
q[9]:/.avg->runnable_avg_sum
>     382269 =C2=B1  7%     -67.9%     122882 =C2=B1  5%  sched_debug.cpu#3=
7.nr_switches
>        315 =C2=B1  4%    +135.6%        742 =C2=B1  4%  sched_debug.cfs_r=
q[15]:/.tg_runnable_contrib
>      14456 =C2=B1  4%    +136.0%      34117 =C2=B1  4%  sched_debug.cfs_r=
q[15]:/.avg->runnable_avg_sum
>     281534 =C2=B1  3%     -86.8%      37215 =C2=B1  6%  cpuidle.C1E-NHM.u=
sage
>        603 =C2=B1 38%    +208.4%       1862 =C2=B1  8%  sched_debug.cpu#4=
0.curr->pid
>     495617 =C2=B1  3%     -77.0%     114184 =C2=B1  5%  sched_debug.cpu#5=
7.nr_switches
>     198497 =C2=B1  3%     -67.6%      64225 =C2=B1  0%  sched_debug.cpu#3=
5.ttwu_count
>     498597 =C2=B1  4%     -76.9%     115414 =C2=B1  4%  sched_debug.cpu#5=
7.sched_count
>     446635 =C2=B1  3%     -61.0%     174387 =C2=B1 28%  sched_debug.cpu#3=
2.sched_count
>          8 =C2=B1 16%     +62.9%         14 =C2=B1 15%  sched_debug.cpu#2=
3.cpu_load[1]
>     202136 =C2=B1  5%     -68.5%      63771 =C2=B1  3%  sched_debug.cpu#3=
6.sched_goidle
>        568 =C2=B1 24%    +226.5%       1856 =C2=B1  8%  sched_debug.cpu#5=
3.curr->pid
>        869 =C2=B1 19%    +109.7%       1822 =C2=B1  7%  sched_debug.cpu#1=
2.curr->pid
>      40794 =C2=B1  8%    +228.5%     133993 =C2=B1  1%  sched_debug.cfs_r=
q[63]:/.exec_clock
>     191084 =C2=B1  7%     -66.8%      63524 =C2=B1  1%  sched_debug.cpu#3=
6.ttwu_count
>     183888 =C2=B1  8%     -65.6%      63297 =C2=B1  6%  sched_debug.cpu#5=
2.sched_goidle
>         10 =C2=B1 18%     +29.3%         13 =C2=B1  3%  sched_debug.cpu#3=
0.cpu_load[3]
>          5 =C2=B1 31%    +170.0%         13 =C2=B1 11%  sched_debug.cpu#9=
.cpu_load[4]
>     189595 =C2=B1  8%     -66.4%      63732 =C2=B1  2%  sched_debug.cpu#3=
4.ttwu_count
>        181 =C2=B1 15%    +284.3%        696 =C2=B1  7%  sched_debug.cfs_r=
q[35]:/.tg_runnable_contrib
>      10639 =C2=B1 12%    +240.2%      36198 =C2=B1  2%  sched_debug.cfs_r=
q[56]:/.avg->runnable_avg_sum
>        231 =C2=B1 12%    +239.3%        785 =C2=B1  2%  sched_debug.cfs_r=
q[56]:/.tg_runnable_contrib
>        558 =C2=B1 15%    +230.8%       1848 =C2=B1  4%  sched_debug.cpu#5=
2.curr->pid
>     375242 =C2=B1  7%     -66.9%     124149 =C2=B1  6%  sched_debug.cpu#3=
5.nr_switches
>        229 =C2=B1  2%    +238.5%        777 =C2=B1  1%  sched_debug.cfs_r=
q[61]:/.tg_runnable_contrib
>       8353 =C2=B1 14%    +283.7%      32054 =C2=B1  7%  sched_debug.cfs_r=
q[35]:/.avg->runnable_avg_sum
>     173742 =C2=B1 13%     -64.5%      61631 =C2=B1  5%  sched_debug.cpu#4=
9.sched_goidle
>      10571 =C2=B1  2%    +237.9%      35717 =C2=B1  1%  sched_debug.cfs_r=
q[61]:/.avg->runnable_avg_sum
>     197826 =C2=B1  8%     -67.3%      64771 =C2=B1  4%  sched_debug.cpu#3=
8.sched_goidle
>     404925 =C2=B1  5%     -67.4%     132191 =C2=B1  3%  sched_debug.cpu#3=
6.nr_switches
>     368375 =C2=B1  8%     -64.4%     131038 =C2=B1  6%  sched_debug.cpu#5=
2.nr_switches
>          4 =C2=B1 38%    +170.6%         11 =C2=B1 19%  sched_debug.cfs_r=
q[55]:/.runnable_load_avg
>          5 =C2=B1 14%    +185.0%         14 =C2=B1  9%  sched_debug.cpu#6=
0.cpu_load[1]
>          4 =C2=B1 39%    +262.5%         14 =C2=B1  7%  sched_debug.cpu#5=
6.cpu_load[4]
>          5 =C2=B1 14%    +195.0%         14 =C2=B1  7%  sched_debug.cpu#5=
8.cpu_load[3]
>          4 =C2=B1 31%    +205.3%         14 =C2=B1  5%  sched_debug.cfs_r=
q[58]:/.runnable_load_avg
>          1 =C2=B1 34%    +120.0%          2 =C2=B1 30%  sched_debug.cfs_r=
q[9]:/.nr_spread_over
>          1 =C2=B1  0%    +200.0%          3 =C2=B1 40%  sched_debug.cfs_r=
q[1]:/.nr_spread_over
>          4 =C2=B1 19%    +216.7%         14 =C2=B1  9%  sched_debug.cpu#6=
0.cpu_load[2]
>          4 =C2=B1 25%    +237.5%         13 =C2=B1 15%  sched_debug.cpu#5=
4.cpu_load[2]
>          5 =C2=B1 37%    +200.0%         15 =C2=B1  9%  sched_debug.cpu#6=
1.cpu_load[3]
>          4 =C2=B1 24%    +205.6%         13 =C2=B1 12%  sched_debug.cpu#5=
4.cpu_load[1]
>        445 =C2=B1  5%    +332.8%       1929 =C2=B1 12%  sched_debug.cpu#4=
0.ttwu_local
>        661 =C2=B1 16%    +184.0%       1877 =C2=B1  7%  sched_debug.cpu#3=
7.curr->pid
>     176233 =C2=B1  8%     -64.5%      62640 =C2=B1  2%  sched_debug.cpu#5=
2.ttwu_count
>        453 =C2=B1 19%    +319.1%       1898 =C2=B1 11%  sched_debug.cpu#4=
6.ttwu_local
>     167768 =C2=B1 12%     -64.8%      59130 =C2=B1  6%  sched_debug.cpu#5=
3.sched_goidle
>     383507 =C2=B1  7%     -66.9%     126751 =C2=B1  4%  sched_debug.cpu#3=
7.sched_count
>     189267 =C2=B1 14%     -66.6%      63161 =C2=B1  1%  sched_debug.cpu#3=
8.ttwu_count
>     271885 =C2=B1  4%     -75.2%      67422 =C2=B1  0%  sched_debug.cpu#6=
2.ttwu_count
>     396300 =C2=B1  8%     -66.1%     134542 =C2=B1  5%  sched_debug.cpu#3=
8.nr_switches
>     198817 =C2=B1  9%     -66.0%      67505 =C2=B1  4%  sched_debug.cpu#3=
4.sched_goidle
>      16468 =C2=B1  4%    +185.9%      47080 =C2=B1  1%  sched_debug.cfs_r=
q[3]:/.tg->runnable_avg
>      16466 =C2=B1  4%    +185.8%      47066 =C2=B1  1%  sched_debug.cfs_r=
q[4]:/.tg->runnable_avg
>      16459 =C2=B1  4%    +186.0%      47082 =C2=B1  1%  sched_debug.cfs_r=
q[2]:/.tg->runnable_avg
>      16458 =C2=B1  4%    +186.0%      47063 =C2=B1  1%  sched_debug.cfs_r=
q[1]:/.tg->runnable_avg
>      16484 =C2=B1  4%    +185.5%      47069 =C2=B1  1%  sched_debug.cfs_r=
q[6]:/.tg->runnable_avg
>      10545 =C2=B1 10%    +215.5%      33271 =C2=B1  3%  sched_debug.cfs_r=
q[63]:/.avg->runnable_avg_sum
>      16455 =C2=B1  4%    +186.0%      47061 =C2=B1  1%  sched_debug.cfs_r=
q[0]:/.tg->runnable_avg
>      16495 =C2=B1  4%    +185.4%      47078 =C2=B1  1%  sched_debug.cfs_r=
q[7]:/.tg->runnable_avg
>      16481 =C2=B1  4%    +185.5%      47062 =C2=B1  1%  sched_debug.cfs_r=
q[5]:/.tg->runnable_avg
>         10 =C2=B1 48%    +182.9%         29 =C2=B1 44%  sched_debug.cfs_r=
q[34]:/.load
>        229 =C2=B1 10%    +214.5%        722 =C2=B1  3%  sched_debug.cfs_r=
q[63]:/.tg_runnable_contrib
>     405011 =C2=B1  5%     -66.1%     137434 =C2=B1  6%  sched_debug.cpu#3=
6.sched_count
>      16507 =C2=B1  4%    +185.2%      47087 =C2=B1  1%  sched_debug.cfs_r=
q[8]:/.tg->runnable_avg
>      16516 =C2=B1  4%    +185.1%      47086 =C2=B1  1%  sched_debug.cfs_r=
q[9]:/.tg->runnable_avg
>      16527 =C2=B1  4%    +185.1%      47117 =C2=B1  1%  sched_debug.cfs_r=
q[12]:/.tg->runnable_avg
>      16525 =C2=B1  4%    +185.0%      47099 =C2=B1  1%  sched_debug.cfs_r=
q[11]:/.tg->runnable_avg
>      16522 =C2=B1  4%    +185.0%      47089 =C2=B1  1%  sched_debug.cfs_r=
q[10]:/.tg->runnable_avg
>      16528 =C2=B1  4%    +185.1%      47115 =C2=B1  1%  sched_debug.cfs_r=
q[13]:/.tg->runnable_avg
>     348070 =C2=B1 13%     -63.1%     128384 =C2=B1  5%  sched_debug.cpu#4=
9.nr_switches
>        506 =C2=B1  6%    +197.3%       1504 =C2=B1  4%  sched_debug.cpu#5=
3.ttwu_local
>      16538 =C2=B1  4%    +184.9%      47115 =C2=B1  1%  sched_debug.cfs_r=
q[15]:/.tg->runnable_avg
>      16539 =C2=B1  4%    +184.9%      47116 =C2=B1  1%  sched_debug.cfs_r=
q[14]:/.tg->runnable_avg
>      16549 =C2=B1  4%    +184.8%      47129 =C2=B1  1%  sched_debug.cfs_r=
q[17]:/.tg->runnable_avg
>      16543 =C2=B1  4%    +184.8%      47118 =C2=B1  1%  sched_debug.cfs_r=
q[16]:/.tg->runnable_avg
>     184779 =C2=B1 11%     -66.2%      62497 =C2=B1  5%  sched_debug.cpu#4=
8.sched_goidle
>        941 =C2=B1 14%    +100.2%       1883 =C2=B1 11%  sched_debug.cpu#1=
5.curr->pid
>      16591 =C2=B1  4%    +184.2%      47159 =C2=B1  1%  sched_debug.cfs_r=
q[24]:/.tg->runnable_avg
>      16562 =C2=B1  4%    +184.6%      47131 =C2=B1  1%  sched_debug.cfs_r=
q[18]:/.tg->runnable_avg
>      16594 =C2=B1  4%    +184.2%      47166 =C2=B1  1%  sched_debug.cfs_r=
q[25]:/.tg->runnable_avg
>      16593 =C2=B1  4%    +184.4%      47195 =C2=B1  1%  sched_debug.cfs_r=
q[28]:/.tg->runnable_avg
>      16591 =C2=B1  4%    +184.4%      47192 =C2=B1  1%  sched_debug.cfs_r=
q[29]:/.tg->runnable_avg
>      16597 =C2=B1  4%    +184.3%      47181 =C2=B1  1%  sched_debug.cfs_r=
q[26]:/.tg->runnable_avg
>      16597 =C2=B1  4%    +184.4%      47195 =C2=B1  1%  sched_debug.cfs_r=
q[27]:/.tg->runnable_avg
>      16570 =C2=B1  4%    +184.5%      47138 =C2=B1  1%  sched_debug.cfs_r=
q[19]:/.tg->runnable_avg
>      16593 =C2=B1  4%    +184.2%      47152 =C2=B1  1%  sched_debug.cfs_r=
q[23]:/.tg->runnable_avg
>      16587 =C2=B1  4%    +184.2%      47138 =C2=B1  1%  sched_debug.cfs_r=
q[22]:/.tg->runnable_avg
>      16612 =C2=B1  4%    +184.1%      47192 =C2=B1  1%  sched_debug.cfs_r=
q[32]:/.tg->runnable_avg
>      16600 =C2=B1  4%    +184.2%      47176 =C2=B1  1%  sched_debug.cfs_r=
q[30]:/.tg->runnable_avg
>      16606 =C2=B1  4%    +184.2%      47196 =C2=B1  1%  sched_debug.cfs_r=
q[31]:/.tg->runnable_avg
>      16580 =C2=B1  4%    +184.3%      47142 =C2=B1  1%  sched_debug.cfs_r=
q[21]:/.tg->runnable_avg
>      16577 =C2=B1  4%    +184.4%      47142 =C2=B1  1%  sched_debug.cfs_r=
q[20]:/.tg->runnable_avg
>      16626 =C2=B1  4%    +183.9%      47201 =C2=B1  1%  sched_debug.cfs_r=
q[34]:/.tg->runnable_avg
>      16628 =C2=B1  4%    +183.9%      47199 =C2=B1  1%  sched_debug.cfs_r=
q[33]:/.tg->runnable_avg
>      16636 =C2=B1  4%    +183.8%      47207 =C2=B1  1%  sched_debug.cfs_r=
q[36]:/.tg->runnable_avg
>      16633 =C2=B1  4%    +183.8%      47204 =C2=B1  1%  sched_debug.cfs_r=
q[35]:/.tg->runnable_avg
>      16641 =C2=B1  4%    +183.7%      47206 =C2=B1  1%  sched_debug.cfs_r=
q[37]:/.tg->runnable_avg
>     183606 =C2=B1 14%     -66.0%      62470 =C2=B1  2%  sched_debug.cpu#5=
1.ttwu_count
>      16652 =C2=B1  4%    +183.5%      47213 =C2=B1  1%  sched_debug.cfs_r=
q[40]:/.tg->runnable_avg
>      16650 =C2=B1  4%    +183.6%      47221 =C2=B1  1%  sched_debug.cfs_r=
q[41]:/.tg->runnable_avg
>      16677 =C2=B1  4%    +183.3%      47243 =C2=B1  1%  sched_debug.cfs_r=
q[45]:/.tg->runnable_avg
>     336124 =C2=B1 12%     -63.6%     122396 =C2=B1  6%  sched_debug.cpu#5=
3.nr_switches
>      16674 =C2=B1  4%    +183.4%      47248 =C2=B1  1%  sched_debug.cfs_r=
q[51]:/.tg->runnable_avg
>      16659 =C2=B1  4%    +183.5%      47226 =C2=B1  1%  sched_debug.cfs_r=
q[42]:/.tg->runnable_avg
>      16672 =C2=B1  4%    +183.3%      47235 =C2=B1  1%  sched_debug.cfs_r=
q[49]:/.tg->runnable_avg
>      16653 =C2=B1  4%    +183.4%      47199 =C2=B1  1%  sched_debug.cfs_r=
q[39]:/.tg->runnable_avg
>      16674 =C2=B1  4%    +183.3%      47243 =C2=B1  1%  sched_debug.cfs_r=
q[44]:/.tg->runnable_avg
>      16651 =C2=B1  4%    +183.4%      47195 =C2=B1  1%  sched_debug.cfs_r=
q[38]:/.tg->runnable_avg
>      14838 =C2=B1  7%    +126.6%      33617 =C2=B1  3%  sched_debug.cfs_r=
q[18]:/.avg->runnable_avg_sum
>      16677 =C2=B1  4%    +183.2%      47238 =C2=B1  1%  sched_debug.cfs_r=
q[50]:/.tg->runnable_avg
>      16675 =C2=B1  4%    +183.2%      47224 =C2=B1  1%  sched_debug.cfs_r=
q[48]:/.tg->runnable_avg
>      16683 =C2=B1  4%    +183.3%      47256 =C2=B1  1%  sched_debug.cfs_r=
q[52]:/.tg->runnable_avg
>      16666 =C2=B1  4%    +183.4%      47227 =C2=B1  1%  sched_debug.cfs_r=
q[43]:/.tg->runnable_avg
>         16 =C2=B1  6%    +193.9%         48 =C2=B1  1%  vmstat.procs.r
>      16679 =C2=B1  4%    +183.2%      47228 =C2=B1  1%  sched_debug.cfs_r=
q[46]:/.tg->runnable_avg
>      16680 =C2=B1  4%    +183.0%      47213 =C2=B1  1%  sched_debug.cfs_r=
q[47]:/.tg->runnable_avg
>      16686 =C2=B1  4%    +183.2%      47259 =C2=B1  1%  sched_debug.cfs_r=
q[53]:/.tg->runnable_avg
>      16704 =C2=B1  4%    +182.9%      47264 =C2=B1  1%  sched_debug.cfs_r=
q[55]:/.tg->runnable_avg
>      16700 =C2=B1  4%    +183.0%      47264 =C2=B1  1%  sched_debug.cfs_r=
q[54]:/.tg->runnable_avg
>      16720 =C2=B1  4%    +182.7%      47261 =C2=B1  1%  sched_debug.cfs_r=
q[57]:/.tg->runnable_avg
>      16730 =C2=B1  4%    +182.5%      47256 =C2=B1  1%  sched_debug.cfs_r=
q[59]:/.tg->runnable_avg
>      16726 =C2=B1  4%    +182.6%      47266 =C2=B1  1%  sched_debug.cfs_r=
q[58]:/.tg->runnable_avg
>      16734 =C2=B1  4%    +182.5%      47268 =C2=B1  1%  sched_debug.cfs_r=
q[61]:/.tg->runnable_avg
>      16733 =C2=B1  4%    +182.4%      47260 =C2=B1  1%  sched_debug.cfs_r=
q[60]:/.tg->runnable_avg
>      16714 =C2=B1  4%    +182.8%      47260 =C2=B1  1%  sched_debug.cfs_r=
q[56]:/.tg->runnable_avg
>      16759 =C2=B1  5%    +182.1%      47272 =C2=B1  1%  sched_debug.cfs_r=
q[63]:/.tg->runnable_avg
>      16740 =C2=B1  4%    +182.3%      47264 =C2=B1  1%  sched_debug.cfs_r=
q[62]:/.tg->runnable_avg
>     398244 =C2=B1  8%     -65.7%     136524 =C2=B1  5%  sched_debug.cpu#3=
8.sched_count
>     348117 =C2=B1 13%     -61.1%     135573 =C2=B1  9%  sched_debug.cpu#4=
9.sched_count
>     336174 =C2=B1 12%     -62.4%     126449 =C2=B1  7%  sched_debug.cpu#5=
3.sched_count
>      61049 =C2=B1  5%    +113.0%     130050 =C2=B1  0%  sched_debug.cfs_r=
q[18]:/.exec_clock
>     398443 =C2=B1  9%     -64.9%     140004 =C2=B1  3%  sched_debug.cpu#3=
4.nr_switches
>          3 =C2=B1 39%    +323.1%         13 =C2=B1  3%  sched_debug.cpu#4=
8.cpu_load[0]
>          3 =C2=B1 25%    +323.1%         13 =C2=B1  3%  sched_debug.cpu#4=
8.cpu_load[2]
>          3 =C2=B1 33%    +284.6%         12 =C2=B1  4%  sched_debug.cpu#4=
0.cpu_load[3]
>          3 =C2=B1 31%    +292.9%         13 =C2=B1  3%  sched_debug.cpu#4=
8.cpu_load[1]
>     370157 =C2=B1 11%     -65.0%     129455 =C2=B1  4%  sched_debug.cpu#4=
8.nr_switches
>     173811 =C2=B1 10%     -63.9%      62775 =C2=B1  0%  sched_debug.cpu#4=
8.ttwu_count
>     376459 =C2=B1  7%     -64.9%     132057 =C2=B1  9%  sched_debug.cpu#3=
5.sched_count
>          5 =C2=B1 20%    +147.6%         13 =C2=B1 14%  sched_debug.cfs_r=
q[7]:/.runnable_load_avg
>          4 =C2=B1 24%    +200.0%         13 =C2=B1  8%  sched_debug.cpu#3=
8.cpu_load[3]
>          4 =C2=B1 30%    +231.2%         13 =C2=B1  9%  sched_debug.cpu#5=
4.cpu_load[0]
>          5 =C2=B1 37%    +160.0%         13 =C2=B1 12%  sched_debug.cfs_r=
q[38]:/.runnable_load_avg
>          5 =C2=B1 42%    +155.0%         12 =C2=B1 10%  sched_debug.cpu#5=
0.cpu_load[0]
>     398843 =C2=B1  9%     -64.4%     141829 =C2=B1  4%  sched_debug.cpu#3=
4.sched_count
>      29862 =C2=B1 10%    +315.1%     123964 =C2=B1  0%  sched_debug.cfs_r=
q[37]:/.exec_clock
>      69.47 =C2=B1  1%     -64.5%      24.64 =C2=B1  1%  turbostat.%c1
>        326 =C2=B1  5%    +125.0%        734 =C2=B1  6%  sched_debug.cfs_r=
q[22]:/.tg_runnable_contrib
>      14948 =C2=B1  5%    +125.7%      33739 =C2=B1  6%  sched_debug.cfs_r=
q[22]:/.avg->runnable_avg_sum
>        565 =C2=B1 18%    +214.6%       1779 =C2=B1 13%  sched_debug.cpu#3=
7.ttwu_local
>        452 =C2=B1 18%    +283.9%       1737 =C2=B1 18%  sched_debug.cpu#4=
9.ttwu_local
>        721 =C2=B1 23%    +174.1%       1978 =C2=B1  7%  sched_debug.cpu#6=
2.curr->pid
>      29298 =C2=B1  4%    +320.8%     123279 =C2=B1  1%  sched_debug.cfs_r=
q[34]:/.exec_clock
>      40698 =C2=B1  6%    +232.5%     135315 =C2=B1  0%  sched_debug.cfs_r=
q[59]:/.exec_clock
>        534 =C2=B1 12%    +248.3%       1862 =C2=B1 30%  sched_debug.cpu#3=
8.ttwu_local
>         35 =C2=B1 35%     -54.3%         16 =C2=B1  8%  sched_debug.cfs_r=
q[14]:/.load
>         35 =C2=B1 32%     -55.2%         16 =C2=B1  8%  sched_debug.cpu#1=
4.load
>       7610 =C2=B1  9%    +311.8%      31343 =C2=B1 13%  sched_debug.cfs_r=
q[36]:/.avg->runnable_avg_sum
>        686 =C2=B1 23%    +179.2%       1915 =C2=B1  2%  sched_debug.cpu#1=
7.curr->pid
>        166 =C2=B1  9%    +310.7%        681 =C2=B1 13%  sched_debug.cfs_r=
q[36]:/.tg_runnable_contrib
>     368896 =C2=B1  7%     -62.8%     137215 =C2=B1  7%  sched_debug.cpu#5=
2.sched_count
>        791 =C2=B1 30%    +117.7%       1722 =C2=B1  9%  sched_debug.cpu#2=
0.curr->pid
>          5 =C2=B1 24%    +152.4%         13 =C2=B1  6%  sched_debug.cfs_r=
q[62]:/.runnable_load_avg
>          6 =C2=B1 26%    +140.0%         15 =C2=B1 12%  sched_debug.cpu#6=
1.cpu_load[0]
>          5 =C2=B1 18%    +160.9%         15 =C2=B1  8%  sched_debug.cpu#5=
8.cpu_load[2]
>          6 =C2=B1 26%    +140.0%         15 =C2=B1 12%  sched_debug.cpu#6=
1.cpu_load[1]
>        680 =C2=B1 24%    +198.1%       2028 =C2=B1 12%  sched_debug.cpu#4=
2.curr->pid
>     174536 =C2=B1 16%    +243.0%     598575 =C2=B1 24%  sched_debug.cfs_r=
q[24]:/.spread0
>        606 =C2=B1 34%    +242.2%       2075 =C2=B1  8%  sched_debug.cpu#4=
1.curr->pid
>       9829 =C2=B1 11%    +263.3%      35712 =C2=B1  5%  sched_debug.cfs_r=
q[60]:/.avg->runnable_avg_sum
>        213 =C2=B1 11%    +263.4%        776 =C2=B1  5%  sched_debug.cfs_r=
q[60]:/.tg_runnable_contrib
>          4 =C2=B1 40%    +172.2%         12 =C2=B1 10%  sched_debug.cfs_r=
q[42]:/.runnable_load_avg
>          4 =C2=B1 19%    +211.8%         13 =C2=B1  8%  sched_debug.cpu#5=
2.cpu_load[2]
>          5 =C2=B1 48%    +131.8%         12 =C2=B1  8%  sched_debug.cfs_r=
q[46]:/.runnable_load_avg
>          4 =C2=B1 11%    +255.6%         16 =C2=B1  4%  sched_debug.cpu#5=
7.cpu_load[2]
>          4 =C2=B1 19%    +205.9%         13 =C2=B1  5%  sched_debug.cpu#5=
2.cpu_load[1]
>          4 =C2=B1 30%    +182.4%         12 =C2=B1 14%  sched_debug.cfs_r=
q[51]:/.runnable_load_avg
>          4 =C2=B1 25%    +231.2%         13 =C2=B1  3%  sched_debug.cpu#5=
2.cpu_load[0]
>          5 =C2=B1 14%    +150.0%         12 =C2=B1 14%  sched_debug.cpu#3=
9.cpu_load[2]
>          4 =C2=B1 25%    +225.0%         13 =C2=B1  5%  sched_debug.cfs_r=
q[52]:/.runnable_load_avg
>          4 =C2=B1 40%    +172.2%         12 =C2=B1 17%  sched_debug.cpu#4=
2.cpu_load[0]
>          4 =C2=B1 34%    +194.1%         12 =C2=B1  8%  sched_debug.cpu#5=
1.cpu_load[2]
>          4 =C2=B1 24%    +177.8%         12 =C2=B1 14%  sched_debug.cpu#3=
5.cpu_load[3]
>       1308 =C2=B1  1%    +126.4%       2962 =C2=B1 49%  sched_debug.cpu#1=
4.ttwu_local
>        530 =C2=B1 29%    +206.5%       1626 =C2=B1 12%  sched_debug.cpu#5=
0.ttwu_local
>     170379 =C2=B1  7%     -66.0%      57923 =C2=B1  1%  sched_debug.cpu#5=
5.sched_goidle
>       9222 =C2=B1  9%    +248.6%      32152 =C2=B1  4%  sched_debug.cfs_r=
q[38]:/.avg->runnable_avg_sum
>        523 =C2=B1 36%    +237.7%       1766 =C2=B1  7%  sched_debug.cpu#5=
9.curr->pid
>        200 =C2=B1  9%    +249.4%        698 =C2=B1  4%  sched_debug.cfs_r=
q[38]:/.tg_runnable_contrib
>        540 =C2=B1 22%    +250.5%       1894 =C2=B1  6%  sched_debug.cpu#6=
0.curr->pid
>     167034 =C2=B1 14%     -62.4%      62885 =C2=B1  5%  sched_debug.cpu#5=
1.sched_goidle
>          8 =C2=B1 23%     +81.2%         14 =C2=B1 14%  sched_debug.cpu#2=
3.cpu_load[2]
>        584 =C2=B1 25%    +189.3%       1691 =C2=B1  6%  sched_debug.cpu#4=
3.ttwu_local
>      59537 =C2=B1  3%    +114.7%     127808 =C2=B1  1%  sched_debug.cfs_r=
q[21]:/.exec_clock
>    3500275 =C2=B1  3%    +151.4%    8797983 =C2=B1  0%  softirqs.TIMER
>     341326 =C2=B1  7%     -64.6%     120668 =C2=B1  1%  sched_debug.cpu#5=
5.nr_switches
>     370336 =C2=B1 11%     -62.9%     137515 =C2=B1  7%  sched_debug.cpu#4=
8.sched_count
>          5 =C2=B1 25%    +178.3%         16 =C2=B1 22%  sched_debug.cpu#1=
.cpu_load[4]
>          4 =C2=B1 45%    +222.2%         14 =C2=B1  7%  sched_debug.cpu#5=
6.cpu_load[3]
>          2 =C2=B1  0%    +125.0%          4 =C2=B1 24%  sched_debug.cfs_r=
q[0]:/.nr_spread_over
>          5 =C2=B1 31%    +175.0%         13 =C2=B1  9%  sched_debug.cpu#3=
8.cpu_load[2]
>     190067 =C2=B1  3%     -66.9%      62977 =C2=B1  3%  sched_debug.cpu#3=
3.sched_goidle
>       8888 =C2=B1 12%    +265.4%      32480 =C2=B1  2%  sched_debug.cfs_r=
q[34]:/.avg->runnable_avg_sum
>     341372 =C2=B1  7%     -63.7%     123871 =C2=B1  3%  sched_debug.cpu#5=
5.sched_count
>     259809 =C2=B1  2%     -73.9%      67736 =C2=B1  1%  sched_debug.cpu#5=
6.ttwu_count
>        193 =C2=B1 12%    +265.1%        706 =C2=B1  2%  sched_debug.cfs_r=
q[34]:/.tg_runnable_contrib
>     334659 =C2=B1 14%     -61.1%     130211 =C2=B1  5%  sched_debug.cpu#5=
1.nr_switches
>       1453 =C2=B1 22%    +136.1%       3431 =C2=B1 24%  sched_debug.cpu#1=
2.ttwu_local
>        328 =C2=B1  5%    +137.7%        780 =C2=B1  6%  sched_debug.cfs_r=
q[23]:/.tg_runnable_contrib
>          7 =C2=B1 17%     +93.1%         14 =C2=B1  7%  sched_debug.cpu#1=
8.cpu_load[3]
>     190052 =C2=B1  4%     -66.3%      64136 =C2=B1  1%  sched_debug.cpu#3=
3.ttwu_count
>     181149 =C2=B1  7%     -65.5%      62508 =C2=B1  0%  sched_debug.cpu#5=
5.ttwu_count
>     380828 =C2=B1  3%     -65.7%     130803 =C2=B1  3%  sched_debug.cpu#3=
3.nr_switches
>        838 =C2=B1 11%    +128.7%       1918 =C2=B1  7%  sched_debug.cpu#2=
3.curr->pid
>      60928 =C2=B1  5%    +111.6%     128950 =C2=B1  1%  sched_debug.cfs_r=
q[22]:/.exec_clock
>          5 =C2=B1 41%    +145.5%         13 =C2=B1 13%  sched_debug.cpu#4=
1.cpu_load[1]
>      15049 =C2=B1  5%    +138.4%      35879 =C2=B1  6%  sched_debug.cfs_r=
q[23]:/.avg->runnable_avg_sum
>        782 =C2=B1 49%    +144.9%       1917 =C2=B1 19%  sched_debug.cpu#3=
4.curr->pid
>          4 =C2=B1 36%    +200.0%         13 =C2=B1 13%  sched_debug.cpu#4=
1.cpu_load[2]
>      14510 =C2=B1  3%    +133.1%      33826 =C2=B1  3%  sched_debug.cfs_r=
q[20]:/.avg->runnable_avg_sum
>        316 =C2=B1  3%    +132.9%        737 =C2=B1  3%  sched_debug.cfs_r=
q[20]:/.tg_runnable_contrib
>        612 =C2=B1 36%    +200.3%       1839 =C2=B1  4%  sched_debug.cpu#5=
0.curr->pid
>        337 =C2=B1  4%    +109.3%        705 =C2=B1  5%  sched_debug.cfs_r=
q[21]:/.tg_runnable_contrib
>     382766 =C2=B1  3%     -64.5%     135808 =C2=B1  4%  sched_debug.cpu#3=
3.sched_count
>      14583 =C2=B1  4%    +141.9%      35280 =C2=B1  5%  sched_debug.cfs_r=
q[13]:/.avg->runnable_avg_sum
>        318 =C2=B1  4%    +141.3%        768 =C2=B1  5%  sched_debug.cfs_r=
q[13]:/.tg_runnable_contrib
>      15468 =C2=B1  5%    +109.6%      32424 =C2=B1  5%  sched_debug.cfs_r=
q[21]:/.avg->runnable_avg_sum
>        787 =C2=B1 29%    +171.7%       2138 =C2=B1  7%  sched_debug.cpu#2=
4.curr->pid
>      20340 =C2=B1  1%     -57.8%       8589 =C2=B1  1%  uptime.idle
>        950 =C2=B1 35%     +98.9%       1890 =C2=B1 11%  sched_debug.cpu#2=
.curr->pid
>        315 =C2=B1  7%    +130.6%        726 =C2=B1  6%  sched_debug.cfs_r=
q[12]:/.tg_runnable_contrib
>      14440 =C2=B1  7%    +131.2%      33389 =C2=B1  6%  sched_debug.cfs_r=
q[12]:/.avg->runnable_avg_sum
>        432 =C2=B1  5%    +124.7%        972 =C2=B1 10%  sched_debug.cpu#6=
0.ttwu_local
>          5 =C2=B1 20%    +175.0%         13 =C2=B1  7%  sched_debug.cpu#6=
2.cpu_load[3]
>          5 =C2=B1 20%    +195.5%         16 =C2=B1 27%  sched_debug.cpu#8=
.cpu_load[4]
>          5 =C2=B1 14%    +143.5%         14 =C2=B1 17%  sched_debug.cpu#1=
5.cpu_load[4]
>          6 =C2=B1 17%    +124.0%         14 =C2=B1 13%  sched_debug.cpu#1=
3.cpu_load[4]
>          5 =C2=B1 20%    +154.5%         14 =C2=B1  8%  sched_debug.cpu#5=
.cpu_load[4]
>          5 =C2=B1 14%    +134.8%         13 =C2=B1 12%  sched_debug.cpu#2=
2.cpu_load[4]
>          5 =C2=B1  9%    +150.0%         13 =C2=B1  7%  sched_debug.cpu#6=
0.cpu_load[0]
>     335869 =C2=B1 14%     -59.3%     136745 =C2=B1  7%  sched_debug.cpu#5=
1.sched_count
>        866 =C2=B1 17%    +113.6%       1850 =C2=B1 17%  sched_debug.cpu#1=
6.curr->pid
>      14550 =C2=B1  1%    +136.4%      34401 =C2=B1  3%  sched_debug.cfs_r=
q[19]:/.avg->runnable_avg_sum
>        843 =C2=B1 20%    +139.5%       2020 =C2=B1  7%  sched_debug.cpu#1=
1.curr->pid
>     598054 =C2=B1 10%     -53.8%     276304 =C2=B1 21%  sched_debug.cpu#4=
2.avg_idle
>          7 =C2=B1 14%     +64.5%         12 =C2=B1  6%  sched_debug.cpu#1=
2.cpu_load[1]
>        317 =C2=B1  1%    +135.9%        749 =C2=B1  3%  sched_debug.cfs_r=
q[19]:/.tg_runnable_contrib
>        826 =C2=B1 17%    +146.3%       2036 =C2=B1  8%  sched_debug.cpu#3=
.curr->pid
>          4 =C2=B1 43%    +173.7%         13 =C2=B1 14%  sched_debug.cfs_r=
q[41]:/.runnable_load_avg
>      15098 =C2=B1  6%    +130.7%      34838 =C2=B1  2%  sched_debug.cfs_r=
q[7]:/.avg->runnable_avg_sum
>     148254 =C2=B1 11%     -55.9%      65306 =C2=B1  0%  sched_debug.cpu#4=
5.ttwu_count
>        329 =C2=B1  6%    +130.3%        758 =C2=B1  2%  sched_debug.cfs_r=
q[7]:/.tg_runnable_contrib
>     170167 =C2=B1  9%     -63.0%      63030 =C2=B1  2%  sched_debug.cpu#5=
3.ttwu_count
>        343 =C2=B1  8%    +113.8%        734 =C2=B1  4%  sched_debug.cfs_r=
q[4]:/.tg_runnable_contrib
>          6 =C2=B1 23%    +130.8%         15 =C2=B1  8%  sched_debug.cpu#5=
8.cpu_load[1]
>      14279 =C2=B1  4%    +138.7%      34087 =C2=B1  1%  sched_debug.cfs_r=
q[8]:/.avg->runnable_avg_sum
>        311 =C2=B1  4%    +137.7%        741 =C2=B1  1%  sched_debug.cfs_r=
q[8]:/.tg_runnable_contrib
>        939 =C2=B1 17%     +97.2%       1852 =C2=B1 10%  sched_debug.cpu#3=
5.ttwu_local
>     148294 =C2=B1 16%     -56.5%      64514 =C2=B1  1%  sched_debug.cpu#4=
5.sched_goidle
>      15760 =C2=B1  8%    +113.6%      33671 =C2=B1  4%  sched_debug.cfs_r=
q[4]:/.avg->runnable_avg_sum
>          8 =C2=B1 19%     +68.8%         13 =C2=B1  3%  sched_debug.cpu#1=
8.cpu_load[2]
>          4 =C2=B1 33%    +177.8%         12 =C2=B1 16%  sched_debug.cfs_r=
q[32]:/.runnable_load_avg
>     180819 =C2=B1  5%     -67.1%      59533 =C2=B1  3%  sched_debug.cpu#3=
9.sched_goidle
>       2125 =C2=B1 39%     +45.1%       3083 =C2=B1 38%  numa-vmstat.node2=
.nr_anon_pages
>       8496 =C2=B1 39%     +45.2%      12333 =C2=B1 38%  numa-meminfo.node=
2.AnonPages
>     177750 =C2=B1  9%     -65.1%      61959 =C2=B1  1%  sched_debug.cpu#5=
0.ttwu_count
>          5 =C2=B1 20%    +147.6%         13 =C2=B1 14%  sched_debug.cpu#3=
2.cpu_load[1]
>      15552 =C2=B1  2%    +124.5%      34911 =C2=B1  5%  sched_debug.cfs_r=
q[6]:/.avg->runnable_avg_sum
>      15315 =C2=B1  4%    +121.2%      33874 =C2=B1  5%  sched_debug.cfs_r=
q[10]:/.avg->runnable_avg_sum
>        339 =C2=B1  2%    +124.3%        760 =C2=B1  5%  sched_debug.cfs_r=
q[6]:/.tg_runnable_contrib
>     297130 =C2=B1 16%     -54.9%     134084 =C2=B1  2%  sched_debug.cpu#4=
5.nr_switches
>        324 =C2=B1  7%    +126.0%        732 =C2=B1  3%  sched_debug.cfs_r=
q[18]:/.tg_runnable_contrib
>        319 =C2=B1  5%    +124.3%        716 =C2=B1  3%  sched_debug.cfs_r=
q[11]:/.tg_runnable_contrib
>        334 =C2=B1  4%    +120.6%        737 =C2=B1  4%  sched_debug.cfs_r=
q[10]:/.tg_runnable_contrib
>      14627 =C2=B1  5%    +124.6%      32849 =C2=B1  3%  sched_debug.cfs_r=
q[11]:/.avg->runnable_avg_sum
>         62 =C2=B1 15%     +81.7%        114 =C2=B1 22%  sched_debug.cfs_r=
q[35]:/.tg_load_contrib
>      57625 =C2=B1  3%    +126.3%     130409 =C2=B1  1%  sched_debug.cfs_r=
q[9]:/.exec_clock
>      15710 =C2=B1  6%    +126.1%      35526 =C2=B1  3%  sched_debug.cfs_r=
q[3]:/.avg->runnable_avg_sum
>      17785 =C2=B1  4%    +114.5%      38148 =C2=B1  2%  sched_debug.cfs_r=
q[24]:/.avg->runnable_avg_sum
>     362283 =C2=B1  5%     -65.8%     123900 =C2=B1  3%  sched_debug.cpu#3=
9.nr_switches
>       9255 =C2=B1 40%     +41.6%      13110 =C2=B1 30%  numa-meminfo.node=
2.Active(anon)
>       2315 =C2=B1 40%     +41.6%       3277 =C2=B1 30%  numa-vmstat.node2=
.nr_active_anon
>        388 =C2=B1  4%    +113.7%        829 =C2=B1  2%  sched_debug.cfs_r=
q[24]:/.tg_runnable_contrib
>      14664 =C2=B1  7%    +125.3%      33037 =C2=B1  5%  sched_debug.cfs_r=
q[14]:/.avg->runnable_avg_sum
>     297259 =C2=B1 16%     -53.6%     138074 =C2=B1  1%  sched_debug.cpu#4=
5.sched_count
>      57759 =C2=B1  3%    +124.4%     129607 =C2=B1  3%  sched_debug.cfs_r=
q[12]:/.exec_clock
>        343 =C2=B1  6%    +125.0%        773 =C2=B1  3%  sched_debug.cfs_r=
q[3]:/.tg_runnable_contrib
>        320 =C2=B1  8%    +124.7%        719 =C2=B1  5%  sched_debug.cfs_r=
q[14]:/.tg_runnable_contrib
>      15258 =C2=B1  8%    +123.9%      34162 =C2=B1  6%  sched_debug.cfs_r=
q[1]:/.avg->runnable_avg_sum
>        355 =C2=B1  8%    +113.2%        757 =C2=B1  1%  sched_debug.cfs_r=
q[2]:/.tg_runnable_contrib
>      59869 =C2=B1  4%    +119.1%     131193 =C2=B1  0%  sched_debug.cfs_r=
q[17]:/.exec_clock
>      60764 =C2=B1  1%    +113.8%     129936 =C2=B1  3%  sched_debug.cfs_r=
q[8]:/.exec_clock
>      16268 =C2=B1  8%    +113.6%      34751 =C2=B1  1%  sched_debug.cfs_r=
q[2]:/.avg->runnable_avg_sum
>        333 =C2=B1  8%    +123.1%        743 =C2=B1  6%  sched_debug.cfs_r=
q[1]:/.tg_runnable_contrib
>      15124 =C2=B1  9%    +125.6%      34123 =C2=B1  6%  sched_debug.cfs_r=
q[0]:/.avg->runnable_avg_sum
>        333 =C2=B1  7%    +117.8%        726 =C2=B1  4%  sched_debug.cfs_r=
q[5]:/.tg_runnable_contrib
>     177540 =C2=B1  9%     -64.7%      62756 =C2=B1  1%  sched_debug.cpu#5=
4.ttwu_count
>      15308 =C2=B1  7%    +118.0%      33371 =C2=B1  4%  sched_debug.cfs_r=
q[5]:/.avg->runnable_avg_sum
>      59954 =C2=B1  6%    +117.7%     130516 =C2=B1  0%  sched_debug.cfs_r=
q[11]:/.exec_clock
>      15754 =C2=B1 10%    +107.9%      32747 =C2=B1  6%  sched_debug.cfs_r=
q[16]:/.avg->runnable_avg_sum
>          5 =C2=B1 22%    +134.8%         13 =C2=B1 11%  sched_debug.cpu#9=
.cpu_load[3]
>        331 =C2=B1  9%    +124.8%        744 =C2=B1  6%  sched_debug.cfs_r=
q[0]:/.tg_runnable_contrib
>        343 =C2=B1 10%    +107.4%        712 =C2=B1  6%  sched_debug.cfs_r=
q[16]:/.tg_runnable_contrib
>          5 =C2=B1 20%    +127.3%         12 =C2=B1 14%  sched_debug.cpu#3=
9.cpu_load[0]
>          4 =C2=B1 27%    +168.4%         12 =C2=B1  8%  sched_debug.cpu#5=
1.cpu_load[1]
>          5 =C2=B1 14%    +113.0%         12 =C2=B1  6%  sched_debug.cfs_r=
q[17]:/.runnable_load_avg
>          5 =C2=B1 30%    +122.7%         12 =C2=B1 17%  sched_debug.cfs_r=
q[35]:/.runnable_load_avg
>          4 =C2=B1 27%    +157.9%         12 =C2=B1 10%  sched_debug.cpu#5=
1.cpu_load[0]
>          5 =C2=B1 20%    +127.3%         12 =C2=B1 14%  sched_debug.cpu#3=
9.cpu_load[1]
>          5 =C2=B1 32%    +131.8%         12 =C2=B1  8%  sched_debug.cpu#6=
3.cpu_load[3]
>          6 =C2=B1 19%     +81.5%         12 =C2=B1 12%  sched_debug.cpu#1=
6.cpu_load[4]
>          5 =C2=B1 24%    +138.1%         12 =C2=B1 14%  sched_debug.cpu#3=
5.cpu_load[2]
>     183707 =C2=B1  5%     -65.1%      64034 =C2=B1  1%  sched_debug.cpu#3=
9.ttwu_count
>     182822 =C2=B1  7%     -64.0%      65856 =C2=B1  4%  sched_debug.cpu#5=
4.sched_goidle
>          3 =C2=B1 43%    +233.3%         12 =C2=B1  8%  sched_debug.cpu#3=
4.cpu_load[4]
>         56 =C2=B1 20%     +78.4%        101 =C2=B1 24%  sched_debug.cfs_r=
q[35]:/.blocked_load_avg
>     139252 =C2=B1 16%     -54.0%      64000 =C2=B1  2%  sched_debug.cpu#4=
2.ttwu_count
>      60499 =C2=B1  4%    +116.0%     130668 =C2=B1  0%  sched_debug.cfs_r=
q[16]:/.exec_clock
>      15134 =C2=B1  9%    +129.3%      34698 =C2=B1  2%  sched_debug.cfs_r=
q[17]:/.avg->runnable_avg_sum
>      60021 =C2=B1  4%    +116.8%     130132 =C2=B1  1%  sched_debug.cfs_r=
q[20]:/.exec_clock
>      60178 =C2=B1  7%    +119.3%     131954 =C2=B1  3%  sched_debug.cfs_r=
q[10]:/.exec_clock
>      60603 =C2=B1  4%    +116.1%     130941 =C2=B1  1%  sched_debug.cfs_r=
q[19]:/.exec_clock
>          5 =C2=B1 22%    +147.8%         14 =C2=B1  9%  sched_debug.cpu#1=
9.cpu_load[4]
>          6 =C2=B1 21%    +133.3%         15 =C2=B1 19%  sched_debug.cpu#1=
.cpu_load[3]
>          7 =C2=B1 20%    +114.3%         15 =C2=B1 12%  sched_debug.cpu#2=
3.cpu_load[3]
>          7 =C2=B1 10%    +103.6%         14 =C2=B1  5%  sched_debug.cpu#3=
.cpu_load[4]
>          6 =C2=B1 26%    +125.0%         13 =C2=B1 15%  sched_debug.cfs_r=
q[11]:/.runnable_load_avg
>          5 =C2=B1 37%    +145.5%         13 =C2=B1 12%  sched_debug.cpu#3=
8.cpu_load[1]
>          6 =C2=B1 20%    +140.0%         15 =C2=B1 12%  sched_debug.cpu#2=
3.cpu_load[4]
>          6 =C2=B1 26%    +103.7%         13 =C2=B1 13%  sched_debug.cfs_r=
q[19]:/.runnable_load_avg
>        887 =C2=B1 19%    +138.4%       2114 =C2=B1  1%  sched_debug.cpu#1=
.curr->pid
>        330 =C2=B1  9%    +128.9%        756 =C2=B1  2%  sched_debug.cfs_r=
q[17]:/.tg_runnable_contrib
>      61838 =C2=B1  3%    +113.9%     132255 =C2=B1  0%  sched_debug.cfs_r=
q[1]:/.exec_clock
>     125542 =C2=B1  9%     -48.0%      65277 =C2=B1  2%  sched_debug.cpu#4=
1.sched_goidle
>     363290 =C2=B1  5%     -64.2%     129971 =C2=B1  3%  sched_debug.cpu#3=
9.sched_count
>      61549 =C2=B1  2%    +110.5%     129558 =C2=B1  1%  sched_debug.cfs_r=
q[5]:/.exec_clock
>     179177 =C2=B1  9%     -64.1%      64237 =C2=B1  4%  sched_debug.cpu#5=
0.sched_goidle
>      62105 =C2=B1  2%    +110.7%     130860 =C2=B1  1%  sched_debug.cfs_r=
q[4]:/.exec_clock
>     366224 =C2=B1  7%     -62.8%     136064 =C2=B1  4%  sched_debug.cpu#5=
4.nr_switches
>        785 =C2=B1 17%    +144.2%       1918 =C2=B1  6%  sched_debug.cpu#6=
3.curr->pid
>          5 =C2=B1 24%    +155.0%         12 =C2=B1 15%  sched_debug.cpu#3=
2.cpu_load[0]
>     366355 =C2=B1  7%     -61.6%     140522 =C2=B1  7%  sched_debug.cpu#5=
4.sched_count
>      17897 =C2=B1  7%    +111.1%      37790 =C2=B1  4%  sched_debug.cfs_r=
q[31]:/.avg->runnable_avg_sum
>      18221 =C2=B1  8%    +102.9%      36980 =C2=B1  4%  sched_debug.cfs_r=
q[25]:/.avg->runnable_avg_sum
>     139298 =C2=B1 21%     -49.4%      70496 =C2=B1  4%  sched_debug.cpu#4=
4.sched_goidle
>        533 =C2=B1 26%    +188.1%       1535 =C2=B1  9%  sched_debug.cpu#5=
1.ttwu_local
>     251646 =C2=B1  9%     -46.2%     135449 =C2=B1  2%  sched_debug.cpu#4=
1.nr_switches
>         81 =C2=B1 31%     +92.0%        156 =C2=B1 16%  sched_debug.cpu#2=
7.nr_uninterruptible
>        397 =C2=B1  8%    +102.3%        803 =C2=B1  4%  sched_debug.cfs_r=
q[25]:/.tg_runnable_contrib
>      62563 =C2=B1  4%    +111.3%     132217 =C2=B1  1%  sched_debug.cfs_r=
q[2]:/.exec_clock
>         15 =C2=B1 20%     +68.3%         25 =C2=B1 42%  sched_debug.cfs_r=
q[61]:/.load
>         15 =C2=B1 20%     +68.3%         25 =C2=B1 42%  sched_debug.cpu#6=
1.load
>        391 =C2=B1  7%    +110.3%        822 =C2=B1  4%  sched_debug.cfs_r=
q[31]:/.tg_runnable_contrib
>     252106 =C2=B1  9%     -45.5%     137280 =C2=B1  3%  sched_debug.cpu#4=
1.sched_count
>     637864 =C2=B1 12%     -48.7%     327236 =C2=B1 15%  sched_debug.cpu#4=
6.avg_idle
>     358959 =C2=B1  9%     -63.0%     132896 =C2=B1  5%  sched_debug.cpu#5=
0.nr_switches
>          4 =C2=B1 31%    +173.7%         13 =C2=B1  9%  sched_debug.cpu#3=
2.cpu_load[2]
>          4 =C2=B1 25%    +206.2%         12 =C2=B1  8%  sched_debug.cpu#5=
5.cpu_load[3]
>      62121 =C2=B1  4%    +110.7%     130896 =C2=B1  1%  sched_debug.cfs_r=
q[6]:/.exec_clock
>         64 =C2=B1 23%    +111.6%        136 =C2=B1 27%  sched_debug.cpu#8=
.nr_uninterruptible
>     359157 =C2=B1  9%     -55.6%     159516 =C2=B1 28%  sched_debug.cpu#5=
0.sched_count
>        923 =C2=B1 21%    +112.5%       1963 =C2=B1 10%  sched_debug.cpu#1=
9.curr->pid
>      61984 =C2=B1  4%    +109.6%     129941 =C2=B1  0%  sched_debug.cfs_r=
q[7]:/.exec_clock
>       1121 =C2=B1 19%     +89.5%       2125 =C2=B1  5%  sched_debug.cpu#3=
1.curr->pid
>      17994 =C2=B1  5%     +98.5%      35718 =C2=B1  1%  sched_debug.cfs_r=
q[27]:/.avg->runnable_avg_sum
>        102 =C2=B1 36%     -47.1%         54 =C2=B1 24%  sched_debug.cfs_r=
q[58]:/.blocked_load_avg
>        392 =C2=B1  5%     +97.5%        775 =C2=B1  1%  sched_debug.cfs_r=
q[27]:/.tg_runnable_contrib
>     279111 =C2=B1 21%     -47.7%     145948 =C2=B1  4%  sched_debug.cpu#4=
4.nr_switches
>      62503 =C2=B1  4%    +109.2%     130769 =C2=B1  0%  sched_debug.cfs_r=
q[3]:/.exec_clock
>     129420 =C2=B1  6%     -48.2%      67042 =C2=B1  2%  sched_debug.cpu#4=
0.ttwu_count
>          8 =C2=B1 13%     +55.9%         13 =C2=B1  6%  sched_debug.cpu#1=
8.cpu_load[1]
>      18170 =C2=B1  8%     +99.1%      36176 =C2=B1  6%  sched_debug.cfs_r=
q[26]:/.avg->runnable_avg_sum
>        396 =C2=B1  8%     +98.7%        788 =C2=B1  6%  sched_debug.cfs_r=
q[26]:/.tg_runnable_contrib
>       1100 =C2=B1  5%     +91.6%       2108 =C2=B1  8%  sched_debug.cpu#3=
4.ttwu_local
>     125224 =C2=B1 22%     -47.0%      66368 =C2=B1  1%  sched_debug.cpu#4=
4.ttwu_count
>     131648 =C2=B1 15%     -51.2%      64301 =C2=B1  0%  sched_debug.cpu#4=
3.ttwu_count
>          5 =C2=B1 25%    +117.4%         12 =C2=B1  6%  sched_debug.cpu#2=
0.cpu_load[4]
>          8 =C2=B1 13%     +87.9%         15 =C2=B1 18%  sched_debug.cpu#3=
6.load
>          7 =C2=B1 17%    +132.1%         16 =C2=B1 27%  sched_debug.cpu#8=
.cpu_load[3]
>          1 =C2=B1 33%    +150.0%          3 =C2=B1 22%  sched_debug.cfs_r=
q[13]:/.nr_spread_over
>          5 =C2=B1 37%    +163.6%         14 =C2=B1 10%  sched_debug.cpu#5=
6.cpu_load[2]
>          6 =C2=B1 16%    +111.1%         14 =C2=B1  7%  sched_debug.cpu#7=
.cpu_load[3]
>          5 =C2=B1 31%    +130.4%         13 =C2=B1 11%  sched_debug.cpu#3=
8.cpu_load[0]
>          8 =C2=B1 13%     +81.8%         15 =C2=B1 16%  sched_debug.cfs_r=
q[36]:/.load
>          6 =C2=B1 13%    +128.0%         14 =C2=B1  7%  sched_debug.cpu#7=
.cpu_load[4]
>          6 =C2=B1 25%    +107.7%         13 =C2=B1  8%  sched_debug.cpu#6=
2.cpu_load[0]
>          7 =C2=B1 10%     +92.9%         13 =C2=B1 16%  sched_debug.cpu#1=
5.cpu_load[3]
>          6 =C2=B1 26%    +103.7%         13 =C2=B1  3%  sched_debug.cpu#1=
7.cpu_load[4]
>          5 =C2=B1 41%    +152.2%         14 =C2=B1 10%  sched_debug.cpu#5=
6.cpu_load[1]
>          5 =C2=B1 41%    +139.1%         13 =C2=B1  7%  sched_debug.cpu#5=
6.cpu_load[0]
>          8 =C2=B1 13%     +69.7%         14 =C2=B1 14%  sched_debug.cpu#1=
9.cpu_load[1]
>          6 =C2=B1 16%     +85.2%         12 =C2=B1 12%  sched_debug.cfs_r=
q[16]:/.runnable_load_avg
>          6 =C2=B1 26%    +129.2%         13 =C2=B1  7%  sched_debug.cpu#6=
2.cpu_load[2]
>          5 =C2=B1 31%    +130.4%         13 =C2=B1  9%  sched_debug.cpu#3=
5.cpu_load[0]
>          7 =C2=B1 20%    +103.6%         14 =C2=B1 12%  sched_debug.cpu#7=
.cpu_load[0]
>          5 =C2=B1 24%    +133.3%         12 =C2=B1  8%  sched_debug.cpu#5=
5.cpu_load[2]
>          6 =C2=B1 33%    +122.2%         15 =C2=B1  8%  sched_debug.cpu#5=
8.cpu_load[0]
>      18222 =C2=B1  6%     +96.9%      35875 =C2=B1  4%  sched_debug.cfs_r=
q[28]:/.avg->runnable_avg_sum
>     146795 =C2=B1 16%     -53.1%      68791 =C2=B1  3%  sched_debug.cpu#4=
2.sched_goidle
>     128302 =C2=B1  7%     -48.8%      65646 =C2=B1  1%  sched_debug.cpu#4=
1.ttwu_count
>        397 =C2=B1  6%     +96.2%        780 =C2=B1  4%  sched_debug.cfs_r=
q[28]:/.tg_runnable_contrib
>     279405 =C2=B1 21%     -45.8%     151308 =C2=B1  3%  sched_debug.cpu#4=
4.sched_count
>      68673 =C2=B1  1%    +101.0%     138021 =C2=B1  1%  sched_debug.cfs_r=
q[0]:/.exec_clock
>      72077 =C2=B1  5%    +100.8%     144728 =C2=B1  0%  sched_debug.cpu#4=
6.nr_load_updates
>      71626 =C2=B1  3%    +101.8%     144571 =C2=B1  0%  sched_debug.cpu#4=
7.nr_load_updates
>        440 =C2=B1 10%     +96.9%        867 =C2=B1  8%  sched_debug.cpu#6=
1.ttwu_local
>     141858 =C2=B1  1%     -50.0%      70866 =C2=B1  3%  sched_debug.cpu#4=
0.sched_goidle
>         33 =C2=B1 36%     -49.3%         17 =C2=B1  4%  sched_debug.cfs_r=
q[0]:/.load
>      73919 =C2=B1  0%     +97.9%     146324 =C2=B1  1%  sched_debug.cpu#4=
0.nr_load_updates
>      73274 =C2=B1  3%     +98.0%     145097 =C2=B1  0%  sched_debug.cpu#4=
1.nr_load_updates
>      17741 =C2=B1  7%    +102.7%      35954 =C2=B1  1%  sched_debug.cfs_r=
q[30]:/.avg->runnable_avg_sum
>      73236 =C2=B1  2%     +98.0%     145027 =C2=B1  0%  sched_debug.cfs_r=
q[24]:/.exec_clock
>      72077 =C2=B1  2%     +99.4%     143704 =C2=B1  0%  sched_debug.cfs_r=
q[25]:/.exec_clock
>        387 =C2=B1  7%    +102.1%        783 =C2=B1  1%  sched_debug.cfs_r=
q[30]:/.tg_runnable_contrib
>          5 =C2=B1 46%    +145.0%         12 =C2=B1 12%  sched_debug.cpu#3=
4.cpu_load[3]
>         33 =C2=B1 39%     -49.3%         17 =C2=B1  7%  sched_debug.cpu#0=
.load
>     294115 =C2=B1 16%     -51.6%     142381 =C2=B1  3%  sched_debug.cpu#4=
2.nr_switches
>        933 =C2=B1 18%    +112.0%       1978 =C2=B1 20%  sched_debug.cpu#2=
2.curr->pid
>        850 =C2=B1 14%    +111.4%       1797 =C2=B1  4%  sched_debug.cpu#4=
.curr->pid
>          5 =C2=B1 20%    +118.2%         12 =C2=B1 15%  sched_debug.cpu#5=
5.cpu_load[0]
>      71684 =C2=B1  3%     +95.6%     140217 =C2=B1  0%  sched_debug.cfs_r=
q[29]:/.exec_clock
>      73607 =C2=B1  6%     +98.7%     146254 =C2=B1  1%  sched_debug.cpu#4=
4.nr_load_updates
>     114289 =C2=B1 13%     -42.7%      65451 =C2=B1  0%  sched_debug.cpu#4=
7.ttwu_count
>      71217 =C2=B1  3%     +96.7%     140070 =C2=B1  0%  sched_debug.cfs_r=
q[28]:/.exec_clock
>      72279 =C2=B1  3%     +95.6%     141391 =C2=B1  0%  sched_debug.cfs_r=
q[26]:/.exec_clock
>        480 =C2=B1  2%     +76.0%        845 =C2=B1 11%  sched_debug.cpu#6=
3.ttwu_local
>      71428 =C2=B1  4%     +95.5%     139650 =C2=B1  0%  sched_debug.cfs_r=
q[31]:/.exec_clock
>      72174 =C2=B1  4%     +94.9%     140663 =C2=B1  0%  sched_debug.cfs_r=
q[27]:/.exec_clock
>      73935 =C2=B1  4%     +95.9%     144836 =C2=B1  0%  sched_debug.cpu#4=
3.nr_load_updates
>        469 =C2=B1  6%     +92.1%        902 =C2=B1 13%  sched_debug.cpu#5=
9.ttwu_local
>       1004 =C2=B1 21%     +95.8%       1966 =C2=B1  4%  sched_debug.cpu#2=
9.curr->pid
>       1103 =C2=B1 13%     +68.5%       1859 =C2=B1 11%  sched_debug.cpu#2=
8.curr->pid
>     284228 =C2=B1  1%     -48.4%     146748 =C2=B1  3%  sched_debug.cpu#4=
0.nr_switches
>     533580 =C2=B1  6%     -43.9%     299569 =C2=B1 15%  sched_debug.cpu#5=
2.avg_idle
>        985 =C2=B1  9%     +95.8%       1928 =C2=B1  5%  sched_debug.cpu#3=
3.ttwu_local
>        150 =C2=B1 16%     -55.5%         67 =C2=B1 32%  sched_debug.cfs_r=
q[52]:/.blocked_load_avg
>          8 =C2=B1  9%     +91.4%         16 =C2=B1  4%  sched_debug.cpu#2=
4.cpu_load[4]
>         34 =C2=B1 36%     -51.4%         16 =C2=B1 14%  sched_debug.cfs_r=
q[28]:/.load
>          9 =C2=B1 41%     +77.8%         16 =C2=B1 11%  sched_debug.cpu#5=
4.load
>          9 =C2=B1 41%     +77.8%         16 =C2=B1 11%  sched_debug.cfs_r=
q[54]:/.load
>     288105 =C2=B1  2%     -48.2%     149355 =C2=B1  3%  sched_debug.cpu#4=
0.sched_count
>     574987 =C2=B1 15%     -44.0%     321728 =C2=B1 24%  sched_debug.cpu#4=
9.avg_idle
>      75106 =C2=B1  6%     +92.2%     144349 =C2=B1  0%  sched_debug.cpu#4=
2.nr_load_updates
>        887 =C2=B1 23%    +117.8%       1933 =C2=B1 10%  sched_debug.cpu#5=
.curr->pid
>          7 =C2=B1 10%     +80.6%         14 =C2=B1 11%  sched_debug.cpu#1=
9.cpu_load[2]
>          7 =C2=B1 14%     +86.7%         14 =C2=B1 11%  sched_debug.cpu#5=
.cpu_load[2]
>          7 =C2=B1 14%    +103.6%         14 =C2=B1  9%  sched_debug.cpu#1=
9.cpu_load[3]
>          7 =C2=B1 19%     +83.9%         14 =C2=B1  5%  sched_debug.cpu#3=
.cpu_load[0]
>          6 =C2=B1 41%    +103.8%         13 =C2=B1 13%  sched_debug.cfs_r=
q[9]:/.runnable_load_avg
>          7 =C2=B1 19%     +93.5%         15 =C2=B1 12%  sched_debug.cpu#1=
.cpu_load[2]
>          7 =C2=B1 26%    +100.0%         14 =C2=B1  8%  sched_debug.cfs_r=
q[1]:/.runnable_load_avg
>      72318 =C2=B1  4%     +91.9%     138766 =C2=B1  0%  sched_debug.cfs_r=
q[30]:/.exec_clock
>     294503 =C2=B1 16%     -50.5%     145879 =C2=B1  4%  sched_debug.cpu#4=
2.sched_count
>          6 =C2=B1 21%     +77.8%         12 =C2=B1  8%  sched_debug.cpu#2=
0.cpu_load[2]
>          7 =C2=B1 20%     +80.0%         13 =C2=B1 15%  sched_debug.cpu#1=
3.cpu_load[3]
>          7 =C2=B1 20%     +70.0%         12 =C2=B1  3%  sched_debug.cfs_r=
q[12]:/.runnable_load_avg
>          7 =C2=B1 36%     +82.1%         12 =C2=B1  8%  sched_debug.cpu#6=
3.cpu_load[2]
>          6 =C2=B1 20%    +104.0%         12 =C2=B1  6%  sched_debug.cpu#1=
2.cpu_load[4]
>          5 =C2=B1 20%    +122.7%         12 =C2=B1 13%  sched_debug.cpu#5=
5.cpu_load[1]
>          7 =C2=B1 35%     +73.3%         13 =C2=B1  5%  sched_debug.cfs_r=
q[0]:/.runnable_load_avg
>          6 =C2=B1 20%    +104.0%         12 =C2=B1 11%  sched_debug.cpu#3=
5.cpu_load[1]
>          7 =C2=B1 26%     +71.4%         12 =C2=B1  8%  sched_debug.cpu#2=
0.cpu_load[1]
>          6 =C2=B1  6%     +92.6%         13 =C2=B1  5%  sched_debug.cfs_r=
q[3]:/.runnable_load_avg
>          6 =C2=B1  7%    +107.7%         13 =C2=B1 11%  sched_debug.cpu#6=
.cpu_load[4]
>          7 =C2=B1 26%     +82.1%         12 =C2=B1  3%  sched_debug.cpu#4=
.cpu_load[4]
>          6 =C2=B1 27%     +96.2%         12 =C2=B1  3%  sched_debug.cpu#1=
4.cpu_load[4]
>          7 =C2=B1 10%     +71.4%         12 =C2=B1 13%  sched_debug.cpu#1=
6.cpu_load[3]
>     152023 =C2=B1 25%    +155.4%     388338 =C2=B1 34%  sched_debug.cfs_r=
q[28]:/.spread0
>        905 =C2=B1 21%    +107.1%       1874 =C2=B1 15%  sched_debug.cpu#6=
.curr->pid
>       1065 =C2=B1 14%     +82.7%       1945 =C2=B1  8%  sched_debug.cpu#3=
0.curr->pid
>     109213 =C2=B1 14%     -39.5%      66094 =C2=B1  2%  sched_debug.cpu#4=
7.sched_goidle
>        969 =C2=B1 27%    +110.6%       2042 =C2=B1  3%  sched_debug.cpu#9=
.curr->pid
>     123361 =C2=B1 14%     -45.7%      66953 =C2=B1  4%  sched_debug.cpu#4=
3.sched_goidle
>      76544 =C2=B1  5%     +90.2%     145574 =C2=B1  0%  sched_debug.cpu#4=
5.nr_load_updates
>     624604 =C2=B1  7%     -46.8%     331988 =C2=B1 13%  sched_debug.cpu#4=
4.avg_idle
>     218936 =C2=B1 14%     -37.2%     137507 =C2=B1  2%  sched_debug.cpu#4=
7.nr_switches
>     519754 =C2=B1 12%     -38.6%     318976 =C2=B1  6%  sched_debug.cpu#3=
3.avg_idle
>       1048 =C2=B1  4%     +90.7%       1999 =C2=B1  4%  sched_debug.cpu#2=
7.curr->pid
>          9 =C2=B1 32%     +77.8%         16 =C2=B1 17%  sched_debug.cpu#5=
0.load
>          9 =C2=B1 32%     +75.0%         15 =C2=B1 15%  sched_debug.cfs_r=
q[50]:/.load
>      80125 =C2=B1  3%     +80.9%     144977 =C2=B1  0%  sched_debug.cpu#5=
4.nr_load_updates
>      79744 =C2=B1  4%     +82.3%     145334 =C2=B1  1%  sched_debug.cpu#5=
3.nr_load_updates
>          6 =C2=B1 41%    +104.0%         12 =C2=B1 14%  sched_debug.cpu#3=
4.cpu_load[2]
>      80391 =C2=B1  2%     +79.7%     144447 =C2=B1  0%  sched_debug.cpu#5=
2.nr_load_updates
>      80078 =C2=B1  4%     +80.5%     144562 =C2=B1  0%  sched_debug.cpu#4=
8.nr_load_updates
>      80441 =C2=B1  5%     +79.8%     144606 =C2=B1  0%  sched_debug.cpu#5=
1.nr_load_updates
>      80274 =C2=B1  3%     +79.6%     144142 =C2=B1  0%  sched_debug.cpu#5=
5.nr_load_updates
>          8 =C2=B1 13%     +70.6%         14 =C2=B1 14%  sched_debug.cpu#5=
.cpu_load[1]
>          8 =C2=B1 16%     +74.3%         15 =C2=B1 12%  sched_debug.cpu#0=
.cpu_load[3]
>          8 =C2=B1 19%     +96.9%         15 =C2=B1 11%  sched_debug.cpu#0=
.cpu_load[4]
>          9 =C2=B1 21%     +60.5%         15 =C2=B1  5%  sched_debug.cfs_r=
q[52]:/.load
>     622405 =C2=B1  3%     -45.1%     341805 =C2=B1 14%  sched_debug.cpu#4=
1.avg_idle
>     247262 =C2=B1 14%     -43.8%     138983 =C2=B1  4%  sched_debug.cpu#4=
3.nr_switches
>     556949 =C2=B1 13%     -40.8%     329934 =C2=B1 13%  sched_debug.cpu#4=
8.avg_idle
>     220428 =C2=B1 13%     -29.8%     154692 =C2=B1 13%  sched_debug.cpu#4=
7.sched_count
>       1136 =C2=B1 12%     +67.9%       1907 =C2=B1  7%  sched_debug.cpu#2=
6.curr->pid
>        852 =C2=B1 18%    +117.6%       1855 =C2=B1  9%  sched_debug.cpu#8=
.curr->pid
>          6 =C2=B1 23%    +112.0%         13 =C2=B1  8%  sched_debug.cpu#9=
.cpu_load[2]
>      80479 =C2=B1  3%     +79.5%     144456 =C2=B1  0%  sched_debug.cpu#5=
0.nr_load_updates
>  5.655e+09 =C2=B1  3%     -58.4%  2.351e+09 =C2=B1  2%  cpuidle.C3-NHM.ti=
me
>       1846 =C2=B1 11%     +59.3%       2941 =C2=B1 16%  sched_debug.cpu#2=
.ttwu_local
>          7 =C2=B1 14%     +80.6%         14 =C2=B1 10%  sched_debug.cpu#7=
.cpu_load[1]
>          8 =C2=B1 17%     +78.1%         14 =C2=B1  7%  sched_debug.cpu#1=
.cpu_load[1]
>          7 =C2=B1  5%     +58.1%         12 =C2=B1 14%  sched_debug.cpu#1=
6.cpu_load[2]
>          6 =C2=B1 19%    +103.7%         13 =C2=B1  7%  sched_debug.cpu#6=
2.cpu_load[1]
>          7 =C2=B1 14%     +74.2%         13 =C2=B1  3%  sched_debug.cpu#2=
.cpu_load[4]
>          7 =C2=B1 14%     +80.6%         14 =C2=B1 10%  sched_debug.cpu#7=
.cpu_load[2]
>          6 =C2=B1 19%    +100.0%         13 =C2=B1  8%  sched_debug.cpu#5=
.cpu_load[3]
>          7 =C2=B1 14%     +61.3%         12 =C2=B1 25%  sched_debug.cfs_r=
q[15]:/.runnable_load_avg
>          6 =C2=B1 31%    +107.7%         13 =C2=B1 13%  sched_debug.cfs_r=
q[63]:/.runnable_load_avg
>          7 =C2=B1 10%    +106.5%         16 =C2=B1 29%  sched_debug.cpu#8=
.cpu_load[2]
>          8 =C2=B1  8%     +75.0%         14 =C2=B1  5%  sched_debug.cpu#3=
.cpu_load[3]
>          7 =C2=B1 23%     +80.6%         14 =C2=B1  5%  sched_debug.cpu#1=
7.cpu_load[3]
>          8 =C2=B1 15%     +96.9%         15 =C2=B1 30%  sched_debug.cpu#8=
.cpu_load[0]
>      83696 =C2=B1  0%     +74.1%     145676 =C2=B1  0%  sched_debug.cpu#3=
4.nr_load_updates
>      81108 =C2=B1  4%     +77.9%     144284 =C2=B1  0%  sched_debug.cpu#4=
9.nr_load_updates
>       1152 =C2=B1 10%     +93.6%       2230 =C2=B1  8%  sched_debug.cpu#3=
2.ttwu_local
>      83482 =C2=B1  4%     +74.1%     145347 =C2=B1  0%  sched_debug.cpu#3=
8.nr_load_updates
>     563098 =C2=B1 11%     -40.3%     336316 =C2=B1 11%  sched_debug.cpu#5=
3.avg_idle
>        473 =C2=B1 11%     +73.6%        821 =C2=B1  6%  sched_debug.cpu#6=
2.ttwu_local
>      84691 =C2=B1  1%     +72.7%     146295 =C2=B1  0%  sched_debug.cpu#3=
5.nr_load_updates
>         28 =C2=B1 37%     -43.8%         15 =C2=B1 16%  sched_debug.cfs_r=
q[13]:/.load
>         27 =C2=B1 38%     -42.7%         15 =C2=B1 16%  sched_debug.cpu#1=
3.load
>      82882 =C2=B1  2%     +75.6%     145577 =C2=B1  0%  sched_debug.cpu#3=
9.nr_load_updates
>     498258 =C2=B1  7%     -32.4%     336924 =C2=B1 21%  sched_debug.cpu#3=
4.avg_idle
>      83560 =C2=B1  1%     +74.4%     145717 =C2=B1  0%  sched_debug.cpu#3=
6.nr_load_updates
>        469 =C2=B1 10%     +71.8%        807 =C2=B1  8%  sched_debug.cpu#5=
7.ttwu_local
>     247486 =C2=B1 14%     -41.8%     143921 =C2=B1  3%  sched_debug.cpu#4=
3.sched_count
>        155 =C2=B1 17%     -49.3%         78 =C2=B1 43%  sched_debug.cfs_r=
q[49]:/.blocked_load_avg
>     527328 =C2=B1 14%     -32.7%     354686 =C2=B1 30%  sched_debug.cpu#5=
0.avg_idle
>        951 =C2=B1 18%     +96.5%       1868 =C2=B1 12%  sched_debug.cpu#2=
1.curr->pid
>        446 =C2=B1  8%     +88.5%        840 =C2=B1  8%  sched_debug.cpu#5=
6.ttwu_local
>          6 =C2=B1 17%     +84.6%         12 =C2=B1  5%  sched_debug.cpu#2=
0.cpu_load[3]
>      84258 =C2=B1  2%     +72.9%     145705 =C2=B1  0%  sched_debug.cpu#3=
3.nr_load_updates
>      84000 =C2=B1  3%     +73.6%     145816 =C2=B1  0%  sched_debug.cpu#3=
7.nr_load_updates
>          7 =C2=B1 48%    +103.3%         15 =C2=B1 15%  sched_debug.cfs_r=
q[49]:/.load
>         10 =C2=B1 36%     +67.5%         16 =C2=B1  8%  sched_debug.cpu#4=
1.load
>     553971 =C2=B1 16%     -38.8%     338817 =C2=B1 26%  sched_debug.cpu#4=
5.avg_idle
>       1048 =C2=B1 22%     +89.7%       1988 =C2=B1 11%  sched_debug.cpu#1=
0.curr->pid
>      90262 =C2=B1  2%     +57.1%     141765 =C2=B1  1%  sched_debug.cpu#0=
.nr_load_updates
>        883 =C2=B1  3%     -42.0%        512 =C2=B1  4%  cpuidle.POLL.usage
>    2381442 =C2=B1  0%     -45.9%    1288111 =C2=B1  0%  cpuidle.C3-NHM.us=
age
>     503911 =C2=B1 14%     -41.6%     294421 =C2=B1 20%  sched_debug.cpu#5=
4.avg_idle
>          8 =C2=B1 16%     +60.0%         14 =C2=B1  7%  sched_debug.cpu#3=
.cpu_load[1]
>          8 =C2=B1  9%     +54.3%         13 =C2=B1 15%  sched_debug.cpu#1=
9.cpu_load[0]
>          8 =C2=B1 19%     +71.9%         13 =C2=B1  9%  sched_debug.cpu#1=
7.cpu_load[1]
>          9 =C2=B1 21%     +60.5%         15 =C2=B1  2%  sched_debug.cpu#5=
2.load
>        107 =C2=B1 34%     -36.0%         68 =C2=B1 17%  sched_debug.cfs_r=
q[58]:/.tg_load_contrib
>     112841 =C2=B1 17%     -41.9%      65594 =C2=B1  1%  sched_debug.cpu#4=
6.ttwu_count
>     604642 =C2=B1  8%     -34.9%     393664 =C2=B1 28%  sched_debug.cpu#4=
0.avg_idle
>        154 =C2=B1 16%     -47.8%         80 =C2=B1 26%  sched_debug.cfs_r=
q[52]:/.tg_load_contrib
>          7 =C2=B1 11%     +73.3%         13 =C2=B1  5%  sched_debug.cpu#1=
8.cpu_load[0]
>          7 =C2=B1 34%     +64.5%         12 =C2=B1  8%  sched_debug.cpu#6=
3.cpu_load[1]
>          6 =C2=B1 19%     +88.9%         12 =C2=B1  6%  sched_debug.cpu#1=
2.cpu_load[3]
>          7 =C2=B1  6%     +76.7%         13 =C2=B1  8%  sched_debug.cpu#6=
.cpu_load[3]
>          5 =C2=B1 49%    +108.7%         12 =C2=B1 13%  sched_debug.cpu#4=
5.cpu_load[0]
>          7 =C2=B1 19%     +64.5%         12 =C2=B1  6%  sched_debug.cpu#4=
.cpu_load[3]
>          7 =C2=B1 11%     +65.5%         12 =C2=B1 13%  sched_debug.cpu#2=
1.cpu_load[3]
>          7 =C2=B1 38%     +70.0%         12 =C2=B1  8%  sched_debug.cpu#6=
3.cpu_load[0]
>          7 =C2=B1 14%     +70.0%         12 =C2=B1  6%  sched_debug.cpu#1=
2.cpu_load[2]
>          7 =C2=B1 11%     +75.9%         12 =C2=B1  6%  sched_debug.cpu#1=
2.cpu_load[0]
>          7 =C2=B1 14%     +73.3%         13 =C2=B1  9%  sched_debug.cpu#1=
0.cpu_load[4]
>          6 =C2=B1 43%     +96.3%         13 =C2=B1 16%  sched_debug.cpu#3=
4.cpu_load[1]
>          7 =C2=B1 20%     +82.8%         13 =C2=B1  8%  sched_debug.cpu#9=
.cpu_load[1]
>          7 =C2=B1 29%     +76.7%         13 =C2=B1 13%  sched_debug.cpu#9=
.cpu_load[0]
>          6 =C2=B1 28%    +125.9%         15 =C2=B1 37%  sched_debug.cfs_r=
q[8]:/.runnable_load_avg
>          8 =C2=B1  8%     +50.0%         12 =C2=B1 13%  sched_debug.cpu#2=
1.cpu_load[2]
>         99 =C2=B1 22%     -36.4%         63 =C2=B1 40%  sched_debug.cfs_r=
q[16]:/.tg_load_contrib
>      92714 =C2=B1  2%     +65.3%     153258 =C2=B1  0%  sched_debug.cpu#5=
6.nr_load_updates
>     122255 =C2=B1 18%     -42.8%      69927 =C2=B1  3%  sched_debug.cpu#4=
6.sched_goidle
>       1038 =C2=B1 12%     +93.7%       2010 =C2=B1 21%  sched_debug.cpu#1=
3.curr->pid
>     637159 =C2=B1  6%     -42.8%     364152 =C2=B1 16%  sched_debug.cpu#4=
7.avg_idle
>          9 =C2=B1 20%     +75.0%         15 =C2=B1 13%  sched_debug.cfs_r=
q[53]:/.load
>          8 =C2=B1 18%     +77.1%         15 =C2=B1 30%  sched_debug.cpu#5=
.cpu_load[0]
>         10 =C2=B1  7%     +55.0%         15 =C2=B1  3%  sched_debug.cpu#2=
4.cpu_load[2]
>         10 =C2=B1 18%     +52.5%         15 =C2=B1  9%  sched_debug.cpu#0=
.cpu_load[2]
>          9 =C2=B1 15%     +70.3%         15 =C2=B1 13%  sched_debug.cpu#5=
3.load
>          9 =C2=B1  8%     +64.1%         16 =C2=B1  4%  sched_debug.cpu#2=
4.cpu_load[3]
>      93245 =C2=B1  3%     +64.3%     153239 =C2=B1  0%  sched_debug.cpu#5=
7.nr_load_updates
>      93978 =C2=B1  3%     +63.3%     153433 =C2=B1  0%  sched_debug.cpu#5=
8.nr_load_updates
>         53 =C2=B1 20%     -48.1%         27 =C2=B1 39%  sched_debug.cfs_r=
q[24]:/.tg_load_contrib
>      93568 =C2=B1  3%     +62.6%     152138 =C2=B1  0%  sched_debug.cpu#6=
2.nr_load_updates
>     505486 =C2=B1 18%     -33.6%     335452 =C2=B1 14%  sched_debug.cpu#3=
5.avg_idle
>      93233 =C2=B1  3%     +62.7%     151695 =C2=B1  0%  sched_debug.cpu#6=
0.nr_load_updates
>     245017 =C2=B1 18%     -40.9%     144877 =C2=B1  3%  sched_debug.cpu#4=
6.nr_switches
>      93586 =C2=B1  3%     +61.9%     151487 =C2=B1  0%  sched_debug.cpu#6=
1.nr_load_updates
>         11 =C2=B1 18%     +47.8%         17 =C2=B1 12%  sched_debug.cfs_r=
q[58]:/.load
>         11 =C2=B1 27%     +54.5%         17 =C2=B1 12%  sched_debug.cpu#5=
8.load
>         27 =C2=B1 17%     -33.6%         18 =C2=B1  7%  sched_debug.cfs_r=
q[31]:/.load
>      94340 =C2=B1  2%     +61.7%     152558 =C2=B1  0%  sched_debug.cpu#5=
9.nr_load_updates
>      94212 =C2=B1  3%     +60.6%     151306 =C2=B1  0%  sched_debug.cpu#6=
3.nr_load_updates
>        785 =C2=B1 14%     +29.1%       1014 =C2=B1 18%  sched_debug.cpu#3=
0.ttwu_local
>          8 =C2=B1 23%     +71.9%         13 =C2=B1  7%  sched_debug.cpu#1=
7.cpu_load[2]
>          8 =C2=B1 17%     +63.6%         13 =C2=B1  6%  sched_debug.cpu#2=
.cpu_load[3]
>          8 =C2=B1 13%     +64.7%         14 =C2=B1  5%  sched_debug.cpu#3=
.cpu_load[2]
>          9 =C2=B1  4%     +48.6%         13 =C2=B1  3%  sched_debug.cpu#2=
7.cpu_load[4]
>          8 =C2=B1 20%     +54.3%         13 =C2=B1  6%  sched_debug.cpu#2=
.cpu_load[2]
>          7 =C2=B1 24%     +82.8%         13 =C2=B1 11%  sched_debug.cpu#1=
7.cpu_load[0]
>          8 =C2=B1 16%     +62.9%         14 =C2=B1  7%  sched_debug.cpu#1=
.cpu_load[0]
>          8 =C2=B1 10%     +93.9%         16 =C2=B1 29%  sched_debug.cpu#8=
.cpu_load[1]
>          8 =C2=B1 10%     +63.6%         13 =C2=B1 16%  sched_debug.cpu#1=
5.cpu_load[2]
>          9 =C2=B1 23%     +38.9%         12 =C2=B1 12%  sched_debug.cpu#1=
6.cpu_load[0]
>          8 =C2=B1  5%     +55.9%         13 =C2=B1  9%  sched_debug.cpu#1=
0.cpu_load[3]
>          8 =C2=B1 13%     +47.1%         12 =C2=B1 12%  sched_debug.cpu#1=
6.cpu_load[1]
>          6 =C2=B1 36%     +92.6%         13 =C2=B1 12%  sched_debug.cfs_r=
q[6]:/.runnable_load_avg
>     502140 =C2=B1 12%     -35.6%     323535 =C2=B1 15%  sched_debug.cpu#5=
1.avg_idle
>     746062 =C2=B1  1%     -47.1%     394583 =C2=B1  0%  softirqs.SCHED
>       1078 =C2=B1  4%     +50.7%       1625 =C2=B1  9%  sched_debug.cpu#2=
2.ttwu_local
>        740 =C2=B1 12%     +35.0%        999 =C2=B1 11%  sched_debug.cpu#2=
5.ttwu_local
>     245937 =C2=B1 18%     -39.0%     150096 =C2=B1  4%  sched_debug.cpu#4=
6.sched_count
>         78 =C2=B1 43%     -53.5%         36 =C2=B1 44%  sched_debug.cfs_r=
q[57]:/.tg_load_contrib
>         28 =C2=B1 19%     -33.9%         18 =C2=B1  8%  sched_debug.cpu#3=
1.load
>          7 =C2=B1 14%     +76.7%         13 =C2=B1 16%  sched_debug.cfs_r=
q[22]:/.runnable_load_avg
>         10 =C2=B1 12%     +41.9%         15 =C2=B1  2%  sched_debug.cpu#2=
4.cpu_load[1]
>         22 =C2=B1  7%     -31.1%         15 =C2=B1  7%  sched_debug.cpu#2=
1.load
>          7 =C2=B1  6%     +56.7%         11 =C2=B1  9%  sched_debug.cfs_r=
q[4]:/.runnable_load_avg
>          9 =C2=B1 37%     +52.6%         14 =C2=B1 10%  sched_debug.cpu#2=
.cpu_load[0]
>          7 =C2=B1 14%     +56.7%         11 =C2=B1 18%  sched_debug.cfs_r=
q[21]:/.runnable_load_avg
>          9 =C2=B1 33%     +78.9%         17 =C2=B1  9%  sched_debug.cpu#4=
2.load
>       3.40 =C2=B1  2%     -45.0%       1.87 =C2=B1  8%  turbostat.%c3
>         73 =C2=B1 29%     +66.6%        122 =C2=B1 21%  sched_debug.cpu#2=
9.nr_uninterruptible
>     611173 =C2=B1  6%     -49.8%     306820 =C2=B1 15%  sched_debug.cpu#4=
3.avg_idle
>    2095578 =C2=B1  1%     -31.4%    1438534 =C2=B1  0%  numa-meminfo.node=
3.SUnreclaim
>     523718 =C2=B1  1%     -31.3%     359624 =C2=B1  0%  numa-vmstat.node3=
.nr_slab_unreclaimable
>    2106490 =C2=B1  1%     -31.2%    1449462 =C2=B1  0%  numa-meminfo.node=
3.Slab
>     886663 =C2=B1  1%     -31.2%     609723 =C2=B1  0%  numa-meminfo.node=
3.PageTables
>     221608 =C2=B1  1%     -31.2%     152413 =C2=B1  0%  numa-vmstat.node3=
.nr_page_table_pages
>         10 =C2=B1 23%     +52.5%         15 =C2=B1 12%  sched_debug.cpu#3=
1.cpu_load[4]
>          9 =C2=B1 32%     +70.3%         15 =C2=B1  6%  sched_debug.cfs_r=
q[42]:/.load
>      86466 =C2=B1  2%     +69.6%     146665 =C2=B1  1%  sched_debug.cpu#3=
2.nr_load_updates
>       3404 =C2=B1 17%     +27.2%       4329 =C2=B1 12%  numa-meminfo.node=
2.Mapped
>          8 =C2=B1 16%     +51.4%         13 =C2=B1 17%  sched_debug.cpu#1=
3.cpu_load[2]
>          8 =C2=B1 13%     +52.9%         13 =C2=B1  9%  sched_debug.cpu#6=
.cpu_load[0]
>          7 =C2=B1 33%     +58.1%         12 =C2=B1 15%  sched_debug.cpu#2=
1.cpu_load[0]
>          8 =C2=B1 10%     +57.6%         13 =C2=B1  9%  sched_debug.cpu#6=
.cpu_load[2]
>          8 =C2=B1 21%     +47.1%         12 =C2=B1  4%  sched_debug.cpu#1=
4.cpu_load[2]
>          9 =C2=B1 15%     +44.4%         13 =C2=B1  9%  sched_debug.cpu#4=
.cpu_load[1]
>          8 =C2=B1 21%     +50.0%         12 =C2=B1  6%  sched_debug.cpu#4=
.cpu_load[2]
>          8 =C2=B1 15%     +48.5%         12 =C2=B1 15%  sched_debug.cpu#2=
1.cpu_load[1]
>          8 =C2=B1 23%     +71.9%         13 =C2=B1 13%  sched_debug.cfs_r=
q[23]:/.runnable_load_avg
>          8 =C2=B1 24%     +40.0%         12 =C2=B1 12%  sched_debug.cfs_r=
q[10]:/.runnable_load_avg
>         27 =C2=B1 13%     -38.0%         16 =C2=B1 14%  sched_debug.cpu#2=
8.load
>     403384 =C2=B1  8%     -29.5%     284499 =C2=B1 10%  sched_debug.cpu#5=
6.avg_idle
>        852 =C2=B1 17%     +26.8%       1080 =C2=B1 12%  numa-vmstat.node2=
.nr_mapped
>    3218544 =C2=B1  1%     -29.6%    2264649 =C2=B1  0%  numa-meminfo.node=
3.MemUsed
>        703 =C2=B1 10%     +33.3%        938 =C2=B1 13%  sched_debug.cpu#3=
1.ttwu_local
>     488743 =C2=B1 12%     -37.1%     307311 =C2=B1  7%  sched_debug.cpu#3=
9.avg_idle
>          8 =C2=B1 37%     +88.6%         16 =C2=B1 10%  sched_debug.cfs_r=
q[39]:/.load
>          9 =C2=B1 39%     +83.3%         16 =C2=B1 10%  sched_debug.cpu#3=
9.load
>          9 =C2=B1  5%     +39.5%         13 =C2=B1  9%  sched_debug.cpu#1=
0.cpu_load[2]
>          9 =C2=B1 14%     +48.6%         13 =C2=B1  3%  sched_debug.cfs_r=
q[25]:/.runnable_load_avg
>         10 =C2=B1  7%     +35.0%         13 =C2=B1  8%  sched_debug.cpu#2=
8.cpu_load[3]
>          9 =C2=B1 15%     +43.2%         13 =C2=B1 18%  sched_debug.cpu#1=
5.cpu_load[1]
>         10 =C2=B1  7%     +35.0%         13 =C2=B1  3%  sched_debug.cpu#2=
7.cpu_load[3]
>          8 =C2=B1 14%     +51.4%         13 =C2=B1  9%  sched_debug.cpu#6=
.cpu_load[1]
>          9 =C2=B1  8%     +45.9%         13 =C2=B1  8%  sched_debug.cpu#2=
8.cpu_load[4]
>     944754 =C2=B1  0%     -28.1%     678924 =C2=B1  1%  numa-numastat.nod=
e3.local_node
>     948941 =C2=B1  0%     -28.0%     683119 =C2=B1  1%  numa-numastat.nod=
e3.numa_hit
>     114901 =C2=B1  2%     +34.7%     154715 =C2=B1  1%  sched_debug.cpu#9=
.nr_load_updates
>         25 =C2=B1  6%     -31.0%         17 =C2=B1 11%  sched_debug.cpu#3=
0.load
>       1460 =C2=B1 19%     +37.8%       2013 =C2=B1 10%  sched_debug.cpu#7=
.ttwu_local
>     460171 =C2=B1  5%     -30.5%     319618 =C2=B1 10%  sched_debug.cpu#3=
2.avg_idle
>         10 =C2=B1 14%     +36.6%         14 =C2=B1  8%  sched_debug.cpu#2=
5.cpu_load[4]
>          8 =C2=B1 31%     +65.7%         14 =C2=B1  7%  sched_debug.cfs_r=
q[24]:/.runnable_load_avg
>     607228 =C2=B1  1%     -27.9%     437862 =C2=B1  3%  numa-vmstat.node3=
.numa_local
>     114663 =C2=B1  1%     +33.1%     152576 =C2=B1  1%  sched_debug.cpu#1=
2.nr_load_updates
>     513031 =C2=B1 16%     -32.2%     347796 =C2=B1 10%  sched_debug.cpu#3=
7.avg_idle
>       2004 =C2=B1 18%     +44.1%       2888 =C2=B1 11%  proc-vmstat.numa_=
pages_migrated
>       2004 =C2=B1 18%     +44.1%       2888 =C2=B1 11%  proc-vmstat.pgmig=
rate_success
>     644441 =C2=B1  1%     -26.3%     474922 =C2=B1  3%  numa-vmstat.node3=
.numa_hit
>          7 =C2=B1 27%     +66.7%         12 =C2=B1 12%  sched_debug.cfs_r=
q[5]:/.runnable_load_avg
>         11 =C2=B1 15%     +38.6%         15 =C2=B1 12%  sched_debug.cpu#3=
1.cpu_load[3]
>         11 =C2=B1 11%     +35.6%         15 =C2=B1 12%  sched_debug.cpu#3=
1.cpu_load[2]
>          7 =C2=B1 22%     +63.3%         12 =C2=B1  3%  sched_debug.cpu#1=
4.cpu_load[3]
>     116422 =C2=B1  2%     +32.4%     154101 =C2=B1  1%  sched_debug.cpu#1=
0.nr_load_updates
>        129 =C2=B1  9%     -36.4%         82 =C2=B1 27%  sched_debug.cfs_r=
q[44]:/.blocked_load_avg
>     514997 =C2=B1 15%     -26.5%     378518 =C2=B1  6%  sched_debug.cpu#5=
5.avg_idle
>     511213 =C2=B1 14%     -23.4%     391526 =C2=B1 21%  sched_debug.cpu#3=
6.avg_idle
>       1107 =C2=B1  6%     +41.2%       1564 =C2=B1 14%  sched_debug.cpu#2=
3.ttwu_local
>     421195 =C2=B1  6%     -28.2%     302545 =C2=B1 12%  sched_debug.cpu#5=
7.avg_idle
>     116187 =C2=B1  1%     +31.2%     152493 =C2=B1  0%  sched_debug.cpu#1=
1.nr_load_updates
>     117788 =C2=B1  1%     +29.6%     152672 =C2=B1  1%  sched_debug.cpu#8=
.nr_load_updates
>          9 =C2=B1 20%     +44.4%         13 =C2=B1  5%  sched_debug.cpu#4=
.cpu_load[0]
>         10 =C2=B1 10%     +29.3%         13 =C2=B1  3%  sched_debug.cpu#2=
7.cpu_load[2]
>         10 =C2=B1 12%     +35.0%         13 =C2=B1  6%  sched_debug.cpu#2=
8.cpu_load[2]
>         10 =C2=B1  7%     +35.0%         13 =C2=B1 19%  sched_debug.cpu#1=
3.cpu_load[1]
>      41426 =C2=B1  7%     +36.8%      56660 =C2=B1  5%  proc-vmstat.numa_=
hint_faults_local
>     114514 =C2=B1  1%     +34.0%     153480 =C2=B1  1%  sched_debug.cpu#1=
4.nr_load_updates
>     113983 =C2=B1  1%     +34.3%     153134 =C2=B1  1%  sched_debug.cpu#1=
3.nr_load_updates
>     117248 =C2=B1  1%     +29.9%     152335 =C2=B1  0%  sched_debug.cpu#1=
7.nr_load_updates
>     117878 =C2=B1  1%     +29.0%     152058 =C2=B1  0%  sched_debug.cpu#1=
9.nr_load_updates
>     118372 =C2=B1  1%     +28.3%     151813 =C2=B1  0%  sched_debug.cpu#1=
6.nr_load_updates
>         10 =C2=B1 14%     +23.8%         13 =C2=B1  7%  sched_debug.cpu#1=
0.cpu_load[0]
>         10 =C2=B1  8%     +26.8%         13 =C2=B1  7%  sched_debug.cpu#1=
0.cpu_load[1]
>         11 =C2=B1 12%     +22.7%         13 =C2=B1  3%  sched_debug.cpu#2=
7.cpu_load[1]
>          9 =C2=B1 27%     +52.8%         13 =C2=B1  7%  sched_debug.cpu#2=
.cpu_load[1]
>     117488 =C2=B1  1%     +28.1%     150510 =C2=B1  0%  sched_debug.cpu#2=
2.nr_load_updates
>         13 =C2=B1 24%     +38.9%         18 =C2=B1  4%  sched_debug.cfs_r=
q[57]:/.load
>         13 =C2=B1 26%     +38.9%         18 =C2=B1  4%  sched_debug.cpu#5=
7.load
>     117379 =C2=B1  1%     +27.9%     150133 =C2=B1  0%  sched_debug.cpu#2=
1.nr_load_updates
>    1602483 =C2=B1  3%     -19.6%    1288298 =C2=B1  0%  numa-meminfo.node=
0.SUnreclaim
>     238564 =C2=B1 15%     +29.9%     309806 =C2=B1  6%  sched_debug.cpu#2=
7.avg_idle
>     311032 =C2=B1  2%     -22.7%     240441 =C2=B1  5%  sched_debug.cpu#8=
.avg_idle
>     400457 =C2=B1  3%     -19.6%     322053 =C2=B1  0%  numa-vmstat.node0=
.nr_slab_unreclaimable
>       1394 =C2=B1 12%     +28.9%       1797 =C2=B1  7%  sched_debug.cpu#6=
.ttwu_local
>     120507 =C2=B1  1%     +26.0%     151799 =C2=B1  1%  sched_debug.cpu#6=
.nr_load_updates
>     348850 =C2=B1  6%     -24.7%     262520 =C2=B1 21%  sched_debug.cpu#6=
.avg_idle
>     675626 =C2=B1  3%     -19.6%     543470 =C2=B1  0%  numa-meminfo.node=
0.PageTables
>     168838 =C2=B1  3%     -19.5%     135853 =C2=B1  0%  numa-vmstat.node0=
.nr_page_table_pages
>     120183 =C2=B1  3%     +26.2%     151615 =C2=B1  0%  sched_debug.cpu#2=
0.nr_load_updates
>     120277 =C2=B1  1%     +25.9%     151380 =C2=B1  0%  sched_debug.cpu#7=
.nr_load_updates
>   35935589 =C2=B1  0%     -20.4%   28606880 =C2=B1  0%  slabinfo.vm_area_=
struct.num_objs
>     816717 =C2=B1  0%     -20.4%     650156 =C2=B1  0%  slabinfo.vm_area_=
struct.active_slabs
>     816717 =C2=B1  0%     -20.4%     650156 =C2=B1  0%  slabinfo.vm_area_=
struct.num_slabs
>     118159 =C2=B1  1%     +26.1%     148944 =C2=B1  0%  sched_debug.cpu#1=
.nr_load_updates
>   35891627 =C2=B1  0%     -20.3%   28590239 =C2=B1  0%  slabinfo.vm_area_=
struct.active_objs
>     120720 =C2=B1  1%     +24.9%     150796 =C2=B1  0%  sched_debug.cpu#4=
.nr_load_updates
>     474282 =C2=B1  6%     -22.9%     365875 =C2=B1 19%  sched_debug.cpu#3=
8.avg_idle
>    1651580 =C2=B1  0%     -20.1%    1319009 =C2=B1  0%  proc-vmstat.nr_sl=
ab_unreclaimable
>    6606619 =C2=B1  0%     -20.1%    5276360 =C2=B1  0%  meminfo.SUnreclaim
>     120367 =C2=B1  1%     +24.9%     150388 =C2=B1  0%  sched_debug.cpu#5=
.nr_load_updates
>         11 =C2=B1 14%     +34.1%         14 =C2=B1 10%  sched_debug.cfs_r=
q[31]:/.runnable_load_avg
>         20 =C2=B1  5%     -24.7%         15 =C2=B1  8%  sched_debug.cfs_r=
q[21]:/.load
>         12 =C2=B1  8%     +16.3%         14 =C2=B1  5%  sched_debug.cpu#2=
5.cpu_load[0]
>     696867 =C2=B1  0%     -20.0%     557635 =C2=B1  0%  proc-vmstat.nr_pa=
ge_table_pages
>    6653178 =C2=B1  0%     -20.0%    5322573 =C2=B1  0%  meminfo.Slab
>     248196 =C2=B1  9%     +25.4%     311208 =C2=B1 12%  sched_debug.cpu#2=
4.avg_idle
>    2787604 =C2=B1  0%     -20.0%    2230917 =C2=B1  0%  meminfo.PageTables
>  5.922e+08 =C2=B1  0%     -19.9%  4.747e+08 =C2=B1  0%  proc-vmstat.pgfau=
lt
>     118211 =C2=B1  2%     +28.0%     151343 =C2=B1  0%  sched_debug.cpu#1=
8.nr_load_updates
>     120807 =C2=B1  1%     +24.7%     150598 =C2=B1  0%  sched_debug.cpu#3=
.nr_load_updates
>     128900 =C2=B1  1%     +24.2%     160040 =C2=B1  0%  sched_debug.cpu#2=
5.nr_load_updates
>     121256 =C2=B1  1%     +24.3%     150777 =C2=B1  1%  sched_debug.cpu#2=
.nr_load_updates
>     114909 =C2=B1  3%     +34.0%     153977 =C2=B1  1%  sched_debug.cpu#1=
5.nr_load_updates
>     128637 =C2=B1  1%     +23.4%     158697 =C2=B1  0%  sched_debug.cpu#2=
6.nr_load_updates
>     424064 =C2=B1 10%     -22.4%     328912 =C2=B1 13%  sched_debug.cpu#6=
3.avg_idle
>    2518148 =C2=B1  2%     -17.3%    2082266 =C2=B1  0%  numa-meminfo.node=
0.MemUsed
>     377009 =C2=B1 10%     -22.9%     290499 =C2=B1 10%  sched_debug.cpu#5=
8.avg_idle
>       1751 =C2=B1  9%     +27.3%       2230 =C2=B1  8%  sched_debug.cpu#3=
.ttwu_local
>     128243 =C2=B1  1%     +22.8%     157484 =C2=B1  0%  sched_debug.cpu#2=
8.nr_load_updates
>     128594 =C2=B1  1%     +22.3%     157264 =C2=B1  0%  sched_debug.cpu#2=
9.nr_load_updates
>     128398 =C2=B1  1%     +23.1%     158004 =C2=B1  0%  sched_debug.cpu#2=
7.nr_load_updates
>     129844 =C2=B1  1%     +24.5%     161710 =C2=B1  0%  sched_debug.cpu#2=
4.nr_load_updates
>     128589 =C2=B1  1%     +21.7%     156520 =C2=B1  0%  sched_debug.cpu#3=
0.nr_load_updates
>     127546 =C2=B1  1%     +22.9%     156748 =C2=B1  0%  sched_debug.cpu#3=
1.nr_load_updates
>        134 =C2=B1  7%     -29.4%         95 =C2=B1 24%  sched_debug.cfs_r=
q[44]:/.tg_load_contrib
>      70304 =C2=B1  8%     +22.6%      86182 =C2=B1  3%  proc-vmstat.numa_=
hint_faults
>         29 =C2=B1 39%     -37.0%         18 =C2=B1  2%  sched_debug.cfs_r=
q[25]:/.load
>         28 =C2=B1 44%     -33.6%         18 =C2=B1  2%  sched_debug.cpu#2=
5.load
>     272672 =C2=B1  2%     -15.8%     229700 =C2=B1  1%  proc-vmstat.pgall=
oc_dma32
>     363798 =C2=B1 12%     -21.2%     286629 =C2=B1 13%  sched_debug.cpu#5=
9.avg_idle
>    1613943 =C2=B1  3%     -19.5%    1298521 =C2=B1  0%  numa-meminfo.node=
0.Slab
>     117340 =C2=B1  1%     +28.4%     150721 =C2=B1  0%  sched_debug.cpu#2=
3.nr_load_updates
>    4814407 =C2=B1  0%     -16.8%    4004118 =C2=B1  1%  proc-vmstat.pgfree
>    1552099 =C2=B1  0%     -16.8%    1291492 =C2=B1  0%  numa-meminfo.node=
2.Slab
>     649904 =C2=B1  0%     -16.7%     541350 =C2=B1  0%  numa-meminfo.node=
2.PageTables
>     162410 =C2=B1  0%     -16.7%     135321 =C2=B1  0%  numa-vmstat.node2=
.nr_page_table_pages
>    1540899 =C2=B1  0%     -17.0%    1279172 =C2=B1  0%  numa-meminfo.node=
2.SUnreclaim
>     385059 =C2=B1  0%     -17.0%     319769 =C2=B1  0%  numa-vmstat.node2=
.nr_slab_unreclaimable
>    4548086 =C2=B1  0%     -16.4%    3804042 =C2=B1  1%  proc-vmstat.pgall=
oc_normal
>    1255200 =C2=B1  0%     +19.0%    1493504 =C2=B1  0%  numa-vmstat.node3=
.nr_free_pages
>    5019891 =C2=B1  0%     +19.0%    5973786 =C2=B1  0%  numa-meminfo.node=
3.MemFree
>       5905 =C2=B1  2%     -14.0%       5081 =C2=B1  0%  sched_debug.cfs_r=
q[2]:/.tg_load_avg
>       5916 =C2=B1  2%     -14.2%       5077 =C2=B1  0%  sched_debug.cfs_r=
q[0]:/.tg_load_avg
>       5918 =C2=B1  2%     -14.0%       5087 =C2=B1  0%  sched_debug.cfs_r=
q[1]:/.tg_load_avg
>    2423291 =C2=B1  1%     -15.3%    2052984 =C2=B1  0%  numa-meminfo.node=
2.MemUsed
>         10 =C2=B1 12%     +26.8%         13 =C2=B1  9%  sched_debug.cpu#2=
8.cpu_load[1]
>       0.13 =C2=B1  3%     -15.7%       0.11 =C2=B1 10%  turbostat.%pc3
>    3420656 =C2=B1  0%     -15.1%    2903309 =C2=B1  2%  proc-vmstat.numa_=
local
>    3433217 =C2=B1  0%     -15.1%    2915876 =C2=B1  2%  proc-vmstat.numa_=
hit
>     838458 =C2=B1  1%     -13.0%     729220 =C2=B1  2%  numa-numastat.nod=
e0.local_node
>     736674 =C2=B1  3%     +18.6%     874029 =C2=B1  1%  softirqs.RCU
>     840554 =C2=B1  1%     -12.9%     732351 =C2=B1  2%  numa-numastat.nod=
e0.numa_hit
>       5802 =C2=B1  3%     -12.5%       5078 =C2=B1  0%  sched_debug.cfs_r=
q[3]:/.tg_load_avg
>       5730 =C2=B1  3%     -11.3%       5083 =C2=B1  0%  sched_debug.cfs_r=
q[4]:/.tg_load_avg
>     533590 =C2=B1  2%     -11.2%     473739 =C2=B1  1%  numa-vmstat.node0=
.numa_local
>     237268 =C2=B1  7%     +27.6%     302850 =C2=B1 13%  sched_debug.cpu#2=
8.avg_idle
>     565252 =C2=B1  2%     -10.4%     506412 =C2=B1  1%  numa-vmstat.node0=
.numa_hit
>       5709 =C2=B1  3%     -11.1%       5077 =C2=B1  0%  sched_debug.cfs_r=
q[5]:/.tg_load_avg
>     111048 =C2=B1  5%     -13.4%      96201 =C2=B1 10%  meminfo.DirectMap=
4k
>       5698 =C2=B1  3%     -10.8%       5084 =C2=B1  0%  sched_debug.cfs_r=
q[6]:/.tg_load_avg
>     270517 =C2=B1  8%     +11.1%     300584 =C2=B1  4%  sched_debug.cpu#2=
9.avg_idle
>         12 =C2=B1 19%     +32.7%         16 =C2=B1  6%  sched_debug.cpu#3=
8.load
>         12 =C2=B1 19%     +32.7%         16 =C2=B1  6%  sched_debug.cfs_r=
q[38]:/.load
>       5703 =C2=B1  3%     -11.1%       5071 =C2=B1  0%  sched_debug.cfs_r=
q[7]:/.tg_load_avg
>       5701 =C2=B1  3%     -10.9%       5081 =C2=B1  0%  sched_debug.cfs_r=
q[8]:/.tg_load_avg
>     537830 =C2=B1  1%     -12.3%     471678 =C2=B1  1%  numa-vmstat.node2=
.numa_local
>       5708 =C2=B1  2%     -10.6%       5102 =C2=B1  0%  sched_debug.cfs_r=
q[9]:/.tg_load_avg
>     824960 =C2=B1  2%     -10.8%     735556 =C2=B1  1%  numa-numastat.nod=
e2.local_node
>     829145 =C2=B1  2%     -10.9%     738701 =C2=B1  1%  numa-numastat.nod=
e2.numa_hit
>       5670 =C2=B1  2%     -10.0%       5101 =C2=B1  0%  sched_debug.cfs_r=
q[10]:/.tg_load_avg
>       5663 =C2=B1  2%      -9.9%       5100 =C2=B1  0%  sched_debug.cfs_r=
q[11]:/.tg_load_avg
>     574968 =C2=B1  0%     -11.6%     508060 =C2=B1  1%  numa-vmstat.node2=
.numa_hit
>       5660 =C2=B1  2%      -9.7%       5109 =C2=B1  0%  sched_debug.cfs_r=
q[12]:/.tg_load_avg
>       5580 =C2=B1  1%      -9.5%       5050 =C2=B1  1%  sched_debug.cfs_r=
q[34]:/.tg_load_avg
>       5578 =C2=B1  1%      -9.5%       5049 =C2=B1  1%  sched_debug.cfs_r=
q[33]:/.tg_load_avg
>       5655 =C2=B1  1%     -10.1%       5085 =C2=B1  1%  sched_debug.cfs_r=
q[14]:/.tg_load_avg
>       5651 =C2=B1  1%      -9.9%       5092 =C2=B1  0%  sched_debug.cfs_r=
q[15]:/.tg_load_avg
>       5656 =C2=B1  2%      -9.6%       5111 =C2=B1  0%  sched_debug.cfs_r=
q[13]:/.tg_load_avg
>       5615 =C2=B1  1%      -9.4%       5086 =C2=B1  1%  sched_debug.cfs_r=
q[19]:/.tg_load_avg
>       5631 =C2=B1  1%      -9.7%       5085 =C2=B1  1%  sched_debug.cfs_r=
q[20]:/.tg_load_avg
>       9735 =C2=B1  6%     +11.7%      10878 =C2=B1  3%  slabinfo.anon_vma=
.active_objs
>       9735 =C2=B1  6%     +11.7%      10878 =C2=B1  3%  slabinfo.anon_vma=
.num_objs
>       5635 =C2=B1  1%      -9.6%       5094 =C2=B1  1%  sched_debug.cfs_r=
q[21]:/.tg_load_avg
>       5645 =C2=B1  1%      -9.8%       5090 =C2=B1  0%  sched_debug.cfs_r=
q[16]:/.tg_load_avg
>       5400 =C2=B1  1%      -8.4%       4949 =C2=B1  2%  sched_debug.cfs_r=
q[63]:/.tg_load_avg
>       5388 =C2=B1  2%      -8.2%       4948 =C2=B1  2%  sched_debug.cfs_r=
q[62]:/.tg_load_avg
>       5569 =C2=B1  1%      -9.0%       5070 =C2=B1  1%  sched_debug.cfs_r=
q[35]:/.tg_load_avg
>       5566 =C2=B1  1%      -9.1%       5060 =C2=B1  1%  sched_debug.cfs_r=
q[40]:/.tg_load_avg
>       5392 =C2=B1  2%      -8.1%       4955 =C2=B1  2%  sched_debug.cfs_r=
q[61]:/.tg_load_avg
>       5623 =C2=B1  1%      -9.5%       5087 =C2=B1  1%  sched_debug.cfs_r=
q[18]:/.tg_load_avg
>       5562 =C2=B1  1%      -9.0%       5064 =C2=B1  1%  sched_debug.cfs_r=
q[37]:/.tg_load_avg
>       5395 =C2=B1  2%      -7.8%       4974 =C2=B1  2%  sched_debug.cfs_r=
q[60]:/.tg_load_avg
>       5638 =C2=B1  1%      -9.9%       5081 =C2=B1  0%  sched_debug.cfs_r=
q[17]:/.tg_load_avg
>       5565 =C2=B1  1%      -8.9%       5070 =C2=B1  1%  sched_debug.cfs_r=
q[36]:/.tg_load_avg
>       5502 =C2=B1  2%      -9.4%       4985 =C2=B1  2%  sched_debug.cfs_r=
q[47]:/.tg_load_avg
>       5581 =C2=B1  1%      -9.6%       5042 =C2=B1  1%  sched_debug.cfs_r=
q[43]:/.tg_load_avg
>       5526 =C2=B1  3%      -9.6%       4995 =C2=B1  2%  sched_debug.cfs_r=
q[46]:/.tg_load_avg
>       5558 =C2=B1  1%      -8.9%       5063 =C2=B1  1%  sched_debug.cfs_r=
q[39]:/.tg_load_avg
>       5581 =C2=B1  1%      -8.8%       5091 =C2=B1  1%  sched_debug.cfs_r=
q[32]:/.tg_load_avg
>       5622 =C2=B1  1%      -9.3%       5102 =C2=B1  1%  sched_debug.cfs_r=
q[27]:/.tg_load_avg
>       5559 =C2=B1  1%      -8.8%       5070 =C2=B1  1%  sched_debug.cfs_r=
q[38]:/.tg_load_avg
>       5567 =C2=B1  1%      -9.7%       5028 =C2=B1  1%  sched_debug.cfs_r=
q[45]:/.tg_load_avg
>       5588 =C2=B1  1%      -9.9%       5036 =C2=B1  1%  sched_debug.cfs_r=
q[44]:/.tg_load_avg
>       5603 =C2=B1  1%      -8.9%       5102 =C2=B1  1%  sched_debug.cfs_r=
q[28]:/.tg_load_avg
>      40992 =C2=B1  8%    +525.7%     256479 =C2=B1  1%  time.involuntary_=
context_switches
>   37575247 =C2=B1  0%     -81.1%    7104211 =C2=B1  1%  time.voluntary_co=
ntext_switches
>     206833 =C2=B1  0%     -78.8%      43766 =C2=B1  0%  vmstat.system.cs
>       5002 =C2=B1  4%    +209.3%      15474 =C2=B1  0%  time.system_time
>       1649 =C2=B1  3%    +185.0%       4701 =C2=B1  0%  time.percent_of_c=
pu_this_job_got
>      27.13 =C2=B1  3%    +170.9%      73.49 =C2=B1  0%  turbostat.%c0
>      24116 =C2=B1  5%    +133.1%      56210 =C2=B1  9%  vmstat.system.in
>  5.909e+08 =C2=B1  0%     -19.9%  4.734e+08 =C2=B1  0%  time.minor_page_f=
aults
>        369 =C2=B1  0%      -4.6%        352 =C2=B1  0%  time.elapsed_time
-- =

Jan Kara <jack@suse.cz>
SUSE Labs, CR

--===============4881601791461886332==--

