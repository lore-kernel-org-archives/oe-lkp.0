Content-Type: multipart/mixed; boundary="===============1148427481888897552=="
MIME-Version: 1.0
From: Yu Kuai <yukuai1@huaweicloud.com>
To: lkp@lists.01.org
Subject: Re: [blk] 8c5035dfbb: fio.read_iops -10.6% regression
Date: Sat, 08 Oct 2022 16:00:10 +0800
Message-ID: <d5279fc2-38b3-6d20-4404-604d5c7277e2@huaweicloud.com>
In-Reply-To: <202210081045.77ddf59b-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1148427481888897552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

=E5=9C=A8 2022/10/08 10:50, kernel test robot =E5=86=99=E9=81=93:
> Greeting,
> =

> FYI, we noticed a -10.6% regression of fio.read_iops due to commit:

I don't know how this is working but I'm *sure* this commit won't affect
performance. Please take a look at the commit, only wbt initialization
is touched, which is done while creating the device:

device_add_disk
  blk_register_queue
   wbt_enable_default
    wbt_init

And io path is the same with or without this commit.

By the way, wbt should only work for write.

Thanks,
Kuai
> =

> commit: 8c5035dfbb9475b67c82b3fdb7351236525bf52b ("blk-wbt: call rq_qos_a=
dd() after wb_normal is initialized")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: fio-basic
> on test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU=
 @ 2.30GHz (Cascade Lake) with 192G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 8t
> 	disk: 1SSD
> 	fs: btrfs
> 	rw: randread
> 	bs: 2M
> 	ioengine: sync
> 	test_size: 256g
> 	cpufreq_governor: performance
> =

> test-description: Fio is a tool that will spawn a number of threads or pr=
ocesses doing a particular type of I/O action as specified by the user.
> test-url: https://github.com/axboe/fio
> =

> =

> Details are as below:
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runt=
ime/rw/tbox_group/test_size/testcase:
>    2M/gcc-11/performance/1SSD/btrfs/sync/x86_64-rhel-8.3/8t/debian-11.1-x=
86_64-20220510.cgz/300s/randread/lkp-csl-2ap4/256g/fio-basic
> =

> commit:
>    f7de4886fe ("rnbd-srv: remove struct rnbd_dev")
>    8c5035dfbb ("blk-wbt: call rq_qos_add() after wb_normal is initialized=
")
> =

> f7de4886fe8f008a 8c5035dfbb9475b67c82b3fdb73
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>        0.03 =C2=B1106%      +0.2        0.22 =C2=B1 80%  fio.latency_20ms%
>        0.02 =C2=B1 33%      -0.0        0.01 =C2=B1 12%  fio.latency_4ms%
>        2508           -10.6%       2243        fio.read_bw_MBps
>     6717440           +17.6%    7897088        fio.read_clat_90%_us
>     6892202           +19.0%    8202922        fio.read_clat_95%_us
>     7602176 =C2=B1  4%     +18.4%    9000277 =C2=B1  3%  fio.read_clat_99=
%_us
>     6374238           +11.8%    7127450        fio.read_clat_mean_us
>      363825 =C2=B1 10%     +74.9%     636378 =C2=B1  5%  fio.read_clat_st=
ddev
>        1254           -10.6%       1121        fio.read_iops
>      104.97           +11.8%     117.32        fio.time.elapsed_time
>      104.97           +11.8%     117.32        fio.time.elapsed_time.max
>       13731            +5.6%      14498 =C2=B1  4%  fio.time.maximum_resi=
dent_set_size
>      116.00            -8.2%     106.50        fio.time.percent_of_cpu_th=
is_job_got
>   1.998e+10           +11.4%  2.226e+10        cpuidle..time
>        3.27 =C2=B1  3%      +4.6%       3.42        iostat.cpu.iowait
>        4.49 =C2=B1 68%      -2.1        2.38 =C2=B1152%  perf-profile.chi=
ldren.cycles-pp.number
>        4.49 =C2=B1 68%      -2.5        1.98 =C2=B1175%  perf-profile.sel=
f.cycles-pp.number
>      557763            +5.4%     587781        proc-vmstat.pgfault
>       25488            +3.1%      26274        proc-vmstat.pgreuse
>     2459048           -10.1%    2209482        vmstat.io.bi
>      184649 =C2=B1  5%     -10.4%     165526 =C2=B1  7%  vmstat.system.cs
>      111733 =C2=B1 30%     +61.8%     180770 =C2=B1 21%  numa-meminfo.nod=
e0.AnonPages
>      113221 =C2=B1 30%     +60.2%     181416 =C2=B1 21%  numa-meminfo.nod=
e0.Inactive(anon)
>       11301 =C2=B1 24%    +164.5%      29888 =C2=B1117%  numa-meminfo.nod=
e2.Active(file)
>      104911 =C2=B1 39%     -80.5%      20456 =C2=B1100%  numa-meminfo.nod=
e3.AnonHugePages
>      131666 =C2=B1 27%     -67.9%      42297 =C2=B1 82%  numa-meminfo.nod=
e3.AnonPages
>      132698 =C2=B1 26%     -67.5%      43158 =C2=B1 81%  numa-meminfo.nod=
e3.Inactive(anon)
>       27934 =C2=B1 30%     +61.8%      45196 =C2=B1 21%  numa-vmstat.node=
0.nr_anon_pages
>       28306 =C2=B1 30%     +60.2%      45358 =C2=B1 21%  numa-vmstat.node=
0.nr_inactive_anon
>       28305 =C2=B1 30%     +60.2%      45357 =C2=B1 21%  numa-vmstat.node=
0.nr_zone_inactive_anon
>        6291 =C2=B1 24%     +68.0%      10567 =C2=B1 26%  numa-vmstat.node=
2.workingset_nodes
>       32925 =C2=B1 27%     -67.9%      10571 =C2=B1 82%  numa-vmstat.node=
3.nr_anon_pages
>       33182 =C2=B1 26%     -67.5%      10786 =C2=B1 81%  numa-vmstat.node=
3.nr_inactive_anon
>       33182 =C2=B1 26%     -67.5%      10786 =C2=B1 81%  numa-vmstat.node=
3.nr_zone_inactive_anon
>      161.78 =C2=B1  4%     -28.2%     116.10 =C2=B1 30%  sched_debug.cfs_=
rq:/.runnable_avg.avg
>      161.46 =C2=B1  4%     -28.2%     115.85 =C2=B1 30%  sched_debug.cfs_=
rq:/.util_avg.avg
>      426382           +11.0%     473345 =C2=B1  6%  sched_debug.cpu.clock=
.avg
>      426394           +11.0%     473357 =C2=B1  6%  sched_debug.cpu.clock=
.max
>      426370           +11.0%     473331 =C2=B1  6%  sched_debug.cpu.clock=
.min
>      426139           +10.9%     472586 =C2=B1  6%  sched_debug.cpu.clock=
_task.avg
>      426368           +11.0%     473130 =C2=B1  6%  sched_debug.cpu.clock=
_task.max
>      416196           +11.1%     462228 =C2=B1  6%  sched_debug.cpu.clock=
_task.min
>        1156 =C2=B1  7%     -10.8%       1031 =C2=B1  6%  sched_debug.cpu.=
curr->pid.stddev
>      426372           +11.0%     473334 =C2=B1  6%  sched_debug.cpu_clk
>      425355           +11.0%     472318 =C2=B1  6%  sched_debug.ktime
>      426826           +11.0%     473787 =C2=B1  6%  sched_debug.sched_clk
>   1.263e+09            -7.9%  1.164e+09 =C2=B1  3%  perf-stat.i.branch-in=
structions
>      190886 =C2=B1  5%     -10.8%     170290 =C2=B1  7%  perf-stat.i.cont=
ext-switches
>   1.979e+09            -8.8%  1.804e+09 =C2=B1  2%  perf-stat.i.dTLB-loads
>   8.998e+08            -8.2%  8.257e+08 =C2=B1  2%  perf-stat.i.dTLB-stor=
es
>   6.455e+09            -8.0%  5.938e+09 =C2=B1  3%  perf-stat.i.instructi=
ons
>       21.78            -8.4%      19.95        perf-stat.i.metric.M/sec
>     7045315 =C2=B1  4%     -14.0%    6057863 =C2=B1  6%  perf-stat.i.node=
-load-misses
>     2658563 =C2=B1  7%     -21.9%    2077647 =C2=B1 12%  perf-stat.i.node=
-loads
>      414822 =C2=B1  4%     -12.9%     361455 =C2=B1  3%  perf-stat.i.node=
-store-misses
>   1.251e+09            -7.8%  1.154e+09 =C2=B1  3%  perf-stat.ps.branch-i=
nstructions
>      189082 =C2=B1  5%     -10.7%     168849 =C2=B1  7%  perf-stat.ps.con=
text-switches
>    1.96e+09            -8.8%  1.789e+09 =C2=B1  2%  perf-stat.ps.dTLB-loa=
ds
>   8.912e+08            -8.1%  8.187e+08 =C2=B1  2%  perf-stat.ps.dTLB-sto=
res
>   6.393e+09            -7.9%  5.888e+09 =C2=B1  3%  perf-stat.ps.instruct=
ions
>     6978485 =C2=B1  4%     -13.9%    6006510 =C2=B1  6%  perf-stat.ps.nod=
e-load-misses
>     2633627 =C2=B1  7%     -21.8%    2060033 =C2=B1 12%  perf-stat.ps.nod=
e-loads
>      410822 =C2=B1  4%     -12.8%     358289 =C2=B1  3%  perf-stat.ps.nod=
e-store-misses
> =

> =

> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/r/202210081045.77ddf59b-yujie.liu(a)intel=
.com
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          sudo bin/lkp install job.yaml           # job file is attached i=
n this email
>          bin/lkp split-job --compatible job.yaml # generate the yaml file=
 for lkp run
>          sudo bin/lkp run generated-yaml-file
> =

>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

>=20

--===============1148427481888897552==--

