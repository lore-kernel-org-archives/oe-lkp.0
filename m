Content-Type: multipart/mixed; boundary="===============1601009196576368109=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [futex] 65d8fc777f: +25.6% will-it-scale.per_process_ops
Date: Mon, 29 Feb 2016 10:37:08 +0100
Message-ID: <20160229093708.GA21037@gmail.com>
In-Reply-To: <871t7vzze1.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1601009196576368109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <ying.huang@linux.intel.com> wrote:

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git maste=
r =

> commit 65d8fc777f6dcfee12785c057a6b57f679641c90 ("futex: Remove requireme=
nt for =

> lock_page() in get_futex_key()")

I have asked for this before, but let me try again: could you _PLEASE_ make=
 these =

emails more readable?

For example what are the 'below changes'? Changes in the profile output? Pr=
ofiles =

always change from run to run, so that alone is not informative.

Also, there are a lot of changes - which ones prompted the email to be gene=
rated?

All in one, this email is hard to parse, because it just dumps a lot of =

information with very little explanatory structure for someone not versed i=
n their =

format. Please try to create an easy to parse 'story' that leads the reader =

towards what you want these emails to tell - not just a raw dump of seeming=
ly =

unconnected pieces of data ...

Thanks,

	Ingo

> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04/=
futex1/will-it-scale
> =

> commit: =

>   8ad7b378d0d016309014cae0f640434bca7b5e11
>   65d8fc777f6dcfee12785c057a6b57f679641c90
> =

> 8ad7b378d0d01630 65d8fc777f6dcfee12785c057a =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    5076304 =C2=B1  0%     +25.6%    6374220 =C2=B1  0%  will-it-scale.per=
_process_ops
>    1194117 =C2=B1  0%     +14.4%    1366153 =C2=B1  1%  will-it-scale.per=
_thread_ops
>       0.58 =C2=B1  0%      -2.0%       0.57 =C2=B1  0%  will-it-scale.sca=
lability
>       6820 =C2=B1  0%     -19.6%       5483 =C2=B1 15%  meminfo.AnonHugeP=
ages
>       2652 =C2=B1  5%     -10.4%       2375 =C2=B1  2%  vmstat.system.cs
>       2848 =C2=B1 32%    +141.2%       6870 =C2=B1 65%  numa-meminfo.node=
1.Active(anon)
>       2832 =C2=B1 31%     +57.6%       4465 =C2=B1 27%  numa-meminfo.node=
1.AnonPages
>      15018 =C2=B1 12%     -23.3%      11515 =C2=B1 15%  numa-meminfo.node=
2.AnonPages
>       1214 =C2=B1 14%     -22.8%     936.75 =C2=B1 20%  numa-meminfo.node=
3.PageTables
>     712.25 =C2=B1 32%    +141.2%       1718 =C2=B1 65%  numa-vmstat.node1=
.nr_active_anon
>     708.25 =C2=B1 31%     +57.7%       1116 =C2=B1 27%  numa-vmstat.node1=
.nr_anon_pages
>       3754 =C2=B1 12%     -23.3%       2879 =C2=B1 15%  numa-vmstat.node2=
.nr_anon_pages
>     304.75 =C2=B1 14%     -23.1%     234.50 =C2=B1 20%  numa-vmstat.node3=
.nr_page_table_pages
>       3.53 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es.___might_sleep.__might_sleep.get_futex_key.futex_wake.do_futex
>       4.34 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es.__might_sleep.get_futex_key.futex_wake.do_futex.sys_futex
>       1.27 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es.__wake_up_bit.unlock_page.get_futex_key.futex_wake.do_futex
>       4.36 =C2=B1  1%     +29.6%       5.65 =C2=B1  1%  perf-profile.cycl=
es.drop_futex_key_refs.isra.12.futex_wake.do_futex.sys_futex.entry_SYSCALL_=
64_fastpath
>       6.69 =C2=B1  1%     +28.1%       8.57 =C2=B1  0%  perf-profile.cycl=
es.entry_SYSCALL_64
>       6.73 =C2=B1  0%     +30.6%       8.79 =C2=B1  0%  perf-profile.cycl=
es.entry_SYSCALL_64_after_swapgs
>      74.21 =C2=B1  0%     -11.0%      66.06 =C2=B1  0%  perf-profile.cycl=
es.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
>      59.05 =C2=B1  0%     -21.4%      46.40 =C2=B1  0%  perf-profile.cycl=
es.get_futex_key.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
>       4.12 =C2=B1  0%     +78.5%       7.36 =C2=B1  1%  perf-profile.cycl=
es.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.entry_SYSCALL_6=
4_fastpath
>       2.27 =C2=B1  3%     +24.1%       2.82 =C2=B1  4%  perf-profile.cycl=
es.get_user_pages_fast.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastp=
ath
>      26.95 =C2=B1  0%     +30.0%      35.04 =C2=B1  1%  perf-profile.cycl=
es.get_user_pages_fast.get_futex_key.futex_wake.do_futex.sys_futex
>      13.43 =C2=B1  0%     +27.2%      17.09 =C2=B1  1%  perf-profile.cycl=
es.gup_pte_range.gup_pud_range.get_user_pages_fast.get_futex_key.futex_wake
>      19.66 =C2=B1  1%     +28.4%      25.24 =C2=B1  0%  perf-profile.cycl=
es.gup_pud_range.get_user_pages_fast.get_futex_key.futex_wake.do_futex
>       4.33 =C2=B1  1%     +37.0%       5.93 =C2=B1  4%  perf-profile.cycl=
es.hash_futex.do_futex.sys_futex.entry_SYSCALL_64_fastpath
>      13.59 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycl=
es.unlock_page.get_futex_key.futex_wake.do_futex.sys_futex
>      15160 =C2=B1 19%     -34.8%       9883 =C2=B1  0%  sched_debug.cfs_r=
q:/.exec_clock.min
>      27.25 =C2=B1 15%     -37.6%      17.00 =C2=B1  8%  sched_debug.cfs_r=
q:/.load_avg.7
>      21.00 =C2=B1 38%     -27.4%      15.25 =C2=B1  2%  sched_debug.cpu.c=
pu_load[2].1
>      21.00 =C2=B1 38%     -27.4%      15.25 =C2=B1  2%  sched_debug.cpu.c=
pu_load[3].1
>      21.00 =C2=B1 38%     -27.4%      15.25 =C2=B1  2%  sched_debug.cpu.c=
pu_load[4].1
>       1790 =C2=B1  0%     +42.4%       2549 =C2=B1 45%  sched_debug.cpu.c=
urr->pid.21
>      50033 =C2=B1  4%      -6.8%      46622 =C2=B1  4%  sched_debug.cpu.n=
r_load_updates.29
>       4398 =C2=B1 42%    +103.5%       8949 =C2=B1 23%  sched_debug.cpu.n=
r_switches.11
>       7452 =C2=B1 34%    +111.3%      15744 =C2=B1 54%  sched_debug.cpu.n=
r_switches.20
>       3739 =C2=B1 13%    +213.5%      11723 =C2=B1 40%  sched_debug.cpu.n=
r_switches.23
>       1648 =C2=B1 53%     +96.5%       3239 =C2=B1 63%  sched_debug.cpu.n=
r_switches.51
>       0.25 =C2=B1519%   -1300.0%      -3.00 =C2=B1-52%  sched_debug.cpu.n=
r_uninterruptible.24
>       8632 =C2=B1 16%     -32.5%       5823 =C2=B1 19%  sched_debug.cpu.s=
ched_count.1
>       5091 =C2=B1 36%    +137.5%      12092 =C2=B1 31%  sched_debug.cpu.s=
ched_count.11
>      12453 =C2=B1 90%     -74.6%       3159 =C2=B1 24%  sched_debug.cpu.s=
ched_count.2
>       7782 =C2=B1 32%    +118.2%      16977 =C2=B1 46%  sched_debug.cpu.s=
ched_count.20
>       2665 =C2=B1 48%     -49.8%       1337 =C2=B1 30%  sched_debug.cpu.s=
ched_count.32
>       1365 =C2=B1 11%     -14.0%       1174 =C2=B1  3%  sched_debug.cpu.s=
ched_count.45
>       1693 =C2=B1 51%    +147.7%       4193 =C2=B1 42%  sched_debug.cpu.s=
ched_count.51
>       5023 =C2=B1 57%     -51.5%       2434 =C2=B1 43%  sched_debug.cpu.s=
ched_count.57
>       1705 =C2=B1 16%    +129.6%       3915 =C2=B1 48%  sched_debug.cpu.s=
ched_goidle.23
>     536.25 =C2=B1 14%     -18.7%     435.75 =C2=B1  2%  sched_debug.cpu.s=
ched_goidle.45
>       1228 =C2=B1 19%     -27.3%     892.50 =C2=B1 17%  sched_debug.cpu.s=
ched_goidle.5
>       1919 =C2=B1 55%     +88.5%       3617 =C2=B1 37%  sched_debug.cpu.t=
twu_count.11
>       7699 =C2=B1 35%     -43.7%       4335 =C2=B1 43%  sched_debug.cpu.t=
twu_count.24
>       5380 =C2=B1 36%     -45.6%       2926 =C2=B1 18%  sched_debug.cpu.t=
twu_count.30
>     563.25 =C2=B1 20%    +140.3%       1353 =C2=B1 38%  sched_debug.cpu.t=
twu_local.11
>       4297 =C2=B1 46%     -49.1%       2186 =C2=B1 39%  sched_debug.cpu.t=
twu_local.24
>       2828 =C2=B1 47%     -47.8%       1475 =C2=B1 34%  sched_debug.cpu.t=
twu_local.27
>       3243 =C2=B1 36%     -54.3%       1482 =C2=B1 32%  sched_debug.cpu.t=
twu_local.30
>     199.25 =C2=B1  6%    +100.6%     399.75 =C2=B1 32%  sched_debug.cpu.t=
twu_local.44
>       1158 =C2=B1 64%     -67.3%     379.00 =C2=B1 46%  sched_debug.cpu.t=
twu_local.54
>     242.25 =C2=B1 21%     +51.0%     365.75 =C2=B1 19%  sched_debug.cpu.t=
twu_local.55
>       1009 =C2=B1 26%     -50.8%     496.50 =C2=B1 44%  sched_debug.cpu.t=
twu_local.59
>       1736 =C2=B1 53%     -67.8%     559.25 =C2=B1 22%  sched_debug.cpu.t=
twu_local.9
> =

> =

> lkp-sbx04: Sandy Bridge-EX
> Memory: 64G
> =

> =

>    perf-profile.cycles.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fas=
tpath
> =

>   76 ++------------------------------------------------------------------=
---+
>      |                                                                   =
   |
>   74 ++   .*..        .*..*..*..     .*..    .*..  .*..  .*..  .*..*..*..=
*  |
>      *..*.    *..*..*.          *..*.    *.*.    *.    *.    *.          =
   |
>      |                                                                   =
   |
>   72 ++                                                                  =
   |
>      |                                                                   =
   |
>   70 ++                                                                  =
   |
>      |                                                                   =
   |
>   68 ++                                                                  =
   |
>      |                                                                   =
   |
>      |                          O  O  O    O  O  O  O     O  O     O  O  =
   |
>   66 O+                                  O             O        O        =
O  O
>      |  O  O  O  O     O  O  O                                           =
   |
>   64 ++-------------O----------------------------------------------------=
---+
> =

> =

> =

>                              will-it-scale.per_process_ops
> =

>   6.6e+06 O+----O-O--O---------------------------------------------------=
---+
>           |  O          O  O O  O                                        =
   |
>   6.4e+06 ++                       O  O O  O  O  O O  O  O  O O  O  O  O =
O  O
>           |                                                              =
   |
>   6.2e+06 ++                                                             =
   |
>     6e+06 ++                                                             =
   |
>           |                                                              =
   |
>   5.8e+06 ++                                                             =
   |
>           |                                                              =
   |
>   5.6e+06 ++                                                             =
   |
>   5.4e+06 ++                                                             =
   |
>           |                                                              =
   |
>   5.2e+06 ++                                                             =
   |
>           *..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.=
*  |
>     5e+06 ++-------------------------------------------------------------=
---+
> =

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
> testcase: will-it-scale
> default-monitors:
>   wait: activate-monitor
>   kmsg: =

>   uptime: =

>   iostat: =

>   heartbeat: =

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

> commit: 65d8fc777f6dcfee12785c057a6b57f679641c90
> model: Sandy Bridge-EX
> nr_cpu: 64
> memory: 64G
> nr_ssd_partitions: 7
> ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2*-part1"
> swap_partitions: =

> category: benchmark
> perf-profile:
>   freq: 800
> will-it-scale:
>   test: futex1
> queue: bisect
> testbox: lkp-sbx04
> tbox_group: lkp-sbx04
> kconfig: x86_64-rhel
> enqueue_time: 2016-02-28 23:45:52.199165563 +08:00
> compiler: gcc-4.9
> rootfs: debian-x86_64-2015-02-07.cgz
> id: 6b2c2bd744dd898009648cb82de7e0ba77de33f1
> user: lkp
> head_commit: ed520c327c4259ec08b1677023087f658329b961
> base_commit: 81f70ba233d5f660e1ea5fe23260ee323af5d53a
> branch: linux-devel/devel-hourly-2016022811
> result_root: "/result/will-it-scale/performance-futex1/lkp-sbx04/debian-x=
86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057a6b57f679=
641c90/0"
> job_file: "/lkp/scheduled/lkp-sbx04/bisect_will-it-scale-performance-fute=
x1-debian-x86_64-2015-02-07.cgz-x86_64-rhel-65d8fc777f6dcfee12785c057a6b57f=
679641c90-20160228-23650-17c4qc1-0.yaml"
> max_uptime: 1500
> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/scheduled/lkp-sbx04/bisect_will-it-scale-performance-futex1-=
debian-x86_64-2015-02-07.cgz-x86_64-rhel-65d8fc777f6dcfee12785c057a6b57f679=
641c90-20160228-23650-17c4qc1-0.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel
> - branch=3Dlinux-devel/devel-hourly-2016022811
> - commit=3D65d8fc777f6dcfee12785c057a6b57f679641c90
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057a6=
b57f679641c90/vmlinuz-4.5.0-rc3-00235-g65d8fc7
> - max_uptime=3D1500
> - RESULT_ROOT=3D/result/will-it-scale/performance-futex1/lkp-sbx04/debian=
-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057a6b57f6=
79641c90/0
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
> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057=
a6b57f679641c90/modules.cgz"
> bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/d=
eps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_=
64-2015-02-07.cgz/turbostat.cgz,/lkp/benchmarks/turbostat.cgz,/osimage/deps=
/debian-x86_64-2015-02-07.cgz/will-it-scale.cgz,/lkp/benchmarks/will-it-sca=
le.cgz,/lkp/benchmarks/will-it-scale-x86_64.cgz"
> linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee127=
85c057a6b57f679641c90/linux-headers.cgz"
> repeat_to: 2
> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057a6b57f67=
9641c90/vmlinuz-4.5.0-rc3-00235-g65d8fc7"
> dequeue_time: 2016-02-28 23:46:33.938915178 +08:00
> job_state: finished
> loadavg: 45.27 20.12 7.84 2/649 11559
> start_time: '1456674445'
> end_time: '1456674754'
> version: "/lkp/lkp/.src-20160226-194908"

> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu0/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu1/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu10/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu11/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu12/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu13/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu14/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu15/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu16/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu17/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu18/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu19/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu2/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu20/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu21/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu22/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu23/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu24/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu25/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu26/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu27/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu28/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu29/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu3/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu30/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu31/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu32/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu33/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu34/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu35/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu36/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu37/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu38/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu39/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu4/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu40/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu41/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu42/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu43/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu44/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu45/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu46/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu47/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu48/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu49/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu5/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu50/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu51/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu52/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu53/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu54/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu55/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu56/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu57/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu58/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu59/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu6/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu60/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu61/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu62/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu63/cpuf=
req/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu7/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu8/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu9/cpufr=
eq/scaling_governor
> 2016-02-28 23:47:25 ./runtest.py futex1 16 both 1 8 16 24 32 48 64


--===============1601009196576368109==--

