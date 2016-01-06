Content-Type: multipart/mixed; boundary="===============6540963435872444453=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] b8084f70e0: No primary result change, 1414.7% unixbench.time.involuntary_context_switches
Date: Tue, 05 Jan 2016 19:30:52 -0800
Message-ID: <20160106033052.GG3818@linux.vnet.ibm.com>
In-Reply-To: <878u43fmpc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6540963435872444453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2016 at 10:47:43AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git for=
-kbuild-bot/current-stable
> commit b8084f70e028697b342d6388b244d6171717fc54 ("rcu: Eliminate softirq =
processing from rcutree")

This is a performance degradation, correct?  If so, looks like this commit
is not ready for mainline unless set up to be configured on only for
-rt workloads.

Or am I missing the plot somewhere here?

								Thanx, Paul

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-=
d02/fsbuffer/unixbench
> =

> commit: =

>   ee644236a506642e20637f954d286f49a76ed83a
>   b8084f70e028697b342d6388b244d6171717fc54
> =

> ee644236a506642e b8084f70e028697b342d6388b2 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     257.25 =C2=B1 18%   +1414.7%       3896 =C2=B1 13%  unixbench.time.in=
voluntary_context_switches
>    4425148 =C2=B1 22%     -61.9%    1684712 =C2=B1 29%  cpuidle.C1E-IVB.t=
ime
>      83.75 =C2=B1 48%     +91.6%     160.50 =C2=B1 31%  cpuidle.POLL.usage
>       1902 =C2=B1  7%     -12.0%       1674 =C2=B1  1%  slabinfo.anon_vma=
.active_objs
>       1902 =C2=B1  7%     -12.0%       1674 =C2=B1  1%  slabinfo.anon_vma=
.num_objs
>     257.25 =C2=B1 18%   +1414.7%       3896 =C2=B1 13%  time.involuntary_=
context_switches
>       8.15 =C2=B1  6%     -14.1%       7.00 =C2=B1  1%  time.user_time
>      34345 =C2=B1 14%     -33.3%      22908 =C2=B1 33%  sched_debug.cfs_r=
q:/.exec_clock.2
>      34987 =C2=B1 13%     -19.7%      28093 =C2=B1 15%  sched_debug.cfs_r=
q:/.exec_clock.max
>     642.75 =C2=B1  5%     +59.6%       1025 =C2=B1 55%  sched_debug.cfs_r=
q:/.exec_clock.min
>      14639 =C2=B1 13%     -21.8%      11443 =C2=B1 16%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>     127.75 =C2=B1 16%     -26.2%      94.25 =C2=B1 25%  sched_debug.cfs_r=
q:/.load_avg.3
>      38865 =C2=B1 12%     -36.0%      24885 =C2=B1 34%  sched_debug.cfs_r=
q:/.min_vruntime.2
>      39385 =C2=B1 12%     -22.8%      30395 =C2=B1 16%  sched_debug.cfs_r=
q:/.min_vruntime.max
>       1090 =C2=B1 11%     +45.3%       1584 =C2=B1 32%  sched_debug.cfs_r=
q:/.min_vruntime.min
>      16286 =C2=B1 13%     -25.1%      12200 =C2=B1 18%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       2.00 =C2=B1  0%     -50.0%       1.00 =C2=B1  0%  sched_debug.cfs_r=
q:/.nr_spread_over.0
>       2.00 =C2=B1  0%     -50.0%       1.00 =C2=B1  0%  sched_debug.cfs_r=
q:/.nr_spread_over.max
>       0.87 =C2=B1  0%     -42.3%       0.50 =C2=B1  0%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>      28.50 =C2=B1 62%    +338.6%     125.00 =C2=B1114%  sched_debug.cfs_r=
q:/.runnable_load_avg.1
>      16286 =C2=B1 13%     -25.1%      12200 =C2=B1 18%  sched_debug.cfs_r=
q:/.spread0.stddev
>     127.75 =C2=B1 16%     -26.0%      94.50 =C2=B1 25%  sched_debug.cfs_r=
q:/.tg_load_avg_contrib.3
>     626662 =C2=B1  5%     -13.2%     544121 =C2=B1  9%  sched_debug.cpu.a=
vg_idle.0
>      20.25 =C2=B1 28%    +419.8%     105.25 =C2=B1132%  sched_debug.cpu.c=
pu_load[3].1
>     692.40 =C2=B1  7%     -15.2%     586.96 =C2=B1  9%  sched_debug.cpu.c=
urr->pid.avg
>      36187 =C2=B1 12%     -31.5%      24793 =C2=B1 29%  sched_debug.cpu.n=
r_load_updates.2
>      15625 =C2=B1 11%     +61.6%      25245 =C2=B1 23%  sched_debug.cpu.n=
r_switches.0
>      20008 =C2=B1  4%     +14.1%      22828 =C2=B1  4%  sched_debug.cpu.n=
r_switches.avg
>      23333 =C2=B1  8%     +40.9%      32872 =C2=B1 18%  sched_debug.cpu.s=
ched_count.0
>      21974 =C2=B1  4%     +12.7%      24771 =C2=B1  4%  sched_debug.cpu.s=
ched_count.avg
>      31771 =C2=B1  9%     +22.6%      38942 =C2=B1  5%  sched_debug.cpu.s=
ched_count.max
>       9514 =C2=B1 28%     +75.8%      16728 =C2=B1  7%  sched_debug.cpu.t=
twu_count.0
>       4323 =C2=B1 10%     +40.6%       6080 =C2=B1 30%  sched_debug.cpu.t=
twu_count.2
>      10068 =C2=B1  4%     +15.6%      11639 =C2=B1  4%  sched_debug.cpu.t=
twu_count.avg
>       4101 =C2=B1 10%     +21.7%       4990 =C2=B1  8%  sched_debug.cpu.t=
twu_count.min
>       3676 =C2=B1 21%    +102.5%       7443 =C2=B1  8%  sched_debug.cpu.t=
twu_local.0
>       2014 =C2=B1 15%     +43.2%       2884 =C2=B1 10%  sched_debug.cpu.t=
twu_local.2
>       3508 =C2=B1  1%     +24.8%       4377 =C2=B1  4%  sched_debug.cpu.t=
twu_local.avg
>       5554 =C2=B1 19%     +34.0%       7444 =C2=B1  8%  sched_debug.cpu.t=
twu_local.max
>       1846 =C2=B1 16%     +40.2%       2588 =C2=B1  6%  sched_debug.cpu.t=
twu_local.min
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb-=
d02/fsdisk/unixbench
> =

> commit: =

>   ee644236a506642e20637f954d286f49a76ed83a
>   b8084f70e028697b342d6388b244d6171717fc54
> =

> ee644236a506642e b8084f70e028697b342d6388b2 =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4           25%           1:4     kmsg.DHCP/BOOTP:Reply_not_f=
or_us,op[#]xid[#]
>          %stddev     %change         %stddev
>              \          |                \  =

>     265.75 =C2=B1 18%   +1313.4%       3756 =C2=B1  9%  unixbench.time.in=
voluntary_context_switches
>     659.50 =C2=B1  6%     +16.5%     768.00 =C2=B1  7%  slabinfo.kmalloc-=
512.num_objs
>     265.75 =C2=B1 18%   +1313.4%       3756 =C2=B1  9%  time.involuntary_=
context_switches
>    5911312 =C2=B1 13%     -55.9%    2606719 =C2=B1 10%  cpuidle.C1E-IVB.t=
ime
>      95195 =C2=B1172%    +815.7%     871684 =C2=B1140%  cpuidle.POLL.time
>      51.75 =C2=B1 10%     -30.9%      35.75 =C2=B1 24%  cpuidle.POLL.usage
>      13361 =C2=B1 22%     -27.0%       9754 =C2=B1  4%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>      14632 =C2=B1 24%     -28.1%      10524 =C2=B1  5%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>      14632 =C2=B1 24%     -28.1%      10524 =C2=B1  5%  sched_debug.cfs_r=
q:/.spread0.stddev
>     197.25 =C2=B1 14%     +52.9%     301.50 =C2=B1 41%  sched_debug.cfs_r=
q:/.util_avg.0
>     552666 =C2=B1  8%      -7.7%     510200 =C2=B1  7%  sched_debug.cpu.a=
vg_idle.1
>      13610 =C2=B1 30%     +59.7%      21734 =C2=B1  7%  sched_debug.cpu.n=
r_switches.0
>      21145 =C2=B1  1%     +12.3%      23752 =C2=B1  7%  sched_debug.cpu.n=
r_switches.avg
>      10105 =C2=B1 21%     +62.1%      16380 =C2=B1  7%  sched_debug.cpu.n=
r_switches.min
>      11293 =C2=B1 28%     -44.4%       6276 =C2=B1 16%  sched_debug.cpu.n=
r_switches.stddev
>      21314 =C2=B1 19%     +38.1%      29437 =C2=B1  5%  sched_debug.cpu.s=
ched_count.0
>      11261 =C2=B1 22%     +57.2%      17703 =C2=B1  9%  sched_debug.cpu.s=
ched_count.min
>      11158 =C2=B1 27%     -36.7%       7068 =C2=B1 12%  sched_debug.cpu.s=
ched_count.stddev
>       5854 =C2=B1 35%     +57.0%       9194 =C2=B1  8%  sched_debug.cpu.s=
ched_goidle.0
>       3713 =C2=B1 27%     +68.4%       6253 =C2=B1 11%  sched_debug.cpu.s=
ched_goidle.min
>       5638 =C2=B1 29%     -44.5%       3131 =C2=B1 18%  sched_debug.cpu.s=
ched_goidle.stddev
>       8286 =C2=B1 32%     +85.0%      15333 =C2=B1 15%  sched_debug.cpu.t=
twu_count.0
>      10697 =C2=B1  1%     +13.2%      12107 =C2=B1  7%  sched_debug.cpu.t=
twu_count.avg
>       4845 =C2=B1  5%     +17.8%       5707 =C2=B1  8%  sched_debug.cpu.t=
twu_count.min
>       2886 =C2=B1 47%    +105.5%       5931 =C2=B1 16%  sched_debug.cpu.t=
twu_local.0
>       3667 =C2=B1  3%     +17.0%       4291 =C2=B1  1%  sched_debug.cpu.t=
twu_local.avg
>       2127 =C2=B1 17%     +29.2%       2748 =C2=B1  7%  sched_debug.cpu.t=
twu_local.min
> =

> =

> lkp-ivb-d02: Ivy Bridge
> Memory: 8G
> =

>                     unixbench.time.involuntary_context_switches
> =

>   5000 ++----------------------------------------------------------------=
---+
>   4500 O+                                                                =
   |
>        |                O              O      O            O             =
   O
>   4000 ++                            O                            O  O   =
   |
>   3500 ++O  O O  O    O           O         O                O  O      O =
 O |
>        |                   O    O         O                              =
   |
>   3000 ++                                          O    O                =
   |
>   2500 ++                                                                =
   |
>   2000 ++                                                                =
   |
>        |                                                                 =
   |
>   1500 ++                                                                =
   |
>   1000 ++                                                                =
   |
>        |.*.. .*..         .*.  .*.*..             .*..                   =
   |
>    500 *+   *    *.*..*.*.   *.       .*.. .*.*..*    *.*..*.*           =
   |
>      0 ++----------O---------O-------*----*------O----O------------------=
---+
> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
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
> Ying Huang

> ---
> LKP_SERVER: inn
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> testcase: unixbench
> default-monitors:
>   wait: activate-monitor
>   kmsg: =

>   uptime: =

>   iostat: =

>   vmstat: =

>   numa-numastat: =

>   numa-vmstat: =

>   numa-meminfo: =

>   proc-vmstat: =

>   proc-stat:
>     interval: 10
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
>     interval: 60
> cpufreq_governor: performance
> default-watchdogs:
>   oom-killer: =

>   watchdog: =

> commit: b8084f70e028697b342d6388b244d6171717fc54
> model: Ivy Bridge
> nr_cpu: 4
> memory: 8G
> nr_hdd_partitions: 1
> hdd_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part1"
> swap_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part3"
> rootfs_partition: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part4"
> netconsole_port: 66723
> category: benchmark
> nr_task: 1
> unixbench:
>   test: fsdisk
> queue: bisect
> testbox: lkp-ivb-d02
> tbox_group: lkp-ivb-d02
> kconfig: x86_64-rhel
> enqueue_time: 2016-01-05 16:24:11.468660360 +08:00
> id: 62c43434378ef50b95fcd4973759daf66a148734
> user: lkp
> compiler: gcc-4.9
> head_commit: 5bae791e5bb8895ac3d65634231c99d79a0e0002
> base_commit: 168309855a7d1e16db751e9c647119fe2d2dc878
> branch: linux-devel/devel-hourly-2016010502
> rootfs: debian-x86_64-2015-02-07.cgz
> result_root: "/result/unixbench/performance-1-fsdisk/lkp-ivb-d02/debian-x=
86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b244d61717=
17fc54/0"
> job_file: "/lkp/scheduled/lkp-ivb-d02/bisect_unixbench-performance-1-fsdi=
sk-debian-x86_64-2015-02-07.cgz-x86_64-rhel-b8084f70e028697b342d6388b244d61=
71717fc54-20160105-89027-193oala-0.yaml"
> max_uptime: 922.0999999999999
> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/scheduled/lkp-ivb-d02/bisect_unixbench-performance-1-fsdisk-=
debian-x86_64-2015-02-07.cgz-x86_64-rhel-b8084f70e028697b342d6388b244d61717=
17fc54-20160105-89027-193oala-0.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel
> - branch=3Dlinux-devel/devel-hourly-2016010502
> - commit=3Db8084f70e028697b342d6388b244d6171717fc54
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b24=
4d6171717fc54/vmlinuz-4.4.0-rc6-00236-gb8084f7
> - max_uptime=3D922
> - RESULT_ROOT=3D/result/unixbench/performance-1-fsdisk/lkp-ivb-d02/debian=
-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b244d617=
1717fc54/0
> - LKP_SERVER=3Dinn
> - |2-
> =

> =

>   earlyprintk=3DttyS0,115200 systemd.log_level=3Derr
>   debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100
>   panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_=
ramdisk=3D2 prompt_ramdisk=3D0
>   console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal
> =

>   rw
> lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b=
244d6171717fc54/modules.cgz"
> bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/d=
eps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_=
64-2015-02-07.cgz/turbostat.cgz,/lkp/benchmarks/turbostat.cgz,/lkp/benchmar=
ks/unixbench.cgz"
> linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/b8084f70e028697b342=
d6388b244d6171717fc54/linux-headers.cgz"
> repeat_to: 2
> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b244d6171=
717fc54/vmlinuz-4.4.0-rc6-00236-gb8084f7"
> dequeue_time: 2016-01-05 16:39:47.706440461 +08:00
> job_state: finished
> loadavg: 0.58 0.25 0.10 1/123 2689
> start_time: '1451983209'
> end_time: '1451983353'
> version: "/lkp/lkp/.src-20160105-162125"



--===============6540963435872444453==--

