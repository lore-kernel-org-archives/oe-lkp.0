Content-Type: multipart/mixed; boundary="===============5936719449899952735=="
MIME-Version: 1.0
From: Filipe Manana <fdmanana@suse.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] e678934cbe: reaim.jobs_per_min -30.7% regression
Date: Fri, 12 Jun 2020 12:50:42 +0100
Message-ID: <7b474586-0d13-5a9d-8aed-17a99b69d80b@suse.com>
In-Reply-To: <20200611090233.GL12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5936719449899952735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/06/20 10:02, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -30.7% regression of reaim.jobs_per_min due to commit:


Hello,

In the future, can you please always CC linux-btrfs(a)vger.kernel.org for
btrfs related reports?

Thanks.

> =

> =

> commit: e678934cbe5f026c2765a1da651e61daa5724fb3 ("btrfs: Remove unnecess=
ary check from join_running_log_trans")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: reaim
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 256G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 100
> 	disk: 1HDD
> 	fs: btrfs
> 	test: disk
> 	cpufreq_governor: performance
> 	ucode: 0x500002c
> =

> test-description: REAIM is an updated and improved version of AIM 7 bench=
mark.
> test-url: https://sourceforge.net/projects/re-aim-7/
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/nr_task/rootfs/runtime/tbox_gro=
up/test/testcase/ucode:
>   gcc-9/performance/1HDD/btrfs/x86_64-rhel-7.6/100/debian-x86_64-20191114=
.cgz/300s/lkp-csl-2sp6/disk/reaim/0x500002c
> =

> commit: =

>   32e534402a ("Btrfs: wake up inode cache waiters sooner to reduce waitin=
g time")
>   e678934cbe ("btrfs: Remove unnecessary check from join_running_log_tran=
s")
> =

> 32e534402ad52e9f e678934cbe5f026c2765a1da651 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4           25%           1:4     dmesg.WARNING:at#for_ip_swa=
pgs_restore_regs_and_return_to_usermode/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>       5.39            +6.4%       5.73 =C2=B1  6%  reaim.child_utime
>       6882 =C2=B1  2%     -30.7%       4771 =C2=B1  2%  reaim.jobs_per_min
>      68.82 =C2=B1  2%     -30.7%      47.72 =C2=B1  2%  reaim.jobs_per_mi=
n_child
>      98.56            -3.4%      95.25        reaim.jti
>       6978 =C2=B1  2%     -29.5%       4917 =C2=B1  2%  reaim.max_jobs_pe=
r_min
>      87.24 =C2=B1  2%     +44.3%     125.92 =C2=B1  2%  reaim.parent_time
>       0.97 =C2=B1  5%    +337.7%       4.26 =C2=B1  9%  reaim.std_dev_per=
cent
>       0.84 =C2=B1  5%    +504.3%       5.05 =C2=B1  7%  reaim.std_dev_time
>     357.77 =C2=B1  2%      +7.4%     384.27 =C2=B1  2%  reaim.time.elapse=
d_time
>     357.77 =C2=B1  2%      +7.4%     384.27 =C2=B1  2%  reaim.time.elapse=
d_time.max
>     276434           -25.6%     205672        reaim.time.file_system_inpu=
ts
>   10740316           -20.1%    8583748 =C2=B1  2%  reaim.time.file_system=
_outputs
>      63443           -13.8%      54688        reaim.time.involuntary_cont=
ext_switches
>    6205791           -24.9%    4661554        reaim.time.minor_page_faults
>      84.25 =C2=B1  2%     -34.4%      55.25 =C2=B1 11%  reaim.time.percen=
t_of_cpu_this_job_got
>     281.73           -30.3%     196.49 =C2=B1 11%  reaim.time.system_time
>      21.59           -20.2%      17.23 =C2=B1  6%  reaim.time.user_time
>    2253123           -10.4%    2017718        reaim.time.voluntary_contex=
t_switches
>      40000           -25.0%      30000        reaim.workload
>      92.59            +2.6%      95.01        iostat.cpu.idle
>       6.37           -32.9%       4.27        iostat.cpu.iowait
>       0.97 =C2=B1  4%     -32.4%       0.65 =C2=B1 13%  iostat.cpu.system
>       6.41            -2.1        4.29        mpstat.cpu.all.iowait%
>       0.02 =C2=B1  6%      -0.0        0.01 =C2=B1  4%  mpstat.cpu.all.so=
ft%
>       0.95 =C2=B1  4%      -0.3        0.64 =C2=B1 13%  mpstat.cpu.all.sy=
s%
>       0.07 =C2=B1  2%      -0.0        0.06 =C2=B1  3%  mpstat.cpu.all.us=
r%
>    3177396 =C2=B1  4%     -17.2%    2630192 =C2=B1  2%  numa-numastat.nod=
e0.local_node
>    3208408 =C2=B1  3%     -17.3%    2653430 =C2=B1  3%  numa-numastat.nod=
e0.numa_hit
>    3183435 =C2=B1  4%     -21.0%    2515397 =C2=B1  2%  numa-numastat.nod=
e1.local_node
>    3183678 =C2=B1  4%     -20.7%    2523398 =C2=B1  2%  numa-numastat.nod=
e1.numa_hit
>      92.00            +2.4%      94.25        vmstat.cpu.id
>     382.00           -30.6%     265.25        vmstat.io.bi
>      26136           -29.9%      18312        vmstat.io.bo
>       6.00           -37.5%       3.75 =C2=B1 11%  vmstat.procs.b
>      20123 =C2=B1  2%     -19.6%      16189        vmstat.system.cs
>    1044628           -21.1%     824233 =C2=B1  4%  meminfo.Active
>     758190           -28.5%     542058 =C2=B1  7%  meminfo.Active(file)
>     163791           +76.7%     289387 =C2=B1  6%  meminfo.Inactive
>     145927           +86.1%     271504 =C2=B1  6%  meminfo.Inactive(file)
>      10778           -11.3%       9561 =C2=B1  2%  meminfo.PageTables
>       9802 =C2=B1  2%     -10.0%       8822        meminfo.max_used_kB
>     393822 =C2=B1  4%     -27.8%     284411 =C2=B1  6%  numa-meminfo.node=
0.Active(file)
>      82276           +84.5%     151788 =C2=B1  6%  numa-meminfo.node0.Ina=
ctive
>      75693 =C2=B1  6%     +88.5%     142679 =C2=B1  7%  numa-meminfo.node=
0.Inactive(file)
>     507925           -30.0%     355305 =C2=B1 10%  numa-meminfo.node1.Act=
ive
>     364589 =C2=B1  5%     -29.3%     257593 =C2=B1  8%  numa-meminfo.node=
1.Active(file)
>      81386 =C2=B1  2%     +69.3%     137792 =C2=B1  7%  numa-meminfo.node=
1.Inactive
>      70106 =C2=B1  5%     +84.0%     129017 =C2=B1  5%  numa-meminfo.node=
1.Inactive(file)
>      50197 =C2=B1  5%     -11.4%      44453 =C2=B1  9%  numa-meminfo.node=
1.KReclaimable
>      50197 =C2=B1  5%     -11.4%      44453 =C2=B1  9%  numa-meminfo.node=
1.SReclaimable
>       9800           -18.9%       7948 =C2=B1  2%  slabinfo.Acpi-State.ac=
tive_objs
>       9800           -18.9%       7948 =C2=B1  2%  slabinfo.Acpi-State.nu=
m_objs
>      61202           -10.9%      54561        slabinfo.anon_vma_chain.act=
ive_objs
>     957.00           -10.9%     852.50        slabinfo.anon_vma_chain.act=
ive_slabs
>      61275           -10.9%      54584        slabinfo.anon_vma_chain.num=
_objs
>     957.00           -10.9%     852.50        slabinfo.anon_vma_chain.num=
_slabs
>       7797           -32.6%       5252 =C2=B1  5%  slabinfo.btrfs_inode.a=
ctive_objs
>       7797           -32.6%       5252 =C2=B1  5%  slabinfo.btrfs_inode.n=
um_objs
>      11253 =C2=B1  3%     -18.5%       9167 =C2=B1  5%  slabinfo.kmalloc-=
192.active_objs
>      11446 =C2=B1  3%     -18.2%       9362 =C2=B1  5%  slabinfo.kmalloc-=
192.num_objs
>      14849 =C2=B1  2%     -24.5%      11214 =C2=B1  9%  slabinfo.mnt_cach=
e.active_objs
>      15056           -24.2%      11408 =C2=B1  9%  slabinfo.mnt_cache.num=
_objs
>      53294           -21.2%      42015 =C2=B1  5%  slabinfo.numa_policy.a=
ctive_objs
>     864.00           -21.6%     677.50 =C2=B1  5%  slabinfo.numa_policy.a=
ctive_slabs
>      53592           -21.6%      42027 =C2=B1  5%  slabinfo.numa_policy.n=
um_objs
>     864.00           -21.6%     677.50 =C2=B1  5%  slabinfo.numa_policy.n=
um_slabs
>      98443 =C2=B1  4%     -27.7%      71126 =C2=B1  6%  numa-vmstat.node0=
.nr_active_file
>     388731 =C2=B1  4%     -19.3%     313594 =C2=B1  2%  numa-vmstat.node0=
.nr_dirtied
>      18914 =C2=B1  6%     +88.6%      35671 =C2=B1  7%  numa-vmstat.node0=
.nr_inactive_file
>     380485 =C2=B1  4%     -18.1%     311805 =C2=B1  2%  numa-vmstat.node0=
.nr_written
>      98443 =C2=B1  4%     -27.7%      71126 =C2=B1  6%  numa-vmstat.node0=
.nr_zone_active_file
>      18914 =C2=B1  6%     +88.6%      35671 =C2=B1  7%  numa-vmstat.node0=
.nr_zone_inactive_file
>    2280462 =C2=B1  3%     -11.6%    2015812 =C2=B1  7%  numa-vmstat.node0=
.numa_hit
>    2248911 =C2=B1  3%     -11.4%    1992035 =C2=B1  7%  numa-vmstat.node0=
.numa_local
>      91143 =C2=B1  5%     -29.3%      64421 =C2=B1  8%  numa-vmstat.node1=
.nr_active_file
>     365567 =C2=B1  4%     -20.3%     291379 =C2=B1  4%  numa-vmstat.node1=
.nr_dirtied
>      17511 =C2=B1  5%     +84.2%      32252 =C2=B1  5%  numa-vmstat.node1=
.nr_inactive_file
>      12549 =C2=B1  5%     -11.4%      11114 =C2=B1  9%  numa-vmstat.node1=
.nr_slab_reclaimable
>     357895 =C2=B1  4%     -19.1%     289635 =C2=B1  4%  numa-vmstat.node1=
.nr_written
>      91143 =C2=B1  5%     -29.3%      64421 =C2=B1  8%  numa-vmstat.node1=
.nr_zone_active_file
>      17511 =C2=B1  5%     +84.2%      32252 =C2=B1  5%  numa-vmstat.node1=
.nr_zone_inactive_file
>    2266610 =C2=B1  3%     -16.4%    1894459 =C2=B1  6%  numa-vmstat.node1=
.numa_hit
>    2086214 =C2=B1  3%     -18.2%    1706683 =C2=B1  6%  numa-vmstat.node1=
.numa_local
>      71614            -1.5%      70550        proc-vmstat.nr_active_anon
>     189614           -28.6%     135443 =C2=B1  7%  proc-vmstat.nr_active_=
file
>      70104            -1.4%      69155        proc-vmstat.nr_anon_pages
>    1488872           -19.1%    1204232 =C2=B1  2%  proc-vmstat.nr_dirtied
>     523478            -4.4%     500692        proc-vmstat.nr_file_pages
>      36441           +86.5%      67961 =C2=B1  6%  proc-vmstat.nr_inactiv=
e_file
>      19617            -2.9%      19052        proc-vmstat.nr_kernel_stack
>       2693           -11.3%       2390 =C2=B1  2%  proc-vmstat.nr_page_ta=
ble_pages
>      22683            -4.7%      21619        proc-vmstat.nr_slab_reclaim=
able
>      50336            -3.6%      48543        proc-vmstat.nr_slab_unrecla=
imable
>      89.00 =C2=B1 15%     -65.7%      30.50 =C2=B1 42%  proc-vmstat.nr_wr=
iteback
>    1455988           -17.8%    1196186 =C2=B1  2%  proc-vmstat.nr_written
>      71614            -1.5%      70550        proc-vmstat.nr_zone_active_=
anon
>     189614           -28.6%     135443 =C2=B1  7%  proc-vmstat.nr_zone_ac=
tive_file
>      36441           +86.5%      67961 =C2=B1  6%  proc-vmstat.nr_zone_in=
active_file
>       2776 =C2=B1107%     -99.0%      28.25 =C2=B1147%  proc-vmstat.numa_=
hint_faults_local
>    6417381           -18.9%    5202057        proc-vmstat.numa_hit
>    6386111           -19.0%    5170800        proc-vmstat.numa_local
>     306132           +14.7%     351100        proc-vmstat.pgactivate
>    6709006           -19.1%    5428521        proc-vmstat.pgalloc_normal
>       1457 =C2=B1  8%     -12.0%       1282 =C2=B1  3%  proc-vmstat.pgdea=
ctivate
>    7158861           -20.7%    5673879        proc-vmstat.pgfault
>    6408449           -19.9%    5130409        proc-vmstat.pgfree
>     138345           -25.7%     102836        proc-vmstat.pgpgin
>    9452237           -25.0%    7088229 =C2=B1  3%  proc-vmstat.pgpgout
>      26661           -20.8%      21116 =C2=B1  2%  proc-vmstat.pgrotated
>       1844 =C2=B1  7%     -33.1%       1234 =C2=B1 12%  sched_debug.cfs_r=
q:/.exec_clock.avg
>       1505 =C2=B1  7%     -38.7%     923.14 =C2=B1 14%  sched_debug.cfs_r=
q:/.exec_clock.min
>      54.76 =C2=B1 10%     +33.5%      73.09 =C2=B1 14%  sched_debug.cfs_r=
q:/.load_avg.stddev
>      95267 =C2=B1  6%     -10.4%      85364 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vruntime.max
>       9148 =C2=B1  7%     -17.4%       7559 =C2=B1 11%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       1.75 =C2=B1 10%     +35.4%       2.36 =C2=B1 10%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>     119.14 =C2=B1  6%     +47.1%     175.24 =C2=B1 11%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>      12.85 =C2=B1  5%     +45.6%      18.71 =C2=B1 11%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>       9148 =C2=B1  7%     -17.4%       7560 =C2=B1 11%  sched_debug.cfs_r=
q:/.spread0.stddev
>     111.56 =C2=B1 11%     -22.9%      86.03 =C2=B1  8%  sched_debug.cfs_r=
q:/.util_avg.avg
>       1.92 =C2=B1142%     -96.3%       0.07 =C2=B1173%  sched_debug.cfs_r=
q:/.util_avg.min
>      43523 =C2=B1  7%     -28.3%      31204 =C2=B1  7%  sched_debug.cpu.c=
urr->pid.max
>      36713 =C2=B1  7%     -21.7%      28764 =C2=B1  7%  sched_debug.cpu.n=
r_switches.avg
>      81053 =C2=B1  6%     -25.8%      60160 =C2=B1  6%  sched_debug.cpu.n=
r_switches.max
>      27742 =C2=B1  9%     -22.3%      21563 =C2=B1  7%  sched_debug.cpu.n=
r_switches.min
>       6727 =C2=B1  5%     -21.5%       5279 =C2=B1  5%  sched_debug.cpu.n=
r_switches.stddev
>      49.15 =C2=B1  9%     -25.3%      36.73 =C2=B1  5%  sched_debug.cpu.n=
r_uninterruptible.max
>      21.72 =C2=B1  5%     -28.2%      15.59 =C2=B1  7%  sched_debug.cpu.n=
r_uninterruptible.stddev
>      36248 =C2=B1  7%     -22.7%      28023 =C2=B1  7%  sched_debug.cpu.s=
ched_count.avg
>      79747 =C2=B1  6%     -26.2%      58891 =C2=B1  6%  sched_debug.cpu.s=
ched_count.max
>      27418 =C2=B1  9%     -23.6%      20937 =C2=B1  8%  sched_debug.cpu.s=
ched_count.min
>       6826 =C2=B1  5%     -23.6%       5213 =C2=B1  6%  sched_debug.cpu.s=
ched_count.stddev
>      17024 =C2=B1  7%     -22.6%      13178 =C2=B1  7%  sched_debug.cpu.s=
ched_goidle.avg
>      36338 =C2=B1  6%     -25.3%      27136 =C2=B1  6%  sched_debug.cpu.s=
ched_goidle.max
>      12859 =C2=B1  9%     -23.9%       9780 =C2=B1  8%  sched_debug.cpu.s=
ched_goidle.min
>       3065 =C2=B1  5%     -21.4%       2411 =C2=B1  6%  sched_debug.cpu.s=
ched_goidle.stddev
>      17247 =C2=B1  7%     -22.7%      13336 =C2=B1  7%  sched_debug.cpu.t=
twu_count.avg
>     158379 =C2=B1  8%     -26.5%     116451 =C2=B1  8%  sched_debug.cpu.t=
twu_count.max
>      10466 =C2=B1  9%     -21.9%       8171 =C2=B1  8%  sched_debug.cpu.t=
twu_count.min
>      14739 =C2=B1  8%     -26.7%      10796 =C2=B1  8%  sched_debug.cpu.t=
twu_count.stddev
>       1635 =C2=B1  8%     -18.2%       1338 =C2=B1  7%  sched_debug.cpu.t=
twu_local.avg
>      22339 =C2=B1  8%     -31.2%      15365 =C2=B1  7%  sched_debug.cpu.t=
twu_local.max
>     814.63 =C2=B1 15%     -22.1%     634.73 =C2=B1  6%  sched_debug.cpu.t=
twu_local.min
>       2155 =C2=B1  8%     -32.0%       1466 =C2=B1  7%  sched_debug.cpu.t=
twu_local.stddev
>      29.24 =C2=B1 56%     -30.4%      20.35 =C2=B1 70%  perf-stat.i.MPKI
>  3.626e+08 =C2=B1  3%     -16.0%  3.045e+08 =C2=B1  5%  perf-stat.i.branc=
h-instructions
>       3.86 =C2=B1 42%      -1.0        2.85 =C2=B1 44%  perf-stat.i.branc=
h-miss-rate%
>   14174438 =C2=B1 36%     -36.3%    9031272 =C2=B1 32%  perf-stat.i.branc=
h-misses
>   47929206 =C2=B1 53%     -43.8%   26957442 =C2=B1 60%  perf-stat.i.cache=
-references
>      20264 =C2=B1  2%     -19.7%      16279        perf-stat.i.context-sw=
itches
>  6.435e+09 =C2=B1 15%     -25.7%  4.779e+09 =C2=B1  9%  perf-stat.i.cpu-c=
ycles
>     635.90 =C2=B1  4%     -43.7%     358.03 =C2=B1  3%  perf-stat.i.cpu-m=
igrations
>  4.497e+08 =C2=B1  2%     -16.5%  3.756e+08 =C2=B1  5%  perf-stat.i.dTLB-=
loads
>  2.237e+08           -14.1%  1.923e+08 =C2=B1  4%  perf-stat.i.dTLB-stores
>  1.766e+09 =C2=B1  2%     -16.5%  1.474e+09 =C2=B1  5%  perf-stat.i.instr=
uctions
>       1312 =C2=B1 13%     -20.7%       1040 =C2=B1  9%  perf-stat.i.instr=
uctions-per-iTLB-miss
>       0.07 =C2=B1 15%     -25.7%       0.05 =C2=B1  9%  perf-stat.i.metri=
c.GHz
>      11.32           -17.0%       9.39 =C2=B1  3%  perf-stat.i.metric.M/s=
ec
>      19413 =C2=B1  2%     -26.0%      14368 =C2=B1  2%  perf-stat.i.minor=
-faults
>     852393 =C2=B1  2%     -24.3%     645664 =C2=B1  4%  perf-stat.i.node-=
load-misses
>     102904 =C2=B1  3%     -33.7%      68205 =C2=B1  4%  perf-stat.i.node-=
loads
>     338073 =C2=B1  2%     -25.7%     251343 =C2=B1  5%  perf-stat.i.node-=
store-misses
>      64597 =C2=B1 13%     -37.7%      40227 =C2=B1 21%  perf-stat.i.node-=
stores
>      19413 =C2=B1  2%     -26.0%      14368 =C2=B1  2%  perf-stat.i.page-=
faults
>      27.55 =C2=B1 55%     -31.9%      18.76 =C2=B1 66%  perf-stat.overall=
.MPKI
>       3.95 =C2=B1 38%      -0.9        3.01 =C2=B1 36%  perf-stat.overall=
.branch-miss-rate%
>       1324 =C2=B1 14%     -20.6%       1052 =C2=B1 10%  perf-stat.overall=
.instructions-per-iTLB-miss
>   15824784           +19.1%   18853609 =C2=B1  4%  perf-stat.overall.path=
-length
>  3.615e+08 =C2=B1  3%     -16.0%  3.037e+08 =C2=B1  5%  perf-stat.ps.bran=
ch-instructions
>   14134307 =C2=B1 36%     -36.3%    9007742 =C2=B1 32%  perf-stat.ps.bran=
ch-misses
>   47797365 =C2=B1 53%     -43.7%   26888329 =C2=B1 60%  perf-stat.ps.cach=
e-references
>      20207 =C2=B1  2%     -19.6%      16238        perf-stat.ps.context-s=
witches
>  6.417e+09 =C2=B1 15%     -25.7%  4.767e+09 =C2=B1  9%  perf-stat.ps.cpu-=
cycles
>     634.12 =C2=B1  4%     -43.7%     357.12 =C2=B1  3%  perf-stat.ps.cpu-=
migrations
>  4.484e+08 =C2=B1  2%     -16.5%  3.746e+08 =C2=B1  4%  perf-stat.ps.dTLB=
-loads
>  2.231e+08           -14.0%  1.918e+08 =C2=B1  4%  perf-stat.ps.dTLB-stor=
es
>  1.761e+09 =C2=B1  2%     -16.5%   1.47e+09 =C2=B1  5%  perf-stat.ps.inst=
ructions
>      19358 =C2=B1  2%     -26.0%      14330 =C2=B1  2%  perf-stat.ps.mino=
r-faults
>     850011 =C2=B1  2%     -24.2%     644018 =C2=B1  4%  perf-stat.ps.node=
-load-misses
>     102630 =C2=B1  3%     -33.7%      68042 =C2=B1  4%  perf-stat.ps.node=
-loads
>     337128 =C2=B1  2%     -25.6%     250695 =C2=B1  5%  perf-stat.ps.node=
-store-misses
>      64423 =C2=B1 13%     -37.7%      40127 =C2=B1 21%  perf-stat.ps.node=
-stores
>      19358 =C2=B1  2%     -26.0%      14330 =C2=B1  2%  perf-stat.ps.page=
-faults
>   6.33e+11           -10.6%  5.656e+11 =C2=B1  4%  perf-stat.total.instru=
ctions
>     100667           -14.7%      85872        softirqs.BLOCK
>      60141           +17.3%      70538        softirqs.CPU0.RCU
>      63937 =C2=B1  5%     +12.6%      72018 =C2=B1  2%  softirqs.CPU10.RCU
>      62649 =C2=B1 11%     +17.6%      73663 =C2=B1  2%  softirqs.CPU12.RCU
>      62307 =C2=B1  4%     +13.9%      70968        softirqs.CPU13.RCU
>      62419 =C2=B1  5%     +13.7%      70983        softirqs.CPU14.RCU
>      60854           +15.2%      70118 =C2=B1  3%  softirqs.CPU16.RCU
>      62245 =C2=B1  3%     +13.6%      70738 =C2=B1  3%  softirqs.CPU17.RCU
>      62187 =C2=B1  2%     +15.2%      71660 =C2=B1  3%  softirqs.CPU18.RCU
>      62576 =C2=B1  2%     +14.1%      71421 =C2=B1  3%  softirqs.CPU19.RCU
>      63593 =C2=B1  5%     +14.1%      72579 =C2=B1  3%  softirqs.CPU2.RCU
>      62793 =C2=B1  2%     +14.4%      71859 =C2=B1  2%  softirqs.CPU20.RCU
>      61362           +15.7%      70991 =C2=B1  3%  softirqs.CPU21.RCU
>      62651 =C2=B1  2%     +13.4%      71066 =C2=B1  4%  softirqs.CPU22.RCU
>      62138 =C2=B1  3%     +14.9%      71384 =C2=B1  3%  softirqs.CPU23.RCU
>      62643           +13.9%      71337 =C2=B1  4%  softirqs.CPU24.RCU
>      60674           +16.2%      70500 =C2=B1  4%  softirqs.CPU25.RCU
>      60125 =C2=B1  2%     +16.7%      70195 =C2=B1  4%  softirqs.CPU26.RCU
>      61988 =C2=B1  2%     +14.5%      70986 =C2=B1  3%  softirqs.CPU27.RCU
>      62161 =C2=B1  2%     +14.2%      71010 =C2=B1  2%  softirqs.CPU29.RCU
>      62196 =C2=B1  2%     +14.2%      71030 =C2=B1  2%  softirqs.CPU30.RCU
>      61878 =C2=B1  2%     +12.2%      69444 =C2=B1  4%  softirqs.CPU31.RCU
>      63376 =C2=B1  4%     +11.7%      70774 =C2=B1  2%  softirqs.CPU33.RCU
>      62797 =C2=B1  3%     +14.2%      71719        softirqs.CPU36.RCU
>      63162 =C2=B1  4%     +12.3%      70932        softirqs.CPU39.RCU
>      62956 =C2=B1  4%     +13.1%      71204 =C2=B1  2%  softirqs.CPU41.RCU
>      61758 =C2=B1  2%     +13.6%      70144        softirqs.CPU42.RCU
>      61374           +19.4%      73261        softirqs.CPU48.RCU
>      63016 =C2=B1  2%     +15.4%      72724        softirqs.CPU49.RCU
>      65073 =C2=B1  6%     +11.1%      72314        softirqs.CPU5.RCU
>      64069 =C2=B1  5%     +15.3%      73902 =C2=B1  2%  softirqs.CPU50.RCU
>      65325 =C2=B1  6%     +12.2%      73274        softirqs.CPU51.RCU
>      65316 =C2=B1  6%     +11.5%      72824 =C2=B1  2%  softirqs.CPU52.RCU
>      64811 =C2=B1  6%     +13.2%      73390        softirqs.CPU53.RCU
>      64697 =C2=B1  6%     +13.4%      73341        softirqs.CPU54.RCU
>      64966 =C2=B1  5%     +14.5%      74379        softirqs.CPU55.RCU
>      65101 =C2=B1  5%     +14.2%      74361        softirqs.CPU56.RCU
>      65644 =C2=B1  6%     +13.7%      74637 =C2=B1  2%  softirqs.CPU57.RCU
>      64201 =C2=B1  5%     +14.7%      73664        softirqs.CPU58.RCU
>      64557 =C2=B1  6%     +14.7%      74025 =C2=B1  2%  softirqs.CPU59.RCU
>      64884 =C2=B1  6%     +11.7%      72453        softirqs.CPU6.RCU
>      65105 =C2=B1  6%     +13.7%      74019        softirqs.CPU60.RCU
>      63695 =C2=B1  3%     +15.8%      73787        softirqs.CPU61.RCU
>      63720 =C2=B1  5%     +14.9%      73243 =C2=B1  2%  softirqs.CPU62.RCU
>      64893 =C2=B1  5%     +14.0%      73992        softirqs.CPU63.RCU
>      61359 =C2=B1  2%     +17.6%      72168 =C2=B1  4%  softirqs.CPU64.RCU
>      63378 =C2=B1  3%     +13.1%      71687 =C2=B1  4%  softirqs.CPU65.RCU
>      63198 =C2=B1  2%     +15.4%      72913 =C2=B1  3%  softirqs.CPU66.RCU
>      62881 =C2=B1  2%     +16.2%      73041 =C2=B1  4%  softirqs.CPU67.RCU
>      63601 =C2=B1  2%     +14.4%      72792 =C2=B1  2%  softirqs.CPU68.RCU
>      62434           +15.3%      71994 =C2=B1  4%  softirqs.CPU69.RCU
>      64013 =C2=B1  4%     +11.6%      71456        softirqs.CPU7.RCU
>      62883 =C2=B1  2%     +15.2%      72467 =C2=B1  4%  softirqs.CPU70.RCU
>      62818 =C2=B1  2%     +15.5%      72584 =C2=B1  4%  softirqs.CPU71.RCU
>      62226           +15.1%      71598 =C2=B1  5%  softirqs.CPU72.RCU
>      60714 =C2=B1  2%     +17.3%      71207 =C2=B1  4%  softirqs.CPU73.RCU
>      60463 =C2=B1  2%     +18.4%      71587 =C2=B1  5%  softirqs.CPU74.RCU
>      62460           +14.9%      71746 =C2=B1  3%  softirqs.CPU75.RCU
>      62215 =C2=B1  2%     +16.3%      72328 =C2=B1  6%  softirqs.CPU76.RCU
>      62743 =C2=B1  2%     +14.1%      71611 =C2=B1  3%  softirqs.CPU77.RCU
>      62533           +14.7%      71715 =C2=B1  3%  softirqs.CPU78.RCU
>      61946           +15.0%      71227 =C2=B1  5%  softirqs.CPU79.RCU
>      63756 =C2=B1  6%     +13.6%      72416 =C2=B1  2%  softirqs.CPU8.RCU
>      64308 =C2=B1  4%     +13.3%      72856        softirqs.CPU81.RCU
>      63725 =C2=B1  3%     +14.6%      73053        softirqs.CPU85.RCU
>      64254 =C2=B1  4%     +13.1%      72670        softirqs.CPU86.RCU
>      63584 =C2=B1  4%     +14.1%      72546        softirqs.CPU87.RCU
>      61794 =C2=B1  8%     +17.0%      72310 =C2=B1  2%  softirqs.CPU9.RCU
>      62085 =C2=B1  2%     +16.1%      72067        softirqs.CPU90.RCU
>    6086570 =C2=B1  3%     +13.5%    6907274        softirqs.RCU
>       7.91 =C2=B1 31%      -4.9        3.00 =C2=B1 39%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       7.90 =C2=B1 31%      -4.9        3.00 =C2=B1 39%  perf-profile.call=
trace.cycles-pp.btrfs_file_write_iter.new_sync_write.vfs_write.ksys_write.d=
o_syscall_64
>       7.91 =C2=B1 31%      -4.9        3.01 =C2=B1 39%  perf-profile.call=
trace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       7.91 =C2=B1 31%      -4.9        3.01 =C2=B1 39%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>       7.45 =C2=B1 33%      -4.9        2.59 =C2=B1 40%  perf-profile.call=
trace.cycles-pp.btrfs_sync_file.btrfs_file_write_iter.new_sync_write.vfs_wr=
ite.ksys_write
>       6.33 =C2=B1 36%      -4.4        1.95 =C2=B1 40%  perf-profile.call=
trace.cycles-pp.btrfs_log_dentry_safe.btrfs_sync_file.btrfs_file_write_iter=
.new_sync_write.vfs_write
>       6.32 =C2=B1 36%      -4.4        1.95 =C2=B1 40%  perf-profile.call=
trace.cycles-pp.btrfs_log_inode_parent.btrfs_log_dentry_safe.btrfs_sync_fil=
e.btrfs_file_write_iter.new_sync_write
>       5.96 =C2=B1 38%      -4.3        1.66 =C2=B1 47%  perf-profile.call=
trace.cycles-pp.btrfs_log_inode.btrfs_log_inode_parent.btrfs_log_dentry_saf=
e.btrfs_sync_file.btrfs_file_write_iter
>       3.74 =C2=B1 38%      -2.8        0.95 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.btrfs_log_changed_extents.btrfs_log_inode.btrfs_log_inode_p=
arent.btrfs_log_dentry_safe.btrfs_sync_file
>       3.74 =C2=B1 38%      -2.8        0.95 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.log_one_extent.btrfs_log_changed_extents.btrfs_log_inode.bt=
rfs_log_inode_parent.btrfs_log_dentry_safe
>       2.51 =C2=B1 39%      -1.9        0.56 =C2=B1100%  perf-profile.call=
trace.cycles-pp.btrfs_csum_file_blocks.log_one_extent.btrfs_log_changed_ext=
ents.btrfs_log_inode.btrfs_log_inode_parent
>       1.64 =C2=B1 17%      -0.8        0.81 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>       1.64 =C2=B1 17%      -0.8        0.81 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>       1.64 =C2=B1 17%      -0.8        0.81 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>       0.85 =C2=B1 25%      -0.6        0.28 =C2=B1100%  perf-profile.call=
trace.cycles-pp.btrfs_commit_transaction.iterate_supers.ksys_sync.__x64_sys=
_sync.do_syscall_64
>       0.66 =C2=B1 14%      -0.4        0.27 =C2=B1100%  perf-profile.call=
trace.cycles-pp.tlb_flush_mmu.tlb_finish_mmu.exit_mmap.mmput.do_exit
>       0.66 =C2=B1 14%      -0.4        0.27 =C2=B1100%  perf-profile.call=
trace.cycles-pp.tlb_finish_mmu.exit_mmap.mmput.do_exit.do_group_exit
>       0.54 =C2=B1  4%      +0.1        0.66 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.hrtimer_next_event_without.tick_nohz_get_sleep_length.menu_=
select.do_idle.cpu_startup_entry
>       0.96 =C2=B1  9%      +0.2        1.14 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_=
sched_timer.__hrtimer_run_queues
>       1.15 =C2=B1  8%      +0.2        1.38 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__next_timer_interrupt.get_next_timer_interrupt.tick_nohz_n=
ext_event.tick_nohz_get_sleep_length.menu_select
>       0.62 =C2=B1 16%      +0.3        0.90 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.rcu_core.__softirqentry_text_start.irq_exit.smp_apic_timer_=
interrupt.apic_timer_interrupt
>       0.56 =C2=B1  6%      +0.3        0.87 =C2=B1 29%  perf-profile.call=
trace.cycles-pp.load_balance.rebalance_domains.__softirqentry_text_start.ir=
q_exit.smp_apic_timer_interrupt
>       2.88 =C2=B1  3%      +0.3        3.22 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrt=
imer_interrupt.smp_apic_timer_interrupt
>       1.90 =C2=B1  3%      +0.3        2.25        perf-profile.calltrace=
.cycles-pp.get_next_timer_interrupt.tick_nohz_next_event.tick_nohz_get_slee=
p_length.menu_select.do_idle
>       2.70 =C2=B1  3%      +0.4        3.08 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__h=
rtimer_run_queues.hrtimer_interrupt
>       0.92 =C2=B1  6%      +0.6        1.48 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.rebalance_domains.__softirqentry_text_start.irq_exit.smp_ap=
ic_timer_interrupt.apic_timer_interrupt
>       0.88 =C2=B1 41%      +0.6        1.48 =C2=B1 21%  perf-profile.call=
trace.cycles-pp.tick_nohz_irq_exit.irq_exit.smp_apic_timer_interrupt.apic_t=
imer_interrupt.cpuidle_enter_state
>       3.67 =C2=B1  7%      +0.7        4.40 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp=
_apic_timer_interrupt.apic_timer_interrupt
>       2.76 =C2=B1  8%      +0.8        3.57 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select=
.do_idle.cpu_startup_entry
>       5.82 =C2=B1  3%      +0.9        6.69 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_inter=
rupt.apic_timer_interrupt.cpuidle_enter_state
>       3.45 =C2=B1  5%      +1.0        4.43 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_=
entry.start_secondary
>       0.00            +1.1        1.11 =C2=B1 35%  perf-profile.calltrace=
.cycles-pp.btrfs_create.lookup_open.do_last.path_openat.do_filp_open
>       0.13 =C2=B1173%      +1.1        1.26 =C2=B1 33%  perf-profile.call=
trace.cycles-pp.lookup_open.do_last.path_openat.do_filp_open.do_sys_open
>       3.18 =C2=B1 15%      +1.2        4.33 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.irq_exit.smp_apic_timer_interrupt=
.apic_timer_interrupt.cpuidle_enter_state
>       0.29 =C2=B1100%      +1.2        1.44 =C2=B1 35%  perf-profile.call=
trace.cycles-pp.do_last.path_openat.do_filp_open.do_sys_open.do_syscall_64
>       0.32 =C2=B1100%      +1.2        1.52 =C2=B1 34%  perf-profile.call=
trace.cycles-pp.path_openat.do_filp_open.do_sys_open.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>       0.32 =C2=B1100%      +1.2        1.52 =C2=B1 34%  perf-profile.call=
trace.cycles-pp.do_filp_open.do_sys_open.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
>       0.33 =C2=B1100%      +1.2        1.54 =C2=B1 34%  perf-profile.call=
trace.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.00            +1.2        1.24 =C2=B1 37%  perf-profile.calltrace=
.cycles-pp.btrfs_unlink.vfs_unlink.do_unlinkat.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>       0.00            +1.2        1.25 =C2=B1 36%  perf-profile.calltrace=
.cycles-pp.vfs_unlink.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
>       4.55 =C2=B1 18%      +1.8        6.38 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpui=
dle_enter_state.cpuidle_enter
>       0.71 =C2=B1 11%      +1.9        2.66 =C2=B1 41%  perf-profile.call=
trace.cycles-pp.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      17.20 =C2=B1  8%      +4.0       21.17 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter=
_state.cpuidle_enter.do_idle
>      20.46 =C2=B1  9%      +4.6       25.07 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_i=
dle.cpu_startup_entry
>       7.95 =C2=B1 31%      -4.9        3.04 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       7.95 =C2=B1 31%      -4.9        3.04 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.ksys_write
>       7.93 =C2=B1 31%      -4.9        3.03 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>       7.90 =C2=B1 31%      -4.9        3.00 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.btrfs_file_write_iter
>       7.45 =C2=B1 33%      -4.9        2.59 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.btrfs_sync_file
>       6.33 =C2=B1 36%      -4.4        1.95 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.btrfs_log_dentry_safe
>       6.32 =C2=B1 36%      -4.4        1.95 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.btrfs_log_inode_parent
>       5.96 =C2=B1 38%      -4.3        1.66 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.btrfs_log_inode
>       3.74 =C2=B1 38%      -2.7        1.07 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.btrfs_log_changed_extents
>       3.74 =C2=B1 38%      -2.7        1.07 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.log_one_extent
>       2.63 =C2=B1 38%      -1.8        0.81 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.btrfs_csum_file_blocks
>       2.59 =C2=B1 28%      -1.2        1.37 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.__btrfs_drop_extents
>       2.34 =C2=B1 28%      -1.1        1.26 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_file_extent
>       1.07 =C2=B1 37%      -0.7        0.33 =C2=B1 52%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_csum
>       1.65 =C2=B1 16%      -0.7        0.94 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.do_exit
>       1.65 =C2=B1 16%      -0.7        0.94 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.__x64_sys_exit_group
>       1.65 =C2=B1 16%      -0.7        0.94 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.do_group_exit
>       0.65 =C2=B1 29%      -0.4        0.21 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.btrfs_run_delayed_refs
>       0.65 =C2=B1 29%      -0.4        0.21 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.__btrfs_run_delayed_refs
>       0.85 =C2=B1 16%      -0.4        0.41 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.osq_lock
>       0.60 =C2=B1 28%      -0.4        0.17 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.btrfs_run_delayed_refs_for_head
>       0.72 =C2=B1 27%      -0.4        0.32 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.queued_write_lock_slowpath
>       0.89 =C2=B1 25%      -0.4        0.50 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.btrfs_commit_transaction
>       0.84 =C2=B1 16%      -0.4        0.47 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.__mutex_lock
>       0.63 =C2=B1 45%      -0.3        0.28 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.queued_read_lock_slowpath
>       0.52 =C2=B1 25%      -0.3        0.20 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.wait_log_commit
>       0.72 =C2=B1 15%      -0.3        0.41 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.tlb_flush_mmu
>       0.72 =C2=B1 15%      -0.3        0.41 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.tlb_finish_mmu
>       0.55 =C2=B1 25%      -0.3        0.24 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.btrfs_sync_log
>       0.67 =C2=B1 15%      -0.3        0.38 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.release_pages
>       0.48 =C2=B1 30%      -0.3        0.21 =C2=B1 63%  perf-profile.chil=
dren.cycles-pp.iterate_bdevs
>       0.35 =C2=B1 29%      -0.3        0.10 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.__btrfs_free_extent
>       0.87 =C2=B1 17%      -0.3        0.62 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.__handle_mm_fault
>       0.90 =C2=B1 17%      -0.2        0.65 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.handle_mm_fault
>       0.27 =C2=B1 36%      -0.2        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.lookup_inline_extent_backref
>       0.39 =C2=B1 12%      -0.2        0.16 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.__do_sys_wait4
>       0.39 =C2=B1 12%      -0.2        0.16 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.kernel_wait4
>       0.39 =C2=B1 11%      -0.2        0.15 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.do_wait
>       0.43 =C2=B1 29%      -0.2        0.23 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.setup_items_for_insert
>       0.20 =C2=B1 24%      -0.2        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.alloc_reserved_file_extent
>       0.20 =C2=B1 54%      -0.2        0.05 =C2=B1106%  perf-profile.chil=
dren.cycles-pp.btrfs_next_old_leaf
>       0.28 =C2=B1 29%      -0.1        0.14 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.btrfs_unlock_up_safe
>       0.30 =C2=B1 17%      -0.1        0.15 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.start_ordered_ops
>       0.22 =C2=B1 14%      -0.1        0.10 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.wait4
>       0.19 =C2=B1 11%      -0.1        0.08 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.wait_task_zombie
>       0.19 =C2=B1 13%      -0.1        0.08 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.release_task
>       0.23 =C2=B1 23%      -0.1        0.15 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.page_remove_rmap
>       0.30 =C2=B1  7%      -0.1        0.22 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.16 =C2=B1 22%      -0.1        0.09 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.copy_page
>       0.28 =C2=B1 15%      -0.1        0.21 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.mmap_region
>       0.11 =C2=B1 12%      -0.1        0.04 =C2=B1106%  perf-profile.chil=
dren.cycles-pp.blk_flush_plug_list
>       0.11 =C2=B1 13%      -0.1        0.04 =C2=B1106%  perf-profile.chil=
dren.cycles-pp.blk_mq_flush_plug_list
>       0.10 =C2=B1 10%      -0.1        0.04 =C2=B1106%  perf-profile.chil=
dren.cycles-pp.blk_finish_plug
>       0.11 =C2=B1 10%      -0.1        0.04 =C2=B1106%  perf-profile.chil=
dren.cycles-pp.blk_mq_sched_insert_requests
>       0.13 =C2=B1  8%      -0.1        0.07 =C2=B1 62%  perf-profile.chil=
dren.cycles-pp.do_wp_page
>       0.08 =C2=B1 19%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.unlock_page
>       0.11 =C2=B1  7%      -0.1        0.06 =C2=B1 62%  perf-profile.chil=
dren.cycles-pp.wp_page_copy
>       0.18 =C2=B1 16%      -0.0        0.13 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.rcu_irq_enter
>       0.09 =C2=B1 13%      -0.0        0.05 =C2=B1 61%  perf-profile.chil=
dren.cycles-pp.btrfs_submit_bio_hook
>       0.09 =C2=B1 17%      -0.0        0.07 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__vm_munmap
>       0.12 =C2=B1 15%      +0.0        0.16 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.cpumask_next_and
>       0.10 =C2=B1  8%      +0.0        0.14 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.find_next_and_bit
>       0.04 =C2=B1 60%      +0.0        0.09 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.__btrfs_run_delayed_items
>       0.06 =C2=B1 62%      +0.1        0.13 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.tick_check_broadcast_expired
>       0.15 =C2=B1 12%      +0.1        0.22 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.call_cpuidle
>       0.25 =C2=B1  9%      +0.1        0.33 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irq
>       0.00            +0.1        0.10 =C2=B1 31%  perf-profile.children.=
cycles-pp.btrfs_del_dir_entries_in_log
>       0.00            +0.1        0.10 =C2=B1 52%  perf-profile.children.=
cycles-pp.btrfs_del_inode_ref
>       0.00            +0.1        0.11 =C2=B1 48%  perf-profile.children.=
cycles-pp.btrfs_del_inode_ref_in_log
>       0.01 =C2=B1173%      +0.1        0.14 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup
>       0.01 =C2=B1173%      +0.1        0.14 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_dentry
>       0.56 =C2=B1  4%      +0.1        0.69 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.hrtimer_next_event_without
>       0.34 =C2=B1 13%      +0.1        0.48 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.io_serial_in
>       0.28 =C2=B1 17%      +0.1        0.43 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.note_gp_changes
>       0.79 =C2=B1 13%      +0.2        0.95 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.find_next_bit
>       1.02 =C2=B1 11%      +0.2        1.19 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.84 =C2=B1  7%      +0.2        1.06 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.read_tsc
>       1.30 =C2=B1  8%      +0.2        1.54 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__next_timer_interrupt
>       0.34 =C2=B1 28%      +0.2        0.59 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp._raw_spin_trylock
>       0.10 =C2=B1 15%      +0.2        0.35 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.btrfs_orphan_add
>       0.10 =C2=B1 15%      +0.2        0.35 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.btrfs_insert_orphan_item
>       0.64 =C2=B1 16%      +0.3        0.92 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.rcu_core
>       0.08 =C2=B1 14%      +0.3        0.36 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.btrfs_del_orphan_item
>       0.17 =C2=B1 33%      +0.3        0.47 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.btrfs_insert_dir_item
>       0.16 =C2=B1 34%      +0.3        0.46 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.insert_with_overflow
>       0.18 =C2=B1 31%      +0.3        0.49 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.btrfs_add_link
>       2.97 =C2=B1  3%      +0.3        3.29 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       1.93 =C2=B1  3%      +0.3        2.28        perf-profile.children.=
cycles-pp.get_next_timer_interrupt
>       2.80 =C2=B1  4%      +0.4        3.17 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.12 =C2=B1 29%      +0.4        0.56 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.btrfs_new_inode
>       0.15 =C2=B1 15%      +0.5        0.62 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_dir_item
>       0.94 =C2=B1  7%      +0.5        1.49 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.rebalance_domains
>       0.24 =C2=B1 17%      +0.6        0.83 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.btrfs_unlink_inode
>       0.24 =C2=B1 16%      +0.6        0.83 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.__btrfs_unlink_inode
>       0.90 =C2=B1 41%      +0.6        1.51 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.tick_nohz_irq_exit
>       3.79 =C2=B1  8%      +0.7        4.49 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       0.33 =C2=B1 32%      +0.8        1.11 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.btrfs_create
>       2.81 =C2=B1  7%      +0.8        3.63 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       5.99 =C2=B1  3%      +0.9        6.85 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.37 =C2=B1 15%      +0.9        1.25 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.vfs_unlink
>       0.36 =C2=B1 14%      +0.9        1.24 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.btrfs_unlink
>       0.37 =C2=B1 30%      +0.9        1.26 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.lookup_open
>       0.65 =C2=B1 21%      +1.0        1.62 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.path_openat
>       0.65 =C2=B1 21%      +1.0        1.62 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       3.51 =C2=B1  6%      +1.0        4.48 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       0.63 =C2=B1 23%      +1.0        1.61 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.do_sys_open
>       0.51 =C2=B1 25%      +1.0        1.49 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.do_last
>       0.34 =C2=B1  7%      +1.0        1.35 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.evict
>       0.34 =C2=B1  8%      +1.0        1.35 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.btrfs_evict_inode
>       3.50 =C2=B1 14%      +1.1        4.63 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>       4.92 =C2=B1 16%      +1.8        6.73 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.irq_exit
>       0.72 =C2=B1 11%      +1.9        2.66 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.do_unlinkat
>      17.65 =C2=B1  8%      +3.9       21.52 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.smp_apic_timer_interrupt
>      19.41 =C2=B1  9%      +4.2       23.61 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.apic_timer_interrupt
>       0.84 =C2=B1 16%      -0.4        0.41 =C2=B1 34%  perf-profile.self=
.cycles-pp.osq_lock
>       0.16 =C2=B1 22%      -0.1        0.09 =C2=B1 44%  perf-profile.self=
.cycles-pp.copy_page
>       0.08 =C2=B1 19%      -0.1        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.unlock_page
>       0.10 =C2=B1 12%      -0.0        0.06 =C2=B1 28%  perf-profile.self=
.cycles-pp.update_load_avg
>       0.04 =C2=B1 58%      +0.0        0.07 =C2=B1 12%  perf-profile.self=
.cycles-pp.retint_kernel
>       0.09 =C2=B1  8%      +0.0        0.13 =C2=B1  9%  perf-profile.self=
.cycles-pp.find_next_and_bit
>       0.11 =C2=B1  7%      +0.0        0.16 =C2=B1 13%  perf-profile.self=
.cycles-pp.sched_clock_cpu
>       0.01 =C2=B1173%      +0.1        0.08 =C2=B1 27%  perf-profile.self=
.cycles-pp.run_timer_softirq
>       0.15 =C2=B1 12%      +0.1        0.21 =C2=B1  6%  perf-profile.self=
.cycles-pp.call_cpuidle
>       0.17 =C2=B1 20%      +0.1        0.24 =C2=B1 11%  perf-profile.self=
.cycles-pp.rcu_idle_exit
>       0.06 =C2=B1 62%      +0.1        0.12 =C2=B1 13%  perf-profile.self=
.cycles-pp.tick_check_broadcast_expired
>       0.24 =C2=B1 10%      +0.1        0.32 =C2=B1 12%  perf-profile.self=
.cycles-pp._raw_spin_lock_irq
>       0.15 =C2=B1 23%      +0.1        0.25 =C2=B1 14%  perf-profile.self=
.cycles-pp.note_gp_changes
>       0.18 =C2=B1 14%      +0.1        0.28 =C2=B1 14%  perf-profile.self=
.cycles-pp.tsc_verify_tsc_adjust
>       0.63 =C2=B1  4%      +0.1        0.73 =C2=B1  7%  perf-profile.self=
.cycles-pp.__next_timer_interrupt
>       0.54 =C2=B1 14%      +0.1        0.67 =C2=B1  8%  perf-profile.self=
.cycles-pp._raw_spin_unlock_irqrestore
>       0.34 =C2=B1 13%      +0.1        0.48 =C2=B1 14%  perf-profile.self=
.cycles-pp.io_serial_in
>       0.33 =C2=B1 21%      +0.1        0.48 =C2=B1 12%  perf-profile.self=
.cycles-pp.__softirqentry_text_start
>       0.52 =C2=B1 12%      +0.2        0.69 =C2=B1  4%  perf-profile.self=
.cycles-pp.do_idle
>       0.81 =C2=B1  7%      +0.2        1.04 =C2=B1  9%  perf-profile.self=
.cycles-pp.read_tsc
>       0.34 =C2=B1 28%      +0.2        0.58 =C2=B1 18%  perf-profile.self=
.cycles-pp._raw_spin_trylock
>       2.17 =C2=B1  4%      +0.3        2.47 =C2=B1  5%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>     201960           -14.9%     171842        interrupts.316:PCI-MSI.3768=
32-edge.ahci[0000:00:17.0]
>     308.00 =C2=B1  5%     +17.7%     362.50 =C2=B1  8%  interrupts.35:PCI=
-MSI.31981568-edge.i40e-0000:3d:00.0:misc
>     151734           -13.9%     130662 =C2=B1  3%  interrupts.CAL:Functio=
n_call_interrupts
>     114.25 =C2=B1 11%     -32.6%      77.00 =C2=B1 26%  interrupts.CPU0.T=
LB:TLB_shootdowns
>     584.00           -10.5%     522.75 =C2=B1  2%  interrupts.CPU1.CAL:Fu=
nction_call_interrupts
>     343.25 =C2=B1 22%     -41.1%     202.25 =C2=B1 41%  interrupts.CPU1.N=
MI:Non-maskable_interrupts
>     343.25 =C2=B1 22%     -41.1%     202.25 =C2=B1 41%  interrupts.CPU1.P=
MI:Performance_monitoring_interrupts
>     147.00 =C2=B1  7%     -42.3%      84.75 =C2=B1 18%  interrupts.CPU1.T=
LB:TLB_shootdowns
>     325.25 =C2=B1 13%     -50.0%     162.75 =C2=B1 37%  interrupts.CPU10.=
NMI:Non-maskable_interrupts
>     325.25 =C2=B1 13%     -50.0%     162.75 =C2=B1 37%  interrupts.CPU10.=
PMI:Performance_monitoring_interrupts
>     528.75 =C2=B1  6%     -15.4%     447.25 =C2=B1  2%  interrupts.CPU10.=
RES:Rescheduling_interrupts
>     145.50 =C2=B1 10%     -37.1%      91.50 =C2=B1 19%  interrupts.CPU10.=
TLB:TLB_shootdowns
>     590.75 =C2=B1  6%     -11.0%     525.50 =C2=B1  2%  interrupts.CPU11.=
CAL:Function_call_interrupts
>     344.00 =C2=B1 17%     -44.7%     190.25 =C2=B1 27%  interrupts.CPU11.=
NMI:Non-maskable_interrupts
>     344.00 =C2=B1 17%     -44.7%     190.25 =C2=B1 27%  interrupts.CPU11.=
PMI:Performance_monitoring_interrupts
>     548.00 =C2=B1  7%     -30.6%     380.50 =C2=B1  7%  interrupts.CPU11.=
RES:Rescheduling_interrupts
>     153.25 =C2=B1 21%     -42.9%      87.50 =C2=B1 10%  interrupts.CPU11.=
TLB:TLB_shootdowns
>     577.00            -9.7%     521.25        interrupts.CPU12.CAL:Functi=
on_call_interrupts
>     305.25 =C2=B1 28%     -44.3%     170.00 =C2=B1 33%  interrupts.CPU12.=
NMI:Non-maskable_interrupts
>     305.25 =C2=B1 28%     -44.3%     170.00 =C2=B1 33%  interrupts.CPU12.=
PMI:Performance_monitoring_interrupts
>     524.75 =C2=B1  8%     -14.8%     447.25 =C2=B1  6%  interrupts.CPU12.=
RES:Rescheduling_interrupts
>     139.50 =C2=B1  4%     -38.7%      85.50 =C2=B1  6%  interrupts.CPU12.=
TLB:TLB_shootdowns
>     601.25 =C2=B1  4%     -11.2%     534.00 =C2=B1  4%  interrupts.CPU13.=
CAL:Function_call_interrupts
>     351.50 =C2=B1 17%     -46.9%     186.50 =C2=B1 29%  interrupts.CPU13.=
NMI:Non-maskable_interrupts
>     351.50 =C2=B1 17%     -46.9%     186.50 =C2=B1 29%  interrupts.CPU13.=
PMI:Performance_monitoring_interrupts
>     545.75 =C2=B1  6%     -22.7%     422.00 =C2=B1 12%  interrupts.CPU13.=
RES:Rescheduling_interrupts
>     164.50 =C2=B1 18%     -41.6%      96.00 =C2=B1 20%  interrupts.CPU13.=
TLB:TLB_shootdowns
>     578.00 =C2=B1  2%     -11.2%     513.00        interrupts.CPU14.CAL:F=
unction_call_interrupts
>     339.00 =C2=B1 20%     -41.7%     197.50 =C2=B1 26%  interrupts.CPU14.=
NMI:Non-maskable_interrupts
>     339.00 =C2=B1 20%     -41.7%     197.50 =C2=B1 26%  interrupts.CPU14.=
PMI:Performance_monitoring_interrupts
>     146.00 =C2=B1  7%     -48.6%      75.00 =C2=B1 15%  interrupts.CPU14.=
TLB:TLB_shootdowns
>     542.50 =C2=B1  9%     -19.0%     439.25        interrupts.CPU15.RES:R=
escheduling_interrupts
>     147.75 =C2=B1 13%     -37.4%      92.50 =C2=B1 25%  interrupts.CPU15.=
TLB:TLB_shootdowns
>     139.00 =C2=B1 16%     -40.3%      83.00 =C2=B1 17%  interrupts.CPU16.=
TLB:TLB_shootdowns
>     605.50 =C2=B1  2%     -15.1%     514.25 =C2=B1  6%  interrupts.CPU17.=
CAL:Function_call_interrupts
>     168.00 =C2=B1  8%     -54.6%      76.25 =C2=B1 39%  interrupts.CPU17.=
TLB:TLB_shootdowns
>     573.25 =C2=B1  4%      -8.0%     527.50 =C2=B1  2%  interrupts.CPU2.C=
AL:Function_call_interrupts
>     339.00 =C2=B1 14%     -39.3%     205.75 =C2=B1 44%  interrupts.CPU2.N=
MI:Non-maskable_interrupts
>     339.00 =C2=B1 14%     -39.3%     205.75 =C2=B1 44%  interrupts.CPU2.P=
MI:Performance_monitoring_interrupts
>     875.50 =C2=B1  4%     -24.9%     657.50 =C2=B1  3%  interrupts.CPU20.=
RES:Rescheduling_interrupts
>     846.25 =C2=B1  6%     -26.6%     621.00 =C2=B1  6%  interrupts.CPU21.=
RES:Rescheduling_interrupts
>     811.00 =C2=B1  7%     -22.9%     625.25 =C2=B1  6%  interrupts.CPU22.=
RES:Rescheduling_interrupts
>     775.50 =C2=B1  8%     -22.3%     602.50 =C2=B1  5%  interrupts.CPU23.=
RES:Rescheduling_interrupts
>     115.75 =C2=B1  4%     -42.5%      66.50 =C2=B1 24%  interrupts.CPU23.=
TLB:TLB_shootdowns
>       2534 =C2=B1  5%     -12.3%       2223 =C2=B1 10%  interrupts.CPU24.=
CAL:Function_call_interrupts
>     691.00 =C2=B1  6%     -14.8%     588.75 =C2=B1  8%  interrupts.CPU24.=
RES:Rescheduling_interrupts
>     118.00 =C2=B1 13%     -45.8%      64.00 =C2=B1  4%  interrupts.CPU24.=
TLB:TLB_shootdowns
>     691.00 =C2=B1  5%     -27.6%     500.50 =C2=B1  8%  interrupts.CPU25.=
RES:Rescheduling_interrupts
>       2729 =C2=B1  4%     -16.3%       2286 =C2=B1  6%  interrupts.CPU26.=
CAL:Function_call_interrupts
>     692.25 =C2=B1  7%     -25.3%     517.00 =C2=B1  6%  interrupts.CPU26.=
RES:Rescheduling_interrupts
>     121.50 =C2=B1  8%     -42.6%      69.75 =C2=B1  5%  interrupts.CPU26.=
TLB:TLB_shootdowns
>       2606 =C2=B1  4%     -12.5%       2280 =C2=B1  3%  interrupts.CPU27.=
CAL:Function_call_interrupts
>     701.50 =C2=B1  7%     -21.9%     547.75 =C2=B1 10%  interrupts.CPU27.=
RES:Rescheduling_interrupts
>     146.75 =C2=B1 10%     -44.8%      81.00 =C2=B1 24%  interrupts.CPU27.=
TLB:TLB_shootdowns
>       2570 =C2=B1  2%     -13.3%       2229 =C2=B1  7%  interrupts.CPU28.=
CAL:Function_call_interrupts
>     672.50 =C2=B1  6%     -22.2%     523.50 =C2=B1  4%  interrupts.CPU28.=
RES:Rescheduling_interrupts
>     118.00 =C2=B1  7%     -40.9%      69.75 =C2=B1 13%  interrupts.CPU28.=
TLB:TLB_shootdowns
>       2675 =C2=B1  5%     -14.8%       2280 =C2=B1  7%  interrupts.CPU29.=
CAL:Function_call_interrupts
>     130.00 =C2=B1 16%     -46.2%      70.00 =C2=B1 21%  interrupts.CPU29.=
TLB:TLB_shootdowns
>     594.00 =C2=B1  3%     -12.8%     518.00 =C2=B1  3%  interrupts.CPU3.C=
AL:Function_call_interrupts
>     156.50 =C2=B1 17%     -48.9%      80.00 =C2=B1 18%  interrupts.CPU3.T=
LB:TLB_shootdowns
>       2632 =C2=B1  2%     -13.1%       2288 =C2=B1  5%  interrupts.CPU30.=
CAL:Function_call_interrupts
>     676.00 =C2=B1 14%     -27.2%     492.00 =C2=B1  5%  interrupts.CPU30.=
RES:Rescheduling_interrupts
>     140.50 =C2=B1 20%     -48.6%      72.25 =C2=B1 15%  interrupts.CPU30.=
TLB:TLB_shootdowns
>     650.00 =C2=B1  8%     -23.9%     494.50 =C2=B1  9%  interrupts.CPU31.=
RES:Rescheduling_interrupts
>     121.50 =C2=B1 13%     -36.4%      77.25 =C2=B1 15%  interrupts.CPU31.=
TLB:TLB_shootdowns
>       2542 =C2=B1  3%     -11.9%       2240 =C2=B1  3%  interrupts.CPU32.=
CAL:Function_call_interrupts
>     673.25 =C2=B1  9%     -19.1%     544.50 =C2=B1 16%  interrupts.CPU32.=
RES:Rescheduling_interrupts
>     119.25 =C2=B1 18%     -42.8%      68.25 =C2=B1  6%  interrupts.CPU32.=
TLB:TLB_shootdowns
>       2539 =C2=B1  6%     -15.3%       2151 =C2=B1  6%  interrupts.CPU33.=
CAL:Function_call_interrupts
>     693.50 =C2=B1  4%     -25.3%     518.25 =C2=B1 12%  interrupts.CPU33.=
RES:Rescheduling_interrupts
>     125.50 =C2=B1  4%     -42.6%      72.00 =C2=B1 17%  interrupts.CPU33.=
TLB:TLB_shootdowns
>       2512 =C2=B1  3%      -9.6%       2272 =C2=B1  5%  interrupts.CPU34.=
CAL:Function_call_interrupts
>     673.75 =C2=B1  6%     -24.7%     507.50 =C2=B1  9%  interrupts.CPU34.=
RES:Rescheduling_interrupts
>     124.25 =C2=B1 12%     -38.2%      76.75 =C2=B1 21%  interrupts.CPU34.=
TLB:TLB_shootdowns
>       2531 =C2=B1  3%     -13.8%       2181 =C2=B1  4%  interrupts.CPU35.=
CAL:Function_call_interrupts
>     678.75 =C2=B1  8%     -25.0%     508.75 =C2=B1  6%  interrupts.CPU35.=
RES:Rescheduling_interrupts
>     113.50 =C2=B1  8%     -34.8%      74.00 =C2=B1 10%  interrupts.CPU35.=
TLB:TLB_shootdowns
>       2512 =C2=B1  3%     -13.0%       2185 =C2=B1  4%  interrupts.CPU36.=
CAL:Function_call_interrupts
>     655.25 =C2=B1  6%     -18.3%     535.25 =C2=B1  9%  interrupts.CPU36.=
RES:Rescheduling_interrupts
>     150.50 =C2=B1 12%     -54.3%      68.75 =C2=B1 13%  interrupts.CPU36.=
TLB:TLB_shootdowns
>       2614 =C2=B1  5%     -11.7%       2308 =C2=B1  4%  interrupts.CPU37.=
CAL:Function_call_interrupts
>     666.50 =C2=B1  9%     -16.7%     555.25 =C2=B1  6%  interrupts.CPU37.=
RES:Rescheduling_interrupts
>     124.00 =C2=B1 14%     -41.5%      72.50 =C2=B1 16%  interrupts.CPU37.=
TLB:TLB_shootdowns
>       2610 =C2=B1  5%     -14.8%       2223 =C2=B1  7%  interrupts.CPU38.=
CAL:Function_call_interrupts
>     343.75 =C2=B1 16%     -25.6%     255.75 =C2=B1 10%  interrupts.CPU38.=
NMI:Non-maskable_interrupts
>     343.75 =C2=B1 16%     -25.6%     255.75 =C2=B1 10%  interrupts.CPU38.=
PMI:Performance_monitoring_interrupts
>     644.50 =C2=B1  6%     -15.5%     544.50 =C2=B1 10%  interrupts.CPU38.=
RES:Rescheduling_interrupts
>     600.75 =C2=B1  8%     -19.9%     481.00 =C2=B1 13%  interrupts.CPU39.=
RES:Rescheduling_interrupts
>     130.50 =C2=B1 13%     -37.7%      81.25 =C2=B1 22%  interrupts.CPU39.=
TLB:TLB_shootdowns
>     346.00 =C2=B1 18%     -41.8%     201.50 =C2=B1 37%  interrupts.CPU4.N=
MI:Non-maskable_interrupts
>     346.00 =C2=B1 18%     -41.8%     201.50 =C2=B1 37%  interrupts.CPU4.P=
MI:Performance_monitoring_interrupts
>     553.75 =C2=B1  2%     -16.8%     460.50 =C2=B1  6%  interrupts.CPU4.R=
ES:Rescheduling_interrupts
>     147.50 =C2=B1 11%     -30.2%     103.00 =C2=B1 12%  interrupts.CPU4.T=
LB:TLB_shootdowns
>       2573 =C2=B1  4%     -10.3%       2306 =C2=B1  4%  interrupts.CPU40.=
CAL:Function_call_interrupts
>     350.00 =C2=B1 14%     -20.7%     277.50 =C2=B1 16%  interrupts.CPU40.=
NMI:Non-maskable_interrupts
>     350.00 =C2=B1 14%     -20.7%     277.50 =C2=B1 16%  interrupts.CPU40.=
PMI:Performance_monitoring_interrupts
>     672.75 =C2=B1  6%     -16.2%     563.50 =C2=B1  7%  interrupts.CPU40.=
RES:Rescheduling_interrupts
>     152.00 =C2=B1  8%     -47.0%      80.50 =C2=B1 18%  interrupts.CPU40.=
TLB:TLB_shootdowns
>     122.25 =C2=B1 15%     -41.9%      71.00 =C2=B1 15%  interrupts.CPU41.=
TLB:TLB_shootdowns
>     688.75 =C2=B1  6%     -18.8%     559.00 =C2=B1 10%  interrupts.CPU42.=
RES:Rescheduling_interrupts
>     115.50 =C2=B1 16%     -34.4%      75.75 =C2=B1 19%  interrupts.CPU42.=
TLB:TLB_shootdowns
>       2744 =C2=B1  7%     -15.5%       2318 =C2=B1  7%  interrupts.CPU43.=
CAL:Function_call_interrupts
>     689.50 =C2=B1  7%     -17.2%     570.75 =C2=B1 10%  interrupts.CPU43.=
RES:Rescheduling_interrupts
>     133.50 =C2=B1 14%     -46.4%      71.50 =C2=B1 10%  interrupts.CPU43.=
TLB:TLB_shootdowns
>     678.75 =C2=B1  5%     -17.6%     559.50 =C2=B1  9%  interrupts.CPU44.=
RES:Rescheduling_interrupts
>     124.00 =C2=B1  9%     -39.7%      74.75 =C2=B1  7%  interrupts.CPU44.=
TLB:TLB_shootdowns
>       2729 =C2=B1  3%     -16.7%       2272 =C2=B1  6%  interrupts.CPU45.=
CAL:Function_call_interrupts
>     666.50 =C2=B1  7%     -24.0%     506.25 =C2=B1  5%  interrupts.CPU45.=
RES:Rescheduling_interrupts
>     132.25 =C2=B1 19%     -31.8%      90.25 =C2=B1 14%  interrupts.CPU45.=
TLB:TLB_shootdowns
>       2609 =C2=B1  8%     -16.9%       2167 =C2=B1  5%  interrupts.CPU46.=
CAL:Function_call_interrupts
>     641.50 =C2=B1  6%     -14.3%     549.50 =C2=B1  5%  interrupts.CPU46.=
RES:Rescheduling_interrupts
>     137.50 =C2=B1 15%     -37.8%      85.50 =C2=B1 13%  interrupts.CPU46.=
TLB:TLB_shootdowns
>       2603 =C2=B1  5%     -16.3%       2178 =C2=B1  7%  interrupts.CPU47.=
CAL:Function_call_interrupts
>     687.00 =C2=B1  7%     -24.1%     521.75 =C2=B1  8%  interrupts.CPU47.=
RES:Rescheduling_interrupts
>     146.25 =C2=B1  7%     -40.2%      87.50 =C2=B1 23%  interrupts.CPU47.=
TLB:TLB_shootdowns
>     396.75 =C2=B1 11%     -26.7%     290.75 =C2=B1 11%  interrupts.CPU48.=
NMI:Non-maskable_interrupts
>     396.75 =C2=B1 11%     -26.7%     290.75 =C2=B1 11%  interrupts.CPU48.=
PMI:Performance_monitoring_interrupts
>     772.75 =C2=B1  7%     -23.2%     593.50 =C2=B1 10%  interrupts.CPU48.=
RES:Rescheduling_interrupts
>     111.25 =C2=B1 20%     -39.3%      67.50 =C2=B1 20%  interrupts.CPU48.=
TLB:TLB_shootdowns
>     563.00           -10.7%     502.75 =C2=B1  2%  interrupts.CPU49.CAL:F=
unction_call_interrupts
>     375.00 =C2=B1 19%     -28.1%     269.50 =C2=B1 12%  interrupts.CPU49.=
NMI:Non-maskable_interrupts
>     375.00 =C2=B1 19%     -28.1%     269.50 =C2=B1 12%  interrupts.CPU49.=
PMI:Performance_monitoring_interrupts
>     711.00 =C2=B1  6%     -24.3%     538.25 =C2=B1 11%  interrupts.CPU49.=
RES:Rescheduling_interrupts
>     125.75 =C2=B1 10%     -48.3%      65.00 =C2=B1 17%  interrupts.CPU49.=
TLB:TLB_shootdowns
>     367.50 =C2=B1 17%     -44.3%     204.75 =C2=B1 44%  interrupts.CPU5.N=
MI:Non-maskable_interrupts
>     367.50 =C2=B1 17%     -44.3%     204.75 =C2=B1 44%  interrupts.CPU5.P=
MI:Performance_monitoring_interrupts
>     723.75 =C2=B1 50%     -37.2%     454.75 =C2=B1  8%  interrupts.CPU5.R=
ES:Rescheduling_interrupts
>     141.25 =C2=B1  9%     -37.2%      88.75 =C2=B1  2%  interrupts.CPU5.T=
LB:TLB_shootdowns
>     547.00 =C2=B1  3%      -8.4%     501.00        interrupts.CPU50.CAL:F=
unction_call_interrupts
>     362.00 =C2=B1 16%     -26.5%     266.25 =C2=B1 16%  interrupts.CPU50.=
NMI:Non-maskable_interrupts
>     362.00 =C2=B1 16%     -26.5%     266.25 =C2=B1 16%  interrupts.CPU50.=
PMI:Performance_monitoring_interrupts
>     699.25 =C2=B1  5%     -18.6%     569.00 =C2=B1  4%  interrupts.CPU50.=
RES:Rescheduling_interrupts
>     109.50 =C2=B1 23%     -40.9%      64.75 =C2=B1 12%  interrupts.CPU50.=
TLB:TLB_shootdowns
>     363.50 =C2=B1 14%     -26.3%     268.00 =C2=B1 16%  interrupts.CPU51.=
NMI:Non-maskable_interrupts
>     363.50 =C2=B1 14%     -26.3%     268.00 =C2=B1 16%  interrupts.CPU51.=
PMI:Performance_monitoring_interrupts
>     707.25 =C2=B1  4%     -18.7%     574.75 =C2=B1  4%  interrupts.CPU51.=
RES:Rescheduling_interrupts
>     120.00 =C2=B1 13%     -33.3%      80.00 =C2=B1 22%  interrupts.CPU51.=
TLB:TLB_shootdowns
>     352.75 =C2=B1 20%     -35.9%     226.25 =C2=B1 17%  interrupts.CPU52.=
NMI:Non-maskable_interrupts
>     352.75 =C2=B1 20%     -35.9%     226.25 =C2=B1 17%  interrupts.CPU52.=
PMI:Performance_monitoring_interrupts
>     372.50 =C2=B1 14%     -26.2%     275.00 =C2=B1 17%  interrupts.CPU53.=
NMI:Non-maskable_interrupts
>     372.50 =C2=B1 14%     -26.2%     275.00 =C2=B1 17%  interrupts.CPU53.=
PMI:Performance_monitoring_interrupts
>     646.25 =C2=B1  3%     -17.9%     530.25 =C2=B1  7%  interrupts.CPU53.=
RES:Rescheduling_interrupts
>     126.25 =C2=B1  2%     -40.6%      75.00 =C2=B1 17%  interrupts.CPU53.=
TLB:TLB_shootdowns
>     623.75 =C2=B1  6%     -14.4%     534.00 =C2=B1  3%  interrupts.CPU54.=
RES:Rescheduling_interrupts
>     128.50 =C2=B1 14%     -34.8%      83.75 =C2=B1 32%  interrupts.CPU54.=
TLB:TLB_shootdowns
>     566.75           -11.2%     503.00        interrupts.CPU55.CAL:Functi=
on_call_interrupts
>     350.00 =C2=B1 14%     -22.5%     271.25 =C2=B1  7%  interrupts.CPU55.=
NMI:Non-maskable_interrupts
>     350.00 =C2=B1 14%     -22.5%     271.25 =C2=B1  7%  interrupts.CPU55.=
PMI:Performance_monitoring_interrupts
>     614.00 =C2=B1  3%     -20.9%     485.75 =C2=B1  7%  interrupts.CPU55.=
RES:Rescheduling_interrupts
>     129.25 =C2=B1  8%     -49.1%      65.75 =C2=B1 17%  interrupts.CPU55.=
TLB:TLB_shootdowns
>     587.50 =C2=B1  3%     -12.9%     511.75 =C2=B1  3%  interrupts.CPU56.=
CAL:Function_call_interrupts
>     369.50 =C2=B1 18%     -28.8%     263.00 =C2=B1  9%  interrupts.CPU56.=
NMI:Non-maskable_interrupts
>     369.50 =C2=B1 18%     -28.8%     263.00 =C2=B1  9%  interrupts.CPU56.=
PMI:Performance_monitoring_interrupts
>     623.50 =C2=B1  4%     -21.6%     488.75 =C2=B1  8%  interrupts.CPU56.=
RES:Rescheduling_interrupts
>     167.00 =C2=B1 23%     -55.2%      74.75 =C2=B1 20%  interrupts.CPU56.=
TLB:TLB_shootdowns
>     350.25 =C2=B1 14%     -21.5%     275.00 =C2=B1 13%  interrupts.CPU57.=
NMI:Non-maskable_interrupts
>     350.25 =C2=B1 14%     -21.5%     275.00 =C2=B1 13%  interrupts.CPU57.=
PMI:Performance_monitoring_interrupts
>     647.00 =C2=B1  7%     -28.9%     459.75 =C2=B1  4%  interrupts.CPU57.=
RES:Rescheduling_interrupts
>     142.75 =C2=B1 17%     -31.2%      98.25 =C2=B1 13%  interrupts.CPU57.=
TLB:TLB_shootdowns
>     570.25 =C2=B1  2%     -10.6%     509.75 =C2=B1  3%  interrupts.CPU58.=
CAL:Function_call_interrupts
>     334.00 =C2=B1 13%     -25.4%     249.25 =C2=B1 17%  interrupts.CPU58.=
NMI:Non-maskable_interrupts
>     334.00 =C2=B1 13%     -25.4%     249.25 =C2=B1 17%  interrupts.CPU58.=
PMI:Performance_monitoring_interrupts
>     606.75 =C2=B1  7%     -21.5%     476.00 =C2=B1  7%  interrupts.CPU58.=
RES:Rescheduling_interrupts
>     132.75 =C2=B1 13%     -45.8%      72.00 =C2=B1 19%  interrupts.CPU58.=
TLB:TLB_shootdowns
>     583.75            -9.9%     526.25 =C2=B1  3%  interrupts.CPU59.CAL:F=
unction_call_interrupts
>     354.00 =C2=B1 16%     -27.3%     257.50 =C2=B1 19%  interrupts.CPU59.=
NMI:Non-maskable_interrupts
>     354.00 =C2=B1 16%     -27.3%     257.50 =C2=B1 19%  interrupts.CPU59.=
PMI:Performance_monitoring_interrupts
>     622.25 =C2=B1  5%     -20.3%     495.75 =C2=B1  4%  interrupts.CPU59.=
RES:Rescheduling_interrupts
>     146.25 =C2=B1  8%     -39.7%      88.25 =C2=B1 17%  interrupts.CPU59.=
TLB:TLB_shootdowns
>     584.00           -10.3%     523.75        interrupts.CPU6.CAL:Functio=
n_call_interrupts
>     352.00 =C2=B1 21%     -35.1%     228.50 =C2=B1 50%  interrupts.CPU6.N=
MI:Non-maskable_interrupts
>     352.00 =C2=B1 21%     -35.1%     228.50 =C2=B1 50%  interrupts.CPU6.P=
MI:Performance_monitoring_interrupts
>     146.50 =C2=B1  6%     -41.3%      86.00 =C2=B1 14%  interrupts.CPU6.T=
LB:TLB_shootdowns
>     594.50 =C2=B1  2%     -14.6%     507.50        interrupts.CPU60.CAL:F=
unction_call_interrupts
>     615.00 =C2=B1  7%     -25.5%     458.25 =C2=B1  6%  interrupts.CPU60.=
RES:Rescheduling_interrupts
>     158.25 =C2=B1 11%     -52.8%      74.75 =C2=B1 10%  interrupts.CPU60.=
TLB:TLB_shootdowns
>     589.75 =C2=B1  2%     -11.0%     525.00 =C2=B1  2%  interrupts.CPU61.=
CAL:Function_call_interrupts
>     609.75 =C2=B1  8%     -20.9%     482.25 =C2=B1  6%  interrupts.CPU61.=
RES:Rescheduling_interrupts
>     152.25 =C2=B1 11%     -42.9%      87.00 =C2=B1 12%  interrupts.CPU61.=
TLB:TLB_shootdowns
>     577.50 =C2=B1  2%     -10.4%     517.50 =C2=B1  2%  interrupts.CPU62.=
CAL:Function_call_interrupts
>     605.75           -23.7%     462.25 =C2=B1  7%  interrupts.CPU62.RES:R=
escheduling_interrupts
>     140.00 =C2=B1 13%     -40.7%      83.00 =C2=B1 20%  interrupts.CPU62.=
TLB:TLB_shootdowns
>     576.25 =C2=B1  2%      -9.1%     523.75        interrupts.CPU63.CAL:F=
unction_call_interrupts
>     575.00 =C2=B1  3%     -24.8%     432.50 =C2=B1  9%  interrupts.CPU63.=
RES:Rescheduling_interrupts
>     141.50 =C2=B1 16%     -39.4%      85.75 =C2=B1  9%  interrupts.CPU63.=
TLB:TLB_shootdowns
>     562.25 =C2=B1  3%      -7.6%     519.25        interrupts.CPU64.CAL:F=
unction_call_interrupts
>     347.75 =C2=B1 12%     -23.7%     265.50 =C2=B1 10%  interrupts.CPU64.=
NMI:Non-maskable_interrupts
>     347.75 =C2=B1 12%     -23.7%     265.50 =C2=B1 10%  interrupts.CPU64.=
PMI:Performance_monitoring_interrupts
>     572.25 =C2=B1  4%     -27.0%     418.00 =C2=B1  7%  interrupts.CPU64.=
RES:Rescheduling_interrupts
>     124.75 =C2=B1 18%     -34.9%      81.25 =C2=B1 14%  interrupts.CPU64.=
TLB:TLB_shootdowns
>     580.25 =C2=B1  4%     -13.4%     502.75 =C2=B1  5%  interrupts.CPU65.=
CAL:Function_call_interrupts
>     368.75 =C2=B1 14%     -21.3%     290.25 =C2=B1 13%  interrupts.CPU65.=
NMI:Non-maskable_interrupts
>     368.75 =C2=B1 14%     -21.3%     290.25 =C2=B1 13%  interrupts.CPU65.=
PMI:Performance_monitoring_interrupts
>     588.00 =C2=B1  3%     -25.0%     440.75 =C2=B1  9%  interrupts.CPU65.=
RES:Rescheduling_interrupts
>     142.75 =C2=B1 18%     -56.2%      62.50 =C2=B1 38%  interrupts.CPU65.=
TLB:TLB_shootdowns
>     528.75 =C2=B1  7%     -19.7%     424.50 =C2=B1  7%  interrupts.CPU66.=
RES:Rescheduling_interrupts
>     385.50 =C2=B1  8%     -23.2%     296.00 =C2=B1 18%  interrupts.CPU67.=
NMI:Non-maskable_interrupts
>     385.50 =C2=B1  8%     -23.2%     296.00 =C2=B1 18%  interrupts.CPU67.=
PMI:Performance_monitoring_interrupts
>     551.50 =C2=B1  7%     -21.7%     432.00 =C2=B1  7%  interrupts.CPU67.=
RES:Rescheduling_interrupts
>     380.25 =C2=B1 14%     -28.5%     272.00 =C2=B1 17%  interrupts.CPU68.=
NMI:Non-maskable_interrupts
>     380.25 =C2=B1 14%     -28.5%     272.00 =C2=B1 17%  interrupts.CPU68.=
PMI:Performance_monitoring_interrupts
>     581.75 =C2=B1  2%     -25.1%     435.50 =C2=B1  8%  interrupts.CPU68.=
RES:Rescheduling_interrupts
>     113.00 =C2=B1 13%     -20.4%      90.00 =C2=B1 14%  interrupts.CPU68.=
TLB:TLB_shootdowns
>     119.00 =C2=B1  9%     -39.5%      72.00 =C2=B1 13%  interrupts.CPU69.=
TLB:TLB_shootdowns
>     308.00 =C2=B1  5%     +17.7%     362.50 =C2=B1  8%  interrupts.CPU7.3=
5:PCI-MSI.31981568-edge.i40e-0000:3d:00.0:misc
>     345.50 =C2=B1 19%     -48.5%     178.00 =C2=B1 44%  interrupts.CPU7.N=
MI:Non-maskable_interrupts
>     345.50 =C2=B1 19%     -48.5%     178.00 =C2=B1 44%  interrupts.CPU7.P=
MI:Performance_monitoring_interrupts
>     132.75 =C2=B1 14%     -35.0%      86.25 =C2=B1 13%  interrupts.CPU7.T=
LB:TLB_shootdowns
>     570.50 =C2=B1  2%      -9.3%     517.25 =C2=B1  3%  interrupts.CPU70.=
CAL:Function_call_interrupts
>     371.75 =C2=B1 19%     -25.4%     277.50 =C2=B1 21%  interrupts.CPU70.=
NMI:Non-maskable_interrupts
>     371.75 =C2=B1 19%     -25.4%     277.50 =C2=B1 21%  interrupts.CPU70.=
PMI:Performance_monitoring_interrupts
>     541.00 =C2=B1  4%     -25.6%     402.25 =C2=B1  7%  interrupts.CPU70.=
RES:Rescheduling_interrupts
>     133.00 =C2=B1  9%     -44.7%      73.50 =C2=B1 11%  interrupts.CPU70.=
TLB:TLB_shootdowns
>     581.50 =C2=B1  3%      -9.1%     528.50 =C2=B1  3%  interrupts.CPU71.=
CAL:Function_call_interrupts
>     377.50 =C2=B1 18%     -33.7%     250.25 =C2=B1 15%  interrupts.CPU71.=
NMI:Non-maskable_interrupts
>     377.50 =C2=B1 18%     -33.7%     250.25 =C2=B1 15%  interrupts.CPU71.=
PMI:Performance_monitoring_interrupts
>     536.25           -23.3%     411.25 =C2=B1  9%  interrupts.CPU71.RES:R=
escheduling_interrupts
>     161.75 =C2=B1 25%     -47.4%      85.00 =C2=B1 12%  interrupts.CPU71.=
TLB:TLB_shootdowns
>       2648 =C2=B1  6%     -22.7%       2047 =C2=B1  3%  interrupts.CPU72.=
CAL:Function_call_interrupts
>     681.50 =C2=B1  6%     -26.4%     501.25 =C2=B1  3%  interrupts.CPU72.=
RES:Rescheduling_interrupts
>     130.75 =C2=B1 10%     -42.8%      74.75 =C2=B1  8%  interrupts.CPU72.=
TLB:TLB_shootdowns
>       2619 =C2=B1  6%     -21.7%       2049 =C2=B1  8%  interrupts.CPU73.=
CAL:Function_call_interrupts
>     378.75 =C2=B1 14%     -29.8%     266.00 =C2=B1 17%  interrupts.CPU73.=
NMI:Non-maskable_interrupts
>     378.75 =C2=B1 14%     -29.8%     266.00 =C2=B1 17%  interrupts.CPU73.=
PMI:Performance_monitoring_interrupts
>     660.50 =C2=B1 11%     -31.3%     453.50 =C2=B1 12%  interrupts.CPU73.=
RES:Rescheduling_interrupts
>     693.25 =C2=B1  7%     -30.8%     480.00 =C2=B1  6%  interrupts.CPU74.=
RES:Rescheduling_interrupts
>     130.50 =C2=B1 15%     -40.4%      77.75 =C2=B1 12%  interrupts.CPU74.=
TLB:TLB_shootdowns
>       2696 =C2=B1  3%     -23.8%       2055        interrupts.CPU75.CAL:F=
unction_call_interrupts
>     709.75 =C2=B1  3%     -26.2%     523.50 =C2=B1 10%  interrupts.CPU75.=
RES:Rescheduling_interrupts
>     132.25 =C2=B1 15%     -40.3%      79.00 =C2=B1 24%  interrupts.CPU75.=
TLB:TLB_shootdowns
>       2720 =C2=B1  7%     -22.2%       2117 =C2=B1  8%  interrupts.CPU76.=
CAL:Function_call_interrupts
>     684.00 =C2=B1  8%     -28.4%     489.50 =C2=B1  6%  interrupts.CPU76.=
RES:Rescheduling_interrupts
>     133.75 =C2=B1  7%     -47.3%      70.50 =C2=B1 12%  interrupts.CPU76.=
TLB:TLB_shootdowns
>       2605           -20.7%       2065 =C2=B1  5%  interrupts.CPU77.CAL:F=
unction_call_interrupts
>     699.25 =C2=B1  6%     -25.3%     522.50 =C2=B1 16%  interrupts.CPU77.=
RES:Rescheduling_interrupts
>     118.25 =C2=B1  5%     -36.2%      75.50 =C2=B1  9%  interrupts.CPU77.=
TLB:TLB_shootdowns
>       2747 =C2=B1  7%     -23.9%       2089 =C2=B1  6%  interrupts.CPU78.=
CAL:Function_call_interrupts
>     657.25 =C2=B1 11%     -22.8%     507.25 =C2=B1 17%  interrupts.CPU78.=
RES:Rescheduling_interrupts
>     131.00 =C2=B1  4%     -42.7%      75.00 =C2=B1 14%  interrupts.CPU78.=
TLB:TLB_shootdowns
>       2666 =C2=B1  5%     -16.0%       2239 =C2=B1 10%  interrupts.CPU79.=
CAL:Function_call_interrupts
>     693.00 =C2=B1 11%     -26.2%     511.75 =C2=B1 11%  interrupts.CPU79.=
RES:Rescheduling_interrupts
>     146.50 =C2=B1 18%     -48.5%      75.50 =C2=B1 13%  interrupts.CPU79.=
TLB:TLB_shootdowns
>     589.25 =C2=B1  2%     -10.2%     529.00        interrupts.CPU8.CAL:Fu=
nction_call_interrupts
>     342.75 =C2=B1 20%     -52.7%     162.00 =C2=B1 35%  interrupts.CPU8.N=
MI:Non-maskable_interrupts
>     342.75 =C2=B1 20%     -52.7%     162.00 =C2=B1 35%  interrupts.CPU8.P=
MI:Performance_monitoring_interrupts
>     152.50 =C2=B1  9%     -40.2%      91.25 =C2=B1 13%  interrupts.CPU8.T=
LB:TLB_shootdowns
>     651.25 =C2=B1  6%     -27.8%     470.50 =C2=B1 13%  interrupts.CPU80.=
RES:Rescheduling_interrupts
>     149.25 =C2=B1  9%     -55.6%      66.25 =C2=B1 17%  interrupts.CPU80.=
TLB:TLB_shootdowns
>     644.25 =C2=B1  7%     -25.1%     482.75 =C2=B1 10%  interrupts.CPU81.=
RES:Rescheduling_interrupts
>     135.00 =C2=B1 13%     -38.7%      82.75 =C2=B1 15%  interrupts.CPU81.=
TLB:TLB_shootdowns
>       2656 =C2=B1  3%     -11.4%       2352 =C2=B1  8%  interrupts.CPU82.=
CAL:Function_call_interrupts
>     669.00 =C2=B1 11%     -24.7%     504.00 =C2=B1 11%  interrupts.CPU82.=
RES:Rescheduling_interrupts
>     144.50 =C2=B1 17%     -41.9%      84.00 =C2=B1 18%  interrupts.CPU82.=
TLB:TLB_shootdowns
>       2587 =C2=B1  5%     -19.8%       2074 =C2=B1  7%  interrupts.CPU83.=
CAL:Function_call_interrupts
>     687.25 =C2=B1  9%     -29.2%     486.25 =C2=B1  8%  interrupts.CPU83.=
RES:Rescheduling_interrupts
>     126.75 =C2=B1 13%     -48.5%      65.25 =C2=B1 10%  interrupts.CPU83.=
TLB:TLB_shootdowns
>       2607 =C2=B1  5%     -17.5%       2152 =C2=B1  7%  interrupts.CPU84.=
CAL:Function_call_interrupts
>     133.25 =C2=B1  7%     -42.2%      77.00 =C2=B1 27%  interrupts.CPU84.=
TLB:TLB_shootdowns
>       2506 =C2=B1  5%     -12.7%       2187 =C2=B1  3%  interrupts.CPU85.=
CAL:Function_call_interrupts
>     667.25 =C2=B1 10%     -29.7%     469.25 =C2=B1 11%  interrupts.CPU85.=
RES:Rescheduling_interrupts
>     148.50 =C2=B1  7%     -47.3%      78.25 =C2=B1 16%  interrupts.CPU85.=
TLB:TLB_shootdowns
>       2691 =C2=B1  2%     -18.0%       2208 =C2=B1  9%  interrupts.CPU86.=
CAL:Function_call_interrupts
>     638.75 =C2=B1  2%     -22.9%     492.25 =C2=B1 10%  interrupts.CPU86.=
RES:Rescheduling_interrupts
>     132.75 =C2=B1 16%     -46.3%      71.25 =C2=B1 15%  interrupts.CPU86.=
TLB:TLB_shootdowns
>       2581 =C2=B1  4%     -13.9%       2223 =C2=B1  5%  interrupts.CPU87.=
CAL:Function_call_interrupts
>     339.25 =C2=B1 15%     -18.3%     277.00 =C2=B1  8%  interrupts.CPU87.=
NMI:Non-maskable_interrupts
>     339.25 =C2=B1 15%     -18.3%     277.00 =C2=B1  8%  interrupts.CPU87.=
PMI:Performance_monitoring_interrupts
>     659.50 =C2=B1 10%     -29.3%     466.00 =C2=B1  7%  interrupts.CPU87.=
RES:Rescheduling_interrupts
>     139.75 =C2=B1 10%     -47.2%      73.75 =C2=B1 14%  interrupts.CPU87.=
TLB:TLB_shootdowns
>       2689 =C2=B1  5%     -18.2%       2198 =C2=B1  9%  interrupts.CPU88.=
CAL:Function_call_interrupts
>     642.75 =C2=B1  8%     -19.1%     520.25 =C2=B1  8%  interrupts.CPU88.=
RES:Rescheduling_interrupts
>     143.50 =C2=B1  6%     -44.1%      80.25 =C2=B1 16%  interrupts.CPU88.=
TLB:TLB_shootdowns
>       2794 =C2=B1  5%     -23.9%       2126 =C2=B1  2%  interrupts.CPU89.=
CAL:Function_call_interrupts
>     361.00 =C2=B1 19%     -22.3%     280.50 =C2=B1  9%  interrupts.CPU89.=
NMI:Non-maskable_interrupts
>     361.00 =C2=B1 19%     -22.3%     280.50 =C2=B1  9%  interrupts.CPU89.=
PMI:Performance_monitoring_interrupts
>     695.00 =C2=B1  7%     -22.7%     537.00 =C2=B1  7%  interrupts.CPU89.=
RES:Rescheduling_interrupts
>     128.25 =C2=B1 13%     -37.6%      80.00 =C2=B1 12%  interrupts.CPU89.=
TLB:TLB_shootdowns
>     577.75 =C2=B1  2%      -9.1%     525.25        interrupts.CPU9.CAL:Fu=
nction_call_interrupts
>     338.75 =C2=B1 18%     -50.9%     166.25 =C2=B1 39%  interrupts.CPU9.N=
MI:Non-maskable_interrupts
>     338.75 =C2=B1 18%     -50.9%     166.25 =C2=B1 39%  interrupts.CPU9.P=
MI:Performance_monitoring_interrupts
>     535.25 =C2=B1  9%     -19.0%     433.75 =C2=B1 11%  interrupts.CPU9.R=
ES:Rescheduling_interrupts
>     140.25 =C2=B1 10%     -37.8%      87.25 =C2=B1 12%  interrupts.CPU9.T=
LB:TLB_shootdowns
>     351.25 =C2=B1 17%     -20.8%     278.25 =C2=B1  5%  interrupts.CPU90.=
NMI:Non-maskable_interrupts
>     351.25 =C2=B1 17%     -20.8%     278.25 =C2=B1  5%  interrupts.CPU90.=
PMI:Performance_monitoring_interrupts
>     840.25 =C2=B1 43%     -41.0%     495.75 =C2=B1 12%  interrupts.CPU90.=
RES:Rescheduling_interrupts
>     129.00 =C2=B1 20%     -43.4%      73.00 =C2=B1 28%  interrupts.CPU90.=
TLB:TLB_shootdowns
>     653.00 =C2=B1  6%     -23.0%     502.75 =C2=B1 11%  interrupts.CPU91.=
RES:Rescheduling_interrupts
>     125.75 =C2=B1  3%     -40.0%      75.50 =C2=B1 12%  interrupts.CPU91.=
TLB:TLB_shootdowns
>       2613           -20.3%       2082 =C2=B1  2%  interrupts.CPU92.CAL:F=
unction_call_interrupts
>     661.50 =C2=B1 10%     -28.4%     473.50 =C2=B1  9%  interrupts.CPU92.=
RES:Rescheduling_interrupts
>     140.50 =C2=B1  9%     -40.2%      84.00 =C2=B1 20%  interrupts.CPU92.=
TLB:TLB_shootdowns
>       2555 =C2=B1  4%     -15.7%       2155 =C2=B1  6%  interrupts.CPU93.=
CAL:Function_call_interrupts
>     639.50 =C2=B1  7%     -21.4%     502.75 =C2=B1  7%  interrupts.CPU93.=
RES:Rescheduling_interrupts
>     122.25 =C2=B1  7%     -33.3%      81.50 =C2=B1 16%  interrupts.CPU93.=
TLB:TLB_shootdowns
>       2624           -17.8%       2156 =C2=B1  7%  interrupts.CPU94.CAL:F=
unction_call_interrupts
>     669.00 =C2=B1  7%     -22.3%     520.00 =C2=B1 13%  interrupts.CPU94.=
RES:Rescheduling_interrupts
>     154.25 =C2=B1 13%     -52.7%      73.00 =C2=B1  6%  interrupts.CPU94.=
TLB:TLB_shootdowns
>       2581 =C2=B1  6%     -19.7%       2072 =C2=B1  7%  interrupts.CPU95.=
CAL:Function_call_interrupts
>     692.75 =C2=B1 12%     -29.7%     487.25 =C2=B1  8%  interrupts.CPU95.=
RES:Rescheduling_interrupts
>      31535 =C2=B1 19%     -23.8%      24025 =C2=B1  9%  interrupts.NMI:No=
n-maskable_interrupts
>      31535 =C2=B1 19%     -23.8%      24025 =C2=B1  9%  interrupts.PMI:Pe=
rformance_monitoring_interrupts
>      64652 =C2=B1  4%     -22.0%      50444        interrupts.RES:Resched=
uling_interrupts
>      12540 =C2=B1  5%     -39.8%       7554 =C2=B1  9%  interrupts.TLB:TL=
B_shootdowns
> =

> =

>                                                                          =
       =

>                              reaim.time.minor_page_faults                =
       =

>                                                                          =
       =

>   6.4e+06 +--------------------------------------------------------------=
---+   =

>           |.+..+.+.+.  .+.+.+.+..+.+.+.. .+. .+..+.+.+..+.      .+.+. .+.=
.  |   =

>   6.2e+06 |-+        +.                 +   +             +.+.+.     +   =
 + |   =

>     6e+06 |-+                                                            =
   |   =

>           |                                                              =
   |   =

>   5.8e+06 |-+                                                            =
   |   =

>   5.6e+06 |-+                                                            =
   |   =

>           |                                                              =
   |   =

>   5.4e+06 |-+                                                            =
   |   =

>   5.2e+06 |-+                                                            =
   |   =

>           |                                                              =
   |   =

>     5e+06 |-+                                                            =
   |   =

>   4.8e+06 |-+                                                            =
   |   =

>           |    O   O          O    O        O O             O      O     =
 O |   =

>   4.6e+06 +--------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                          reaim.time.voluntary_context_switches           =
       =

>                                                                          =
       =

>    2.3e+06 +-------------------------------------------------------------=
---+   =

>            |       .+.+.      .+.+..+.   +    +  +.+.. .+.    .+.+.      =
+  |   =

>   2.25e+06 |.+.+..+     +.. .+        +.+    +        +   +.+.     +.+..+=
   |   =

>            |               +                                             =
   |   =

>    2.2e+06 |-+                                                           =
   |   =

>   2.15e+06 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>    2.1e+06 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>   2.05e+06 |-+                                                           =
   |   =

>      2e+06 |-+                   O                               O O O  O=
 O |   =

>            |   O  O   O O    O O          O           O   O O            =
   |   =

>   1.95e+06 |-O      O      O        O O        O   O    O                =
   |   =

>            |                            O    O   O             O         =
   |   =

>    1.9e+06 +-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                        reaim.time.involuntary_context_switches           =
       =

>                                                                          =
       =

>   66000 +----------------------------------------------------------------=
---+   =

>         |                                                                =
   |   =

>   64000 |-+   .+.+..   .+..+.+.                .+.       +..        .+.  =
.+ |   =

>         |.+..+      +.+        +..+. .+..+.+..+   +..+. +   +.+.+..+   +.=
   |   =

>   62000 |-+                         +                  +                 =
   |   =

>         |                                                                =
   |   =

>   60000 |-+                                                              =
   |   =

>         |                                                                =
   |   =

>   58000 |-+                                                              =
   |   =

>         | O      O                O   O         O             O          =
   |   =

>   56000 |-+                O               O      O    O                 =
   |   =

>         |      O    O O                       O                 O        =
   |   =

>   54000 |-+  O          O    O O    O    O           O   O  O      O O O =
 O |   =

>         |                                                                =
   |   =

>   52000 +----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             reaim.time.file_system_inputs                =
       =

>                                                                          =
       =

>   290000 +---------------------------------------------------------------=
---+   =

>          |                   .+.                                         =
   |   =

>   280000 |.+..+.+.+..+.+.+.+.   +.+..+.+.+..+.+.+..+.+.  .+.+. .+..+.+.+.=
.+ |   =

>   270000 |-+                                           +.     +          =
   |   =

>          |                                                               =
   |   =

>   260000 |-+                                                             =
   |   =

>   250000 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>   240000 |-+                                                             =
   |   =

>   230000 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>   220000 |-+                                                             =
   |   =

>   210000 |-+                      O                                      =
   |   =

>          | O  O O O  O O O O  O O    O O O  O O O  O O O  O O O O  O O O =
 O |   =

>   200000 +---------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             reaim.time.file_system_outputs               =
       =

>                                                                          =
       =

>   1.15e+07 +-------------------------------------------------------------=
---+   =

>            |                                     +.                      =
   |   =

>    1.1e+07 |-+         .+..                      : +..  +                =
 + |   =

>            |.+.  .+.+.+    +.+. .+..+. .+    +  :      + + .+..+.+.+.+.. =
+  |   =

>   1.05e+07 |-+ +.              +      +  + .. + :     +   +             +=
   |   =

>            |                              +    +                         =
   |   =

>      1e+07 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>    9.5e+06 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>      9e+06 |-+      O               O   O        O             O         =
   |   =

>            | O               O               O O   O    O                =
   |   =

>    8.5e+06 |-+ O  O            O O    O   O           O   O      O O O  O=
 O |   =

>            |          O O  O                                O            =
   |   =

>      8e+06 +-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                  reaim.parent_time                       =
       =

>                                                                          =
       =

>   140 +------------------------------------------------------------------=
---+   =

>       |         O                                                        =
   |   =

>   130 |-+                        O        O  O O O    O                  =
   |   =

>       | O         O      O           O                        O O      O =
   |   =

>       |      O      O  O      O    O    O                         O  O   =
 O |   =

>   120 |-+  O                O                       O    O O             =
   |   =

>       |                                                                  =
   |   =

>   110 |-+                                                                =
   |   =

>       |                                                                  =
   |   =

>   100 |-+                                                                =
   |   =

>       |                                                                  =
   |   =

>       |                                        +.                        =
   |   =

>    90 |-+   .+..   .+..+.+..+.      .+.. .+.. +  +..             .+..    =
.+ |   =

>       |.+..+    +.+           +..+.+    +    +      +.+..+.+..+.+    +.+.=
   |   =

>    80 +------------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                 reaim.jobs_per_min                       =
       =

>                                                                          =
       =

>   7500 +-----------------------------------------------------------------=
---+   =

>        |                                                                 =
   |   =

>   7000 |.+..+.  .+.+.         .+.+..+. .+.. .+    +.+..+.+.+..+.+.  .+.+.=
.  |   =

>        |      +.     +..+.+.+.        +    +  + ..                +.     =
 + |   =

>   6500 |-+                                     +                         =
   |   =

>        |                                                                 =
   |   =

>   6000 |-+                                                               =
   |   =

>        |                                                                 =
   |   =

>   5500 |-+                                                               =
   |   =

>        |                                                                 =
   |   =

>   5000 |-+  O O      O  O   O  O    O               O    O O             =
   |   =

>        | O         O      O           O O         O    O      O O O  O O =
 O |   =

>   4500 |-+       O               O         O O O                         =
   |   =

>        |                                                                 =
   |   =

>   4000 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             reaim.jobs_per_min_child                     =
       =

>                                                                          =
       =

>   75 +-------------------------------------------------------------------=
---+   =

>      |                                                                   =
   |   =

>   70 |.+..+.  .+.+..        .+..+.+.. .+.. .+..  +..+.+.+..+.+..+.  .+.+.=
.  |   =

>      |      +.      +.+..+.+         +    +     +                 +.     =
 + |   =

>   65 |-+                                       +                         =
   |   =

>      |                                                                   =
   |   =

>   60 |-+                                                                 =
   |   =

>      |                                                                   =
   |   =

>   55 |-+                                                                 =
   |   =

>      |                                                                   =
   |   =

>   50 |-+  O O       O O    O O    O                 O   O  O             =
   |   =

>      | O         O       O           O O         O    O      O  O O  O O =
 O |   =

>   45 |-+       O                O         O O  O                         =
   |   =

>      |                                                                   =
   |   =

>   40 +-------------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                reaim.std_dev_time                        =
       =

>                                                                          =
       =

>   7 +--------------------------------------------------------------------=
---+   =

>     |                                                                    =
   |   =

>   6 |-+         O                                               O        =
   |   =

>     |                                  O                             O   =
   |   =

>   5 |-+              O  O    O    O         O                     O    O =
 O |   =

>     |    O O                        O    O    O  O    O    O             =
   |   =

>   4 |-O       O    O           O                   O    O                =
   |   =

>     |                     O                                  O           =
   |   =

>   3 |-+                                                                  =
   |   =

>     |                                                                    =
   |   =

>   2 |-+                                                                  =
   |   =

>     |                                                                    =
   |   =

>   1 |.+.. .+..+.+..+.+..+.+..+.+..+.+..+.+..+.+..+.+..+.  .+.+..+.+..+.+.=
.+ |   =

>     |    +                                              +.               =
   |   =

>   0 +--------------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                reaim.std_dev_percent                     =
       =

>                                                                          =
       =

>   5.5 +------------------------------------------------------------------=
---+   =

>     5 |-+         O                                                      =
   |   =

>       |                                 O                       O    O   =
   |   =

>   4.5 |-+              O      O                                   O    O =
 O |   =

>     4 |-+  O O           O         O         O             O             =
   |   =

>       |                              O    O      O  O O  O               =
   |   =

>   3.5 |-O       O   O            O             O                         =
   |   =

>     3 |-+                   O                                            =
   |   =

>   2.5 |-+                                                     O          =
   |   =

>       |                                                                  =
   |   =

>     2 |-+                                                                =
   |   =

>   1.5 |-+                                                                =
   |   =

>       |            .+..+.    .+..      .+.  .+. .+..                     =
.+ |   =

>     1 |.+..+.+..+.+      +..+    +.+.+.   +.   +    +.+..+.+..+.+.+..+.+.=
   |   =

>   0.5 +------------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                      reaim.jti                           =
       =

>                                                                          =
       =

>     99 +-----------------------------------------------------------------=
---+   =

>   98.5 |.+..+.+..+.+.    .+.    .+..+.+.  .+. .+.. .+..+        +.+..+.+.=
.+ |   =

>        |             +..+   +..+        +.   +    +                      =
   |   =

>     98 |-+                                                               =
   |   =

>   97.5 |-+                                                               =
   |   =

>        |                                                                 =
   |   =

>     97 |-+                                                               =
   |   =

>   96.5 |-O       O          O    O                            O          =
   |   =

>     96 |-+                                     O                         =
   |   =

>        |    O O      O    O           O    O      O O  O O               =
   |   =

>   95.5 |-+                          O        O             O      O    O =
   |   =

>     95 |-+              O      O                                         =
 O |   =

>        |                                O                            O   =
   |   =

>   94.5 |-+         O                                            O        =
   |   =

>     94 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                               reaim.max_jobs_per_min                     =
       =

>                                                                          =
       =

>   7500 +-----------------------------------------------------------------=
---+   =

>        |.+..                   +.                                        =
   |   =

>   7000 |-+  +.  .+.+         ..  +..+. .+.. .+    +.+..+.+.+..+.+.  .+.+.=
.  |   =

>        |      +.    +  .+. .+         +    +  + ..                +.     =
 + |   =

>        |             +.   +                    +                         =
   |   =

>   6500 |-+                                                               =
   |   =

>        |                                                                 =
   |   =

>   6000 |-+                                                               =
   |   =

>        |                                                                 =
   |   =

>   5500 |-+                                                               =
   |   =

>        |                                                                 =
   |   =

>        |    O O      O      O       O               O    O O         O   =
   |   =

>   5000 |-O              O O    O        O  O                      O    O =
 O |   =

>        |         O O             O    O      O    O    O      O O        =
   |   =

>   4500 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                    reaim.workload                        =
       =

>                                                                          =
       =

>   40000 +----------------------------------------------------------------=
---+   =

>         |                                                                =
   |   =

>         |                                                                =
   |   =

>   38000 |-+                                                              =
   |   =

>         |                                                                =
   |   =

>         |                                                                =
   |   =

>   36000 |-+                                                              =
   |   =

>         |                                                                =
   |   =

>   34000 |-+                                                              =
   |   =

>         |                                                                =
   |   =

>         |                                                                =
   |   =

>   32000 |-+                                                              =
   |   =

>         |                                                                =
   |   =

>         |                                                                =
   |   =

>   30000 +----------------------------------------------------------------=
---+   =

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
>=20
--===============5936719449899952735==--

