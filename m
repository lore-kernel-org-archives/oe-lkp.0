Content-Type: multipart/mixed; boundary="===============7738111231986873722=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Tue, 30 Jul 2019 19:50:09 +0200
Message-ID: <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
In-Reply-To: <20190729095155.GP22106@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7738111231986873722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am 29.07.19 um 11:51 schrieb kernel test robot:
> Greeting,
> =

> FYI, we noticed a -18.8% regression of vm-scalability.median due to commi=
t:>
> =

> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4 ("drm/mgag200: Replace s=
truct mga_fbdev with generic framebuffer emulation")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.=
git master

Daniel, Noralf, we may have to revert this patch.

I expected some change in display performance, but not in VM. Since it's
a server chipset, probably no one cares much about display performance.
So that seemed like a good trade-off for re-using shared code.

Part of the patch set is that the generic fb emulation now maps and
unmaps the fbdev BO when updating the screen. I guess that's the cause
of the performance regression. And it should be visible with other
drivers as well if they use a shadow FB for fbdev emulation.

The thing is that we'd need another generic fbdev emulation for ast and
mgag200 that handles this issue properly.

Best regards
Thomas

> =

> in testcase: vm-scalability
> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz wit=
h 80G memory
> with following parameters:
> =

> 	runtime: 300s
> 	size: 8T
> 	test: anon-cow-seq-hugetlb
> 	cpufreq_governor: performance
> =

> test-description: The motivation behind this suite is to exercise functio=
ns and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability=
.git/
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

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/tes=
tcase:
>   gcc-7/performance/x86_64-rhel-7.6/debian-x86_64-2019-05-14.cgz/300s/8T/=
lkp-knm01/anon-cow-seq-hugetlb/vm-scalability
> =

> commit: =

>   f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer console=
")
>   90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic framebu=
ffer emulation")
> =

> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           2:4          -50%            :4     dmesg.WARNING:at#for_ip_int=
errupt_entry/0x
>            :4           25%           1:4     dmesg.WARNING:at_ip___perf_=
sw_event/0x
>            :4           25%           1:4     dmesg.WARNING:at_ip__fsnoti=
fy_parent/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>      43955 =C2=B1  2%     -18.8%      35691        vm-scalability.median
>       0.06 =C2=B1  7%    +193.0%       0.16 =C2=B1  2%  vm-scalability.me=
dian_stddev
>   14906559 =C2=B1  2%     -17.9%   12237079        vm-scalability.through=
put
>      87651 =C2=B1  2%     -17.4%      72374        vm-scalability.time.in=
voluntary_context_switches
>    2086168           -23.6%    1594224        vm-scalability.time.minor_p=
age_faults
>      15082 =C2=B1  2%     -10.4%      13517        vm-scalability.time.pe=
rcent_of_cpu_this_job_got
>      29987            -8.9%      27327        vm-scalability.time.system_=
time
>      15755           -12.4%      13795        vm-scalability.time.user_ti=
me
>     122011           -19.3%      98418        vm-scalability.time.volunta=
ry_context_switches
>  3.034e+09           -23.6%  2.318e+09        vm-scalability.workload
>     242478 =C2=B1 12%     +68.5%     408518 =C2=B1 23%  cpuidle.POLL.time
>       2788 =C2=B1 21%    +117.4%       6062 =C2=B1 26%  cpuidle.POLL.usage
>      56653 =C2=B1 10%     +64.4%      93144 =C2=B1 20%  meminfo.Mapped
>     120392 =C2=B1  7%     +14.0%     137212 =C2=B1  4%  meminfo.Shmem
>      47221 =C2=B1 11%     +77.1%      83634 =C2=B1 22%  numa-meminfo.node=
0.Mapped
>     120465 =C2=B1  7%     +13.9%     137205 =C2=B1  4%  numa-meminfo.node=
0.Shmem
>    2885513           -16.5%    2409384        numa-numastat.node0.local_n=
ode
>    2885471           -16.5%    2409354        numa-numastat.node0.numa_hit
>      11813 =C2=B1 11%     +76.3%      20824 =C2=B1 22%  numa-vmstat.node0=
.nr_mapped
>      30096 =C2=B1  7%     +13.8%      34238 =C2=B1  4%  numa-vmstat.node0=
.nr_shmem
>      43.72 =C2=B1  2%      +5.5       49.20        mpstat.cpu.all.idle%
>       0.03 =C2=B1  4%      +0.0        0.05 =C2=B1  6%  mpstat.cpu.all.so=
ft%
>      19.51            -2.4       17.08        mpstat.cpu.all.usr%
>       1012            -7.9%     932.75        turbostat.Avg_MHz
>      32.38 =C2=B1 10%     +25.8%      40.73        turbostat.CPU%c1
>     145.51            -3.1%     141.01        turbostat.PkgWatt
>      15.09           -19.2%      12.19        turbostat.RAMWatt
>      43.50 =C2=B1  2%     +13.2%      49.25        vmstat.cpu.id
>      18.75 =C2=B1  2%     -13.3%      16.25 =C2=B1  2%  vmstat.cpu.us
>     152.00 =C2=B1  2%      -9.5%     137.50        vmstat.procs.r
>       4800           -13.1%       4173        vmstat.system.cs
>     156170           -11.9%     137594        slabinfo.anon_vma.active_ob=
js
>       3395           -11.9%       2991        slabinfo.anon_vma.active_sl=
abs
>     156190           -11.9%     137606        slabinfo.anon_vma.num_objs
>       3395           -11.9%       2991        slabinfo.anon_vma.num_slabs
>       1716 =C2=B1  5%     +11.5%       1913 =C2=B1  8%  slabinfo.dmaengin=
e-unmap-16.active_objs
>       1716 =C2=B1  5%     +11.5%       1913 =C2=B1  8%  slabinfo.dmaengin=
e-unmap-16.num_objs
>       1767 =C2=B1  2%     -19.0%       1431 =C2=B1  2%  slabinfo.hugetlbf=
s_inode_cache.active_objs
>       1767 =C2=B1  2%     -19.0%       1431 =C2=B1  2%  slabinfo.hugetlbf=
s_inode_cache.num_objs
>       3597 =C2=B1  5%     -16.4%       3006 =C2=B1  3%  slabinfo.skbuff_e=
xt_cache.active_objs
>       3597 =C2=B1  5%     -16.4%       3006 =C2=B1  3%  slabinfo.skbuff_e=
xt_cache.num_objs
>    1330122           -23.6%    1016557        proc-vmstat.htlb_buddy_allo=
c_success
>      77214 =C2=B1  3%      +6.4%      82128 =C2=B1  2%  proc-vmstat.nr_ac=
tive_anon
>      67277            +2.9%      69246        proc-vmstat.nr_anon_pages
>     218.50 =C2=B1  3%     -10.6%     195.25        proc-vmstat.nr_dirtied
>     288628            +1.4%     292755        proc-vmstat.nr_file_pages
>     360.50            -2.7%     350.75        proc-vmstat.nr_inactive_file
>      14225 =C2=B1  9%     +63.8%      23304 =C2=B1 20%  proc-vmstat.nr_ma=
pped
>      30109 =C2=B1  7%     +13.8%      34259 =C2=B1  4%  proc-vmstat.nr_sh=
mem
>      99870            -1.3%      98597        proc-vmstat.nr_slab_unrecla=
imable
>     204.00 =C2=B1  4%     -12.1%     179.25        proc-vmstat.nr_written
>      77214 =C2=B1  3%      +6.4%      82128 =C2=B1  2%  proc-vmstat.nr_zo=
ne_active_anon
>     360.50            -2.7%     350.75        proc-vmstat.nr_zone_inactiv=
e_file
>       8810 =C2=B1 19%     -66.1%       2987 =C2=B1 42%  proc-vmstat.numa_=
hint_faults
>       8810 =C2=B1 19%     -66.1%       2987 =C2=B1 42%  proc-vmstat.numa_=
hint_faults_local
>    2904082           -16.4%    2427026        proc-vmstat.numa_hit
>    2904081           -16.4%    2427025        proc-vmstat.numa_local
>  6.828e+08           -23.5%  5.221e+08        proc-vmstat.pgalloc_normal
>    2900008           -17.2%    2400195        proc-vmstat.pgfault
>  6.827e+08           -23.5%   5.22e+08        proc-vmstat.pgfree
>  1.635e+10           -17.0%  1.357e+10        perf-stat.i.branch-instruct=
ions
>       1.53 =C2=B1  4%      -0.1        1.45 =C2=B1  3%  perf-stat.i.branc=
h-miss-rate%
>  2.581e+08 =C2=B1  3%     -20.5%  2.051e+08 =C2=B1  2%  perf-stat.i.branc=
h-misses
>      12.66            +1.1       13.78        perf-stat.i.cache-miss-rate%
>   72720849           -12.0%   63958986        perf-stat.i.cache-misses
>  5.766e+08           -18.6%  4.691e+08        perf-stat.i.cache-references
>       4674 =C2=B1  2%     -13.0%       4064        perf-stat.i.context-sw=
itches
>       4.29           +12.5%       4.83        perf-stat.i.cpi
>  2.573e+11            -7.4%  2.383e+11        perf-stat.i.cpu-cycles
>     231.35           -21.5%     181.56        perf-stat.i.cpu-migrations
>       3522            +4.4%       3677        perf-stat.i.cycles-between-=
cache-misses
>       0.09 =C2=B1 13%      +0.0        0.12 =C2=B1  5%  perf-stat.i.iTLB-=
load-miss-rate%
>  5.894e+10           -15.8%  4.961e+10        perf-stat.i.iTLB-loads
>  5.901e+10           -15.8%  4.967e+10        perf-stat.i.instructions
>       1291 =C2=B1 14%     -21.8%       1010        perf-stat.i.instructio=
ns-per-iTLB-miss
>       0.24           -11.0%       0.21        perf-stat.i.ipc
>       9476           -17.5%       7821        perf-stat.i.minor-faults
>       9478           -17.5%       7821        perf-stat.i.page-faults
>       9.76            -3.6%       9.41        perf-stat.overall.MPKI
>       1.59 =C2=B1  4%      -0.1        1.52        perf-stat.overall.bran=
ch-miss-rate%
>      12.61            +1.1       13.71        perf-stat.overall.cache-mis=
s-rate%
>       4.38           +10.5%       4.83        perf-stat.overall.cpi
>       3557            +5.3%       3747        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.08 =C2=B1 12%      +0.0        0.10        perf-stat.overall.iTLB=
-load-miss-rate%
>       1268 =C2=B1 15%     -23.0%     976.22        perf-stat.overall.inst=
ructions-per-iTLB-miss
>       0.23            -9.5%       0.21        perf-stat.overall.ipc
>       5815            +9.7%       6378        perf-stat.overall.path-leng=
th
>  1.634e+10           -17.5%  1.348e+10        perf-stat.ps.branch-instruc=
tions
>  2.595e+08 =C2=B1  3%     -21.2%  2.043e+08 =C2=B1  2%  perf-stat.ps.bran=
ch-misses
>   72565205           -12.2%   63706339        perf-stat.ps.cache-misses
>  5.754e+08           -19.2%  4.646e+08        perf-stat.ps.cache-referenc=
es
>       4640 =C2=B1  2%     -12.5%       4060        perf-stat.ps.context-s=
witches
>  2.581e+11            -7.5%  2.387e+11        perf-stat.ps.cpu-cycles
>     229.91           -22.0%     179.42        perf-stat.ps.cpu-migrations
>  5.889e+10           -16.3%  4.927e+10        perf-stat.ps.iTLB-loads
>  5.899e+10           -16.3%  4.938e+10        perf-stat.ps.instructions
>       9388           -18.2%       7677        perf-stat.ps.minor-faults
>       9389           -18.2%       7677        perf-stat.ps.page-faults
>  1.764e+13           -16.2%  1.479e+13        perf-stat.total.instructions
>      46803 =C2=B1  3%     -18.8%      37982 =C2=B1  6%  sched_debug.cfs_r=
q:/.exec_clock.min
>       5320 =C2=B1  3%     +23.7%       6581 =C2=B1  3%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>       6737 =C2=B1 14%     +58.1%      10649 =C2=B1 10%  sched_debug.cfs_r=
q:/.load.avg
>     587978 =C2=B1 17%     +58.2%     930382 =C2=B1  9%  sched_debug.cfs_r=
q:/.load.max
>      46952 =C2=B1 16%     +64.8%      77388 =C2=B1 11%  sched_debug.cfs_r=
q:/.load.stddev
>       7.12 =C2=B1  4%     +49.1%      10.62 =C2=B1  6%  sched_debug.cfs_r=
q:/.load_avg.avg
>     474.40 =C2=B1 23%     +67.5%     794.60 =C2=B1 10%  sched_debug.cfs_r=
q:/.load_avg.max
>      37.70 =C2=B1 11%     +74.8%      65.90 =C2=B1  9%  sched_debug.cfs_r=
q:/.load_avg.stddev
>   13424269 =C2=B1  4%     -15.6%   11328098 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vruntime.avg
>   15411275 =C2=B1  3%     -12.4%   13505072 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vruntime.max
>    7939295 =C2=B1  6%     -17.5%    6551322 =C2=B1  7%  sched_debug.cfs_r=
q:/.min_vruntime.min
>      21.44 =C2=B1  7%     -56.1%       9.42 =C2=B1  4%  sched_debug.cfs_r=
q:/.nr_spread_over.avg
>     117.45 =C2=B1 11%     -60.6%      46.30 =C2=B1 14%  sched_debug.cfs_r=
q:/.nr_spread_over.max
>      19.33 =C2=B1  8%     -66.4%       6.49 =C2=B1  9%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>       4.32 =C2=B1 15%     +84.4%       7.97 =C2=B1  3%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>     353.85 =C2=B1 29%    +118.8%     774.35 =C2=B1 11%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>      27.30 =C2=B1 24%    +118.5%      59.64 =C2=B1  9%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>       6729 =C2=B1 14%     +58.2%      10644 =C2=B1 10%  sched_debug.cfs_r=
q:/.runnable_weight.avg
>     587978 =C2=B1 17%     +58.2%     930382 =C2=B1  9%  sched_debug.cfs_r=
q:/.runnable_weight.max
>      46950 =C2=B1 16%     +64.8%      77387 =C2=B1 11%  sched_debug.cfs_r=
q:/.runnable_weight.stddev
>    5305069 =C2=B1  4%     -17.4%    4380376 =C2=B1  7%  sched_debug.cfs_r=
q:/.spread0.avg
>    7328745 =C2=B1  3%      -9.9%    6600897 =C2=B1  3%  sched_debug.cfs_r=
q:/.spread0.max
>    2220837 =C2=B1  4%     +55.8%    3460596 =C2=B1  5%  sched_debug.cpu.a=
vg_idle.avg
>    4590666 =C2=B1  9%     +76.8%    8117037 =C2=B1 15%  sched_debug.cpu.a=
vg_idle.max
>     485052 =C2=B1  7%     +80.3%     874679 =C2=B1 10%  sched_debug.cpu.a=
vg_idle.stddev
>     561.50 =C2=B1 26%     +37.7%     773.30 =C2=B1 15%  sched_debug.cpu.c=
lock.stddev
>     561.50 =C2=B1 26%     +37.7%     773.30 =C2=B1 15%  sched_debug.cpu.c=
lock_task.stddev
>       3.20 =C2=B1 10%    +109.6%       6.70 =C2=B1  3%  sched_debug.cpu.c=
pu_load[0].avg
>     309.10 =C2=B1 20%    +150.3%     773.75 =C2=B1 12%  sched_debug.cpu.c=
pu_load[0].max
>      21.02 =C2=B1 14%    +160.8%      54.80 =C2=B1  9%  sched_debug.cpu.c=
pu_load[0].stddev
>       3.19 =C2=B1  8%    +109.8%       6.70 =C2=B1  3%  sched_debug.cpu.c=
pu_load[1].avg
>     299.75 =C2=B1 19%    +158.0%     773.30 =C2=B1 12%  sched_debug.cpu.c=
pu_load[1].max
>      20.32 =C2=B1 12%    +168.7%      54.62 =C2=B1  9%  sched_debug.cpu.c=
pu_load[1].stddev
>       3.20 =C2=B1  8%    +109.1%       6.69 =C2=B1  4%  sched_debug.cpu.c=
pu_load[2].avg
>     288.90 =C2=B1 20%    +167.0%     771.40 =C2=B1 12%  sched_debug.cpu.c=
pu_load[2].max
>      19.70 =C2=B1 12%    +175.4%      54.27 =C2=B1  9%  sched_debug.cpu.c=
pu_load[2].stddev
>       3.16 =C2=B1  8%    +110.9%       6.66 =C2=B1  6%  sched_debug.cpu.c=
pu_load[3].avg
>     275.50 =C2=B1 24%    +178.4%     766.95 =C2=B1 12%  sched_debug.cpu.c=
pu_load[3].max
>      18.92 =C2=B1 15%    +184.2%      53.77 =C2=B1 10%  sched_debug.cpu.c=
pu_load[3].stddev
>       3.08 =C2=B1  8%    +115.7%       6.65 =C2=B1  7%  sched_debug.cpu.c=
pu_load[4].avg
>     263.55 =C2=B1 28%    +188.7%     760.85 =C2=B1 12%  sched_debug.cpu.c=
pu_load[4].max
>      18.03 =C2=B1 18%    +196.6%      53.46 =C2=B1 11%  sched_debug.cpu.c=
pu_load[4].stddev
>      14543            -9.6%      13150        sched_debug.cpu.curr->pid.m=
ax
>       5293 =C2=B1 16%     +74.7%       9248 =C2=B1 11%  sched_debug.cpu.l=
oad.avg
>     587978 =C2=B1 17%     +58.2%     930382 =C2=B1  9%  sched_debug.cpu.l=
oad.max
>      40887 =C2=B1 19%     +78.3%      72891 =C2=B1  9%  sched_debug.cpu.l=
oad.stddev
>    1141679 =C2=B1  4%     +56.9%    1790907 =C2=B1  5%  sched_debug.cpu.m=
ax_idle_balance_cost.avg
>    2432100 =C2=B1  9%     +72.6%    4196779 =C2=B1 13%  sched_debug.cpu.m=
ax_idle_balance_cost.max
>     745656           +29.3%     964170 =C2=B1  5%  sched_debug.cpu.max_id=
le_balance_cost.min
>     239032 =C2=B1  9%     +81.9%     434806 =C2=B1 10%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>       0.00 =C2=B1 27%     +92.1%       0.00 =C2=B1 31%  sched_debug.cpu.n=
ext_balance.stddev
>       1030 =C2=B1  4%     -10.4%     924.00 =C2=B1  2%  sched_debug.cpu.n=
r_switches.min
>       0.04 =C2=B1 26%    +139.0%       0.09 =C2=B1 41%  sched_debug.cpu.n=
r_uninterruptible.avg
>     830.35 =C2=B1  6%     -12.0%     730.50 =C2=B1  2%  sched_debug.cpu.s=
ched_count.min
>     912.00 =C2=B1  2%      -9.5%     825.38        sched_debug.cpu.ttwu_c=
ount.avg
>     433.05 =C2=B1  3%     -19.2%     350.05 =C2=B1  3%  sched_debug.cpu.t=
twu_count.min
>     160.70 =C2=B1  3%     -12.5%     140.60 =C2=B1  4%  sched_debug.cpu.t=
twu_local.min
>       9072 =C2=B1 11%     -36.4%       5767 =C2=B1  8%  softirqs.CPU1.RCU
>      12769 =C2=B1  5%     +15.3%      14718 =C2=B1  3%  softirqs.CPU101.S=
CHED
>      13198           +11.5%      14717 =C2=B1  3%  softirqs.CPU102.SCHED
>      12981 =C2=B1  4%     +13.9%      14788 =C2=B1  3%  softirqs.CPU105.S=
CHED
>      13486 =C2=B1  3%     +11.8%      15071 =C2=B1  4%  softirqs.CPU111.S=
CHED
>      12794 =C2=B1  4%     +14.1%      14601 =C2=B1  9%  softirqs.CPU112.S=
CHED
>      12999 =C2=B1  4%     +10.1%      14314 =C2=B1  4%  softirqs.CPU115.S=
CHED
>      12844 =C2=B1  4%     +10.6%      14202 =C2=B1  2%  softirqs.CPU120.S=
CHED
>      13336 =C2=B1  3%      +9.4%      14585 =C2=B1  3%  softirqs.CPU122.S=
CHED
>      12639 =C2=B1  4%     +20.2%      15195        softirqs.CPU123.SCHED
>      13040 =C2=B1  5%     +15.2%      15024 =C2=B1  5%  softirqs.CPU126.S=
CHED
>      13123           +15.1%      15106 =C2=B1  5%  softirqs.CPU127.SCHED
>       9188 =C2=B1  6%     -35.7%       5911 =C2=B1  2%  softirqs.CPU13.RCU
>      13054 =C2=B1  3%     +13.1%      14761 =C2=B1  5%  softirqs.CPU130.S=
CHED
>      13158 =C2=B1  2%     +13.9%      14985 =C2=B1  5%  softirqs.CPU131.S=
CHED
>      12797 =C2=B1  6%     +13.5%      14524 =C2=B1  3%  softirqs.CPU133.S=
CHED
>      12452 =C2=B1  5%     +14.8%      14297        softirqs.CPU134.SCHED
>      13078 =C2=B1  3%     +10.4%      14439 =C2=B1  3%  softirqs.CPU138.S=
CHED
>      12617 =C2=B1  2%     +14.5%      14442 =C2=B1  5%  softirqs.CPU139.S=
CHED
>      12974 =C2=B1  3%     +13.7%      14752 =C2=B1  4%  softirqs.CPU142.S=
CHED
>      12579 =C2=B1  4%     +19.1%      14983 =C2=B1  3%  softirqs.CPU143.S=
CHED
>       9122 =C2=B1 24%     -44.6%       5053 =C2=B1  5%  softirqs.CPU144.R=
CU
>      13366 =C2=B1  2%     +11.1%      14848 =C2=B1  3%  softirqs.CPU149.S=
CHED
>      13246 =C2=B1  2%     +22.0%      16162 =C2=B1  7%  softirqs.CPU150.S=
CHED
>      13452 =C2=B1  3%     +20.5%      16210 =C2=B1  7%  softirqs.CPU151.S=
CHED
>      13507           +10.1%      14869        softirqs.CPU156.SCHED
>      13808 =C2=B1  3%      +9.2%      15079 =C2=B1  4%  softirqs.CPU157.S=
CHED
>      13442 =C2=B1  2%     +13.4%      15248 =C2=B1  4%  softirqs.CPU160.S=
CHED
>      13311           +12.1%      14920 =C2=B1  2%  softirqs.CPU162.SCHED
>      13544 =C2=B1  3%      +8.5%      14695 =C2=B1  4%  softirqs.CPU163.S=
CHED
>      13648 =C2=B1  3%     +11.2%      15179 =C2=B1  2%  softirqs.CPU166.S=
CHED
>      13404 =C2=B1  4%     +12.5%      15079 =C2=B1  3%  softirqs.CPU168.S=
CHED
>      13421 =C2=B1  6%     +16.0%      15568 =C2=B1  8%  softirqs.CPU169.S=
CHED
>      13115 =C2=B1  3%     +23.1%      16139 =C2=B1 10%  softirqs.CPU171.S=
CHED
>      13424 =C2=B1  6%     +10.4%      14822 =C2=B1  3%  softirqs.CPU175.S=
CHED
>      13274 =C2=B1  3%     +13.7%      15087 =C2=B1  9%  softirqs.CPU185.S=
CHED
>      13409 =C2=B1  3%     +12.3%      15063 =C2=B1  3%  softirqs.CPU190.S=
CHED
>      13181 =C2=B1  7%     +13.4%      14946 =C2=B1  3%  softirqs.CPU196.S=
CHED
>      13578 =C2=B1  3%     +10.9%      15061        softirqs.CPU197.SCHED
>      13323 =C2=B1  5%     +24.8%      16627 =C2=B1  6%  softirqs.CPU198.S=
CHED
>      14072 =C2=B1  2%     +12.3%      15798 =C2=B1  7%  softirqs.CPU199.S=
CHED
>      12604 =C2=B1 13%     +17.9%      14865        softirqs.CPU201.SCHED
>      13380 =C2=B1  4%     +14.8%      15356 =C2=B1  3%  softirqs.CPU203.S=
CHED
>      13481 =C2=B1  8%     +14.2%      15390 =C2=B1  3%  softirqs.CPU204.S=
CHED
>      12921 =C2=B1  2%     +13.8%      14710 =C2=B1  3%  softirqs.CPU206.S=
CHED
>      13468           +13.0%      15218 =C2=B1  2%  softirqs.CPU208.SCHED
>      13253 =C2=B1  2%     +13.1%      14992        softirqs.CPU209.SCHED
>      13319 =C2=B1  2%     +14.3%      15225 =C2=B1  7%  softirqs.CPU210.S=
CHED
>      13673 =C2=B1  5%     +16.3%      15895 =C2=B1  3%  softirqs.CPU211.S=
CHED
>      13290           +17.0%      15556 =C2=B1  5%  softirqs.CPU212.SCHED
>      13455 =C2=B1  4%     +14.4%      15392 =C2=B1  3%  softirqs.CPU213.S=
CHED
>      13454 =C2=B1  4%     +14.3%      15377 =C2=B1  3%  softirqs.CPU215.S=
CHED
>      13872 =C2=B1  7%      +9.7%      15221 =C2=B1  5%  softirqs.CPU220.S=
CHED
>      13555 =C2=B1  4%     +17.3%      15896 =C2=B1  5%  softirqs.CPU222.S=
CHED
>      13411 =C2=B1  4%     +20.8%      16197 =C2=B1  6%  softirqs.CPU223.S=
CHED
>       8472 =C2=B1 21%     -44.8%       4680 =C2=B1  3%  softirqs.CPU224.R=
CU
>      13141 =C2=B1  3%     +16.2%      15265 =C2=B1  7%  softirqs.CPU225.S=
CHED
>      14084 =C2=B1  3%      +8.2%      15242 =C2=B1  2%  softirqs.CPU226.S=
CHED
>      13528 =C2=B1  4%     +11.3%      15063 =C2=B1  4%  softirqs.CPU228.S=
CHED
>      13218 =C2=B1  3%     +16.3%      15377 =C2=B1  4%  softirqs.CPU229.S=
CHED
>      14031 =C2=B1  4%     +10.2%      15467 =C2=B1  2%  softirqs.CPU231.S=
CHED
>      13770 =C2=B1  3%     +14.0%      15700 =C2=B1  3%  softirqs.CPU232.S=
CHED
>      13456 =C2=B1  3%     +12.3%      15105 =C2=B1  3%  softirqs.CPU233.S=
CHED
>      13137 =C2=B1  4%     +13.5%      14909 =C2=B1  3%  softirqs.CPU234.S=
CHED
>      13318 =C2=B1  2%     +14.7%      15280 =C2=B1  2%  softirqs.CPU235.S=
CHED
>      13690 =C2=B1  2%     +13.7%      15563 =C2=B1  7%  softirqs.CPU238.S=
CHED
>      13771 =C2=B1  5%     +20.8%      16634 =C2=B1  7%  softirqs.CPU241.S=
CHED
>      13317 =C2=B1  7%     +19.5%      15919 =C2=B1  9%  softirqs.CPU243.S=
CHED
>       8234 =C2=B1 16%     -43.9%       4616 =C2=B1  5%  softirqs.CPU244.R=
CU
>      13845 =C2=B1  6%     +13.0%      15643 =C2=B1  3%  softirqs.CPU244.S=
CHED
>      13179 =C2=B1  3%     +16.3%      15323        softirqs.CPU246.SCHED
>      13754           +12.2%      15438 =C2=B1  3%  softirqs.CPU248.SCHED
>      13769 =C2=B1  4%     +10.9%      15276 =C2=B1  2%  softirqs.CPU252.S=
CHED
>      13702           +10.5%      15147 =C2=B1  2%  softirqs.CPU254.SCHED
>      13315 =C2=B1  2%     +12.5%      14980 =C2=B1  3%  softirqs.CPU255.S=
CHED
>      13785 =C2=B1  3%     +12.9%      15568 =C2=B1  5%  softirqs.CPU256.S=
CHED
>      13307 =C2=B1  3%     +15.0%      15298 =C2=B1  3%  softirqs.CPU257.S=
CHED
>      13864 =C2=B1  3%     +10.5%      15313 =C2=B1  2%  softirqs.CPU259.S=
CHED
>      13879 =C2=B1  2%     +11.4%      15465        softirqs.CPU261.SCHED
>      13815           +13.6%      15687 =C2=B1  5%  softirqs.CPU264.SCHED
>     119574 =C2=B1  2%     +11.8%     133693 =C2=B1 11%  softirqs.CPU266.T=
IMER
>      13688           +10.9%      15180 =C2=B1  6%  softirqs.CPU267.SCHED
>      11716 =C2=B1  4%     +19.3%      13974 =C2=B1  8%  softirqs.CPU27.SC=
HED
>      13866 =C2=B1  3%     +13.7%      15765 =C2=B1  4%  softirqs.CPU271.S=
CHED
>      13887 =C2=B1  5%     +12.5%      15621        softirqs.CPU272.SCHED
>      13383 =C2=B1  3%     +19.8%      16031 =C2=B1  2%  softirqs.CPU274.S=
CHED
>      13347           +14.1%      15232 =C2=B1  3%  softirqs.CPU275.SCHED
>      12884 =C2=B1  2%     +21.0%      15593 =C2=B1  4%  softirqs.CPU276.S=
CHED
>      13131 =C2=B1  5%     +13.4%      14891 =C2=B1  5%  softirqs.CPU277.S=
CHED
>      12891 =C2=B1  2%     +19.2%      15371 =C2=B1  4%  softirqs.CPU278.S=
CHED
>      13313 =C2=B1  4%     +13.0%      15049 =C2=B1  2%  softirqs.CPU279.S=
CHED
>      13514 =C2=B1  3%     +10.2%      14897 =C2=B1  2%  softirqs.CPU280.S=
CHED
>      13501 =C2=B1  3%     +13.7%      15346        softirqs.CPU281.SCHED
>      13261           +17.5%      15577        softirqs.CPU282.SCHED
>       8076 =C2=B1 15%     -43.7%       4546 =C2=B1  5%  softirqs.CPU283.R=
CU
>      13686 =C2=B1  3%     +12.6%      15413 =C2=B1  2%  softirqs.CPU284.S=
CHED
>      13439 =C2=B1  2%      +9.2%      14670 =C2=B1  4%  softirqs.CPU285.S=
CHED
>       8878 =C2=B1  9%     -35.4%       5735 =C2=B1  4%  softirqs.CPU35.RCU
>      11690 =C2=B1  2%     +13.6%      13274 =C2=B1  5%  softirqs.CPU40.SC=
HED
>      11714 =C2=B1  2%     +19.3%      13975 =C2=B1 13%  softirqs.CPU41.SC=
HED
>      11763           +12.5%      13239 =C2=B1  4%  softirqs.CPU45.SCHED
>      11662 =C2=B1  2%      +9.4%      12757 =C2=B1  3%  softirqs.CPU46.SC=
HED
>      11805 =C2=B1  2%      +9.3%      12902 =C2=B1  2%  softirqs.CPU50.SC=
HED
>      12158 =C2=B1  3%     +12.3%      13655 =C2=B1  8%  softirqs.CPU55.SC=
HED
>      11716 =C2=B1  4%      +8.8%      12751 =C2=B1  3%  softirqs.CPU58.SC=
HED
>      11922 =C2=B1  2%      +9.9%      13100 =C2=B1  4%  softirqs.CPU64.SC=
HED
>       9674 =C2=B1 17%     -41.8%       5625 =C2=B1  6%  softirqs.CPU66.RCU
>      11818           +12.0%      13237        softirqs.CPU66.SCHED
>     124682 =C2=B1  7%      -6.1%     117088 =C2=B1  5%  softirqs.CPU66.TI=
MER
>       8637 =C2=B1  9%     -34.0%       5700 =C2=B1  7%  softirqs.CPU70.RCU
>      11624 =C2=B1  2%     +11.0%      12901 =C2=B1  2%  softirqs.CPU70.SC=
HED
>      12372 =C2=B1  2%     +13.2%      14003 =C2=B1  3%  softirqs.CPU71.SC=
HED
>       9949 =C2=B1 25%     -33.9%       6574 =C2=B1 31%  softirqs.CPU72.RCU
>      10392 =C2=B1 26%     -35.1%       6745 =C2=B1 35%  softirqs.CPU73.RCU
>      12766 =C2=B1  3%     +11.1%      14188 =C2=B1  3%  softirqs.CPU76.SC=
HED
>      12611 =C2=B1  2%     +18.8%      14984 =C2=B1  5%  softirqs.CPU78.SC=
HED
>      12786 =C2=B1  3%     +17.9%      15079 =C2=B1  7%  softirqs.CPU79.SC=
HED
>      11947 =C2=B1  4%      +9.7%      13103 =C2=B1  4%  softirqs.CPU8.SCH=
ED
>      13379 =C2=B1  7%     +11.8%      14962 =C2=B1  4%  softirqs.CPU83.SC=
HED
>      13438 =C2=B1  5%      +9.7%      14738 =C2=B1  2%  softirqs.CPU84.SC=
HED
>      12768           +19.4%      15241 =C2=B1  6%  softirqs.CPU88.SCHED
>       8604 =C2=B1 13%     -39.3%       5222 =C2=B1  3%  softirqs.CPU89.RCU
>      13077 =C2=B1  2%     +17.1%      15308 =C2=B1  7%  softirqs.CPU89.SC=
HED
>      11887 =C2=B1  3%     +20.1%      14272 =C2=B1  5%  softirqs.CPU9.SCH=
ED
>      12723 =C2=B1  3%     +11.3%      14165 =C2=B1  4%  softirqs.CPU90.SC=
HED
>       8439 =C2=B1 12%     -38.9%       5153 =C2=B1  4%  softirqs.CPU91.RCU
>      13429 =C2=B1  3%     +10.3%      14806 =C2=B1  2%  softirqs.CPU95.SC=
HED
>      12852 =C2=B1  4%     +10.3%      14174 =C2=B1  5%  softirqs.CPU96.SC=
HED
>      13010 =C2=B1  2%     +14.4%      14888 =C2=B1  5%  softirqs.CPU97.SC=
HED
>    2315644 =C2=B1  4%     -36.2%    1477200 =C2=B1  4%  softirqs.RCU
>       1572 =C2=B1 10%     +63.9%       2578 =C2=B1 39%  interrupts.CPU0.N=
MI:Non-maskable_interrupts
>       1572 =C2=B1 10%     +63.9%       2578 =C2=B1 39%  interrupts.CPU0.P=
MI:Performance_monitoring_interrupts
>     252.00 =C2=B1 11%     -35.2%     163.25 =C2=B1 13%  interrupts.CPU104=
.RES:Rescheduling_interrupts
>       2738 =C2=B1 24%     +52.4%       4173 =C2=B1 19%  interrupts.CPU105=
.NMI:Non-maskable_interrupts
>       2738 =C2=B1 24%     +52.4%       4173 =C2=B1 19%  interrupts.CPU105=
.PMI:Performance_monitoring_interrupts
>     245.75 =C2=B1 19%     -31.0%     169.50 =C2=B1  7%  interrupts.CPU105=
.RES:Rescheduling_interrupts
>     228.75 =C2=B1 13%     -24.7%     172.25 =C2=B1 19%  interrupts.CPU106=
.RES:Rescheduling_interrupts
>       2243 =C2=B1 15%     +66.3%       3730 =C2=B1 35%  interrupts.CPU113=
.NMI:Non-maskable_interrupts
>       2243 =C2=B1 15%     +66.3%       3730 =C2=B1 35%  interrupts.CPU113=
.PMI:Performance_monitoring_interrupts
>       2703 =C2=B1 31%     +67.0%       4514 =C2=B1 33%  interrupts.CPU118=
.NMI:Non-maskable_interrupts
>       2703 =C2=B1 31%     +67.0%       4514 =C2=B1 33%  interrupts.CPU118=
.PMI:Performance_monitoring_interrupts
>       2613 =C2=B1 25%     +42.2%       3715 =C2=B1 24%  interrupts.CPU121=
.NMI:Non-maskable_interrupts
>       2613 =C2=B1 25%     +42.2%       3715 =C2=B1 24%  interrupts.CPU121=
.PMI:Performance_monitoring_interrupts
>     311.50 =C2=B1 23%     -47.7%     163.00 =C2=B1  9%  interrupts.CPU122=
.RES:Rescheduling_interrupts
>     266.75 =C2=B1 19%     -31.6%     182.50 =C2=B1 15%  interrupts.CPU124=
.RES:Rescheduling_interrupts
>     293.75 =C2=B1 33%     -32.3%     198.75 =C2=B1 19%  interrupts.CPU125=
.RES:Rescheduling_interrupts
>       2601 =C2=B1 36%     +43.2%       3724 =C2=B1 29%  interrupts.CPU127=
.NMI:Non-maskable_interrupts
>       2601 =C2=B1 36%     +43.2%       3724 =C2=B1 29%  interrupts.CPU127=
.PMI:Performance_monitoring_interrupts
>       2258 =C2=B1 21%     +68.2%       3797 =C2=B1 29%  interrupts.CPU13.=
NMI:Non-maskable_interrupts
>       2258 =C2=B1 21%     +68.2%       3797 =C2=B1 29%  interrupts.CPU13.=
PMI:Performance_monitoring_interrupts
>       3338 =C2=B1 29%     +54.6%       5160 =C2=B1  9%  interrupts.CPU139=
.NMI:Non-maskable_interrupts
>       3338 =C2=B1 29%     +54.6%       5160 =C2=B1  9%  interrupts.CPU139=
.PMI:Performance_monitoring_interrupts
>     219.50 =C2=B1 27%     -23.0%     169.00 =C2=B1 21%  interrupts.CPU139=
.RES:Rescheduling_interrupts
>     290.25 =C2=B1 25%     -32.5%     196.00 =C2=B1 11%  interrupts.CPU14.=
RES:Rescheduling_interrupts
>     243.50 =C2=B1  4%     -16.0%     204.50 =C2=B1 12%  interrupts.CPU140=
.RES:Rescheduling_interrupts
>       1797 =C2=B1 15%    +135.0%       4223 =C2=B1 46%  interrupts.CPU147=
.NMI:Non-maskable_interrupts
>       1797 =C2=B1 15%    +135.0%       4223 =C2=B1 46%  interrupts.CPU147=
.PMI:Performance_monitoring_interrupts
>       2537 =C2=B1 22%     +89.6%       4812 =C2=B1 28%  interrupts.CPU15.=
NMI:Non-maskable_interrupts
>       2537 =C2=B1 22%     +89.6%       4812 =C2=B1 28%  interrupts.CPU15.=
PMI:Performance_monitoring_interrupts
>     292.25 =C2=B1 34%     -33.9%     193.25 =C2=B1  6%  interrupts.CPU15.=
RES:Rescheduling_interrupts
>     424.25 =C2=B1 37%     -58.5%     176.25 =C2=B1 14%  interrupts.CPU158=
.RES:Rescheduling_interrupts
>     312.50 =C2=B1 42%     -54.2%     143.00 =C2=B1 18%  interrupts.CPU159=
.RES:Rescheduling_interrupts
>     725.00 =C2=B1118%     -75.7%     176.25 =C2=B1 14%  interrupts.CPU163=
.RES:Rescheduling_interrupts
>       2367 =C2=B1  6%     +59.9%       3786 =C2=B1 24%  interrupts.CPU177=
.NMI:Non-maskable_interrupts
>       2367 =C2=B1  6%     +59.9%       3786 =C2=B1 24%  interrupts.CPU177=
.PMI:Performance_monitoring_interrupts
>     239.50 =C2=B1 30%     -46.6%     128.00 =C2=B1 14%  interrupts.CPU179=
.RES:Rescheduling_interrupts
>     320.75 =C2=B1 15%     -24.0%     243.75 =C2=B1 20%  interrupts.CPU20.=
RES:Rescheduling_interrupts
>     302.50 =C2=B1 17%     -47.2%     159.75 =C2=B1  8%  interrupts.CPU200=
.RES:Rescheduling_interrupts
>       2166 =C2=B1  5%     +92.0%       4157 =C2=B1 40%  interrupts.CPU207=
.NMI:Non-maskable_interrupts
>       2166 =C2=B1  5%     +92.0%       4157 =C2=B1 40%  interrupts.CPU207=
.PMI:Performance_monitoring_interrupts
>     217.00 =C2=B1 11%     -34.6%     142.00 =C2=B1 12%  interrupts.CPU214=
.RES:Rescheduling_interrupts
>       2610 =C2=B1 36%     +47.4%       3848 =C2=B1 35%  interrupts.CPU215=
.NMI:Non-maskable_interrupts
>       2610 =C2=B1 36%     +47.4%       3848 =C2=B1 35%  interrupts.CPU215=
.PMI:Performance_monitoring_interrupts
>       2046 =C2=B1 13%    +118.6%       4475 =C2=B1 43%  interrupts.CPU22.=
NMI:Non-maskable_interrupts
>       2046 =C2=B1 13%    +118.6%       4475 =C2=B1 43%  interrupts.CPU22.=
PMI:Performance_monitoring_interrupts
>     289.50 =C2=B1 28%     -41.1%     170.50 =C2=B1  8%  interrupts.CPU22.=
RES:Rescheduling_interrupts
>       2232 =C2=B1  6%     +33.0%       2970 =C2=B1 24%  interrupts.CPU221=
.NMI:Non-maskable_interrupts
>       2232 =C2=B1  6%     +33.0%       2970 =C2=B1 24%  interrupts.CPU221=
.PMI:Performance_monitoring_interrupts
>       4552 =C2=B1 12%     -27.6%       3295 =C2=B1 15%  interrupts.CPU222=
.NMI:Non-maskable_interrupts
>       4552 =C2=B1 12%     -27.6%       3295 =C2=B1 15%  interrupts.CPU222=
.PMI:Performance_monitoring_interrupts
>       2013 =C2=B1 15%     +80.9%       3641 =C2=B1 27%  interrupts.CPU226=
.NMI:Non-maskable_interrupts
>       2013 =C2=B1 15%     +80.9%       3641 =C2=B1 27%  interrupts.CPU226=
.PMI:Performance_monitoring_interrupts
>       2575 =C2=B1 49%     +67.1%       4302 =C2=B1 34%  interrupts.CPU227=
.NMI:Non-maskable_interrupts
>       2575 =C2=B1 49%     +67.1%       4302 =C2=B1 34%  interrupts.CPU227=
.PMI:Performance_monitoring_interrupts
>     248.00 =C2=B1 36%     -36.3%     158.00 =C2=B1 19%  interrupts.CPU228=
.RES:Rescheduling_interrupts
>       2441 =C2=B1 24%     +43.0%       3490 =C2=B1 30%  interrupts.CPU23.=
NMI:Non-maskable_interrupts
>       2441 =C2=B1 24%     +43.0%       3490 =C2=B1 30%  interrupts.CPU23.=
PMI:Performance_monitoring_interrupts
>     404.25 =C2=B1 69%     -65.5%     139.50 =C2=B1 17%  interrupts.CPU236=
.RES:Rescheduling_interrupts
>     566.50 =C2=B1 40%     -73.6%     149.50 =C2=B1 31%  interrupts.CPU237=
.RES:Rescheduling_interrupts
>     243.50 =C2=B1 26%     -37.1%     153.25 =C2=B1 21%  interrupts.CPU248=
.RES:Rescheduling_interrupts
>     258.25 =C2=B1 12%     -53.5%     120.00 =C2=B1 18%  interrupts.CPU249=
.RES:Rescheduling_interrupts
>       2888 =C2=B1 27%     +49.4%       4313 =C2=B1 30%  interrupts.CPU253=
.NMI:Non-maskable_interrupts
>       2888 =C2=B1 27%     +49.4%       4313 =C2=B1 30%  interrupts.CPU253=
.PMI:Performance_monitoring_interrupts
>       2468 =C2=B1 44%     +67.3%       4131 =C2=B1 37%  interrupts.CPU256=
.NMI:Non-maskable_interrupts
>       2468 =C2=B1 44%     +67.3%       4131 =C2=B1 37%  interrupts.CPU256=
.PMI:Performance_monitoring_interrupts
>     425.00 =C2=B1 59%     -60.3%     168.75 =C2=B1 34%  interrupts.CPU258=
.RES:Rescheduling_interrupts
>       1859 =C2=B1 16%    +106.3%       3834 =C2=B1 44%  interrupts.CPU268=
.NMI:Non-maskable_interrupts
>       1859 =C2=B1 16%    +106.3%       3834 =C2=B1 44%  interrupts.CPU268=
.PMI:Performance_monitoring_interrupts
>       2684 =C2=B1 28%     +61.2%       4326 =C2=B1 36%  interrupts.CPU269=
.NMI:Non-maskable_interrupts
>       2684 =C2=B1 28%     +61.2%       4326 =C2=B1 36%  interrupts.CPU269=
.PMI:Performance_monitoring_interrupts
>       2171 =C2=B1  6%    +108.8%       4533 =C2=B1 20%  interrupts.CPU270=
.NMI:Non-maskable_interrupts
>       2171 =C2=B1  6%    +108.8%       4533 =C2=B1 20%  interrupts.CPU270=
.PMI:Performance_monitoring_interrupts
>       2262 =C2=B1 14%     +61.8%       3659 =C2=B1 37%  interrupts.CPU273=
.NMI:Non-maskable_interrupts
>       2262 =C2=B1 14%     +61.8%       3659 =C2=B1 37%  interrupts.CPU273=
.PMI:Performance_monitoring_interrupts
>       2203 =C2=B1 11%     +50.7%       3320 =C2=B1 38%  interrupts.CPU279=
.NMI:Non-maskable_interrupts
>       2203 =C2=B1 11%     +50.7%       3320 =C2=B1 38%  interrupts.CPU279=
.PMI:Performance_monitoring_interrupts
>       2433 =C2=B1 17%     +52.9%       3721 =C2=B1 25%  interrupts.CPU280=
.NMI:Non-maskable_interrupts
>       2433 =C2=B1 17%     +52.9%       3721 =C2=B1 25%  interrupts.CPU280=
.PMI:Performance_monitoring_interrupts
>       2778 =C2=B1 33%     +63.1%       4531 =C2=B1 36%  interrupts.CPU283=
.NMI:Non-maskable_interrupts
>       2778 =C2=B1 33%     +63.1%       4531 =C2=B1 36%  interrupts.CPU283=
.PMI:Performance_monitoring_interrupts
>     331.75 =C2=B1 32%     -39.8%     199.75 =C2=B1 17%  interrupts.CPU29.=
RES:Rescheduling_interrupts
>       2178 =C2=B1 22%     +53.9%       3353 =C2=B1 31%  interrupts.CPU3.N=
MI:Non-maskable_interrupts
>       2178 =C2=B1 22%     +53.9%       3353 =C2=B1 31%  interrupts.CPU3.P=
MI:Performance_monitoring_interrupts
>     298.50 =C2=B1 30%     -39.7%     180.00 =C2=B1  6%  interrupts.CPU34.=
RES:Rescheduling_interrupts
>       2490 =C2=B1  3%     +58.7%       3953 =C2=B1 28%  interrupts.CPU35.=
NMI:Non-maskable_interrupts
>       2490 =C2=B1  3%     +58.7%       3953 =C2=B1 28%  interrupts.CPU35.=
PMI:Performance_monitoring_interrupts
>     270.50 =C2=B1 24%     -31.1%     186.25 =C2=B1  3%  interrupts.CPU36.=
RES:Rescheduling_interrupts
>       2493 =C2=B1  7%     +57.0%       3915 =C2=B1 27%  interrupts.CPU43.=
NMI:Non-maskable_interrupts
>       2493 =C2=B1  7%     +57.0%       3915 =C2=B1 27%  interrupts.CPU43.=
PMI:Performance_monitoring_interrupts
>     286.75 =C2=B1 36%     -32.4%     193.75 =C2=B1  7%  interrupts.CPU45.=
RES:Rescheduling_interrupts
>     259.00 =C2=B1 12%     -23.6%     197.75 =C2=B1 13%  interrupts.CPU46.=
RES:Rescheduling_interrupts
>     244.00 =C2=B1 21%     -35.6%     157.25 =C2=B1 11%  interrupts.CPU47.=
RES:Rescheduling_interrupts
>     230.00 =C2=B1  7%     -21.3%     181.00 =C2=B1 11%  interrupts.CPU48.=
RES:Rescheduling_interrupts
>     281.00 =C2=B1 13%     -27.4%     204.00 =C2=B1 15%  interrupts.CPU53.=
RES:Rescheduling_interrupts
>     256.75 =C2=B1  5%     -18.4%     209.50 =C2=B1 12%  interrupts.CPU54.=
RES:Rescheduling_interrupts
>       2433 =C2=B1  9%     +68.4%       4098 =C2=B1 35%  interrupts.CPU58.=
NMI:Non-maskable_interrupts
>       2433 =C2=B1  9%     +68.4%       4098 =C2=B1 35%  interrupts.CPU58.=
PMI:Performance_monitoring_interrupts
>     316.00 =C2=B1 25%     -41.4%     185.25 =C2=B1 13%  interrupts.CPU59.=
RES:Rescheduling_interrupts
>       2703 =C2=B1 38%     +56.0%       4217 =C2=B1 31%  interrupts.CPU60.=
NMI:Non-maskable_interrupts
>       2703 =C2=B1 38%     +56.0%       4217 =C2=B1 31%  interrupts.CPU60.=
PMI:Performance_monitoring_interrupts
>       2425 =C2=B1 16%     +39.9%       3394 =C2=B1 27%  interrupts.CPU61.=
NMI:Non-maskable_interrupts
>       2425 =C2=B1 16%     +39.9%       3394 =C2=B1 27%  interrupts.CPU61.=
PMI:Performance_monitoring_interrupts
>       2388 =C2=B1 18%     +69.5%       4047 =C2=B1 29%  interrupts.CPU66.=
NMI:Non-maskable_interrupts
>       2388 =C2=B1 18%     +69.5%       4047 =C2=B1 29%  interrupts.CPU66.=
PMI:Performance_monitoring_interrupts
>       2322 =C2=B1 11%     +93.4%       4491 =C2=B1 35%  interrupts.CPU67.=
NMI:Non-maskable_interrupts
>       2322 =C2=B1 11%     +93.4%       4491 =C2=B1 35%  interrupts.CPU67.=
PMI:Performance_monitoring_interrupts
>     319.00 =C2=B1 40%     -44.7%     176.25 =C2=B1  9%  interrupts.CPU67.=
RES:Rescheduling_interrupts
>       2512 =C2=B1  8%     +28.1%       3219 =C2=B1 25%  interrupts.CPU70.=
NMI:Non-maskable_interrupts
>       2512 =C2=B1  8%     +28.1%       3219 =C2=B1 25%  interrupts.CPU70.=
PMI:Performance_monitoring_interrupts
>       2290 =C2=B1 39%     +78.7%       4094 =C2=B1 28%  interrupts.CPU74.=
NMI:Non-maskable_interrupts
>       2290 =C2=B1 39%     +78.7%       4094 =C2=B1 28%  interrupts.CPU74.=
PMI:Performance_monitoring_interrupts
>       2446 =C2=B1 40%     +94.8%       4764 =C2=B1 23%  interrupts.CPU75.=
NMI:Non-maskable_interrupts
>       2446 =C2=B1 40%     +94.8%       4764 =C2=B1 23%  interrupts.CPU75.=
PMI:Performance_monitoring_interrupts
>     426.75 =C2=B1 61%     -67.7%     138.00 =C2=B1  8%  interrupts.CPU75.=
RES:Rescheduling_interrupts
>     192.50 =C2=B1 13%     +45.6%     280.25 =C2=B1 45%  interrupts.CPU76.=
RES:Rescheduling_interrupts
>     274.25 =C2=B1 34%     -42.2%     158.50 =C2=B1 34%  interrupts.CPU77.=
RES:Rescheduling_interrupts
>       2357 =C2=B1  9%     +73.0%       4078 =C2=B1 23%  interrupts.CPU78.=
NMI:Non-maskable_interrupts
>       2357 =C2=B1  9%     +73.0%       4078 =C2=B1 23%  interrupts.CPU78.=
PMI:Performance_monitoring_interrupts
>     348.50 =C2=B1 53%     -47.3%     183.75 =C2=B1 29%  interrupts.CPU80.=
RES:Rescheduling_interrupts
>       2650 =C2=B1 43%     +46.2%       3874 =C2=B1 36%  interrupts.CPU84.=
NMI:Non-maskable_interrupts
>       2650 =C2=B1 43%     +46.2%       3874 =C2=B1 36%  interrupts.CPU84.=
PMI:Performance_monitoring_interrupts
>       2235 =C2=B1 10%    +117.8%       4867 =C2=B1 10%  interrupts.CPU90.=
NMI:Non-maskable_interrupts
>       2235 =C2=B1 10%    +117.8%       4867 =C2=B1 10%  interrupts.CPU90.=
PMI:Performance_monitoring_interrupts
>       2606 =C2=B1 33%     +38.1%       3598 =C2=B1 21%  interrupts.CPU92.=
NMI:Non-maskable_interrupts
>       2606 =C2=B1 33%     +38.1%       3598 =C2=B1 21%  interrupts.CPU92.=
PMI:Performance_monitoring_interrupts
>     408.75 =C2=B1 58%     -56.8%     176.75 =C2=B1 25%  interrupts.CPU92.=
RES:Rescheduling_interrupts
>     399.00 =C2=B1 64%     -63.6%     145.25 =C2=B1 16%  interrupts.CPU93.=
RES:Rescheduling_interrupts
>     314.75 =C2=B1 36%     -44.2%     175.75 =C2=B1 13%  interrupts.CPU94.=
RES:Rescheduling_interrupts
>     191.00 =C2=B1 15%     -29.1%     135.50 =C2=B1  9%  interrupts.CPU97.=
RES:Rescheduling_interrupts
>      94.00 =C2=B1  8%     +50.0%     141.00 =C2=B1 12%  interrupts.IWI:IR=
Q_work_interrupts
>     841457 =C2=B1  7%     +16.6%     980751 =C2=B1  3%  interrupts.NMI:No=
n-maskable_interrupts
>     841457 =C2=B1  7%     +16.6%     980751 =C2=B1  3%  interrupts.PMI:Pe=
rformance_monitoring_interrupts
>      12.75 =C2=B1 11%      -4.1        8.67 =C2=B1 31%  perf-profile.call=
trace.cycles-pp.do_rw_once
>       1.02 =C2=B1 16%      -0.6        0.47 =C2=B1 59%  perf-profile.call=
trace.cycles-pp.sched_clock.sched_clock_cpu.cpuidle_enter_state.cpuidle_ent=
er.do_idle
>       1.10 =C2=B1 15%      -0.4        0.66 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.sched_clock_cpu.cpuidle_enter_state.cpuidle_enter.do_idle.c=
pu_startup_entry
>       1.05 =C2=B1 16%      -0.4        0.61 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.native_sched_clock.sched_clock.sched_clock_cpu.cpuidle_ente=
r_state.cpuidle_enter
>       1.58 =C2=B1  4%      +0.3        1.91 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_inter=
rupt.apic_timer_interrupt.copy_page
>       0.79 =C2=B1 26%      +0.5        1.27 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>       0.79 =C2=B1 26%      +0.5        1.27 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>       0.79 =C2=B1 26%      +0.5        1.27 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>       2.11 =C2=B1  4%      +0.5        2.60 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.apic_timer_interrupt.osq_lock.__mutex_lock.hugetlb_fault.ha=
ndle_mm_fault
>       0.83 =C2=B1 26%      +0.5        1.32 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.83 =C2=B1 26%      +0.5        1.32 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.90 =C2=B1  5%      +0.6        2.45 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_inter=
rupt.copy_page.copy_subpage
>       0.65 =C2=B1 62%      +0.6        1.20 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.alloc_fresh_huge_page.alloc_surplus_huge_page.alloc_huge_pa=
ge.hugetlb_cow.hugetlb_fault
>       0.60 =C2=B1 62%      +0.6        1.16 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.free_huge_page.release_pages.tlb_flush_mmu.tlb_finish_mmu.e=
xit_mmap
>       0.95 =C2=B1 17%      +0.6        1.52 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_inter=
rupt.apic_timer_interrupt.mutex_spin_on_owner
>       0.61 =C2=B1 62%      +0.6        1.18 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.release_pages.tlb_flush_mmu.tlb_finish_mmu.exit_mmap.mmput
>       0.61 =C2=B1 62%      +0.6        1.19 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.tlb_finish_mmu.exit_mmap.mmput.do_exit.do_group_exit
>       0.61 =C2=B1 62%      +0.6        1.19 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.tlb_flush_mmu.tlb_finish_mmu.exit_mmap.mmput.do_exit
>       0.64 =C2=B1 61%      +0.6        1.23 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.mmput.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
>       0.64 =C2=B1 61%      +0.6        1.23 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.exit_mmap.mmput.do_exit.do_group_exit.__x64_sys_exit_group
>       1.30 =C2=B1  9%      +0.6        1.92 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_inter=
rupt.mutex_spin_on_owner.__mutex_lock
>       0.19 =C2=B1173%      +0.7        0.89 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_huge_p=
age.release_pages.tlb_flush_mmu
>       0.19 =C2=B1173%      +0.7        0.90 =C2=B1 20%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.free_huge_page.release_pages.tlb_flush_mmu.t=
lb_finish_mmu
>       0.00            +0.8        0.77 =C2=B1 30%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.prep_new_huge_pa=
ge.alloc_fresh_huge_page.alloc_surplus_huge_page
>       0.00            +0.8        0.78 =C2=B1 30%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.prep_new_huge_page.alloc_fresh_huge_page.alloc_su=
rplus_huge_page.alloc_huge_page
>       0.00            +0.8        0.79 =C2=B1 29%  perf-profile.calltrace=
.cycles-pp.prep_new_huge_page.alloc_fresh_huge_page.alloc_surplus_huge_page=
.alloc_huge_page.hugetlb_cow
>       0.82 =C2=B1 67%      +0.9        1.72 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.alloc_huge_=
page.hugetlb_cow.hugetlb_fault
>       0.84 =C2=B1 66%      +0.9        1.74 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.alloc_surpl=
us_huge_page.alloc_huge_page.hugetlb_cow
>       2.52 =C2=B1  6%      +0.9        3.44 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.copy_page.cop=
y_subpage.copy_user_huge_page
>       0.83 =C2=B1 67%      +0.9        1.75 =C2=B1 21%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.alloc_huge_page.hugetlb_cow.hugetlb_fault.ha=
ndle_mm_fault
>       0.84 =C2=B1 66%      +0.9        1.77 =C2=B1 20%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.alloc_surplus_huge_page.alloc_huge_page.huge=
tlb_cow.hugetlb_fault
>       1.64 =C2=B1 12%      +1.0        2.67 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.mutex_spin_on=
_owner.__mutex_lock.hugetlb_fault
>       1.65 =C2=B1 45%      +1.3        2.99 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.alloc_surplus_huge_page.alloc_huge_page.hugetlb_cow.hugetlb=
_fault.handle_mm_fault
>       1.74 =C2=B1 13%      +1.4        3.16 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.apic_timer_interrupt.mutex_spin_on_owner.__mutex_lock.huget=
lb_fault.handle_mm_fault
>       2.56 =C2=B1 48%      +2.2        4.81 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.alloc_huge_page.hugetlb_cow.hugetlb_fault.handle_mm_fault._=
_do_page_fault
>      12.64 =C2=B1 14%      +3.6       16.20 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.mutex_spin_on_owner.__mutex_lock.hugetlb_fault.handle_mm_fa=
ult.__do_page_fault
>       2.97 =C2=B1  7%      +3.8        6.74 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.apic_timer_interrupt.copy_page.copy_subpage.copy_user_huge_=
page.hugetlb_cow
>      19.99 =C2=B1  9%      +4.1       24.05 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.hugetlb_cow.hugetlb_fault.handle_mm_fault.__do_page_fault.d=
o_page_fault
>       1.37 =C2=B1 15%      -0.5        0.83 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       1.31 =C2=B1 16%      -0.5        0.78 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.sched_clock
>       1.29 =C2=B1 16%      -0.5        0.77 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.native_sched_clock
>       1.80 =C2=B1  2%      -0.3        1.47 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.task_tick_fair
>       0.73 =C2=B1  2%      -0.2        0.54 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.42 =C2=B1 17%      -0.2        0.27 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.account_process_tick
>       0.73 =C2=B1 10%      -0.2        0.58 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.rcu_sched_clock_irq
>       0.27 =C2=B1  6%      -0.1        0.14 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__acct_update_integrals
>       0.27 =C2=B1 18%      -0.1        0.16 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.rcu_segcblist_ready_cbs
>       0.40 =C2=B1 12%      -0.1        0.30 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__next_timer_interrupt
>       0.47 =C2=B1  7%      -0.1        0.39 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.29 =C2=B1 12%      -0.1        0.21 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.cpuidle_governor_latency_req
>       0.21 =C2=B1  7%      -0.1        0.14 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.account_system_index_time
>       0.38 =C2=B1  2%      -0.1        0.31 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.timerqueue_add
>       0.26 =C2=B1 11%      -0.1        0.20 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.find_next_bit
>       0.23 =C2=B1 15%      -0.1        0.17 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.rcu_dynticks_eqs_exit
>       0.14 =C2=B1  8%      -0.1        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.account_user_time
>       0.17 =C2=B1  6%      -0.0        0.12 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.cpuacct_charge
>       0.18 =C2=B1 20%      -0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.irq_work_tick
>       0.11 =C2=B1 13%      -0.0        0.07 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.tick_sched_do_timer
>       0.12 =C2=B1 10%      -0.0        0.08 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.get_cpu_device
>       0.07 =C2=B1 11%      -0.0        0.04 =C2=B1 58%  perf-profile.chil=
dren.cycles-pp.raise_softirq
>       0.12 =C2=B1  3%      -0.0        0.09 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.write
>       0.11 =C2=B1 13%      +0.0        0.14 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.native_write_msr
>       0.09 =C2=B1  9%      +0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.10 =C2=B1 10%      +0.0        0.13 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       0.07 =C2=B1  6%      +0.0        0.10 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__read_nocancel
>       0.04 =C2=B1 58%      +0.0        0.07 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.__free_pages_ok
>       0.06 =C2=B1  7%      +0.0        0.09 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.perf_read
>       0.07            +0.0        0.11 =C2=B1 14%  perf-profile.children.=
cycles-pp.perf_evsel__read_counter
>       0.07            +0.0        0.11 =C2=B1 13%  perf-profile.children.=
cycles-pp.cmd_stat
>       0.07            +0.0        0.11 =C2=B1 13%  perf-profile.children.=
cycles-pp.__run_perf_stat
>       0.07            +0.0        0.11 =C2=B1 13%  perf-profile.children.=
cycles-pp.process_interval
>       0.07            +0.0        0.11 =C2=B1 13%  perf-profile.children.=
cycles-pp.read_counters
>       0.07 =C2=B1 22%      +0.0        0.11 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__handle_mm_fault
>       0.07 =C2=B1 19%      +0.1        0.13 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.rb_erase
>       0.03 =C2=B1100%      +0.1        0.09 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.smp_call_function_single
>       0.01 =C2=B1173%      +0.1        0.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.perf_event_read
>       0.00            +0.1        0.07 =C2=B1 13%  perf-profile.children.=
cycles-pp.__perf_event_read_value
>       0.00            +0.1        0.07 =C2=B1  7%  perf-profile.children.=
cycles-pp.__intel_pmu_enable_all
>       0.08 =C2=B1 17%      +0.1        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.native_apic_msr_eoi_write
>       0.04 =C2=B1103%      +0.1        0.13 =C2=B1 58%  perf-profile.chil=
dren.cycles-pp.shmem_getpage_gfp
>       0.38 =C2=B1 14%      +0.1        0.51 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.run_timer_softirq
>       0.11 =C2=B1  4%      +0.3        0.37 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       0.20 =C2=B1  5%      +0.3        0.48 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.20 =C2=B1  4%      +0.3        0.48 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.00            +0.3        0.29 =C2=B1 38%  perf-profile.children.=
cycles-pp.memcpy_erms
>       0.00            +0.3        0.29 =C2=B1 38%  perf-profile.children.=
cycles-pp.drm_fb_helper_dirty_work
>       0.00            +0.3        0.31 =C2=B1 37%  perf-profile.children.=
cycles-pp.process_one_work
>       0.47 =C2=B1 48%      +0.4        0.91 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.prep_new_huge_page
>       0.70 =C2=B1 29%      +0.5        1.16 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.free_huge_page
>       0.73 =C2=B1 29%      +0.5        1.19 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.tlb_flush_mmu
>       0.72 =C2=B1 29%      +0.5        1.18 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.release_pages
>       0.73 =C2=B1 29%      +0.5        1.19 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.tlb_finish_mmu
>       0.76 =C2=B1 27%      +0.5        1.23 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.exit_mmap
>       0.77 =C2=B1 27%      +0.5        1.24 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.mmput
>       0.79 =C2=B1 26%      +0.5        1.27 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__x64_sys_exit_group
>       0.79 =C2=B1 26%      +0.5        1.27 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.do_group_exit
>       0.79 =C2=B1 26%      +0.5        1.27 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.do_exit
>       1.28 =C2=B1 29%      +0.5        1.76 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.perf_mux_hrtimer_handler
>       0.77 =C2=B1 28%      +0.5        1.26 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.alloc_fresh_huge_page
>       1.53 =C2=B1 15%      +0.7        2.26 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       1.53 =C2=B1 15%      +0.7        2.27 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>       1.13 =C2=B1  3%      +0.9        2.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.interrupt_entry
>       0.79 =C2=B1  9%      +1.0        1.76 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.perf_event_task_tick
>       1.71 =C2=B1 39%      +1.4        3.08 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.alloc_surplus_huge_page
>       2.66 =C2=B1 42%      +2.3        4.94 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.alloc_huge_page
>       2.89 =C2=B1 45%      +2.7        5.54 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       3.34 =C2=B1 35%      +2.7        6.02 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>      12.77 =C2=B1 14%      +3.9       16.63 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.mutex_spin_on_owner
>      20.12 =C2=B1  9%      +4.0       24.16 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.hugetlb_cow
>      15.40 =C2=B1 10%      -3.6       11.84 =C2=B1 28%  perf-profile.self=
.cycles-pp.do_rw_once
>       4.02 =C2=B1  9%      -1.3        2.73 =C2=B1 30%  perf-profile.self=
.cycles-pp.do_access
>       2.00 =C2=B1 14%      -0.6        1.41 =C2=B1 13%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>       1.26 =C2=B1 16%      -0.5        0.74 =C2=B1 13%  perf-profile.self=
.cycles-pp.native_sched_clock
>       0.42 =C2=B1 17%      -0.2        0.27 =C2=B1 16%  perf-profile.self=
.cycles-pp.account_process_tick
>       0.27 =C2=B1 19%      -0.2        0.12 =C2=B1 17%  perf-profile.self=
.cycles-pp.timerqueue_del
>       0.53 =C2=B1  3%      -0.1        0.38 =C2=B1 11%  perf-profile.self=
.cycles-pp.update_curr
>       0.27 =C2=B1  6%      -0.1        0.14 =C2=B1 14%  perf-profile.self=
.cycles-pp.__acct_update_integrals
>       0.27 =C2=B1 18%      -0.1        0.16 =C2=B1 13%  perf-profile.self=
.cycles-pp.rcu_segcblist_ready_cbs
>       0.61 =C2=B1  4%      -0.1        0.51 =C2=B1  8%  perf-profile.self=
.cycles-pp.task_tick_fair
>       0.20 =C2=B1  8%      -0.1        0.12 =C2=B1 14%  perf-profile.self=
.cycles-pp.account_system_index_time
>       0.23 =C2=B1 15%      -0.1        0.16 =C2=B1 17%  perf-profile.self=
.cycles-pp.rcu_dynticks_eqs_exit
>       0.25 =C2=B1 11%      -0.1        0.18 =C2=B1 14%  perf-profile.self=
.cycles-pp.find_next_bit
>       0.10 =C2=B1 11%      -0.1        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.tick_sched_do_timer
>       0.29            -0.1        0.23 =C2=B1 11%  perf-profile.self.cycl=
es-pp.timerqueue_add
>       0.12 =C2=B1 10%      -0.1        0.06 =C2=B1 17%  perf-profile.self=
.cycles-pp.account_user_time
>       0.22 =C2=B1 15%      -0.1        0.16 =C2=B1  6%  perf-profile.self=
.cycles-pp.scheduler_tick
>       0.17 =C2=B1  6%      -0.0        0.12 =C2=B1 10%  perf-profile.self=
.cycles-pp.cpuacct_charge
>       0.18 =C2=B1 20%      -0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.irq_work_tick
>       0.07 =C2=B1 13%      -0.0        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.update_process_times
>       0.12 =C2=B1  7%      -0.0        0.08 =C2=B1 15%  perf-profile.self=
.cycles-pp.get_cpu_device
>       0.07 =C2=B1 11%      -0.0        0.04 =C2=B1 58%  perf-profile.self=
.cycles-pp.raise_softirq
>       0.12 =C2=B1 11%      -0.0        0.09 =C2=B1  7%  perf-profile.self=
.cycles-pp.tick_nohz_get_sleep_length
>       0.11 =C2=B1 11%      +0.0        0.14 =C2=B1  6%  perf-profile.self=
.cycles-pp.native_write_msr
>       0.10 =C2=B1  5%      +0.1        0.15 =C2=B1  8%  perf-profile.self=
.cycles-pp.__remove_hrtimer
>       0.07 =C2=B1 23%      +0.1        0.13 =C2=B1  8%  perf-profile.self=
.cycles-pp.rb_erase
>       0.08 =C2=B1 17%      +0.1        0.15 =C2=B1  7%  perf-profile.self=
.cycles-pp.native_apic_msr_eoi_write
>       0.00            +0.1        0.08 =C2=B1 10%  perf-profile.self.cycl=
es-pp.smp_call_function_single
>       0.32 =C2=B1 17%      +0.1        0.42 =C2=B1  7%  perf-profile.self=
.cycles-pp.run_timer_softirq
>       0.22 =C2=B1  5%      +0.1        0.34 =C2=B1  4%  perf-profile.self=
.cycles-pp.ktime_get_update_offsets_now
>       0.45 =C2=B1 15%      +0.2        0.60 =C2=B1 12%  perf-profile.self=
.cycles-pp.rcu_irq_enter
>       0.31 =C2=B1  8%      +0.2        0.46 =C2=B1 16%  perf-profile.self=
.cycles-pp.irq_enter
>       0.29 =C2=B1 10%      +0.2        0.44 =C2=B1 16%  perf-profile.self=
.cycles-pp.apic_timer_interrupt
>       0.71 =C2=B1 30%      +0.2        0.92 =C2=B1  8%  perf-profile.self=
.cycles-pp.perf_mux_hrtimer_handler
>       0.00            +0.3        0.28 =C2=B1 37%  perf-profile.self.cycl=
es-pp.memcpy_erms
>       1.12 =C2=B1  3%      +0.9        2.02 =C2=B1 15%  perf-profile.self=
.cycles-pp.interrupt_entry
>       0.79 =C2=B1  9%      +0.9        1.73 =C2=B1  5%  perf-profile.self=
.cycles-pp.perf_event_task_tick
>       2.49 =C2=B1 45%      +2.1        4.55 =C2=B1 20%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>      10.95 =C2=B1 15%      +2.7       13.61 =C2=B1  8%  perf-profile.self=
.cycles-pp.mutex_spin_on_owner
> =

> =

>                                                                          =
       =

>                                vm-scalability.throughput                 =
       =

>                                                                          =
       =

>   1.6e+07 +-+------------------------------------------------------------=
---+   =

>           |..+.+    +..+.+..+.+.   +.      +..+.+..+.+..+.+..+.+..+    + =
   |   =

>   1.4e+07 +-+  :    :  O      O    O                           O         =
   |   =

>   1.2e+07 O-+O O  O O    O  O    O    O O  O  O    O    O    O      O  O =
O  O   =

>           |     :   :                           O    O    O       O      =
   |   =

>     1e+07 +-+   :  :                                                     =
   |   =

>           |     :  :                                                     =
   |   =

>     8e+06 +-+   :  :                                                     =
   |   =

>           |      : :                                                     =
   |   =

>     6e+06 +-+    : :                                                     =
   |   =

>     4e+06 +-+    : :                                                     =
   |   =

>           |      ::                                                      =
   |   =

>     2e+06 +-+     :                                                      =
   |   =

>           |       :                                                      =
   |   =

>         0 +-+------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                          vm-scalability.time.minor_page_faults           =
       =

>                                                                          =
       =

>   2.5e+06 +-+------------------------------------------------------------=
---+   =

>           |                                                              =
   |   =

>           |..+.+    +..+.+..+.+..+.+..+.+..  .+.  .+.+..+.+..+.+..+.+..+ =
   |   =

>     2e+06 +-+  :    :                      +.   +.                       =
   |   =

>           O  O O: O O  O O  O O  O O                    O      O         =
   |   =

>           |     :   :                 O O  O  O O  O O    O  O    O O  O =
O  O   =

>   1.5e+06 +-+   :  :                                                     =
   |   =

>           |     :  :                                                     =
   |   =

>     1e+06 +-+    : :                                                     =
   |   =

>           |      : :                                                     =
   |   =

>           |      : :                                                     =
   |   =

>    500000 +-+    : :                                                     =
   |   =

>           |       :                                                      =
   |   =

>           |       :                                                      =
   |   =

>         0 +-+------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                 vm-scalability.workload                  =
       =

>                                                                          =
       =

>   3.5e+09 +-+------------------------------------------------------------=
---+   =

>           | .+.                      .+.+..                        .+..  =
   |   =

>     3e+09 +-+  +    +..+.+..+.+..+.+.      +..+.+..+.+..+.+..+.+..+    + =
   |   =

>           |    :    :       O O                                O         =
   |   =

>   2.5e+09 O-+O O: O O  O O       O O  O    O            O                =
   |   =

>           |     :   :                   O     O O  O O    O  O    O O  O =
O  O   =

>     2e+09 +-+   :  :                                                     =
   |   =

>           |     :  :                                                     =
   |   =

>   1.5e+09 +-+    : :                                                     =
   |   =

>           |      : :                                                     =
   |   =

>     1e+09 +-+    : :                                                     =
   |   =

>           |      : :                                                     =
   |   =

>     5e+08 +-+     :                                                      =
   |   =

>           |       :                                                      =
   |   =

>         0 +-+------------------------------------------------------------=
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
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============7738111231986873722==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxQWcxUUFDZ2tRYUEzQkhWTUwKZWlNWi9nZ0Fzd3NQakRVWEI3
MTJiT3RjMHJOZzg0aHViVG8xQy9zNThaSG5oQ3NzUjVNRnpjb1RqV2kzUnZFZgpZM2Z0ajJCNUYy
SmpOekUvalUxM00yQ2FEbWUvYXZMMEdkdXFYTXNLbnhQdEpleDBNTVJHNFJlWlJsQTNBZ0NBCmda
bEdMWEV2Zk9kLzk1c3VkM0VNZ2J2a2d0VTVRS295S25RR3hGb2VoYjRNZU9FZk83eGZWdTdNemlT
N2trRnMKWWZjNC9MSjlGTkZPeGRhbGhJcFgxUVB5YWpDMnlUS0JMN0JiMCtzeEpmK05iOFB6TVhS
Ty9LekVzdlFGUUh1RwpiM04zMW5sblUxQ2VpL2pEa1VGdHJIQzE1QjgweHlRMCtMcFBRbHZVN3Fy
SVBrekxsTjlXcFlYVGlGbldkVit2CmJLdUdOb2V5Zk1lakYvS2tWR1ZBclRnR3paT0MrQT09Cj04
OStaCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7738111231986873722==--

