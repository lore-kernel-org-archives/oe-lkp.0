Content-Type: multipart/mixed; boundary="===============4640321725592529155=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] b8084f70e0: No primary result change, 1414.7% unixbench.time.involuntary_context_switches
Date: Wed, 06 Jan 2016 12:25:55 +0800
Message-ID: <871t9vfi5o.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160106033052.GG3818@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4640321725592529155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Paul E. McKenney" <paulmck@linux.vnet.ibm.com> writes:

> On Wed, Jan 06, 2016 at 10:47:43AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git fo=
r-kbuild-bot/current-stable
>> commit b8084f70e028697b342d6388b244d6171717fc54 ("rcu: Eliminate softirq=
 processing from rcutree")
>
> This is a performance degradation, correct?  If so, looks like this commit
> is not ready for mainline unless set up to be configured on only for
> -rt workloads.

Yes.  This is a performance degradation.

> Or am I missing the plot somewhere here?

Which plot?

Best Regards,
Huang, Ying

> 								Thanx, Paul
>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcas=
e:
>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb=
-d02/fsbuffer/unixbench
>> =

>> commit: =

>>   ee644236a506642e20637f954d286f49a76ed83a
>>   b8084f70e028697b342d6388b244d6171717fc54
>> =

>> ee644236a506642e b8084f70e028697b342d6388b2 =

>> ---------------- -------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>     257.25  18%   +1414.7%       3896  13%  unixbench.time.involuntary_c=
ontext_switches
>>    4425148  22%     -61.9%    1684712  29%  cpuidle.C1E-IVB.time
>>      83.75  48%     +91.6%     160.50  31%  cpuidle.POLL.usage
>>       1902   7%     -12.0%       1674   1%  slabinfo.anon_vma.active_objs
>>       1902   7%     -12.0%       1674   1%  slabinfo.anon_vma.num_objs
>>     257.25  18%   +1414.7%       3896  13%  time.involuntary_context_swi=
tches
>>       8.15   6%     -14.1%       7.00   1%  time.user_time
>>      34345  14%     -33.3%      22908  33%  sched_debug.cfs_rq:/.exec_cl=
ock.2
>>      34987  13%     -19.7%      28093  15%  sched_debug.cfs_rq:/.exec_cl=
ock.max
>>     642.75   5%     +59.6%       1025  55%  sched_debug.cfs_rq:/.exec_cl=
ock.min
>>      14639  13%     -21.8%      11443  16%  sched_debug.cfs_rq:/.exec_cl=
ock.stddev
>>     127.75  16%     -26.2%      94.25  25%  sched_debug.cfs_rq:/.load_av=
g.3
>>      38865  12%     -36.0%      24885  34%  sched_debug.cfs_rq:/.min_vru=
ntime.2
>>      39385  12%     -22.8%      30395  16%  sched_debug.cfs_rq:/.min_vru=
ntime.max
>>       1090  11%     +45.3%       1584  32%  sched_debug.cfs_rq:/.min_vru=
ntime.min
>>      16286  13%     -25.1%      12200  18%  sched_debug.cfs_rq:/.min_vru=
ntime.stddev
>>       2.00   0%     -50.0%       1.00   0%  sched_debug.cfs_rq:/.nr_spre=
ad_over.0
>>       2.00   0%     -50.0%       1.00   0%  sched_debug.cfs_rq:/.nr_spre=
ad_over.max
>>       0.87   0%     -42.3%       0.50   0%  sched_debug.cfs_rq:/.nr_spre=
ad_over.stddev
>>      28.50  62%    +338.6%     125.00 114%  sched_debug.cfs_rq:/.runnabl=
e_load_avg.1
>>      16286  13%     -25.1%      12200  18%  sched_debug.cfs_rq:/.spread0=
.stddev
>>     127.75  16%     -26.0%      94.50  25%  sched_debug.cfs_rq:/.tg_load=
_avg_contrib.3
>>     626662   5%     -13.2%     544121   9%  sched_debug.cpu.avg_idle.0
>>      20.25  28%    +419.8%     105.25 132%  sched_debug.cpu.cpu_load[3].1
>>     692.40   7%     -15.2%     586.96   9%  sched_debug.cpu.curr->pid.avg
>>      36187  12%     -31.5%      24793  29%  sched_debug.cpu.nr_load_upda=
tes.2
>>      15625  11%     +61.6%      25245  23%  sched_debug.cpu.nr_switches.0
>>      20008   4%     +14.1%      22828   4%  sched_debug.cpu.nr_switches.=
avg
>>      23333   8%     +40.9%      32872  18%  sched_debug.cpu.sched_count.0
>>      21974   4%     +12.7%      24771   4%  sched_debug.cpu.sched_count.=
avg
>>      31771   9%     +22.6%      38942   5%  sched_debug.cpu.sched_count.=
max
>>       9514  28%     +75.8%      16728   7%  sched_debug.cpu.ttwu_count.0
>>       4323  10%     +40.6%       6080  30%  sched_debug.cpu.ttwu_count.2
>>      10068   4%     +15.6%      11639   4%  sched_debug.cpu.ttwu_count.a=
vg
>>       4101  10%     +21.7%       4990   8%  sched_debug.cpu.ttwu_count.m=
in
>>       3676  21%    +102.5%       7443   8%  sched_debug.cpu.ttwu_local.0
>>       2014  15%     +43.2%       2884  10%  sched_debug.cpu.ttwu_local.2
>>       3508   1%     +24.8%       4377   4%  sched_debug.cpu.ttwu_local.a=
vg
>>       5554  19%     +34.0%       7444   8%  sched_debug.cpu.ttwu_local.m=
ax
>>       1846  16%     +40.2%       2588   6%  sched_debug.cpu.ttwu_local.m=
in
>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcas=
e:
>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb=
-d02/fsdisk/unixbench
>> =

>> commit: =

>>   ee644236a506642e20637f954d286f49a76ed83a
>>   b8084f70e028697b342d6388b244d6171717fc54
>> =

>> ee644236a506642e b8084f70e028697b342d6388b2 =

>> ---------------- -------------------------- =

>>        fail:runs  %reproduction    fail:runs
>>            |             |             |    =

>>            :4           25%           1:4     kmsg.DHCP/BOOTP:Reply_not_=
for_us,op[#]xid[#]
>>          %stddev     %change         %stddev
>>              \          |                \  =

>>     265.75  18%   +1313.4%       3756   9%  unixbench.time.involuntary_c=
ontext_switches
>>     659.50   6%     +16.5%     768.00   7%  slabinfo.kmalloc-512.num_objs
>>     265.75  18%   +1313.4%       3756   9%  time.involuntary_context_swi=
tches
>>    5911312  13%     -55.9%    2606719  10%  cpuidle.C1E-IVB.time
>>      95195 172%    +815.7%     871684 140%  cpuidle.POLL.time
>>      51.75  10%     -30.9%      35.75  24%  cpuidle.POLL.usage
>>      13361  22%     -27.0%       9754   4%  sched_debug.cfs_rq:/.exec_cl=
ock.stddev
>>      14632  24%     -28.1%      10524   5%  sched_debug.cfs_rq:/.min_vru=
ntime.stddev
>>      14632  24%     -28.1%      10524   5%  sched_debug.cfs_rq:/.spread0=
.stddev
>>     197.25  14%     +52.9%     301.50  41%  sched_debug.cfs_rq:/.util_av=
g.0
>>     552666   8%      -7.7%     510200   7%  sched_debug.cpu.avg_idle.1
>>      13610  30%     +59.7%      21734   7%  sched_debug.cpu.nr_switches.0
>>      21145   1%     +12.3%      23752   7%  sched_debug.cpu.nr_switches.=
avg
>>      10105  21%     +62.1%      16380   7%  sched_debug.cpu.nr_switches.=
min
>>      11293  28%     -44.4%       6276  16%  sched_debug.cpu.nr_switches.=
stddev
>>      21314  19%     +38.1%      29437   5%  sched_debug.cpu.sched_count.0
>>      11261  22%     +57.2%      17703   9%  sched_debug.cpu.sched_count.=
min
>>      11158  27%     -36.7%       7068  12%  sched_debug.cpu.sched_count.=
stddev
>>       5854  35%     +57.0%       9194   8%  sched_debug.cpu.sched_goidle=
.0
>>       3713  27%     +68.4%       6253  11%  sched_debug.cpu.sched_goidle=
.min
>>       5638  29%     -44.5%       3131  18%  sched_debug.cpu.sched_goidle=
.stddev
>>       8286  32%     +85.0%      15333  15%  sched_debug.cpu.ttwu_count.0
>>      10697   1%     +13.2%      12107   7%  sched_debug.cpu.ttwu_count.a=
vg
>>       4845   5%     +17.8%       5707   8%  sched_debug.cpu.ttwu_count.m=
in
>>       2886  47%    +105.5%       5931  16%  sched_debug.cpu.ttwu_local.0
>>       3667   3%     +17.0%       4291   1%  sched_debug.cpu.ttwu_local.a=
vg
>>       2127  17%     +29.2%       2748   7%  sched_debug.cpu.ttwu_local.m=
in
>> =

>> =

>> lkp-ivb-d02: Ivy Bridge
>> Memory: 8G
>> =

>>                     unixbench.time.involuntary_context_switches
>> =

>>   5000 ++---------------------------------------------------------------=
----+
>>   4500 O+                                                               =
    |
>>        |                O              O      O            O            =
    O
>>   4000 ++                            O                            O  O  =
    |
>>   3500 ++O  O O  O    O           O         O                O  O      O=
  O |
>>        |                   O    O         O                             =
    |
>>   3000 ++                                          O    O               =
    |
>>   2500 ++                                                               =
    |
>>   2000 ++                                                               =
    |
>>        |                                                                =
    |
>>   1500 ++                                                               =
    |
>>   1000 ++                                                               =
    |
>>        |.*.. .*..         .*.  .*.*..             .*..                  =
    |
>>    500 *+   *    *.*..*.*.   *.       .*.. .*.*..*    *.*..*.*          =
    |
>>      0 ++----------O---------O-------*----*------O----O-----------------=
----+
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
>> testcase: unixbench
>> default-monitors:
>>   wait: activate-monitor
>>   kmsg: =

>>   uptime: =

>>   iostat: =

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

>> commit: b8084f70e028697b342d6388b244d6171717fc54
>> model: Ivy Bridge
>> nr_cpu: 4
>> memory: 8G
>> nr_hdd_partitions: 1
>> hdd_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part1"
>> swap_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part3"
>> rootfs_partition: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DBQSB0-part4"
>> netconsole_port: 66723
>> category: benchmark
>> nr_task: 1
>> unixbench:
>>   test: fsdisk
>> queue: bisect
>> testbox: lkp-ivb-d02
>> tbox_group: lkp-ivb-d02
>> kconfig: x86_64-rhel
>> enqueue_time: 2016-01-05 16:24:11.468660360 +08:00
>> id: 62c43434378ef50b95fcd4973759daf66a148734
>> user: lkp
>> compiler: gcc-4.9
>> head_commit: 5bae791e5bb8895ac3d65634231c99d79a0e0002
>> base_commit: 168309855a7d1e16db751e9c647119fe2d2dc878
>> branch: linux-devel/devel-hourly-2016010502
>> rootfs: debian-x86_64-2015-02-07.cgz
>> result_root: "/result/unixbench/performance-1-fsdisk/lkp-ivb-d02/debian-=
x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b244d6171=
717fc54/0"
>> job_file: "/lkp/scheduled/lkp-ivb-d02/bisect_unixbench-performance-1-fsd=
isk-debian-x86_64-2015-02-07.cgz-x86_64-rhel-b8084f70e028697b342d6388b244d6=
171717fc54-20160105-89027-193oala-0.yaml"
>> max_uptime: 922.0999999999999
>> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
>> bootloader_append:
>> - root=3D/dev/ram0
>> - user=3Dlkp
>> - job=3D/lkp/scheduled/lkp-ivb-d02/bisect_unixbench-performance-1-fsdisk=
-debian-x86_64-2015-02-07.cgz-x86_64-rhel-b8084f70e028697b342d6388b244d6171=
717fc54-20160105-89027-193oala-0.yaml
>> - ARCH=3Dx86_64
>> - kconfig=3Dx86_64-rhel
>> - branch=3Dlinux-devel/devel-hourly-2016010502
>> - commit=3Db8084f70e028697b342d6388b244d6171717fc54
>> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b2=
44d6171717fc54/vmlinuz-4.4.0-rc6-00236-gb8084f7
>> - max_uptime=3D922
>> - RESULT_ROOT=3D/result/unixbench/performance-1-fsdisk/lkp-ivb-d02/debia=
n-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b244d61=
71717fc54/0
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
>> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388=
b244d6171717fc54/modules.cgz"
>> bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/=
deps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86=
_64-2015-02-07.cgz/turbostat.cgz,/lkp/benchmarks/turbostat.cgz,/lkp/benchma=
rks/unixbench.cgz"
>> linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/b8084f70e028697b34=
2d6388b244d6171717fc54/linux-headers.cgz"
>> repeat_to: 2
>> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/b8084f70e028697b342d6388b244d617=
1717fc54/vmlinuz-4.4.0-rc6-00236-gb8084f7"
>> dequeue_time: 2016-01-05 16:39:47.706440461 +08:00
>> job_state: finished
>> loadavg: 0.58 0.25 0.10 1/123 2689
>> start_time: '1451983209'
>> end_time: '1451983353'
>> version: "/lkp/lkp/.src-20160105-162125"
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============4640321725592529155==--

