Content-Type: multipart/mixed; boundary="===============9133623698342446121=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 00f5159aeb6: +55.3% will-it-scale.time.involuntary_context_switches
Date: Tue, 20 Jan 2015 23:52:54 -0800
Message-ID: <20150121075254.GC9719@linux.vnet.ibm.com>
In-Reply-To: <1421825564.6126.29.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9133623698342446121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2015 at 03:32:44PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git stall=
.2015.01.06a
> commit 00f5159aeb68f08ce29597be86be87d6db0c1ba1 ("rcu: Run grace-period k=
threads at real-time priority")

Glad this helps!

However, the version that I am pushing during the upcoming merge window
requires a boot parameter rcutree.kthread_prio=3D set to a value in the
range 1..99 to have effect.  The reason is that we need to focus any
risks from this change on the people needing it.

							Thanx, Paul

> testbox/testcase/testparams: lkp-a03/will-it-scale/performance-lock1
> =

> e3663b1024d1f946  00f5159aeb68f08ce29597be86  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>      11321 =C2=B1  5%     +55.3%      17582 =C2=B1 14%  will-it-scale.tim=
e.involuntary_context_switches
>      28999 =C2=B1 44%    +109.3%      60700 =C2=B1 25%  sched_debug.cpu#1=
.ttwu_count
>      58384 =C2=B1 44%    +103.6%     118851 =C2=B1 24%  sched_debug.cpu#1=
.nr_switches
>      26144 =C2=B1 48%     +90.3%      49762 =C2=B1 26%  sched_debug.cpu#1=
.sched_goidle
>        827 =C2=B1 34%     -57.3%        353 =C2=B1 21%  cpuidle.C2-ATM.us=
age
>      58976 =C2=B1 43%    +103.0%     119712 =C2=B1 24%  sched_debug.cpu#1=
.sched_count
>        503 =C2=B1 29%     -56.5%        219 =C2=B1 27%  cpuidle.C4-ATM.us=
age
>      11321 =C2=B1  5%     +55.3%      17582 =C2=B1 14%  time.involuntary_=
context_switches
>        156 =C2=B1 14%     -29.6%        110 =C2=B1 19%  cpuidle.POLL.usage
>      50583 =C2=B1  2%     -21.7%      39630 =C2=B1  4%  cpuidle.C6-ATM.us=
age
>   51597156 =C2=B1  2%     +23.7%   63848564 =C2=B1  3%  cpuidle.C1E-ATM.t=
ime
>      39349 =C2=B1  2%     -12.0%      34622 =C2=B1  2%  softirqs.SCHED
>     758790 =C2=B1  8%     -15.3%     642336 =C2=B1 12%  sched_debug.cpu#2=
.sched_count
>     378981 =C2=B1  8%     -15.6%     319776 =C2=B1 12%  sched_debug.cpu#2=
.ttwu_count
>     374440 =C2=B1  8%     -15.5%     316513 =C2=B1 12%  sched_debug.cpu#2=
.ttwu_local
>       5307 =C2=B1  0%      -1.0%       5255 =C2=B1  0%  vmstat.system.in
> =

> testbox/testcase/testparams: wsm/will-it-scale/performance-open2
> =

> e3663b1024d1f946  00f5159aeb68f08ce29597be86  =

> ----------------  --------------------------  =

>      22128 =C2=B1  3%    +120.2%      48719 =C2=B1  8%  will-it-scale.tim=
e.involuntary_context_switches
>       5577 =C2=B1 45%   +1492.2%      88802 =C2=B1 33%  sched_debug.cpu#6=
.sched_count
>       5457 =C2=B1 46%   +1526.2%      88751 =C2=B1 33%  sched_debug.cpu#6=
.nr_switches
>       0.45 =C2=B1 43%     -73.3%       0.12 =C2=B1 15%  turbostat.%c3
>         10 =C2=B1 24%     -55.8%          4 =C2=B1 40%  sched_debug.cpu#9=
.nr_uninterruptible
>        147 =C2=B1 11%     -58.5%         61 =C2=B1 32%  sched_debug.cpu#1=
1.load
>        147 =C2=B1 11%     -58.5%         61 =C2=B1 32%  sched_debug.cfs_r=
q[11]:/.load
>   10821106 =C2=B1 39%     -59.8%    4347430 =C2=B1 20%  cpuidle.C3-NHM.ti=
me
>        356 =C2=B1 41%     +76.6%        629 =C2=B1  3%  sched_debug.cfs_r=
q[6]:/.blocked_load_avg
>      22128 =C2=B1  3%    +120.2%      48719 =C2=B1  8%  time.involuntary_=
context_switches
>        145 =C2=B1 36%     -35.9%         93 =C2=B1 30%  sched_debug.cpu#5=
.load
>        469 =C2=B1 29%     +55.9%        732 =C2=B1  4%  sched_debug.cfs_r=
q[6]:/.tg_load_contrib
>        145 =C2=B1 36%     -34.0%         95 =C2=B1 29%  sched_debug.cfs_r=
q[5]:/.load
>         99 =C2=B1  8%     -27.8%         72 =C2=B1 24%  sched_debug.cpu#9=
.load
>         99 =C2=B1  8%     -27.8%         72 =C2=B1 24%  sched_debug.cfs_r=
q[9]:/.load
>     219871 =C2=B1  6%     -33.3%     146545 =C2=B1 19%  sched_debug.cpu#3=
.ttwu_local
>     224610 =C2=B1  6%     -31.3%     154342 =C2=B1 18%  sched_debug.cpu#3=
.sched_goidle
>     451877 =C2=B1  6%     -31.1%     311378 =C2=B1 18%  sched_debug.cpu#3=
.sched_count
>     451737 =C2=B1  6%     -31.1%     311279 =C2=B1 18%  sched_debug.cpu#3=
.nr_switches
>     225208 =C2=B1  6%     -31.3%     154688 =C2=B1 18%  sched_debug.cpu#3=
.ttwu_count
>       4122 =C2=B1  7%     -23.6%       3148 =C2=B1 17%  cpuidle.C3-NHM.us=
age
>         84 =C2=B1 11%     -27.4%         61 =C2=B1  5%  sched_debug.cpu#7=
.cpu_load[0]
>     154565 =C2=B1  2%     -29.6%     108768 =C2=B1  9%  cpuidle.C6-NHM.us=
age
>     124949 =C2=B1 25%     +41.4%     176670 =C2=B1 15%  sched_debug.cpu#2=
.sched_goidle
>      74177 =C2=B1  2%     -23.6%      56653 =C2=B1  4%  sched_debug.cpu#3=
.nr_load_updates
>         79 =C2=B1  6%     -23.1%         60 =C2=B1  5%  sched_debug.cpu#7=
.cpu_load[1]
>      50107 =C2=B1  6%     -20.9%      39621 =C2=B1  7%  sched_debug.cfs_r=
q[3]:/.exec_clock
>         76 =C2=B1  4%     -20.6%         60 =C2=B1  6%  sched_debug.cpu#7=
.cpu_load[2]
>     385983 =C2=B1  9%     -20.4%     307347 =C2=B1 12%  sched_debug.cfs_r=
q[3]:/.min_vruntime
>         74 =C2=B1  2%     -18.5%         60 =C2=B1  6%  sched_debug.cpu#7=
.cpu_load[3]
>       1.50 =C2=B1  6%     -10.0%       1.35 =C2=B1  9%  perf-profile.cpu-=
cycles.selinux_file_free_security.security_file_free.__fput.____fput.task_w=
ork_run
>      46086 =C2=B1  1%     -25.7%      34260 =C2=B1  5%  softirqs.SCHED
>         72 =C2=B1  1%     -15.9%         60 =C2=B1  7%  sched_debug.cpu#7=
.cpu_load[4]
>         74 =C2=B1 13%     -17.7%         61 =C2=B1  2%  sched_debug.cfs_r=
q[7]:/.runnable_load_avg
>         65 =C2=B1  2%     +16.9%         76 =C2=B1  4%  sched_debug.cpu#1=
.cpu_load[3]
>       1.94 =C2=B1  5%      -9.9%       1.74 =C2=B1  6%  perf-profile.cpu-=
cycles.security_file_free.__fput.____fput.task_work_run.do_notify_resume
>      58851 =C2=B1  1%     +20.5%      70942 =C2=B1  9%  sched_debug.cfs_r=
q[1]:/.exec_clock
>      69880 =C2=B1  1%     -16.9%      58047 =C2=B1 11%  sched_debug.cpu#7=
.nr_load_updates
>         60 =C2=B1  5%      +9.5%         66 =C2=B1  3%  sched_debug.cpu#9=
.cpu_load[4]
>      12064 =C2=B1  7%     +12.4%      13561 =C2=B1  5%  slabinfo.kmalloc-=
64.num_objs
>         67 =C2=B1  4%     +14.9%         77 =C2=B1  4%  sched_debug.cpu#1=
.cpu_load[2]
>      53070 =C2=B1  7%     +18.3%      62803 =C2=B1  5%  sched_debug.cfs_r=
q[9]:/.exec_clock
>         64 =C2=B1  1%     +16.3%         74 =C2=B1  4%  sched_debug.cpu#1=
.cpu_load[4]
>      11895 =C2=B1  7%     +12.9%      13429 =C2=B1  5%  slabinfo.kmalloc-=
64.active_objs
>      67415 =C2=B1  1%     -16.4%      56345 =C2=B1 11%  sched_debug.cfs_r=
q[7]:/.exec_clock
>      58403 =C2=B1  4%     +12.0%      65434 =C2=B1  6%  sched_debug.cpu#9=
.nr_load_updates
>     428535 =C2=B1  8%     +18.3%     507136 =C2=B1  6%  sched_debug.cfs_r=
q[9]:/.min_vruntime
>     505551 =C2=B1  1%     +16.3%     588207 =C2=B1  8%  sched_debug.cfs_r=
q[1]:/.min_vruntime
>       1818 =C2=B1  5%      -8.4%       1665 =C2=B1  3%  slabinfo.proc_ino=
de_cache.active_objs
>       1818 =C2=B1  5%      -8.4%       1665 =C2=B1  3%  slabinfo.proc_ino=
de_cache.num_objs
>        616 =C2=B1  0%     +11.4%        686 =C2=B1  4%  sched_debug.cfs_r=
q[1]:/.tg_runnable_contrib
>       2259 =C2=B1 14%     +23.5%       2790 =C2=B1  5%  sched_debug.cpu#3=
.curr->pid
>      28336 =C2=B1  0%     +11.2%      31517 =C2=B1  4%  sched_debug.cfs_r=
q[1]:/.avg->runnable_avg_sum
>     576795 =C2=B1  1%     -14.6%     492717 =C2=B1 10%  sched_debug.cfs_r=
q[7]:/.min_vruntime
>       7176 =C2=B1  0%      +2.1%       7323 =C2=B1  0%  vmstat.system.cs
>      10798 =C2=B1  0%      -1.1%      10675 =C2=B1  0%  vmstat.system.in
> =

> lkp-a03: Atom
> Memory: 8G
> =

> wsm: Westmere
> Memory: 6G
> =

> =

> =

> =

>                    will-it-scale.time.involuntary_context_switches
> =

>   70000 ++---------------------------------------------------------------=
---+
>         |                                                                =
   |
>   60000 ++                                                         O     =
   |
>         O        O    O                  O    O   O    O    O   O      O =
   |
>   50000 ++   O O    O        O                           O    O          =
 O O
>         | O                    O  O        O    O                    O   =
   |
>   40000 ++              O  O        O O              O                   =
   |
>         |                                                                =
   |
>   30000 ++                                                               =
   |
>         |     .*.                       .*.*..                      .*   =
   |
>   20000 *+*..*   *..*.*    *.*.*..*.*.*.      *.*.*..*.*.*..*.*.*..*     =
   |
>         |              :  :                                              =
   |
>   10000 ++             :  :                                              =
   |
>         |               ::                                               =
   |
>       0 ++--------------*------------------------------------------------=
---+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

> 	apt-get install ruby ruby-oj
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

>   cpuidle: =

>   cpufreq: =

>   turbostat: =

>   sched_debug:
>     interval: 10
>   pmeter: =

> default_watchdogs:
>   watch-oom: =

>   watchdog: =

> cpufreq_governor:
> - performance
> commit: 634b0bd490b7ebd7a054cea4f7e0d25748bde678
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
>   test:
>   - open2
> testbox: wsm
> tbox_group: wsm
> kconfig: x86_64-rhel
> enqueue_time: 2015-01-16 17:43:47.976990621 +08:00
> head_commit: 634b0bd490b7ebd7a054cea4f7e0d25748bde678
> base_commit: eaa27f34e91a14cdceed26ed6c6793ec1d186115
> branch: next/master
> kernel: "/kernel/x86_64-rhel/634b0bd490b7ebd7a054cea4f7e0d25748bde678/vml=
inuz-3.19.0-rc4-next-20150116-g634b0bd"
> user: lkp
> queue: cyclic
> rootfs: debian-x86_64-2015-01-13.cgz
> result_root: "/result/wsm/will-it-scale/performance-open2/debian-x86_64-2=
015-01-13.cgz/x86_64-rhel/634b0bd490b7ebd7a054cea4f7e0d25748bde678/0"
> job_file: "/lkp/scheduled/wsm/cyclic_will-it-scale-performance-open2-x86_=
64-rhel-HEAD-634b0bd490b7ebd7a054cea4f7e0d25748bde678-0.yaml"
> dequeue_time: 2015-01-16 23:50:07.247065623 +08:00
> nr_cpu: "$(nproc)"
> job_state: finished
> loadavg: 8.12 4.97 2.06 1/146 6693
> start_time: '1421423439'
> end_time: '1421423743'
> version: "/lkp/lkp/.src-20150116-113525"

> ./runtest.py open2 32 1 6 9 12

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =



--===============9133623698342446121==--

