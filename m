Content-Type: multipart/mixed; boundary="===============8316650850141711057=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [futex] 65d8fc777f: +25.6% will-it-scale.per_process_ops
Date: Fri, 18 Mar 2016 14:12:59 +0800
Message-ID: <87d1qsgvpw.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160229093708.GA21037@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8316650850141711057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Sorry, for late.

Ingo Molnar <mingo@kernel.org> writes:
> * kernel test robot <ying.huang@linux.intel.com> wrote:
>
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er =

>> commit 65d8fc777f6dcfee12785c057a6b57f679641c90 ("futex: Remove requirem=
ent for =

>> lock_page() in get_futex_key()")
>
> I have asked for this before, but let me try again: could you _PLEASE_ ma=
ke these =

> emails more readable?
>
> For example what are the 'below changes'? Changes in the profile output? =
Profiles =

> always change from run to run, so that alone is not informative.
>
> Also, there are a lot of changes - which ones prompted the email to be ge=
nerated?

Usually we will put most important change we think in the subject of the
mail, for this email, it is,

+25.6% will-it-scale.per_process_ops

and, we try to put most important changes at the top of the comparison
result below.  That is the will-it-scale.xxx below.

We are thinking about how to improve this.  You input is valuable for
us.  We are thinking change the "below changes" line to something like
below.

FYI, we noticed the +25.6% will-it-scale.per_process_ops improvement on

...

Does this looks better?

> All in one, this email is hard to parse, because it just dumps a lot of =

> information with very little explanatory structure for someone not versed=
 in their =

> format. Please try to create an easy to parse 'story' that leads the read=
er =

> towards what you want these emails to tell - not just a raw dump of seemi=
ngly =

> unconnected pieces of data ...

Which kind of story?  Something like, we tested some benchmark on some
machine, which triggered some regression, we do bisect, and find the
first bad commit is xxx.  In addition to benchmark result, we collected
some other information, hope they are helpful for you.

We just try to help.  Sorry for confusion.  We try to provide all
information needed to describe the change and help for root causing the
changes.  But we know, we are still far from there, so your input is
important for us to improve our test report.  Which part of the report
do you think should be changed firstly?  The overall structure?  Or the
data format?

Best Regards,
Huang, Ying

> Thanks,
>
> 	Ingo
>
>> =

>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04=
/futex1/will-it-scale
>> =

>> commit: =

>>   8ad7b378d0d016309014cae0f640434bca7b5e11
>>   65d8fc777f6dcfee12785c057a6b57f679641c90
>> =

>> 8ad7b378d0d01630 65d8fc777f6dcfee12785c057a =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>    5076304 .  0%     +25.6%    6374220 .  0%  will-it-scale.per_process_=
ops
>>    1194117 .  0%     +14.4%    1366153 .  1%  will-it-scale.per_thread_o=
ps
>>       0.58 .  0%      -2.0%       0.57 .  0%  will-it-scale.scalability
>>       6820 .  0%     -19.6%       5483 . 15%  meminfo.AnonHugePages
>>       2652 .  5%     -10.4%       2375 .  2%  vmstat.system.cs
>>       2848 . 32%    +141.2%       6870 . 65%  numa-meminfo.node1.Active(=
anon)
>>       2832 . 31%     +57.6%       4465 . 27%  numa-meminfo.node1.AnonPag=
es
>>      15018 . 12%     -23.3%      11515 . 15%  numa-meminfo.node2.AnonPag=
es
>>       1214 . 14%     -22.8%     936.75 . 20%  numa-meminfo.node3.PageTab=
les
>>     712.25 . 32%    +141.2%       1718 . 65%  numa-vmstat.node1.nr_activ=
e_anon
>>     708.25 . 31%     +57.7%       1116 . 27%  numa-vmstat.node1.nr_anon_=
pages
>>       3754 . 12%     -23.3%       2879 . 15%  numa-vmstat.node2.nr_anon_=
pages
>>     304.75 . 14%     -23.1%     234.50 . 20%  numa-vmstat.node3.nr_page_=
table_pages
>> 3.53 . 1% -100.0% 0.00 . -1%
> perf-profile.cycles.___might_sleep.__might_sleep.get_futex_key.futex_wake=
.do_futex
>> 4.34 . 1% -100.0% 0.00 . -1%
> perf-profile.cycles.__might_sleep.get_futex_key.futex_wake.do_futex.sys_f=
utex
>> 1.27 . 3% -100.0% 0.00 . -1%
> perf-profile.cycles.__wake_up_bit.unlock_page.get_futex_key.futex_wake.do=
_futex
>> 4.36 . 1% +29.6% 5.65 . 1%
> perf-profile.cycles.drop_futex_key_refs.isra.12.futex_wake.do_futex.sys_f=
utex.entry_SYSCALL_64_fastpath
>>       6.69 .  1%     +28.1%       8.57 .  0%  perf-profile.cycles.entry_=
SYSCALL_64
>>       6.73 .  0%     +30.6%       8.79 .  0%  perf-profile.cycles.entry_=
SYSCALL_64_after_swapgs
>> 74.21 . 0% -11.0% 66.06 . 0%
> perf-profile.cycles.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpa=
th
>> 59.05 . 0% -21.4% 46.40 . 0%
> perf-profile.cycles.get_futex_key.futex_wake.do_futex.sys_futex.entry_SYS=
CALL_64_fastpath
>> 4.12 . 0% +78.5% 7.36 . 1%
> perf-profile.cycles.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_fu=
tex.entry_SYSCALL_64_fastpath
>> 2.27 . 3% +24.1% 2.82 . 4%
> perf-profile.cycles.get_user_pages_fast.futex_wake.do_futex.sys_futex.ent=
ry_SYSCALL_64_fastpath
>> 26.95 . 0% +30.0% 35.04 . 1%
> perf-profile.cycles.get_user_pages_fast.get_futex_key.futex_wake.do_futex=
.sys_futex
>> 13.43 . 0% +27.2% 17.09 . 1%
> perf-profile.cycles.gup_pte_range.gup_pud_range.get_user_pages_fast.get_f=
utex_key.futex_wake
>> 19.66 . 1% +28.4% 25.24 . 0%
> perf-profile.cycles.gup_pud_range.get_user_pages_fast.get_futex_key.futex=
_wake.do_futex
>> 4.33 . 1% +37.0% 5.93 . 4%
> perf-profile.cycles.hash_futex.do_futex.sys_futex.entry_SYSCALL_64_fastpa=
th
>> 13.59 . 0% -100.0% 0.00 . -1%
> perf-profile.cycles.unlock_page.get_futex_key.futex_wake.do_futex.sys_fut=
ex
>>      15160 . 19%     -34.8%       9883 .  0%  sched_debug.cfs_rq:/.exec_=
clock.min
>>      27.25 . 15%     -37.6%      17.00 .  8%  sched_debug.cfs_rq:/.load_=
avg.7
>>      21.00 . 38%     -27.4%      15.25 .  2%  sched_debug.cpu.cpu_load[2=
].1
>>      21.00 . 38%     -27.4%      15.25 .  2%  sched_debug.cpu.cpu_load[3=
].1
>>      21.00 . 38%     -27.4%      15.25 .  2%  sched_debug.cpu.cpu_load[4=
].1
>>       1790 .  0%     +42.4%       2549 . 45%  sched_debug.cpu.curr->pid.=
21
>>      50033 .  4%      -6.8%      46622 .  4%  sched_debug.cpu.nr_load_up=
dates.29
>>       4398 . 42%    +103.5%       8949 . 23%  sched_debug.cpu.nr_switche=
s.11
>>       7452 . 34%    +111.3%      15744 . 54%  sched_debug.cpu.nr_switche=
s.20
>>       3739 . 13%    +213.5%      11723 . 40%  sched_debug.cpu.nr_switche=
s.23
>>       1648 . 53%     +96.5%       3239 . 63%  sched_debug.cpu.nr_switche=
s.51
>>       0.25 .519%   -1300.0%      -3.00 .-52%  sched_debug.cpu.nr_uninter=
ruptible.24
>>       8632 . 16%     -32.5%       5823 . 19%  sched_debug.cpu.sched_coun=
t.1
>>       5091 . 36%    +137.5%      12092 . 31%  sched_debug.cpu.sched_coun=
t.11
>>      12453 . 90%     -74.6%       3159 . 24%  sched_debug.cpu.sched_coun=
t.2
>>       7782 . 32%    +118.2%      16977 . 46%  sched_debug.cpu.sched_coun=
t.20
>>       2665 . 48%     -49.8%       1337 . 30%  sched_debug.cpu.sched_coun=
t.32
>>       1365 . 11%     -14.0%       1174 .  3%  sched_debug.cpu.sched_coun=
t.45
>>       1693 . 51%    +147.7%       4193 . 42%  sched_debug.cpu.sched_coun=
t.51
>>       5023 . 57%     -51.5%       2434 . 43%  sched_debug.cpu.sched_coun=
t.57
>>       1705 . 16%    +129.6%       3915 . 48%  sched_debug.cpu.sched_goid=
le.23
>>     536.25 . 14%     -18.7%     435.75 .  2%  sched_debug.cpu.sched_goid=
le.45
>>       1228 . 19%     -27.3%     892.50 . 17%  sched_debug.cpu.sched_goid=
le.5
>>       1919 . 55%     +88.5%       3617 . 37%  sched_debug.cpu.ttwu_count=
.11
>>       7699 . 35%     -43.7%       4335 . 43%  sched_debug.cpu.ttwu_count=
.24
>>       5380 . 36%     -45.6%       2926 . 18%  sched_debug.cpu.ttwu_count=
.30
>>     563.25 . 20%    +140.3%       1353 . 38%  sched_debug.cpu.ttwu_local=
.11
>>       4297 . 46%     -49.1%       2186 . 39%  sched_debug.cpu.ttwu_local=
.24
>>       2828 . 47%     -47.8%       1475 . 34%  sched_debug.cpu.ttwu_local=
.27
>>       3243 . 36%     -54.3%       1482 . 32%  sched_debug.cpu.ttwu_local=
.30
>>     199.25 .  6%    +100.6%     399.75 . 32%  sched_debug.cpu.ttwu_local=
.44
>>       1158 . 64%     -67.3%     379.00 . 46%  sched_debug.cpu.ttwu_local=
.54
>>     242.25 . 21%     +51.0%     365.75 . 19%  sched_debug.cpu.ttwu_local=
.55
>>       1009 . 26%     -50.8%     496.50 . 44%  sched_debug.cpu.ttwu_local=
.59
>>       1736 . 53%     -67.8%     559.25 . 22%  sched_debug.cpu.ttwu_local=
.9
>> =

>> =

>> lkp-sbx04: Sandy Bridge-EX
>> Memory: 64G
>> =

>> =

>>    perf-profile.cycles.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fa=
stpath
>> =

>>   76 ++-----------------------------------------------------------------=
----+
>>      |                                                                  =
    |
>>   74 ++   .*..        .*..*..*..     .*..    .*..  .*..  .*..  .*..*..*.=
.*  |
>>      *..*.    *..*..*.          *..*.    *.*.    *.    *.    *.         =
    |
>>      |                                                                  =
    |
>>   72 ++                                                                 =
    |
>>      |                                                                  =
    |
>>   70 ++                                                                 =
    |
>>      |                                                                  =
    |
>>   68 ++                                                                 =
    |
>>      |                                                                  =
    |
>>      |                          O  O  O    O  O  O  O     O  O     O  O =
    |
>>   66 O+                                  O             O        O       =
 O  O
>>      |  O  O  O  O     O  O  O                                          =
    |
>>   64 ++-------------O---------------------------------------------------=
----+
>> =

>> =

>> =

>>                              will-it-scale.per_process_ops
>> =

>>   6.6e+06 O+----O-O--O--------------------------------------------------=
----+
>>           |  O          O  O O  O                                       =
    |
>>   6.4e+06 ++                       O  O O  O  O  O O  O  O  O O  O  O  O=
 O  O
>>           |                                                             =
    |
>>   6.2e+06 ++                                                            =
    |
>>     6e+06 ++                                                            =
    |
>>           |                                                             =
    |
>>   5.8e+06 ++                                                            =
    |
>>           |                                                             =
    |
>>   5.6e+06 ++                                                            =
    |
>>   5.4e+06 ++                                                            =
    |
>>           |                                                             =
    |
>>   5.2e+06 ++                                                            =
    |
>>           *..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*=
.*  |
>>     5e+06 ++------------------------------------------------------------=
----+
>> =

>> =

>> 	[*] bisect-good sample
>> 	[O] bisect-bad  sample
>> =

>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>> =

>> =

>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>> =

>> =

>> Thanks,
>> Ying Huang
>
>> ---
>> LKP_SERVER: inn
>> LKP_CGI_PORT: 80
>> LKP_CIFS_PORT: 139
>> testcase: will-it-scale
>> default-monitors:
>>   wait: activate-monitor
>>   kmsg: =

>>   uptime: =

>>   iostat: =

>>   heartbeat: =

>>   vmstat: =

>>   numa-numastat: =

>>   numa-vmstat: =

>>   numa-meminfo: =

>>   proc-vmstat: =

>>   proc-stat:
>>     interval: 10
>>   meminfo: =

>>   slabinfo: =

>>   interrupts: =

>>   lock_stat: =

>>   latency_stats: =

>>   softirqs: =

>>   bdi_dev_mapping: =

>>   diskstats: =

>>   nfsstat: =

>>   cpuidle: =

>>   cpufreq-stats: =

>>   turbostat: =

>>   pmeter: =

>>   sched_debug:
>>     interval: 60
>> cpufreq_governor: performance
>> default-watchdogs:
>>   oom-killer: =

>>   watchdog: =

>> commit: 65d8fc777f6dcfee12785c057a6b57f679641c90
>> model: Sandy Bridge-EX
>> nr_cpu: 64
>> memory: 64G
>> nr_ssd_partitions: 7
>> ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2*-part1"
>> swap_partitions: =

>> category: benchmark
>> perf-profile:
>>   freq: 800
>> will-it-scale:
>>   test: futex1
>> queue: bisect
>> testbox: lkp-sbx04
>> tbox_group: lkp-sbx04
>> kconfig: x86_64-rhel
>> enqueue_time: 2016-02-28 23:45:52.199165563 +08:00
>> compiler: gcc-4.9
>> rootfs: debian-x86_64-2015-02-07.cgz
>> id: 6b2c2bd744dd898009648cb82de7e0ba77de33f1
>> user: lkp
>> head_commit: ed520c327c4259ec08b1677023087f658329b961
>> base_commit: 81f70ba233d5f660e1ea5fe23260ee323af5d53a
>> branch: linux-devel/devel-hourly-2016022811
>> result_root:
> "/result/will-it-scale/performance-futex1/lkp-sbx04/debian-x86_64-2015-02=
-07.cgz/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057a6b57f679641c90/0"
>> job_file:
> "/lkp/scheduled/lkp-sbx04/bisect_will-it-scale-performance-futex1-debian-=
x86_64-2015-02-07.cgz-x86_64-rhel-65d8fc777f6dcfee12785c057a6b57f679641c90-=
20160228-23650-17c4qc1-0.yaml"
>> max_uptime: 1500
>> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
>> bootloader_append:
>> - root=3D/dev/ram0
>> - user=3Dlkp
>> -
> job=3D/lkp/scheduled/lkp-sbx04/bisect_will-it-scale-performance-futex1-de=
bian-x86_64-2015-02-07.cgz-x86_64-rhel-65d8fc777f6dcfee12785c057a6b57f67964=
1c90-20160228-23650-17c4qc1-0.yaml
>> - ARCH=3Dx86_64
>> - kconfig=3Dx86_64-rhel
>> - branch=3Dlinux-devel/devel-hourly-2016022811
>> - commit=3D65d8fc777f6dcfee12785c057a6b57f679641c90
>> -
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057a6b5=
7f679641c90/vmlinuz-4.5.0-rc3-00235-g65d8fc7
>> - max_uptime=3D1500
>> -
> RESULT_ROOT=3D/result/will-it-scale/performance-futex1/lkp-sbx04/debian-x=
86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057a6b57f679=
641c90/0
>> - LKP_SERVER=3Dinn
>> - |2-
>> =

>> =

>>   earlyprintk=3DttyS0,115200 systemd.log_level=3Derr
>>   debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100
>>   panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load=
_ramdisk=3D2 prompt_ramdisk=3D0
>>   console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal
>> =

>>   rw
>> lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
>> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c05=
7a6b57f679641c90/modules.cgz"
>> bm_initrd:
> "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/deps/debian-=
x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_64-2015-02-=
07.cgz/turbostat.cgz,/lkp/benchmarks/turbostat.cgz,/osimage/deps/debian-x86=
_64-2015-02-07.cgz/will-it-scale.cgz,/lkp/benchmarks/will-it-scale.cgz,/lkp=
/benchmarks/will-it-scale-x86_64.cgz"
>> linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12=
785c057a6b57f679641c90/linux-headers.cgz"
>> repeat_to: 2
>> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/65d8fc777f6dcfee12785c057a6b57f6=
79641c90/vmlinuz-4.5.0-rc3-00235-g65d8fc7"
>> dequeue_time: 2016-02-28 23:46:33.938915178 +08:00
>> job_state: finished
>> loadavg: 45.27 20.12 7.84 2/649 11559
>> start_time: '1456674445'
>> end_time: '1456674754'
>> version: "/lkp/lkp/.src-20160226-194908"
>
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu0/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu1/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu10/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu11/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu12/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu13/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu14/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu15/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu16/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu17/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu18/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu19/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu2/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu20/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu21/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu22/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu23/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu24/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu25/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu26/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu27/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu28/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu29/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu3/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu30/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu31/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu32/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu33/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu34/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu35/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu36/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu37/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu38/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu39/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu4/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu40/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu41/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu42/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu43/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu44/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu45/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu46/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu47/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu48/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu49/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu5/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu50/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu51/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu52/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu53/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu54/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu55/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu56/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu57/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu58/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu59/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu6/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu60/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu61/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu62/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu63/cpu=
freq/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu7/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu8/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:24 echo performance > /sys/devices/system/cpu/cpu9/cpuf=
req/scaling_governor
>> 2016-02-28 23:47:25 ./runtest.py futex1 16 both 1 8 16 24 32 48 64
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============8316650850141711057==--

