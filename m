Content-Type: multipart/mixed; boundary="===============9042000230271730991=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 8d47a0d8f7: fio.write_bw_MBps -28.6% regression
Date: Fri, 10 Apr 2020 06:35:08 +0000
Message-ID: <d82835ec-c99c-bb40-be9f-f49f8101e921@linux.intel.com>
In-Reply-To: <20190513031733.GI31424@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============9042000230271730991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Wenruo,

    We test it in v5.6, the issue still exist, do you have time to take =

a look at this? Thanks.

On 5/13/2019 11:17 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -28.6% regression of fio.write_bw_MBps due to commit:
> =

> =

> commit: 8d47a0d8f7947422dd359ac8e462687f81a7a137 ("btrfs: Do mandatory tr=
ee block check before submitting bio")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: fio-basic
> on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz wit=
h 256G memory
> with following parameters:
> =

> 	disk: 2pmem
> 	fs: btrfs
> 	runtime: 200s
> 	nr_task: 50%
> 	time_based: tb
> 	rw: randwrite
> 	bs: 4k
> 	ioengine: libaio
> 	test_size: 100G
> 	cpufreq_governor: performance
> 	ucode: 0x3d
> =

> test-description: Fio is a tool that will spawn a number of threads or pr=
ocesses doing a particular type of I/O action as specified by the user.
> test-url: https://github.com/axboe/fio
> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runt=
ime/rw/tbox_group/test_size/testcase/time_based/ucode:
>    4k/gcc-7/performance/2pmem/btrfs/libaio/x86_64-rhel-7.6/50%/debian-x86=
_64-2018-04-03.cgz/200s/randwrite/lkp-hsw-ep2/100G/fio-basic/tb/0x3d
> =

> commit:
>    ff2ac107fa ("btrfs: tree-checker: Remove comprehensive root owner chec=
k")
>    8d47a0d8f7 ("btrfs: Do mandatory tree block check before submitting bi=
o")
> =

> ff2ac107fae2440b 8d47a0d8f7947422dd359ac8e46
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>             :4           25%           1:4     dmesg.BUG:unable_to_handle=
_kernel
>             :4           25%           1:4     dmesg.Kernel_panic-not_syn=
cing:Fatal_exception_in_interrupt
>             :4           25%           1:4     dmesg.Oops:#[##]
>             :4           25%           1:4     dmesg.RIP:cpuidle_enter_st=
ate
>             :4           25%           1:4     dmesg.RIP:native_write_msr
>             :4           25%           1:4     dmesg.RIP:perf_prepare_sam=
ple
>            1:4          -25%            :4     dmesg.WARNING:at#for_ip_in=
terrupt_entry/0x
>           %stddev     %change         %stddev
>               \          |                \
>        0.01 =C2=B1 21%      +0.3        0.28 =C2=B1 20%  fio.latency_1000=
ms%
>        4.14 =C2=B1 13%      +1.8        5.95 =C2=B1  9%  fio.latency_10ms%
>        8.73 =C2=B1 15%      +3.0       11.68 =C2=B1  8%  fio.latency_20ms%
>        1.91 =C2=B1  5%      -0.4        1.52 =C2=B1  3%  fio.latency_250m=
s%
>       66.81            -5.9       60.90 =C2=B1  2%  fio.latency_4ms%
>        0.18 =C2=B1 15%      +0.1        0.29 =C2=B1 16%  fio.latency_750u=
s%
>   1.017e+08           -28.5%   72701525        fio.time.file_system_outpu=
ts
>      109.75           -26.8%      80.33 =C2=B1  2%  fio.time.percent_of_c=
pu_this_job_got
>      197.97           -26.4%     145.79 =C2=B1  2%  fio.time.system_time
>       38.66 =C2=B1  4%     -24.0%      29.39 =C2=B1  3%  fio.time.user_ti=
me
>    12388015           -28.5%    8858878        fio.time.voluntary_context=
_switches
>    12711059           -28.5%    9083954        fio.workload
>      247.91           -28.6%     176.96        fio.write_bw_MBps
>      309248 =C2=B1  2%     +71.7%     531114 =C2=B1  4%  fio.write_clat_9=
9%_us
>       17574           +40.0%      24609        fio.write_clat_mean_us
>       57989 =C2=B1  4%     +82.2%     105661        fio.write_clat_stddev
>       63463           -28.6%      45302        fio.write_iops
>      564.61           +40.2%     791.54        fio.write_slat_mean_us
>        9375 =C2=B1  7%     +96.3%      18406        fio.write_slat_stddev
>       21.25            +8.5%      23.06 =C2=B1  9%  boot-time.dhcp
>       93.32            +1.4%      94.58        iostat.cpu.idle
>        6.43           -18.6%       5.23 =C2=B1  2%  iostat.cpu.system
>        6.48            -1.2        5.27 =C2=B1  2%  mpstat.cpu.all.sys%
>        0.24 =C2=B1  5%      -0.1        0.18 =C2=B1  2%  mpstat.cpu.all.u=
sr%
>       93.00            +1.1%      94.00        vmstat.cpu.id
>      591200           -30.0%     413921        vmstat.io.bo
>    31653776 =C2=B1  2%     -10.9%   28196588 =C2=B1  2%  vmstat.memory.ca=
che
>    11927341 =C2=B1  7%     +29.8%   15486805 =C2=B1  4%  vmstat.memory.fr=
ee
>        5.00           -26.7%       3.67 =C2=B1 12%  vmstat.procs.r
>      635910 =C2=B1  2%     -27.6%     460384        vmstat.system.cs
>     7822384 =C2=B1  2%     -25.0%    5870498        numa-numastat.node0.l=
ocal_node
>     7839861 =C2=B1  2%     -24.8%    5893785        numa-numastat.node0.n=
uma_hit
>      224988 =C2=B1 47%     -93.5%      14675 =C2=B1 48%  numa-numastat.no=
de0.numa_miss
>      242465 =C2=B1 44%     -84.3%      37964 =C2=B1 18%  numa-numastat.no=
de0.other_node
>     7762623 =C2=B1 12%     -26.8%    5681358 =C2=B1  6%  numa-numastat.no=
de1.local_node
>      224988 =C2=B1 47%     -93.5%      14675 =C2=B1 48%  numa-numastat.no=
de1.numa_foreign
>     7768618 =C2=B1 12%     -26.9%    5681573 =C2=B1  6%  numa-numastat.no=
de1.numa_hit
>   9.429e+08 =C2=B1 10%     -35.4%  6.094e+08        cpuidle.C1.time
>    53504154 =C2=B1  6%     -31.8%   36504731        cpuidle.C1.usage
>   1.093e+09 =C2=B1 22%     -50.3%  5.435e+08 =C2=B1  3%  cpuidle.C1E.time
>    16541925 =C2=B1 13%     -45.0%    9103775        cpuidle.C1E.usage
>   5.366e+09 =C2=B1 36%     +71.7%  9.214e+09 =C2=B1 18%  cpuidle.C3.time
>    16163664 =C2=B1 33%     +57.0%   25379738 =C2=B1  5%  cpuidle.C3.usage
>     9697055 =C2=B1 16%     -35.8%    6225168 =C2=B1 19%  cpuidle.C6.usage
>    19313595 =C2=B1 17%     -16.3%   16166123        cpuidle.POLL.time
>    10291838 =C2=B1  9%     -26.8%    7537045 =C2=B1  7%  meminfo.Active
>    10034782 =C2=B1  9%     -27.4%    7280710 =C2=B1  7%  meminfo.Active(f=
ile)
>    31524905 =C2=B1  2%     -10.9%   28082249 =C2=B1  2%  meminfo.Cached
>      115157 =C2=B1  4%     +61.1%     185560 =C2=B1  3%  meminfo.CmaFree
>     6430720 =C2=B1  8%     +19.1%    7660885 =C2=B1  6%  meminfo.DirectMa=
p2M
>      534230 =C2=B1  5%     -12.8%     465932 =C2=B1  6%  meminfo.Dirty
>    11737322 =C2=B1  7%     +30.2%   15281189 =C2=B1  4%  meminfo.MemFree
>    37604344 =C2=B1  2%      -9.4%   34060483        meminfo.Memused
>      806.50 =C2=B1 37%    +137.4%       1914 =C2=B1  8%  meminfo.Writeback
>      370.50 =C2=B1 11%     +36.8%     507.00        slabinfo.bdev_cache.a=
ctive_objs
>      370.50 =C2=B1 11%     +36.8%     507.00        slabinfo.bdev_cache.n=
um_objs
>       15147 =C2=B1  5%      -8.3%      13897 =C2=B1  2%  slabinfo.blkdev_=
ioc.active_objs
>       17839 =C2=B1  6%     -11.7%      15745 =C2=B1  2%  slabinfo.blkdev_=
ioc.num_objs
>       12178 =C2=B1  4%      -7.4%      11275 =C2=B1  2%  slabinfo.kmalloc=
-512.num_objs
>        7794 =C2=B1  3%     +25.4%       9774        slabinfo.proc_inode_c=
ache.active_objs
>        8017 =C2=B1  2%     +23.4%       9895        slabinfo.proc_inode_c=
ache.num_objs
>        2366 =C2=B1 23%     -32.6%       1595 =C2=B1  5%  slabinfo.task_gr=
oup.active_objs
>        2366 =C2=B1 23%     -32.6%       1595 =C2=B1  5%  slabinfo.task_gr=
oup.num_objs
>      263.75 =C2=B1  2%     -15.1%     224.00 =C2=B1  2%  turbostat.Avg_MHz
>        9.46 =C2=B1  2%      -1.4        8.07 =C2=B1  2%  turbostat.Busy%
>    53502248 =C2=B1  6%     -31.8%   36503898        turbostat.C1
>        5.86 =C2=B1  8%      -2.0        3.82        turbostat.C1%
>    16540396 =C2=B1 13%     -45.0%    9102733        turbostat.C1E
>        6.80 =C2=B1 22%      -3.4        3.40 =C2=B1  4%  turbostat.C1E%
>    16163332 =C2=B1 33%     +57.0%   25379351 =C2=B1  5%  turbostat.C3
>       33.55 =C2=B1 36%     +24.1       57.61 =C2=B1 18%  turbostat.C3%
>     9689445 =C2=B1 16%     -35.8%    6221033 =C2=B1 19%  turbostat.C6
>       18.04 =C2=B1 26%     +49.1%      26.90 =C2=B1  9%  turbostat.CPU%c3
>       53.25 =C2=B1  3%     +10.8%      59.00 =C2=B1  4%  turbostat.CoreTmp
>        4.67 =C2=B1 14%     +62.7%       7.59 =C2=B1 26%  turbostat.Pkg%pc2
>       56.50            +9.7%      62.00 =C2=B1  2%  turbostat.PkgTmp
>       11.84            -4.8%      11.28        turbostat.RAMWatt
>     7232478 =C2=B1 10%     -37.2%    4543037 =C2=B1 22%  numa-meminfo.nod=
e0.Active
>     7072564 =C2=B1 10%     -37.6%    4410135 =C2=B1 23%  numa-meminfo.nod=
e0.Active(file)
>      308167 =C2=B1  6%     -24.7%     232152 =C2=B1 10%  numa-meminfo.nod=
e0.Dirty
>     8784028 =C2=B1 13%     +21.7%   10686327 =C2=B1  2%  numa-meminfo.nod=
e0.Inactive
>     8669548 =C2=B1 12%     +20.7%   10465444 =C2=B1  2%  numa-meminfo.nod=
e0.Inactive(file)
>      572.50 =C2=B1 22%    +115.9%       1236 =C2=B1 25%  numa-meminfo.nod=
e0.Writeback
>    15098140 =C2=B1  3%     -17.7%   12425670 =C2=B1  3%  numa-meminfo.nod=
e1.FilePages
>    11599549 =C2=B1  7%     -22.3%    9018051 =C2=B1  4%  numa-meminfo.nod=
e1.Inactive
>      105067 =C2=B1 92%     -99.3%     725.33 =C2=B1 51%  numa-meminfo.nod=
e1.Inactive(anon)
>    11494482 =C2=B1  7%     -21.6%    9017325 =C2=B1  4%  numa-meminfo.nod=
e1.Inactive(file)
>        5504 =C2=B1  9%     -12.5%       4819 =C2=B1  2%  numa-meminfo.nod=
e1.KernelStack
>     6709938 =C2=B1 11%     +45.8%    9781880 =C2=B1  5%  numa-meminfo.nod=
e1.MemFree
>    18029136 =C2=B1  4%     -17.0%   14957200 =C2=B1  3%  numa-meminfo.nod=
e1.MemUsed
>        4427 =C2=B1 69%     -77.5%     996.00 =C2=B1  8%  numa-meminfo.nod=
e1.PageTables
>      857660 =C2=B1 32%     -37.2%     538646 =C2=B1  8%  numa-meminfo.nod=
e1.SUnreclaim
>      109232 =C2=B1 88%     -96.1%       4274 =C2=B1 10%  numa-meminfo.nod=
e1.Shmem
>      986740 =C2=B1 35%     -40.0%     592452 =C2=B1 10%  numa-meminfo.nod=
e1.Slab
>      575.21 =C2=B1 15%     +30.1%     748.58 =C2=B1  2%  sched_debug.cfs_=
rq:/.runnable_load_avg.max
>      100.45 =C2=B1 15%     +28.6%     129.19 =C2=B1  5%  sched_debug.cfs_=
rq:/.runnable_load_avg.stddev
>      830.19 =C2=B1  9%     +15.7%     960.25 =C2=B1  6%  sched_debug.cfs_=
rq:/.util_avg.max
>       29.97 =C2=B1 16%     -25.2%      22.43 =C2=B1 31%  sched_debug.cfs_=
rq:/.util_est_enqueued.avg
>      591.17 =C2=B1 13%     -22.2%     459.83 =C2=B1 18%  sched_debug.cfs_=
rq:/.util_est_enqueued.max
>      107.52 =C2=B1 13%     -23.0%      82.84 =C2=B1 23%  sched_debug.cfs_=
rq:/.util_est_enqueued.stddev
>        2.06 =C2=B1  5%      -9.3%       1.87        sched_debug.cpu.clock=
.stddev
>        2.06 =C2=B1  5%      -9.3%       1.87        sched_debug.cpu.clock=
_task.stddev
>       24.51 =C2=B1  7%     +21.5%      29.77 =C2=B1  8%  sched_debug.cpu.=
cpu_load[0].avg
>      541.29 =C2=B1 15%     +38.3%     748.58 =C2=B1  2%  sched_debug.cpu.=
cpu_load[0].max
>       93.97 =C2=B1  7%     +27.8%     120.09 =C2=B1  2%  sched_debug.cpu.=
cpu_load[0].stddev
>      519.08 =C2=B1  6%     +40.5%     729.42 =C2=B1  4%  sched_debug.cpu.=
cpu_load[1].max
>       87.45 =C2=B1  5%     +28.5%     112.39 =C2=B1  4%  sched_debug.cpu.=
cpu_load[1].stddev
>      480.83 =C2=B1  7%     +39.5%     670.92 =C2=B1 13%  sched_debug.cpu.=
cpu_load[2].max
>       80.92 =C2=B1  5%     +25.7%     101.75 =C2=B1  8%  sched_debug.cpu.=
cpu_load[2].stddev
>      408.83 =C2=B1  4%     +54.0%     629.58 =C2=B1 19%  sched_debug.cpu.=
cpu_load[3].max
>       71.62 =C2=B1  2%     +30.7%      93.61 =C2=B1 11%  sched_debug.cpu.=
cpu_load[3].stddev
>      381.50 =C2=B1  8%     +66.7%     636.00 =C2=B1 18%  sched_debug.cpu.=
cpu_load[4].max
>       64.40 =C2=B1  6%     +39.7%      89.96 =C2=B1 12%  sched_debug.cpu.=
cpu_load[4].stddev
>      106.75 =C2=B1 20%     -88.4%      12.33 =C2=B1 10%  proc-vmstat.kswa=
pd_high_wmark_hit_quickly
>     2508660 =C2=B1  9%     -27.5%    1819662 =C2=B1  7%  proc-vmstat.nr_a=
ctive_file
>    33315360           -30.4%   23192301        proc-vmstat.nr_dirtied
>      133447 =C2=B1  5%     -12.6%     116580 =C2=B1  6%  proc-vmstat.nr_d=
irty
>     7881043 =C2=B1  2%     -10.9%    7019533 =C2=B1  2%  proc-vmstat.nr_f=
ile_pages
>       28790 =C2=B1  4%     +61.1%      46392 =C2=B1  3%  proc-vmstat.nr_f=
ree_cma
>     2934503 =C2=B1  7%     +30.2%    3821369 =C2=B1  4%  proc-vmstat.nr_f=
ree_pages
>     5044168            -3.4%    4872965        proc-vmstat.nr_inactive_fi=
le
>      430282            -6.0%     404589        proc-vmstat.nr_slab_unrecl=
aimable
>      197.75 =C2=B1 38%    +136.5%     467.67 =C2=B1 10%  proc-vmstat.nr_w=
riteback
>    33243480           -30.4%   23143756        proc-vmstat.nr_written
>     2508665 =C2=B1  9%     -27.5%    1819662 =C2=B1  7%  proc-vmstat.nr_z=
one_active_file
>     5044399            -3.4%    4873026        proc-vmstat.nr_zone_inacti=
ve_file
>      134972 =C2=B1  5%     -12.4%     118262 =C2=B1  5%  proc-vmstat.nr_z=
one_write_pending
>    15632301 =C2=B1  5%     -25.8%   11598535 =C2=B1  3%  proc-vmstat.numa=
_hit
>    15608826 =C2=B1  5%     -25.8%   11575029 =C2=B1  3%  proc-vmstat.numa=
_local
>     2300530 =C2=B1 10%     -31.1%    1585363 =C2=B1 10%  proc-vmstat.pgac=
tivate
>    16955745           -26.3%   12499611 =C2=B1  2%  proc-vmstat.pgalloc_n=
ormal
>    17488000           -25.9%   12959812 =C2=B1  2%  proc-vmstat.pgfree
>    1.33e+08           -30.4%   92575440        proc-vmstat.pgpgout
>     5728177 =C2=B1  6%     -78.5%    1232433 =C2=B1 25%  proc-vmstat.pgsc=
an_kswapd
>     5727967 =C2=B1  6%     -78.5%    1232244 =C2=B1 25%  proc-vmstat.pgst=
eal_kswapd
>       32760            -7.6%      30285        proc-vmstat.slabs_scanned
>     1768211 =C2=B1 10%     -37.7%    1102275 =C2=B1 23%  numa-vmstat.node=
0.nr_active_file
>    10410188 =C2=B1  7%     -32.5%    7023939 =C2=B1  7%  numa-vmstat.node=
0.nr_dirtied
>       76995 =C2=B1  6%     -24.6%      58035 =C2=B1 10%  numa-vmstat.node=
0.nr_dirty
>     2167457 =C2=B1 12%     +20.7%    2616147 =C2=B1  2%  numa-vmstat.node=
0.nr_inactive_file
>      142.00 =C2=B1 24%    +120.4%     313.00 =C2=B1 24%  numa-vmstat.node=
0.nr_writeback
>    10308758 =C2=B1  7%     -32.6%    6949497 =C2=B1  7%  numa-vmstat.node=
0.nr_written
>     1768216 =C2=B1 10%     -37.7%    1102275 =C2=B1 23%  numa-vmstat.node=
0.nr_zone_active_file
>     2167563 =C2=B1 12%     +20.7%    2616189 =C2=B1  2%  numa-vmstat.node=
0.nr_zone_inactive_file
>       77786 =C2=B1  7%     -24.3%      58899 =C2=B1 10%  numa-vmstat.node=
0.nr_zone_write_pending
>     5889240 =C2=B1  3%     -14.3%    5046874 =C2=B1  3%  numa-vmstat.node=
0.numa_hit
>     5837851 =C2=B1  4%     -14.0%    5023120 =C2=B1  3%  numa-vmstat.node=
0.numa_local
>       68376 =C2=B1 48%     -96.9%       2149 =C2=B1 46%  numa-vmstat.node=
0.numa_miss
>      119766 =C2=B1 42%     -78.4%      25904 =C2=B1  3%  numa-vmstat.node=
0.numa_other
>       30.50 =C2=B1 38%    -100.0%       0.00        numa-vmstat.node0.wor=
kingset_nodes
>     6829126 =C2=B1  6%     -22.8%    5269898 =C2=B1 10%  numa-vmstat.node=
1.nr_dirtied
>     3774645 =C2=B1  3%     -17.7%    3106081 =C2=B1  3%  numa-vmstat.node=
1.nr_file_pages
>       28796 =C2=B1  4%     +61.1%      46405 =C2=B1  3%  numa-vmstat.node=
1.nr_free_cma
>     1677332 =C2=B1 11%     +45.8%    2445778 =C2=B1  5%  numa-vmstat.node=
1.nr_free_pages
>       26266 =C2=B1 92%     -99.3%     180.67 =C2=B1 51%  numa-vmstat.node=
1.nr_inactive_anon
>     2873702 =C2=B1  7%     -21.6%    2254116 =C2=B1  4%  numa-vmstat.node=
1.nr_inactive_file
>        5506 =C2=B1  9%     -12.5%       4820 =C2=B1  2%  numa-vmstat.node=
1.nr_kernel_stack
>       29031 =C2=B1 85%     -88.2%       3436        numa-vmstat.node1.nr_=
mapped
>        1106 =C2=B1 69%     -77.5%     249.00 =C2=B1  8%  numa-vmstat.node=
1.nr_page_table_pages
>       27308 =C2=B1 88%     -96.1%       1068 =C2=B1 10%  numa-vmstat.node=
1.nr_shmem
>      214418 =C2=B1 32%     -37.2%     134663 =C2=B1  8%  numa-vmstat.node=
1.nr_slab_unreclaimable
>       75.00 =C2=B1 35%    +145.3%     184.00 =C2=B1 18%  numa-vmstat.node=
1.nr_writeback
>     6761224 =C2=B1  6%     -23.1%    5202586 =C2=B1 10%  numa-vmstat.node=
1.nr_written
>       26266 =C2=B1 92%     -99.3%     180.67 =C2=B1 51%  numa-vmstat.node=
1.nr_zone_inactive_anon
>     2873810 =C2=B1  7%     -21.6%    2254135 =C2=B1  4%  numa-vmstat.node=
1.nr_zone_inactive_file
>       68381 =C2=B1 48%     -96.9%       2152 =C2=B1 46%  numa-vmstat.node=
1.numa_foreign
>     5035283 =C2=B1 15%     -26.9%    3679318 =C2=B1  7%  numa-vmstat.node=
1.numa_hit
>     4905249 =C2=B1 15%     -28.2%    3522229 =C2=B1  8%  numa-vmstat.node=
1.numa_local
>       18.43 =C2=B1  6%     -28.3%      13.21 =C2=B1  3%  perf-stat.i.MPKI
>   2.205e+09 =C2=B1  3%     +10.5%  2.437e+09        perf-stat.i.branch-in=
structions
>        1.83 =C2=B1  5%      -0.6        1.24 =C2=B1  7%  perf-stat.i.bran=
ch-miss-rate%
>    37019551 =C2=B1  3%     -29.4%   26140844 =C2=B1  5%  perf-stat.i.bran=
ch-misses
>    28932020 =C2=B1  6%     -31.1%   19933819 =C2=B1  3%  perf-stat.i.cach=
e-misses
>    2.03e+08 =C2=B1  4%     -24.8%  1.526e+08        perf-stat.i.cache-ref=
erences
>      645248 =C2=B1  2%     -27.4%     468301        perf-stat.i.context-s=
witches
>        1.97 =C2=B1  7%     -22.1%       1.53 =C2=B1  2%  perf-stat.i.cpi
>   1.983e+10 =C2=B1  3%     -15.1%  1.684e+10        perf-stat.i.cpu-cycles
>        1.03 =C2=B1  5%      -0.4        0.64 =C2=B1 10%  perf-stat.i.dTLB=
-load-miss-rate%
>    31879502 =C2=B1  6%     -37.9%   19807598 =C2=B1  9%  perf-stat.i.dTLB=
-load-misses
>   3.201e+09 =C2=B1  3%     +18.8%  3.804e+09        perf-stat.i.dTLB-loads
>        0.13 =C2=B1  7%      -0.0        0.09 =C2=B1 10%  perf-stat.i.dTLB=
-store-miss-rate%
>     2516181 =C2=B1 10%     -28.3%    1805272 =C2=B1 10%  perf-stat.i.dTLB=
-store-misses
>   2.143e+09 =C2=B1  3%     +19.8%  2.568e+09 =C2=B1  2%  perf-stat.i.dTLB=
-stores
>    13781489 =C2=B1  3%     -28.4%    9866239 =C2=B1  3%  perf-stat.i.iTLB=
-loads
>   1.164e+10 =C2=B1  3%     +21.6%  1.415e+10        perf-stat.i.instructi=
ons
>        8435 =C2=B1 17%     +42.5%      12023 =C2=B1 14%  perf-stat.i.inst=
ructions-per-iTLB-miss
>        0.57 =C2=B1  3%     +43.6%       0.82        perf-stat.i.ipc
>    16050361 =C2=B1  9%     -30.7%   11127721 =C2=B1  3%  perf-stat.i.node=
-load-misses
>     8120610 =C2=B1  9%     -31.3%    5580996        perf-stat.i.node-loads
>     2591649 =C2=B1 13%     -31.1%    1785932 =C2=B1  6%  perf-stat.i.node=
-store-misses
>     1809775 =C2=B1 12%     -31.2%    1244360 =C2=B1  2%  perf-stat.i.node=
-stores
>       17.45 =C2=B1  4%     -38.2%      10.79        perf-stat.overall.MPKI
>        1.68 =C2=B1  3%      -0.6        1.07 =C2=B1  5%  perf-stat.overal=
l.branch-miss-rate%
>        1.70 =C2=B1  3%     -30.2%       1.19        perf-stat.overall.cpi
>      689.69 =C2=B1  9%     +22.6%     845.48 =C2=B1  2%  perf-stat.overal=
l.cycles-between-cache-misses
>        0.99 =C2=B1  5%      -0.5        0.52 =C2=B1 10%  perf-stat.overal=
l.dTLB-load-miss-rate%
>        0.12 =C2=B1  8%      -0.0        0.07 =C2=B1 10%  perf-stat.overal=
l.dTLB-store-miss-rate%
>       10.81 =C2=B1 14%      +2.3       13.09 =C2=B1 10%  perf-stat.overal=
l.iTLB-load-miss-rate%
>        7119 =C2=B1 14%     +35.9%       9679 =C2=B1 13%  perf-stat.overal=
l.instructions-per-iTLB-miss
>        0.59 =C2=B1  3%     +43.1%       0.84        perf-stat.overall.ipc
>      202912 =C2=B1  2%     +68.8%     342615 =C2=B1  3%  perf-stat.overal=
l.path-length
>   2.195e+09 =C2=B1  3%     +10.5%  2.425e+09        perf-stat.ps.branch-i=
nstructions
>    36847010 =C2=B1  3%     -29.4%   26015686 =C2=B1  5%  perf-stat.ps.bra=
nch-misses
>    28799092 =C2=B1  6%     -31.1%   19837306 =C2=B1  3%  perf-stat.ps.cac=
he-misses
>   2.021e+08 =C2=B1  4%     -24.8%  1.519e+08        perf-stat.ps.cache-re=
ferences
>      642266 =C2=B1  2%     -27.4%     465968        perf-stat.ps.context-=
switches
>   1.974e+10 =C2=B1  3%     -15.1%  1.676e+10        perf-stat.ps.cpu-cycl=
es
>    31729472 =C2=B1  6%     -37.9%   19715594 =C2=B1  9%  perf-stat.ps.dTL=
B-load-misses
>   3.186e+09 =C2=B1  3%     +18.8%  3.785e+09        perf-stat.ps.dTLB-loa=
ds
>     2504443 =C2=B1 10%     -28.2%    1797154 =C2=B1 10%  perf-stat.ps.dTL=
B-store-misses
>   2.133e+09 =C2=B1  3%     +19.8%  2.556e+09 =C2=B1  2%  perf-stat.ps.dTL=
B-stores
>    13717699 =C2=B1  3%     -28.4%    9816979 =C2=B1  3%  perf-stat.ps.iTL=
B-loads
>   1.159e+10 =C2=B1  3%     +21.5%  1.408e+10        perf-stat.ps.instruct=
ions
>    15979371 =C2=B1  9%     -30.7%   11073468 =C2=B1  3%  perf-stat.ps.nod=
e-load-misses
>     8081205 =C2=B1  9%     -31.3%    5554114        perf-stat.ps.node-loa=
ds
>     2580198 =C2=B1 13%     -31.1%    1777169 =C2=B1  6%  perf-stat.ps.nod=
e-store-misses
>     1801590 =C2=B1 12%     -31.3%    1238321 =C2=B1  2%  perf-stat.ps.nod=
e-stores
>   2.579e+12           +20.6%  3.111e+12 =C2=B1  2%  perf-stat.total.instr=
uctions
>       36149 =C2=B1  4%     -26.2%      26686 =C2=B1  5%  softirqs.CPU0.RCU
>       37255 =C2=B1  3%     -26.8%      27256 =C2=B1  2%  softirqs.CPU1.RCU
>       37834 =C2=B1  5%     -26.5%      27801 =C2=B1  9%  softirqs.CPU10.R=
CU
>       39075 =C2=B1  3%     -24.5%      29494 =C2=B1  2%  softirqs.CPU11.R=
CU
>       38137 =C2=B1  6%     -23.1%      29340 =C2=B1  4%  softirqs.CPU12.R=
CU
>       37480 =C2=B1  3%     -20.5%      29797 =C2=B1  2%  softirqs.CPU13.R=
CU
>       37690 =C2=B1  5%     -28.7%      26861 =C2=B1  4%  softirqs.CPU14.R=
CU
>       33863 =C2=B1  9%     -29.5%      23885 =C2=B1  5%  softirqs.CPU15.R=
CU
>       34306 =C2=B1  9%     -31.1%      23641 =C2=B1 12%  softirqs.CPU16.R=
CU
>       34374 =C2=B1  9%     -29.0%      24402 =C2=B1  7%  softirqs.CPU17.R=
CU
>       44013 =C2=B1  9%     -31.7%      30059        softirqs.CPU18.RCU
>       43114 =C2=B1  8%     -29.9%      30219        softirqs.CPU19.RCU
>       36276 =C2=B1  8%     -23.3%      27825 =C2=B1  5%  softirqs.CPU2.RCU
>       67049 =C2=B1  7%     +39.1%      93267 =C2=B1 18%  softirqs.CPU2.TI=
MER
>       39721 =C2=B1 13%     -31.4%      27233 =C2=B1  3%  softirqs.CPU20.R=
CU
>       42340 =C2=B1  5%     -28.6%      30215 =C2=B1  6%  softirqs.CPU21.R=
CU
>       40896 =C2=B1  7%     -30.3%      28506 =C2=B1  2%  softirqs.CPU22.R=
CU
>       42422 =C2=B1  7%     -33.2%      28357 =C2=B1  2%  softirqs.CPU23.R=
CU
>       42330 =C2=B1  9%     -33.5%      28150 =C2=B1  5%  softirqs.CPU24.R=
CU
>       41406 =C2=B1  9%     -31.4%      28398        softirqs.CPU25.RCU
>       39754 =C2=B1  5%     -29.4%      28063        softirqs.CPU26.RCU
>       40207 =C2=B1  6%     -27.9%      28995 =C2=B1 12%  softirqs.CPU27.R=
CU
>       40351 =C2=B1  9%     -29.4%      28487 =C2=B1  3%  softirqs.CPU28.R=
CU
>       41880 =C2=B1  5%     -29.6%      29472        softirqs.CPU29.RCU
>       36293 =C2=B1  4%     -17.7%      29864 =C2=B1  7%  softirqs.CPU3.RCU
>       39341 =C2=B1  9%     -34.3%      25847        softirqs.CPU30.RCU
>       39687 =C2=B1  9%     -33.5%      26400 =C2=B1  2%  softirqs.CPU31.R=
CU
>       38062 =C2=B1 14%     -39.9%      22878 =C2=B1 10%  softirqs.CPU32.R=
CU
>       39769 =C2=B1 13%     -33.8%      26314 =C2=B1  5%  softirqs.CPU33.R=
CU
>       39504 =C2=B1 10%     -37.2%      24824 =C2=B1  6%  softirqs.CPU34.R=
CU
>       39591 =C2=B1 11%     -38.6%      24300 =C2=B1  5%  softirqs.CPU35.R=
CU
>       40398 =C2=B1  8%     -27.0%      29488 =C2=B1 12%  softirqs.CPU36.R=
CU
>       39464 =C2=B1 12%     -25.3%      29478 =C2=B1 10%  softirqs.CPU37.R=
CU
>       41177 =C2=B1  9%     -34.0%      27190 =C2=B1 19%  softirqs.CPU38.R=
CU
>       38734 =C2=B1 13%     -24.8%      29145 =C2=B1  5%  softirqs.CPU39.R=
CU
>       36804 =C2=B1  5%     -23.0%      28354        softirqs.CPU4.RCU
>       40421 =C2=B1 12%     -28.8%      28776 =C2=B1  6%  softirqs.CPU40.R=
CU
>       40371 =C2=B1 11%     -31.1%      27834 =C2=B1  8%  softirqs.CPU41.R=
CU
>       40633 =C2=B1 10%     -29.9%      28469 =C2=B1 10%  softirqs.CPU42.R=
CU
>       41018 =C2=B1  9%     -33.6%      27252 =C2=B1  6%  softirqs.CPU43.R=
CU
>       38181 =C2=B1 12%     -27.0%      27856 =C2=B1 10%  softirqs.CPU44.R=
CU
>       39605 =C2=B1 12%     -32.3%      26803 =C2=B1 12%  softirqs.CPU45.R=
CU
>       42686 =C2=B1 11%     -29.7%      30016 =C2=B1  9%  softirqs.CPU47.R=
CU
>       40433 =C2=B1  9%     -31.8%      27586 =C2=B1 11%  softirqs.CPU48.R=
CU
>       38371 =C2=B1 12%     -23.0%      29528 =C2=B1  7%  softirqs.CPU49.R=
CU
>       37172 =C2=B1  2%     -25.9%      27562 =C2=B1  3%  softirqs.CPU5.RCU
>       39660 =C2=B1 12%     -27.5%      28752 =C2=B1 11%  softirqs.CPU50.R=
CU
>       40375 =C2=B1 10%     -26.7%      29582 =C2=B1  3%  softirqs.CPU51.R=
CU
>       40568 =C2=B1  9%     -28.8%      28886 =C2=B1  6%  softirqs.CPU52.R=
CU
>       39967 =C2=B1 10%     -27.3%      29073 =C2=B1 11%  softirqs.CPU53.R=
CU
>       40874 =C2=B1 11%     -37.1%      25725 =C2=B1  6%  softirqs.CPU54.R=
CU
>       41227 =C2=B1 14%     -37.9%      25606 =C2=B1  6%  softirqs.CPU55.R=
CU
>       38856 =C2=B1 13%     -34.7%      25380 =C2=B1  8%  softirqs.CPU56.R=
CU
>       39618 =C2=B1 13%     -39.1%      24119 =C2=B1  4%  softirqs.CPU57.R=
CU
>       39412 =C2=B1 12%     -36.6%      24970 =C2=B1  3%  softirqs.CPU58.R=
CU
>       41572 =C2=B1 14%     -41.3%      24399 =C2=B1 10%  softirqs.CPU59.R=
CU
>       36927 =C2=B1  3%     -24.4%      27923 =C2=B1 22%  softirqs.CPU6.RCU
>       37057 =C2=B1 10%     -31.8%      25261 =C2=B1  2%  softirqs.CPU60.R=
CU
>       36584 =C2=B1  8%     -27.8%      26419 =C2=B1  2%  softirqs.CPU61.R=
CU
>       35859 =C2=B1  4%     -28.2%      25729 =C2=B1  5%  softirqs.CPU62.R=
CU
>       35849 =C2=B1  7%     -33.2%      23933 =C2=B1  5%  softirqs.CPU63.R=
CU
>       35379 =C2=B1  6%     -26.4%      26041 =C2=B1  4%  softirqs.CPU64.R=
CU
>       36908 =C2=B1  6%     -26.5%      27110 =C2=B1  2%  softirqs.CPU65.R=
CU
>       37595 =C2=B1  3%     -26.1%      27783 =C2=B1  4%  softirqs.CPU66.R=
CU
>       36327 =C2=B1  2%     -27.0%      26533 =C2=B1  2%  softirqs.CPU67.R=
CU
>       35136 =C2=B1  7%     -31.7%      23998 =C2=B1  9%  softirqs.CPU68.R=
CU
>       35638 =C2=B1  4%     -28.6%      25435 =C2=B1  4%  softirqs.CPU69.R=
CU
>       37268 =C2=B1  6%     -25.4%      27786 =C2=B1  4%  softirqs.CPU7.RCU
>       36693 =C2=B1  4%     -29.2%      25986 =C2=B1  5%  softirqs.CPU70.R=
CU
>       36859 =C2=B1  3%     -28.8%      26260 =C2=B1  4%  softirqs.CPU71.R=
CU
>       37539 =C2=B1  7%     -27.7%      27144 =C2=B1  4%  softirqs.CPU8.RCU
>       37584 =C2=B1  4%     -26.0%      27802 =C2=B1 15%  softirqs.CPU9.RCU
>     2795313 =C2=B1  7%     -29.7%    1964363 =C2=B1  4%  softirqs.RCU
>      249.50 =C2=B1 76%     -50.4%     123.67 =C2=B1  2%  interrupts.41:PC=
I-MSI.1572870-edge.eth0-TxRx-6
>      154.50 =C2=B1 13%     -10.9%     137.67 =C2=B1 10%  interrupts.42:PC=
I-MSI.1572871-edge.eth0-TxRx-7
>      150.50 =C2=B1 43%     -28.0%     108.33        interrupts.84:PCI-MSI=
.1572913-edge.eth0-TxRx-49
>       10393 =C2=B1 10%     -26.4%       7653 =C2=B1 10%  interrupts.CPU1.=
RES:Rescheduling_interrupts
>       12518 =C2=B1 15%     -31.0%       8642 =C2=B1 21%  interrupts.CPU10=
.RES:Rescheduling_interrupts
>      945.25 =C2=B1 79%     -75.4%     232.67 =C2=B1141%  interrupts.CPU11=
.NMI:Non-maskable_interrupts
>      945.25 =C2=B1 79%     -75.4%     232.67 =C2=B1141%  interrupts.CPU11=
.PMI:Performance_monitoring_interrupts
>       13068 =C2=B1 18%     -30.6%       9075 =C2=B1 23%  interrupts.CPU11=
.RES:Rescheduling_interrupts
>       11949 =C2=B1 11%     -49.8%       6001 =C2=B1 29%  interrupts.CPU12=
.RES:Rescheduling_interrupts
>       13711 =C2=B1  8%     -19.4%      11052 =C2=B1 24%  interrupts.CPU13=
.RES:Rescheduling_interrupts
>       13361 =C2=B1  6%     -38.8%       8170 =C2=B1 25%  interrupts.CPU14=
.RES:Rescheduling_interrupts
>        7628 =C2=B1 12%     -29.2%       5401 =C2=B1  7%  interrupts.CPU18=
.RES:Rescheduling_interrupts
>        7909 =C2=B1 25%     -30.4%       5501 =C2=B1 37%  interrupts.CPU19=
.RES:Rescheduling_interrupts
>        1482 =C2=B1 39%    -100.0%       0.00        interrupts.CPU2.NMI:N=
on-maskable_interrupts
>        1482 =C2=B1 39%    -100.0%       0.00        interrupts.CPU2.PMI:P=
erformance_monitoring_interrupts
>        2116           +23.2%       2606 =C2=B1 10%  interrupts.CPU20.CAL:=
Function_call_interrupts
>      194.75 =C2=B1173%    +380.1%     935.00 =C2=B1 30%  interrupts.CPU20=
.NMI:Non-maskable_interrupts
>      194.75 =C2=B1173%    +380.1%     935.00 =C2=B1 30%  interrupts.CPU20=
.PMI:Performance_monitoring_interrupts
>        2096 =C2=B1  4%     +18.0%       2474 =C2=B1  9%  interrupts.CPU21=
.CAL:Function_call_interrupts
>       11313 =C2=B1 20%     -56.4%       4935 =C2=B1 23%  interrupts.CPU21=
.RES:Rescheduling_interrupts
>        2111 =C2=B1  3%     +20.1%       2534 =C2=B1 11%  interrupts.CPU22=
.CAL:Function_call_interrupts
>        2109 =C2=B1  4%     +22.6%       2585 =C2=B1 10%  interrupts.CPU23=
.CAL:Function_call_interrupts
>       10305 =C2=B1 16%     -40.7%       6115 =C2=B1 17%  interrupts.CPU23=
.RES:Rescheduling_interrupts
>        2128 =C2=B1  2%     +17.8%       2507 =C2=B1 10%  interrupts.CPU24=
.CAL:Function_call_interrupts
>       12271 =C2=B1 20%     -39.0%       7488 =C2=B1 29%  interrupts.CPU24=
.RES:Rescheduling_interrupts
>        2123           +19.7%       2541 =C2=B1  7%  interrupts.CPU25.CAL:=
Function_call_interrupts
>        9780 =C2=B1 21%     -32.9%       6563 =C2=B1 25%  interrupts.CPU25=
.RES:Rescheduling_interrupts
>      980.75 =C2=B1 89%     -88.9%     109.00 =C2=B1141%  interrupts.CPU26=
.NMI:Non-maskable_interrupts
>      980.75 =C2=B1 89%     -88.9%     109.00 =C2=B1141%  interrupts.CPU26=
.PMI:Performance_monitoring_interrupts
>       11163 =C2=B1 28%     -49.8%       5605 =C2=B1 13%  interrupts.CPU27=
.RES:Rescheduling_interrupts
>       11071 =C2=B1 12%     -56.3%       4835 =C2=B1 26%  interrupts.CPU29=
.RES:Rescheduling_interrupts
>      728.50 =C2=B1 66%    -100.0%       0.00        interrupts.CPU3.NMI:N=
on-maskable_interrupts
>      728.50 =C2=B1 66%    -100.0%       0.00        interrupts.CPU3.PMI:P=
erformance_monitoring_interrupts
>       10599 =C2=B1 10%     -38.7%       6501 =C2=B1 16%  interrupts.CPU31=
.RES:Rescheduling_interrupts
>        2213 =C2=B1  4%     +14.2%       2527 =C2=B1  7%  interrupts.CPU32=
.CAL:Function_call_interrupts
>        8862 =C2=B1 16%     -39.6%       5354 =C2=B1 28%  interrupts.CPU32=
.RES:Rescheduling_interrupts
>        2156 =C2=B1  6%     +20.5%       2599 =C2=B1  9%  interrupts.CPU33=
.CAL:Function_call_interrupts
>        2169 =C2=B1  5%     +19.9%       2601 =C2=B1  9%  interrupts.CPU34=
.CAL:Function_call_interrupts
>       10483 =C2=B1 18%     -48.8%       5371 =C2=B1 33%  interrupts.CPU34=
.RES:Rescheduling_interrupts
>        2049           +24.4%       2549 =C2=B1  8%  interrupts.CPU35.CAL:=
Function_call_interrupts
>       10929 =C2=B1 15%     -49.0%       5578 =C2=B1 14%  interrupts.CPU35=
.RES:Rescheduling_interrupts
>        1993 =C2=B1  4%     +28.5%       2561 =C2=B1 12%  interrupts.CPU36=
.CAL:Function_call_interrupts
>      161.75 =C2=B1161%    +717.9%       1323 =C2=B1 43%  interrupts.CPU36=
.NMI:Non-maskable_interrupts
>      161.75 =C2=B1161%    +717.9%       1323 =C2=B1 43%  interrupts.CPU36=
.PMI:Performance_monitoring_interrupts
>        1987 =C2=B1  4%     +30.5%       2594 =C2=B1 13%  interrupts.CPU37=
.CAL:Function_call_interrupts
>        1863 =C2=B1 10%     +35.7%       2529 =C2=B1 14%  interrupts.CPU38=
.CAL:Function_call_interrupts
>        1984 =C2=B1  6%     +26.5%       2509 =C2=B1 12%  interrupts.CPU41=
.CAL:Function_call_interrupts
>       12830 =C2=B1 30%     -26.4%       9445 =C2=B1  9%  interrupts.CPU43=
.RES:Rescheduling_interrupts
>        2067 =C2=B1  2%     +27.4%       2632 =C2=B1  9%  interrupts.CPU44=
.CAL:Function_call_interrupts
>        2066 =C2=B1  3%     +27.2%       2629 =C2=B1  9%  interrupts.CPU45=
.CAL:Function_call_interrupts
>        2158 =C2=B1  3%     +19.6%       2582 =C2=B1  9%  interrupts.CPU46=
.CAL:Function_call_interrupts
>        2036 =C2=B1  6%     +30.3%       2652 =C2=B1 10%  interrupts.CPU47=
.CAL:Function_call_interrupts
>      150.50 =C2=B1 43%     -28.0%     108.33        interrupts.CPU49.84:P=
CI-MSI.1572913-edge.eth0-TxRx-49
>       11823 =C2=B1 12%     -36.9%       7460 =C2=B1 18%  interrupts.CPU49=
.RES:Rescheduling_interrupts
>        1139 =C2=B1 58%     -75.5%     278.67 =C2=B1141%  interrupts.CPU5.=
NMI:Non-maskable_interrupts
>        1139 =C2=B1 58%     -75.5%     278.67 =C2=B1141%  interrupts.CPU5.=
PMI:Performance_monitoring_interrupts
>       11748 =C2=B1 22%     -40.0%       7048 =C2=B1 27%  interrupts.CPU5.=
RES:Rescheduling_interrupts
>        2102 =C2=B1  5%     +19.6%       2515 =C2=B1  7%  interrupts.CPU52=
.CAL:Function_call_interrupts
>        2115 =C2=B1  6%     +19.5%       2527 =C2=B1  7%  interrupts.CPU53=
.CAL:Function_call_interrupts
>       11318 =C2=B1 17%     -20.4%       9004 =C2=B1 26%  interrupts.CPU53=
.RES:Rescheduling_interrupts
>        2177 =C2=B1  5%     +17.4%       2556 =C2=B1  9%  interrupts.CPU54=
.CAL:Function_call_interrupts
>       10968 =C2=B1 23%     -62.3%       4134 =C2=B1 21%  interrupts.CPU54=
.RES:Rescheduling_interrupts
>        2161 =C2=B1  5%     +20.2%       2598 =C2=B1  9%  interrupts.CPU55=
.CAL:Function_call_interrupts
>        9334 =C2=B1 19%     -55.4%       4158 =C2=B1 34%  interrupts.CPU55=
.RES:Rescheduling_interrupts
>        1443 =C2=B1 22%    -100.0%       0.00        interrupts.CPU56.NMI:=
Non-maskable_interrupts
>        1443 =C2=B1 22%    -100.0%       0.00        interrupts.CPU56.PMI:=
Performance_monitoring_interrupts
>       11377 =C2=B1 31%     -56.9%       4907 =C2=B1 43%  interrupts.CPU56=
.RES:Rescheduling_interrupts
>      601.00 =C2=B1 99%     -79.6%     122.67 =C2=B1141%  interrupts.CPU57=
.NMI:Non-maskable_interrupts
>      601.00 =C2=B1 99%     -79.6%     122.67 =C2=B1141%  interrupts.CPU57=
.PMI:Performance_monitoring_interrupts
>        8295 =C2=B1 31%     -47.7%       4340 =C2=B1 24%  interrupts.CPU57=
.RES:Rescheduling_interrupts
>        9182 =C2=B1 37%     -59.7%       3701 =C2=B1 46%  interrupts.CPU58=
.RES:Rescheduling_interrupts
>      249.50 =C2=B1 76%     -50.4%     123.67 =C2=B1  2%  interrupts.CPU6.=
41:PCI-MSI.1572870-edge.eth0-TxRx-6
>       12473 =C2=B1 27%     -44.4%       6940 =C2=B1 13%  interrupts.CPU6.=
RES:Rescheduling_interrupts
>        7886 =C2=B1 12%     -42.2%       4555 =C2=B1 31%  interrupts.CPU60=
.RES:Rescheduling_interrupts
>      971.50 =C2=B1 47%     -86.8%     128.33 =C2=B1141%  interrupts.CPU61=
.NMI:Non-maskable_interrupts
>      971.50 =C2=B1 47%     -86.8%     128.33 =C2=B1141%  interrupts.CPU61=
.PMI:Performance_monitoring_interrupts
>        9253 =C2=B1 26%     -56.4%       4033 =C2=B1 16%  interrupts.CPU61=
.RES:Rescheduling_interrupts
>        2103 =C2=B1  5%     +19.1%       2505 =C2=B1 11%  interrupts.CPU63=
.CAL:Function_call_interrupts
>        2059 =C2=B1  2%     +20.6%       2483 =C2=B1 10%  interrupts.CPU64=
.CAL:Function_call_interrupts
>        8545 =C2=B1 17%     -41.2%       5025 =C2=B1  8%  interrupts.CPU65=
.RES:Rescheduling_interrupts
>        7378 =C2=B1 23%     -51.0%       3614 =C2=B1 30%  interrupts.CPU68=
.RES:Rescheduling_interrupts
>        8573 =C2=B1 28%     -50.1%       4277 =C2=B1  6%  interrupts.CPU69=
.RES:Rescheduling_interrupts
>      154.50 =C2=B1 13%     -10.9%     137.67 =C2=B1 10%  interrupts.CPU7.=
42:PCI-MSI.1572871-edge.eth0-TxRx-7
>        9910 =C2=B1 28%     -51.2%       4839 =C2=B1 40%  interrupts.CPU70=
.RES:Rescheduling_interrupts
>        8836 =C2=B1 26%     -52.7%       4180 =C2=B1  6%  interrupts.CPU71=
.RES:Rescheduling_interrupts
>      911.50 =C2=B1 37%     -93.2%      61.67 =C2=B1141%  interrupts.CPU8.=
NMI:Non-maskable_interrupts
>      911.50 =C2=B1 37%     -93.2%      61.67 =C2=B1141%  interrupts.CPU8.=
PMI:Performance_monitoring_interrupts
>       12326 =C2=B1 15%     -32.3%       8350 =C2=B1 10%  interrupts.CPU8.=
RES:Rescheduling_interrupts
>        1392 =C2=B1 58%    -100.0%       0.00        interrupts.CPU9.NMI:N=
on-maskable_interrupts
>        1392 =C2=B1 58%    -100.0%       0.00        interrupts.CPU9.PMI:P=
erformance_monitoring_interrupts
>       60185 =C2=B1 19%     -30.5%      41822 =C2=B1 11%  interrupts.NMI:N=
on-maskable_interrupts
>       60185 =C2=B1 19%     -30.5%      41822 =C2=B1 11%  interrupts.PMI:P=
erformance_monitoring_interrupts
>      749419           -31.9%     510225 =C2=B1  3%  interrupts.RES:Resche=
duling_interrupts
>       15.05 =C2=B1  6%      -4.1       10.97 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.normal_work_helper.process_one_work.worker_thread.kthread.=
ret_from_fork
>       12.66 =C2=B1  5%      -4.0        8.68 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.btrfs_finish_ordered_io.normal_work_helper.process_one_wor=
k.worker_thread.kthread
>        5.99 =C2=B1  8%      -1.6        4.37 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.io_submit
>        5.83 =C2=B1  8%      -1.6        4.25 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.io_submit
>        5.82 =C2=B1  8%      -1.6        4.24 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.io_submit
>        5.81 =C2=B1  8%      -1.6        4.23 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.__x64_sys_io_submit.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.io_submit
>        5.76 =C2=B1  8%      -1.6        4.19 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.io_submit_one.__x64_sys_io_submit.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe.io_submit
>        5.65 =C2=B1  6%      -1.6        4.08 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.btrfs_mark_extent_written.btrfs_finish_ordered_io.normal_w=
ork_helper.process_one_work.worker_thread
>        4.52 =C2=B1  3%      -1.5        2.99 =C2=B1 19%  perf-profile.cal=
ltrace.cycles-pp.add_pending_csums.btrfs_finish_ordered_io.normal_work_help=
er.process_one_work.worker_thread
>        6.90 =C2=B1  8%      -1.5        5.38 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.extent_writepages.do_writepages.__writeback_single_inode.w=
riteback_sb_inodes.wb_writeback
>        6.90 =C2=B1  8%      -1.5        5.38 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.extent_write_cache_pages.extent_writepages.do_writepages._=
_writeback_single_inode.writeback_sb_inodes
>        5.58 =C2=B1  8%      -1.5        4.07 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.aio_write.io_submit_one.__x64_sys_io_submit.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>        4.50 =C2=B1  3%      -1.5        2.99 =C2=B1 19%  perf-profile.cal=
ltrace.cycles-pp.btrfs_csum_file_blocks.add_pending_csums.btrfs_finish_orde=
red_io.normal_work_helper.process_one_work
>        5.44 =C2=B1  8%      -1.5        3.96 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.btrfs_file_write_iter.aio_write.io_submit_one.__x64_sys_io=
_submit.do_syscall_64
>        6.63 =C2=B1  8%      -1.5        5.17 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.__extent_writepage.extent_write_cache_pages.extent_writepa=
ges.do_writepages.__writeback_single_inode
>        5.34 =C2=B1  9%      -1.4        3.90 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.btrfs_buffered_write.btrfs_file_write_iter.aio_write.io_su=
bmit_one.__x64_sys_io_submit
>        5.55 =C2=B1  8%      -1.2        4.32 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.writepage_delalloc.__extent_writepage.extent_write_cache_p=
ages.extent_writepages.do_writepages
>        4.98 =C2=B1  8%      -1.1        3.86 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.run_delalloc_nocow.btrfs_run_delalloc_range.writepage_dela=
lloc.__extent_writepage.extent_write_cache_pages
>        5.00 =C2=B1  8%      -1.1        3.88 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.btrfs_run_delalloc_range.writepage_delalloc.__extent_write=
page.extent_write_cache_pages.extent_writepages
>        2.80 =C2=B1  4%      -1.0        1.78 =C2=B1 22%  perf-profile.cal=
ltrace.cycles-pp.btrfs_search_slot.btrfs_mark_extent_written.btrfs_finish_o=
rdered_io.normal_work_helper.process_one_work
>        1.45 =C2=B1  3%      -0.7        0.79 =C2=B1 18%  perf-profile.cal=
ltrace.cycles-pp.__btrfs_cow_block.btrfs_cow_block.btrfs_search_slot.btrfs_=
mark_extent_written.btrfs_finish_ordered_io
>        1.45 =C2=B1  3%      -0.7        0.79 =C2=B1 18%  perf-profile.cal=
ltrace.cycles-pp.btrfs_cow_block.btrfs_search_slot.btrfs_mark_extent_writte=
n.btrfs_finish_ordered_io.normal_work_helper
>        2.32 =C2=B1  3%      -0.6        1.72 =C2=B1 18%  perf-profile.cal=
ltrace.cycles-pp.btrfs_insert_empty_items.btrfs_csum_file_blocks.add_pendin=
g_csums.btrfs_finish_ordered_io.normal_work_helper
>        0.91 =C2=B1  8%      -0.5        0.42 =C2=B1 73%  perf-profile.cal=
ltrace.cycles-pp.btrfs_lookup_csum.btrfs_csum_file_blocks.add_pending_csums=
.btrfs_finish_ordered_io.normal_work_helper
>        0.88 =C2=B1  8%      -0.5        0.41 =C2=B1 74%  perf-profile.cal=
ltrace.cycles-pp.btrfs_search_slot.btrfs_lookup_csum.btrfs_csum_file_blocks=
.add_pending_csums.btrfs_finish_ordered_io
>        0.83 =C2=B1  5%      -0.4        0.41 =C2=B1 71%  perf-profile.cal=
ltrace.cycles-pp.split_leaf.btrfs_search_slot.btrfs_insert_empty_items.btrf=
s_csum_file_blocks.add_pending_csums
>        1.90 =C2=B1 20%      -0.4        1.48 =C2=B1 29%  perf-profile.cal=
ltrace.cycles-pp.btrfs_run_delayed_refs.flush_space.btrfs_async_reclaim_met=
adata_space.process_one_work.worker_thread
>        1.89 =C2=B1 20%      -0.4        1.48 =C2=B1 29%  perf-profile.cal=
ltrace.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.flush_spac=
e.btrfs_async_reclaim_metadata_space.process_one_work
>        0.82 =C2=B1  4%      -0.4        0.42 =C2=B1 71%  perf-profile.cal=
ltrace.cycles-pp.run_one_async_done.normal_work_helper.process_one_work.wor=
ker_thread.kthread
>        0.81 =C2=B1  4%      -0.4        0.41 =C2=B1 71%  perf-profile.cal=
ltrace.cycles-pp.btrfs_map_bio.run_one_async_done.normal_work_helper.proces=
s_one_work.worker_thread
>        0.74 =C2=B1  6%      -0.4        0.36 =C2=B1 70%  perf-profile.cal=
ltrace.cycles-pp.push_leaf_right.split_leaf.btrfs_search_slot.btrfs_insert_=
empty_items.btrfs_csum_file_blocks
>        1.19 =C2=B1  3%      -0.4        0.83 =C2=B1 16%  perf-profile.cal=
ltrace.cycles-pp.btrfs_search_slot.btrfs_insert_empty_items.btrfs_csum_file=
_blocks.add_pending_csums.btrfs_finish_ordered_io
>        1.00 =C2=B1  6%      -0.4        0.65 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.lock_and_cleanup_extent_if_need.btrfs_buffered_write.btrfs=
_file_write_iter.aio_write.io_submit_one
>        1.27 =C2=B1  5%      -0.4        0.92 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.btrfs_dirty_pages.btrfs_buffered_write.btrfs_file_write_it=
er.aio_write.io_submit_one
>        1.25 =C2=B1  6%      -0.3        0.90 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.create_io_em.run_delalloc_nocow.btrfs_run_delalloc_range.w=
ritepage_delalloc.__extent_writepage
>        0.93 =C2=B1  8%      -0.3        0.59 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.__set_extent_bit.lock_extent_bits.lock_and_cleanup_extent_=
if_need.btrfs_buffered_write.btrfs_file_write_iter
>        0.94 =C2=B1  7%      -0.3        0.60 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.lock_extent_bits.lock_and_cleanup_extent_if_need.btrfs_buf=
fered_write.btrfs_file_write_iter.aio_write
>        0.70 =C2=B1  8%      -0.3        0.37 =C2=B1 70%  perf-profile.cal=
ltrace.cycles-pp.__lookup_extent_mapping.btrfs_get_extent.btrfs_dirty_pages=
.btrfs_buffered_write.btrfs_file_write_iter
>        0.79 =C2=B1  6%      -0.3        0.47 =C2=B1 71%  perf-profile.cal=
ltrace.cycles-pp.setup_items_for_insert.btrfs_duplicate_item.btrfs_mark_ext=
ent_written.btrfs_finish_ordered_io.normal_work_helper
>        0.71 =C2=B1 21%      -0.3        0.43 =C2=B1 74%  perf-profile.cal=
ltrace.cycles-pp.__btrfs_free_extent.__btrfs_run_delayed_refs.btrfs_run_del=
ayed_refs.flush_space.btrfs_async_reclaim_metadata_space
>        1.15 =C2=B1 11%      -0.3        0.88 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.btrfs_lookup_csums_range.csum_exist_in_range.run_delalloc_=
nocow.btrfs_run_delalloc_range.writepage_delalloc
>        1.15 =C2=B1 11%      -0.3        0.88 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.csum_exist_in_range.run_delalloc_nocow.btrfs_run_delalloc_=
range.writepage_delalloc.__extent_writepage
>        1.43 =C2=B1 13%      -0.3        1.17 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.btrfs_delalloc_reserve_metadata.btrfs_buffered_write.btrfs=
_file_write_iter.aio_write.io_submit_one
>        1.06 =C2=B1  5%      -0.3        0.81 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.btrfs_drop_extent_cache.create_io_em.run_delalloc_nocow.bt=
rfs_run_delalloc_range.writepage_delalloc
>        1.30 =C2=B1 15%      -0.2        1.06 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.reserve_metadata_bytes.btrfs_delalloc_reserve_metadata.btr=
fs_buffered_write.btrfs_file_write_iter.aio_write
>        1.03 =C2=B1 13%      -0.2        0.79 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.btrfs_search_slot.btrfs_lookup_csums_range.csum_exist_in_r=
ange.run_delalloc_nocow.btrfs_run_delalloc_range
>        1.20 =C2=B1  4%      -0.2        0.96 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_s=
econdary
>        1.24 =C2=B1  3%      -0.2        1.01 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.se=
condary_startup_64
>        1.05 =C2=B1  8%      -0.2        0.82 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.__extent_writepage_io.__extent_writepage.extent_write_cach=
e_pages.extent_writepages.do_writepages
>        0.88 =C2=B1 13%      -0.2        0.71 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.wait_reserve_ticket.reserve_metadata_bytes.btrfs_delalloc_=
reserve_metadata.btrfs_buffered_write.btrfs_file_write_iter
>        1.01 =C2=B1  9%      -0.2        0.84 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.btrfs_search_slot.btrfs_lookup_file_extent.run_delalloc_no=
cow.btrfs_run_delalloc_range.writepage_delalloc
>        1.01 =C2=B1 10%      -0.2        0.85 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.btrfs_lookup_file_extent.run_delalloc_nocow.btrfs_run_dela=
lloc_range.writepage_delalloc.__extent_writepage
>        0.72 =C2=B1  7%      -0.2        0.56 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.btrfs_get_extent.btrfs_dirty_pages.btrfs_buffered_write.bt=
rfs_file_write_iter.aio_write
>        0.75 =C2=B1  8%      -0.1        0.60 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.submit_extent_page.__extent_writepage_io.__extent_writepag=
e.extent_write_cache_pages.extent_writepages
>        0.92 =C2=B1 15%      +0.2        1.14 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__=
hrtimer_run_queues.hrtimer_interrupt
>        1.01 =C2=B1 15%      +0.2        1.25 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hr=
timer_interrupt.smp_apic_timer_interrupt
>        1.15 =C2=B1 15%      +0.3        1.44 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.sm=
p_apic_timer_interrupt.apic_timer_interrupt
>        0.27 =C2=B1100%      +0.4        0.63 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.rebalance_domains.__softirqentry_text_start.irq_exit.smp_a=
pic_timer_interrupt.apic_timer_interrupt
>        1.74 =C2=B1  9%      +0.4        2.11 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_inte=
rrupt.apic_timer_interrupt.cpuidle_enter_state
>        2.63 =C2=B1 10%      +0.6        3.26        perf-profile.calltrac=
e.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt=
.cpuidle_enter_state.do_idle
>        0.00            +0.8        0.75 =C2=B1 18%  perf-profile.calltrac=
e.cycles-pp.map_private_extent_buffer.btrfs_get_token_64.check_leaf.btree_c=
sum_one_bio.btree_submit_bio_hook
>        2.37 =C2=B1 19%      +0.8        3.19 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.btrfs_async_reclaim_metadata_space.process_one_work.worker=
_thread.kthread.ret_from_fork
>        2.33 =C2=B1 19%      +0.8        3.17 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.flush_space.btrfs_async_reclaim_metadata_space.process_one=
_work.worker_thread.kthread
>        0.00            +0.9        0.90 =C2=B1 18%  perf-profile.calltrac=
e.cycles-pp.map_private_extent_buffer.btrfs_get_token_32.check_leaf.btree_c=
sum_one_bio.btree_submit_bio_hook
>        4.71 =C2=B1 11%      +1.0        5.74        perf-profile.calltrac=
e.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_sta=
te.do_idle.cpu_startup_entry
>        5.04 =C2=B1 10%      +1.2        6.19        perf-profile.calltrac=
e.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.do_idle.cpu_startup_en=
try.start_secondary
>        0.00            +1.3        1.30 =C2=B1 19%  perf-profile.calltrac=
e.cycles-pp.submit_extent_page.write_one_eb.btree_write_cache_pages.do_writ=
epages.__filemap_fdatawrite_range
>        0.00            +1.4        1.36 =C2=B1 19%  perf-profile.calltrac=
e.cycles-pp.write_one_eb.btree_write_cache_pages.do_writepages.__filemap_fd=
atawrite_range.btrfs_write_marked_extents
>        0.29 =C2=B1101%      +1.4        1.67 =C2=B1 18%  perf-profile.cal=
ltrace.cycles-pp.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_m=
etadata_space.process_one_work.worker_thread
>        0.00            +1.4        1.39 =C2=B1 19%  perf-profile.calltrac=
e.cycles-pp.do_writepages.__filemap_fdatawrite_range.btrfs_write_marked_ext=
ents.btrfs_write_and_wait_transaction.btrfs_commit_transaction
>        0.00            +1.4        1.39 =C2=B1 19%  perf-profile.calltrac=
e.cycles-pp.btree_write_cache_pages.do_writepages.__filemap_fdatawrite_rang=
e.btrfs_write_marked_extents.btrfs_write_and_wait_transaction
>        0.00            +1.4        1.39 =C2=B1 19%  perf-profile.calltrac=
e.cycles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_wri=
te_and_wait_transaction.btrfs_commit_transaction.flush_space
>        0.00            +1.4        1.39 =C2=B1 19%  perf-profile.calltrac=
e.cycles-pp.btrfs_write_and_wait_transaction.btrfs_commit_transaction.flush=
_space.btrfs_async_reclaim_metadata_space.process_one_work
>        0.00            +1.4        1.39 =C2=B1 19%  perf-profile.calltrac=
e.cycles-pp.btrfs_write_marked_extents.btrfs_write_and_wait_transaction.btr=
fs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
>        0.00            +1.5        1.52 =C2=B1 18%  perf-profile.calltrac=
e.cycles-pp.btrfs_get_token_64.check_leaf.btree_csum_one_bio.btree_submit_b=
io_hook.submit_one_bio
>        0.00            +2.2        2.20 =C2=B1 14%  perf-profile.calltrac=
e.cycles-pp.btrfs_get_token_32.check_leaf.btree_csum_one_bio.btree_submit_b=
io_hook.submit_one_bio
>        8.37 =C2=B1  7%      +3.3       11.65 =C2=B1 16%  perf-profile.cal=
ltrace.cycles-pp.wb_writeback.wb_workfn.process_one_work.worker_thread.kthr=
ead
>        8.37 =C2=B1  7%      +3.3       11.65 =C2=B1 16%  perf-profile.cal=
ltrace.cycles-pp.wb_workfn.process_one_work.worker_thread.kthread.ret_from_=
fork
>        7.97 =C2=B1  7%      +3.5       11.44 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.do_writepages.__writeback_single_inode.writeback_sb_inodes=
.wb_writeback.wb_workfn
>        7.97 =C2=B1  7%      +3.5       11.44 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.writeback_sb_inodes.wb_writeback.wb_workfn.process_one_wor=
k.worker_thread
>        7.97 =C2=B1  7%      +3.5       11.44 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.__writeback_single_inode.writeback_sb_inodes.wb_writeback.=
wb_workfn.process_one_work
>       49.45 =C2=B1  2%      +4.3       53.79 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.s=
tart_secondary
>       61.98 =C2=B1  2%      +4.4       66.38 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.secondary_startup_64
>        1.07 =C2=B1 18%      +5.0        6.06 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.btree_write_cache_pages.do_writepages.__writeback_single_i=
node.writeback_sb_inodes.wb_writeback
>        0.93 =C2=B1 18%      +5.0        5.95 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.write_one_eb.btree_write_cache_pages.do_writepages.__write=
back_single_inode.writeback_sb_inodes
>       61.26 =C2=B1  2%      +5.1       66.36 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>       61.27 =C2=B1  2%      +5.1       66.37 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.start_secondary.secondary_startup_64
>       61.21 =C2=B1  2%      +5.1       66.32 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startu=
p_64
>        0.33 =C2=B1100%      +5.3        5.68 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.submit_extent_page.write_one_eb.btree_write_cache_pages.do=
_writepages.__writeback_single_inode
>       55.45 =C2=B1  2%      +5.4       60.88 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_second=
ary.secondary_startup_64
>        0.00            +6.4        6.39 =C2=B1 13%  perf-profile.calltrac=
e.cycles-pp.check_leaf.btree_csum_one_bio.btree_submit_bio_hook.submit_one_=
bio.submit_extent_page
>        0.00            +6.5        6.50 =C2=B1 13%  perf-profile.calltrac=
e.cycles-pp.btree_csum_one_bio.btree_submit_bio_hook.submit_one_bio.submit_=
extent_page.write_one_eb
>        0.29 =C2=B1100%      +6.6        6.92 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp.submit_one_bio.submit_extent_page.write_one_eb.btree_write=
_cache_pages.do_writepages
>        0.29 =C2=B1100%      +6.6        6.92 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp.btree_submit_bio_hook.submit_one_bio.submit_extent_page.wr=
ite_one_eb.btree_write_cache_pages
>       15.05 =C2=B1  6%      -4.1       10.97 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.normal_work_helper
>       12.66 =C2=B1  5%      -4.0        8.68 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.btrfs_finish_ordered_io
>        7.84 =C2=B1  5%      -2.4        5.39 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.btrfs_search_slot
>        7.30 =C2=B1  7%      -1.7        5.59 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.extent_writepages
>        7.30 =C2=B1  7%      -1.7        5.59 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.extent_write_cache_pages
>        7.03 =C2=B1  7%      -1.6        5.38 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.__extent_writepage
>        6.19 =C2=B1  8%      -1.6        4.56 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.entry_SYSCALL_64_after_hwframe
>        6.17 =C2=B1  8%      -1.6        4.55 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.do_syscall_64
>        6.01 =C2=B1  8%      -1.6        4.39 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.io_submit
>        5.81 =C2=B1  8%      -1.6        4.23 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_io_submit
>        5.76 =C2=B1  8%      -1.6        4.19 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.io_submit_one
>        5.66 =C2=B1  5%      -1.6        4.09 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.btrfs_mark_extent_written
>        4.52 =C2=B1  3%      -1.5        2.99 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.add_pending_csums
>        5.59 =C2=B1  8%      -1.5        4.07 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.aio_write
>        4.51 =C2=B1  3%      -1.5        2.99 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.btrfs_csum_file_blocks
>        5.44 =C2=B1  8%      -1.5        3.96 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.btrfs_file_write_iter
>        5.34 =C2=B1  9%      -1.4        3.90 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.btrfs_buffered_write
>        5.88 =C2=B1  7%      -1.4        4.47 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.writepage_delalloc
>        5.30 =C2=B1  8%      -1.3        4.01 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.btrfs_run_delalloc_range
>        5.28 =C2=B1  8%      -1.3        3.99 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.run_delalloc_nocow
>        2.55 =C2=B1  2%      -0.9        1.67 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.btrfs_cow_block
>        2.54 =C2=B1  2%      -0.9        1.66 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.__btrfs_cow_block
>        2.15 =C2=B1 13%      -0.8        1.31 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.__lookup_extent_mapping
>        1.87 =C2=B1 12%      -0.8        1.04 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.__etree_search
>        0.94 =C2=B1 51%      -0.7        0.22 =C2=B1 34%  perf-profile.chi=
ldren.cycles-pp.printk
>        0.94 =C2=B1 51%      -0.7        0.22 =C2=B1 34%  perf-profile.chi=
ldren.cycles-pp.vprintk_emit
>        2.60 =C2=B1  2%      -0.7        1.92 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.btrfs_insert_empty_items
>        3.00 =C2=B1  5%      -0.7        2.33 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock
>        1.89 =C2=B1  2%      -0.7        1.23 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__set_extent_bit
>        2.78 =C2=B1  4%      -0.6        2.14 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.__schedule
>        1.57 =C2=B1  2%      -0.5        1.02 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.lock_extent_bits
>        1.19 =C2=B1 14%      -0.5        0.70 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__clear_extent_bit
>        1.51 =C2=B1  7%      -0.5        1.04 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.read_block_for_search
>        2.08 =C2=B1  5%      -0.5        1.62 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.setup_items_for_insert
>        2.08 =C2=B1 17%      -0.4        1.67 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.btrfs_run_delayed_refs
>        2.08 =C2=B1 17%      -0.4        1.67 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.__btrfs_run_delayed_refs
>        1.60 =C2=B1  6%      -0.4        1.20 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.schedule
>        1.95 =C2=B1 11%      -0.4        1.58 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.try_to_wake_up
>        1.31 =C2=B1  6%      -0.4        0.94 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.create_io_em
>        0.99 =C2=B1  4%      -0.4        0.63 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.alloc_tree_block_no_bg_flush
>        1.00 =C2=B1  6%      -0.4        0.65 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.lock_and_cleanup_extent_if_need
>        1.27 =C2=B1  9%      -0.4        0.92 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__wake_up_common_lock
>        0.98 =C2=B1  3%      -0.4        0.63 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.btrfs_alloc_tree_block
>        1.27 =C2=B1  5%      -0.4        0.92 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.btrfs_dirty_pages
>        1.34 =C2=B1  7%      -0.3        0.99 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.btrfs_map_bio
>        1.11 =C2=B1  9%      -0.3        0.77 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.generic_bin_search
>        1.16 =C2=B1  6%      -0.3        0.82 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.find_extent_buffer
>        0.91 =C2=B1  7%      -0.3        0.57 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.btrfs_lookup_csum
>        1.21 =C2=B1 11%      -0.3        0.90 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.btrfs_lookup_csums_range
>        1.21 =C2=B1 11%      -0.3        0.91 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.csum_exist_in_range
>        1.10 =C2=B1 10%      -0.3        0.80 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__wake_up_common
>        0.37 =C2=B1 70%      -0.3        0.07 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.test_range_bit
>        1.61 =C2=B1  4%      -0.3        1.32 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.push_leaf_right
>        0.60 =C2=B1  4%      -0.3        0.31 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.btrfs_extend_item
>        1.02 =C2=B1  9%      -0.3        0.73 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.autoremove_wake_function
>        1.12 =C2=B1  4%      -0.3        0.84 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.btrfs_drop_extent_cache
>        0.82 =C2=B1  6%      -0.3        0.55 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.btrfs_release_path
>        0.85 =C2=B1  8%      -0.3        0.59 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.copy_extent_buffer_full
>        0.99 =C2=B1  4%      -0.3        0.73 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.btrfs_set_token_32
>        1.44 =C2=B1 13%      -0.3        1.18 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.btrfs_delalloc_reserve_metadata
>        0.84 =C2=B1  8%      -0.3        0.59 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.copy_page
>        0.87 =C2=B1 11%      -0.3        0.62 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.pagecache_get_page
>        0.84 =C2=B1  7%      -0.2        0.60 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_alloc
>        1.12 =C2=B1  7%      -0.2        0.88 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.__extent_writepage_io
>        1.30 =C2=B1 15%      -0.2        1.06 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.reserve_metadata_bytes
>        0.82 =C2=B1  4%      -0.2        0.58 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.run_one_async_done
>        1.25 =C2=B1  3%      -0.2        1.01 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.schedule_idle
>        0.34 =C2=B1 53%      -0.2        0.10 =C2=B1 28%  perf-profile.chi=
ldren.cycles-pp.delay_tsc
>        0.70 =C2=B1 13%      -0.2        0.47 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.prepare_pages
>        0.50 =C2=B1 22%      -0.2        0.28 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.clear_state_bit
>        0.84 =C2=B1  5%      -0.2        0.63 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.btrfs_get_extent
>        0.54 =C2=B1 11%      -0.2        0.34 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.btrfs_free_path
>        1.16 =C2=B1 11%      -0.2        0.96 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.native_queued_spin_lock_slowpath
>        0.53 =C2=B1  9%      -0.2        0.33 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.unpin_extent_cache
>        1.07 =C2=B1 10%      -0.2        0.88 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.btrfs_lookup_file_extent
>        0.50 =C2=B1  4%      -0.2        0.31 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.clear_extent_bit
>        0.45 =C2=B1 13%      -0.2        0.26 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_free
>        0.40 =C2=B1 14%      -0.2        0.21 =C2=B1 50%  perf-profile.chi=
ldren.cycles-pp.__writeback_inodes_wb
>        0.64 =C2=B1  7%      -0.2        0.45 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.dequeue_task_fair
>        0.50 =C2=B1  8%      -0.2        0.33 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.btrfs_add_delayed_tree_ref
>        0.88 =C2=B1 13%      -0.2        0.71 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.wait_reserve_ticket
>        0.52 =C2=B1  9%      -0.2        0.35 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__radix_tree_lookup
>        0.52 =C2=B1  8%      -0.2        0.36 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.xas_load
>        0.78 =C2=B1 19%      -0.2        0.62 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.__btrfs_free_extent
>        0.56 =C2=B1 17%      -0.1        0.42 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.btrfs_del_items
>        0.51 =C2=B1  5%      -0.1        0.36 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.dequeue_entity
>        0.39 =C2=B1  7%      -0.1        0.24 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__set_page_dirty_nobuffers
>        0.82 =C2=B1 14%      -0.1        0.68 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.ttwu_do_activate
>        0.55 =C2=B1  8%      -0.1        0.41 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.btrfs_submit_bio_hook
>        0.53 =C2=B1  5%      -0.1        0.40 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.update_load_avg
>        0.40 =C2=B1  8%      -0.1        0.27 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.add_delayed_ref_head
>        0.35 =C2=B1 13%      -0.1        0.22 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.set_extent_bit
>        0.52 =C2=B1  9%      -0.1        0.39 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.btrfs_wq_submit_bio
>        0.35 =C2=B1  3%      -0.1        0.23 =C2=B1 32%  perf-profile.chi=
ldren.cycles-pp.queued_write_lock_slowpath
>        0.33 =C2=B1  6%      -0.1        0.21 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.__slab_alloc
>        0.63 =C2=B1 19%      -0.1        0.51 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.sched_ttwu_pending
>        0.31 =C2=B1 11%      -0.1        0.19 =C2=B1 28%  perf-profile.chi=
ldren.cycles-pp.btrfs_update_inode
>        0.31 =C2=B1 11%      -0.1        0.19 =C2=B1 28%  perf-profile.chi=
ldren.cycles-pp.btrfs_update_inode_fallback
>        0.57 =C2=B1  5%      -0.1        0.46 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.find_lock_delalloc_range
>        0.45 =C2=B1  5%      -0.1        0.34 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.btrfs_cross_ref_exist
>        0.29 =C2=B1  3%      -0.1        0.18 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.free_extent_buffer
>        0.38 =C2=B1  3%      -0.1        0.26 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.btrfs_mark_buffer_dirty
>        0.46 =C2=B1  5%      -0.1        0.35 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.find_delalloc_range
>        0.41 =C2=B1  9%      -0.1        0.30 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.btrfs_copy_from_user
>        0.40 =C2=B1  9%      -0.1        0.29 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.iov_iter_copy_from_user_atomic
>        0.38 =C2=B1 10%      -0.1        0.27        perf-profile.children=
.cycles-pp.find_get_entry
>        0.31 =C2=B1 12%      -0.1        0.20 =C2=B1 31%  perf-profile.chi=
ldren.cycles-pp.btrfs_remove_ordered_extent
>        0.30 =C2=B1  6%      -0.1        0.20 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.___slab_alloc
>        0.26 =C2=B1  8%      -0.1        0.16 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.merge_state
>        0.38 =C2=B1  7%      -0.1        0.28 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.copyin
>        0.26 =C2=B1 17%      -0.1        0.15 =C2=B1 26%  perf-profile.chi=
ldren.cycles-pp.btrfs_delayed_update_inode
>        0.25 =C2=B1  4%      -0.1        0.15 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.insert_state
>        0.40 =C2=B1 13%      -0.1        0.30 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.extent_clear_unlock_delalloc
>        0.36 =C2=B1  9%      -0.1        0.26 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.alloc_extent_state
>        0.38 =C2=B1  7%      -0.1        0.29 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.copy_user_enhanced_fast_string
>        0.39 =C2=B1  3%      -0.1        0.29 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.alloc_extent_buffer
>        0.31 =C2=B1  4%      -0.1        0.22 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.set_extent_buffer_dirty
>        0.26 =C2=B1 11%      -0.1        0.17 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.unlock_up
>        0.32 =C2=B1  3%      -0.1        0.24 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.__btrfs_map_block
>        0.23 =C2=B1 13%      -0.1        0.15 =C2=B1 28%  perf-profile.chi=
ldren.cycles-pp.btrfs_add_delayed_data_ref
>        0.25 =C2=B1 12%      -0.1        0.17 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__slab_free
>        0.47 =C2=B1  6%      -0.1        0.39 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.__push_leaf_right
>        0.26 =C2=B1  9%      -0.1        0.18 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.__test_set_page_writeback
>        0.32 =C2=B1 11%      -0.1        0.24 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.btrfs_add_ordered_extent
>        0.15 =C2=B1  8%      -0.1        0.07 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__xa_set_mark
>        0.23 =C2=B1  7%      -0.1        0.15 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.release_extent_buffer
>        0.18 =C2=B1  8%      -0.1        0.11 =C2=B1 26%  perf-profile.chi=
ldren.cycles-pp.alloc_extent_map
>        0.32 =C2=B1 10%      -0.1        0.24 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.__btrfs_add_ordered_extent
>        0.32 =C2=B1 17%      -0.1        0.24 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.btrfs_tree_read_lock_atomic
>        0.20 =C2=B1 13%      -0.1        0.13 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.btrfs_inc_extent_ref
>        0.14 =C2=B1 21%      -0.1        0.06 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.find_ref_head
>        0.13 =C2=B1 32%      -0.1        0.06 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.rb_erase_cached
>        0.21 =C2=B1  7%      -0.1        0.14 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.btrfs_submit_bio_start
>        0.53 =C2=B1 12%      -0.1        0.46 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.btrfs_tree_read_lock
>        0.21 =C2=B1  7%      -0.1        0.14 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.btrfs_csum_one_bio
>        0.17 =C2=B1 16%      -0.1        0.10 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.rb_erase
>        0.21 =C2=B1  7%      -0.1        0.14 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.run_one_async_start
>        0.22 =C2=B1  3%      -0.1        0.15 =C2=B1 22%  perf-profile.chi=
ldren.cycles-pp.btrfs_try_tree_write_lock
>        0.21 =C2=B1  9%      -0.1        0.15 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.btrfs_leaf_free_space
>        0.15 =C2=B1 23%      -0.1        0.09 =C2=B1 35%  perf-profile.chi=
ldren.cycles-pp.free_extent_map
>        0.20 =C2=B1  9%      -0.1        0.14 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.leaf_space_used
>        0.19 =C2=B1  8%      -0.1        0.13 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.check_delayed_ref
>        0.17 =C2=B1 13%      -0.1        0.12 =C2=B1 31%  perf-profile.chi=
ldren.cycles-pp.get_page_from_freelist
>        0.13 =C2=B1  8%      -0.1        0.08 =C2=B1 26%  perf-profile.chi=
ldren.cycles-pp.__update_load_avg_se
>        0.17 =C2=B1  2%      -0.1        0.12 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.btrfs_set_range_writeback
>        0.15 =C2=B1  8%      -0.1        0.09 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.xas_set_mark
>        0.18 =C2=B1  6%      -0.1        0.13 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.___might_sleep
>        0.20 =C2=B1 11%      -0.1        0.15 =C2=B1 35%  perf-profile.chi=
ldren.cycles-pp.__alloc_pages_nodemask
>        0.10 =C2=B1  9%      -0.1        0.04 =C2=B1 71%  perf-profile.chi=
ldren.cycles-pp.btrfs_tree_unlock
>        0.14 =C2=B1 11%      -0.1        0.09 =C2=B1 28%  perf-profile.chi=
ldren.cycles-pp.btrfs_reserve_extent
>        0.10 =C2=B1 33%      -0.1        0.05 =C2=B1 72%  perf-profile.chi=
ldren.cycles-pp.__btrfs_release_delayed_node
>        0.22 =C2=B1  9%      -0.0        0.17 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.mark_extent_buffer_accessed
>        0.09 =C2=B1 13%      -0.0        0.04 =C2=B1 71%  perf-profile.chi=
ldren.cycles-pp.btrfs_tree_read_unlock_blocking
>        0.18 =C2=B1  8%      -0.0        0.14 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.__list_del_entry_valid
>        0.09 =C2=B1 13%      -0.0        0.04 =C2=B1 73%  perf-profile.chi=
ldren.cycles-pp.verify_parent_transid
>        0.11 =C2=B1 19%      -0.0        0.07 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.entry_SYSCALL_64
>        0.22 =C2=B1  5%      -0.0        0.18 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.check_committed_ref
>        0.11 =C2=B1 19%      -0.0        0.07 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.select_idle_sibling
>        0.14 =C2=B1 11%      -0.0        0.09 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.do_io_getevents
>        0.15 =C2=B1  7%      -0.0        0.11 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_io_getevents
>        0.08 =C2=B1 10%      -0.0        0.04 =C2=B1 71%  perf-profile.chi=
ldren.cycles-pp.btrfs_release_extent_buffer_pages
>        0.17 =C2=B1 18%      -0.0        0.13 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.clear_page_dirty_for_io
>        0.14 =C2=B1  5%      -0.0        0.10 =EF=BF=BD=EF=BF=BD 25%  perf=
-profile.children.cycles-pp.block_group_cache_tree_search
>        0.18 =C2=B1  4%      -0.0        0.14 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.btrfs_get_chunk_map
>        0.11 =C2=B1 13%      -0.0        0.08 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.btrfs_buffer_uptodate
>        0.15 =C2=B1 15%      -0.0        0.11 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.xas_find_marked
>        0.12 =C2=B1 15%      -0.0        0.08 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.btrfs_unlock_up_safe
>        0.12 =C2=B1 14%      -0.0        0.08 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.btrfs_set_path_blocking
>        0.11 =C2=B1 11%      -0.0        0.07 =C2=B1 28%  perf-profile.chi=
ldren.cycles-pp.find_free_extent
>        0.24 =C2=B1  5%      -0.0        0.20 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.btrfs_root_node
>        0.07 =C2=B1  6%      -0.0        0.03 =C2=B1 70%  perf-profile.chi=
ldren.cycles-pp.extent_mergeable
>        0.13 =C2=B1 12%      -0.0        0.10 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__switch_to
>        0.10 =C2=B1 18%      -0.0        0.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.rb_insert_color_cached
>        0.07 =C2=B1 14%      -0.0        0.04 =C2=B1 71%  perf-profile.chi=
ldren.cycles-pp.rb_prev
>        0.11 =C2=B1 11%      -0.0        0.08 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.get_io_u
>        0.10 =C2=B1 14%      -0.0        0.07 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.available_idle_cpu
>        0.17 =C2=B1 10%      -0.0        0.13 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp._raw_write_lock
>        0.10 =C2=B1 11%      -0.0        0.06 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__might_sleep
>        0.17 =C2=B1  7%      -0.0        0.14 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp._raw_read_lock
>        0.17 =C2=B1 10%      -0.0        0.14 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.can_overcommit
>        0.10 =C2=B1 11%      -0.0        0.07        perf-profile.children=
.cycles-pp.__list_add_valid
>        0.09 =C2=B1  7%      -0.0        0.06 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.aio_read_events
>        0.11 =C2=B1 10%      -0.0        0.08 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.___perf_sw_event
>        0.11 =C2=B1  9%      -0.0        0.09 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.get_alloc_profile
>        0.11 =C2=B1 12%      -0.0        0.08 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.pick_next_task_idle
>        0.10 =C2=B1 13%      -0.0        0.07 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.read_events
>        0.08 =C2=B1  6%      -0.0        0.06 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.replace_extent_mapping
>        0.10 =C2=B1  5%      -0.0        0.08 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.menu_reflect
>        0.07 =C2=B1 17%      +0.0        0.09 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.run_posix_cpu_timers
>        0.05 =C2=B1 58%      +0.0        0.08 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.rcu_irq_enter
>        0.19 =C2=B1 11%      +0.1        0.26 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.native_irq_return_iret
>        0.20 =C2=B1 14%      +0.1        0.27 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.btrfs_comp_cpu_keys
>        0.38 =C2=B1  9%      +0.1        0.46        perf-profile.children=
.cycles-pp.load_balance
>        0.30 =C2=B1  8%      +0.1        0.38 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.irq_enter
>        0.21 =C2=B1 24%      +0.1        0.30 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.rcu_sched_clock_irq
>        0.22 =C2=B1  3%      +0.1        0.32 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.lapic_next_deadline
>        0.52 =C2=B1 12%      +0.1        0.63 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.rebalance_domains
>        1.90 =C2=B1 10%      +0.3        2.23 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__hrtimer_run_queues
>        0.23 =C2=B1 12%      +0.4        0.67 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.read_extent_buffer
>        2.88 =C2=B1 11%      +0.5        3.41        perf-profile.children=
.cycles-pp.hrtimer_interrupt
>        0.09 =C2=B1 12%      +0.7        0.83 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.btrfs_get_token_8
>        2.37 =C2=B1 19%      +0.8        3.19 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.btrfs_async_reclaim_metadata_space
>        2.33 =C2=B1 19%      +0.8        3.17 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.flush_space
>        0.14 =C2=B1 34%      +1.3        1.39 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.btrfs_write_and_wait_transaction
>        0.14 =C2=B1 34%      +1.3        1.39 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.btrfs_write_marked_extents
>        0.14 =C2=B1 34%      +1.3        1.39 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.__filemap_fdatawrite_range
>        0.42 =C2=B1 43%      +1.3        1.67 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.btrfs_commit_transaction
>        0.25 =C2=B1  5%      +1.9        2.17 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.btrfs_get_token_64
>        1.71 =C2=B1  5%      +2.1        3.79 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.btrfs_get_token_32
>        0.43 =C2=B1  8%      +2.4        2.84 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.map_private_extent_buffer
>        8.37 =C2=B1  7%      +3.3       11.65 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.wb_writeback
>        8.37 =C2=B1  7%      +3.3       11.65 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.writeback_sb_inodes
>        8.37 =C2=B1  7%      +3.3       11.65 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.__writeback_single_inode
>        8.37 =C2=B1  7%      +3.3       11.65 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.wb_workfn
>       50.06 =C2=B1  2%      +3.8       53.82 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.intel_idle
>       61.99 =C2=B1  2%      +4.4       66.39 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.do_idle
>       61.98 =C2=B1  2%      +4.4       66.38 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.secondary_startup_64
>       61.98 =C2=B1  2%      +4.4       66.38 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.cpu_startup_entry
>        8.51 =C2=B1  7%      +4.5       13.04 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.do_writepages
>       56.43 =C2=B1  3%      +4.9       61.30 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.cpuidle_enter_state
>       61.27 =C2=B1  2%      +5.1       66.37 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.start_secondary
>        1.43 =C2=B1  7%      +6.2        7.64 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.submit_extent_page
>        1.20 =C2=B1 17%      +6.2        7.45 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.btree_write_cache_pages
>        1.05 =C2=B1 17%      +6.3        7.31 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.write_one_eb
>        1.11 =C2=B1  7%      +6.3        7.37 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.submit_one_bio
>        0.55 =C2=B1 16%      +6.4        6.95 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.btree_submit_bio_hook
>        0.00            +6.5        6.48 =C2=B1 13%  perf-profile.children=
.cycles-pp.check_leaf
>        0.00            +6.5        6.53 =C2=B1 13%  perf-profile.children=
.cycles-pp.btree_csum_one_bio
>        2.12 =C2=B1 11%      -0.8        1.29 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__lookup_extent_mapping
>        1.83 =C2=B1 12%      -0.8        1.03 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.__etree_search
>        2.06 =C2=B1  5%      -0.5        1.59 =C2=B1  5%  perf-profile.sel=
f.cycles-pp._raw_spin_lock
>        0.81 =C2=B1  9%      -0.3        0.52 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.generic_bin_search
>        0.84 =C2=B1  7%      -0.3        0.58 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.copy_page
>        0.33 =C2=B1 54%      -0.2        0.10 =C2=B1 28%  perf-profile.sel=
f.cycles-pp.delay_tsc
>        0.89 =C2=B1  9%      -0.2        0.69 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.btrfs_set_token_32
>        0.81 =C2=B1  4%      -0.2        0.63 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.__schedule
>        0.51 =C2=B1  9%      -0.2        0.35 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.__radix_tree_lookup
>        0.45 =C2=B1  8%      -0.1        0.32 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.xas_load
>        0.43 =C2=B1  4%      -0.1        0.31 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.find_extent_buffer
>        0.77 =C2=B1  5%      -0.1        0.66 =C2=B1 11%  perf-profile.sel=
f.cycles-pp._raw_spin_lock_irqsave
>        0.31 =C2=B1 10%      -0.1        0.20 =C2=B1 28%  perf-profile.sel=
f.cycles-pp.add_delayed_ref_head
>        0.39 =C2=B1 16%      -0.1        0.29 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.try_to_wake_up
>        0.31 =C2=B1  4%      -0.1        0.20 =C2=B1 26%  perf-profile.sel=
f.cycles-pp.queued_write_lock_slowpath
>        0.38 =C2=B1  7%      -0.1        0.29 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.copy_user_enhanced_fast_string
>        0.20 =C2=B1 17%      -0.1        0.11 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.kmem_cache_free
>        0.25 =C2=B1 11%      -0.1        0.17 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.__slab_free
>        0.16 =C2=B1  9%      -0.1        0.08 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.free_extent_buffer
>        0.28 =C2=B1 17%      -0.1        0.20 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.btrfs_search_slot
>        0.31 =C2=B1  4%      -0.1        0.24 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.kmem_cache_alloc
>        0.14 =C2=B1 21%      -0.1        0.06 =C2=B1 19%  perf-profile.sel=
f.cycles-pp.find_ref_head
>        0.16 =C2=B1 10%      -0.1        0.09 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.insert_state
>        0.12 =C2=B1  8%      -0.1        0.06 =C2=B1 72%  perf-profile.sel=
f.cycles-pp.__update_load_avg_se
>        0.16 =C2=B1 15%      -0.1        0.10 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.rb_erase
>        0.10 =C2=B1  9%      -0.1        0.04 =C2=B1 71%  perf-profile.sel=
f.cycles-pp.btrfs_tree_unlock
>        0.15 =C2=B1 13%      -0.1        0.10 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.___slab_alloc
>        0.28 =C2=B1 13%      -0.1        0.22 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.queued_read_lock_slowpath
>        0.15 =C2=B1 21%      -0.1        0.09 =C2=B1 35%  perf-profile.sel=
f.cycles-pp.free_extent_map
>        0.18 =C2=B1  6%      -0.1        0.12 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.update_load_avg
>        0.10 =C2=B1 11%      -0.1        0.04 =C2=B1 70%  perf-profile.sel=
f.cycles-pp.btrfs_extend_item
>        0.15 =C2=B1 23%      -0.1        0.09 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.add_extent_mapping
>        0.15 =C2=B1  8%      -0.1        0.09 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.xas_set_mark
>        0.18 =C2=B1  6%      -0.1        0.13 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.___might_sleep
>        0.18 =C2=B1  6%      -0.0        0.13 =C2=B1 22%  perf-profile.sel=
f.cycles-pp.__list_del_entry_valid
>        0.18 =C2=B1  4%      -0.0        0.14 =C2=B1 22%  perf-profile.sel=
f.cycles-pp.pick_next_task_fair
>        0.09 =C2=B1 13%      -0.0        0.04 =C2=B1 73%  perf-profile.sel=
f.cycles-pp.verify_parent_transid
>        0.09 =C2=B1 12%      -0.0        0.04 =C2=B1 71%  perf-profile.sel=
f.cycles-pp.btrfs_tree_read_unlock_blocking
>        0.16 =C2=B1 13%      -0.0        0.12 =C2=B1 24%  perf-profile.sel=
f.cycles-pp.mark_page_accessed
>        0.12 =C2=B1 14%      -0.0        0.08 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.dequeue_task_fair
>        0.10 =C2=B1 19%      -0.0        0.07 =C2=B1 18%  perf-profile.sel=
f.cycles-pp.entry_SYSCALL_64
>        0.08 =C2=B1 14%      -0.0        0.04 =C2=B1 73%  perf-profile.sel=
f.cycles-pp.unlock_up
>        0.15 =C2=B1 15%      -0.0        0.11 =C2=B1 19%  perf-profile.sel=
f.cycles-pp.xas_find_marked
>        0.24 =C2=B1  6%      -0.0        0.20 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.btrfs_root_node
>        0.17 =C2=B1  6%      -0.0        0.13 =C2=B1 10%  perf-profile.sel=
f.cycles-pp._raw_read_lock
>        0.10 =C2=B1 13%      -0.0        0.06 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.btrfs_csum_one_bio
>        0.16 =C2=B1  7%      -0.0        0.13 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.dequeue_entity
>        0.07            -0.0        0.04 =C2=B1 71%  perf-profile.self.cyc=
les-pp.io_u_queued_complete
>        0.08            -0.0        0.05 =C2=B1 70%  perf-profile.self.cyc=
les-pp.mutex_lock
>        0.11 =C2=B1 11%      -0.0        0.08 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.get_io_u
>        0.16 =C2=B1  9%      -0.0        0.13        perf-profile.self.cyc=
les-pp._raw_write_lock
>        0.07 =C2=B1 17%      -0.0        0.04 =C2=B1 73%  perf-profile.sel=
f.cycles-pp.btrfs_tree_read_lock
>        0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.__switch_to
>        0.10 =C2=B1 11%      -0.0        0.06 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.__clear_extent_bit
>        0.07 =C2=B1 12%      -0.0        0.04 =C2=B1 71%  perf-profile.sel=
f.cycles-pp.rb_prev
>        0.10 =C2=B1 15%      -0.0        0.07 =C2=B1 23%  perf-profile.sel=
f.cycles-pp.find_get_pages_range_tag
>        0.10 =C2=B1 12%      -0.0        0.07 =C2=B1 23%  perf-profile.sel=
f.cycles-pp.available_idle_cpu
>        0.10 =C2=B1 11%      -0.0        0.07 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__list_add_valid
>        0.08 =C2=B1 13%      -0.0        0.06 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.__might_sleep
>        0.12 =C2=B1 17%      -0.0        0.09 =C2=B1 15%  perf-profile.sel=
f.cycles-pp.release_extent_buffer
>        0.09 =C2=B1 17%      -0.0        0.07 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.___perf_sw_event
>        0.08 =C2=B1  5%      -0.0        0.06 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.__push_leaf_right
>        0.11 =C2=B1  7%      -0.0        0.09 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.set_extent_buffer_dirty
>        0.11 =C2=B1  4%      -0.0        0.08 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.__set_extent_bit
>        0.09 =C2=B1  7%      +0.0        0.11 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.hrtimer_interrupt
>        0.07 =C2=B1 17%      +0.0        0.09 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.run_posix_cpu_timers
>        0.07 =C2=B1  7%      +0.0        0.09 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.load_balance
>        0.01 =C2=B1173%      +0.1        0.07 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.lapic_next_deadline
>        0.00            +0.1        0.06 =C2=B1 23%  perf-profile.self.cyc=
les-pp.find_next_and_bit
>        0.19 =C2=B1 11%      +0.1        0.26 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.native_irq_return_iret
>        0.19 =C2=B1 24%      +0.1        0.28 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.rcu_sched_clock_irq
>        0.50 =C2=B1  8%      +0.2        0.69 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.cpuidle_enter_state
>        0.07 =C2=B1 11%      +0.4        0.46 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.btrfs_get_token_8
>        0.22 =C2=B1 13%      +0.4        0.66 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.read_extent_buffer
>        0.00            +0.6        0.65 =C2=B1 14%  perf-profile.self.cyc=
les-pp.check_leaf
>        0.15 =C2=B1 11%      +1.0        1.13 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.btrfs_get_token_64
>        1.48 =C2=B1  7%      +1.0        2.51 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.btrfs_get_token_32
>        0.41 =C2=B1  8%      +2.2        2.61 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.map_private_extent_buffer
>       49.99 =C2=B1  2%      +3.7       53.74 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.intel_idle
> =

> =

>                                                                          =
        =

>                                   fio.write_bw_MBps
>                                                                          =
        =

>    300 +-+---------------------------------------------------------------=
----+
>        |                                                                 =
    |
>    250 +-++.+     +.  .+..    .+..+..+.+..               .+..+.. .+      =
    |
>        |    :     : +.    +..+            +    +..+    +.       +        =
    |
>        |     :    :                       :    :  :    :                 =
    |
>    200 +-+   :   :                         :   :   :   :  O  O           =
    |
>        O  O O: O :O O  O  O  O O  O  O O  O: O:O  O: O:         O O     O=
 O  O
>    150 +-+   :   :                         :  :    :  :                  =
    |
>        |      :  :                         :  :    :  :                  =
    |
>    100 +-+    : :                           : :     : :                  =
    |
>        |      : :                           : :     : :                  =
    |
>        |      : :                           : :     : :                  =
    |
>     50 +-+     ::                           ::      ::                   =
    |
>        |       :                             :       :                   =
    |
>      0 +-+---------------------------------------------O-------------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                     fio.write_iops
>                                                                          =
        =

>    70000 +-+-------------------------------------------------------------=
----+
>          |..+.+    +..+..+.+..  .+.+..+.+..+    +..     +..+.+..+..+     =
    |
>    60000 +-+  :    :          +.           :    :  +    :                =
    |
>          |    :    :                       :    :  :    :                =
    |
>    50000 +-+   :   :                        :   :  :   :                 =
    |
>          O  O O:  :O  O  O O  O  O O  O O  O: O:O  O:O :   O O  O  O    O=
 O  O
>    40000 +-+   : O:                         :  :    :  :                 =
    |
>          |     :  :                         :  :    :  :                 =
    |
>    30000 +-+    : :                          : :    : :                  =
    |
>          |      : :                          : :    : :                  =
    |
>    20000 +-+    : :                          : :    : :                  =
    |
>          |      ::                           ::      ::                  =
    |
>    10000 +-+     :                            :      :                   =
    |
>          |       :                            :      :                   =
    |
>        0 +-+--------------------------------------------O------------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                 fio.write_clat_mean_us
>                                                                          =
        =

>    30000 +-+-------------------------------------------------------------=
----+
>          |                                                               =
    |
>    25000 O-+O O  O O  O  O O  O  O O  O O  O  O O  O O             O     =
 O  |
>          |                                                 O O  O       O=
    O
>          |                                                               =
    |
>    20000 +-+                                                             =
    |
>          |..+.+    +..+..+.+..+..+.+..+.+..+    +..+    +..+.+..+..+     =
    |
>    15000 +-+  :    :                       :    :  :    :                =
    |
>          |     :   :                        :   :   :  :                 =
    |
>    10000 +-+   :  :                         :  :    :  :                 =
    |
>          |      : :                          : :    :  :                 =
    |
>          |      : :                          : :    : :                  =
    |
>     5000 +-+    : :                          : :     ::                  =
    |
>          |       :                            :      :                   =
    |
>        0 +-+--------------------------------------------O------------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                  fio.write_clat_stddev
>                                                                          =
        =

>    160000 +-+------------------------------------------------------------=
----+
>           |                                                              =
    |
>    140000 O-+O O  O O  O O  O  O O    O     O O  O O                     =
    |
>    120000 +-+                       O    O                               =
    |
>           |                                                              =
    |
>    100000 +-+                                         O    O  O O  O    O=
 O  O
>           |                                                              =
    |
>     80000 +-+                                                            =
    |
>           |                .+..                                          =
    |
>     60000 +-++.+    +..+.+.    +.+..+.+..+..+    +.+    +..+..+.+..+     =
    |
>     40000 +-+   :   :                       :   :   :   :                =
    |
>           |     :  :                         :  :   :  :                 =
    |
>     20000 +-+    : :                         : :     : :                 =
    |
>           |      ::                           ::     ::                  =
    |
>         0 +-+-------------------------------------------O------------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                fio.write_slat_mean_us
>                                                                          =
        =

>    900 +-+---------------------------------------------------------------=
----+
>        O    O  O  O O  O  O  O O  O  O O  O  O O  O               O      =
 O  |
>    800 +-+O                                          O    O  O  O       O=
    O
>    700 +-+                                                               =
    |
>        |                                                                 =
    |
>    600 +-++.+     +.+..+..+..+.+..+..+.+..+    +..+    +..+..+..+.+      =
    |
>    500 +-+  :     :                       :    :  :    :                 =
    |
>        |     :   :                         :   :   :   :                 =
    |
>    400 +-+   :   :                         :  :    :  :                  =
    |
>    300 +-+   :   :                         :  :    :  :                  =
    |
>        |      : :                           : :     : :                  =
    |
>    200 +-+    : :                           : :     : :                  =
    |
>    100 +-+    : :                           ::      ::                   =
    |
>        |       :                             :       :                   =
    |
>      0 +-+---------------------------------------------O-------------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                  fio.write_slat_stddev
>                                                                          =
        =

>    25000 +-+-----O---------O---------------------------------------------=
----+
>          O  O O    O  O  O    O  O O  O O  O  O O  O                     =
    |
>          |                                                               =
    |
>    20000 +-+                                                             =
    |
>          |                                           O     O O  O  O    O=
 O  O
>          |                                                               =
    |
>    15000 +-+                                                             =
    |
>          |                                                               =
    |
>    10000 +-++.            .+..    .+.. .+..+      .+           .+..+     =
    |
>          |.   +    +..+..+    +..+    +     :   +. :    +..+.+.          =
    |
>          |     :   :                        :   :   :  :                 =
    |
>     5000 +-+   :  :                          : :    :  :                 =
    |
>          |      : :                          : :    : :                  =
    |
>          |      ::                            :      ::                  =
    |
>        0 +-+--------------------------------------------O------------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                  fio.latency_1000ms_
>                                                                          =
        =

>     0.4 +-+--------------------------------------------------------------=
----+
>         |                                                                =
    |
>    0.35 +-+                                                              =
 O  |
>     0.3 +-+                                                              =
    |
>         |                                            O            O      =
    |
>    0.25 +-+                                               O             O=
    |
>         |                            O                          O        =
    O
>     0.2 O-+  O  O  O       O O     O    O    O    O          O           =
    |
>         |                                  O    O                        =
    |
>    0.15 +-+O         O  O       O                                        =
    |
>     0.1 +-+                                                              =
    |
>         |                                                                =
    |
>    0.05 +-+                                                              =
    |
>         | .+.               .+..+..+.+..+..    .+.     .+.+..+..         =
    |
>       0 +-+---------------------------------------------O------------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                       fio.workload
>                                                                          =
        =

>    1.4e+07 +-+-----------------------------------------------------------=
----+
>            |..+.+    +..+.+..+.+..+.+..+.+..+    +..     +.+..+.+..+     =
    |
>    1.2e+07 +-+  :    :                      :    :  +    :               =
    |
>            |    :    :                      :    :  :    :               =
    |
>      1e+07 +-+   :   :                       :   :  :   :                =
    |
>            O  O O:  :O  O O  O O  O O  O O  O: O:O  O:O :  O  O O  O    O=
 O  O
>      8e+06 +-+   : O:                        :  :    :  :                =
    |
>            |     :  :                        :  :    :  :                =
    |
>      6e+06 +-+    : :                         : :    : :                 =
    |
>            |      : :                         : :    : :                 =
    |
>      4e+06 +-+    : :                         : :    : :                 =
    |
>            |      ::                          ::      ::                 =
    |
>      2e+06 +-+     :                           :      :                  =
    |
>            |       :                           :      :                  =
    |
>          0 +-+-------------------------------------------O-----------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                            fio.time.voluntary_context_switches
>                                                                          =
        =

>    1.4e+07 +-+-----------------------------------------------------------=
----+
>            |                                                             =
    |
>    1.2e+07 +-++.+    +..+.+..+.+..+.+..+.+..+    +..+    +.+..+.+..+     =
    |
>            |    :    :                      :    :  :    :               =
    |
>      1e+07 +-+   :   :                       :   :  :    :               =
    |
>            |  O O:   :  O           O    O   :   :   :O :  O  O O  O    O=
 O  O
>      8e+06 O-+   : O:O    O  O O  O    O    O: O:O  O:  :                =
    |
>            |     :  :                        :  :    :  :                =
    |
>      6e+06 +-+    : :                         : :    :  :                =
    |
>            |      : :                         : :    : :                 =
    |
>      4e+06 +-+    : :                         : :    : :                 =
    |
>            |      : :                         : :     ::                 =
    |
>      2e+06 +-+     :                           :      ::                 =
    |
>            |       :                           :      :                  =
    |
>          0 +-+-------------------------------------------O-----------O---=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                               fio.time.file_system_outputs
>                                                                          =
        =

>    1.2e+08 +-+-----------------------------------------------------------=
----+
>            |                                                             =
    |
>      1e+08 +-++.+    +..+.+..+.+..+.+..+.+..+    +..+    +.+..+.+..+     =
    |
>            |    :    :                      :    :  :    :               =
    |
>            |     :   :                       :   :  :    :               =
    |
>      8e+07 +-+   :   :                       :   :   :  :  O  O O       O=
    O
>            O  O O: O:O  O O  O O  O O  O O  O: O:O  O:O :          O     =
 O  |
>      6e+07 +-+   :  :                        :  :    :  :                =
    |
>            |      : :                         : :    :  :                =
    |
>      4e+07 +-+    : :                         : :    : :                 =
    |
>            |      : :                         : :    : :                 =
    |
>            |      : :                         : :     ::                 =
    |
>      2e+07 +-+     :                           :      ::                 =
    |
>            |       :                           :      :                  =
    |
>          0 +-+-------------------------------------------O-----------O---=
----+
>                                                                          =
        =

>                                                                          =
        =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

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
> Rong Chen
> =

> =

> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp
> =


-- =

Zhengjun Xing
--===============9042000230271730991==--

