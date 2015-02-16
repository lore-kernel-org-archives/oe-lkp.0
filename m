Content-Type: multipart/mixed; boundary="===============5914038533760417397=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.cz>
To: lkp@lists.01.org
Subject: Re: [vmstat] c3916839649: -63.9% will-it-scale.time.involuntary_context_switches, -17.6% will-it-scale.time.voluntary_context_switches, no primary result change
Date: Mon, 16 Feb 2015 17:27:10 +0100
Message-ID: <20150216162710.GI19139@dhcp22.suse.cz>
In-Reply-To: <1423986919.5538.14.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5914038533760417397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun 15-02-15 15:55:19, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit c3916839649ddb3c0d541ce346360c4197898d52 ("vmstat: do not use defe=
rrable delayed work for vmstat_update")
> =

> =

> testbox/testcase/testparams: wsm/will-it-scale/performance-malloc1
> =

> 516245a5b8e7c56e  c3916839649ddb3c0d541ce346  =

> ----------------  --------------------------  =

>       1213 =C2=B1  1%     -63.9%        438 =C2=B1  6%  will-it-scale.tim=
e.involuntary_context_switches
>    2978260 =C2=B1  4%     -17.6%    2453255 =C2=B1  3%  will-it-scale.tim=
e.voluntary_context_switches

Do I understand numbers correctly and the patch helped to reduce context
switches because vmstat hasn't interfered so much? If yes then I am not
sure how that would be possible because vmstat workers were called less
often before this patch.

>        242 =C2=B1  0%      +3.3%        250 =C2=B1  1%  will-it-scale.tim=
e.system_time

Hmm, the system time is increased but user time (below) has decreased
(+8s system -1s user). What was the Elapsed time?

I am not familiar with the sched_debug statistics and also not exactly
sure what is the intention of this report. Is this supposed to be a
regression?

>    1274586 =C2=B1  5%     -84.6%     196270 =C2=B1  2%  cpuidle.C6-NHM.us=
age
>     140438 =C2=B1 18%     -72.4%      38803 =C2=B1 14%  cpuidle.C1-NHM.us=
age
>      33943 =C2=B1  8%     -72.9%       9203 =C2=B1  5%  sched_debug.cfs_r=
q[5]:/.exec_clock
>     114238 =C2=B1 19%     +72.3%     196836 =C2=B1 17%  sched_debug.cpu#4=
.ttwu_local
>     308423 =C2=B1 12%     -68.9%      95778 =C2=B1  1%  sched_debug.cfs_r=
q[5]:/.min_vruntime
>     146477 =C2=B1 10%     +48.7%     217860 =C2=B1 17%  sched_debug.cpu#4=
.ttwu_count
>      64938 =C2=B1 16%     -26.8%      47543 =C2=B1  4%  sched_debug.cpu#0=
.ttwu_count
>   14242451 =C2=B1 14%     -65.4%    4921778 =C2=B1 15%  cpuidle.C1-NHM.ti=
me
>         37 =C2=B1 14%     -52.7%         17 =C2=B1 31%  sched_debug.cpu#5=
.cpu_load[4]
>       1213 =C2=B1  1%     -63.9%        438 =C2=B1  6%  time.involuntary_=
context_switches
>      61803 =C2=B1 13%     -25.4%      46093 =C2=B1  4%  sched_debug.cpu#0=
.sched_goidle
>         40 =C2=B1 13%     -52.8%         19 =C2=B1 33%  sched_debug.cpu#5=
.cpu_load[3]
>         46 =C2=B1 17%     -52.2%         22 =C2=B1 39%  sched_debug.cpu#5=
.cpu_load[2]
>         79 =C2=B1 10%     +59.3%        126 =C2=B1 32%  sched_debug.cpu#6=
.cpu_load[4]
>         73 =C2=B1 10%     +54.9%        113 =C2=B1 33%  sched_debug.cpu#6=
.cpu_load[3]
>      48956 =C2=B1  5%     -46.1%      26390 =C2=B1 12%  sched_debug.cpu#5=
.nr_load_updates
>         54 =C2=B1 26%     -50.0%         27 =C2=B1 48%  sched_debug.cpu#5=
.cpu_load[1]
>        327 =C2=B1 10%     -44.1%        182 =C2=B1  8%  sched_debug.cfs_r=
q[5]:/.tg_runnable_contrib
>      15032 =C2=B1 10%     -43.9%       8426 =C2=B1  8%  sched_debug.cfs_r=
q[5]:/.avg->runnable_avg_sum
>      32594 =C2=B1  9%     +78.4%      58157 =C2=B1  0%  sched_debug.cfs_r=
q[11]:/.exec_clock
>     285793 =C2=B1 11%     +73.6%     496180 =C2=B1  3%  sched_debug.cfs_r=
q[11]:/.min_vruntime
>         83 =C2=B1 15%     -30.4%         57 =C2=B1 11%  sched_debug.cpu#1=
0.load
>         29 =C2=B1 12%     +72.4%         50 =C2=B1  5%  sched_debug.cpu#1=
1.cpu_load[4]
>         31 =C2=B1  9%     +59.8%         50 =C2=B1  6%  sched_debug.cpu#1=
1.cpu_load[3]
>         48 =C2=B1 15%     +41.5%         69 =C2=B1 11%  sched_debug.cfs_r=
q[9]:/.runnable_load_avg
>         68 =C2=B1 25%     +41.9%         96 =C2=B1 20%  sched_debug.cfs_r=
q[9]:/.load
>         81 =C2=B1 17%     -26.5%         59 =C2=B1 12%  sched_debug.cfs_r=
q[10]:/.load
>        521 =C2=B1  9%     +43.4%        748 =C2=B1  6%  cpuidle.POLL.usage
>      14974 =C2=B1 12%     +46.0%      21864 =C2=B1  1%  sched_debug.cfs_r=
q[11]:/.avg->runnable_avg_sum
>        327 =C2=B1 12%     +45.8%        476 =C2=B1  1%  sched_debug.cfs_r=
q[11]:/.tg_runnable_contrib
>      58930 =C2=B1  6%     +41.2%      83196 =C2=B1  1%  sched_debug.cpu#1=
1.nr_load_updates
>       5326 =C2=B1 13%     -18.5%       4343 =C2=B1  4%  meminfo.AnonHugeP=
ages
>     222147 =C2=B1  7%     +47.1%     326809 =C2=B1 30%  sched_debug.cfs_r=
q[6]:/.spread0
>     149897 =C2=B1 12%     +44.3%     216276 =C2=B1 17%  sched_debug.cpu#4=
.sched_goidle
>     127451 =C2=B1 13%     -24.2%      96598 =C2=B1  4%  sched_debug.cpu#0=
.nr_switches
>     127599 =C2=B1 13%     -24.2%      96740 =C2=B1  4%  sched_debug.cpu#0=
.sched_count
>         36 =C2=B1  8%     +42.1%         51 =C2=B1  8%  sched_debug.cpu#1=
1.cpu_load[2]
>     301690 =C2=B1 12%     +43.9%     434016 =C2=B1 17%  sched_debug.cpu#4=
.nr_switches
>     301787 =C2=B1 12%     +43.8%     434096 =C2=B1 17%  sched_debug.cpu#4=
.sched_count
>     116070 =C2=B1  3%     -25.4%      86585 =C2=B1  9%  sched_debug.cpu#1=
1.ttwu_count
>    1824349 =C2=B1  4%     +29.4%    2361351 =C2=B1  4%  cpuidle.C3-NHM.us=
age
>      10615 =C2=B1 13%     -17.4%       8766 =C2=B1 13%  sched_debug.cfs_r=
q[3]:/.avg->runnable_avg_sum
>        230 =C2=B1 13%     -17.4%        190 =C2=B1 13%  sched_debug.cfs_r=
q[3]:/.tg_runnable_contrib
>         61 =C2=B1 14%     -19.4%         49 =C2=B1 12%  sched_debug.cfs_r=
q[10]:/.runnable_load_avg
>      99092 =C2=B1 10%     -16.8%      82477 =C2=B1  0%  sched_debug.cpu#1=
0.sched_goidle
>       1175 =C2=B1 12%     +18.8%       1397 =C2=B1 11%  sched_debug.cpu#1=
1.curr->pid
>     199498 =C2=B1 10%     -16.9%     165794 =C2=B1  0%  sched_debug.cpu#1=
0.sched_count
>     199295 =C2=B1 10%     -16.9%     165611 =C2=B1  0%  sched_debug.cpu#1=
0.nr_switches
>     326090 =C2=B1 12%     -11.6%     288127 =C2=B1  9%  sched_debug.cfs_r=
q[2]:/.min_vruntime
>  6.955e+08 =C2=B1  1%     +25.2%  8.707e+08 =C2=B1  1%  cpuidle.C3-NHM.ti=
me
>    2978260 =C2=B1  4%     -17.6%    2453255 =C2=B1  3%  time.voluntary_co=
ntext_switches
>   1.06e+08 =C2=B1  3%     -21.3%   83401246 =C2=B1  8%  cpuidle.C1E-NHM.t=
ime
>     109454 =C2=B1  4%     -19.9%      87649 =C2=B1  8%  sched_debug.cpu#6=
.ttwu_count
>         48 =C2=B1  3%     +17.6%         56 =C2=B1 10%  sched_debug.cpu#9=
.cpu_load[2]
>     139443 =C2=B1  5%     +15.4%     160850 =C2=B1  4%  proc-vmstat.thp_f=
ault_alloc
>     139441 =C2=B1  5%     +15.4%     160848 =C2=B1  4%  proc-vmstat.thp_s=
plit
>     220724 =C2=B1  2%     -20.1%     176362 =C2=B1  9%  sched_debug.cpu#1=
1.nr_switches
>     220846 =C2=B1  2%     -20.1%     176481 =C2=B1  9%  sched_debug.cpu#1=
1.sched_count
>     109644 =C2=B1  2%     -20.0%      87693 =C2=B1  9%  sched_debug.cpu#1=
1.sched_goidle
>         46 =C2=B1  2%     +17.3%         54 =C2=B1  8%  sched_debug.cpu#9=
.cpu_load[3]
>      79492 =C2=B1  1%     +12.9%      89782 =C2=B1  4%  softirqs.SCHED
>     100431 =C2=B1  8%     -17.2%      83150 =C2=B1  9%  sched_debug.cpu#9=
.ttwu_count
>     726690 =C2=B1  2%     +11.9%     813169 =C2=B1  5%  sched_debug.cpu#4=
.avg_idle
>      91979 =C2=B1  0%     +12.9%     103877 =C2=B1 12%  sched_debug.cfs_r=
q[6]:/.exec_clock
>     201606 =C2=B1  5%     -11.7%     177929 =C2=B1  5%  sched_debug.cpu#6=
.nr_switches
>     201773 =C2=B1  5%     -11.7%     178108 =C2=B1  5%  sched_debug.cpu#6=
.sched_count
>     100423 =C2=B1  5%     -11.8%      88575 =C2=B1  5%  sched_debug.cpu#6=
.sched_goidle
>      40821 =C2=B1  2%     +15.8%      47259 =C2=B1  5%  softirqs.RCU
>         44 =C2=B1  3%     +16.9%         52 =C2=B1  8%  sched_debug.cpu#9=
.cpu_load[4]
>       9.56 =C2=B1  4%     -11.6%       8.45 =C2=B1  1%  time.user_time
>     306985 =C2=B1 12%     -12.0%     270022 =C2=B1  4%  sched_debug.cfs_r=
q[1]:/.min_vruntime
>  1.544e+09 =C2=B1  1%     -10.0%  1.389e+09 =C2=B1  0%  cpuidle.C6-NHM.ti=
me
>     115366 =C2=B1  1%     +11.3%     128364 =C2=B1 10%  sched_debug.cpu#6=
.nr_load_updates
>      22.81 =C2=B1  1%     +10.8%      25.26 =C2=B1  1%  turbostat.CPU%c3
>      25858 =C2=B1  3%     -13.3%      22427 =C2=B1  2%  vmstat.system.cs
> =

> wsm: Westmere
> Memory: 6G
> =

> =

> =

> =

>                          time.involuntary_context_switches
> =

>   1300 ++----------------------------------------------------------------=
---+
>   1200 *+*..      .*.                      .*.           .*.      .*.*.*.=
.*.*
>        |       .*.   *.*.*..*.*.*..   .*..*   *.*..*.*.*.   *.*..*       =
   |
>   1100 ++   *.*                    *.*                                   =
   |
>   1000 ++                                                                =
   |
>        |                                                                 =
   |
>    900 ++                                                                =
   |
>    800 ++                                                                =
   |
>    700 ++                                                                =
   |
>        |                                                                 =
   |
>    600 ++                                                                =
   |
>    500 ++   O   O                         O                              =
   |
>        O      O    O O O    O   O    O O    O O O    O                   =
   |
>    400 ++O               O    O    O               O                     =
   |
>    300 ++----------------------------------------------------------------=
---+
> =

> =

>                                   cpuidle.C3-NHM.time
> =

>   9.5e+08 ++-------------------------------------------------------------=
---+
>           |                                                              =
   |
>     9e+08 ++                             O                               =
   |
>           O      O O O      O   O O        O   O      O                  =
   |
>           | O O        O O    O     O  O     O    O O                    =
   |
>   8.5e+08 ++                                                             =
   |
>           |                                                              =
   |
>     8e+08 ++                                                             =
   |
>           |                                                              =
   |
>   7.5e+08 ++                                                             =
   |
>           |                .*   *.*.    .*.           *.                 =
   |
>           |     .*.*   *.*.  + +    *..*   *.*.      +  *                =
   |
>     7e+08 *+ .*.    + +       *                *..*.*    +  .*.*.*. .*..*=
. .*
>           | *        *                                    *.       *     =
 * |
>   6.5e+08 ++-------------------------------------------------------------=
---+
> =

> =

>                                   cpuidle.C6-NHM.time
> =

>    1.6e+09 ++------------------------------------------------------------=
---+
>            |                   *.                          *.            =
 * |
>            |.*.*..  *.*.      :  *    .*       .*   *     :  *.*.        =
 ::|
>   1.55e+09 *+      +    *.    :   :  *  +    .*  + + +    :      *.*..*  =
: :|
>            |      *       *. :    : +    *..*     *   *..*             + =
:  *
>            |                *      *                                    *=
   |
>    1.5e+09 ++                                                            =
   |
>            |                                                             =
   |
>   1.45e+09 ++                                                            =
   |
>            |                                                             =
   |
>            | O                       O                                   =
   |
>    1.4e+09 ++           O                           O                    =
   |
>            O   O          O O  O O     O      O O O   O                  =
   |
>            |      O O O            O        O                            =
   |
>   1.35e+09 ++----------------------------O-------------------------------=
---+
> =

> =

>                                  cpuidle.C6-NHM.usage
> =

>   1.4e+06 ++-------------------------------------------------------------=
-*-+
>           *.*.       *.*                         .*                    .*=
   *
>   1.2e+06 ++  *..*. +   +  .*.*. .*.  .*.     .*.  + .*.*.  .*.*. .*.*.  =
   |
>           |        *     *.     *   *.   *.*.*      *     *.     *       =
   |
>     1e+06 ++                                                             =
   |
>           |                                                              =
   |
>    800000 ++                                                             =
   |
>           |                                                              =
   |
>    600000 ++                                                             =
   |
>           |                                                              =
   |
>    400000 ++                                                             =
   |
>           |                                                              =
   |
>    200000 O+O O  O O O O O  O O O O O  O O O O O  O O O                  =
   |
>           |                                                              =
   |
>         0 ++-------------------------------------------------------------=
---+
> =

> =

>                   will-it-scale.time.involuntary_context_switches
> =

>   1300 ++----------------------------------------------------------------=
---+
>   1200 *+*..      .*.                      .*.           .*.      .*.*.*.=
.*.*
>        |       .*.   *.*.*..*.*.*..   .*..*   *.*..*.*.*.   *.*..*       =
   |
>   1100 ++   *.*                    *.*                                   =
   |
>   1000 ++                                                                =
   |
>        |                                                                 =
   |
>    900 ++                                                                =
   |
>    800 ++                                                                =
   |
>    700 ++                                                                =
   |
>        |                                                                 =
   |
>    600 ++                                                                =
   |
>    500 ++   O   O                         O                              =
   |
>        O      O    O O O    O   O    O O    O O O    O                   =
   |
>    400 ++O               O    O    O               O                     =
   |
>    300 ++----------------------------------------------------------------=
---+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

> 	apt-get install ruby
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Huang, Ying
> =


> ---
> testcase: will-it-scale
> default-monitors:
>   wait: pre-test
>   uptime: =

>   iostat: =

>   vmstat: =

>   numa-numastat: =

>   numa-vmstat: =

>   numa-meminfo: =

>   proc-vmstat: =

>   proc-stat: =

>   meminfo: =

>   slabinfo: =

>   interrupts: =

>   lock_stat: =

>   latency_stats: =

>   softirqs: =

>   bdi_dev_mapping: =

>   diskstats: =

>   nfsstat: =

>   cpuidle: =

>   cpufreq-stats: =

>   turbostat: =

>   pmeter: =

>   sched_debug:
>     interval: 10
> default_watchdogs:
>   watch-oom: =

>   watchdog: =

> cpufreq_governor: performance
> commit: 7496ad672d0ed7177fefec9c70ece8a70bbd2dc1
> model: Westmere
> memory: 6G
> nr_hdd_partitions: 1
> hdd_partitions: =

> swap_partitions: =

> rootfs_partition: =

> netconsole_port: 6667
> perf-profile:
>   freq: 800
> will-it-scale:
>   test: malloc1
> testbox: wsm
> tbox_group: wsm
> kconfig: x86_64-rhel
> enqueue_time: 2015-02-12 07:25:08.935926504 +08:00
> head_commit: 7496ad672d0ed7177fefec9c70ece8a70bbd2dc1
> base_commit: bfa76d49576599a4b9f9b7a71f23d73d6dcff735
> branch: next/master
> kernel: "/kernel/x86_64-rhel/7496ad672d0ed7177fefec9c70ece8a70bbd2dc1/vml=
inuz-3.19.0-next-20150212-g7496ad6"
> user: lkp
> queue: cyclic
> rootfs: debian-x86_64-2015-02-07.cgz
> result_root: "/result/wsm/will-it-scale/performance-malloc1/debian-x86_64=
-2015-02-07.cgz/x86_64-rhel/7496ad672d0ed7177fefec9c70ece8a70bbd2dc1/0"
> job_file: "/lkp/scheduled/wsm/cyclic_will-it-scale-performance-malloc1-x8=
6_64-rhel-HEAD-7496ad672d0ed7177fefec9c70ece8a70bbd2dc1-0-20150212-31440-ix=
9pa1.yaml"
> dequeue_time: 2015-02-12 16:35:45.778268771 +08:00
> nr_cpu: "$(nproc)"
> job_state: finished
> loadavg: 8.37 4.91 2.02 1/158 5629
> start_time: '1423730169'
> end_time: '1423730474'
> version: "/lkp/lkp/.src-20150212-162408"

> ./runtest.py malloc1 32 both 1 6 9 12

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =



-- =

Michal Hocko
SUSE Labs

--===============5914038533760417397==--

