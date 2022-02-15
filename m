Content-Type: multipart/mixed; boundary="===============1069680561483127206=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [srcu] 1385139340: will-it-scale.per_process_ops -6.4% regression
Date: Tue, 15 Feb 2022 09:14:57 -0800
Message-ID: <20220215171457.GE4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220215054901.GC28159@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1069680561483127206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 01:49:01PM +0800, Oliver Sang wrote:
> Hi Paul,
> =

> On Thu, Feb 10, 2022 at 03:42:42PM -0800, Paul E. McKenney wrote:
> > On Thu, Feb 10, 2022 at 02:53:20PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -6.4% regression of will-it-scale.per_process_ops d=
ue to commit:
> > > =

> > > =

> > > commit: 1385139340b7a1c8f35cb7a52af221096cdef86e ("srcu: Dynamically =
allocate srcu_node array")
> > > https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2022=
.01.18a
> > > =

> > > in testcase: will-it-scale
> > > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU=
 @ 2.00GHz with 256G memory
> > > with following parameters:
> > > =

> > > 	nr_task: 16
> > > 	mode: process
> > > 	test: open1
> > > 	cpufreq_governor: performance
> > > 	ucode: 0xd000280
> > > =

> > > test-description: Will It Scale takes a testcase and runs it from 1 t=
hrough to n parallel copies to see if the testcase will scale. It builds bo=
th a process and threads based test in order to see any differences between=
 the two.
> > > test-url: https://github.com/antonblanchard/will-it-scale
> > > =

> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > It is quite possible that this performance shortfall is due to the
> > memory leak present in that version of the commit.  This leak has since
> > been fixed, for example, in the most recent version in -rcu:
> > =

> > 010d3077d17b ("srcu: Dynamically allocate srcu_node array")
> > =

> > Does the new version work better for you?
> =

> =

> by testing 010d3077d17b and its parent, we found the regression still exi=
sts.
> detail as below [1]
> the config used in tests is attached.
> =

> =

> > Yes, this change does move from an in-srcu_struct array to a pointed-to
> > array for the srcu_node tree, but I am having a very hard time convinci=
ng
> > myself that this would cause a problem.
> =

> yeah, before we sending out the original report, we also had some hard ti=
me
> to understand how it relevant. finally we decided to send out for informa=
tion.
> =

> we could support further tests if, say, you have new version. Thanks

If I am reading your .config correctly, you are building for 8192 CPUs.
This means that with the parent commit, you had multiple statically
allocated arrays each with 8,000+ srcu_node structures.  With the child
commit, these arrays became dynamically allocated and much smaller.

Might the resulting difference in memory layout be responsible for the
difference in performance?  Yes, normally we think in terms of smaller
memory being faster, but cachelines, caches, TLBs, and soforth mean that
pretty much anything could happen.

Thoughts?

							Thanx, Paul

> [1]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/process/16/debian-10.4-x86_64-2020060=
3.cgz/lkp-icl-2sp2/open1/will-it-scale/0xd000280
> =

> commit:
>   1a96a2501ad2 ("srcu: Make srcu_funnel_gp_start() cache ->mynode in snp_=
leaf")
>   010d3077d17b ("srcu: Dynamically allocate srcu_node array")
> =

> 1a96a2501ad2f074 010d3077d17bd865181a0bc04cb
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>    3832462            -7.1%    3560680        will-it-scale.16.processes
>      86.81            +0.0%      86.83        will-it-scale.16.processes_=
idle
>     239528            -7.1%     222542        will-it-scale.per_process_o=
ps
>     301.12            +0.0%     301.12        will-it-scale.time.elapsed_=
time
>     301.12            +0.0%     301.12        will-it-scale.time.elapsed_=
time.max
>       2.50 =C2=B1 30%      -6.7%       2.33 =C2=B1 40%  will-it-scale.tim=
e.involuntary_context_switches
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%  will-it-scale.tim=
e.major_page_faults
>       9552            +0.1%       9558        will-it-scale.time.maximum_=
resident_set_size
>       6927            +0.3%       6944        will-it-scale.time.minor_pa=
ge_faults
>       4096            +0.0%       4096        will-it-scale.time.page_size
>       0.02            +8.3%       0.02 =C2=B1 17%  will-it-scale.time.sys=
tem_time
>       0.03            +0.0%       0.03        will-it-scale.time.user_time
>      95.17            -1.2%      94.00        will-it-scale.time.voluntar=
y_context_switches
>    3832462            -7.1%    3560680        will-it-scale.workload
>  3.397e+10            -0.1%  3.392e+10        cpuidle..time
>   68331867            -5.2%   64761940 =C2=B1 12%  cpuidle..usage
>     361.91            -0.7%     359.29        uptime.boot
>      40690            -0.8%      40364        uptime.idle
>      56.82 =C2=B1  5%      -3.8%      54.68 =C2=B1  4%  boot-time.boot
>      26.85 =C2=B1  7%      -2.5%      26.17 =C2=B1  5%  boot-time.dhcp
>       6738 =C2=B1  6%      -4.0%       6469 =C2=B1  5%  boot-time.idle
>       1.52            -0.0%       1.52        boot-time.smp_boot
>      86.89            -0.0       86.88        mpstat.cpu.all.idle%
>       0.69            -0.0        0.67 =C2=B1  2%  mpstat.cpu.all.irq%
>       0.45 =C2=B1  2%      -0.0        0.41 =C2=B1  2%  mpstat.cpu.all.so=
ft%
>      11.72            +0.0       11.76        mpstat.cpu.all.sys%
>       0.26            +0.0        0.27 =C2=B1 21%  mpstat.cpu.all.usr%
>       0.00          -100.0%       0.00        numa-numastat.node0.interle=
ave_hit
>   14511186            -4.5%   13863019        numa-numastat.node0.local_n=
ode
>   14570095            -4.7%   13890472        numa-numastat.node0.numa_hit
>      59588 =C2=B1 71%     -53.4%      27773 =C2=B1 70%  numa-numastat.nod=
e0.other_node
>       0.00          -100.0%       0.00        numa-numastat.node1.interle=
ave_hit
>     680581 =C2=B1  8%      -1.6%     669747 =C2=B1  2%  numa-numastat.nod=
e1.local_node
>     737094 =C2=B1  3%      +2.9%     758173        numa-numastat.node1.nu=
ma_hit
>      56594 =C2=B1 75%     +56.2%      88425 =C2=B1 22%  numa-numastat.nod=
e1.other_node
>     353.33            +1.9%     360.17 =C2=B1  4%  turbostat.Avg_MHz
>      13.62            +0.3       13.88 =C2=B1  4%  turbostat.Busy%
>       2594            +0.0%       2594        turbostat.Bzy_MHz
>   68376872            -8.0%   62909332 =C2=B1 19%  turbostat.C1
>      87.46            -0.3       87.12        turbostat.C1%
>      72.83            -0.5%      72.50        turbostat.CoreTmp
>   78734994            -4.9%   74878761 =C2=B1 11%  turbostat.IRQ
>      72.67            +0.0%      72.67        turbostat.PkgTmp
>       1995            +0.0%       1995        turbostat.TSC_MHz
>     301.12            +0.0%     301.12        time.elapsed_time
>     301.12            +0.0%     301.12        time.elapsed_time.max
>       2.50 =C2=B1 30%      -6.7%       2.33 =C2=B1 40%  time.involuntary_=
context_switches
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%  time.major_page_f=
aults
>       9552            +0.1%       9558        time.maximum_resident_set_s=
ize
>       6927            +0.3%       6944        time.minor_page_faults
>       4096            +0.0%       4096        time.page_size
>       0.02            +8.3%       0.02 =C2=B1 17%  time.system_time
>       0.03            +0.0%       0.03        time.user_time
>      95.17            -1.2%      94.00        time.voluntary_context_swit=
ches
>      87.00            +0.0%      87.00        vmstat.cpu.id
>      12.00            +0.0%      12.00        vmstat.cpu.sy
>       0.00          -100.0%       0.00        vmstat.cpu.us
>       0.00          -100.0%       0.00        vmstat.io.bi
>       4.00          -100.0%       0.00        vmstat.memory.buff
>    2832872            +0.1%    2836268        vmstat.memory.cache
>  2.591e+08            +0.0%  2.591e+08        vmstat.memory.free
>      16.00            +0.0%      16.00        vmstat.procs.r
>       2352 =C2=B1  2%      +0.0%       2352 =C2=B1  3%  vmstat.system.cs
>     258315            -4.8%     245959 =C2=B1 11%  vmstat.system.in
>      26937 =C2=B1  4%      +2.4%      27597        meminfo.Active
>      26873 =C2=B1  4%      +2.7%      27597        meminfo.Active(anon)
>      63.67          -100.0%       0.00        meminfo.Active(file)
>     180666            +0.0%     180715        meminfo.AnonHugePages
>     269364            +0.0%     269403        meminfo.AnonPages
>       4.00          -100.0%       0.00        meminfo.Buffers
>    2705120            +0.0%    2705598        meminfo.Cached
>  1.319e+08            +0.0%  1.319e+08        meminfo.CommitLimit
>     466241            +0.1%     466770        meminfo.Committed_AS
>  2.529e+08            -0.8%   2.51e+08        meminfo.DirectMap1G
>   16454656 =C2=B1 19%     +11.2%   18301269 =C2=B1  2%  meminfo.DirectMap=
2M
>     841713 =C2=B1 13%      +9.0%     917489 =C2=B1 10%  meminfo.DirectMap=
4k
>       2048            +0.0%       2048        meminfo.Hugepagesize
>     288974            -0.1%     288742        meminfo.Inactive
>     288826            -0.0%     288742        meminfo.Inactive(anon)
>     147.67          -100.0%       0.00        meminfo.Inactive(file)
>     127808            +2.3%     130697        meminfo.KReclaimable
>      22605            -0.5%      22494        meminfo.KernelStack
>      41146            +0.1%      41187        meminfo.Mapped
>   2.58e+08            +0.0%   2.58e+08        meminfo.MemAvailable
>  2.591e+08            +0.0%  2.591e+08        meminfo.MemFree
>  2.638e+08            +0.0%  2.638e+08        meminfo.MemTotal
>    4650571            -0.0%    4650131        meminfo.Memused
>     902.83 =C2=B1100%     -66.6%     301.50 =C2=B1223%  meminfo.Mlocked
>       4008            -0.5%       3987        meminfo.PageTables
>      69362            +1.0%      70072        meminfo.Percpu
>     127808            +2.3%     130697        meminfo.SReclaimable
>     280723            -0.0%     280674        meminfo.SUnreclaim
>      46579 =C2=B1  2%      +1.5%      47266        meminfo.Shmem
>     408533            +0.7%     411372        meminfo.Slab
>    2658463            -0.0%    2658375        meminfo.Unevictable
>  1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
>     288510            +0.7%     290398        meminfo.VmallocUsed
>    5261748            -0.0%    5259709        meminfo.max_used_kB
>       1609 =C2=B1 23%      +1.4%       1632 =C2=B1 29%  numa-meminfo.node=
0.Active
>       1545 =C2=B1 24%      +5.6%       1632 =C2=B1 29%  numa-meminfo.node=
0.Active(anon)
>      63.67          -100.0%       0.00        numa-meminfo.node0.Active(f=
ile)
>     148343 =C2=B1 10%      -4.8%     141233 =C2=B1 17%  numa-meminfo.node=
0.AnonHugePages
>     224348 =C2=B1  6%      -5.0%     213124 =C2=B1 13%  numa-meminfo.node=
0.AnonPages
>     260276 =C2=B1  8%      -1.7%     255900 =C2=B1  4%  numa-meminfo.node=
0.AnonPages.max
>    1827596 =C2=B1 63%     +21.3%    2216274 =C2=B1 39%  numa-meminfo.node=
0.FilePages
>     234625 =C2=B1  7%      -4.0%     225220 =C2=B1 14%  numa-meminfo.node=
0.Inactive
>     234477 =C2=B1  7%      -3.9%     225220 =C2=B1 14%  numa-meminfo.node=
0.Inactive(anon)
>     147.67          -100.0%       0.00        numa-meminfo.node0.Inactive=
(file)
>      81279 =C2=B1 28%     +17.9%      95844 =C2=B1 23%  numa-meminfo.node=
0.KReclaimable
>      12382 =C2=B1  4%      +0.0%      12384 =C2=B1  3%  numa-meminfo.node=
0.KernelStack
>      27221 =C2=B1 50%     +19.6%      32552 =C2=B1 41%  numa-meminfo.node=
0.Mapped
>  1.287e+08            -0.3%  1.283e+08        numa-meminfo.node0.MemFree
>  1.317e+08            +0.0%  1.317e+08        numa-meminfo.node0.MemTotal
>    3033973 =C2=B1 38%     +12.8%    3421526 =C2=B1 28%  numa-meminfo.node=
0.MemUsed
>     860.00 =C2=B1100%     -70.0%     257.67 =C2=B1223%  numa-meminfo.node=
0.Mlocked
>       3278 =C2=B1  4%      +1.0%       3310 =C2=B1  2%  numa-meminfo.node=
0.PageTables
>      81279 =C2=B1 28%     +17.9%      95844 =C2=B1 23%  numa-meminfo.node=
0.SReclaimable
>     185806 =C2=B1  4%      +1.2%     188123 =C2=B1  4%  numa-meminfo.node=
0.SUnreclaim
>      11847 =C2=B1 27%     +16.6%      13810 =C2=B1 47%  numa-meminfo.node=
0.Shmem
>     267086 =C2=B1  8%      +6.3%     283968 =C2=B1 10%  numa-meminfo.node=
0.Slab
>    1815623 =C2=B1 63%     +21.3%    2202462 =C2=B1 39%  numa-meminfo.node=
0.Unevictable
>      25324 =C2=B1  4%      +2.5%      25945        numa-meminfo.node1.Act=
ive
>      25324 =C2=B1  4%      +2.5%      25945        numa-meminfo.node1.Act=
ive(anon)
>      32344 =C2=B1 52%     +22.1%      39481 =C2=B1 64%  numa-meminfo.node=
1.AnonHugePages
>      45042 =C2=B1 33%     +25.1%      56332 =C2=B1 51%  numa-meminfo.node=
1.AnonPages
>     107317 =C2=B1 23%     +12.9%     121210 =C2=B1 41%  numa-meminfo.node=
1.AnonPages.max
>     877537 =C2=B1131%     -44.2%     489321 =C2=B1178%  numa-meminfo.node=
1.FilePages
>      54389 =C2=B1 32%     +16.9%      63595 =C2=B1 53%  numa-meminfo.node=
1.Inactive
>      54389 =C2=B1 32%     +16.9%      63595 =C2=B1 53%  numa-meminfo.node=
1.Inactive(anon)
>      46527 =C2=B1 50%     -25.1%      34850 =C2=B1 66%  numa-meminfo.node=
1.KReclaimable
>      10218 =C2=B1  7%      -1.1%      10106 =C2=B1  6%  numa-meminfo.node=
1.KernelStack
>      13953 =C2=B1 98%     -37.8%       8673 =C2=B1156%  numa-meminfo.node=
1.Mapped
>  1.305e+08            +0.3%  1.308e+08        numa-meminfo.node1.MemFree
>  1.321e+08            +0.0%  1.321e+08        numa-meminfo.node1.MemTotal
>    1616743 =C2=B1 71%     -24.0%    1229244 =C2=B1 80%  numa-meminfo.node=
1.MemUsed
>      43.33 =C2=B1223%      +0.4%      43.50 =C2=B1223%  numa-meminfo.node=
1.Mlocked
>     728.83 =C2=B1 21%      -7.8%     671.83 =C2=B1 11%  numa-meminfo.node=
1.PageTables
>      46527 =C2=B1 50%     -25.1%      34850 =C2=B1 66%  numa-meminfo.node=
1.SReclaimable
>      94481 =C2=B1 12%      -1.9%      92708 =C2=B1 11%  numa-meminfo.node=
1.SUnreclaim
>      34741 =C2=B1  8%      -3.7%      33452 =C2=B1 19%  numa-meminfo.node=
1.Shmem
>     141009 =C2=B1 16%      -9.5%     127559 =C2=B1 25%  numa-meminfo.node=
1.Slab
>     842839 =C2=B1137%     -45.9%     455911 =C2=B1190%  numa-meminfo.node=
1.Unevictable
>     386.00 =C2=B1 24%      +5.6%     407.50 =C2=B1 29%  numa-vmstat.node0=
.nr_active_anon
>      15.67 =C2=B1  3%    -100.0%       0.00        numa-vmstat.node0.nr_a=
ctive_file
>      56082 =C2=B1  6%      -5.0%      53260 =C2=B1 13%  numa-vmstat.node0=
.nr_anon_pages
>      72.00 =C2=B1 10%      -5.1%      68.33 =C2=B1 18%  numa-vmstat.node0=
.nr_anon_transparent_hugepages
>     456898 =C2=B1 63%     +21.3%     554068 =C2=B1 39%  numa-vmstat.node0=
.nr_file_pages
>   32164102            -0.3%   32067011        numa-vmstat.node0.nr_free_p=
ages
>      58614 =C2=B1  7%      -4.0%      56284 =C2=B1 14%  numa-vmstat.node0=
.nr_inactive_anon
>      36.67          -100.0%       0.00        numa-vmstat.node0.nr_inacti=
ve_file
>       0.00          -100.0%       0.00        numa-vmstat.node0.nr_isolat=
ed_anon
>      12382 =C2=B1  4%      +0.0%      12385 =C2=B1  3%  numa-vmstat.node0=
.nr_kernel_stack
>       6968 =C2=B1 50%     +19.2%       8308 =C2=B1 41%  numa-vmstat.node0=
.nr_mapped
>     214.67 =C2=B1100%     -70.0%      64.33 =C2=B1223%  numa-vmstat.node0=
.nr_mlock
>     819.17 =C2=B1  4%      +1.0%     827.33 =C2=B1  2%  numa-vmstat.node0=
.nr_page_table_pages
>       2961 =C2=B1 27%     +16.6%       3452 =C2=B1 47%  numa-vmstat.node0=
.nr_shmem
>      20319 =C2=B1 28%     +17.9%      23961 =C2=B1 23%  numa-vmstat.node0=
.nr_slab_reclaimable
>      46378 =C2=B1  4%      +1.9%      47244 =C2=B1  5%  numa-vmstat.node0=
.nr_slab_unreclaimable
>     453905 =C2=B1 63%     +21.3%     550615 =C2=B1 39%  numa-vmstat.node0=
.nr_unevictable
>     386.00 =C2=B1 24%      +5.6%     407.50 =C2=B1 29%  numa-vmstat.node0=
.nr_zone_active_anon
>      15.67 =C2=B1  3%    -100.0%       0.00        numa-vmstat.node0.nr_z=
one_active_file
>      58614 =C2=B1  7%      -4.0%      56284 =C2=B1 14%  numa-vmstat.node0=
.nr_zone_inactive_anon
>      36.67          -100.0%       0.00        numa-vmstat.node0.nr_zone_i=
nactive_file
>     453905 =C2=B1 63%     +21.3%     550615 =C2=B1 39%  numa-vmstat.node0=
.nr_zone_unevictable
>    8780089 =C2=B1  3%      -3.0%    8520850 =C2=B1  3%  numa-vmstat.node0=
.numa_hit
>       3282 =C2=B1  8%      +4.9%       3443 =C2=B1  4%  numa-vmstat.node0=
.numa_interleave
>    8717715 =C2=B1  3%      -2.6%    8490478 =C2=B1  3%  numa-vmstat.node0=
.numa_local
>      62569 =C2=B1 70%     -51.3%      30474 =C2=B1 56%  numa-vmstat.node0=
.numa_other
>       6329 =C2=B1  4%      +2.7%       6499        numa-vmstat.node1.nr_a=
ctive_anon
>      11244 =C2=B1 33%     +25.1%      14068 =C2=B1 51%  numa-vmstat.node1=
.nr_anon_pages
>      15.17 =C2=B1 55%     +23.1%      18.67 =C2=B1 67%  numa-vmstat.node1=
.nr_anon_transparent_hugepages
>     219338 =C2=B1131%     -44.2%     122286 =C2=B1178%  numa-vmstat.node1=
.nr_file_pages
>   32613353            +0.3%   32710279        numa-vmstat.node1.nr_free_p=
ages
>      13536 =C2=B1 32%     +16.9%      15827 =C2=B1 53%  numa-vmstat.node1=
.nr_inactive_anon
>       0.00          -100.0%       0.00        numa-vmstat.node1.nr_isolat=
ed_anon
>      10243 =C2=B1  7%      -1.3%      10111 =C2=B1  6%  numa-vmstat.node1=
.nr_kernel_stack
>       3468 =C2=B1101%     -38.6%       2128 =C2=B1161%  numa-vmstat.node1=
.nr_mapped
>      10.83 =C2=B1223%      +0.0%      10.83 =C2=B1223%  numa-vmstat.node1=
.nr_mlock
>     183.33 =C2=B1 22%      -7.8%     169.00 =C2=B1 10%  numa-vmstat.node1=
.nr_page_table_pages
>       8639 =C2=B1  8%      -3.7%       8319 =C2=B1 20%  numa-vmstat.node1=
.nr_shmem
>      11634 =C2=B1 50%     -25.1%       8716 =C2=B1 66%  numa-vmstat.node1=
.nr_slab_reclaimable
>      23619 =C2=B1 12%      -1.9%      23176 =C2=B1 11%  numa-vmstat.node1=
.nr_slab_unreclaimable
>     210709 =C2=B1137%     -45.9%     113977 =C2=B1190%  numa-vmstat.node1=
.nr_unevictable
>       6329 =C2=B1  4%      +2.7%       6499        numa-vmstat.node1.nr_z=
one_active_anon
>      13536 =C2=B1 32%     +16.9%      15827 =C2=B1 53%  numa-vmstat.node1=
.nr_zone_inactive_anon
>     210709 =C2=B1137%     -45.9%     113977 =C2=B1190%  numa-vmstat.node1=
.nr_zone_unevictable
>    1144423 =C2=B1 25%      -7.1%    1063045 =C2=B1 26%  numa-vmstat.node1=
.numa_hit
>       3525 =C2=B1  8%      -5.2%       3342 =C2=B1  4%  numa-vmstat.node1=
.numa_interleave
>    1046410 =C2=B1 27%     -10.8%     932973 =C2=B1 29%  numa-vmstat.node1=
.numa_local
>      98093 =C2=B1 44%     +32.6%     130077 =C2=B1 13%  numa-vmstat.node1=
.numa_other
>     401.17 =C2=B1 13%      +9.2%     438.17 =C2=B1 10%  proc-vmstat.direc=
t_map_level2_splits
>      12.83 =C2=B1 24%     +14.3%      14.67 =C2=B1  3%  proc-vmstat.direc=
t_map_level3_splits
>       6720 =C2=B1  4%      +2.6%       6892        proc-vmstat.nr_active_=
anon
>      15.67 =C2=B1  3%    -100.0%       0.00        proc-vmstat.nr_active_=
file
>      67338            +0.0%      67350        proc-vmstat.nr_anon_pages
>      87.67            +0.0%      87.67        proc-vmstat.nr_anon_transpa=
rent_hugepages
>    6439770            +0.0%    6439784        proc-vmstat.nr_dirty_backgr=
ound_threshold
>   12895287            +0.0%   12895315        proc-vmstat.nr_dirty_thresh=
old
>     676270            +0.0%     676392        proc-vmstat.nr_file_pages
>   64776875            +0.0%   64777074        proc-vmstat.nr_free_pages
>      72191            -0.0%      72184        proc-vmstat.nr_inactive_anon
>      36.67          -100.0%       0.00        proc-vmstat.nr_inactive_file
>      22640            -0.6%      22499        proc-vmstat.nr_kernel_stack
>      10524            +0.2%      10548        proc-vmstat.nr_mapped
>     225.50 =C2=B1100%     -66.7%      75.17 =C2=B1223%  proc-vmstat.nr_ml=
ock
>       1005            -0.8%     997.50        proc-vmstat.nr_page_table_p=
ages
>      11634 =C2=B1  2%      +1.5%      11809        proc-vmstat.nr_shmem
>      31951            +2.3%      32673        proc-vmstat.nr_slab_reclaim=
able
>      70177            -0.1%      70085        proc-vmstat.nr_slab_unrecla=
imable
>     664615            -0.0%     664593        proc-vmstat.nr_unevictable
>       6720 =C2=B1  4%      +2.6%       6892        proc-vmstat.nr_zone_ac=
tive_anon
>      15.67 =C2=B1  3%    -100.0%       0.00        proc-vmstat.nr_zone_ac=
tive_file
>      72191            -0.0%      72184        proc-vmstat.nr_zone_inactiv=
e_anon
>      36.67          -100.0%       0.00        proc-vmstat.nr_zone_inactiv=
e_file
>     664615            -0.0%     664593        proc-vmstat.nr_zone_unevict=
able
>       3458 =C2=B1133%     +66.3%       5752 =C2=B1 77%  proc-vmstat.numa_=
hint_faults
>       1061 =C2=B1216%     -80.9%     202.33 =C2=B1 78%  proc-vmstat.numa_=
hint_faults_local
>   15310602            -4.3%   14652966        proc-vmstat.numa_hit
>      43.33 =C2=B1 38%     +19.6%      51.83 =C2=B1 65%  proc-vmstat.numa_=
huge_pte_updates
>       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
>   15195180            -4.3%   14537093        proc-vmstat.numa_local
>     116183            +0.0%     116199        proc-vmstat.numa_other
>      11168 =C2=B1 63%     +57.2%      17556 =C2=B1 97%  proc-vmstat.numa_=
pages_migrated
>      33591 =C2=B1 45%     +42.5%      47879 =C2=B1 58%  proc-vmstat.numa_=
pte_updates
>      22813 =C2=B1  2%      -0.3%      22734        proc-vmstat.pgactivate
>       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
>   15318945            -4.3%   14662119        proc-vmstat.pgalloc_normal
>    1002765            -0.0%    1002588        proc-vmstat.pgfault
>   15345099            -4.3%   14688565        proc-vmstat.pgfree
>      11168 =C2=B1 63%     +57.2%      17556 =C2=B1 97%  proc-vmstat.pgmig=
rate_success
>       0.00          -100.0%       0.00        proc-vmstat.pgpgin
>       0.00          -100.0%       0.00        proc-vmstat.pgpgout
>      63244            -3.4%      61078        proc-vmstat.pgreuse
>      87.83            +1.7%      89.33        proc-vmstat.thp_collapse_al=
loc
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%  proc-vmstat.thp_d=
eferred_split_page
>      18.17 =C2=B1  2%      +0.0%      18.17 =C2=B1  2%  proc-vmstat.thp_f=
ault_alloc
>      17.17 =C2=B1 99%     +36.9%      23.50 =C2=B1108%  proc-vmstat.thp_m=
igration_success
>      25.00            +0.0%      25.00        proc-vmstat.thp_scan_exceed=
_share_pte
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%  proc-vmstat.thp_s=
plit_pmd
>       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_a=
lloc
>      62.00 =C2=B1 69%     -46.2%      33.33 =C2=B1 96%  proc-vmstat.unevi=
ctable_pgs_culled
>     293.00 =C2=B1100%     -66.7%      97.67 =C2=B1223%  proc-vmstat.unevi=
ctable_pgs_mlocked
>       3.75            -0.1%       3.74        perf-stat.i.MPKI
>  4.646e+09            -6.8%   4.33e+09        perf-stat.i.branch-instruct=
ions
>       0.43 =C2=B1  4%      -0.0        0.41 =C2=B1  5%  perf-stat.i.branc=
h-miss-rate%
>   19796196 =C2=B1  5%     -10.0%   17823518 =C2=B1  5%  perf-stat.i.branc=
h-misses
>      17.83 =C2=B1  2%      +0.8       18.63 =C2=B1  2%  perf-stat.i.cache=
-miss-rate%
>   15727588 =C2=B1  2%      -2.8%   15293550 =C2=B1  3%  perf-stat.i.cache=
-misses
>   88137027            -6.9%   82032596        perf-stat.i.cache-references
>       2287 =C2=B1  2%      -0.3%       2281 =C2=B1  3%  perf-stat.i.conte=
xt-switches
>       1.93            +6.2%       2.05        perf-stat.i.cpi
>     128011            -0.0%     128010        perf-stat.i.cpu-clock
>   4.53e+10            -0.9%  4.489e+10        perf-stat.i.cpu-cycles
>     152.35 =C2=B1  4%      +1.9%     155.28 =C2=B1  5%  perf-stat.i.cpu-m=
igrations
>       2905 =C2=B1  3%      +1.4%       2946 =C2=B1  4%  perf-stat.i.cycle=
s-between-cache-misses
>       0.00 =C2=B1 14%      +0.0        0.00 =C2=B1 16%  perf-stat.i.dTLB-=
load-miss-rate%
>     121070 =C2=B1 14%      +2.1%     123637 =C2=B1 16%  perf-stat.i.dTLB-=
load-misses
>  6.959e+09            -6.6%  6.499e+09        perf-stat.i.dTLB-loads
>       0.00 =C2=B1 12%      +0.0        0.00 =C2=B1 17%  perf-stat.i.dTLB-=
store-miss-rate%
>      83972 =C2=B1 12%      +7.5%      90258 =C2=B1 18%  perf-stat.i.dTLB-=
store-misses
>  3.932e+09            -6.8%  3.667e+09        perf-stat.i.dTLB-stores
>  2.352e+10            -6.8%  2.192e+10        perf-stat.i.instructions
>       0.52            -5.9%       0.49        perf-stat.i.ipc
>       0.87            +0.3%       0.87        perf-stat.i.major-faults
>       0.35            -0.9%       0.35        perf-stat.i.metric.GHz
>     764.54            -6.6%     713.84        perf-stat.i.metric.K/sec
>     121.38            -6.7%     113.24        perf-stat.i.metric.M/sec
>       2973            -0.4%       2960        perf-stat.i.minor-faults
>       5.51 =C2=B1 26%      -0.8        4.73 =C2=B1 29%  perf-stat.i.node-=
load-miss-rate%
>     217547 =C2=B1 29%     -20.4%     173183 =C2=B1 28%  perf-stat.i.node-=
load-misses
>    3735242 =C2=B1  2%      -5.6%    3524757 =C2=B1  6%  perf-stat.i.node-=
loads
>       1.01 =C2=B1  8%      -0.1        0.94 =C2=B1 23%  perf-stat.i.node-=
store-miss-rate%
>      56696 =C2=B1  5%      -5.6%      53502 =C2=B1 22%  perf-stat.i.node-=
store-misses
>    5815658 =C2=B1  2%      -2.4%    5677039 =C2=B1  2%  perf-stat.i.node-=
stores
>       2974            -0.4%       2961        perf-stat.i.page-faults
>     128011            -0.0%     128010        perf-stat.i.task-clock
>       3.75            -0.1%       3.74        perf-stat.overall.MPKI
>       0.43 =C2=B1  5%      -0.0        0.41 =C2=B1  5%  perf-stat.overall=
.branch-miss-rate%
>      17.84 =C2=B1  2%      +0.8       18.64 =C2=B1  2%  perf-stat.overall=
.cache-miss-rate%
>       1.93            +6.3%       2.05        perf-stat.overall.cpi
>       2882 =C2=B1  2%      +2.0%       2939 =C2=B1  4%  perf-stat.overall=
.cycles-between-cache-misses
>       0.00 =C2=B1 14%      +0.0        0.00 =C2=B1 16%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.00 =C2=B1 12%      +0.0        0.00 =C2=B1 17%  perf-stat.overall=
.dTLB-store-miss-rate%
>       0.52            -5.9%       0.49        perf-stat.overall.ipc
>       5.46 =C2=B1 27%      -0.8        4.70 =C2=B1 29%  perf-stat.overall=
.node-load-miss-rate%
>       0.97 =C2=B1  6%      -0.0        0.94 =C2=B1 24%  perf-stat.overall=
.node-store-miss-rate%
>    1853307            +0.1%    1854796        perf-stat.overall.path-leng=
th
>   4.63e+09            -6.8%  4.315e+09        perf-stat.ps.branch-instruc=
tions
>   19726045 =C2=B1  5%     -10.0%   17762051 =C2=B1  5%  perf-stat.ps.bran=
ch-misses
>   15674904 =C2=B1  2%      -2.8%   15242774 =C2=B1  3%  perf-stat.ps.cach=
e-misses
>   87840455            -6.9%   81757452        perf-stat.ps.cache-referenc=
es
>       2278 =C2=B1  2%      -0.2%       2274 =C2=B1  3%  perf-stat.ps.cont=
ext-switches
>     127577            +0.0%     127577        perf-stat.ps.cpu-clock
>  4.515e+10            -0.9%  4.474e+10        perf-stat.ps.cpu-cycles
>     151.77 =C2=B1  4%      +2.0%     154.77 =C2=B1  5%  perf-stat.ps.cpu-=
migrations
>     120639 =C2=B1 14%      +2.1%     123203 =C2=B1 16%  perf-stat.ps.dTLB=
-load-misses
>  6.936e+09            -6.6%  6.477e+09        perf-stat.ps.dTLB-loads
>      83676 =C2=B1 12%      +7.5%      89941 =C2=B1 18%  perf-stat.ps.dTLB=
-store-misses
>  3.919e+09            -6.8%  3.654e+09        perf-stat.ps.dTLB-stores
>  2.344e+10            -6.8%  2.185e+10        perf-stat.ps.instructions
>       0.86            +0.0%       0.86        perf-stat.ps.major-faults
>       2960            -0.4%       2948        perf-stat.ps.minor-faults
>     216767 =C2=B1 29%     -20.3%     172669 =C2=B1 28%  perf-stat.ps.node=
-load-misses
>    3722815 =C2=B1  2%      -5.6%    3513000 =C2=B1  6%  perf-stat.ps.node=
-loads
>      56470 =C2=B1  5%      -5.6%      53316 =C2=B1 22%  perf-stat.ps.node=
-store-misses
>    5796432 =C2=B1  2%      -2.4%    5658381 =C2=B1  2%  perf-stat.ps.node=
-stores
>       2960            -0.4%       2949        perf-stat.ps.page-faults
>     127577            +0.0%     127577        perf-stat.ps.task-clock
>  7.103e+12            -7.0%  6.604e+12        perf-stat.total.instructions
>      13.30 =C2=B1  5%      -2.0       11.34 =C2=B1 23%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_idle_do_entry.acpi_idl=
e_enter.cpuidle_enter_state.cpuidle_enter
>       8.08 =C2=B1  4%      -1.2        6.84 =C2=B1 21%  perf-profile.call=
trace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.do_idle.c=
pu_startup_entry
>       8.25 =C2=B1  4%      -0.9        7.39 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       8.23 =C2=B1  4%      -0.9        7.37 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry=
.start_secondary
>       8.85 =C2=B1  4%      -0.8        8.04 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_v=
erify
>       8.85 =C2=B1  4%      -0.8        8.04 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>       8.89 =C2=B1  4%      -0.8        8.08 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.secondary_startup_64_no_verify
>       8.84 =C2=B1  4%      -0.8        8.03 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64_no_verify
>       2.50 =C2=B1  3%      -0.5        2.05 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpui=
dle_enter.do_idle
>       0.52 =C2=B1  2%      -0.4        0.08 =C2=B1223%  perf-profile.call=
trace.cycles-pp.kmem_cache_alloc.getname_flags.do_sys_openat2.do_sys_open.d=
o_syscall_64
>       2.18 =C2=B1  4%      -0.4        1.78 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>       1.31 =C2=B1  2%      -0.3        1.01 =C2=B1 44%  perf-profile.call=
trace.cycles-pp.rcu_core.__softirqentry_text_start.irq_exit_rcu.sysvec_apic=
_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       1.30 =C2=B1  2%      -0.3        1.01 =C2=B1 44%  perf-profile.call=
trace.cycles-pp.rcu_do_batch.rcu_core.__softirqentry_text_start.irq_exit_rc=
u.sysvec_apic_timer_interrupt
>       2.45 =C2=B1  2%      -0.2        2.26        perf-profile.calltrace=
.cycles-pp.kmem_cache_alloc.__alloc_file.alloc_empty_file.path_openat.do_fi=
lp_open
>       0.17 =C2=B1141%      -0.2        0.00        perf-profile.calltrace=
.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_=
interrupt.acpi_idle_do_entry.acpi_idle_enter
>       0.66 =C2=B1  4%      -0.2        0.50 =C2=B1 44%  perf-profile.call=
trace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_ti=
mer_interrupt.apparmor_current_getsecid_subj.security_current_getsecid_subj
>       0.65 =C2=B1  4%      -0.2        0.50 =C2=B1 44%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_in=
terrupt.asm_sysvec_apic_timer_interrupt.apparmor_current_getsecid_subj
>       0.66 =C2=B1  2%      -0.1        0.51 =C2=B1 44%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_in=
terrupt.asm_sysvec_apic_timer_interrupt.apparmor_file_open
>       0.66 =C2=B1  2%      -0.1        0.52 =C2=B1 44%  perf-profile.call=
trace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_ti=
mer_interrupt.apparmor_file_open.security_file_open
>       2.10            -0.1        1.97 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.getname_flags.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       1.17 =C2=B1  4%      -0.1        1.05 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt.acpi_idle_do_entry.acpi_idle_enter
>       1.07 =C2=B1  4%      -0.1        0.96 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic=
_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_idle_do_entry
>       0.58 =C2=B1  6%      -0.1        0.48 =C2=B1 46%  perf-profile.call=
trace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_=
interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       0.18 =C2=B1141%      -0.1        0.08 =C2=B1223%  perf-profile.call=
trace.cycles-pp.__check_object_size.strncpy_from_user.getname_flags.do_sys_=
openat2.do_sys_open
>       0.09 =C2=B1223%      -0.1        0.00        perf-profile.calltrace=
.cycles-pp.allocate_slab.___slab_alloc.__slab_alloc.kmem_cache_alloc.__allo=
c_file
>       0.17 =C2=B1141%      -0.1        0.09 =C2=B1223%  perf-profile.call=
trace.cycles-pp.dput.__fput.task_work_run.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode
>       1.38            -0.1        1.30 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.strncpy_from_user.getname_flags.do_sys_openat2.do_sys_open.do_sy=
scall_64
>       1.24            -0.1        1.17 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe.__c=
lose
>       0.76 =C2=B1  4%      -0.1        0.69 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.apparmor_current_getsecid_s=
ubj.security_current_getsecid_subj.ima_file_check.do_open
>       0.74 =C2=B1  4%      -0.1        0.68 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.apparmor_current_getsecid_subj.security_current_getsecid_subj.ima_file_che=
ck
>       1.49 =C2=B1  2%      -0.1        1.42        perf-profile.calltrace=
.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.do_sys_op=
en
>       0.76 =C2=B1  2%      -0.1        0.70 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.apparmor_file_open.security=
_file_open.do_dentry_open.do_open
>       0.75 =C2=B1  2%      -0.1        0.69 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.apparmor_file_open.security_file_open.do_dentry_open
>       0.80 =C2=B1  2%      -0.1        0.75 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.filp_close.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.__close
>       0.63 =C2=B1  3%      -0.0        0.58 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.fput_many.filp_close.__x64_sys_close.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>       0.61 =C2=B1  3%      -0.0        0.57 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.alloc_fd.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       0.74            -0.0        0.70 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.kmem_cache_alloc.security_file_alloc.__alloc_file.alloc_empty_fi=
le.path_openat
>       0.58 =C2=B1  3%      -0.0        0.54 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.___slab_alloc.__slab_alloc.kmem_cache_alloc.__alloc_file.al=
loc_empty_file
>       0.74            -0.0        0.70        perf-profile.calltrace.cycl=
es-pp.complete_walk.do_open.path_openat.do_filp_open.do_sys_openat2
>       0.68 =C2=B1  2%      -0.0        0.64 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.terminate_walk.path_openat.do_filp_open.do_sys_openat2.do_s=
ys_open
>       0.58 =C2=B1  3%      -0.0        0.54 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__slab_alloc.kmem_cache_alloc.__alloc_file.alloc_empty_file=
.path_openat
>       0.58 =C2=B1  2%      -0.0        0.55 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.call_rcu.task_work_run.exit_to_user_mode_prepare.syscall_ex=
it_to_user_mode.do_syscall_64
>       0.64            -0.0        0.62 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.try_to_unlazy.complete_walk.do_open.path_openat.do_filp_open
>       0.08 =C2=B1223%      -0.0        0.08 =C2=B1223%  perf-profile.call=
trace.cycles-pp.walk_component.link_path_walk.path_openat.do_filp_open.do_s=
ys_openat2
>       0.08 =C2=B1223%      -0.0        0.08 =C2=B1223%  perf-profile.call=
trace.cycles-pp.__legitimize_path.try_to_unlazy.complete_walk.do_open.path_=
openat
>      17.45            +0.1       17.50        perf-profile.calltrace.cycl=
es-pp.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2.do_sys_open
>      17.30            +0.1       17.36        perf-profile.calltrace.cycl=
es-pp.__alloc_file.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2
>       0.10 =C2=B1223%      +0.2        0.28 =C2=B1100%  perf-profile.call=
trace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64_no_verify
>      17.14            +0.2       17.38        perf-profile.calltrace.cycl=
es-pp.__close
>      12.70            +0.3       13.02        perf-profile.calltrace.cycl=
es-pp.security_file_alloc.__alloc_file.alloc_empty_file.path_openat.do_filp=
_open
>      16.07            +0.3       16.40        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__close
>      15.95            +0.3       16.28        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
>      11.84            +0.4       12.21        perf-profile.calltrace.cycl=
es-pp.apparmor_file_alloc_security.security_file_alloc.__alloc_file.alloc_e=
mpty_file.path_openat
>       0.00            +0.4        0.39 =C2=B1223%  perf-profile.calltrace=
.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_=
entry
>      23.19            +0.4       23.60        perf-profile.calltrace.cycl=
es-pp.do_dentry_open.do_open.path_openat.do_filp_open.do_sys_openat2
>      14.55            +0.4       14.96        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.__close
>      14.46            +0.4       14.88        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.__close
>      14.07            +0.4       14.51        perf-profile.calltrace.cycl=
es-pp.task_work_run.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_=
syscall_64.entry_SYSCALL_64_after_hwframe
>      21.67            +0.5       22.17        perf-profile.calltrace.cycl=
es-pp.security_file_open.do_dentry_open.do_open.path_openat.do_filp_open
>      21.56            +0.5       22.07        perf-profile.calltrace.cycl=
es-pp.apparmor_file_open.security_file_open.do_dentry_open.do_open.path_ope=
nat
>      12.69            +0.5       13.20        perf-profile.calltrace.cycl=
es-pp.__fput.task_work_run.exit_to_user_mode_prepare.syscall_exit_to_user_m=
ode.do_syscall_64
>      72.93            +0.6       73.50        perf-profile.calltrace.cycl=
es-pp.open64
>      10.94            +0.6       11.55        perf-profile.calltrace.cycl=
es-pp.security_file_free.__fput.task_work_run.exit_to_user_mode_prepare.sys=
call_exit_to_user_mode
>      10.90            +0.6       11.51        perf-profile.calltrace.cycl=
es-pp.apparmor_file_free_security.security_file_free.__fput.task_work_run.e=
xit_to_user_mode_prepare
>      71.69            +0.7       72.34        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.open64
>      71.55            +0.7       72.21        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
>      71.15            +0.7       71.85        perf-profile.calltrace.cycl=
es-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
>      71.02            +0.7       71.73        perf-profile.calltrace.cycl=
es-pp.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.open64
>      21.57            +0.8       22.33        perf-profile.calltrace.cycl=
es-pp.security_current_getsecid_subj.ima_file_check.do_open.path_openat.do_=
filp_open
>      21.52            +0.8       22.28        perf-profile.calltrace.cycl=
es-pp.apparmor_current_getsecid_subj.security_current_getsecid_subj.ima_fil=
e_check.do_open.path_openat
>      21.72            +0.8       22.48        perf-profile.calltrace.cycl=
es-pp.ima_file_check.do_open.path_openat.do_filp_open.do_sys_openat2
>      67.29            +0.9       68.23        perf-profile.calltrace.cycl=
es-pp.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
>      67.07            +0.9       68.01        perf-profile.calltrace.cycl=
es-pp.path_openat.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_64
>      46.35            +1.1       47.44        perf-profile.calltrace.cycl=
es-pp.do_open.path_openat.do_filp_open.do_sys_openat2.do_sys_open
>      11.20 =C2=B1  3%      -1.4        9.83 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_apic_timer_interrupt
>       8.11 =C2=B1  4%      -1.2        6.88 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.acpi_idle_enter
>       8.08 =C2=B1  4%      -1.2        6.84 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.acpi_idle_do_entry
>       8.27 =C2=B1  4%      -0.9        7.41 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>       8.28 =C2=B1  4%      -0.9        7.43 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter
>       8.85 =C2=B1  4%      -0.8        8.04 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.start_secondary
>       8.89 =C2=B1  4%      -0.8        8.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>       8.89 =C2=B1  4%      -0.8        8.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>       8.89 =C2=B1  4%      -0.8        8.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.do_idle
>       5.50            -0.6        4.92 =C2=B1  6%  perf-profile.children.=
cycles-pp.sysvec_apic_timer_interrupt
>       3.86            -0.3        3.58        perf-profile.children.cycle=
s-pp.kmem_cache_alloc
>       3.34 =C2=B1  2%      -0.3        3.08        perf-profile.children.=
cycles-pp.irq_exit_rcu
>       3.55            -0.3        3.29        perf-profile.children.cycle=
s-pp.__softirqentry_text_start
>       0.38 =C2=B1 33%      -0.2        0.16 =C2=B1 96%  perf-profile.chil=
dren.cycles-pp.tick_irq_enter
>       0.42 =C2=B1 28%      -0.2        0.20 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.irq_enter_rcu
>       3.28            -0.2        3.06        perf-profile.children.cycle=
s-pp.rcu_core
>       3.25            -0.2        3.04 =C2=B1  2%  perf-profile.children.=
cycles-pp.rcu_do_batch
>       0.66 =C2=B1 12%      -0.2        0.47 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       1.77 =C2=B1  2%      -0.1        1.64 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       2.13            -0.1        2.00 =C2=B1  2%  perf-profile.children.=
cycles-pp.getname_flags
>       1.56 =C2=B1  4%      -0.1        1.46 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       1.44 =C2=B1  4%      -0.1        1.35 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       1.41            -0.1        1.33 =C2=B1  2%  perf-profile.children.=
cycles-pp.strncpy_from_user
>       1.26            -0.1        1.18 =C2=B1  2%  perf-profile.children.=
cycles-pp.__x64_sys_close
>       1.14            -0.1        1.07 =C2=B1  2%  perf-profile.children.=
cycles-pp.__might_resched
>       0.94            -0.1        0.86        perf-profile.children.cycle=
s-pp.__entry_text_start
>       1.55 =C2=B1  2%      -0.1        1.47        perf-profile.children.=
cycles-pp.link_path_walk
>       0.80 =C2=B1  2%      -0.1        0.74 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.mod_objcg_state
>       0.90 =C2=B1  2%      -0.1        0.84        perf-profile.children.=
cycles-pp.syscall_return_via_sysret
>       0.68 =C2=B1  2%      -0.1        0.63        perf-profile.children.=
cycles-pp.inode_permission
>       0.84            -0.1        0.78 =C2=B1  3%  perf-profile.children.=
cycles-pp.filp_close
>       0.11 =C2=B1 26%      -0.1        0.06 =C2=B1 76%  perf-profile.chil=
dren.cycles-pp._raw_spin_trylock
>       0.13 =C2=B1 20%      -0.1        0.08 =C2=B1 64%  perf-profile.chil=
dren.cycles-pp.ktime_get_update_offsets_now
>       1.04            -0.0        0.98 =C2=B1  4%  perf-profile.children.=
cycles-pp.dput
>       0.64 =C2=B1  3%      -0.0        0.59 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.fput_many
>       0.65 =C2=B1  2%      -0.0        0.60 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.alloc_fd
>       0.55            -0.0        0.50 =C2=B1  3%  perf-profile.children.=
cycles-pp.lookup_fast
>       0.59            -0.0        0.55        perf-profile.children.cycle=
s-pp.__slab_free
>       0.19 =C2=B1 17%      -0.0        0.15 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.rebalance_domains
>       0.58 =C2=B1  3%      -0.0        0.55 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__slab_alloc
>       0.50 =C2=B1  3%      -0.0        0.46 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       0.44 =C2=B1  4%      -0.0        0.41 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.task_work_add
>       0.44 =C2=B1  4%      -0.0        0.41 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.may_open
>       0.58 =C2=B1  3%      -0.0        0.54 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.file_free_rcu
>       0.35 =C2=B1  2%      -0.0        0.31 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__d_lookup_rcu
>       0.05            -0.0        0.02 =C2=B1141%  perf-profile.children.=
cycles-pp.mem_cgroup_handle_over_high
>       0.70            -0.0        0.66 =C2=B1  3%  perf-profile.children.=
cycles-pp.terminate_walk
>       0.75            -0.0        0.72        perf-profile.children.cycle=
s-pp.complete_walk
>       0.58 =C2=B1  3%      -0.0        0.55 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.___slab_alloc
>       0.34 =C2=B1  4%      -0.0        0.31 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.generic_permission
>       0.37 =C2=B1  3%      -0.0        0.34 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__cond_resched
>       0.04 =C2=B1 71%      -0.0        0.01 =C2=B1223%  perf-profile.chil=
dren.cycles-pp.blkcg_maybe_throttle_current
>       0.60 =C2=B1  4%      -0.0        0.57 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       0.55 =C2=B1  2%      -0.0        0.52 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__check_object_size
>       0.15 =C2=B1  7%      -0.0        0.12 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.lapic_next_deadline
>       0.60 =C2=B1  2%      -0.0        0.57 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.call_rcu
>       0.68            -0.0        0.66 =C2=B1  2%  perf-profile.children.=
cycles-pp.try_to_unlazy
>       0.52 =C2=B1  3%      -0.0        0.49 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.allocate_slab
>       0.04 =C2=B1 44%      -0.0        0.02 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.putname
>       0.04 =C2=B1 44%      -0.0        0.02 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.mntput
>       0.73 =C2=B1  4%      -0.0        0.71 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.rcu_cblist_dequeue
>       0.33 =C2=B1 14%      -0.0        0.31 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       0.42 =C2=B1  2%      -0.0        0.40 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.lockref_put_or_lock
>       0.34 =C2=B1  3%      -0.0        0.32 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.path_init
>       0.19 =C2=B1  5%      -0.0        0.16 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       0.12 =C2=B1  6%      -0.0        0.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.native_sched_clock
>       0.06 =C2=B1 13%      -0.0        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.timerqueue_del
>       0.33 =C2=B1  5%      -0.0        0.31 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.obj_cgroup_charge
>       0.44 =C2=B1  2%      -0.0        0.42 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.memset_erms
>       0.20 =C2=B1  4%      -0.0        0.18 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.refill_obj_stock
>       0.14 =C2=B1  6%      -0.0        0.12 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       0.27 =C2=B1  3%      -0.0        0.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__mod_memcg_lruvec_state
>       0.24 =C2=B1  4%      -0.0        0.22        perf-profile.children.=
cycles-pp.__mnt_want_write
>       0.06 =C2=B1 11%      -0.0        0.05 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.__remove_hrtimer
>       0.03 =C2=B1 70%      -0.0        0.02 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.get_random_u32
>       0.38 =C2=B1  2%      -0.0        0.37 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.close_fd
>       0.22 =C2=B1  6%      -0.0        0.21 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.lockref_get_not_dead
>       0.35 =C2=B1  3%      -0.0        0.33 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.pick_file
>       0.02 =C2=B1 99%      -0.0        0.01 =C2=B1223%  perf-profile.chil=
dren.cycles-pp.hrtimer_update_next_event
>       0.53            -0.0        0.51 =C2=B1  3%  perf-profile.children.=
cycles-pp.__legitimize_path
>       0.19 =C2=B1  4%      -0.0        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__might_fault
>       0.18 =C2=B1  3%      -0.0        0.16 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.rcu_all_qs
>       0.44 =C2=B1  3%      -0.0        0.42 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__fsnotify_parent
>       0.21 =C2=B1  7%      -0.0        0.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.obj_cgroup_charge_pages
>       0.20 =C2=B1  4%      -0.0        0.19 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.lockref_get
>       0.16 =C2=B1  3%      -0.0        0.14 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.mntput_no_expire
>       0.12 =C2=B1  8%      -0.0        0.10 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.read_tsc
>       0.06 =C2=B1 11%      -0.0        0.05 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.rcu_dynticks_inc
>       0.19 =C2=B1  5%      -0.0        0.18 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.nd_jump_root
>       0.07 =C2=B1 10%      -0.0        0.06 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.file_ra_state_init
>       0.36 =C2=B1  4%      -0.0        0.35 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.step_into
>       0.28 =C2=B1  6%      -0.0        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.testcase
>       0.20 =C2=B1  4%      -0.0        0.19 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.syscall_enter_from_user_mode
>       0.16 =C2=B1  9%      -0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.page_counter_charge
>       0.09 =C2=B1  9%      -0.0        0.08 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.get_unused_fd_flags
>       0.06 =C2=B1 11%      -0.0        0.05 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.get_next_timer_interrupt
>       0.05 =C2=B1  7%      -0.0        0.04 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.dnotify_flush
>       0.02 =C2=B1142%      -0.0        0.01 =C2=B1223%  perf-profile.chil=
dren.cycles-pp.should_failslab
>       0.10 =C2=B1 11%      -0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.set_root
>       0.16 =C2=B1  3%      -0.0        0.14 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.percpu_counter_add_batch
>       0.10 =C2=B1  5%      -0.0        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.native_apic_msr_eoi_write
>       0.07 =C2=B1  8%      -0.0        0.06 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.legitimize_links
>       0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.=
cycles-pp.asm_sysvec_call_function_single
>       0.01 =C2=B1223%      -0.0        0.00        perf-profile.children.=
cycles-pp.rcu_idle_exit
>       0.21 =C2=B1  4%      -0.0        0.20 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__check_heap_object
>       0.08 =C2=B1  8%      -0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.fd_install
>       0.05 =C2=B1  8%      -0.0        0.04 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.errseq_sample
>       0.03 =C2=B1 70%      -0.0        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.hrtimer_next_event_without
>       0.08 =C2=B1  8%      -0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.expand_files
>       0.87 =C2=B1  4%      -0.0        0.86 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.52 =C2=B1  5%      -0.0        0.51 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.24 =C2=B1  3%      -0.0        0.23 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irq
>       0.13 =C2=B1  6%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_safe_stack
>       0.08 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.locks_remove_file
>       0.08 =C2=B1 10%      -0.0        0.08 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.irqtime_account_irq
>       0.21 =C2=B1  6%      -0.0        0.20 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.obj_cgroup_uncharge_pages
>       0.16 =C2=B1  6%      -0.0        0.15 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.security_inode_permission
>       0.13 =C2=B1  7%      -0.0        0.13 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.07 =C2=B1 11%      -0.0        0.06 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.arch_scale_freq_tick
>       0.07 =C2=B1  9%      -0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.path_get
>       0.06 =C2=B1 11%      -0.0        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.06 =C2=B1  8%      -0.0        0.05 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.restore_nameidata
>       0.05 =C2=B1  7%      -0.0        0.05 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.ksys_read
>       0.05 =C2=B1  7%      -0.0        0.05 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.vfs_read
>       0.08 =C2=B1  8%      -0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.locks_remove_posix
>       0.12 =C2=B1  9%      -0.0        0.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.close(a)plt
>       0.32 =C2=B1 15%      -0.0        0.32 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.32 =C2=B1 15%      -0.0        0.32 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.18 =C2=B1  4%      -0.0        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.rcu_segcblist_enqueue
>       0.15 =C2=B1  4%      -0.0        0.14 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.page_counter_cancel
>       0.17 =C2=B1  5%      -0.0        0.17 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.page_counter_uncharge
>       0.13 =C2=B1  8%      -0.0        0.13 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__virt_addr_valid
>       0.44 =C2=B1  3%      -0.0        0.44        perf-profile.children.=
cycles-pp.__might_sleep
>       0.51 =C2=B1  5%      -0.0        0.51 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.06 =C2=B1 11%      -0.0        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.update_sd_lb_stats
>       0.08 =C2=B1 10%      -0.0        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.load_balance
>       0.03 =C2=B1100%      -0.0        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.irqentry_enter
>       0.28 =C2=B1 17%      -0.0        0.28 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.run_ksoftirqd
>       0.30 =C2=B1 17%      +0.0        0.30 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.smpboot_thread_fn
>       0.22 =C2=B1 18%      +0.0        0.22 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.get_obj_cgroup_from_current
>       0.08 =C2=B1  9%      +0.0        0.08 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.process_measurement
>       0.08 =C2=B1  9%      +0.0        0.08 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__lookup_mnt
>       0.08 =C2=B1  7%      +0.0        0.08 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__unfreeze_partials
>       0.06            +0.0        0.06 =C2=B1 13%  perf-profile.children.=
cycles-pp.__intel_pmu_enable_all
>       0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.start_kernel
>       0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.rcu_sched_clock_irq
>       0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.chil=
dren.cycles-pp.__hrtimer_next_event_base
>       0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.chil=
dren.cycles-pp.arch_cpu_idle_enter
>       0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>       0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.chil=
dren.cycles-pp.tsc_verify_tsc_adjust
>       0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp._find_next_bit
>       0.06 =C2=B1 11%      +0.0        0.06 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.find_busiest_group
>       0.08 =C2=B1  8%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode_prepare
>       0.04 =C2=B1 44%      +0.0        0.04 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.update_blocked_averages
>       0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.kick_process
>       0.02 =C2=B1142%      +0.0        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.__mnt_drop_write
>       0.25 =C2=B1  4%      +0.0        0.26 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__legitimize_mnt
>       0.14 =C2=B1 17%      +0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.process_simple
>       0.10 =C2=B1  3%      +0.0        0.11 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.unwind_next_frame
>       0.05 =C2=B1 48%      +0.0        0.06 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__ordered_events__flush
>       0.05 =C2=B1 47%      +0.0        0.06 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.perf_session__process_user_event
>       0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.=
cycles-pp.calc_global_load_tick
>       0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.=
cycles-pp.trigger_load_balance
>       0.00            +0.0        0.01 =C2=B1223%  perf-profile.children.=
cycles-pp.__schedule
>       0.14 =C2=B1 17%      +0.0        0.15 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.record__finish_output
>       0.14 =C2=B1 17%      +0.0        0.15 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.perf_session__process_events
>       0.14 =C2=B1  3%      +0.0        0.15 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_callchain
>       0.14 =C2=B1  3%      +0.0        0.14 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.get_perf_callchain
>       0.13 =C2=B1  3%      +0.0        0.14 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.perf_callchain_kernel
>       0.50 =C2=B1  5%      +0.0        0.51 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.walk_component
>       0.14 =C2=B1  3%      +0.0        0.16 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_prepare_sample
>       0.06 =C2=B1 46%      +0.0        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.queue_event
>       0.06 =C2=B1 47%      +0.0        0.07 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.ordered_events__queue
>       0.17 =C2=B1  4%      +0.0        0.18 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_tp_event
>       0.36 =C2=B1  7%      +0.0        0.37 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.16 =C2=B1  3%      +0.0        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__perf_event_overflow
>       0.15 =C2=B1  3%      +0.0        0.17 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_stat_runtime
>       0.06 =C2=B1 47%      +0.0        0.07 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.perf_session__deliver_event
>       0.18 =C2=B1 18%      +0.0        0.20 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.cmd_sched
>       0.18 =C2=B1 17%      +0.0        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.cmd_record
>       0.16 =C2=B1  3%      +0.0        0.18 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.perf_swevent_overflow
>       0.16 =C2=B1  4%      +0.0        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_event_output_forward
>       0.20 =C2=B1 16%      +0.0        0.22 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       0.20 =C2=B1 16%      +0.0        0.22 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.main
>       0.20 =C2=B1 16%      +0.0        0.22 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.run_builtin
>       0.01 =C2=B1223%      +0.0        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.vfs_open
>       0.01 =C2=B1223%      +0.0        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.ksys_write
>       0.18 =C2=B1  2%      +0.0        0.19 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.task_tick_fair
>       0.16 =C2=B1  2%      +0.0        0.18 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.06 =C2=B1 61%      +0.0        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.tick_nohz_irq_exit
>       0.00            +0.0        0.02 =C2=B1 99%  perf-profile.children.=
cycles-pp.run_rebalance_domains
>       0.13 =C2=B1  8%      +0.0        0.16 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.perf_mux_hrtimer_handler
>      17.50            +0.1       17.56        perf-profile.children.cycle=
s-pp.alloc_empty_file
>      17.36            +0.1       17.42        perf-profile.children.cycle=
s-pp.__alloc_file
>       0.43 =C2=B1 22%      +0.1        0.49 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.menu_select
>       0.24 =C2=B1 35%      +0.1        0.32 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       0.18 =C2=B1 48%      +0.1        0.26 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       0.04 =C2=B1223%      +0.1        0.13 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.timekeeping_max_deferment
>      17.52            +0.2       17.73        perf-profile.children.cycle=
s-pp.__close
>      12.74            +0.3       13.06        perf-profile.children.cycle=
s-pp.security_file_alloc
>      11.89            +0.4       12.26        perf-profile.children.cycle=
s-pp.apparmor_file_alloc_security
>       0.00            +0.4        0.40 =C2=B1223%  perf-profile.children.=
cycles-pp.poll_idle
>      14.82            +0.4       15.22        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>      14.62            +0.4       15.02        perf-profile.children.cycle=
s-pp.exit_to_user_mode_prepare
>      23.28            +0.4       23.68        perf-profile.children.cycle=
s-pp.do_dentry_open
>      14.14            +0.4       14.57        perf-profile.children.cycle=
s-pp.task_work_run
>      21.70            +0.5       22.20        perf-profile.children.cycle=
s-pp.security_file_open
>      21.60            +0.5       22.10        perf-profile.children.cycle=
s-pp.apparmor_file_open
>      12.83            +0.5       13.34        perf-profile.children.cycle=
s-pp.__fput
>      73.32            +0.5       73.84        perf-profile.children.cycle=
s-pp.open64
>      10.97            +0.6       11.58        perf-profile.children.cycle=
s-pp.security_file_free
>      10.93            +0.6       11.54        perf-profile.children.cycle=
s-pp.apparmor_file_free_security
>      71.22            +0.7       71.92        perf-profile.children.cycle=
s-pp.do_sys_open
>      71.14            +0.7       71.86        perf-profile.children.cycle=
s-pp.do_sys_openat2
>      21.56            +0.8       22.32        perf-profile.children.cycle=
s-pp.apparmor_current_getsecid_subj
>      21.76            +0.8       22.52        perf-profile.children.cycle=
s-pp.ima_file_check
>      21.60            +0.8       22.37        perf-profile.children.cycle=
s-pp.security_current_getsecid_subj
>      67.20            +1.0       68.16        perf-profile.children.cycle=
s-pp.path_openat
>      67.38            +1.0       68.33        perf-profile.children.cycle=
s-pp.do_filp_open
>      88.04            +1.0       89.03        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      87.84            +1.0       88.84        perf-profile.children.cycle=
s-pp.do_syscall_64
>      46.42            +1.1       47.53        perf-profile.children.cycle=
s-pp.do_open
>       5.58 =C2=B1  5%      -0.8        4.80 =C2=B1 25%  perf-profile.self=
.cycles-pp.acpi_idle_do_entry
>       0.57 =C2=B1 13%      -0.2        0.39 =C2=B1 43%  perf-profile.self=
.cycles-pp.ktime_get
>       1.26 =C2=B1  3%      -0.1        1.12 =C2=B1  2%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       0.87 =C2=B1  2%      -0.1        0.80 =C2=B1  3%  perf-profile.self=
.cycles-pp.kmem_cache_free
>       1.02            -0.1        0.95 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__might_resched
>       0.90 =C2=B1  2%      -0.1        0.84        perf-profile.self.cycl=
es-pp.syscall_return_via_sysret
>       2.02 =C2=B1  3%      -0.1        1.96 =C2=B1  2%  perf-profile.self=
.cycles-pp.__alloc_file
>       0.10 =C2=B1 24%      -0.1        0.05 =C2=B1111%  perf-profile.self=
.cycles-pp.ktime_get_update_offsets_now
>       0.53 =C2=B1  3%      -0.1        0.47 =C2=B1  3%  perf-profile.self=
.cycles-pp.open64
>       0.11 =C2=B1 26%      -0.1        0.06 =C2=B1 76%  perf-profile.self=
.cycles-pp._raw_spin_trylock
>       0.81 =C2=B1  2%      -0.1        0.76 =C2=B1  2%  perf-profile.self=
.cycles-pp.do_dentry_open
>       0.59 =C2=B1  2%      -0.0        0.55 =C2=B1  2%  perf-profile.self=
.cycles-pp.link_path_walk
>       0.51 =C2=B1  3%      -0.0        0.46 =C2=B1  2%  perf-profile.self=
.cycles-pp.mod_objcg_state
>       0.58            -0.0        0.54 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__slab_free
>       0.66            -0.0        0.62 =C2=B1  3%  perf-profile.self.cycl=
es-pp.strncpy_from_user
>       0.37 =C2=B1  4%      -0.0        0.34 =C2=B1  3%  perf-profile.self=
.cycles-pp.task_work_add
>       0.46 =C2=B1  2%      -0.0        0.43 =C2=B1  3%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.32 =C2=B1  3%      -0.0        0.29 =C2=B1  5%  perf-profile.self=
.cycles-pp.__d_lookup_rcu
>       0.56 =C2=B1  3%      -0.0        0.53 =C2=B1  2%  perf-profile.self=
.cycles-pp.file_free_rcu
>       0.39 =C2=B1  2%      -0.0        0.36 =C2=B1  3%  perf-profile.self=
.cycles-pp.lockref_put_or_lock
>       0.04 =C2=B1 45%      -0.0        0.02 =C2=B1141%  perf-profile.self=
.cycles-pp.___slab_alloc
>       0.30 =C2=B1  4%      -0.0        0.28 =C2=B1  6%  perf-profile.self=
.cycles-pp.generic_permission
>       0.38 =C2=B1  3%      -0.0        0.36 =C2=B1  2%  perf-profile.self=
.cycles-pp.exit_to_user_mode_prepare
>       0.19 =C2=B1  2%      -0.0        0.17 =C2=B1  7%  perf-profile.self=
.cycles-pp.refill_obj_stock
>       0.02 =C2=B1 99%      -0.0        0.00        perf-profile.self.cycl=
es-pp.security_file_free
>       0.06 =C2=B1  7%      -0.0        0.04 =C2=B1 72%  perf-profile.self=
.cycles-pp.sysvec_apic_timer_interrupt
>       0.72 =C2=B1  4%      -0.0        0.70 =C2=B1  4%  perf-profile.self=
.cycles-pp.rcu_cblist_dequeue
>       0.31 =C2=B1  3%      -0.0        0.29 =C2=B1  5%  perf-profile.self=
.cycles-pp.inode_permission
>       0.27 =C2=B1  4%      -0.0        0.25 =C2=B1  5%  perf-profile.self=
.cycles-pp.task_work_run
>       0.27 =C2=B1  3%      -0.0        0.25 =C2=B1  4%  perf-profile.self=
.cycles-pp.alloc_fd
>       0.14 =C2=B1  6%      -0.0        0.12 =C2=B1 15%  perf-profile.self=
.cycles-pp.lapic_next_deadline
>       0.46 =C2=B1  2%      -0.0        0.44 =C2=B1  3%  perf-profile.self=
.cycles-pp.__fput
>       0.37 =C2=B1  2%      -0.0        0.35 =C2=B1  2%  perf-profile.self=
.cycles-pp.do_sys_openat2
>       0.19 =C2=B1  5%      -0.0        0.16 =C2=B1 15%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.08 =C2=B1 10%      -0.0        0.06 =C2=B1 45%  perf-profile.self=
.cycles-pp.do_idle
>       0.38 =C2=B1  3%      -0.0        0.36 =C2=B1  2%  perf-profile.self=
.cycles-pp.call_rcu
>       0.24 =C2=B1  6%      -0.0        0.22 =C2=B1  5%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.40 =C2=B1  3%      -0.0        0.38 =C2=B1  3%  perf-profile.self=
.cycles-pp.allocate_slab
>       0.26 =C2=B1  4%      -0.0        0.24 =C2=B1  4%  perf-profile.self=
.cycles-pp.__mod_memcg_lruvec_state
>       0.12 =C2=B1  8%      -0.0        0.10 =C2=B1 10%  perf-profile.self=
.cycles-pp.native_sched_clock
>       0.19 =C2=B1  7%      -0.0        0.18 =C2=B1  5%  perf-profile.self=
.cycles-pp.__check_object_size
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1 46%  perf-profile.self=
.cycles-pp.asm_sysvec_apic_timer_interrupt
>       0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycl=
es-pp.blkcg_maybe_throttle_current
>       0.40 =C2=B1  2%      -0.0        0.38 =C2=B1  2%  perf-profile.self=
.cycles-pp.__close
>       0.28 =C2=B1  4%      -0.0        0.26 =C2=B1  2%  perf-profile.self=
.cycles-pp.path_openat
>       0.20 =C2=B1  6%      -0.0        0.18 =C2=B1  6%  perf-profile.self=
.cycles-pp.lockref_get_not_dead
>       0.22 =C2=B1  4%      -0.0        0.21 =C2=B1  3%  perf-profile.self=
.cycles-pp.__mnt_want_write
>       0.07 =C2=B1  5%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.locks_remove_posix
>       0.16 =C2=B1 18%      -0.0        0.15 =C2=B1 25%  perf-profile.self=
.cycles-pp.menu_select
>       0.15 =C2=B1  7%      -0.0        0.14 =C2=B1  4%  perf-profile.self=
.cycles-pp.path_init
>       0.11 =C2=B1  4%      -0.0        0.10 =C2=B1 11%  perf-profile.self=
.cycles-pp.read_tsc
>       0.04 =C2=B1 71%      -0.0        0.02 =C2=B1142%  perf-profile.self=
.cycles-pp.update_process_times
>       0.39 =C2=B1  2%      -0.0        0.38 =C2=B1  4%  perf-profile.self=
.cycles-pp.__fsnotify_parent
>       0.41 =C2=B1  2%      -0.0        0.40 =C2=B1  2%  perf-profile.self=
.cycles-pp.memset_erms
>       0.20 =C2=B1  4%      -0.0        0.19 =C2=B1  5%  perf-profile.self=
.cycles-pp.__entry_text_start
>       0.17 =C2=B1  5%      -0.0        0.16 =C2=B1  4%  perf-profile.self=
.cycles-pp.dput
>       0.18 =C2=B1  6%      -0.0        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.lockref_get
>       0.11 =C2=B1  6%      -0.0        0.10 =C2=B1  8%  perf-profile.self=
.cycles-pp.obj_cgroup_charge
>       0.13 =C2=B1  8%      -0.0        0.12 =C2=B1  7%  perf-profile.self=
.cycles-pp.security_inode_permission
>       0.12 =C2=B1  9%      -0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.syscall_exit_to_user_mode
>       0.12 =C2=B1  5%      -0.0        0.11 =C2=B1 10%  perf-profile.self=
.cycles-pp.syscall_enter_from_user_mode
>       0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  4%  perf-profile.self=
.cycles-pp.security_file_open
>       0.18 =C2=B1  4%      -0.0        0.17 =C2=B1  3%  perf-profile.self=
.cycles-pp.lookup_fast
>       0.18 =C2=B1  5%      -0.0        0.16 =C2=B1  9%  perf-profile.self=
.cycles-pp.__cond_resched
>       0.18 =C2=B1  6%      -0.0        0.17 =C2=B1  5%  perf-profile.self=
.cycles-pp.do_syscall_64
>       0.14 =C2=B1  9%      -0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.page_counter_charge
>       0.06 =C2=B1 11%      -0.0        0.05 =C2=B1 45%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1 11%  perf-profile.self=
.cycles-pp.do_sys_open
>       0.10 =C2=B1  5%      -0.0        0.09 =C2=B1 20%  perf-profile.self=
.cycles-pp.native_apic_msr_eoi_write
>       0.16 =C2=B1  4%      -0.0        0.16 =C2=B1  4%  perf-profile.self=
.cycles-pp.getname_flags
>       0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%  perf-profile.self=
.cycles-pp.security_current_getsecid_subj
>       0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%  perf-profile.self=
.cycles-pp.kick_process
>       0.01 =C2=B1223%      -0.0        0.00        perf-profile.self.cycl=
es-pp.tsc_verify_tsc_adjust
>       0.08 =C2=B1 11%      -0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.set_root
>       0.08            -0.0        0.07 =C2=B1  5%  perf-profile.self.cycl=
es-pp.try_to_unlazy
>       0.06 =C2=B1  6%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.locks_remove_file
>       0.06 =C2=B1  9%      -0.0        0.05 =C2=B1 45%  perf-profile.self=
.cycles-pp.rcu_dynticks_inc
>       0.12 =C2=B1  4%      -0.0        0.11 =C2=B1  3%  perf-profile.self=
.cycles-pp.rcu_all_qs
>       0.19            -0.0        0.18 =C2=B1  4%  perf-profile.self.cycl=
es-pp.fput_many
>       0.14 =C2=B1  5%      -0.0        0.13 =C2=B1  5%  perf-profile.self=
.cycles-pp.mntput_no_expire
>       0.08 =C2=B1  6%      -0.0        0.07 =C2=B1  8%  perf-profile.self=
.cycles-pp.security_file_alloc
>       0.07 =C2=B1  9%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.expand_files
>       0.19 =C2=B1  6%      -0.0        0.18 =C2=B1  4%  perf-profile.self=
.cycles-pp.do_open
>       0.19 =C2=B1  3%      -0.0        0.18 =C2=B1  7%  perf-profile.self=
.cycles-pp.__check_heap_object
>       0.06 =C2=B1  8%      -0.0        0.05        perf-profile.self.cycl=
es-pp.legitimize_links
>       0.23 =C2=B1  3%      -0.0        0.22 =C2=B1  6%  perf-profile.self=
.cycles-pp._raw_spin_lock_irq
>       0.25 =C2=B1  2%      -0.0        0.25 =C2=B1  4%  perf-profile.self=
.cycles-pp.step_into
>       0.13 =C2=B1  8%      -0.0        0.12 =C2=B1  3%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_safe_stack
>       0.36 =C2=B1  3%      -0.0        0.35        perf-profile.self.cycl=
es-pp.__might_sleep
>       0.26 =C2=B1  6%      -0.0        0.25 =C2=B1  4%  perf-profile.self=
.cycles-pp.testcase
>       0.09 =C2=B1  7%      -0.0        0.09 =C2=B1  7%  perf-profile.self=
.cycles-pp.nd_jump_root
>       0.07 =C2=B1  9%      -0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.terminate_walk
>       0.07 =C2=B1 13%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.get_unused_fd_flags
>       0.07 =C2=B1 11%      -0.0        0.06 =C2=B1 19%  perf-profile.self=
.cycles-pp.arch_scale_freq_tick
>       0.13 =C2=B1  5%      -0.0        0.12 =C2=B1  7%  perf-profile.self=
.cycles-pp.pick_file
>       0.08 =C2=B1 11%      -0.0        0.08 =C2=B1  4%  perf-profile.self=
.cycles-pp.may_open
>       0.18 =C2=B1  4%      -0.0        0.17 =C2=B1  5%  perf-profile.self=
.cycles-pp.rcu_segcblist_enqueue
>       0.12 =C2=B1  6%      -0.0        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.percpu_counter_add_batch
>       0.07 =C2=B1 10%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.process_measurement
>       0.06 =C2=B1  7%      -0.0        0.06 =C2=B1  6%  perf-profile.self=
.cycles-pp.fd_install
>       0.12 =C2=B1  9%      -0.0        0.11 =C2=B1  8%  perf-profile.self=
.cycles-pp.__virt_addr_valid
>       0.07 =C2=B1  5%      -0.0        0.07 =C2=B1  5%  perf-profile.self=
.cycles-pp.alloc_empty_file
>       0.07 =C2=B1  7%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.__legitimize_path
>       0.18 =C2=B1 19%      -0.0        0.18 =C2=B1  9%  perf-profile.self=
.cycles-pp.get_obj_cgroup_from_current
>       0.08 =C2=B1  6%      -0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.filp_close
>       0.06 =C2=B1  7%      -0.0        0.06 =C2=B1  6%  perf-profile.self=
.cycles-pp.complete_walk
>       0.12 =C2=B1  8%      -0.0        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.06 =C2=B1  8%      -0.0        0.06 =C2=B1  9%  perf-profile.self=
.cycles-pp.rcu_do_batch
>       0.13 =C2=B1  5%      -0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.do_filp_open
>       0.14 =C2=B1  5%      +0.0        0.14 =C2=B1 12%  perf-profile.self=
.cycles-pp.page_counter_cancel
>       0.06            +0.0        0.06 =C2=B1 13%  perf-profile.self.cycl=
es-pp.__intel_pmu_enable_all
>       0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.self=
.cycles-pp.close(a)plt
>       0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.self=
.cycles-pp.update_sd_lb_stats
>       0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%  perf-profile.self=
.cycles-pp.irq_enter_rcu
>       0.08 =C2=B1  4%      +0.0        0.08 =C2=B1 11%  perf-profile.self=
.cycles-pp.ima_file_check
>       0.06 =C2=B1 11%      +0.0        0.06 =C2=B1 13%  perf-profile.self=
.cycles-pp.__lookup_mnt
>       0.23 =C2=B1  3%      +0.0        0.23 =C2=B1  4%  perf-profile.self=
.cycles-pp.__legitimize_mnt
>       0.10 =C2=B1  7%      +0.0        0.10 =C2=B1  8%  perf-profile.self=
.cycles-pp._find_next_bit
>       0.08 =C2=B1  6%      +0.0        0.08 =C2=B1  8%  perf-profile.self=
.cycles-pp.walk_component
>       0.06 =C2=B1  7%      +0.0        0.07 =C2=B1 10%  perf-profile.self=
.cycles-pp.syscall_exit_to_user_mode_prepare
>       0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%  perf-profile.self=
.cycles-pp.restore_nameidata
>       0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%  perf-profile.self=
.cycles-pp.unwind_next_frame
>       0.00            +0.0        0.01 =C2=B1223%  perf-profile.self.cycl=
es-pp.calc_global_load_tick
>       0.06 =C2=B1 46%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.queue_event
>       0.02 =C2=B1 99%      +0.0        0.05 =C2=B1 51%  perf-profile.self=
.cycles-pp.tick_nohz_next_event
>       0.04 =C2=B1223%      +0.1        0.13 =C2=B1 36%  perf-profile.self=
.cycles-pp.timekeeping_max_deferment
>       0.00            +0.4        0.38 =C2=B1223%  perf-profile.self.cycl=
es-pp.poll_idle
>      11.32            +0.4       11.72        perf-profile.self.cycles-pp=
.apparmor_file_alloc_security
>      20.83            +0.6       21.39        perf-profile.self.cycles-pp=
.apparmor_file_open
>      10.54            +0.6       11.16        perf-profile.self.cycles-pp=
.apparmor_file_free_security
>      20.79            +0.8       21.62        perf-profile.self.cycles-pp=
.apparmor_current_getsecid_subj
>     189420            -0.0%     189373        slabinfo.Acpi-Operand.activ=
e_objs
>       3382            -0.0%       3381        slabinfo.Acpi-Operand.activ=
e_slabs
>     189420            -0.0%     189373        slabinfo.Acpi-Operand.num_o=
bjs
>       3382            -0.0%       3381        slabinfo.Acpi-Operand.num_s=
labs
>       1508 =C2=B1  4%      -4.8%       1435 =C2=B1  9%  slabinfo.Acpi-Par=
se.active_objs
>      20.67 =C2=B1  4%      -4.8%      19.67 =C2=B1  9%  slabinfo.Acpi-Par=
se.active_slabs
>       1508 =C2=B1  4%      -4.8%       1435 =C2=B1  9%  slabinfo.Acpi-Par=
se.num_objs
>      20.67 =C2=B1  4%      -4.8%      19.67 =C2=B1  9%  slabinfo.Acpi-Par=
se.num_slabs
>     748.00 =C2=B1 12%     -35.2%     484.50 =C2=B1 10%  slabinfo.Acpi-Sta=
te.active_objs
>      14.67 =C2=B1 12%     -35.2%       9.50 =C2=B1 10%  slabinfo.Acpi-Sta=
te.active_slabs
>     748.00 =C2=B1 12%     -35.2%     484.50 =C2=B1 10%  slabinfo.Acpi-Sta=
te.num_objs
>      14.67 =C2=B1 12%     -35.2%       9.50 =C2=B1 10%  slabinfo.Acpi-Sta=
te.num_slabs
>      18.00            +0.0%      18.00        slabinfo.DCCP.active_objs
>       1.00            +0.0%       1.00        slabinfo.DCCP.active_slabs
>      18.00            +0.0%      18.00        slabinfo.DCCP.num_objs
>       1.00            +0.0%       1.00        slabinfo.DCCP.num_slabs
>      17.00            +0.0%      17.00        slabinfo.DCCPv6.active_objs
>       1.00            +0.0%       1.00        slabinfo.DCCPv6.active_slabs
>      17.00            +0.0%      17.00        slabinfo.DCCPv6.num_objs
>       1.00            +0.0%       1.00        slabinfo.DCCPv6.num_slabs
>     256.00            +0.0%     256.00        slabinfo.RAW.active_objs
>       8.00            +0.0%       8.00        slabinfo.RAW.active_slabs
>     256.00            +0.0%     256.00        slabinfo.RAW.num_objs
>       8.00            +0.0%       8.00        slabinfo.RAW.num_slabs
>     156.00            +0.0%     156.00        slabinfo.RAWv6.active_objs
>       6.00            +0.0%       6.00        slabinfo.RAWv6.active_slabs
>     156.00            +0.0%     156.00        slabinfo.RAWv6.num_objs
>       6.00            +0.0%       6.00        slabinfo.RAWv6.num_slabs
>      56.00            -8.3%      51.33 =C2=B1 12%  slabinfo.TCP.active_ob=
js
>       4.00            -8.3%       3.67 =C2=B1 12%  slabinfo.TCP.active_sl=
abs
>      56.00            -8.3%      51.33 =C2=B1 12%  slabinfo.TCP.num_objs
>       4.00            -8.3%       3.67 =C2=B1 12%  slabinfo.TCP.num_slabs
>      39.00            +0.0%      39.00        slabinfo.TCPv6.active_objs
>       3.00            +0.0%       3.00        slabinfo.TCPv6.active_slabs
>      39.00            +0.0%      39.00        slabinfo.TCPv6.num_objs
>       3.00            +0.0%       3.00        slabinfo.TCPv6.num_slabs
>     161.17 =C2=B1  6%      -0.4%     160.50 =C2=B1  5%  slabinfo.UDPv6.ac=
tive_objs
>       6.33 =C2=B1  7%      -2.6%       6.17 =C2=B1  6%  slabinfo.UDPv6.ac=
tive_slabs
>     161.17 =C2=B1  6%      -0.4%     160.50 =C2=B1  5%  slabinfo.UDPv6.nu=
m_objs
>       6.33 =C2=B1  7%      -2.6%       6.17 =C2=B1  6%  slabinfo.UDPv6.nu=
m_slabs
>       2328 =C2=B1 15%      -5.8%       2192 =C2=B1 18%  slabinfo.UNIX.act=
ive_objs
>      77.00 =C2=B1 15%      -6.1%      72.33 =C2=B1 18%  slabinfo.UNIX.act=
ive_slabs
>       2328 =C2=B1 15%      -5.8%       2192 =C2=B1 18%  slabinfo.UNIX.num=
_objs
>      77.00 =C2=B1 15%      -6.1%      72.33 =C2=B1 18%  slabinfo.UNIX.num=
_slabs
>      20954 =C2=B1  6%      -1.1%      20720 =C2=B1  7%  slabinfo.anon_vma=
.active_objs
>     458.67 =C2=B1  6%      -1.0%     454.00 =C2=B1  8%  slabinfo.anon_vma=
.active_slabs
>      21122 =C2=B1  6%      -1.1%      20900 =C2=B1  8%  slabinfo.anon_vma=
.num_objs
>     458.67 =C2=B1  6%      -1.0%     454.00 =C2=B1  8%  slabinfo.anon_vma=
.num_slabs
>      26069            -0.2%      26004 =C2=B1  2%  slabinfo.anon_vma_chai=
n.active_objs
>     412.00            +0.2%     412.83 =C2=B1  2%  slabinfo.anon_vma_chai=
n.active_slabs
>      26384            +0.3%      26462 =C2=B1  2%  slabinfo.anon_vma_chai=
n.num_objs
>     412.00            +0.2%     412.83 =C2=B1  2%  slabinfo.anon_vma_chai=
n.num_slabs
>      70.00 =C2=B1 22%     -10.0%      63.00        slabinfo.bdev_cache.ac=
tive_objs
>       3.33 =C2=B1 22%     -10.0%       3.00        slabinfo.bdev_cache.ac=
tive_slabs
>      70.00 =C2=B1 22%     -10.0%      63.00        slabinfo.bdev_cache.nu=
m_objs
>       3.33 =C2=B1 22%     -10.0%       3.00        slabinfo.bdev_cache.nu=
m_slabs
>     640.00 =C2=B1 11%      +6.7%     682.67 =C2=B1  6%  slabinfo.bio-120.=
active_objs
>      10.00 =C2=B1 11%      +6.7%      10.67 =C2=B1  6%  slabinfo.bio-120.=
active_slabs
>     640.00 =C2=B1 11%      +6.7%     682.67 =C2=B1  6%  slabinfo.bio-120.=
num_objs
>      10.00 =C2=B1 11%      +6.7%      10.67 =C2=B1  6%  slabinfo.bio-120.=
num_slabs
>     623.00 =C2=B1 23%     +28.1%     798.00 =C2=B1 14%  slabinfo.bio-184.=
active_objs
>      14.83 =C2=B1 23%     +28.1%      19.00 =C2=B1 14%  slabinfo.bio-184.=
active_slabs
>     623.00 =C2=B1 23%     +28.1%     798.00 =C2=B1 14%  slabinfo.bio-184.=
num_objs
>      14.83 =C2=B1 23%     +28.1%      19.00 =C2=B1 14%  slabinfo.bio-184.=
num_slabs
>      64.00            +0.0%      64.00        slabinfo.bio-240.active_objs
>       1.00            +0.0%       1.00        slabinfo.bio-240.active_sla=
bs
>      64.00            +0.0%      64.00        slabinfo.bio-240.num_objs
>       1.00            +0.0%       1.00        slabinfo.bio-240.num_slabs
>      64.00            +0.0%      64.00        slabinfo.bio-248.active_objs
>       1.00            +0.0%       1.00        slabinfo.bio-248.active_sla=
bs
>      64.00            +0.0%      64.00        slabinfo.bio-248.num_objs
>       1.00            +0.0%       1.00        slabinfo.bio-248.num_slabs
>     153.00 =C2=B1 19%     -66.7%      51.00        slabinfo.bio-296.activ=
e_objs
>       3.00 =C2=B1 19%     -66.7%       1.00        slabinfo.bio-296.activ=
e_slabs
>     153.00 =C2=B1 19%     -66.7%      51.00        slabinfo.bio-296.num_o=
bjs
>       3.00 =C2=B1 19%     -66.7%       1.00        slabinfo.bio-296.num_s=
labs
>      32.00            +0.0%      32.00        slabinfo.biovec-128.active_=
objs
>       2.00            +0.0%       2.00        slabinfo.biovec-128.active_=
slabs
>      32.00            +0.0%      32.00        slabinfo.biovec-128.num_objs
>       2.00            +0.0%       2.00        slabinfo.biovec-128.num_sla=
bs
>     314.67 =C2=B1 22%      -1.7%     309.33 =C2=B1 11%  slabinfo.biovec-6=
4.active_objs
>       9.83 =C2=B1 22%      -1.7%       9.67 =C2=B1 11%  slabinfo.biovec-6=
4.active_slabs
>     314.67 =C2=B1 22%      -1.7%     309.33 =C2=B1 11%  slabinfo.biovec-6=
4.num_objs
>       9.83 =C2=B1 22%      -1.7%       9.67 =C2=B1 11%  slabinfo.biovec-6=
4.num_slabs
>      80.00 =C2=B1  5%     -11.7%      70.67 =C2=B1  4%  slabinfo.biovec-m=
ax.active_objs
>      10.00 =C2=B1  5%     -11.7%       8.83 =C2=B1  4%  slabinfo.biovec-m=
ax.active_slabs
>      80.00 =C2=B1  5%     -11.7%      70.67 =C2=B1  4%  slabinfo.biovec-m=
ax.num_objs
>      10.00 =C2=B1  5%     -11.7%       8.83 =C2=B1  4%  slabinfo.biovec-m=
ax.num_slabs
>      65.33 =C2=B1 31%    -100.0%       0.00        slabinfo.btrfs_extent_=
map.active_objs
>       1.17 =C2=B1 31%    -100.0%       0.00        slabinfo.btrfs_extent_=
map.active_slabs
>      65.33 =C2=B1 31%    -100.0%       0.00        slabinfo.btrfs_extent_=
map.num_objs
>       1.17 =C2=B1 31%    -100.0%       0.00        slabinfo.btrfs_extent_=
map.num_slabs
>     103.50 =C2=B1  9%    -100.0%       0.00        slabinfo.btrfs_inode.a=
ctive_objs
>       3.83 =C2=B1  9%    -100.0%       0.00        slabinfo.btrfs_inode.a=
ctive_slabs
>     103.50 =C2=B1  9%    -100.0%       0.00        slabinfo.btrfs_inode.n=
um_objs
>       3.83 =C2=B1  9%    -100.0%       0.00        slabinfo.btrfs_inode.n=
um_slabs
>       0.00       +3.8e+103%      38.00        slabinfo.btrfs_ordered_exte=
nt.active_objs
>       0.00         +1e+102%       1.00        slabinfo.btrfs_ordered_exte=
nt.active_slabs
>       0.00       +3.8e+103%      38.00        slabinfo.btrfs_ordered_exte=
nt.num_objs
>       0.00         +1e+102%       1.00        slabinfo.btrfs_ordered_exte=
nt.num_slabs
>     201.50 =C2=B1  7%     -41.9%     117.00        slabinfo.buffer_head.a=
ctive_objs
>       5.17 =C2=B1  7%     -41.9%       3.00        slabinfo.buffer_head.a=
ctive_slabs
>     201.50 =C2=B1  7%     -41.9%     117.00        slabinfo.buffer_head.n=
um_objs
>       5.17 =C2=B1  7%     -41.9%       3.00        slabinfo.buffer_head.n=
um_slabs
>       8863 =C2=B1  2%      -1.4%       8738        slabinfo.cred_jar.acti=
ve_objs
>     210.17 =C2=B1  2%      -1.4%     207.17        slabinfo.cred_jar.acti=
ve_slabs
>       8863 =C2=B1  2%      -1.4%       8738        slabinfo.cred_jar.num_=
objs
>     210.17 =C2=B1  2%      -1.4%     207.17        slabinfo.cred_jar.num_=
slabs
>      42.00            +0.0%      42.00        slabinfo.dax_cache.active_o=
bjs
>       1.00            +0.0%       1.00        slabinfo.dax_cache.active_s=
labs
>      42.00            +0.0%      42.00        slabinfo.dax_cache.num_objs
>       1.00            +0.0%       1.00        slabinfo.dax_cache.num_slabs
>     131631            +3.6%     136424        slabinfo.dentry.active_objs
>       3176            +3.6%       3290        slabinfo.dentry.active_slabs
>     133446            +3.6%     138232        slabinfo.dentry.num_objs
>       3176            +3.6%       3290        slabinfo.dentry.num_slabs
>      30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-12=
8.active_objs
>       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-12=
8.active_slabs
>      30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-12=
8.num_objs
>       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-12=
8.num_slabs
>       1027 =C2=B1  7%      -7.3%     952.67 =C2=B1 10%  slabinfo.dmaengin=
e-unmap-16.active_objs
>      24.17 =C2=B1  7%      -8.3%      22.17 =C2=B1 10%  slabinfo.dmaengin=
e-unmap-16.active_slabs
>       1027 =C2=B1  7%      -7.3%     952.67 =C2=B1 10%  slabinfo.dmaengin=
e-unmap-16.num_objs
>      24.17 =C2=B1  7%      -8.3%      22.17 =C2=B1 10%  slabinfo.dmaengin=
e-unmap-16.num_slabs
>      15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-25=
6.active_objs
>       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-25=
6.active_slabs
>      15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-25=
6.num_objs
>       1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-25=
6.num_slabs
>      27931 =C2=B1 11%      +4.3%      29129 =C2=B1  6%  slabinfo.ep_head.=
active_objs
>     108.83 =C2=B1 11%      +4.4%     113.67 =C2=B1  6%  slabinfo.ep_head.=
active_slabs
>      27931 =C2=B1 11%      +4.3%      29129 =C2=B1  6%  slabinfo.ep_head.=
num_objs
>     108.83 =C2=B1 11%      +4.4%     113.67 =C2=B1  6%  slabinfo.ep_head.=
num_slabs
>       1141 =C2=B1  9%      -6.6%       1066 =C2=B1 16%  slabinfo.file_loc=
k_cache.active_objs
>      30.67 =C2=B1  9%      -6.5%      28.67 =C2=B1 15%  slabinfo.file_loc=
k_cache.active_slabs
>       1141 =C2=B1  9%      -6.6%       1066 =C2=B1 16%  slabinfo.file_loc=
k_cache.num_objs
>      30.67 =C2=B1  9%      -6.5%      28.67 =C2=B1 15%  slabinfo.file_loc=
k_cache.num_slabs
>       4870 =C2=B1  8%      -0.6%       4838 =C2=B1 11%  slabinfo.files_ca=
che.active_objs
>     105.33 =C2=B1  8%      -0.6%     104.67 =C2=B1 11%  slabinfo.files_ca=
che.active_slabs
>       4870 =C2=B1  8%      -0.6%       4838 =C2=B1 11%  slabinfo.files_ca=
che.num_objs
>     105.33 =C2=B1  8%      -0.6%     104.67 =C2=B1 11%  slabinfo.files_ca=
che.num_slabs
>     201324 =C2=B1  4%      +0.8%     202869        slabinfo.filp.active_o=
bjs
>       3150 =C2=B1  4%      +0.8%       3175        slabinfo.filp.active_s=
labs
>     201692 =C2=B1  4%      +0.8%     203239        slabinfo.filp.num_objs
>       3150 =C2=B1  4%      +0.8%       3175        slabinfo.filp.num_slabs
>       2336 =C2=B1 11%      +4.1%       2432 =C2=B1  9%  slabinfo.fsnotify=
_mark_connector.active_objs
>      18.17 =C2=B1 10%      +4.6%      19.00 =C2=B1  9%  slabinfo.fsnotify=
_mark_connector.active_slabs
>       2336 =C2=B1 11%      +4.1%       2432 =C2=B1  9%  slabinfo.fsnotify=
_mark_connector.num_objs
>      18.17 =C2=B1 10%      +4.6%      19.00 =C2=B1  9%  slabinfo.fsnotify=
_mark_connector.num_slabs
>      27511            +2.6%      28220        slabinfo.ftrace_event_field=
.active_objs
>     323.67            +2.6%     332.00        slabinfo.ftrace_event_field=
.active_slabs
>      27511            +2.6%      28220        slabinfo.ftrace_event_field=
.num_objs
>     323.67            +2.6%     332.00        slabinfo.ftrace_event_field=
.num_slabs
>      98.00            +0.0%      98.00        slabinfo.hugetlbfs_inode_ca=
che.active_objs
>       2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_ca=
che.active_slabs
>      98.00            +0.0%      98.00        slabinfo.hugetlbfs_inode_ca=
che.num_objs
>       2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_ca=
che.num_slabs
>     103295            +3.7%     107078        slabinfo.inode_cache.active=
_objs
>       2028            +3.7%       2102        slabinfo.inode_cache.active=
_slabs
>     103452            +3.7%     107232        slabinfo.inode_cache.num_ob=
js
>       2028            +3.7%       2102        slabinfo.inode_cache.num_sl=
abs
>       0.00         +8e+103%      80.00        slabinfo.ip4-frags.active_o=
bjs
>       0.00         +2e+102%       2.00        slabinfo.ip4-frags.active_s=
labs
>       0.00         +8e+103%      80.00        slabinfo.ip4-frags.num_objs
>       0.00         +2e+102%       2.00        slabinfo.ip4-frags.num_slabs
>       0.00       +4.4e+103%      44.00        slabinfo.ip6-frags.active_o=
bjs
>       0.00         +1e+102%       1.00        slabinfo.ip6-frags.active_s=
labs
>       0.00       +4.4e+103%      44.00        slabinfo.ip6-frags.num_objs
>       0.00         +1e+102%       1.00        slabinfo.ip6-frags.num_slabs
>      97.33 =C2=B1 35%     +12.5%     109.50 =C2=B1 33%  slabinfo.ip_fib_a=
lias.active_objs
>       1.33 =C2=B1 35%     +12.5%       1.50 =C2=B1 33%  slabinfo.ip_fib_a=
lias.active_slabs
>      97.33 =C2=B1 35%     +12.5%     109.50 =C2=B1 33%  slabinfo.ip_fib_a=
lias.num_objs
>       1.33 =C2=B1 35%     +12.5%       1.50 =C2=B1 33%  slabinfo.ip_fib_a=
lias.num_slabs
>     113.33 =C2=B1 35%     +12.5%     127.50 =C2=B1 33%  slabinfo.ip_fib_t=
rie.active_objs
>       1.33 =C2=B1 35%     +12.5%       1.50 =C2=B1 33%  slabinfo.ip_fib_t=
rie.active_slabs
>     113.33 =C2=B1 35%     +12.5%     127.50 =C2=B1 33%  slabinfo.ip_fib_t=
rie.num_objs
>       1.33 =C2=B1 35%     +12.5%       1.50 =C2=B1 33%  slabinfo.ip_fib_t=
rie.num_slabs
>     103286            +0.4%     103707        slabinfo.kernfs_node_cache.=
active_objs
>       1613            +0.4%       1620        slabinfo.kernfs_node_cache.=
active_slabs
>     103286            +0.4%     103707        slabinfo.kernfs_node_cache.=
num_objs
>       1613            +0.4%       1620        slabinfo.kernfs_node_cache.=
num_slabs
>       2308 =C2=B1 10%      -2.9%       2241 =C2=B1 13%  slabinfo.khugepag=
ed_mm_slot.active_objs
>      63.17 =C2=B1 10%      -2.9%      61.33 =C2=B1 13%  slabinfo.khugepag=
ed_mm_slot.active_slabs
>       2308 =C2=B1 10%      -2.9%       2241 =C2=B1 13%  slabinfo.khugepag=
ed_mm_slot.num_objs
>      63.17 =C2=B1 10%      -2.9%      61.33 =C2=B1 13%  slabinfo.khugepag=
ed_mm_slot.num_slabs
>      11774            -0.1%      11759        slabinfo.kmalloc-128.active=
_objs
>     184.33            +0.0%     184.33        slabinfo.kmalloc-128.active=
_slabs
>      11807            -0.1%      11797        slabinfo.kmalloc-128.num_ob=
js
>     184.33            +0.0%     184.33        slabinfo.kmalloc-128.num_sl=
abs
>      47373            +0.6%      47643        slabinfo.kmalloc-16.active_=
objs
>     185.17            +0.5%     186.00        slabinfo.kmalloc-16.active_=
slabs
>      47402            +0.5%      47648        slabinfo.kmalloc-16.num_objs
>     185.17            +0.5%     186.00        slabinfo.kmalloc-16.num_sla=
bs
>       6854            +0.6%       6892        slabinfo.kmalloc-192.active=
_objs
>     164.17            +0.5%     165.00        slabinfo.kmalloc-192.active=
_slabs
>       6895            +0.6%       6936        slabinfo.kmalloc-192.num_ob=
js
>     164.17            +0.5%     165.00        slabinfo.kmalloc-192.num_sl=
abs
>       6614            +0.4%       6639        slabinfo.kmalloc-1k.active_=
objs
>     207.50            +0.5%     208.50        slabinfo.kmalloc-1k.active_=
slabs
>       6648            +0.4%       6676        slabinfo.kmalloc-1k.num_objs
>     207.50            +0.5%     208.50        slabinfo.kmalloc-1k.num_sla=
bs
>      11096            +0.5%      11148        slabinfo.kmalloc-256.active=
_objs
>     174.17            +0.4%     174.83        slabinfo.kmalloc-256.active=
_slabs
>      11156            +0.3%      11189        slabinfo.kmalloc-256.num_ob=
js
>     174.17            +0.4%     174.83        slabinfo.kmalloc-256.num_sl=
abs
>       5004 =C2=B1  3%      +0.4%       5023 =C2=B1  2%  slabinfo.kmalloc-=
2k.active_objs
>     322.33 =C2=B1  2%      +0.3%     323.33 =C2=B1  2%  slabinfo.kmalloc-=
2k.active_slabs
>       5163 =C2=B1  3%      +0.4%       5182 =C2=B1  2%  slabinfo.kmalloc-=
2k.num_objs
>     322.33 =C2=B1  2%      +0.3%     323.33 =C2=B1  2%  slabinfo.kmalloc-=
2k.num_slabs
>      69713            +1.2%      70517        slabinfo.kmalloc-32.active_=
objs
>     544.50            +1.2%     551.00        slabinfo.kmalloc-32.active_=
slabs
>      69812            +1.2%      70649        slabinfo.kmalloc-32.num_objs
>     544.50            +1.2%     551.00        slabinfo.kmalloc-32.num_sla=
bs
>       2503            +0.7%       2520        slabinfo.kmalloc-4k.active_=
objs
>     319.67            +0.7%     321.83        slabinfo.kmalloc-4k.active_=
slabs
>       2561            +0.7%       2579        slabinfo.kmalloc-4k.num_objs
>     319.67            +0.7%     321.83        slabinfo.kmalloc-4k.num_sla=
bs
>      25746            +0.2%      25787        slabinfo.kmalloc-512.active=
_objs
>     434.33            +0.1%     434.67        slabinfo.kmalloc-512.active=
_slabs
>      27826            +0.1%      27851        slabinfo.kmalloc-512.num_ob=
js
>     434.33            +0.1%     434.67        slabinfo.kmalloc-512.num_sl=
abs
>      53761            +0.3%      53929        slabinfo.kmalloc-64.active_=
objs
>     841.50            +0.3%     844.33        slabinfo.kmalloc-64.active_=
slabs
>      53880            +0.4%      54076        slabinfo.kmalloc-64.num_objs
>     841.50            +0.3%     844.33        slabinfo.kmalloc-64.num_sla=
bs
>      72822            -0.1%      72721        slabinfo.kmalloc-8.active_o=
bjs
>     143.50            -0.5%     142.83        slabinfo.kmalloc-8.active_s=
labs
>      73472            -0.5%      73130        slabinfo.kmalloc-8.num_objs
>     143.50            -0.5%     142.83        slabinfo.kmalloc-8.num_slabs
>       1319            +0.2%       1321        slabinfo.kmalloc-8k.active_=
objs
>     336.83            +0.1%     337.33        slabinfo.kmalloc-8k.active_=
slabs
>       1349            +0.1%       1351        slabinfo.kmalloc-8k.num_objs
>     336.83            +0.1%     337.33        slabinfo.kmalloc-8k.num_sla=
bs
>       9904 =C2=B1  2%      -0.4%       9862 =C2=B1  2%  slabinfo.kmalloc-=
96.active_objs
>     236.83 =C2=B1  2%      -0.4%     235.83 =C2=B1  2%  slabinfo.kmalloc-=
96.active_slabs
>       9971 =C2=B1  2%      -0.4%       9933 =C2=B1  2%  slabinfo.kmalloc-=
96.num_objs
>     236.83 =C2=B1  2%      -0.4%     235.83 =C2=B1  2%  slabinfo.kmalloc-=
96.num_slabs
>     426.67 =C2=B1 11%     -20.0%     341.33 =C2=B1  8%  slabinfo.kmalloc-=
cg-128.active_objs
>       6.67 =C2=B1 11%     -20.0%       5.33 =C2=B1  8%  slabinfo.kmalloc-=
cg-128.active_slabs
>     426.67 =C2=B1 11%     -20.0%     341.33 =C2=B1  8%  slabinfo.kmalloc-=
cg-128.num_objs
>       6.67 =C2=B1 11%     -20.0%       5.33 =C2=B1  8%  slabinfo.kmalloc-=
cg-128.num_slabs
>       2507 =C2=B1 10%     +11.2%       2787 =C2=B1  4%  slabinfo.kmalloc-=
cg-16.active_objs
>       9.50 =C2=B1 10%     +12.3%      10.67 =C2=B1  4%  slabinfo.kmalloc-=
cg-16.active_slabs
>       2507 =C2=B1 10%     +11.2%       2787 =C2=B1  4%  slabinfo.kmalloc-=
cg-16.num_objs
>       9.50 =C2=B1 10%     +12.3%      10.67 =C2=B1  4%  slabinfo.kmalloc-=
cg-16.num_slabs
>       4020 =C2=B1 10%      -3.9%       3864 =C2=B1 11%  slabinfo.kmalloc-=
cg-192.active_objs
>      95.17 =C2=B1 11%      -3.9%      91.50 =C2=B1 11%  slabinfo.kmalloc-=
cg-192.active_slabs
>       4020 =C2=B1 10%      -3.9%       3864 =C2=B1 11%  slabinfo.kmalloc-=
cg-192.num_objs
>      95.17 =C2=B1 11%      -3.9%      91.50 =C2=B1 11%  slabinfo.kmalloc-=
cg-192.num_slabs
>       3421 =C2=B1 11%      -4.3%       3276 =C2=B1 12%  slabinfo.kmalloc-=
cg-1k.active_objs
>     106.33 =C2=B1 11%      -4.2%     101.83 =C2=B1 12%  slabinfo.kmalloc-=
cg-1k.active_slabs
>       3421 =C2=B1 11%      -4.3%       3276 =C2=B1 12%  slabinfo.kmalloc-=
cg-1k.num_objs
>     106.33 =C2=B1 11%      -4.2%     101.83 =C2=B1 12%  slabinfo.kmalloc-=
cg-1k.num_slabs
>     331.00 =C2=B1 16%      +5.0%     347.50 =C2=B1  9%  slabinfo.kmalloc-=
cg-256.active_objs
>       4.50 =C2=B1 21%     +11.1%       5.00 =C2=B1 11%  slabinfo.kmalloc-=
cg-256.active_slabs
>     331.00 =C2=B1 16%      +5.0%     347.50 =C2=B1  9%  slabinfo.kmalloc-=
cg-256.num_objs
>       4.50 =C2=B1 21%     +11.1%       5.00 =C2=B1 11%  slabinfo.kmalloc-=
cg-256.num_slabs
>     393.33 =C2=B1  9%      +1.2%     398.00 =C2=B1  7%  slabinfo.kmalloc-=
cg-2k.active_objs
>      23.83 =C2=B1 10%      +0.7%      24.00 =C2=B1  7%  slabinfo.kmalloc-=
cg-2k.active_slabs
>     393.33 =C2=B1  9%      +1.2%     398.00 =C2=B1  7%  slabinfo.kmalloc-=
cg-2k.num_objs
>      23.83 =C2=B1 10%      +0.7%      24.00 =C2=B1  7%  slabinfo.kmalloc-=
cg-2k.num_slabs
>      13310 =C2=B1  8%      -4.1%      12768 =C2=B1 12%  slabinfo.kmalloc-=
cg-32.active_objs
>     103.50 =C2=B1  8%      -4.2%      99.17 =C2=B1 11%  slabinfo.kmalloc-=
cg-32.active_slabs
>      13310 =C2=B1  8%      -4.1%      12768 =C2=B1 12%  slabinfo.kmalloc-=
cg-32.num_objs
>     103.50 =C2=B1  8%      -4.2%      99.17 =C2=B1 11%  slabinfo.kmalloc-=
cg-32.num_slabs
>       1024            +0.0%       1024        slabinfo.kmalloc-cg-4k.acti=
ve_objs
>     128.00            +0.0%     128.00        slabinfo.kmalloc-cg-4k.acti=
ve_slabs
>       1024            +0.0%       1024        slabinfo.kmalloc-cg-4k.num_=
objs
>     128.00            +0.0%     128.00        slabinfo.kmalloc-cg-4k.num_=
slabs
>       8181            +0.0%       8181        slabinfo.kmalloc-cg-512.act=
ive_objs
>     127.83            +0.0%     127.83        slabinfo.kmalloc-cg-512.act=
ive_slabs
>       8181            +0.0%       8181        slabinfo.kmalloc-cg-512.num=
_objs
>     127.83            +0.0%     127.83        slabinfo.kmalloc-cg-512.num=
_slabs
>       3150 =C2=B1  6%      -8.7%       2876 =C2=B1  9%  slabinfo.kmalloc-=
cg-64.active_objs
>      48.67 =C2=B1  6%      -8.6%      44.50 =C2=B1  9%  slabinfo.kmalloc-=
cg-64.active_slabs
>       3150 =C2=B1  6%      -8.7%       2876 =C2=B1  9%  slabinfo.kmalloc-=
cg-64.num_objs
>      48.67 =C2=B1  6%      -8.6%      44.50 =C2=B1  9%  slabinfo.kmalloc-=
cg-64.num_slabs
>      65928            -0.2%      65773        slabinfo.kmalloc-cg-8.activ=
e_objs
>     128.67            -0.3%     128.33        slabinfo.kmalloc-cg-8.activ=
e_slabs
>      65928            -0.2%      65773        slabinfo.kmalloc-cg-8.num_o=
bjs
>     128.67            -0.3%     128.33        slabinfo.kmalloc-cg-8.num_s=
labs
>      34.33 =C2=B1  4%      +0.0%      34.33 =C2=B1  4%  slabinfo.kmalloc-=
cg-8k.active_objs
>       7.83 =C2=B1  4%      +0.0%       7.83 =C2=B1  4%  slabinfo.kmalloc-=
cg-8k.active_slabs
>      34.33 =C2=B1  4%      +0.0%      34.33 =C2=B1  4%  slabinfo.kmalloc-=
cg-8k.num_objs
>       7.83 =C2=B1  4%      +0.0%       7.83 =C2=B1  4%  slabinfo.kmalloc-=
cg-8k.num_slabs
>     502.00 =C2=B1 11%      -2.8%     488.17 =C2=B1  9%  slabinfo.kmalloc-=
cg-96.active_objs
>      11.00 =C2=B1 12%      -3.0%      10.67 =C2=B1 10%  slabinfo.kmalloc-=
cg-96.active_slabs
>     502.00 =C2=B1 11%      -2.8%     488.17 =C2=B1  9%  slabinfo.kmalloc-=
cg-96.num_objs
>      11.00 =C2=B1 12%      -3.0%      10.67 =C2=B1 10%  slabinfo.kmalloc-=
cg-96.num_slabs
>     970.67 =C2=B1 12%     -26.4%     714.67 =C2=B1  9%  slabinfo.kmalloc-=
rcl-128.active_objs
>      15.33 =C2=B1 11%     -19.6%      12.33 =C2=B1  7%  slabinfo.kmalloc-=
rcl-128.active_slabs
>     981.33 =C2=B1 11%     -19.6%     789.33 =C2=B1  7%  slabinfo.kmalloc-=
rcl-128.num_objs
>      15.33 =C2=B1 11%     -19.6%      12.33 =C2=B1  7%  slabinfo.kmalloc-=
rcl-128.num_slabs
>      42.00            +0.0%      42.00        slabinfo.kmalloc-rcl-192.ac=
tive_objs
>       1.00            +0.0%       1.00        slabinfo.kmalloc-rcl-192.ac=
tive_slabs
>      42.00            +0.0%      42.00        slabinfo.kmalloc-rcl-192.nu=
m_objs
>       1.00            +0.0%       1.00        slabinfo.kmalloc-rcl-192.nu=
m_slabs
>      10779 =C2=B1  3%      -8.3%       9880 =C2=B1  5%  slabinfo.kmalloc-=
rcl-64.active_objs
>     167.67 =C2=B1  4%      -8.3%     153.83 =C2=B1  5%  slabinfo.kmalloc-=
rcl-64.active_slabs
>      10780 =C2=B1  3%      -8.3%       9880 =C2=B1  5%  slabinfo.kmalloc-=
rcl-64.num_objs
>     167.67 =C2=B1  4%      -8.3%     153.83 =C2=B1  5%  slabinfo.kmalloc-=
rcl-64.num_slabs
>       2420 =C2=B1  4%      -8.9%       2205 =C2=B1  7%  slabinfo.kmalloc-=
rcl-96.active_objs
>      57.50 =C2=B1  4%      -8.7%      52.50 =C2=B1  7%  slabinfo.kmalloc-=
rcl-96.active_slabs
>       2420 =C2=B1  4%      -8.9%       2205 =C2=B1  7%  slabinfo.kmalloc-=
rcl-96.num_objs
>      57.50 =C2=B1  4%      -8.7%      52.50 =C2=B1  7%  slabinfo.kmalloc-=
rcl-96.num_slabs
>     650.67 =C2=B1 10%      -8.2%     597.33 =C2=B1  7%  slabinfo.kmem_cac=
he.active_objs
>      10.17 =C2=B1 10%      -8.2%       9.33 =C2=B1  7%  slabinfo.kmem_cac=
he.active_slabs
>     650.67 =C2=B1 10%      -8.2%     597.33 =C2=B1  7%  slabinfo.kmem_cac=
he.num_objs
>      10.17 =C2=B1 10%      -8.2%       9.33 =C2=B1  7%  slabinfo.kmem_cac=
he.num_slabs
>     832.67 =C2=B1  8%      -5.0%     791.33 =C2=B1  6%  slabinfo.kmem_cac=
he_node.active_objs
>      13.17 =C2=B1  8%      +1.3%      13.33 =C2=B1  5%  slabinfo.kmem_cac=
he_node.active_slabs
>     842.67 =C2=B1  8%      +1.3%     853.33 =C2=B1  5%  slabinfo.kmem_cac=
he_node.num_objs
>      13.17 =C2=B1  8%      +1.3%      13.33 =C2=B1  5%  slabinfo.kmem_cac=
he_node.num_slabs
>      24005            -0.3%      23943        slabinfo.lsm_file_cache.act=
ive_objs
>     143.17            -0.2%     142.83        slabinfo.lsm_file_cache.act=
ive_slabs
>      24438            -0.2%      24399        slabinfo.lsm_file_cache.num=
_objs
>     143.17            -0.2%     142.83        slabinfo.lsm_file_cache.num=
_slabs
>       3718 =C2=B1  6%      -0.7%       3691 =C2=B1  5%  slabinfo.mm_struc=
t.active_objs
>     123.50 =C2=B1  6%      -0.9%     122.33 =C2=B1  5%  slabinfo.mm_struc=
t.active_slabs
>       3718 =C2=B1  6%      -0.7%       3691 =C2=B1  5%  slabinfo.mm_struc=
t.num_objs
>     123.50 =C2=B1  6%      -0.9%     122.33 =C2=B1  5%  slabinfo.mm_struc=
t.num_slabs
>     840.50 =C2=B1  8%      +3.1%     866.33 =C2=B1  4%  slabinfo.mnt_cach=
e.active_objs
>      15.50 =C2=B1  8%      +5.4%      16.33 =C2=B1  5%  slabinfo.mnt_cach=
e.active_slabs
>     840.50 =C2=B1  8%      +3.1%     866.33 =C2=B1  4%  slabinfo.mnt_cach=
e.num_objs
>      15.50 =C2=B1  8%      +5.4%      16.33 =C2=B1  5%  slabinfo.mnt_cach=
e.num_slabs
>      34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache=
.active_objs
>       1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache=
.active_slabs
>      34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache=
.num_objs
>       1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache=
.num_slabs
>       1025            +0.0%       1025        slabinfo.names_cache.active=
_objs
>     128.17            +0.0%     128.17        slabinfo.names_cache.active=
_slabs
>       1025            +0.0%       1025        slabinfo.names_cache.num_ob=
js
>     128.17            +0.0%     128.17        slabinfo.names_cache.num_sl=
abs
>      34.00            +0.0%      34.00        slabinfo.nfs_read_data.acti=
ve_objs
>       1.00            +0.0%       1.00        slabinfo.nfs_read_data.acti=
ve_slabs
>      34.00            +0.0%      34.00        slabinfo.nfs_read_data.num_=
objs
>       1.00            +0.0%       1.00        slabinfo.nfs_read_data.num_=
slabs
>     203.00            +0.0%     203.00        slabinfo.nsproxy.active_objs
>       3.00            +0.0%       3.00        slabinfo.nsproxy.active_sla=
bs
>     203.00            +0.0%     203.00        slabinfo.nsproxy.num_objs
>       3.00            +0.0%       3.00        slabinfo.nsproxy.num_slabs
>     180.00            +0.0%     180.00        slabinfo.numa_policy.active=
_objs
>       3.00            +0.0%       3.00        slabinfo.numa_policy.active=
_slabs
>     180.00            +0.0%     180.00        slabinfo.numa_policy.num_ob=
js
>       3.00            +0.0%       3.00        slabinfo.numa_policy.num_sl=
abs
>      10515 =C2=B1  7%      -3.7%      10126 =C2=B1 10%  slabinfo.pde_open=
er.active_objs
>     102.67 =C2=B1  7%      -3.9%      98.67 =C2=B1 10%  slabinfo.pde_open=
er.active_slabs
>      10515 =C2=B1  7%      -3.7%      10126 =C2=B1 10%  slabinfo.pde_open=
er.num_objs
>     102.67 =C2=B1  7%      -3.9%      98.67 =C2=B1 10%  slabinfo.pde_open=
er.num_slabs
>       4949            +0.9%       4993        slabinfo.perf_event.active_=
objs
>     188.33            +0.5%     189.33        slabinfo.perf_event.active_=
slabs
>       5099            +0.6%       5129        slabinfo.perf_event.num_objs
>     188.33            +0.5%     189.33        slabinfo.perf_event.num_sla=
bs
>       9784 =C2=B1  2%      +1.5%       9929 =C2=B1  2%  slabinfo.pid.acti=
ve_objs
>     152.67 =C2=B1  2%      +1.0%     154.17 =C2=B1  2%  slabinfo.pid.acti=
ve_slabs
>       9826 =C2=B1  2%      +1.0%       9929 =C2=B1  2%  slabinfo.pid.num_=
objs
>     152.67 =C2=B1  2%      +1.0%     154.17 =C2=B1  2%  slabinfo.pid.num_=
slabs
>       2812 =C2=B1  5%      -0.6%       2794 =C2=B1 10%  slabinfo.pool_wor=
kqueue.active_objs
>      44.00 =C2=B1  5%      +3.0%      45.33 =C2=B1  9%  slabinfo.pool_wor=
kqueue.active_slabs
>       2832 =C2=B1  5%      +2.4%       2901 =C2=B1  9%  slabinfo.pool_wor=
kqueue.num_objs
>      44.00 =C2=B1  5%      +3.0%      45.33 =C2=B1  9%  slabinfo.pool_wor=
kqueue.num_slabs
>       4851            -1.0%       4802        slabinfo.proc_dir_entry.act=
ive_objs
>     115.50            -1.0%     114.33        slabinfo.proc_dir_entry.act=
ive_slabs
>       4851            -1.0%       4802        slabinfo.proc_dir_entry.num=
_objs
>     115.50            -1.0%     114.33        slabinfo.proc_dir_entry.num=
_slabs
>      17942            -0.2%      17914        slabinfo.proc_inode_cache.a=
ctive_objs
>     393.33            -0.2%     392.67        slabinfo.proc_inode_cache.a=
ctive_slabs
>      18122            -0.3%      18073        slabinfo.proc_inode_cache.n=
um_objs
>     393.33            -0.2%     392.67        slabinfo.proc_inode_cache.n=
um_slabs
>      35466            -0.5%      35299        slabinfo.radix_tree_node.ac=
tive_objs
>     634.67            -0.5%     631.67        slabinfo.radix_tree_node.ac=
tive_slabs
>      35587            -0.5%      35403        slabinfo.radix_tree_node.nu=
m_objs
>     634.67            -0.5%     631.67        slabinfo.radix_tree_node.nu=
m_slabs
>      72.00           -16.7%      60.00 =C2=B1 20%  slabinfo.request_queue=
.active_objs
>       3.00           -16.7%       2.50 =C2=B1 20%  slabinfo.request_queue=
.active_slabs
>      72.00           -16.7%      60.00 =C2=B1 20%  slabinfo.request_queue=
.num_objs
>       3.00           -16.7%       2.50 =C2=B1 20%  slabinfo.request_queue=
.num_slabs
>      46.00            +0.0%      46.00        slabinfo.rpc_inode_cache.ac=
tive_objs
>       1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.ac=
tive_slabs
>      46.00            +0.0%      46.00        slabinfo.rpc_inode_cache.nu=
m_objs
>       1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.nu=
m_slabs
>     448.00            +0.0%     448.00        slabinfo.scsi_sense_cache.a=
ctive_objs
>       7.00            +0.0%       7.00        slabinfo.scsi_sense_cache.a=
ctive_slabs
>     448.00            +0.0%     448.00        slabinfo.scsi_sense_cache.n=
um_objs
>       7.00            +0.0%       7.00        slabinfo.scsi_sense_cache.n=
um_slabs
>       8704            +0.0%       8704        slabinfo.seq_file.active_ob=
js
>     128.00            +0.0%     128.00        slabinfo.seq_file.active_sl=
abs
>       8704            +0.0%       8704        slabinfo.seq_file.num_objs
>     128.00            +0.0%     128.00        slabinfo.seq_file.num_slabs
>       5915 =C2=B1  5%      -7.2%       5490 =C2=B1  9%  slabinfo.shmem_in=
ode_cache.active_objs
>     137.00 =C2=B1  5%      -7.2%     127.17 =C2=B1  9%  slabinfo.shmem_in=
ode_cache.active_slabs
>       5915 =C2=B1  5%      -7.2%       5490 =C2=B1  9%  slabinfo.shmem_in=
ode_cache.num_objs
>     137.00 =C2=B1  5%      -7.2%     127.17 =C2=B1  9%  slabinfo.shmem_in=
ode_cache.num_slabs
>       2913 =C2=B1  4%      -2.1%       2853 =C2=B1  5%  slabinfo.sighand_=
cache.active_objs
>     193.83 =C2=B1  5%      -2.1%     189.67 =C2=B1  5%  slabinfo.sighand_=
cache.active_slabs
>       2913 =C2=B1  5%      -2.1%       2853 =C2=B1  5%  slabinfo.sighand_=
cache.num_objs
>     193.83 =C2=B1  5%      -2.1%     189.67 =C2=B1  5%  slabinfo.sighand_=
cache.num_slabs
>       5114 =C2=B1  7%      -0.9%       5068 =C2=B1  7%  slabinfo.signal_c=
ache.active_objs
>     183.17 =C2=B1  7%      -0.5%     182.17 =C2=B1  6%  slabinfo.signal_c=
ache.active_slabs
>       5143 =C2=B1  7%      -0.6%       5113 =C2=B1  6%  slabinfo.signal_c=
ache.num_objs
>     183.17 =C2=B1  7%      -0.5%     182.17 =C2=B1  6%  slabinfo.signal_c=
ache.num_slabs
>       6331 =C2=B1  3%      +2.0%       6460 =C2=B1  2%  slabinfo.sigqueue=
.active_objs
>     123.50 =C2=B1  3%      +2.2%     126.17 =C2=B1  2%  slabinfo.sigqueue=
.active_slabs
>       6331 =C2=B1  3%      +2.0%       6460 =C2=B1  2%  slabinfo.sigqueue=
.num_objs
>     123.50 =C2=B1  3%      +2.2%     126.17 =C2=B1  2%  slabinfo.sigqueue=
.num_slabs
>     128.00            +0.0%     128.00        slabinfo.skbuff_fclone_cach=
e.active_objs
>       2.00            +0.0%       2.00        slabinfo.skbuff_fclone_cach=
e.active_slabs
>     128.00            +0.0%     128.00        slabinfo.skbuff_fclone_cach=
e.num_objs
>       2.00            +0.0%       2.00        slabinfo.skbuff_fclone_cach=
e.num_slabs
>       9205 =C2=B1  2%      +1.4%       9333 =C2=B1  2%  slabinfo.skbuff_h=
ead_cache.active_objs
>     143.83 =C2=B1  2%      +1.3%     145.67 =C2=B1  2%  slabinfo.skbuff_h=
ead_cache.active_slabs
>       9205 =C2=B1  2%      +1.4%       9333 =C2=B1  2%  slabinfo.skbuff_h=
ead_cache.num_objs
>     143.83 =C2=B1  2%      +1.3%     145.67 =C2=B1  2%  slabinfo.skbuff_h=
ead_cache.num_slabs
>       3889 =C2=B1 10%      -5.6%       3671 =C2=B1 14%  slabinfo.sock_ino=
de_cache.active_objs
>      99.17 =C2=B1 11%      -5.7%      93.50 =C2=B1 14%  slabinfo.sock_ino=
de_cache.active_slabs
>       3889 =C2=B1 10%      -5.6%       3671 =C2=B1 14%  slabinfo.sock_ino=
de_cache.num_objs
>      99.17 =C2=B1 11%      -5.7%      93.50 =C2=B1 14%  slabinfo.sock_ino=
de_cache.num_slabs
>       1339 =C2=B1  7%      +2.3%       1369 =C2=B1  7%  slabinfo.task_gro=
up.active_objs
>      28.50 =C2=B1  7%      +2.3%      29.17 =C2=B1  8%  slabinfo.task_gro=
up.active_slabs
>       1339 =C2=B1  7%      +2.3%       1369 =C2=B1  7%  slabinfo.task_gro=
up.num_objs
>      28.50 =C2=B1  7%      +2.3%      29.17 =C2=B1  8%  slabinfo.task_gro=
up.num_slabs
>       2126 =C2=B1  4%      -0.8%       2109 =C2=B1  2%  slabinfo.task_str=
uct.active_objs
>       2129 =C2=B1  4%      -0.8%       2111 =C2=B1  2%  slabinfo.task_str=
uct.active_slabs
>       2129 =C2=B1  4%      -0.8%       2111 =C2=B1  2%  slabinfo.task_str=
uct.num_objs
>       2129 =C2=B1  4%      -0.8%       2111 =C2=B1  2%  slabinfo.task_str=
uct.num_slabs
>     306.33 =C2=B1  5%      -3.3%     296.33 =C2=B1  7%  slabinfo.taskstat=
s.active_objs
>       6.67 =C2=B1  7%      -2.5%       6.50 =C2=B1  7%  slabinfo.taskstat=
s.active_slabs
>     306.33 =C2=B1  5%      -3.3%     296.33 =C2=B1  7%  slabinfo.taskstat=
s.num_objs
>       6.67 =C2=B1  7%      -2.5%       6.50 =C2=B1  7%  slabinfo.taskstat=
s.num_slabs
>       2627           +21.1%       3181        slabinfo.trace_event_file.a=
ctive_objs
>      57.00           +21.3%      69.17        slabinfo.trace_event_file.a=
ctive_slabs
>       2627           +21.1%       3181        slabinfo.trace_event_file.n=
um_objs
>      57.00           +21.3%      69.17        slabinfo.trace_event_file.n=
um_slabs
>      66.00            +0.0%      66.00        slabinfo.tw_sock_TCP.active=
_objs
>       1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.active=
_slabs
>      66.00            +0.0%      66.00        slabinfo.tw_sock_TCP.num_ob=
js
>       1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.num_sl=
abs
>      23288 =C2=B1  4%      +1.5%      23645 =C2=B1  3%  slabinfo.vm_area_=
struct.active_objs
>     585.50 =C2=B1  4%      +1.6%     594.67 =C2=B1  2%  slabinfo.vm_area_=
struct.active_slabs
>      23446 =C2=B1  4%      +1.5%      23804 =C2=B1  2%  slabinfo.vm_area_=
struct.num_objs
>     585.50 =C2=B1  4%      +1.6%     594.67 =C2=B1  2%  slabinfo.vm_area_=
struct.num_slabs
>      21187            -0.4%      21098        slabinfo.vmap_area.active_o=
bjs
>     330.83            -0.6%     329.00        slabinfo.vmap_area.active_s=
labs
>      21192            -0.4%      21101        slabinfo.vmap_area.num_objs
>     330.83            -0.6%     329.00        slabinfo.vmap_area.num_slabs
>      42.00            +0.0%      42.00        slabinfo.xfrm_state.active_=
objs
>       1.00            +0.0%       1.00        slabinfo.xfrm_state.active_=
slabs
>      42.00            +0.0%      42.00        slabinfo.xfrm_state.num_objs
>       1.00            +0.0%       1.00        slabinfo.xfrm_state.num_sla=
bs
>       0.00       +1.9e+104%     189.00 =C2=B1 11%  slabinfo.xfs_buf.activ=
e_objs
>       0.00       +4.5e+102%       4.50 =C2=B1 11%  slabinfo.xfs_buf.activ=
e_slabs
>       0.00       +1.9e+104%     189.00 =C2=B1 11%  slabinfo.xfs_buf.num_o=
bjs
>       0.00       +4.5e+102%       4.50 =C2=B1 11%  slabinfo.xfs_buf.num_s=
labs
>       0.00       +6.2e+103%      62.00        slabinfo.xfs_buf_item.activ=
e_objs
>       0.00         +1e+102%       1.00        slabinfo.xfs_buf_item.activ=
e_slabs
>       0.00       +6.2e+103%      62.00        slabinfo.xfs_buf_item.num_o=
bjs
>       0.00         +1e+102%       1.00        slabinfo.xfs_buf_item.num_s=
labs
>       0.00         +1e+104%     102.00        slabinfo.xfs_inode.active_o=
bjs
>       0.00         +3e+102%       3.00        slabinfo.xfs_inode.active_s=
labs
>       0.00         +1e+104%     102.00        slabinfo.xfs_inode.num_objs
>       0.00         +3e+102%       3.00        slabinfo.xfs_inode.num_slabs
>     524.00            +0.0%     524.00        softirqs.BLOCK
>       1.00            +0.0%       1.00        softirqs.CPU0.HI
>      27198 =C2=B1  3%     -20.1%      21721 =C2=B1  6%  softirqs.CPU0.RCU
>      37346 =C2=B1  5%     -11.1%      33202 =C2=B1 15%  softirqs.CPU0.SCH=
ED
>     113.67            +0.0%     113.67        softirqs.CPU0.TASKLET
>       2149 =C2=B1 36%      +1.7%       2185 =C2=B1 35%  softirqs.CPU0.TIM=
ER
>     162.33 =C2=B1  2%      +3.3%     167.67 =C2=B1 11%  softirqs.CPU1.NET=
_RX
>       0.50 =C2=B1152%     +66.7%       0.83 =C2=B1128%  softirqs.CPU1.NET=
_TX
>      27372 =C2=B1  4%     -20.4%      21775 =C2=B1  8%  softirqs.CPU1.RCU
>      21507 =C2=B1  6%      +7.0%      23002 =C2=B1  8%  softirqs.CPU1.SCH=
ED
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1223%  softirqs.CPU1.TAS=
KLET
>     208.00 =C2=B1 41%    +501.3%       1250 =C2=B1137%  softirqs.CPU1.TIM=
ER
>     163.00            -1.4%     160.67        softirqs.CPU10.NET_RX
>       0.67 =C2=B1 70%     -25.0%       0.50 =C2=B1152%  softirqs.CPU10.NE=
T_TX
>      26175 =C2=B1  8%     -16.1%      21959 =C2=B1  9%  softirqs.CPU10.RCU
>      23759 =C2=B1 24%     -18.7%      19318 =C2=B1 15%  softirqs.CPU10.SC=
HED
>     137.00 =C2=B1 19%    +615.1%     979.67 =C2=B1151%  softirqs.CPU10.TI=
MER
>      17967 =C2=B1  5%      +1.9%      18317 =C2=B1  8%  softirqs.CPU100.R=
CU
>      39181 =C2=B1  3%      -6.6%      36593 =C2=B1 12%  softirqs.CPU100.S=
CHED
>       1.50 =C2=B1223%    -100.0%       0.00        softirqs.CPU100.TASKLET
>      67.00 =C2=B1 65%   +1298.5%     937.00 =C2=B1199%  softirqs.CPU100.T=
IMER
>      20363 =C2=B1 11%     -10.6%      18205 =C2=B1  8%  softirqs.CPU101.R=
CU
>      37414 =C2=B1 14%      -3.1%      36250 =C2=B1 12%  softirqs.CPU101.S=
CHED
>       0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  softirqs.CPU101.T=
ASKLET
>      45.67 =C2=B1 83%   +1110.2%     552.67 =C2=B1179%  softirqs.CPU101.T=
IMER
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU102.NET_TX
>      20423 =C2=B1  7%     -20.0%      16340 =C2=B1 11%  softirqs.CPU102.R=
CU
>      37949 =C2=B1  7%      -9.1%      34509 =C2=B1 18%  softirqs.CPU102.S=
CHED
>     776.83 =C2=B1210%     -61.3%     300.67 =C2=B1160%  softirqs.CPU102.T=
IMER
>      18531 =C2=B1 21%      -1.2%      18314 =C2=B1  9%  softirqs.CPU103.R=
CU
>      36206 =C2=B1 22%      +4.0%      37666 =C2=B1  7%  softirqs.CPU103.S=
CHED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU103.TASKLET
>       5477 =C2=B1221%     -91.6%     458.00 =C2=B1188%  softirqs.CPU103.T=
IMER
>      17931 =C2=B1  7%      -2.5%      17482 =C2=B1 11%  softirqs.CPU104.R=
CU
>      36377 =C2=B1 11%      +0.2%      36459 =C2=B1 15%  softirqs.CPU104.S=
CHED
>       1.17 =C2=B1159%    -100.0%       0.00        softirqs.CPU104.TASKLET
>      66.17 =C2=B1 79%     +26.4%      83.67 =C2=B1 70%  softirqs.CPU104.T=
IMER
>      19502 =C2=B1  8%      -7.7%      18002 =C2=B1  8%  softirqs.CPU105.R=
CU
>      39290 =C2=B1  4%      -8.7%      35858 =C2=B1 16%  softirqs.CPU105.S=
CHED
>       0.50 =C2=B1223%    -100.0%       0.00        softirqs.CPU105.TASKLET
>      45.33 =C2=B1115%    +850.0%     430.67 =C2=B1163%  softirqs.CPU105.T=
IMER
>      19548 =C2=B1  6%      -2.5%      19068 =C2=B1  8%  softirqs.CPU106.R=
CU
>      37793 =C2=B1  8%      +3.0%      38939 =C2=B1  5%  softirqs.CPU106.S=
CHED
>       0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  softirqs.CPU106.T=
ASKLET
>     401.83 =C2=B1217%     -74.3%     103.33 =C2=B1102%  softirqs.CPU106.T=
IMER
>      19720 =C2=B1  8%      -8.9%      17958 =C2=B1  8%  softirqs.CPU107.R=
CU
>      37971 =C2=B1 13%      +1.1%      38395 =C2=B1  5%  softirqs.CPU107.S=
CHED
>       0.50 =C2=B1152%     -66.7%       0.17 =C2=B1223%  softirqs.CPU107.T=
ASKLET
>      42.67 =C2=B1110%    +220.7%     136.83 =C2=B1 84%  softirqs.CPU107.T=
IMER
>      18731 =C2=B1  7%      +2.8%      19262 =C2=B1  8%  softirqs.CPU108.R=
CU
>      39767 =C2=B1  5%      -2.8%      38670 =C2=B1  6%  softirqs.CPU108.S=
CHED
>       0.33 =C2=B1141%      +0.0%       0.33 =C2=B1223%  softirqs.CPU108.T=
ASKLET
>      52.83 =C2=B1109%    +140.1%     126.83 =C2=B1107%  softirqs.CPU108.T=
IMER
>      20189 =C2=B1  7%     -21.9%      15763 =C2=B1 12%  softirqs.CPU109.R=
CU
>      39375 =C2=B1  5%     -10.5%      35223 =C2=B1 16%  softirqs.CPU109.S=
CHED
>       0.33 =C2=B1223%    -100.0%       0.00        softirqs.CPU109.TASKLET
>     119.67 =C2=B1121%     -43.9%      67.17 =C2=B1102%  softirqs.CPU109.T=
IMER
>     161.83            +1.2%     163.83 =C2=B1  6%  softirqs.CPU11.NET_RX
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1223%  softirqs.CPU11.NE=
T_TX
>      26827 =C2=B1  4%     -19.6%      21556 =C2=B1  8%  softirqs.CPU11.RCU
>      21021 =C2=B1  8%     -10.2%      18883 =C2=B1 10%  softirqs.CPU11.SC=
HED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU11.TASKLET
>     155.50 =C2=B1 16%      -0.4%     154.83 =C2=B1  9%  softirqs.CPU11.TI=
MER
>      20384 =C2=B1  9%     -22.5%      15801 =C2=B1 13%  softirqs.CPU110.R=
CU
>      39653 =C2=B1  4%      -4.8%      37742 =C2=B1  7%  softirqs.CPU110.S=
CHED
>       0.67 =C2=B1165%    -100.0%       0.00        softirqs.CPU110.TASKLET
>     847.83 =C2=B1216%     -95.1%      41.33 =C2=B1131%  softirqs.CPU110.T=
IMER
>      19325 =C2=B1  8%     -14.4%      16549 =C2=B1  9%  softirqs.CPU111.R=
CU
>      39957 =C2=B1  2%      -7.4%      36986 =C2=B1  7%  softirqs.CPU111.S=
CHED
>       0.83 =C2=B1145%      +0.0%       0.83 =C2=B1223%  softirqs.CPU111.T=
ASKLET
>      34.83 =C2=B1116%    +244.5%     120.00 =C2=B1203%  softirqs.CPU111.T=
IMER
>      20133 =C2=B1  7%     -31.5%      13782 =C2=B1 12%  softirqs.CPU112.R=
CU
>      36319 =C2=B1 18%      -3.0%      35231 =C2=B1 16%  softirqs.CPU112.S=
CHED
>       0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%  softirqs.CPU112.T=
ASKLET
>     102.83 =C2=B1114%    +699.5%     822.17 =C2=B1220%  softirqs.CPU112.T=
IMER
>      20905 =C2=B1 11%     -15.3%      17703 =C2=B1  9%  softirqs.CPU113.R=
CU
>      34457 =C2=B1 21%     +10.7%      38129 =C2=B1  5%  softirqs.CPU113.S=
CHED
>       0.67 =C2=B1165%    -100.0%       0.00        softirqs.CPU113.TASKLET
>      48.17 =C2=B1107%     -19.7%      38.67 =C2=B1140%  softirqs.CPU113.T=
IMER
>      20646 =C2=B1  8%     -11.0%      18370 =C2=B1  8%  softirqs.CPU114.R=
CU
>      38312 =C2=B1 12%     -11.2%      34014 =C2=B1 30%  softirqs.CPU114.S=
CHED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU114.TASKLET
>      53.00 =C2=B1 97%    +195.3%     156.50 =C2=B1152%  softirqs.CPU114.T=
IMER
>       0.00          -100.0%       0.00        softirqs.CPU115.NET_TX
>      19639 =C2=B1  6%      -5.2%      18624 =C2=B1  8%  softirqs.CPU115.R=
CU
>      38071 =C2=B1  7%      +2.0%      38827 =C2=B1  5%  softirqs.CPU115.S=
CHED
>       2.67 =C2=B1190%    -100.0%       0.00        softirqs.CPU115.TASKLET
>     293.00 =C2=B1208%     -19.3%     236.50 =C2=B1169%  softirqs.CPU115.T=
IMER
>      21371 =C2=B1 14%      -6.2%      20037 =C2=B1  6%  softirqs.CPU116.R=
CU
>      40088 =C2=B1  5%     -11.9%      35311 =C2=B1 13%  softirqs.CPU116.S=
CHED
>       2.00 =C2=B1202%    -100.0%       0.00        softirqs.CPU116.TASKLET
>     959.50 =C2=B1 93%     -96.0%      38.67 =C2=B1117%  softirqs.CPU116.T=
IMER
>      20875 =C2=B1  8%     -26.0%      15456 =C2=B1 11%  softirqs.CPU117.R=
CU
>      40444 =C2=B1  2%      -6.5%      37832 =C2=B1  6%  softirqs.CPU117.S=
CHED
>       1.83 =C2=B1223%    -100.0%       0.00        softirqs.CPU117.TASKLET
>     268.83 =C2=B1167%     -78.4%      58.17 =C2=B1128%  softirqs.CPU117.T=
IMER
>      20618 =C2=B1  8%      +1.8%      20997 =C2=B1  8%  softirqs.CPU118.R=
CU
>      40360           -14.1%      34655 =C2=B1 24%  softirqs.CPU118.SCHED
>       0.17 =C2=B1223%    +400.0%       0.83 =C2=B1128%  softirqs.CPU118.T=
ASKLET
>     144.00 =C2=B1126%     -50.2%      71.67 =C2=B1 78%  softirqs.CPU118.T=
IMER
>      19859 =C2=B1  8%      -1.2%      19612 =C2=B1  8%  softirqs.CPU119.R=
CU
>      40218            -7.0%      37420 =C2=B1  7%  softirqs.CPU119.SCHED
>       2.00 =C2=B1223%     -91.7%       0.17 =C2=B1223%  softirqs.CPU119.T=
ASKLET
>     654.00 =C2=B1197%     -92.0%      52.00 =C2=B1130%  softirqs.CPU119.T=
IMER
>     160.83            -0.3%     160.33        softirqs.CPU12.NET_RX
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU12.NET_TX
>      27053 =C2=B1  6%     -15.9%      22740 =C2=B1 14%  softirqs.CPU12.RCU
>      20613 =C2=B1  6%      -6.2%      19336 =C2=B1 10%  softirqs.CPU12.SC=
HED
>       0.50 =C2=B1223%    -100.0%       0.00        softirqs.CPU12.TASKLET
>     178.00 =C2=B1 19%    +157.8%     458.83 =C2=B1143%  softirqs.CPU12.TI=
MER
>      20576 =C2=B1  8%      +1.1%      20796 =C2=B1 10%  softirqs.CPU120.R=
CU
>      39973 =C2=B1  5%     -13.0%      34760 =C2=B1 17%  softirqs.CPU120.S=
CHED
>       0.17 =C2=B1223%    +200.0%       0.50 =C2=B1152%  softirqs.CPU120.T=
ASKLET
>      75.17 =C2=B1 83%     +38.4%     104.00 =C2=B1118%  softirqs.CPU120.T=
IMER
>      20494 =C2=B1  8%      -0.7%      20354 =C2=B1 10%  softirqs.CPU121.R=
CU
>      39775 =C2=B1  5%      -8.2%      36510 =C2=B1 10%  softirqs.CPU121.S=
CHED
>       0.00         +3e+102%       3.00 =C2=B1209%  softirqs.CPU121.TASKLET
>     170.50 =C2=B1138%     -83.9%      27.50 =C2=B1132%  softirqs.CPU121.T=
IMER
>      20389 =C2=B1  8%      -7.1%      18946 =C2=B1  9%  softirqs.CPU122.R=
CU
>      39602 =C2=B1  4%      -2.7%      38523 =C2=B1  6%  softirqs.CPU122.S=
CHED
>       0.33 =C2=B1141%    +650.0%       2.50 =C2=B1223%  softirqs.CPU122.T=
ASKLET
>      63.17 =C2=B1 97%     -31.1%      43.50 =C2=B1117%  softirqs.CPU122.T=
IMER
>      21224 =C2=B1  5%      -8.9%      19333 =C2=B1 10%  softirqs.CPU123.R=
CU
>      39600 =C2=B1  4%      -3.7%      38152 =C2=B1  5%  softirqs.CPU123.S=
CHED
>       0.33 =C2=B1223%    +850.0%       3.17 =C2=B1223%  softirqs.CPU123.T=
ASKLET
>      27.83 =C2=B1 96%    +394.6%     137.67 =C2=B1 94%  softirqs.CPU123.T=
IMER
>      22435 =C2=B1  6%      -4.2%      21493 =C2=B1  8%  softirqs.CPU124.R=
CU
>      39328 =C2=B1  2%     -14.2%      33744 =C2=B1 23%  softirqs.CPU124.S=
CHED
>       0.00       +2.3e+102%       2.33 =C2=B1205%  softirqs.CPU124.TASKLET
>      60.00 =C2=B1116%     -27.5%      43.50 =C2=B1121%  softirqs.CPU124.T=
IMER
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU125.NET_TX
>      22172 =C2=B1  5%     -15.4%      18748 =C2=B1 12%  softirqs.CPU125.R=
CU
>      37524 =C2=B1  9%     -11.8%      33084 =C2=B1 24%  softirqs.CPU125.S=
CHED
>       0.00       +8.3e+101%       0.83 =C2=B1223%  softirqs.CPU125.TASKLET
>      19.17 =C2=B1109%   +2998.3%     593.83 =C2=B1207%  softirqs.CPU125.T=
IMER
>      20702 =C2=B1  7%     -11.9%      18231 =C2=B1  9%  softirqs.CPU126.R=
CU
>      39999 =C2=B1  4%      -4.4%      38231 =C2=B1  5%  softirqs.CPU126.S=
CHED
>       0.17 =C2=B1223%   +2100.0%       3.67 =C2=B1114%  softirqs.CPU126.T=
ASKLET
>      25.50 =C2=B1 53%    +215.0%      80.33 =C2=B1 74%  softirqs.CPU126.T=
IMER
>      24136 =C2=B1 12%     -17.1%      20011 =C2=B1  8%  softirqs.CPU127.R=
CU
>      19306 =C2=B1 21%      -1.5%      19019 =C2=B1 20%  softirqs.CPU127.S=
CHED
>     334.00 =C2=B1188%     -78.4%      72.17 =C2=B1 94%  softirqs.CPU127.T=
IMER
>     165.17 =C2=B1  5%      -2.7%     160.67        softirqs.CPU13.NET_RX
>       0.50 =C2=B1100%      +0.0%       0.50 =C2=B1152%  softirqs.CPU13.NE=
T_TX
>      27312 =C2=B1  4%     -17.7%      22476 =C2=B1 10%  softirqs.CPU13.RCU
>      21107 =C2=B1  6%     -10.3%      18926 =C2=B1 10%  softirqs.CPU13.SC=
HED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU13.TASKLET
>     520.67 =C2=B1160%     -69.3%     160.00 =C2=B1  7%  softirqs.CPU13.TI=
MER
>     172.17 =C2=B1  7%      -7.3%     159.67        softirqs.CPU14.NET_RX
>       0.83 =C2=B1 82%     -80.0%       0.17 =C2=B1223%  softirqs.CPU14.NE=
T_TX
>      26341 =C2=B1  3%     -17.7%      21669 =C2=B1  7%  softirqs.CPU14.RCU
>      20776 =C2=B1  9%      -9.9%      18727 =C2=B1  8%  softirqs.CPU14.SC=
HED
>       0.17 =C2=B1223%    +300.0%       0.67 =C2=B1223%  softirqs.CPU14.TA=
SKLET
>     145.00 =C2=B1  6%     +10.5%     160.17 =C2=B1 11%  softirqs.CPU14.TI=
MER
>     163.33            +0.1%     163.50 =C2=B1  5%  softirqs.CPU15.NET_RX
>       0.67 =C2=B1111%     -25.0%       0.50 =C2=B1152%  softirqs.CPU15.NE=
T_TX
>      26714 =C2=B1  4%     -16.8%      22218 =C2=B1  7%  softirqs.CPU15.RCU
>      20338 =C2=B1  7%      -6.5%      19007 =C2=B1  7%  softirqs.CPU15.SC=
HED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU15.TASKLET
>     251.67 =C2=B1 90%     -35.4%     162.67 =C2=B1  8%  softirqs.CPU15.TI=
MER
>     161.83 =C2=B1  2%      +3.1%     166.83 =C2=B1  8%  softirqs.CPU16.NE=
T_RX
>       0.50 =C2=B1100%     -33.3%       0.33 =C2=B1141%  softirqs.CPU16.NE=
T_TX
>      23817 =C2=B1  7%     -39.1%      14510 =C2=B1 24%  softirqs.CPU16.RCU
>      39478 =C2=B1  5%      -9.3%      35788 =C2=B1  7%  softirqs.CPU16.SC=
HED
>      69.67            -1.0%      69.00        softirqs.CPU16.TASKLET
>     118.67 =C2=B1 93%   +4002.9%       4868 =C2=B1202%  softirqs.CPU16.TI=
MER
>     161.00            -0.4%     160.33 =C2=B1  2%  softirqs.CPU17.NET_RX
>       0.00       +3.3e+101%       0.33 =C2=B1223%  softirqs.CPU17.NET_TX
>      23189 =C2=B1  8%     -29.9%      16254 =C2=B1 14%  softirqs.CPU17.RCU
>      39599 =C2=B1  4%      -6.8%      36919 =C2=B1  8%  softirqs.CPU17.SC=
HED
>       1.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU17.TASKLET
>      84.83 =C2=B1131%    +515.7%     522.33 =C2=B1138%  softirqs.CPU17.TI=
MER
>     162.17 =C2=B1  2%      -0.8%     160.83 =C2=B1  2%  softirqs.CPU18.NE=
T_RX
>       0.33 =C2=B1141%     +50.0%       0.50 =C2=B1100%  softirqs.CPU18.NE=
T_TX
>      24327 =C2=B1  6%     -22.9%      18745 =C2=B1 15%  softirqs.CPU18.RCU
>      39224 =C2=B1  5%      +0.9%      39564 =C2=B1 14%  softirqs.CPU18.SC=
HED
>       0.00       +1.3e+102%       1.33 =C2=B1223%  softirqs.CPU18.TASKLET
>      31.50 =C2=B1 43%    +984.7%     341.67 =C2=B1197%  softirqs.CPU18.TI=
MER
>     393.83 =C2=B1 26%     +95.0%     768.17 =C2=B1 98%  softirqs.CPU19.NE=
T_RX
>       2.17 =C2=B1 41%     +23.1%       2.67 =C2=B1 27%  softirqs.CPU19.NE=
T_TX
>      25287 =C2=B1  7%     -30.0%      17708 =C2=B1 17%  softirqs.CPU19.RCU
>      41603 =C2=B1  9%      -3.1%      40296 =C2=B1 18%  softirqs.CPU19.SC=
HED
>       0.00       +3.3e+101%       0.33 =C2=B1223%  softirqs.CPU19.TASKLET
>      38.67 =C2=B1 86%     +18.5%      45.83 =C2=B1 76%  softirqs.CPU19.TI=
MER
>     161.50 =C2=B1  2%      -1.1%     159.67        softirqs.CPU2.NET_RX
>       0.17 =C2=B1223%    +300.0%       0.67 =C2=B1111%  softirqs.CPU2.NET=
_TX
>      27180 =C2=B1  5%     -17.3%      22465 =C2=B1  6%  softirqs.CPU2.RCU
>      20508 =C2=B1  7%      -2.6%      19972 =C2=B1 11%  softirqs.CPU2.SCH=
ED
>       0.00       +6.7e+101%       0.67 =C2=B1165%  softirqs.CPU2.TASKLET
>     529.17 =C2=B1162%     +94.8%       1030 =C2=B1154%  softirqs.CPU2.TIM=
ER
>     220.00 =C2=B1 33%     +18.6%     261.00 =C2=B1 45%  softirqs.CPU20.NE=
T_RX
>       0.67 =C2=B1141%      +0.0%       0.67 =C2=B1165%  softirqs.CPU20.NE=
T_TX
>      25683 =C2=B1  7%     -31.3%      17643 =C2=B1 14%  softirqs.CPU20.RCU
>      40448 =C2=B1  5%     -11.4%      35822 =C2=B1 10%  softirqs.CPU20.SC=
HED
>       0.00       +6.7e+101%       0.67 =C2=B1111%  softirqs.CPU20.TASKLET
>      69.83 =C2=B1 58%     +96.7%     137.33 =C2=B1 99%  softirqs.CPU20.TI=
MER
>     247.00 =C2=B1 64%      -2.6%     240.67 =C2=B1 44%  softirqs.CPU21.NE=
T_RX
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%  softirqs.CPU21.NE=
T_TX
>      24903 =C2=B1  5%     -28.6%      17787 =C2=B1 15%  softirqs.CPU21.RCU
>      39697 =C2=B1  3%      +5.7%      41965 =C2=B1 38%  softirqs.CPU21.SC=
HED
>       2.00            +0.0%       2.00        softirqs.CPU21.TASKLET
>      32.83 =C2=B1 37%   +1209.6%     430.00 =C2=B1203%  softirqs.CPU21.TI=
MER
>     254.50 =C2=B1 29%    +220.0%     814.33 =C2=B1 87%  softirqs.CPU22.NE=
T_RX
>       0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%  softirqs.CPU22.NE=
T_TX
>      21321 =C2=B1 20%     -21.2%      16807 =C2=B1 12%  softirqs.CPU22.RCU
>      69595 =C2=B1 61%     -37.9%      43185 =C2=B1 44%  softirqs.CPU22.SC=
HED
>       2.00           -16.7%       1.67 =C2=B1 44%  softirqs.CPU22.TASKLET
>      70.67 =C2=B1 93%     +18.2%      83.50 =C2=B1107%  softirqs.CPU22.TI=
MER
>     244.50 =C2=B1 67%    +178.6%     681.17 =C2=B1156%  softirqs.CPU23.NE=
T_RX
>       0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%  softirqs.CPU23.NE=
T_TX
>      24787 =C2=B1  7%     -28.8%      17645 =C2=B1 11%  softirqs.CPU23.RCU
>      39821 =C2=B1  5%     -18.7%      32367 =C2=B1 29%  softirqs.CPU23.SC=
HED
>       2.50 =C2=B1 30%     -20.0%       2.00        softirqs.CPU23.TASKLET
>      95.83 =C2=B1130%     -31.5%      65.67 =C2=B1133%  softirqs.CPU23.TI=
MER
>       1381 =C2=B1190%     -86.3%     188.67 =C2=B1 22%  softirqs.CPU24.NE=
T_RX
>       0.33 =C2=B1141%      +0.0%       0.33 =C2=B1223%  softirqs.CPU24.NE=
T_TX
>      24893 =C2=B1  6%     -29.8%      17478 =C2=B1 13%  softirqs.CPU24.RCU
>      39673 =C2=B1  4%     -11.1%      35286 =C2=B1 22%  softirqs.CPU24.SC=
HED
>       2.00            +0.0%       2.00        softirqs.CPU24.TASKLET
>     152.67 =C2=B1193%     -74.8%      38.50 =C2=B1 80%  softirqs.CPU24.TI=
MER
>       1193 =C2=B1167%     -69.9%     359.00 =C2=B1 73%  softirqs.CPU25.NE=
T_RX
>       0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%  softirqs.CPU25.NE=
T_TX
>      24379 =C2=B1  9%     -30.9%      16844 =C2=B1 16%  softirqs.CPU25.RCU
>      42642 =C2=B1 10%      -8.9%      38848 =C2=B1 13%  softirqs.CPU25.SC=
HED
>       2.67 =C2=B1 55%     -12.5%       2.33 =C2=B1 31%  softirqs.CPU25.TA=
SKLET
>      88.00 =C2=B1104%     -48.1%      45.67 =C2=B1117%  softirqs.CPU25.TI=
MER
>       0.00       +1.3e+102%       1.33 =C2=B1223%  softirqs.CPU26.BLOCK
>       1172 =C2=B1129%     -85.5%     169.67 =C2=B1  6%  softirqs.CPU26.NE=
T_RX
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU26.NET_TX
>      26514 =C2=B1  8%     -34.1%      17482 =C2=B1 11%  softirqs.CPU26.RCU
>      40207 =C2=B1  6%      -0.1%      40167 =C2=B1 59%  softirqs.CPU26.SC=
HED
>       2.67 =C2=B1 55%     -25.0%       2.00        softirqs.CPU26.TASKLET
>     350.00 =C2=B1160%     -89.3%      37.50 =C2=B1106%  softirqs.CPU26.TI=
MER
>       0.00       +4.3e+103%      43.00 =C2=B1223%  softirqs.CPU27.BLOCK
>     231.50 =C2=B1 55%     +38.5%     320.67 =C2=B1 64%  softirqs.CPU27.NE=
T_RX
>       0.00       +3.3e+101%       0.33 =C2=B1223%  softirqs.CPU27.NET_TX
>      24578 =C2=B1  5%     -27.5%      17830 =C2=B1 11%  softirqs.CPU27.RCU
>      39442 =C2=B1  4%      -8.2%      36200 =C2=B1 30%  softirqs.CPU27.SC=
HED
>       2.00            -8.3%       1.83 =C2=B1 20%  softirqs.CPU27.TASKLET
>     501.33 =C2=B1185%     -87.9%      60.67 =C2=B1128%  softirqs.CPU27.TI=
MER
>       0.00       +4.3e+103%      43.00 =C2=B1223%  softirqs.CPU28.BLOCK
>     240.00 =C2=B1 54%     -10.8%     214.00 =C2=B1 35%  softirqs.CPU28.NE=
T_RX
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU28.NET_TX
>      24386 =C2=B1  6%     -26.3%      17967 =C2=B1  9%  softirqs.CPU28.RCU
>      44196 =C2=B1 24%     -24.4%      33391 =C2=B1 23%  softirqs.CPU28.SC=
HED
>       2.17 =C2=B1 17%     -23.1%       1.67 =C2=B1 44%  softirqs.CPU28.TA=
SKLET
>     287.17 =C2=B1166%     -92.2%      22.33 =C2=B1 50%  softirqs.CPU28.TI=
MER
>       0.00       +8.7e+103%      87.33 =C2=B1141%  softirqs.CPU29.BLOCK
>     202.50 =C2=B1 29%    +122.6%     450.83 =C2=B1 46%  softirqs.CPU29.NE=
T_RX
>       0.50 =C2=B1152%    +100.0%       1.00 =C2=B1 81%  softirqs.CPU29.NE=
T_TX
>      24213 =C2=B1  7%     -25.9%      17939 =C2=B1 17%  softirqs.CPU29.RCU
>      45987 =C2=B1 33%     -19.7%      36941 =C2=B1  7%  softirqs.CPU29.SC=
HED
>       0.00       +3.3e+101%       0.33 =C2=B1223%  softirqs.CPU29.TASKLET
>     144.33 =C2=B1188%     -77.6%      32.33 =C2=B1 82%  softirqs.CPU29.TI=
MER
>     166.50 =C2=B1  7%      -4.1%     159.67        softirqs.CPU3.NET_RX
>       0.50 =C2=B1100%     -66.7%       0.17 =C2=B1223%  softirqs.CPU3.NET=
_TX
>      27029 =C2=B1  5%     -26.2%      19947 =C2=B1  8%  softirqs.CPU3.RCU
>      21761 =C2=B1  9%      +8.7%      23665 =C2=B1 27%  softirqs.CPU3.SCH=
ED
>       0.17 =C2=B1223%    +200.0%       0.50 =C2=B1152%  softirqs.CPU3.TAS=
KLET
>       2623 =C2=B1128%     -94.8%     136.33 =C2=B1 10%  softirqs.CPU3.TIM=
ER
>     262.00           -33.3%     174.67 =C2=B1 70%  softirqs.CPU30.BLOCK
>     185.50 =C2=B1 16%      +0.7%     186.83 =C2=B1 29%  softirqs.CPU30.NE=
T_RX
>       0.33 =C2=B1141%      +0.0%       0.33 =C2=B1223%  softirqs.CPU30.NE=
T_TX
>      25436 =C2=B1 16%     -27.3%      18500 =C2=B1 14%  softirqs.CPU30.RCU
>      47164 =C2=B1 31%      -4.7%      44968 =C2=B1 42%  softirqs.CPU30.SC=
HED
>       0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%  softirqs.CPU30.TA=
SKLET
>     140.33 =C2=B1140%    +131.6%     325.00 =C2=B1196%  softirqs.CPU30.TI=
MER
>     262.00           -50.0%     131.00 =C2=B1100%  softirqs.CPU31.BLOCK
>     239.00 =C2=B1 35%     +49.0%     356.00 =C2=B1 87%  softirqs.CPU31.NE=
T_RX
>       0.00       +3.3e+101%       0.33 =C2=B1141%  softirqs.CPU31.NET_TX
>      25380 =C2=B1  8%     -29.7%      17840 =C2=B1 13%  softirqs.CPU31.RCU
>      39158 =C2=B1  8%      -7.8%      36094 =C2=B1  7%  softirqs.CPU31.SC=
HED
>       0.00         +1e+102%       1.00 =C2=B1152%  softirqs.CPU31.TASKLET
>     103.50 =C2=B1142%     -30.4%      72.00 =C2=B1143%  softirqs.CPU31.TI=
MER
>      20259 =C2=B1 10%     -12.2%      17778 =C2=B1 14%  softirqs.CPU32.RCU
>      39398 =C2=B1  3%     -10.6%      35237 =C2=B1  7%  softirqs.CPU32.SC=
HED
>       0.00       +8.3e+101%       0.83 =C2=B1223%  softirqs.CPU32.TASKLET
>     840.83 =C2=B1 80%     -76.3%     199.50 =C2=B1 63%  softirqs.CPU32.TI=
MER
>      19947 =C2=B1 10%      -7.9%      18376 =C2=B1 10%  softirqs.CPU33.RCU
>      51951 =C2=B1 33%     -28.9%      36950 =C2=B1  7%  softirqs.CPU33.SC=
HED
>       0.00       +3.3e+101%       0.33 =C2=B1141%  softirqs.CPU33.TASKLET
>     979.17 =C2=B1114%     +25.3%       1226 =C2=B1 68%  softirqs.CPU33.TI=
MER
>      18342 =C2=B1 11%      -5.6%      17317 =C2=B1 12%  softirqs.CPU34.RCU
>      45769 =C2=B1 35%     -28.8%      32593 =C2=B1 18%  softirqs.CPU34.SC=
HED
>       0.50 =C2=B1152%    +166.7%       1.33 =C2=B1223%  softirqs.CPU34.TA=
SKLET
>     392.00 =C2=B1179%     -10.8%     349.67 =C2=B1107%  softirqs.CPU34.TI=
MER
>      18490 =C2=B1 13%     -12.8%      16132 =C2=B1 20%  softirqs.CPU35.RCU
>      47902 =C2=B1 38%     -21.6%      37556 =C2=B1  7%  softirqs.CPU35.SC=
HED
>       0.00          -100.0%       0.00        softirqs.CPU35.TASKLET
>     744.33 =C2=B1205%     -23.0%     573.00 =C2=B1209%  softirqs.CPU35.TI=
MER
>      18557 =C2=B1 12%      -3.8%      17855 =C2=B1 13%  softirqs.CPU36.RCU
>      44222 =C2=B1 40%     -19.6%      35572 =C2=B1 10%  softirqs.CPU36.SC=
HED
>       0.00       +1.3e+102%       1.33 =C2=B1192%  softirqs.CPU36.TASKLET
>     423.50 =C2=B1179%     -89.3%      45.33 =C2=B1116%  softirqs.CPU36.TI=
MER
>      19891 =C2=B1 12%     -13.1%      17295 =C2=B1 12%  softirqs.CPU37.RCU
>      47035 =C2=B1 41%     -12.0%      41403 =C2=B1 22%  softirqs.CPU37.SC=
HED
>       2.00           +16.7%       2.33 =C2=B1 20%  softirqs.CPU37.TASKLET
>      40.00 =C2=B1113%    +150.0%     100.00 =C2=B1123%  softirqs.CPU37.TI=
MER
>      19943 =C2=B1 12%     -15.2%      16916 =C2=B1 15%  softirqs.CPU38.RCU
>      40667 =C2=B1  3%      +1.0%      41090 =C2=B1 16%  softirqs.CPU38.SC=
HED
>       2.83 =C2=B1 51%     -29.4%       2.00        softirqs.CPU38.TASKLET
>     205.67 =C2=B1192%     +97.6%     406.50 =C2=B1193%  softirqs.CPU38.TI=
MER
>      20219 =C2=B1 11%     -15.4%      17100 =C2=B1 18%  softirqs.CPU39.RCU
>      39608 =C2=B1  9%     -14.3%      33947 =C2=B1 22%  softirqs.CPU39.SC=
HED
>       2.17 =C2=B1 17%      -7.7%       2.00        softirqs.CPU39.TASKLET
>      50.67 =C2=B1171%      -6.2%      47.50 =C2=B1117%  softirqs.CPU39.TI=
MER
>     177.50 =C2=B1  8%      -5.2%     168.33 =C2=B1  6%  softirqs.CPU4.NET=
_RX
>       1.17 =C2=B1 58%     -71.4%       0.33 =C2=B1141%  softirqs.CPU4.NET=
_TX
>      27076 =C2=B1  5%     -17.6%      22308 =C2=B1  8%  softirqs.CPU4.RCU
>      20696 =C2=B1  8%     -12.8%      18040 =C2=B1  8%  softirqs.CPU4.SCH=
ED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU4.TASKLET
>     165.00 =C2=B1 23%      -3.7%     158.83 =C2=B1 12%  softirqs.CPU4.TIM=
ER
>      19167 =C2=B1  9%      -7.5%      17723 =C2=B1 12%  softirqs.CPU40.RCU
>      39415 =C2=B1  4%     -16.5%      32924 =C2=B1 17%  softirqs.CPU40.SC=
HED
>       2.00            +0.0%       2.00        softirqs.CPU40.TASKLET
>     693.67 =C2=B1220%     -95.2%      33.33 =C2=B1131%  softirqs.CPU40.TI=
MER
>      18530 =C2=B1 12%     -13.1%      16094 =C2=B1 23%  softirqs.CPU41.RCU
>      40044 =C2=B1  3%     -14.6%      34177 =C2=B1 17%  softirqs.CPU41.SC=
HED
>       2.00            +0.0%       2.00        softirqs.CPU41.TASKLET
>       2777 =C2=B1148%     +38.3%       3840 =C2=B1220%  softirqs.CPU41.TI=
MER
>      19887 =C2=B1 12%     -16.1%      16683 =C2=B1 16%  softirqs.CPU42.RCU
>      40664 =C2=B1  3%      -5.4%      38484 =C2=B1 29%  softirqs.CPU42.SC=
HED
>       2.00            +0.0%       2.00        softirqs.CPU42.TASKLET
>     194.67 =C2=B1195%    +106.3%     401.67 =C2=B1202%  softirqs.CPU42.TI=
MER
>      19785 =C2=B1 10%     -13.4%      17136 =C2=B1 10%  softirqs.CPU43.RCU
>      39809 =C2=B1  3%      -7.4%      36872 =C2=B1 31%  softirqs.CPU43.SC=
HED
>       2.17 =C2=B1 17%      +0.0%       2.17 =C2=B1 17%  softirqs.CPU43.TA=
SKLET
>      60.67 =C2=B1102%     -67.3%      19.83 =C2=B1 95%  softirqs.CPU43.TI=
MER
>      19015 =C2=B1 11%     -13.5%      16450 =C2=B1 17%  softirqs.CPU44.RCU
>      40243 =C2=B1  3%      -8.2%      36934 =C2=B1  8%  softirqs.CPU44.SC=
HED
>       2.83 =C2=B1 31%     -29.4%       2.00        softirqs.CPU44.TASKLET
>     308.50 =C2=B1191%     -87.8%      37.50 =C2=B1141%  softirqs.CPU44.TI=
MER
>      19375 =C2=B1 12%     -17.4%      16006 =C2=B1 18%  softirqs.CPU45.RCU
>      40733 =C2=B1  2%      -6.2%      38217 =C2=B1  5%  softirqs.CPU45.SC=
HED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU45.TASKLET
>      55.00 =C2=B1 87%     -36.4%      35.00 =C2=B1142%  softirqs.CPU45.TI=
MER
>      18220 =C2=B1 22%     -11.8%      16076 =C2=B1 16%  softirqs.CPU46.RCU
>      40556 =C2=B1  3%      -6.9%      37755 =C2=B1  5%  softirqs.CPU46.SC=
HED
>       6024 =C2=B1222%     -99.7%      16.50 =C2=B1 71%  softirqs.CPU46.TI=
MER
>      18176 =C2=B1 14%     -10.0%      16357 =C2=B1 14%  softirqs.CPU47.RCU
>      40383 =C2=B1  4%      -6.7%      37672 =C2=B1  6%  softirqs.CPU47.SC=
HED
>       3344 =C2=B1220%     -99.1%      31.17 =C2=B1156%  softirqs.CPU47.TI=
MER
>      18967 =C2=B1 13%     -16.9%      15754 =C2=B1 10%  softirqs.CPU48.RCU
>      43892 =C2=B1 20%      -4.0%      42138 =C2=B1 35%  softirqs.CPU48.SC=
HED
>       0.33 =C2=B1141%    -100.0%       0.00        softirqs.CPU48.TASKLET
>       1049 =C2=B1218%     -96.5%      36.83 =C2=B1129%  softirqs.CPU48.TI=
MER
>      19677 =C2=B1 12%     -17.6%      16220 =C2=B1 10%  softirqs.CPU49.RCU
>      39676 =C2=B1  5%      -2.4%      38721 =C2=B1 32%  softirqs.CPU49.SC=
HED
>       0.67 =C2=B1141%    -100.0%       0.00        softirqs.CPU49.TASKLET
>     479.17 =C2=B1211%     -93.6%      30.50 =C2=B1122%  softirqs.CPU49.TI=
MER
>     172.33 =C2=B1  8%      -5.5%     162.83 =C2=B1  4%  softirqs.CPU5.NET=
_RX
>       0.67 =C2=B1111%     -25.0%       0.50 =C2=B1152%  softirqs.CPU5.NET=
_TX
>      26367 =C2=B1  6%     -16.2%      22095 =C2=B1  7%  softirqs.CPU5.RCU
>      18869 =C2=B1 26%      +2.1%      19264 =C2=B1  8%  softirqs.CPU5.SCH=
ED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU5.TASKLET
>     149.50 =C2=B1  7%      -0.6%     148.67 =C2=B1  3%  softirqs.CPU5.TIM=
ER
>      18002 =C2=B1 18%      -6.5%      16832 =C2=B1 13%  softirqs.CPU50.RCU
>      39854 =C2=B1  4%      -5.4%      37706 =C2=B1  6%  softirqs.CPU50.SC=
HED
>       1.17 =C2=B1151%     +42.9%       1.67 =C2=B1197%  softirqs.CPU50.TA=
SKLET
>       5769 =C2=B1221%     -99.3%      42.67 =C2=B1 96%  softirqs.CPU50.TI=
MER
>      18242 =C2=B1 17%     -14.6%      15587 =C2=B1 18%  softirqs.CPU51.RCU
>      40210 =C2=B1 11%      -7.3%      37275 =C2=B1 20%  softirqs.CPU51.SC=
HED
>       1.17 =C2=B1187%    -100.0%       0.00        softirqs.CPU51.TASKLET
>       3514 =C2=B1174%     -99.6%      12.83 =C2=B1 54%  softirqs.CPU51.TI=
MER
>      19432 =C2=B1 12%     -12.3%      17041 =C2=B1 19%  softirqs.CPU52.RCU
>      40404 =C2=B1  4%      -7.4%      37408 =C2=B1  6%  softirqs.CPU52.SC=
HED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU52.TASKLET
>     446.00 =C2=B1197%     -96.8%      14.17 =C2=B1 54%  softirqs.CPU52.TI=
MER
>      19692 =C2=B1 12%     -17.6%      16227 =C2=B1 11%  softirqs.CPU53.RCU
>      39893 =C2=B1  4%      -8.9%      36347 =C2=B1  9%  softirqs.CPU53.SC=
HED
>       0.33 =C2=B1223%    -100.0%       0.00        softirqs.CPU53.TASKLET
>      53.83 =C2=B1104%     -71.8%      15.17 =C2=B1 53%  softirqs.CPU53.TI=
MER
>      19703 =C2=B1 11%      -8.0%      18136 =C2=B1 13%  softirqs.CPU54.RCU
>      39900 =C2=B1  5%      -7.3%      37005 =C2=B1  7%  softirqs.CPU54.SC=
HED
>       1.17 =C2=B1223%     -57.1%       0.50 =C2=B1152%  softirqs.CPU54.TA=
SKLET
>      46.67 =C2=B1 93%     -78.6%      10.00 =C2=B1 11%  softirqs.CPU54.TI=
MER
>      19145 =C2=B1 13%     -11.2%      17008 =C2=B1 15%  softirqs.CPU55.RCU
>      39928 =C2=B1  5%      -6.7%      37243 =C2=B1  6%  softirqs.CPU55.SC=
HED
>     228.17 =C2=B1182%     +49.3%     340.67 =C2=B1213%  softirqs.CPU55.TI=
MER
>      19643 =C2=B1 12%     -11.0%      17487 =C2=B1 18%  softirqs.CPU56.RCU
>      37275 =C2=B1 18%      -1.5%      36712 =C2=B1  9%  softirqs.CPU56.SC=
HED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU56.TASKLET
>     326.50 =C2=B1176%     -19.8%     261.83 =C2=B1214%  softirqs.CPU56.TI=
MER
>      18742 =C2=B1 12%      -2.8%      18211 =C2=B1 13%  softirqs.CPU57.RCU
>      40262 =C2=B1  3%      -8.7%      36749 =C2=B1  8%  softirqs.CPU57.SC=
HED
>      39.00 =C2=B1142%    +658.1%     295.67 =C2=B1193%  softirqs.CPU57.TI=
MER
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU58.NET_TX
>      19512 =C2=B1 11%     -11.2%      17332 =C2=B1 13%  softirqs.CPU58.RCU
>      40373 =C2=B1  2%      -4.6%      38507 =C2=B1  6%  softirqs.CPU58.SC=
HED
>     103.50 =C2=B1180%     -52.5%      49.17 =C2=B1106%  softirqs.CPU58.TI=
MER
>      19446 =C2=B1 13%     -11.8%      17150 =C2=B1 14%  softirqs.CPU59.RCU
>      40718            -8.1%      37416 =C2=B1  9%  softirqs.CPU59.SCHED
>      70.17 =C2=B1 88%    +515.4%     431.83 =C2=B1185%  softirqs.CPU59.TI=
MER
>     162.17            -0.4%     161.50        softirqs.CPU6.NET_RX
>       0.50 =C2=B1152%     +66.7%       0.83 =C2=B1107%  softirqs.CPU6.NET=
_TX
>      24962 =C2=B1  8%     -11.7%      22030 =C2=B1  7%  softirqs.CPU6.RCU
>      25779 =C2=B1 25%     -27.3%      18748 =C2=B1  8%  softirqs.CPU6.SCH=
ED
>     129.00 =C2=B1 28%     +41.6%     182.67 =C2=B1 31%  softirqs.CPU6.TIM=
ER
>      19662 =C2=B1 13%      -6.0%      18490 =C2=B1 13%  softirqs.CPU60.RCU
>      40368 =C2=B1  4%      -9.5%      36543 =C2=B1 10%  softirqs.CPU60.SC=
HED
>       0.50 =C2=B1152%     +33.3%       0.67 =C2=B1223%  softirqs.CPU60.TA=
SKLET
>       2608 =C2=B1213%     -98.8%      32.50 =C2=B1148%  softirqs.CPU60.TI=
MER
>      19219 =C2=B1 12%     -10.5%      17195 =C2=B1 14%  softirqs.CPU61.RCU
>      40693 =C2=B1  2%      -5.6%      38416 =C2=B1  6%  softirqs.CPU61.SC=
HED
>       1935 =C2=B1220%     -97.2%      54.83 =C2=B1 98%  softirqs.CPU61.TI=
MER
>      18934 =C2=B1 11%      -8.2%      17389 =C2=B1 13%  softirqs.CPU62.RCU
>      40704 =C2=B1  3%      -5.9%      38286 =C2=B1  6%  softirqs.CPU62.SC=
HED
>       0.33 =C2=B1141%    -100.0%       0.00        softirqs.CPU62.TASKLET
>     362.00 =C2=B1214%     -91.6%      30.50 =C2=B1144%  softirqs.CPU62.TI=
MER
>      21145 =C2=B1 13%     -11.2%      18783 =C2=B1 13%  softirqs.CPU63.RCU
>      19892 =C2=B1  9%     -18.5%      16215 =C2=B1 14%  softirqs.CPU63.SC=
HED
>      66.17 =C2=B1175%     -74.1%      17.17 =C2=B1 45%  softirqs.CPU63.TI=
MER
>       0.00       +4.4e+103%      43.67 =C2=B1223%  softirqs.CPU64.BLOCK
>       1479 =C2=B1116%     -83.7%     241.00 =C2=B1 46%  softirqs.CPU64.NE=
T_RX
>       0.17 =C2=B1223%    +100.0%       0.33 =C2=B1141%  softirqs.CPU64.NE=
T_TX
>      26328 =C2=B1  4%     -22.1%      20517 =C2=B1  9%  softirqs.CPU64.RCU
>      20496 =C2=B1  5%      +6.3%      21792 =C2=B1 29%  softirqs.CPU64.SC=
HED
>       0.17 =C2=B1223%    +300.0%       0.67 =C2=B1111%  softirqs.CPU64.TA=
SKLET
>       1096 =C2=B1149%      -1.1%       1084 =C2=B1106%  softirqs.CPU64.TI=
MER
>       2476 =C2=B1193%     -93.4%     164.00 =C2=B1  2%  softirqs.CPU65.NE=
T_RX
>       0.17 =C2=B1223%    +300.0%       0.67 =C2=B1111%  softirqs.CPU65.NE=
T_TX
>      26641 =C2=B1  3%     -16.3%      22308 =C2=B1  8%  softirqs.CPU65.RCU
>      23101 =C2=B1  8%     -14.3%      19795 =C2=B1 10%  softirqs.CPU65.SC=
HED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU65.TASKLET
>     176.50 =C2=B1 18%    +382.5%     851.67 =C2=B1174%  softirqs.CPU65.TI=
MER
>     309.50 =C2=B1102%     -23.6%     236.33 =C2=B1 41%  softirqs.CPU66.NE=
T_RX
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU66.NET_TX
>      26245 =C2=B1  3%     -14.6%      22426 =C2=B1  6%  softirqs.CPU66.RCU
>      22935 =C2=B1  8%      -9.3%      20796 =C2=B1  8%  softirqs.CPU66.SC=
HED
>       0.33 =C2=B1223%    -100.0%       0.00        softirqs.CPU66.TASKLET
>     150.33 =C2=B1  6%    +149.9%     375.67 =C2=B1136%  softirqs.CPU66.TI=
MER
>     163.83 =C2=B1  2%      +1.1%     165.67 =C2=B1  4%  softirqs.CPU67.NE=
T_RX
>       0.67 =C2=B1111%     -25.0%       0.50 =C2=B1100%  softirqs.CPU67.NE=
T_TX
>      26836 =C2=B1  3%     -19.5%      21593 =C2=B1  9%  softirqs.CPU67.RCU
>      22455 =C2=B1  8%     -26.2%      16582 =C2=B1 31%  softirqs.CPU67.SC=
HED
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1223%  softirqs.CPU67.TA=
SKLET
>     215.67 =C2=B1 49%     -27.5%     156.33 =C2=B1  8%  softirqs.CPU67.TI=
MER
>     162.83 =C2=B1  3%      -0.4%     162.17 =C2=B1  2%  softirqs.CPU68.NE=
T_RX
>       0.50 =C2=B1152%      +0.0%       0.50 =C2=B1152%  softirqs.CPU68.NE=
T_TX
>      26564 =C2=B1  3%     -19.4%      21416 =C2=B1  8%  softirqs.CPU68.RCU
>      22178 =C2=B1  8%      -1.6%      21822 =C2=B1  7%  softirqs.CPU68.SC=
HED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU68.TASKLET
>     206.83 =C2=B1 58%     -28.1%     148.67 =C2=B1 15%  softirqs.CPU68.TI=
MER
>     161.00            +0.5%     161.83 =C2=B1  4%  softirqs.CPU69.NET_RX
>       0.00       +3.3e+101%       0.33 =C2=B1223%  softirqs.CPU69.NET_TX
>      25792 =C2=B1  8%     -15.2%      21869 =C2=B1  5%  softirqs.CPU69.RCU
>      24035 =C2=B1 23%     -13.8%      20723 =C2=B1  8%  softirqs.CPU69.SC=
HED
>     134.33 =C2=B1 20%     +46.8%     197.17 =C2=B1 48%  softirqs.CPU69.TI=
MER
>     160.83            +2.3%     164.50 =C2=B1  5%  softirqs.CPU7.NET_RX
>       0.00         +5e+101%       0.50 =C2=B1152%  softirqs.CPU7.NET_TX
>      28214 =C2=B1  8%     -22.8%      21782 =C2=B1  8%  softirqs.CPU7.RCU
>      20708 =C2=B1  5%      -5.6%      19542 =C2=B1  7%  softirqs.CPU7.SCH=
ED
>     336.33 =C2=B1125%     -26.9%     246.00 =C2=B1 87%  softirqs.CPU7.TIM=
ER
>     167.67 =C2=B1  2%      +0.6%     168.67 =C2=B1  5%  softirqs.CPU70.NE=
T_RX
>       1.00           +16.7%       1.17 =C2=B1 31%  softirqs.CPU70.NET_TX
>      25123 =C2=B1  8%     -14.8%      21394 =C2=B1  6%  softirqs.CPU70.RCU
>      17044 =C2=B1 32%     +24.0%      21128 =C2=B1  6%  softirqs.CPU70.SC=
HED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU70.TASKLET
>     152.00 =C2=B1  4%     +12.3%     170.67 =C2=B1 26%  softirqs.CPU70.TI=
MER
>     161.17            +1.0%     162.83 =C2=B1  3%  softirqs.CPU71.NET_RX
>       0.17 =C2=B1223%    +300.0%       0.67 =C2=B1111%  softirqs.CPU71.NE=
T_TX
>      26841 =C2=B1  4%     -19.2%      21693 =C2=B1  7%  softirqs.CPU71.RCU
>      22493 =C2=B1  9%      -9.6%      20344 =C2=B1  9%  softirqs.CPU71.SC=
HED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU71.TASKLET
>     544.17 =C2=B1144%     -73.3%     145.33 =C2=B1  7%  softirqs.CPU71.TI=
MER
>     163.00 =C2=B1  2%      -2.4%     159.17        softirqs.CPU72.NET_RX
>       0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%  softirqs.CPU72.NE=
T_TX
>      26005 =C2=B1  3%     -18.1%      21303 =C2=B1  8%  softirqs.CPU72.RCU
>      22687 =C2=B1  8%      -3.3%      21932 =C2=B1 10%  softirqs.CPU72.SC=
HED
>       0.00       +1.7e+101%       0.17 =C2=B1223%  softirqs.CPU72.TASKLET
>     146.83 =C2=B1  3%    +267.5%     539.67 =C2=B1163%  softirqs.CPU72.TI=
MER
>     161.17            +0.7%     162.33 =C2=B1  4%  softirqs.CPU73.NET_RX
>       0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  softirqs.CPU73.NE=
T_TX
>      25593 =C2=B1  5%     -15.9%      21518 =C2=B1  5%  softirqs.CPU73.RCU
>      20129 =C2=B1 26%      +6.1%      21361 =C2=B1  6%  softirqs.CPU73.SC=
HED
>     146.33 =C2=B1  6%      +8.0%     158.00 =C2=B1 18%  softirqs.CPU73.TI=
MER
>     161.33            -1.3%     159.17        softirqs.CPU74.NET_RX
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU74.NET_TX
>      26019 =C2=B1  8%     -16.3%      21776 =C2=B1  6%  softirqs.CPU74.RCU
>      18989 =C2=B1 24%     +11.7%      21214 =C2=B1  8%  softirqs.CPU74.SC=
HED
>       0.00          -100.0%       0.00        softirqs.CPU74.TASKLET
>     156.00 =C2=B1 10%     +35.4%     211.17 =C2=B1 29%  softirqs.CPU74.TI=
MER
>     161.67            -1.2%     159.67        softirqs.CPU75.NET_RX
>       0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%  softirqs.CPU75.NE=
T_TX
>      26187           -18.4%      21363 =C2=B1  6%  softirqs.CPU75.RCU
>      21755 =C2=B1 10%      -2.3%      21252 =C2=B1  7%  softirqs.CPU75.SC=
HED
>       0.00       +3.3e+101%       0.33 =C2=B1223%  softirqs.CPU75.TASKLET
>     141.33 =C2=B1  8%    +239.5%     479.83 =C2=B1 94%  softirqs.CPU75.TI=
MER
>     166.17 =C2=B1  4%      +2.5%     170.33 =C2=B1 14%  softirqs.CPU76.NE=
T_RX
>       0.33 =C2=B1141%     +50.0%       0.50 =C2=B1223%  softirqs.CPU76.NE=
T_TX
>      26108 =C2=B1  3%     -17.7%      21487 =C2=B1  6%  softirqs.CPU76.RCU
>      21971 =C2=B1  8%      -5.1%      20849 =C2=B1  9%  softirqs.CPU76.SC=
HED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU76.TASKLET
>     223.33 =C2=B1 53%     +31.9%     294.50 =C2=B1 68%  softirqs.CPU76.TI=
MER
>     165.33 =C2=B1  2%      -1.7%     162.50 =C2=B1  3%  softirqs.CPU77.NE=
T_RX
>       0.83 =C2=B1 82%     -80.0%       0.17 =C2=B1223%  softirqs.CPU77.NE=
T_TX
>      26272 =C2=B1  3%     -17.2%      21747 =C2=B1  6%  softirqs.CPU77.RCU
>      21752 =C2=B1  6%      -1.2%      21486 =C2=B1 11%  softirqs.CPU77.SC=
HED
>     214.83 =C2=B1 52%    +154.1%     545.83 =C2=B1148%  softirqs.CPU77.TI=
MER
>     162.33 =C2=B1  2%      +2.0%     165.50 =C2=B1  7%  softirqs.CPU78.NE=
T_RX
>       0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%  softirqs.CPU78.NE=
T_TX
>      26101 =C2=B1  4%     -17.0%      21654 =C2=B1  5%  softirqs.CPU78.RCU
>      21907 =C2=B1  9%      -1.8%      21519 =C2=B1  4%  softirqs.CPU78.SC=
HED
>       0.00       +6.7e+101%       0.67 =C2=B1165%  softirqs.CPU78.TASKLET
>     145.67 =C2=B1 22%     +41.2%     205.67 =C2=B1 40%  softirqs.CPU78.TI=
MER
>     160.83            +0.5%     161.67 =C2=B1  3%  softirqs.CPU79.NET_RX
>       0.00         +5e+101%       0.50 =C2=B1152%  softirqs.CPU79.NET_TX
>      26361 =C2=B1  3%     -16.5%      22007 =C2=B1  5%  softirqs.CPU79.RCU
>      22235 =C2=B1  7%      -4.4%      21253 =C2=B1  7%  softirqs.CPU79.SC=
HED
>       0.00       +6.7e+101%       0.67 =C2=B1223%  softirqs.CPU79.TASKLET
>     138.17 =C2=B1 10%     +10.0%     152.00 =C2=B1 19%  softirqs.CPU79.TI=
MER
>     162.50 =C2=B1  3%      -1.7%     159.67        softirqs.CPU8.NET_RX
>       0.33 =C2=B1223%     -50.0%       0.17 =C2=B1223%  softirqs.CPU8.NET=
_TX
>      28092 =C2=B1 11%     -21.6%      22019 =C2=B1  9%  softirqs.CPU8.RCU
>      20093 =C2=B1  5%      -8.4%      18409 =C2=B1 10%  softirqs.CPU8.SCH=
ED
>       0.67 =C2=B1223%     -75.0%       0.17 =C2=B1223%  softirqs.CPU8.TAS=
KLET
>     422.33 =C2=B1141%     -59.7%     170.00 =C2=B1 10%  softirqs.CPU8.TIM=
ER
>     163.00 =C2=B1  2%      -2.1%     159.50        softirqs.CPU80.NET_RX
>       0.67 =C2=B1111%     -75.0%       0.17 =C2=B1223%  softirqs.CPU80.NE=
T_TX
>      23042 =C2=B1 10%     -18.8%      18720 =C2=B1 10%  softirqs.CPU80.RCU
>      38736 =C2=B1  5%      +0.1%      38775 =C2=B1  5%  softirqs.CPU80.SC=
HED
>       5.33 =C2=B1141%     -56.2%       2.33 =C2=B1172%  softirqs.CPU80.TA=
SKLET
>     264.17 =C2=B1 72%    +144.2%     645.17 =C2=B1 91%  softirqs.CPU80.TI=
MER
>     161.00            -1.1%     159.17        softirqs.CPU81.NET_RX
>       0.00          -100.0%       0.00        softirqs.CPU81.NET_TX
>      24329 =C2=B1  4%     -34.2%      16008 =C2=B1 21%  softirqs.CPU81.RCU
>      39347            -1.3%      38818 =C2=B1  5%  softirqs.CPU81.SCHED
>       3.50 =C2=B1223%     +14.3%       4.00 =C2=B1134%  softirqs.CPU81.TA=
SKLET
>     147.17 =C2=B1147%   +1347.5%       2130 =C2=B1137%  softirqs.CPU81.TI=
MER
>     162.17 =C2=B1  2%      -1.7%     159.33        softirqs.CPU82.NET_RX
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%  softirqs.CPU82.NE=
T_TX
>      25356           -29.8%      17808 =C2=B1 18%  softirqs.CPU82.RCU
>      39965            -7.3%      37066 =C2=B1 10%  softirqs.CPU82.SCHED
>       2.83 =C2=B1223%    +158.8%       7.33 =C2=B1120%  softirqs.CPU82.TA=
SKLET
>      34.00 =C2=B1 32%  +12872.1%       4410 =C2=B1147%  softirqs.CPU82.TI=
MER
>     163.17 =C2=B1  3%      -2.0%     159.83 =C2=B1  2%  softirqs.CPU83.NE=
T_RX
>       0.50 =C2=B1152%     -66.7%       0.17 =C2=B1223%  softirqs.CPU83.NE=
T_TX
>      24367           -21.0%      19245 =C2=B1 15%  softirqs.CPU83.RCU
>      39791            -2.4%      38820 =C2=B1  5%  softirqs.CPU83.SCHED
>       0.00         +2e+102%       2.00 =C2=B1165%  softirqs.CPU83.TASKLET
>      52.17 =C2=B1 49%   +6146.3%       3258 =C2=B1217%  softirqs.CPU83.TI=
MER
>     161.33            -0.7%     160.17        softirqs.CPU84.NET_RX
>       0.33 =C2=B1141%      +0.0%       0.33 =C2=B1141%  softirqs.CPU84.NE=
T_TX
>      26453 =C2=B1  2%     -21.0%      20910 =C2=B1  6%  softirqs.CPU84.RCU
>      40042            -3.1%      38787 =C2=B1  5%  softirqs.CPU84.SCHED
>       0.33 =C2=B1223%    +150.0%       0.83 =C2=B1223%  softirqs.CPU84.TA=
SKLET
>     161.33 =C2=B1 99%     -29.5%     113.67 =C2=B1152%  softirqs.CPU84.TI=
MER
>     161.67 =C2=B1  2%      -1.4%     159.33        softirqs.CPU85.NET_RX
>       0.50 =C2=B1152%     -66.7%       0.17 =C2=B1223%  softirqs.CPU85.NE=
T_TX
>      25491 =C2=B1  5%     -22.6%      19740 =C2=B1  7%  softirqs.CPU85.RCU
>      40536 =C2=B1  4%     -12.9%      35314 =C2=B1 18%  softirqs.CPU85.SC=
HED
>       1.00 =C2=B1223%     -66.7%       0.33 =C2=B1223%  softirqs.CPU85.TA=
SKLET
>       1182 =C2=B1217%     -94.3%      67.83 =C2=B1146%  softirqs.CPU85.TI=
MER
>     161.83 =C2=B1  2%      -0.5%     161.00 =C2=B1  2%  softirqs.CPU86.NE=
T_RX
>       0.50 =C2=B1100%     +33.3%       0.67 =C2=B1111%  softirqs.CPU86.NE=
T_TX
>      23879 =C2=B1  8%     -20.7%      18928 =C2=B1 13%  softirqs.CPU86.RCU
>      40336 =C2=B1  3%     -11.7%      35618 =C2=B1 19%  softirqs.CPU86.SC=
HED
>       2.83 =C2=B1208%    -100.0%       0.00        softirqs.CPU86.TASKLET
>     968.83 =C2=B1174%     -93.1%      67.33 =C2=B1124%  softirqs.CPU86.TI=
MER
>     160.83            -0.6%     159.83 =C2=B1  2%  softirqs.CPU87.NET_RX
>       0.00       +3.3e+101%       0.33 =C2=B1141%  softirqs.CPU87.NET_TX
>      25408           -19.3%      20491 =C2=B1  6%  softirqs.CPU87.RCU
>      33567 =C2=B1 22%     +14.7%      38516 =C2=B1  5%  softirqs.CPU87.SC=
HED
>       2.00 =C2=B1223%     -75.0%       0.50 =C2=B1152%  softirqs.CPU87.TA=
SKLET
>      26.33 =C2=B1 39%     +29.7%      34.17 =C2=B1 71%  softirqs.CPU87.TI=
MER
>     161.83 =C2=B1  2%      -1.1%     160.00 =C2=B1  2%  softirqs.CPU88.NE=
T_RX
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%  softirqs.CPU88.NE=
T_TX
>      24864           -17.5%      20520 =C2=B1  6%  softirqs.CPU88.RCU
>      36991 =C2=B1 17%      +4.7%      38735 =C2=B1  5%  softirqs.CPU88.SC=
HED
>       2.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU88.TASKLET
>      71.83 =C2=B1108%     +19.5%      85.83 =C2=B1157%  softirqs.CPU88.TI=
MER
>     161.83            -1.5%     159.33        softirqs.CPU89.NET_RX
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1223%  softirqs.CPU89.NE=
T_TX
>      26283 =C2=B1 10%     -23.9%      19989 =C2=B1  6%  softirqs.CPU89.RCU
>      31177 =C2=B1 40%     +23.7%      38551 =C2=B1  5%  softirqs.CPU89.SC=
HED
>       2.00 =C2=B1160%     -83.3%       0.33 =C2=B1141%  softirqs.CPU89.TA=
SKLET
>     594.67 =C2=B1130%     -68.2%     189.33 =C2=B1135%  softirqs.CPU89.TI=
MER
>     166.00 =C2=B1  3%      -4.2%     159.00        softirqs.CPU9.NET_RX
>       0.67 =C2=B1111%    -100.0%       0.00        softirqs.CPU9.NET_TX
>      26214 =C2=B1  4%     -18.2%      21444 =C2=B1  8%  softirqs.CPU9.RCU
>      22630 =C2=B1 23%     -17.6%      18638 =C2=B1  8%  softirqs.CPU9.SCH=
ED
>       0.33 =C2=B1223%      +0.0%       0.33 =C2=B1141%  softirqs.CPU9.TAS=
KLET
>     147.83 =C2=B1  3%     +52.4%     225.33 =C2=B1 48%  softirqs.CPU9.TIM=
ER
>     162.50 =C2=B1  2%      -1.0%     160.83 =C2=B1  2%  softirqs.CPU90.NE=
T_RX
>       0.67 =C2=B1141%     +25.0%       0.83 =C2=B1107%  softirqs.CPU90.NE=
T_TX
>      25510           -18.4%      20808 =C2=B1  7%  softirqs.CPU90.RCU
>      40089            -3.4%      38723 =C2=B1  5%  softirqs.CPU90.SCHED
>       1.17 =C2=B1223%     -28.6%       0.83 =C2=B1128%  softirqs.CPU90.TA=
SKLET
>     177.00 =C2=B1 99%     +25.1%     221.50 =C2=B1118%  softirqs.CPU90.TI=
MER
>     161.17 =C2=B1  2%      -1.3%     159.00        softirqs.CPU91.NET_RX
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU91.NET_TX
>      25457 =C2=B1  3%     -18.4%      20782 =C2=B1  5%  softirqs.CPU91.RCU
>      40056            -3.4%      38676 =C2=B1  5%  softirqs.CPU91.SCHED
>       0.00         +4e+102%       4.00 =C2=B1202%  softirqs.CPU91.TASKLET
>      33.67 =C2=B1 87%    +117.8%      73.33 =C2=B1152%  softirqs.CPU91.TI=
MER
>     161.17            -0.6%     160.17        softirqs.CPU92.NET_RX
>       0.17 =C2=B1223%    +200.0%       0.50 =C2=B1152%  softirqs.CPU92.NE=
T_TX
>      24869           -18.1%      20366 =C2=B1  6%  softirqs.CPU92.RCU
>      39909            -6.8%      37200 =C2=B1  9%  softirqs.CPU92.SCHED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU92.TASKLET
>     126.00 =C2=B1118%     -71.6%      35.83 =C2=B1 64%  softirqs.CPU92.TI=
MER
>     171.83 =C2=B1  9%      -7.1%     159.67        softirqs.CPU93.NET_RX
>       0.50 =C2=B1152%     -33.3%       0.33 =C2=B1141%  softirqs.CPU93.NE=
T_TX
>      25259           -17.9%      20739 =C2=B1  5%  softirqs.CPU93.RCU
>      39776           -10.3%      35688 =C2=B1 19%  softirqs.CPU93.SCHED
>       0.67 =C2=B1141%    +425.0%       3.50 =C2=B1152%  softirqs.CPU93.TA=
SKLET
>     101.67 =C2=B1122%     +38.7%     141.00 =C2=B1171%  softirqs.CPU93.TI=
MER
>     171.67 =C2=B1 13%      -6.7%     160.17        softirqs.CPU94.NET_RX
>       0.33 =C2=B1141%     +50.0%       0.50 =C2=B1152%  softirqs.CPU94.NE=
T_TX
>      23948           -16.4%      20013 =C2=B1  5%  softirqs.CPU94.RCU
>      39873           -10.8%      35557 =C2=B1 21%  softirqs.CPU94.SCHED
>       3.17 =C2=B1223%     -94.7%       0.17 =C2=B1223%  softirqs.CPU94.TA=
SKLET
>      25.00 =C2=B1 48%   +3760.7%     965.17 =C2=B1164%  softirqs.CPU94.TI=
MER
>     163.33 =C2=B1  2%      -2.2%     159.67        softirqs.CPU95.NET_RX
>       0.67 =C2=B1141%     -25.0%       0.50 =C2=B1152%  softirqs.CPU95.NE=
T_TX
>      25378 =C2=B1  3%     -20.8%      20105 =C2=B1 27%  softirqs.CPU95.RCU
>      39994            -3.3%      38693 =C2=B1  5%  softirqs.CPU95.SCHED
>       1.33 =C2=B1192%    -100.0%       0.00        softirqs.CPU95.TASKLET
>      60.67 =C2=B1132%  +10694.5%       6548 =C2=B1210%  softirqs.CPU95.TI=
MER
>      21199 =C2=B1 10%      -8.4%      19409 =C2=B1  8%  softirqs.CPU96.RCU
>      35378 =C2=B1 27%      +6.7%      37763 =C2=B1 12%  softirqs.CPU96.SC=
HED
>      38.83 =C2=B1 79%     +82.8%      71.00 =C2=B1 95%  softirqs.CPU96.TI=
MER
>      20301 =C2=B1 10%      -3.5%      19591 =C2=B1  5%  softirqs.CPU97.RCU
>      39850 =C2=B1  3%      -6.1%      37406 =C2=B1  7%  softirqs.CPU97.SC=
HED
>      90.83 =C2=B1139%    +300.0%     363.33 =C2=B1198%  softirqs.CPU97.TI=
MER
>      16833 =C2=B1 10%      -4.1%      16135 =C2=B1 13%  softirqs.CPU98.RCU
>      39754            -7.6%      36741 =C2=B1 18%  softirqs.CPU98.SCHED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU98.TASKLET
>      82.83 =C2=B1 85%     +22.9%     101.83 =C2=B1 62%  softirqs.CPU98.TI=
MER
>      18562 =C2=B1  6%      -3.1%      17990 =C2=B1 16%  softirqs.CPU99.RCU
>      39330            -2.1%      38512 =C2=B1  8%  softirqs.CPU99.SCHED
>       0.17 =C2=B1223%    -100.0%       0.00        softirqs.CPU99.TASKLET
>      35.67 =C2=B1120%  +11389.3%       4097 =C2=B1218%  softirqs.CPU99.TI=
MER
>       1.00            +0.0%       1.00        softirqs.HI
>      18174 =C2=B1 25%     -27.0%      13260 =C2=B1  6%  softirqs.NET_RX
>      30.17 =C2=B1 12%      +5.5%      31.83 =C2=B1 18%  softirqs.NET_TX
>    2904857 =C2=B1  6%     -16.6%    2423326 =C2=B1  8%  softirqs.RCU
>    4532939 =C2=B1  5%      -7.4%    4199177 =C2=B1  6%  softirqs.SCHED
>     278.67            +0.1%     278.83        softirqs.TASKLET
>      64360 =C2=B1  4%      -7.9%      59285 =C2=B1  5%  softirqs.TIMER
>       0.00          -100.0%       0.00        interrupts.0:IR-IO-APIC.2-e=
dge.timer
>       0.00          -100.0%       0.00        interrupts.136:IR-PCI-MSI.3=
8830080-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.137:IR-PCI-MSI.3=
8846464-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.138:IR-PCI-MSI.3=
8862848-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.139:IR-PCI-MSI.3=
8879232-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.140:IR-PCI-MSI.5=
2461568-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.141:IR-PCI-MSI.5=
2477952-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.142:IR-PCI-MSI.5=
2494336-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.143:IR-PCI-MSI.5=
2510720-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.145:IR-PCI-MSI.1=
18521856-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.146:IR-PCI-MSI.1=
18538240-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.147:IR-PCI-MSI.1=
18554624-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.148:IR-PCI-MSI.1=
18571008-edge.PCIe.PME,pciehp
>     567.50 =C2=B1 38%    +120.4%       1250 =C2=B1116%  interrupts.149:IR=
-PCI-MSI.25690112-edge.eth0-TxRx-0
>     236.17 =C2=B1 44%     +31.5%     310.67 =C2=B1 59%  interrupts.150:IR=
-PCI-MSI.25690113-edge.eth0-TxRx-1
>     233.50 =C2=B1 59%     +24.5%     290.67 =C2=B1 62%  interrupts.151:IR=
-PCI-MSI.25690114-edge.eth0-TxRx-2
>     312.33 =C2=B1 47%    +350.3%       1406 =C2=B1101%  interrupts.152:IR=
-PCI-MSI.25690115-edge.eth0-TxRx-3
>     184.00 =C2=B1 25%    +546.5%       1189 =C2=B1179%  interrupts.153:IR=
-PCI-MSI.25690116-edge.eth0-TxRx-4
>       2578 =C2=B1204%     -92.5%     194.33 =C2=B1 32%  interrupts.154:IR=
-PCI-MSI.25690117-edge.eth0-TxRx-5
>       1936 =C2=B1177%     -72.8%     526.33 =C2=B1100%  interrupts.155:IR=
-PCI-MSI.25690118-edge.eth0-TxRx-6
>       1267 =C2=B1100%     -86.9%     166.50 =C2=B1 11%  interrupts.156:IR=
-PCI-MSI.25690119-edge.eth0-TxRx-7
>     282.67 =C2=B1 90%     +45.2%     410.33 =C2=B1 84%  interrupts.157:IR=
-PCI-MSI.25690120-edge.eth0-TxRx-8
>     295.67 =C2=B1 85%     -22.5%     229.00 =C2=B1 50%  interrupts.158:IR=
-PCI-MSI.25690121-edge.eth0-TxRx-9
>     225.33 =C2=B1 55%    +175.9%     621.67 =C2=B1 73%  interrupts.159:IR=
-PCI-MSI.25690122-edge.eth0-TxRx-10
>     190.00 =C2=B1 29%      +6.4%     202.17 =C2=B1 51%  interrupts.160:IR=
-PCI-MSI.25690123-edge.eth0-TxRx-11
>     289.83 =C2=B1 53%     +52.8%     443.00 =C2=B1 97%  interrupts.161:IR=
-PCI-MSI.25690124-edge.eth0-TxRx-12
>       2764 =C2=B1123%     -88.8%     309.17 =C2=B1 70%  interrupts.162:IR=
-PCI-MSI.25690125-edge.eth0-TxRx-13
>       4756 =C2=B1201%     -96.7%     155.83 =C2=B1  2%  interrupts.163:IR=
-PCI-MSI.25690126-edge.eth0-TxRx-14
>     430.33 =C2=B1140%     -30.9%     297.50 =C2=B1 65%  interrupts.164:IR=
-PCI-MSI.25690127-edge.eth0-TxRx-15
>     151.50 =C2=B1  2%      +6.7%     161.67 =C2=B1  9%  interrupts.165:IR=
-PCI-MSI.25690128-edge.eth0-TxRx-16
>     151.83 =C2=B1  3%      +0.2%     152.17 =C2=B1  5%  interrupts.166:IR=
-PCI-MSI.25690129-edge.eth0-TxRx-17
>     148.83            +1.6%     151.17 =C2=B1  3%  interrupts.167:IR-PCI-=
MSI.25690130-edge.eth0-TxRx-18
>     155.67            +3.4%     161.00 =C2=B1  7%  interrupts.168:IR-PCI-=
MSI.25690131-edge.eth0-TxRx-19
>     149.17            +4.4%     155.67 =C2=B1  6%  interrupts.169:IR-PCI-=
MSI.25690132-edge.eth0-TxRx-20
>     151.83 =C2=B1  4%      -2.2%     148.50        interrupts.170:IR-PCI-=
MSI.25690133-edge.eth0-TxRx-21
>     148.33            +3.7%     153.83 =C2=B1  7%  interrupts.171:IR-PCI-=
MSI.25690134-edge.eth0-TxRx-22
>     148.50            +0.0%     148.50        interrupts.172:IR-PCI-MSI.2=
5690135-edge.eth0-TxRx-23
>     148.67            +0.6%     149.50        interrupts.173:IR-PCI-MSI.2=
5690136-edge.eth0-TxRx-24
>     158.33 =C2=B1  8%      +7.5%     170.17 =C2=B1 28%  interrupts.174:IR=
-PCI-MSI.25690137-edge.eth0-TxRx-25
>     157.50 =C2=B1  3%      -2.3%     153.83 =C2=B1  7%  interrupts.175:IR=
-PCI-MSI.25690138-edge.eth0-TxRx-26
>     150.67            +5.9%     159.50 =C2=B1 15%  interrupts.176:IR-PCI-=
MSI.25690139-edge.eth0-TxRx-27
>     148.33            +1.9%     151.17 =C2=B1  2%  interrupts.177:IR-PCI-=
MSI.25690140-edge.eth0-TxRx-28
>     149.00            +0.2%     149.33        interrupts.178:IR-PCI-MSI.2=
5690141-edge.eth0-TxRx-29
>     148.67            -0.1%     148.50        interrupts.179:IR-PCI-MSI.2=
5690142-edge.eth0-TxRx-30
>     148.67            -0.1%     148.50        interrupts.180:IR-PCI-MSI.2=
5690143-edge.eth0-TxRx-31
>     149.00            +0.0%     149.00        interrupts.181:IR-PCI-MSI.2=
5690144-edge.eth0-TxRx-32
>     148.33            +0.3%     148.83        interrupts.182:IR-PCI-MSI.2=
5690145-edge.eth0-TxRx-33
>     149.83 =C2=B1  2%      -1.1%     148.17        interrupts.183:IR-PCI-=
MSI.25690146-edge.eth0-TxRx-34
>     148.83            +1.0%     150.33        interrupts.184:IR-PCI-MSI.2=
5690147-edge.eth0-TxRx-35
>     148.33            -0.1%     148.17        interrupts.185:IR-PCI-MSI.2=
5690148-edge.eth0-TxRx-36
>     149.17            -0.6%     148.33        interrupts.186:IR-PCI-MSI.2=
5690149-edge.eth0-TxRx-37
>     148.83            -0.4%     148.17        interrupts.187:IR-PCI-MSI.2=
5690150-edge.eth0-TxRx-38
>     148.67            +0.1%     148.83        interrupts.188:IR-PCI-MSI.2=
5690151-edge.eth0-TxRx-39
>     148.33            -0.1%     148.17        interrupts.189:IR-PCI-MSI.2=
5690152-edge.eth0-TxRx-40
>     148.67            +1.1%     150.33 =C2=B1  2%  interrupts.190:IR-PCI-=
MSI.25690153-edge.eth0-TxRx-41
>     170.00 =C2=B1 19%     -12.6%     148.50        interrupts.191:IR-PCI-=
MSI.25690154-edge.eth0-TxRx-42
>     169.00 =C2=B1 26%     -12.0%     148.67        interrupts.192:IR-PCI-=
MSI.25690155-edge.eth0-TxRx-43
>     148.83            -0.3%     148.33        interrupts.193:IR-PCI-MSI.2=
5690156-edge.eth0-TxRx-44
>     148.67            +9.5%     162.83 =C2=B1 19%  interrupts.194:IR-PCI-=
MSI.25690157-edge.eth0-TxRx-45
>     149.00            -0.4%     148.33        interrupts.195:IR-PCI-MSI.2=
5690158-edge.eth0-TxRx-46
>     159.67 =C2=B1 15%      -6.9%     148.67        interrupts.196:IR-PCI-=
MSI.25690159-edge.eth0-TxRx-47
>     177.33 =C2=B1 18%      -5.8%     167.00 =C2=B1 13%  interrupts.197:IR=
-PCI-MSI.25690160-edge.eth0-TxRx-48
>     168.83 =C2=B1 15%      -7.8%     155.67 =C2=B1  6%  interrupts.198:IR=
-PCI-MSI.25690161-edge.eth0-TxRx-49
>     150.33 =C2=B1  2%      -0.4%     149.67        interrupts.199:IR-PCI-=
MSI.25690162-edge.eth0-TxRx-50
>     148.33            +4.8%     155.50 =C2=B1  7%  interrupts.200:IR-PCI-=
MSI.25690163-edge.eth0-TxRx-51
>     148.83            +0.4%     149.50        interrupts.201:IR-PCI-MSI.2=
5690164-edge.eth0-TxRx-52
>     154.67 =C2=B1  5%      -4.2%     148.17        interrupts.202:IR-PCI-=
MSI.25690165-edge.eth0-TxRx-53
>     148.50            +1.1%     150.17 =C2=B1  2%  interrupts.203:IR-PCI-=
MSI.25690166-edge.eth0-TxRx-54
>     149.67            +4.1%     155.83 =C2=B1 10%  interrupts.204:IR-PCI-=
MSI.25690167-edge.eth0-TxRx-55
>     148.33            +1.3%     150.33        interrupts.205:IR-PCI-MSI.2=
5690168-edge.eth0-TxRx-56
>     155.50 =C2=B1  7%      -3.1%     150.67 =C2=B1  3%  interrupts.206:IR=
-PCI-MSI.25690169-edge.eth0-TxRx-57
>     170.17 =C2=B1 12%     -12.4%     149.00        interrupts.207:IR-PCI-=
MSI.25690170-edge.eth0-TxRx-58
>     149.83            +4.6%     156.67 =C2=B1 10%  interrupts.208:IR-PCI-=
MSI.25690171-edge.eth0-TxRx-59
>     148.67           +10.4%     164.17 =C2=B1 14%  interrupts.209:IR-PCI-=
MSI.25690172-edge.eth0-TxRx-60
>     148.67            -0.3%     148.17        interrupts.210:IR-PCI-MSI.2=
5690173-edge.eth0-TxRx-61
>     150.33 =C2=B1  2%      -0.8%     149.17        interrupts.211:IR-PCI-=
MSI.25690174-edge.eth0-TxRx-62
>       0.00          -100.0%       0.00        interrupts.212:IR-PCI-MSI.2=
5690175-edge.eth0
>       0.00          -100.0%       0.00        interrupts.213:IR-PCI-MSI.2=
5692160-edge
>       0.00          -100.0%       0.00        interrupts.214:IR-PCI-MSI.2=
5692161-edge
>       0.00          -100.0%       0.00        interrupts.215:IR-PCI-MSI.2=
5692162-edge
>       0.00          -100.0%       0.00        interrupts.216:IR-PCI-MSI.2=
5692163-edge
>       0.00          -100.0%       0.00        interrupts.217:IR-PCI-MSI.2=
5692164-edge
>       0.00          -100.0%       0.00        interrupts.218:IR-PCI-MSI.2=
5692165-edge
>       0.00          -100.0%       0.00        interrupts.219:IR-PCI-MSI.2=
5692166-edge
>       0.00          -100.0%       0.00        interrupts.220:IR-PCI-MSI.2=
5692167-edge
>       0.00          -100.0%       0.00        interrupts.221:IR-PCI-MSI.2=
5692168-edge
>       0.00          -100.0%       0.00        interrupts.222:IR-PCI-MSI.2=
5692169-edge
>       0.00          -100.0%       0.00        interrupts.223:IR-PCI-MSI.2=
5692170-edge
>       0.00          -100.0%       0.00        interrupts.224:IR-PCI-MSI.2=
5692171-edge
>       0.00          -100.0%       0.00        interrupts.225:IR-PCI-MSI.2=
5692172-edge
>       0.00          -100.0%       0.00        interrupts.226:IR-PCI-MSI.2=
5692173-edge
>       0.00          -100.0%       0.00        interrupts.227:IR-PCI-MSI.2=
5692174-edge
>       0.00          -100.0%       0.00        interrupts.228:IR-PCI-MSI.2=
5692175-edge
>       0.00          -100.0%       0.00        interrupts.229:IR-PCI-MSI.2=
5692176-edge
>       0.00          -100.0%       0.00        interrupts.230:IR-PCI-MSI.2=
5692177-edge
>       0.00          -100.0%       0.00        interrupts.231:IR-PCI-MSI.2=
5692178-edge
>       0.00          -100.0%       0.00        interrupts.232:IR-PCI-MSI.2=
5692179-edge
>       0.00          -100.0%       0.00        interrupts.233:IR-PCI-MSI.2=
5692180-edge
>       0.00          -100.0%       0.00        interrupts.234:IR-PCI-MSI.2=
5692181-edge
>       0.00          -100.0%       0.00        interrupts.235:IR-PCI-MSI.2=
5692182-edge
>       0.00          -100.0%       0.00        interrupts.236:IR-PCI-MSI.2=
5692183-edge
>       0.00          -100.0%       0.00        interrupts.237:IR-PCI-MSI.2=
5692184-edge
>       0.00          -100.0%       0.00        interrupts.238:IR-PCI-MSI.2=
5692185-edge
>       0.00          -100.0%       0.00        interrupts.239:IR-PCI-MSI.2=
5692186-edge
>       0.00          -100.0%       0.00        interrupts.240:IR-PCI-MSI.2=
5692187-edge
>       0.00          -100.0%       0.00        interrupts.241:IR-PCI-MSI.2=
5692188-edge
>       0.00          -100.0%       0.00        interrupts.242:IR-PCI-MSI.2=
5692189-edge
>       0.00          -100.0%       0.00        interrupts.243:IR-PCI-MSI.2=
5692190-edge
>       0.00          -100.0%       0.00        interrupts.244:IR-PCI-MSI.2=
5692191-edge
>       0.00          -100.0%       0.00        interrupts.245:IR-PCI-MSI.2=
5692192-edge
>       0.00          -100.0%       0.00        interrupts.246:IR-PCI-MSI.2=
5692193-edge
>       0.00          -100.0%       0.00        interrupts.247:IR-PCI-MSI.2=
5692194-edge
>       0.00          -100.0%       0.00        interrupts.248:IR-PCI-MSI.2=
5692195-edge
>       0.00          -100.0%       0.00        interrupts.249:IR-PCI-MSI.2=
5692196-edge
>       0.00          -100.0%       0.00        interrupts.250:IR-PCI-MSI.2=
5692197-edge
>       0.00          -100.0%       0.00        interrupts.251:IR-PCI-MSI.2=
5692198-edge
>       0.00          -100.0%       0.00        interrupts.252:IR-PCI-MSI.2=
5692199-edge
>       0.00          -100.0%       0.00        interrupts.253:IR-PCI-MSI.2=
5692200-edge
>       0.00          -100.0%       0.00        interrupts.254:IR-PCI-MSI.2=
5692201-edge
>       0.00          -100.0%       0.00        interrupts.255:IR-PCI-MSI.2=
5692202-edge
>       0.00          -100.0%       0.00        interrupts.256:IR-PCI-MSI.2=
5692203-edge
>       0.00          -100.0%       0.00        interrupts.257:IR-PCI-MSI.2=
5692204-edge
>       0.00          -100.0%       0.00        interrupts.258:IR-PCI-MSI.2=
5692205-edge
>       0.00          -100.0%       0.00        interrupts.259:IR-PCI-MSI.2=
5692206-edge
>       0.00          -100.0%       0.00        interrupts.260:IR-PCI-MSI.2=
5692207-edge
>       0.00          -100.0%       0.00        interrupts.261:IR-PCI-MSI.2=
5692208-edge
>       0.00          -100.0%       0.00        interrupts.262:IR-PCI-MSI.2=
5692209-edge
>       0.00          -100.0%       0.00        interrupts.263:IR-PCI-MSI.2=
5692210-edge
>       0.00          -100.0%       0.00        interrupts.264:IR-PCI-MSI.2=
5692211-edge
>       0.00          -100.0%       0.00        interrupts.265:IR-PCI-MSI.2=
5692212-edge
>       0.00          -100.0%       0.00        interrupts.266:IR-PCI-MSI.2=
5692213-edge
>       0.00          -100.0%       0.00        interrupts.267:IR-PCI-MSI.2=
5692214-edge
>       0.00          -100.0%       0.00        interrupts.268:IR-PCI-MSI.2=
5692215-edge
>       0.00          -100.0%       0.00        interrupts.269:IR-PCI-MSI.2=
5692216-edge
>       0.00          -100.0%       0.00        interrupts.270:IR-PCI-MSI.2=
5692217-edge
>       0.00          -100.0%       0.00        interrupts.271:IR-PCI-MSI.2=
5692218-edge
>       0.00          -100.0%       0.00        interrupts.272:IR-PCI-MSI.2=
5692219-edge
>       0.00          -100.0%       0.00        interrupts.273:IR-PCI-MSI.2=
5692220-edge
>       0.00          -100.0%       0.00        interrupts.274:IR-PCI-MSI.2=
5692221-edge
>       0.00          -100.0%       0.00        interrupts.275:IR-PCI-MSI.2=
5692222-edge
>       0.00          -100.0%       0.00        interrupts.277:IR-PCI-MSI.3=
27680-edge.xhci_hcd
>       0.00          -100.0%       0.00        interrupts.278:IR-PCI-MSI.1=
6384-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.279:IR-PCI-MSI.1=
8432-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.280:IR-PCI-MSI.1=
8432-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.280:IR-PCI-MSI.2=
0480-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.281:IR-PCI-MSI.2=
0480-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.281:IR-PCI-MSI.2=
2528-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.282:IR-PCI-MSI.2=
4576-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.282:IR-PCI-MSI.3=
9321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.283:IR-PCI-MSI.2=
6624-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.284:IR-PCI-MSI.2=
2528-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.284:IR-PCI-MSI.2=
8672-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.285:IR-PCI-MSI.2=
4576-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.285:IR-PCI-MSI.3=
0720-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.286:IR-PCI-MSI.3=
9845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.286:IR-PCI-MSI.6=
7125248-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.287:IR-PCI-MSI.6=
7127296-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.288:IR-PCI-MSI.6=
7129344-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.289:IR-PCI-MSI.6=
7129344-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.289:IR-PCI-MSI.6=
7131392-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.290:IR-PCI-MSI.3=
9321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.290:IR-PCI-MSI.6=
7131392-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.290:IR-PCI-MSI.6=
7133440-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.291:IR-PCI-MSI.6=
7133440-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.291:IR-PCI-MSI.6=
7135488-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.292:IR-PCI-MSI.6=
7135488-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.292:IR-PCI-MSI.6=
7137536-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.293:IR-PCI-MSI.3=
9321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.293:IR-PCI-MSI.6=
7135488-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.293:IR-PCI-MSI.6=
7137536-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.293:IR-PCI-MSI.6=
7139584-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.294:IR-PCI-MSI.3=
9321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.294:IR-PCI-MSI.6=
7139584-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.295:IR-PCI-MSI.3=
9321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.295:IR-PCI-MSI.3=
9321602-edge.nvme0q2
>       0.00          -100.0%       0.00        interrupts.295:IR-PCI-MSI.3=
9845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.296:IR-PCI-MSI.3=
9321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.296:IR-PCI-MSI.3=
9845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.297:IR-PCI-MSI.3=
9845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.301:IR-PCI-MSI.3=
9321608-edge.nvme0q8
>       0.00          -100.0%       0.00        interrupts.302:IR-PCI-MSI.3=
9321605-edge.nvme0q5
>       0.00          -100.0%       0.00        interrupts.302:IR-PCI-MSI.3=
9321606-edge.nvme0q6
>       0.00          -100.0%       0.00        interrupts.303:IR-PCI-MSI.3=
9321608-edge.nvme0q8
>       0.00          -100.0%       0.00        interrupts.310:IR-PCI-MSI.3=
9321615-edge.nvme0q15
>       0.00          -100.0%       0.00        interrupts.313:IR-PCI-MSI.3=
9321618-edge.nvme0q18
>       0.00          -100.0%       0.00        interrupts.315:IR-PCI-MSI.6=
7137536-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.323:IR-PCI-MSI.3=
9321627-edge.nvme0q27
>       0.00          -100.0%       0.00        interrupts.328:IR-PCI-MSI.3=
9321632-edge.nvme0q32
>       0.00          -100.0%       0.00        interrupts.331:IR-PCI-MSI.3=
9321635-edge.nvme0q35
>       0.00          -100.0%       0.00        interrupts.338:IR-PCI-MSI.3=
9321644-edge.nvme0q44
>       0.00          -100.0%       0.00        interrupts.339:IR-PCI-MSI.3=
9321643-edge.nvme0q43
>       0.00          -100.0%       0.00        interrupts.342:IR-PCI-MSI.3=
9321647-edge.nvme0q47
>       0.00          -100.0%       0.00        interrupts.347:IR-PCI-MSI.3=
9321651-edge.nvme0q51
>       0.00          -100.0%       0.00        interrupts.356:IR-PCI-MSI.3=
9321661-edge.nvme0q61
>       0.00          -100.0%       0.00        interrupts.357:IR-PCI-MSI.3=
9321660-edge.nvme0q60
>       0.00          -100.0%       0.00        interrupts.357:IR-PCI-MSI.3=
9321662-edge.nvme0q62
>       0.00          -100.0%       0.00        interrupts.362:IR-PCI-MSI.3=
9321667-edge.nvme0q67
>       0.00          -100.0%       0.00        interrupts.365:IR-PCI-MSI.3=
9321641-edge.nvme0q41
>       0.00          -100.0%       0.00        interrupts.366:IR-PCI-MSI.3=
9321670-edge.nvme0q70
>       0.00          -100.0%       0.00        interrupts.367:IR-PCI-MSI.3=
9321671-edge.nvme0q71
>       0.00          -100.0%       0.00        interrupts.367:IR-PCI-MSI.3=
9321672-edge.nvme0q72
>       0.00          -100.0%       0.00        interrupts.368:IR-PCI-MSI.3=
9321672-edge.nvme0q72
>       0.00          -100.0%       0.00        interrupts.368:IR-PCI-MSI.3=
9845929-edge.nvme1q41
>       0.00          -100.0%       0.00        interrupts.369:IR-PCI-MSI.3=
9321673-edge.nvme0q73
>       0.00          -100.0%       0.00        interrupts.370:IR-PCI-MSI.3=
9845925-edge.nvme1q37
>       0.00          -100.0%       0.00        interrupts.371:IR-PCI-MSI.3=
9321676-edge.nvme0q76
>       0.00          -100.0%       0.00        interrupts.372:IR-PCI-MSI.3=
9321675-edge.nvme0q75
>       0.00          -100.0%       0.00        interrupts.374:IR-PCI-MSI.3=
9321678-edge.nvme0q78
>       0.00          -100.0%       0.00        interrupts.374:IR-PCI-MSI.3=
9321679-edge.nvme0q79
>       0.00          -100.0%       0.00        interrupts.374:IR-PCI-MSI.3=
9845927-edge.nvme1q39
>       0.00          -100.0%       0.00        interrupts.376:IR-PCI-MSI.3=
9321680-edge.nvme0q80
>       0.00          -100.0%       0.00        interrupts.376:IR-PCI-MSI.3=
9321681-edge.nvme0q81
>       0.00          -100.0%       0.00        interrupts.378:IR-PCI-MSI.3=
9321683-edge.nvme0q83
>       0.00          -100.0%       0.00        interrupts.379:IR-PCI-MSI.3=
9321685-edge.nvme0q85
>       0.00          -100.0%       0.00        interrupts.381:IR-PCI-MSI.3=
9321686-edge.nvme0q86
>       0.00          -100.0%       0.00        interrupts.382:IR-PCI-MSI.3=
9321686-edge.nvme0q86
>       0.00          -100.0%       0.00        interrupts.382:IR-PCI-MSI.3=
9321687-edge.nvme0q87
>       0.00          -100.0%       0.00        interrupts.382:IR-PCI-MSI.3=
9321688-edge.nvme0q88
>       0.00          -100.0%       0.00        interrupts.383:IR-PCI-MSI.3=
9321687-edge.nvme0q87
>       0.00          -100.0%       0.00        interrupts.385:IR-PCI-MSI.3=
9321690-edge.nvme0q90
>       0.00          -100.0%       0.00        interrupts.389:IR-PCI-MSI.3=
9321694-edge.nvme0q94
>       0.00          -100.0%       0.00        interrupts.392:IR-PCI-MSI.3=
9321696-edge.nvme0q96
>       0.00          -100.0%       0.00        interrupts.394:IR-PCI-MSI.3=
9321699-edge.nvme0q99
>       0.00          -100.0%       0.00        interrupts.395:IR-PCI-MSI.3=
9321700-edge.nvme0q100
>       0.00          -100.0%       0.00        interrupts.396:IR-PCI-MSI.3=
9321700-edge.nvme0q100
>       0.00          -100.0%       0.00        interrupts.397:IR-PCI-MSI.3=
9321701-edge.nvme0q101
>       0.00          -100.0%       0.00        interrupts.398:IR-PCI-MSI.3=
9321701-edge.nvme0q101
>       0.00          -100.0%       0.00        interrupts.398:IR-PCI-MSI.3=
9321702-edge.nvme0q102
>       0.00          -100.0%       0.00        interrupts.399:IR-PCI-MSI.3=
9321658-edge.nvme0q58
>       0.00          -100.0%       0.00        interrupts.399:IR-PCI-MSI.3=
9321704-edge.nvme0q104
>       0.00          -100.0%       0.00        interrupts.3:IR-IO-APIC.3-e=
dge
>       0.00          -100.0%       0.00        interrupts.401:IR-PCI-MSI.3=
9321653-edge.nvme0q53
>       0.00          -100.0%       0.00        interrupts.401:IR-PCI-MSI.3=
9321707-edge.nvme0q107
>       0.00          -100.0%       0.00        interrupts.402:IR-PCI-MSI.3=
9321707-edge.nvme0q107
>       0.00          -100.0%       0.00        interrupts.403:IR-PCI-MSI.3=
9321654-edge.nvme0q54
>       0.00          -100.0%       0.00        interrupts.403:IR-PCI-MSI.3=
9321708-edge.nvme0q108
>       0.00          -100.0%       0.00        interrupts.404:IR-PCI-MSI.3=
9321707-edge.nvme0q107
>       0.00          -100.0%       0.00        interrupts.404:IR-PCI-MSI.3=
9321708-edge.nvme0q108
>       0.00          -100.0%       0.00        interrupts.406:IR-PCI-MSI.3=
9321709-edge.nvme0q109
>       0.00          -100.0%       0.00        interrupts.407:IR-PCI-MSI.3=
9321711-edge.nvme0q111
>       0.00          -100.0%       0.00        interrupts.408:IR-PCI-MSI.3=
9321711-edge.nvme0q111
>       0.00          -100.0%       0.00        interrupts.408:IR-PCI-MSI.3=
9321713-edge.nvme0q113
>       0.00          -100.0%       0.00        interrupts.408:IR-PCI-MSI.3=
9845949-edge.nvme1q61
>       0.00          -100.0%       0.00        interrupts.412:IR-PCI-MSI.3=
9321716-edge.nvme0q116
>       0.00          -100.0%       0.00        interrupts.412:IR-PCI-MSI.3=
9321717-edge.nvme0q117
>       0.00          -100.0%       0.00        interrupts.413:IR-PCI-MSI.3=
9321717-edge.nvme0q117
>       0.00          -100.0%       0.00        interrupts.413:IR-PCI-MSI.3=
9321718-edge.nvme0q118
>       0.00          -100.0%       0.00        interrupts.413:IR-PCI-MSI.3=
9321719-edge.nvme0q119
>       0.00          -100.0%       0.00        interrupts.414:IR-PCI-MSI.3=
9321718-edge.nvme0q118
>       0.00          -100.0%       0.00        interrupts.414:IR-PCI-MSI.3=
9321719-edge.nvme0q119
>       0.00          -100.0%       0.00        interrupts.414:IR-PCI-MSI.3=
9845952-edge.nvme1q64
>       0.00          -100.0%       0.00        interrupts.415:IR-PCI-MSI.3=
9321720-edge.nvme0q120
>       0.00          -100.0%       0.00        interrupts.416:IR-PCI-MSI.3=
9321720-edge.nvme0q120
>       0.00          -100.0%       0.00        interrupts.416:IR-PCI-MSI.3=
9845948-edge.nvme1q60
>       0.00          -100.0%       0.00        interrupts.418:IR-PCI-MSI.3=
9321724-edge.nvme0q124
>       0.00          -100.0%       0.00        interrupts.419:IR-PCI-MSI.3=
9321724-edge.nvme0q124
>       0.00          -100.0%       0.00        interrupts.420:IR-PCI-MSI.3=
9321725-edge.nvme0q125
>       0.00          -100.0%       0.00        interrupts.420:IR-PCI-MSI.3=
9845950-edge.nvme1q62
>       0.00          -100.0%       0.00        interrupts.421:IR-PCI-MSI.3=
9321669-edge.nvme0q69
>       0.00          -100.0%       0.00        interrupts.422:IR-PCI-MSI.3=
9321725-edge.nvme0q125
>       0.00          -100.0%       0.00        interrupts.423:IR-PCI-MSI.3=
9321727-edge.nvme0q127
>       0.00          -100.0%       0.00        interrupts.423:IR-PCI-MSI.6=
7139584-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.424:IR-PCI-MSI.3=
9321727-edge.nvme0q127
>       0.00          -100.0%       0.00        interrupts.424:IR-PCI-MSI.3=
9321728-edge.nvme0q128
>       0.00          -100.0%       0.00        interrupts.424:IR-PCI-MSI.3=
9845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.425:IR-PCI-MSI.3=
9845890-edge.nvme1q2
>       0.00          -100.0%       0.00        interrupts.426:IR-PCI-MSI.3=
9845889-edge.nvme1q1
>       0.00          -100.0%       0.00        interrupts.426:IR-PCI-MSI.3=
9845890-edge.nvme1q2
>       0.00          -100.0%       0.00        interrupts.426:IR-PCI-MSI.3=
9845958-edge.nvme1q70
>       0.00          -100.0%       0.00        interrupts.428:IR-PCI-MSI.3=
9845891-edge.nvme1q3
>       0.00          -100.0%       0.00        interrupts.429:IR-PCI-MSI.3=
9845892-edge.nvme1q4
>       0.00          -100.0%       0.00        interrupts.429:IR-PCI-MSI.3=
9845893-edge.nvme1q5
>       0.00          -100.0%       0.00        interrupts.430:IR-PCI-MSI.3=
9845894-edge.nvme1q6
>       0.00          -100.0%       0.00        interrupts.431:IR-PCI-MSI.3=
9845894-edge.nvme1q6
>       0.00          -100.0%       0.00        interrupts.431:IR-PCI-MSI.3=
9845895-edge.nvme1q7
>       0.00          -100.0%       0.00        interrupts.432:IR-PCI-MSI.3=
9845896-edge.nvme1q8
>       0.00          -100.0%       0.00        interrupts.433:IR-PCI-MSI.3=
9321669-edge.nvme0q69
>       0.00          -100.0%       0.00        interrupts.436:IR-PCI-MSI.3=
9845900-edge.nvme1q12
>       0.00          -100.0%       0.00        interrupts.437:IR-PCI-MSI.3=
9321677-edge.nvme0q77
>       0.00          -100.0%       0.00        interrupts.438:IR-PCI-MSI.3=
9845902-edge.nvme1q14
>       0.00          -100.0%       0.00        interrupts.438:IR-PCI-MSI.3=
9845903-edge.nvme1q15
>       0.00          -100.0%       0.00        interrupts.439:IR-PCI-MSI.3=
9845904-edge.nvme1q16
>       0.00          -100.0%       0.00        interrupts.441:IR-PCI-MSI.3=
9845906-edge.nvme1q18
>       0.00          -100.0%       0.00        interrupts.444:IR-PCI-MSI.3=
9845907-edge.nvme1q19
>       0.00          -100.0%       0.00        interrupts.444:IR-PCI-MSI.3=
9845908-edge.nvme1q20
>       0.00          -100.0%       0.00        interrupts.444:IR-PCI-MSI.3=
9845962-edge.nvme1q74
>       0.00          -100.0%       0.00        interrupts.445:IR-PCI-MSI.3=
9321675-edge.nvme0q75
>       0.00          -100.0%       0.00        interrupts.447:IR-PCI-MSI.3=
9321676-edge.nvme0q76
>       0.00          -100.0%       0.00        interrupts.448:IR-PCI-MSI.3=
9845912-edge.nvme1q24
>       0.00          -100.0%       0.00        interrupts.450:IR-PCI-MSI.3=
9845913-edge.nvme1q25
>       0.00          -100.0%       0.00        interrupts.458:IR-PCI-MSI.3=
9845922-edge.nvme1q34
>       0.00          -100.0%       0.00        interrupts.458:IR-PCI-MSI.3=
9845969-edge.nvme1q81
>       0.00          -100.0%       0.00        interrupts.459:IR-PCI-MSI.3=
9845923-edge.nvme1q35
>       0.00          -100.0%       0.00        interrupts.463:IR-PCI-MSI.3=
9845928-edge.nvme1q40
>       0.00          -100.0%       0.00        interrupts.464:IR-PCI-MSI.3=
9845972-edge.nvme1q84
>       0.00          -100.0%       0.00        interrupts.464:IR-PCI-MSI.3=
9845977-edge.nvme1q89
>       0.00          -100.0%       0.00        interrupts.465:IR-PCI-MSI.3=
9845928-edge.nvme1q40
>       0.00          -100.0%       0.00        interrupts.465:IR-PCI-MSI.3=
9845929-edge.nvme1q41
>       0.00          -100.0%       0.00        interrupts.465:IR-PCI-MSI.3=
9845930-edge.nvme1q42
>       0.00          -100.0%       0.00        interrupts.467:IR-PCI-MSI.3=
9845931-edge.nvme1q43
>       0.00          -100.0%       0.00        interrupts.468:IR-PCI-MSI.3=
9845932-edge.nvme1q44
>       0.00          -100.0%       0.00        interrupts.469:IR-PCI-MSI.3=
9845933-edge.nvme1q45
>       0.00          -100.0%       0.00        interrupts.470:IR-PCI-MSI.3=
9845935-edge.nvme1q47
>       0.00          -100.0%       0.00        interrupts.471:IR-PCI-MSI.3=
9321694-edge.nvme0q94
>       0.00          -100.0%       0.00        interrupts.472:IR-PCI-MSI.3=
9845937-edge.nvme1q49
>       0.00          -100.0%       0.00        interrupts.475:IR-PCI-MSI.3=
9321696-edge.nvme0q96
>       0.00          -100.0%       0.00        interrupts.475:IR-PCI-MSI.3=
9845939-edge.nvme1q51
>       0.00          -100.0%       0.00        interrupts.476:IR-PCI-MSI.3=
9845940-edge.nvme1q52
>       0.00          -100.0%       0.00        interrupts.476:IR-PCI-MSI.3=
9845941-edge.nvme1q53
>       0.00          -100.0%       0.00        interrupts.478:IR-PCI-MSI.3=
9845942-edge.nvme1q54
>       0.00          -100.0%       0.00        interrupts.480:IR-PCI-MSI.3=
9845944-edge.nvme1q56
>       0.00          -100.0%       0.00        interrupts.481:IR-PCI-MSI.3=
9845944-edge.nvme1q56
>       0.00          -100.0%       0.00        interrupts.481:IR-PCI-MSI.3=
9845945-edge.nvme1q57
>       0.00          -100.0%       0.00        interrupts.482:IR-PCI-MSI.3=
9845945-edge.nvme1q57
>       0.00          -100.0%       0.00        interrupts.485:IR-PCI-MSI.3=
9845948-edge.nvme1q60
>       0.00          -100.0%       0.00        interrupts.487:IR-PCI-MSI.3=
9845951-edge.nvme1q63
>       0.00          -100.0%       0.00        interrupts.488:IR-PCI-MSI.3=
9845989-edge.nvme1q101
>       0.00          -100.0%       0.00        interrupts.490:IR-PCI-MSI.3=
9845954-edge.nvme1q66
>       0.00          -100.0%       0.00        interrupts.494:IR-PCI-MSI.3=
9845958-edge.nvme1q70
>       0.00          -100.0%       0.00        interrupts.495:IR-PCI-MSI.3=
9845959-edge.nvme1q71
>       0.00          -100.0%       0.00        interrupts.496:IR-PCI-MSI.3=
9845960-edge.nvme1q72
>       0.00          -100.0%       0.00        interrupts.497:IR-PCI-MSI.3=
9321701-edge.nvme0q101
>       0.00          -100.0%       0.00        interrupts.497:IR-PCI-MSI.3=
9845961-edge.nvme1q73
>       0.00          -100.0%       0.00        interrupts.498:IR-PCI-MSI.3=
9845962-edge.nvme1q74
>       0.00          -100.0%       0.00        interrupts.499:IR-PCI-MSI.3=
9321708-edge.nvme0q108
>       0.00          -100.0%       0.00        interrupts.499:IR-PCI-MSI.3=
9845963-edge.nvme1q75
>      19.00 =C2=B1100%     -66.7%       6.33 =C2=B1223%  interrupts.4:IR-I=
O-APIC.4-edge.ttyS0
>       0.00          -100.0%       0.00        interrupts.500:IR-PCI-MSI.3=
9845964-edge.nvme1q76
>       0.00          -100.0%       0.00        interrupts.501:IR-PCI-MSI.3=
9845966-edge.nvme1q78
>       0.00          -100.0%       0.00        interrupts.502:IR-PCI-MSI.3=
9845966-edge.nvme1q78
>       0.00          -100.0%       0.00        interrupts.502:IR-PCI-MSI.3=
9845967-edge.nvme1q79
>       0.00          -100.0%       0.00        interrupts.504:IR-PCI-MSI.3=
9845969-edge.nvme1q81
>       0.00          -100.0%       0.00        interrupts.505:IR-PCI-MSI.3=
9321711-edge.nvme0q111
>       0.00          -100.0%       0.00        interrupts.506:IR-PCI-MSI.3=
9845970-edge.nvme1q82
>       0.00          -100.0%       0.00        interrupts.507:IR-PCI-MSI.3=
9321706-edge.nvme0q106
>       0.00          -100.0%       0.00        interrupts.510:IR-PCI-MSI.3=
9845995-edge.nvme1q107
>       0.00          -100.0%       0.00        interrupts.511:IR-PCI-MSI.3=
9321708-edge.nvme0q108
>       0.00          -100.0%       0.00        interrupts.511:IR-PCI-MSI.3=
9845975-edge.nvme1q87
>       0.00          -100.0%       0.00        interrupts.512:IR-PCI-MSI.3=
9845976-edge.nvme1q88
>       0.00          -100.0%       0.00        interrupts.512:IR-PCI-MSI.3=
9845977-edge.nvme1q89
>       0.00          -100.0%       0.00        interrupts.513:IR-PCI-MSI.3=
9845977-edge.nvme1q89
>       0.00          -100.0%       0.00        interrupts.514:IR-PCI-MSI.3=
9845978-edge.nvme1q90
>       0.00          -100.0%       0.00        interrupts.515:IR-PCI-MSI.3=
9845979-edge.nvme1q91
>       0.00          -100.0%       0.00        interrupts.516:IR-PCI-MSI.3=
9845980-edge.nvme1q92
>       0.00          -100.0%       0.00        interrupts.517:IR-PCI-MSI.3=
9845981-edge.nvme1q93
>       0.00          -100.0%       0.00        interrupts.518:IR-PCI-MSI.3=
9845982-edge.nvme1q94
>       0.00          -100.0%       0.00        interrupts.519:IR-PCI-MSI.3=
9845983-edge.nvme1q95
>       0.00          -100.0%       0.00        interrupts.520:IR-PCI-MSI.3=
9845984-edge.nvme1q96
>       0.00          -100.0%       0.00        interrupts.521:IR-PCI-MSI.3=
9845985-edge.nvme1q97
>       0.00          -100.0%       0.00        interrupts.522:IR-PCI-MSI.3=
9845986-edge.nvme1q98
>       0.00          -100.0%       0.00        interrupts.522:IR-PCI-MSI.3=
9846001-edge.nvme1q113
>       0.00          -100.0%       0.00        interrupts.524:IR-PCI-MSI.3=
9845988-edge.nvme1q100
>       0.00          -100.0%       0.00        interrupts.525:IR-PCI-MSI.3=
9845989-edge.nvme1q101
>       0.00          -100.0%       0.00        interrupts.526:IR-PCI-MSI.3=
9845990-edge.nvme1q102
>       0.00          -100.0%       0.00        interrupts.528:IR-PCI-MSI.3=
9845992-edge.nvme1q104
>       0.00          -100.0%       0.00        interrupts.529:IR-PCI-MSI.3=
9845993-edge.nvme1q105
>       0.00          -100.0%       0.00        interrupts.530:IR-PCI-MSI.3=
9846005-edge.nvme1q117
>       0.00          -100.0%       0.00        interrupts.531:IR-PCI-MSI.3=
9845995-edge.nvme1q107
>       0.00          -100.0%       0.00        interrupts.532:IR-PCI-MSI.3=
9845996-edge.nvme1q108
>       0.00          -100.0%       0.00        interrupts.534:IR-PCI-MSI.3=
9845999-edge.nvme1q111
>       0.00          -100.0%       0.00        interrupts.536:IR-PCI-MSI.3=
9846000-edge.nvme1q112
>       0.00          -100.0%       0.00        interrupts.536:IR-PCI-MSI.3=
9846008-edge.nvme1q120
>       0.00          -100.0%       0.00        interrupts.537:IR-PCI-MSI.3=
9846001-edge.nvme1q113
>       0.00          -100.0%       0.00        interrupts.539:IR-PCI-MSI.3=
9321728-edge.nvme0q128
>       0.00          -100.0%       0.00        interrupts.540:IR-PCI-MSI.3=
9846004-edge.nvme1q116
>       0.00          -100.0%       0.00        interrupts.541:IR-PCI-MSI.3=
9846004-edge.nvme1q116
>       0.00          -100.0%       0.00        interrupts.541:IR-PCI-MSI.3=
9846005-edge.nvme1q117
>       0.00          -100.0%       0.00        interrupts.541:IR-PCI-MSI.3=
9846006-edge.nvme1q118
>       0.00          -100.0%       0.00        interrupts.542:IR-PCI-MSI.2=
6624-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.542:IR-PCI-MSI.3=
9846006-edge.nvme1q118
>       0.00          -100.0%       0.00        interrupts.543:IR-PCI-MSI.3=
9846007-edge.nvme1q119
>       0.00          -100.0%       0.00        interrupts.544:IR-PCI-MSI.2=
8672-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.544:IR-PCI-MSI.3=
9846008-edge.nvme1q120
>       0.00          -100.0%       0.00        interrupts.544:IR-PCI-MSI.3=
9846009-edge.nvme1q121
>       0.00          -100.0%       0.00        interrupts.545:IR-PCI-MSI.3=
0720-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.546:IR-PCI-MSI.3=
9846010-edge.nvme1q122
>       0.00          -100.0%       0.00        interrupts.546:IR-PCI-MSI.6=
7125248-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.547:IR-PCI-MSI.6=
7127296-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.548:IR-PCI-MSI.6=
7129344-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.549:IR-PCI-MSI.3=
9321727-edge.nvme0q127
>       0.00          -100.0%       0.00        interrupts.549:IR-PCI-MSI.6=
7131392-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.550:IR-PCI-MSI.6=
7133440-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.551:IR-PCI-MSI.3=
9846016-edge.nvme1q128
>       0.00          -100.0%       0.00        interrupts.551:IR-PCI-MSI.6=
7135488-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.552:IR-PCI-MSI.6=
7137536-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.553:IR-PCI-MSI.6=
7139584-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.8:IR-IO-APIC.8-e=
dge.rtc0
>       0.00          -100.0%       0.00        interrupts.90:IR-IO-APIC.90=
-fasteoi
>     607.00            -0.1%     606.67        interrupts.9:IR-IO-APIC.9-f=
asteoi.acpi
>     461098 =C2=B1  8%     -10.6%     412063 =C2=B1 11%  interrupts.CAL:Fu=
nction_call_interrupts
>       0.00          -100.0%       0.00        interrupts.CPU0.0:IR-IO-API=
C.2-edge.timer
>       2175 =C2=B1 13%     -13.5%       1882 =C2=B1 34%  interrupts.CPU0.C=
AL:Function_call_interrupts
>       1.67 =C2=B1 66%      +0.0%       1.67 =C2=B1 66%  interrupts.CPU0.I=
WI:IRQ_work_interrupts
>     606989            -4.0%     582549 =C2=B1  9%  interrupts.CPU0.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU0.MCP:Machine=
_check_polls
>       5358 =C2=B1 47%     +15.3%       6179 =C2=B1 41%  interrupts.CPU0.N=
MI:Non-maskable_interrupts
>       5358 =C2=B1 47%     +15.3%       6179 =C2=B1 41%  interrupts.CPU0.P=
MI:Performance_monitoring_interrupts
>     922.83 =C2=B1  5%      +1.0%     932.50 =C2=B1 15%  interrupts.CPU0.R=
ES:Rescheduling_interrupts
>       5.00 =C2=B1 40%     -13.3%       4.33 =C2=B1 51%  interrupts.CPU0.T=
LB:TLB_shootdowns
>     148.67            +9.5%     162.83 =C2=B1 19%  interrupts.CPU1.194:IR=
-PCI-MSI.25690157-edge.eth0-TxRx-45
>       0.00          -100.0%       0.00        interrupts.CPU1.257:IR-PCI-=
MSI.25692204-edge
>       0.00          -100.0%       0.00        interrupts.CPU1.490:IR-PCI-=
MSI.39845954-edge.nvme1q66
>     607.00            -0.1%     606.67        interrupts.CPU1.9:IR-IO-API=
C.9-fasteoi.acpi
>       2432 =C2=B1 30%     -14.3%       2083 =C2=B1 13%  interrupts.CPU1.C=
AL:Function_call_interrupts
>       1.67 =C2=B1 44%     +20.0%       2.00 =C2=B1 57%  interrupts.CPU1.I=
WI:IRQ_work_interrupts
>     606934            -4.3%     580766 =C2=B1  9%  interrupts.CPU1.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU1.MCP:Machine=
_check_polls
>       6259 =C2=B1 14%     +15.0%       7198 =C2=B1 30%  interrupts.CPU1.N=
MI:Non-maskable_interrupts
>       6259 =C2=B1 14%     +15.0%       7198 =C2=B1 30%  interrupts.CPU1.P=
MI:Performance_monitoring_interrupts
>     317.50 =C2=B1 24%     +15.5%     366.67 =C2=B1 31%  interrupts.CPU1.R=
ES:Rescheduling_interrupts
>       6.67 =C2=B1 23%      +7.5%       7.17 =C2=B1  9%  interrupts.CPU1.T=
LB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU10.138:IR-PCI=
-MSI.38862848-edge.PCIe.PME,pciehp
>     148.50            +1.1%     150.17 =C2=B1  2%  interrupts.CPU10.203:I=
R-PCI-MSI.25690166-edge.eth0-TxRx-54
>       0.00          -100.0%       0.00        interrupts.CPU10.266:IR-PCI=
-MSI.25692213-edge
>       0.00          -100.0%       0.00        interrupts.CPU10.372:IR-PCI=
-MSI.39321675-edge.nvme0q75
>       0.00          -100.0%       0.00        interrupts.CPU10.445:IR-PCI=
-MSI.39321675-edge.nvme0q75
>       0.00          -100.0%       0.00        interrupts.CPU10.499:IR-PCI=
-MSI.39845963-edge.nvme1q75
>       2068 =C2=B1 32%     -14.0%       1778 =C2=B1  2%  interrupts.CPU10.=
CAL:Function_call_interrupts
>       0.83 =C2=B1 82%    +100.0%       1.67 =C2=B1 66%  interrupts.CPU10.=
IWI:IRQ_work_interrupts
>     606865            -3.7%     584675 =C2=B1  8%  interrupts.CPU10.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU10.MCP:Machin=
e_check_polls
>       4202 =C2=B1 64%     +57.6%       6624 =C2=B1 22%  interrupts.CPU10.=
NMI:Non-maskable_interrupts
>       4202 =C2=B1 64%     +57.6%       6624 =C2=B1 22%  interrupts.CPU10.=
PMI:Performance_monitoring_interrupts
>     309.83 =C2=B1 10%     +85.5%     574.83 =C2=B1 95%  interrupts.CPU10.=
RES:Rescheduling_interrupts
>       6.83 =C2=B1 23%     -26.8%       5.00 =C2=B1 30%  interrupts.CPU10.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU100.370:IR-PC=
I-MSI.39845925-edge.nvme1q37
>       1785           +19.6%       2135 =C2=B1 27%  interrupts.CPU100.CAL:=
Function_call_interrupts
>     606852            -4.3%     580745 =C2=B1  9%  interrupts.CPU100.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU100.MCP:Machi=
ne_check_polls
>     172.50 =C2=B1 11%     +38.8%     239.50 =C2=B1 89%  interrupts.CPU100=
.NMI:Non-maskable_interrupts
>     172.50 =C2=B1 11%     +38.8%     239.50 =C2=B1 89%  interrupts.CPU100=
.PMI:Performance_monitoring_interrupts
>     658.67 =C2=B1 52%    +163.9%       1738 =C2=B1 57%  interrupts.CPU100=
.RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      -6.7%       7.00 =C2=B1  8%  interrupts.CPU100=
.TLB:TLB_shootdowns
>       1786           +58.1%       2824 =C2=B1 58%  interrupts.CPU101.CAL:=
Function_call_interrupts
>     606833            -5.0%     576287 =C2=B1 11%  interrupts.CPU101.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU101.MCP:Machi=
ne_check_polls
>     203.50 =C2=B1  8%     -20.1%     162.50 =C2=B1 23%  interrupts.CPU101=
.NMI:Non-maskable_interrupts
>     203.50 =C2=B1  8%     -20.1%     162.50 =C2=B1 23%  interrupts.CPU101=
.PMI:Performance_monitoring_interrupts
>     552.83 =C2=B1 55%    +398.8%       2757 =C2=B1 61%  interrupts.CPU101=
.RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      -2.2%       7.33 =C2=B1 10%  interrupts.CPU101=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU102.374:IR-PC=
I-MSI.39845927-edge.nvme1q39
>       1785           +76.8%       3157 =C2=B1 58%  interrupts.CPU102.CAL:=
Function_call_interrupts
>     606746            -5.1%     575575 =C2=B1 11%  interrupts.CPU102.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU102.MCP:Machi=
ne_check_polls
>     189.83 =C2=B1  9%      -9.0%     172.67 =C2=B1 27%  interrupts.CPU102=
.NMI:Non-maskable_interrupts
>     189.83 =C2=B1  9%      -9.0%     172.67 =C2=B1 27%  interrupts.CPU102=
.PMI:Performance_monitoring_interrupts
>     525.67 =C2=B1 87%    +406.1%       2660 =C2=B1 81%  interrupts.CPU102=
.RES:Rescheduling_interrupts
>       7.83 =C2=B1  4%      -4.3%       7.50 =C2=B1 14%  interrupts.CPU102=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU103.463:IR-PC=
I-MSI.39845928-edge.nvme1q40
>       0.00          -100.0%       0.00        interrupts.CPU103.465:IR-PC=
I-MSI.39845928-edge.nvme1q40
>       2329 =C2=B1 52%     +29.1%       3007 =C2=B1 51%  interrupts.CPU103=
.CAL:Function_call_interrupts
>     606793            -2.7%     590576 =C2=B1  5%  interrupts.CPU103.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU103.MCP:Machi=
ne_check_polls
>     207.33 =C2=B1 11%     -11.4%     183.67 =C2=B1 41%  interrupts.CPU103=
.NMI:Non-maskable_interrupts
>     207.33 =C2=B1 11%     -11.4%     183.67 =C2=B1 41%  interrupts.CPU103=
.PMI:Performance_monitoring_interrupts
>     480.50 =C2=B1 70%    +298.9%       1916 =C2=B1 74%  interrupts.CPU103=
.RES:Rescheduling_interrupts
>       7.83 =C2=B1  4%      -6.4%       7.33 =C2=B1  6%  interrupts.CPU103=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU104.365:IR-PC=
I-MSI.39321641-edge.nvme0q41
>       0.00          -100.0%       0.00        interrupts.CPU104.368:IR-PC=
I-MSI.39845929-edge.nvme1q41
>       0.00          -100.0%       0.00        interrupts.CPU104.465:IR-PC=
I-MSI.39845929-edge.nvme1q41
>       1790            +6.5%       1905 =C2=B1 13%  interrupts.CPU104.CAL:=
Function_call_interrupts
>     606750            -3.3%     586693 =C2=B1  7%  interrupts.CPU104.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU104.MCP:Machi=
ne_check_polls
>     174.83 =C2=B1  6%      +5.7%     184.83 =C2=B1 35%  interrupts.CPU104=
.NMI:Non-maskable_interrupts
>     174.83 =C2=B1  6%      +5.7%     184.83 =C2=B1 35%  interrupts.CPU104=
.PMI:Performance_monitoring_interrupts
>       1558 =C2=B1135%      -1.9%       1528 =C2=B1 98%  interrupts.CPU104=
.RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      +4.4%       7.83 =C2=B1  4%  interrupts.CPU104=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU105.465:IR-PC=
I-MSI.39845930-edge.nvme1q42
>       2749 =C2=B1 78%     -10.2%       2468 =C2=B1 45%  interrupts.CPU105=
.CAL:Function_call_interrupts
>     606840            -4.0%     582838 =C2=B1  8%  interrupts.CPU105.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU105.MCP:Machi=
ne_check_polls
>     214.33 =C2=B1 18%     +40.0%     300.00 =C2=B1 96%  interrupts.CPU105=
.NMI:Non-maskable_interrupts
>     214.33 =C2=B1 18%     +40.0%     300.00 =C2=B1 96%  interrupts.CPU105=
.PMI:Performance_monitoring_interrupts
>       1371 =C2=B1151%      -0.9%       1360 =C2=B1 62%  interrupts.CPU105=
.RES:Rescheduling_interrupts
>       7.17 =C2=B1  9%      -2.3%       7.00 =C2=B1  8%  interrupts.CPU105=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU106.339:IR-PC=
I-MSI.39321643-edge.nvme0q43
>       0.00          -100.0%       0.00        interrupts.CPU106.467:IR-PC=
I-MSI.39845931-edge.nvme1q43
>       2284 =C2=B1 48%      -8.6%       2088 =C2=B1 30%  interrupts.CPU106=
.CAL:Function_call_interrupts
>     606792            -3.5%     585340 =C2=B1  7%  interrupts.CPU106.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU106.MCP:Machi=
ne_check_polls
>     188.83 =C2=B1  9%     -23.2%     145.00 =C2=B1 26%  interrupts.CPU106=
.NMI:Non-maskable_interrupts
>     188.83 =C2=B1  9%     -23.2%     145.00 =C2=B1 26%  interrupts.CPU106=
.PMI:Performance_monitoring_interrupts
>       1149 =C2=B1161%     -25.7%     853.50 =C2=B1 82%  interrupts.CPU106=
.RES:Rescheduling_interrupts
>       8.00           -14.6%       6.83 =C2=B1  5%  interrupts.CPU106.TLB:=
TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU107.338:IR-PC=
I-MSI.39321644-edge.nvme0q44
>       0.00          -100.0%       0.00        interrupts.CPU107.468:IR-PC=
I-MSI.39845932-edge.nvme1q44
>       1797            +5.3%       1893 =C2=B1  6%  interrupts.CPU107.CAL:=
Function_call_interrupts
>     606751            -3.4%     586138 =C2=B1  7%  interrupts.CPU107.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU107.MCP:Machi=
ne_check_polls
>     195.83 =C2=B1  5%     -33.0%     131.17 =C2=B1 27%  interrupts.CPU107=
.NMI:Non-maskable_interrupts
>     195.83 =C2=B1  5%     -33.0%     131.17 =C2=B1 27%  interrupts.CPU107=
.PMI:Performance_monitoring_interrupts
>     530.33 =C2=B1 82%    +226.2%       1730 =C2=B1 95%  interrupts.CPU107=
.RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      -6.5%       7.17 =C2=B1  9%  interrupts.CPU107=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU108.469:IR-PC=
I-MSI.39845933-edge.nvme1q45
>       1580 =C2=B1 30%     +14.0%       1802 =C2=B1  2%  interrupts.CPU108=
.CAL:Function_call_interrupts
>       0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU108.IWI:=
IRQ_work_interrupts
>     606841            -3.5%     585600 =C2=B1  7%  interrupts.CPU108.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU108.MCP:Machi=
ne_check_polls
>     194.67 =C2=B1 14%     -19.3%     157.17 =C2=B1 24%  interrupts.CPU108=
.NMI:Non-maskable_interrupts
>     194.67 =C2=B1 14%     -19.3%     157.17 =C2=B1 24%  interrupts.CPU108=
.PMI:Performance_monitoring_interrupts
>     690.50 =C2=B1 90%     +41.6%     977.67 =C2=B1 63%  interrupts.CPU108=
.RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%     -10.9%       6.83 =C2=B1 10%  interrupts.CPU108=
.TLB:TLB_shootdowns
>       1788            +0.2%       1792        interrupts.CPU109.CAL:Funct=
ion_call_interrupts
>     606973            -5.1%     575820 =C2=B1 11%  interrupts.CPU109.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU109.MCP:Machi=
ne_check_polls
>     182.83 =C2=B1 24%     -14.6%     156.17 =C2=B1 25%  interrupts.CPU109=
.NMI:Non-maskable_interrupts
>     182.83 =C2=B1 24%     -14.6%     156.17 =C2=B1 25%  interrupts.CPU109=
.PMI:Performance_monitoring_interrupts
>     693.50 =C2=B1 99%      +3.4%     717.00 =C2=B1 67%  interrupts.CPU109=
.RES:Rescheduling_interrupts
>       8.17 =C2=B1  8%      -8.2%       7.50 =C2=B1  6%  interrupts.CPU109=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU11.139:IR-PCI=
-MSI.38879232-edge.PCIe.PME,pciehp
>     149.67            +4.1%     155.83 =C2=B1 10%  interrupts.CPU11.204:I=
R-PCI-MSI.25690167-edge.eth0-TxRx-55
>       0.00          -100.0%       0.00        interrupts.CPU11.267:IR-PCI=
-MSI.25692214-edge
>       0.00          -100.0%       0.00        interrupts.CPU11.371:IR-PCI=
-MSI.39321676-edge.nvme0q76
>       0.00          -100.0%       0.00        interrupts.CPU11.447:IR-PCI=
-MSI.39321676-edge.nvme0q76
>       0.00          -100.0%       0.00        interrupts.CPU11.500:IR-PCI=
-MSI.39845964-edge.nvme1q76
>       1768            -3.7%       1702 =C2=B1  7%  interrupts.CPU11.CAL:F=
unction_call_interrupts
>       1.17 =C2=B1 58%     +42.9%       1.67 =C2=B1 74%  interrupts.CPU11.=
IWI:IRQ_work_interrupts
>     606926            -3.8%     583803 =C2=B1  8%  interrupts.CPU11.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU11.MCP:Machin=
e_check_polls
>       5214 =C2=B1 34%     +16.2%       6057 =C2=B1 49%  interrupts.CPU11.=
NMI:Non-maskable_interrupts
>       5214 =C2=B1 34%     +16.2%       6057 =C2=B1 49%  interrupts.CPU11.=
PMI:Performance_monitoring_interrupts
>     366.67 =C2=B1 35%     -10.9%     326.83 =C2=B1 33%  interrupts.CPU11.=
RES:Rescheduling_interrupts
>       5.67 =C2=B1 37%      +2.9%       5.83 =C2=B1 18%  interrupts.CPU11.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU110.342:IR-PC=
I-MSI.39321647-edge.nvme0q47
>       0.00          -100.0%       0.00        interrupts.CPU110.470:IR-PC=
I-MSI.39845935-edge.nvme1q47
>       1828 =C2=B1  4%      -1.6%       1799        interrupts.CPU110.CAL:=
Function_call_interrupts
>     606950            -5.1%     576123 =C2=B1 11%  interrupts.CPU110.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU110.MCP:Machi=
ne_check_polls
>     171.00 =C2=B1 15%      -8.9%     155.83 =C2=B1 24%  interrupts.CPU110=
.NMI:Non-maskable_interrupts
>     171.00 =C2=B1 15%      -8.9%     155.83 =C2=B1 24%  interrupts.CPU110=
.PMI:Performance_monitoring_interrupts
>     418.67 =C2=B1 29%    +135.9%     987.67 =C2=B1 94%  interrupts.CPU110=
.RES:Rescheduling_interrupts
>       7.83 =C2=B1  8%      -6.4%       7.33 =C2=B1 10%  interrupts.CPU110=
.TLB:TLB_shootdowns
>       1794            +0.0%       1795        interrupts.CPU111.CAL:Funct=
ion_call_interrupts
>     606693            -4.6%     579004 =C2=B1 10%  interrupts.CPU111.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU111.MCP:Machi=
ne_check_polls
>     283.50 =C2=B1 75%     -45.7%     153.83 =C2=B1 21%  interrupts.CPU111=
.NMI:Non-maskable_interrupts
>     283.50 =C2=B1 75%     -45.7%     153.83 =C2=B1 21%  interrupts.CPU111=
.PMI:Performance_monitoring_interrupts
>     737.83 =C2=B1 91%     -28.2%     529.67 =C2=B1 66%  interrupts.CPU111=
.RES:Rescheduling_interrupts
>       8.50 =C2=B1 30%     -11.8%       7.50 =C2=B1 10%  interrupts.CPU111=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU112.472:IR-PC=
I-MSI.39845937-edge.nvme1q49
>       1791            +2.3%       1833 =C2=B1  5%  interrupts.CPU112.CAL:=
Function_call_interrupts
>     606820            -3.0%     588625 =C2=B1  6%  interrupts.CPU112.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU112.MCP:Machi=
ne_check_polls
>     170.33 =C2=B1 10%     -29.1%     120.83 =C2=B1 27%  interrupts.CPU112=
.NMI:Non-maskable_interrupts
>     170.33 =C2=B1 10%     -29.1%     120.83 =C2=B1 27%  interrupts.CPU112=
.PMI:Performance_monitoring_interrupts
>     762.00 =C2=B1120%     -36.7%     482.17 =C2=B1 62%  interrupts.CPU112=
.RES:Rescheduling_interrupts
>       7.33 =C2=B1 10%      +4.5%       7.67 =C2=B1  9%  interrupts.CPU112=
.TLB:TLB_shootdowns
>       1786           +37.8%       2462 =C2=B1 61%  interrupts.CPU113.CAL:=
Function_call_interrupts
>     606765            -4.0%     582621 =C2=B1  9%  interrupts.CPU113.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU113.MCP:Machi=
ne_check_polls
>     189.00 =C2=B1  7%     -28.9%     134.33 =C2=B1 28%  interrupts.CPU113=
.NMI:Non-maskable_interrupts
>     189.00 =C2=B1  7%     -28.9%     134.33 =C2=B1 28%  interrupts.CPU113=
.PMI:Performance_monitoring_interrupts
>       1029 =C2=B1149%     +45.8%       1500 =C2=B1111%  interrupts.CPU113=
.RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      +0.0%       7.67 =C2=B1  6%  interrupts.CPU113=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU114.347:IR-PC=
I-MSI.39321651-edge.nvme0q51
>       0.00          -100.0%       0.00        interrupts.CPU114.475:IR-PC=
I-MSI.39845939-edge.nvme1q51
>       1786           +11.8%       1997 =C2=B1 23%  interrupts.CPU114.CAL:=
Function_call_interrupts
>     606951            -4.8%     577702 =C2=B1 10%  interrupts.CPU114.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU114.MCP:Machi=
ne_check_polls
>     195.00 =C2=B1 12%     +18.9%     231.83 =C2=B1 78%  interrupts.CPU114=
.NMI:Non-maskable_interrupts
>     195.00 =C2=B1 12%     +18.9%     231.83 =C2=B1 78%  interrupts.CPU114=
.PMI:Performance_monitoring_interrupts
>     640.00 =C2=B1 81%     +13.9%     728.67 =C2=B1114%  interrupts.CPU114=
.RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      -2.2%       7.33 =C2=B1 26%  interrupts.CPU114=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU115.476:IR-PC=
I-MSI.39845940-edge.nvme1q52
>       1791           +23.7%       2216 =C2=B1 38%  interrupts.CPU115.CAL:=
Function_call_interrupts
>     607578            -4.0%     583434 =C2=B1  8%  interrupts.CPU115.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU115.MCP:Machi=
ne_check_polls
>     162.00 =C2=B1  9%     -14.5%     138.50 =C2=B1 35%  interrupts.CPU115=
.NMI:Non-maskable_interrupts
>     162.00 =C2=B1  9%     -14.5%     138.50 =C2=B1 35%  interrupts.CPU115=
.PMI:Performance_monitoring_interrupts
>     549.50 =C2=B1 73%    +161.4%       1436 =C2=B1 82%  interrupts.CPU115=
.RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      -2.2%       7.50 =C2=B1 12%  interrupts.CPU115=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU116.401:IR-PC=
I-MSI.39321653-edge.nvme0q53
>       0.00          -100.0%       0.00        interrupts.CPU116.476:IR-PC=
I-MSI.39845941-edge.nvme1q53
>       1856 =C2=B1  5%      -3.7%       1787        interrupts.CPU116.CAL:=
Function_call_interrupts
>     608452            -4.7%     580064 =C2=B1 10%  interrupts.CPU116.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU116.MCP:Machi=
ne_check_polls
>     187.17 =C2=B1 22%     -21.5%     146.83 =C2=B1 35%  interrupts.CPU116=
.NMI:Non-maskable_interrupts
>     187.17 =C2=B1 22%     -21.5%     146.83 =C2=B1 35%  interrupts.CPU116=
.PMI:Performance_monitoring_interrupts
>       1029 =C2=B1 84%     -47.3%     543.00 =C2=B1 71%  interrupts.CPU116=
.RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      +4.4%       7.83 =C2=B1  8%  interrupts.CPU116=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU117.403:IR-PC=
I-MSI.39321654-edge.nvme0q54
>       0.00          -100.0%       0.00        interrupts.CPU117.478:IR-PC=
I-MSI.39845942-edge.nvme1q54
>       1823 =C2=B1  2%      -1.6%       1795        interrupts.CPU117.CAL:=
Function_call_interrupts
>     607632            -3.0%     589621 =C2=B1  6%  interrupts.CPU117.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU117.MCP:Machi=
ne_check_polls
>     185.17 =C2=B1 22%     -29.5%     130.50 =C2=B1 30%  interrupts.CPU117=
.NMI:Non-maskable_interrupts
>     185.17 =C2=B1 22%     -29.5%     130.50 =C2=B1 30%  interrupts.CPU117=
.PMI:Performance_monitoring_interrupts
>       1000 =C2=B1 48%     -46.5%     535.67 =C2=B1 83%  interrupts.CPU117=
.RES:Rescheduling_interrupts
>       7.00 =C2=B1  8%     +14.3%       8.00 =C2=B1  7%  interrupts.CPU117=
.TLB:TLB_shootdowns
>       2197 =C2=B1 40%     -18.7%       1787        interrupts.CPU118.CAL:=
Function_call_interrupts
>     606837            -4.3%     580742 =C2=B1  9%  interrupts.CPU118.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU118.MCP:Machi=
ne_check_polls
>     185.67 =C2=B1 24%     -17.8%     152.67 =C2=B1 28%  interrupts.CPU118=
.NMI:Non-maskable_interrupts
>     185.67 =C2=B1 24%     -17.8%     152.67 =C2=B1 28%  interrupts.CPU118=
.PMI:Performance_monitoring_interrupts
>       1504 =C2=B1 91%     -74.6%     381.83 =C2=B1 29%  interrupts.CPU118=
.RES:Rescheduling_interrupts
>       7.17 =C2=B1  9%      +4.7%       7.50 =C2=B1  6%  interrupts.CPU118=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU119.480:IR-PC=
I-MSI.39845944-edge.nvme1q56
>       0.00          -100.0%       0.00        interrupts.CPU119.481:IR-PC=
I-MSI.39845944-edge.nvme1q56
>       2198 =C2=B1 34%     -18.7%       1788        interrupts.CPU119.CAL:=
Function_call_interrupts
>     607730            -4.3%     581682 =C2=B1  9%  interrupts.CPU119.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU119.MCP:Machi=
ne_check_polls
>     171.67 =C2=B1 17%      -9.5%     155.33 =C2=B1 29%  interrupts.CPU119=
.NMI:Non-maskable_interrupts
>     171.67 =C2=B1 17%      -9.5%     155.33 =C2=B1 29%  interrupts.CPU119=
.PMI:Performance_monitoring_interrupts
>     990.67 =C2=B1 96%     -44.5%     549.67 =C2=B1 85%  interrupts.CPU119=
.RES:Rescheduling_interrupts
>       7.00 =C2=B1 11%      +2.4%       7.17 =C2=B1  9%  interrupts.CPU119=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU12.140:IR-PCI=
-MSI.52461568-edge.PCIe.PME,pciehp
>     148.33            +1.3%     150.33        interrupts.CPU12.205:IR-PCI=
-MSI.25690168-edge.eth0-TxRx-56
>       0.00          -100.0%       0.00        interrupts.CPU12.268:IR-PCI=
-MSI.25692215-edge
>       0.00          -100.0%       0.00        interrupts.CPU12.437:IR-PCI=
-MSI.39321677-edge.nvme0q77
>       1759 =C2=B1  4%      +1.2%       1780 =C2=B1  2%  interrupts.CPU12.=
CAL:Function_call_interrupts
>       1.00            +0.0%       1.00 =C2=B1115%  interrupts.CPU12.IWI:I=
RQ_work_interrupts
>     606933            -3.8%     583630 =C2=B1  8%  interrupts.CPU12.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU12.MCP:Machin=
e_check_polls
>       4915 =C2=B1 18%     -16.1%       4122 =C2=B1 66%  interrupts.CPU12.=
NMI:Non-maskable_interrupts
>       4915 =C2=B1 18%     -16.1%       4122 =C2=B1 66%  interrupts.CPU12.=
PMI:Performance_monitoring_interrupts
>     580.67 =C2=B1103%     -45.6%     315.83 =C2=B1 27%  interrupts.CPU12.=
RES:Rescheduling_interrupts
>       6.17 =C2=B1 17%     -16.2%       5.17 =C2=B1 20%  interrupts.CPU12.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU120.481:IR-PC=
I-MSI.39845945-edge.nvme1q57
>       0.00          -100.0%       0.00        interrupts.CPU120.482:IR-PC=
I-MSI.39845945-edge.nvme1q57
>       2620 =C2=B1 69%     -31.5%       1793        interrupts.CPU120.CAL:=
Function_call_interrupts
>     606833            -4.2%     581454 =C2=B1  9%  interrupts.CPU120.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU120.MCP:Machi=
ne_check_polls
>     196.83 =C2=B1 13%     -23.3%     151.00 =C2=B1 34%  interrupts.CPU120=
.NMI:Non-maskable_interrupts
>     196.83 =C2=B1 13%     -23.3%     151.00 =C2=B1 34%  interrupts.CPU120=
.PMI:Performance_monitoring_interrupts
>       1561 =C2=B1 77%     -53.1%     731.67 =C2=B1 82%  interrupts.CPU120=
.RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +0.0%       7.33 =C2=B1 10%  interrupts.CPU120=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU121.399:IR-PC=
I-MSI.39321658-edge.nvme0q58
>       1794            -0.3%       1788        interrupts.CPU121.CAL:Funct=
ion_call_interrupts
>     606827            -4.1%     582195 =C2=B1  9%  interrupts.CPU121.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU121.MCP:Machi=
ne_check_polls
>     204.67 =C2=B1 24%     -24.5%     154.50 =C2=B1 31%  interrupts.CPU121=
.NMI:Non-maskable_interrupts
>     204.67 =C2=B1 24%     -24.5%     154.50 =C2=B1 31%  interrupts.CPU121=
.PMI:Performance_monitoring_interrupts
>     712.17 =C2=B1 76%     -31.9%     484.67 =C2=B1 68%  interrupts.CPU121=
.RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      +0.0%       7.67 =C2=B1  6%  interrupts.CPU121=
.TLB:TLB_shootdowns
>       1824 =C2=B1  3%      -1.0%       1806        interrupts.CPU122.CAL:=
Function_call_interrupts
>     606765            -5.0%     576452 =C2=B1 11%  interrupts.CPU122.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU122.MCP:Machi=
ne_check_polls
>     347.33 =C2=B1105%     -53.3%     162.33 =C2=B1 29%  interrupts.CPU122=
.NMI:Non-maskable_interrupts
>     347.33 =C2=B1105%     -53.3%     162.33 =C2=B1 29%  interrupts.CPU122=
.PMI:Performance_monitoring_interrupts
>       1169 =C2=B1 93%     -36.8%     739.00 =C2=B1 80%  interrupts.CPU122=
.RES:Rescheduling_interrupts
>       9.00 =C2=B1 27%     -14.8%       7.67 =C2=B1  6%  interrupts.CPU122=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU123.357:IR-PC=
I-MSI.39321660-edge.nvme0q60
>       0.00          -100.0%       0.00        interrupts.CPU123.416:IR-PC=
I-MSI.39845948-edge.nvme1q60
>       0.00          -100.0%       0.00        interrupts.CPU123.485:IR-PC=
I-MSI.39845948-edge.nvme1q60
>       2150 =C2=B1 37%     -16.3%       1799        interrupts.CPU123.CAL:=
Function_call_interrupts
>     606753            -3.8%     583587 =C2=B1  9%  interrupts.CPU123.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU123.MCP:Machi=
ne_check_polls
>     168.67 =C2=B1 18%      -3.7%     162.50 =C2=B1 33%  interrupts.CPU123=
.NMI:Non-maskable_interrupts
>     168.67 =C2=B1 18%      -3.7%     162.50 =C2=B1 33%  interrupts.CPU123=
.PMI:Performance_monitoring_interrupts
>     607.67 =C2=B1 92%      -3.6%     585.67 =C2=B1 75%  interrupts.CPU123=
.RES:Rescheduling_interrupts
>       8.00            -6.2%       7.50 =C2=B1  6%  interrupts.CPU123.TLB:=
TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU124.356:IR-PC=
I-MSI.39321661-edge.nvme0q61
>       0.00          -100.0%       0.00        interrupts.CPU124.408:IR-PC=
I-MSI.39845949-edge.nvme1q61
>       2203 =C2=B1 42%     -17.7%       1814 =C2=B1  2%  interrupts.CPU124=
.CAL:Function_call_interrupts
>     606878            -3.7%     584252 =C2=B1  9%  interrupts.CPU124.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU124.MCP:Machi=
ne_check_polls
>     180.33 =C2=B1 18%     -13.0%     156.83 =C2=B1 31%  interrupts.CPU124=
.NMI:Non-maskable_interrupts
>     180.33 =C2=B1 18%     -13.0%     156.83 =C2=B1 31%  interrupts.CPU124=
.PMI:Performance_monitoring_interrupts
>     915.33 =C2=B1106%     -15.4%     774.67 =C2=B1 84%  interrupts.CPU124=
.RES:Rescheduling_interrupts
>       8.50 =C2=B1 11%      -5.9%       8.00 =C2=B1  7%  interrupts.CPU124=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU125.357:IR-PC=
I-MSI.39321662-edge.nvme0q62
>       0.00          -100.0%       0.00        interrupts.CPU125.420:IR-PC=
I-MSI.39845950-edge.nvme1q62
>       1786            +0.1%       1787        interrupts.CPU125.CAL:Funct=
ion_call_interrupts
>     606745            -5.1%     576006 =C2=B1 11%  interrupts.CPU125.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU125.MCP:Machi=
ne_check_polls
>     176.50 =C2=B1 14%      -8.4%     161.67 =C2=B1 33%  interrupts.CPU125=
.NMI:Non-maskable_interrupts
>     176.50 =C2=B1 14%      -8.4%     161.67 =C2=B1 33%  interrupts.CPU125=
.PMI:Performance_monitoring_interrupts
>     335.83 =C2=B1 13%     +40.9%     473.17 =C2=B1 74%  interrupts.CPU125=
.RES:Rescheduling_interrupts
>       7.83 =C2=B1  4%      -2.1%       7.67 =C2=B1  6%  interrupts.CPU125=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU126.487:IR-PC=
I-MSI.39845951-edge.nvme1q63
>       1789            +4.7%       1874 =C2=B1  5%  interrupts.CPU126.CAL:=
Function_call_interrupts
>     606782            -4.2%     581062 =C2=B1  9%  interrupts.CPU126.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU126.MCP:Machi=
ne_check_polls
>     192.67 =C2=B1 13%     +23.0%     237.00 =C2=B1 62%  interrupts.CPU126=
.NMI:Non-maskable_interrupts
>     192.67 =C2=B1 13%     +23.0%     237.00 =C2=B1 62%  interrupts.CPU126=
.PMI:Performance_monitoring_interrupts
>     388.50 =C2=B1 24%    +442.4%       2107 =C2=B1112%  interrupts.CPU126=
.RES:Rescheduling_interrupts
>       7.83 =C2=B1  4%      -6.4%       7.33 =C2=B1  6%  interrupts.CPU126=
.TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU127.414:IR-PC=
I-MSI.39845952-edge.nvme1q64
>       1836 =C2=B1  7%      +1.6%       1864 =C2=B1  6%  interrupts.CPU127=
.CAL:Function_call_interrupts
>     606749            -3.7%     584070 =C2=B1  8%  interrupts.CPU127.LOC:=
Local_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU127.MCP:Machi=
ne_check_polls
>     659.33 =C2=B1 24%     -14.9%     561.33 =C2=B1 48%  interrupts.CPU127=
.NMI:Non-maskable_interrupts
>     659.33 =C2=B1 24%     -14.9%     561.33 =C2=B1 48%  interrupts.CPU127=
.PMI:Performance_monitoring_interrupts
>       1319 =C2=B1 78%     +63.2%       2154 =C2=B1 62%  interrupts.CPU127=
.RES:Rescheduling_interrupts
>       1.00           +16.7%       1.17 =C2=B1 31%  interrupts.CPU127.TLB:=
TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU13.141:IR-PCI=
-MSI.52477952-edge.PCIe.PME,pciehp
>     155.50 =C2=B1  7%      -3.1%     150.67 =C2=B1  3%  interrupts.CPU13.=
206:IR-PCI-MSI.25690169-edge.eth0-TxRx-57
>       0.00          -100.0%       0.00        interrupts.CPU13.269:IR-PCI=
-MSI.25692216-edge
>       0.00          -100.0%       0.00        interrupts.CPU13.374:IR-PCI=
-MSI.39321678-edge.nvme0q78
>       0.00          -100.0%       0.00        interrupts.CPU13.501:IR-PCI=
-MSI.39845966-edge.nvme1q78
>       0.00          -100.0%       0.00        interrupts.CPU13.502:IR-PCI=
-MSI.39845966-edge.nvme1q78
>       1764            -1.0%       1746 =C2=B1  3%  interrupts.CPU13.CAL:F=
unction_call_interrupts
>       2.00 =C2=B1 40%     -41.7%       1.17 =C2=B1 31%  interrupts.CPU13.=
IWI:IRQ_work_interrupts
>     606903            -3.7%     584232 =C2=B1  8%  interrupts.CPU13.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU13.MCP:Machin=
e_check_polls
>       6806 =C2=B1 28%     -16.1%       5707 =C2=B1 18%  interrupts.CPU13.=
NMI:Non-maskable_interrupts
>       6806 =C2=B1 28%     -16.1%       5707 =C2=B1 18%  interrupts.CPU13.=
PMI:Performance_monitoring_interrupts
>     295.33 =C2=B1 12%     +21.8%     359.83 =C2=B1 48%  interrupts.CPU13.=
RES:Rescheduling_interrupts
>       5.00 =C2=B1 25%      -3.3%       4.83 =C2=B1 46%  interrupts.CPU13.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU14.142:IR-PCI=
-MSI.52494336-edge.PCIe.PME,pciehp
>     170.17 =C2=B1 12%     -12.4%     149.00        interrupts.CPU14.207:I=
R-PCI-MSI.25690170-edge.eth0-TxRx-58
>       0.00          -100.0%       0.00        interrupts.CPU14.270:IR-PCI=
-MSI.25692217-edge
>       0.00          -100.0%       0.00        interrupts.CPU14.374:IR-PCI=
-MSI.39321679-edge.nvme0q79
>       0.00          -100.0%       0.00        interrupts.CPU14.502:IR-PCI=
-MSI.39845967-edge.nvme1q79
>       1760            -0.1%       1758        interrupts.CPU14.CAL:Functi=
on_call_interrupts
>       1.33 =C2=B1119%    +112.5%       2.83 =C2=B1 31%  interrupts.CPU14.=
IWI:IRQ_work_interrupts
>     606899            -3.8%     583536 =C2=B1  8%  interrupts.CPU14.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU14.MCP:Machin=
e_check_polls
>       4774 =C2=B1 79%     +77.1%       8456 =C2=B1 20%  interrupts.CPU14.=
NMI:Non-maskable_interrupts
>       4774 =C2=B1 79%     +77.1%       8456 =C2=B1 20%  interrupts.CPU14.=
PMI:Performance_monitoring_interrupts
>     277.00 =C2=B1  9%     +15.8%     320.83 =C2=B1 24%  interrupts.CPU14.=
RES:Rescheduling_interrupts
>       5.67 =C2=B1 26%     -23.5%       4.33 =C2=B1 25%  interrupts.CPU14.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU15.143:IR-PCI=
-MSI.52510720-edge.PCIe.PME,pciehp
>     149.83            +4.6%     156.67 =C2=B1 10%  interrupts.CPU15.208:I=
R-PCI-MSI.25690171-edge.eth0-TxRx-59
>       0.00          -100.0%       0.00        interrupts.CPU15.271:IR-PCI=
-MSI.25692218-edge
>       0.00          -100.0%       0.00        interrupts.CPU15.376:IR-PCI=
-MSI.39321680-edge.nvme0q80
>       1778 =C2=B1  2%      +5.4%       1874 =C2=B1  8%  interrupts.CPU15.=
CAL:Function_call_interrupts
>       1.83 =C2=B1 48%     +18.2%       2.17 =C2=B1 17%  interrupts.CPU15.=
IWI:IRQ_work_interrupts
>     606896            -3.9%     583401 =C2=B1  8%  interrupts.CPU15.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU15.MCP:Machin=
e_check_polls
>       6292 =C2=B1 34%     +15.4%       7263 =C2=B1 16%  interrupts.CPU15.=
NMI:Non-maskable_interrupts
>       6292 =C2=B1 34%     +15.4%       7263 =C2=B1 16%  interrupts.CPU15.=
PMI:Performance_monitoring_interrupts
>     504.67 =C2=B1103%     -11.4%     447.00 =C2=B1 66%  interrupts.CPU15.=
RES:Rescheduling_interrupts
>       5.50 =C2=B1 22%      +0.0%       5.50 =C2=B1 20%  interrupts.CPU15.=
TLB:TLB_shootdowns
>     148.67           +10.4%     164.17 =C2=B1 14%  interrupts.CPU16.209:I=
R-PCI-MSI.25690172-edge.eth0-TxRx-60
>       0.00          -100.0%       0.00        interrupts.CPU16.272:IR-PCI=
-MSI.25692219-edge
>       0.00          -100.0%       0.00        interrupts.CPU16.277:IR-PCI=
-MSI.327680-edge.xhci_hcd
>       0.00          -100.0%       0.00        interrupts.CPU16.376:IR-PCI=
-MSI.39321681-edge.nvme0q81
>       0.00          -100.0%       0.00        interrupts.CPU16.458:IR-PCI=
-MSI.39845969-edge.nvme1q81
>       0.00          -100.0%       0.00        interrupts.CPU16.504:IR-PCI=
-MSI.39845969-edge.nvme1q81
>       0.00          -100.0%       0.00        interrupts.CPU16.90:IR-IO-A=
PIC.90-fasteoi
>       2114 =C2=B1 30%      -0.4%       2105 =C2=B1 17%  interrupts.CPU16.=
CAL:Function_call_interrupts
>     607176            -5.2%     575492 =C2=B1 11%  interrupts.CPU16.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU16.MCP:Machin=
e_check_polls
>     131.00 =C2=B1 20%     +26.6%     165.83 =C2=B1 13%  interrupts.CPU16.=
NMI:Non-maskable_interrupts
>     131.00 =C2=B1 20%     +26.6%     165.83 =C2=B1 13%  interrupts.CPU16.=
PMI:Performance_monitoring_interrupts
>     876.00 =C2=B1 64%      -6.3%     820.67 =C2=B1 86%  interrupts.CPU16.=
RES:Rescheduling_interrupts
>       7.83 =C2=B1 11%      -8.5%       7.17 =C2=B1  9%  interrupts.CPU16.=
TLB:TLB_shootdowns
>     148.67            -0.3%     148.17        interrupts.CPU17.210:IR-PCI=
-MSI.25690173-edge.eth0-TxRx-61
>       0.00          -100.0%       0.00        interrupts.CPU17.273:IR-PCI=
-MSI.25692220-edge
>       0.00          -100.0%       0.00        interrupts.CPU17.506:IR-PCI=
-MSI.39845970-edge.nvme1q82
>       0.00          -100.0%       0.00        interrupts.CPU17.8:IR-IO-AP=
IC.8-edge.rtc0
>       2536 =C2=B1 32%      -3.2%       2455 =C2=B1 82%  interrupts.CPU17.=
CAL:Function_call_interrupts
>     607136            -5.5%     573700 =C2=B1 12%  interrupts.CPU17.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU17.MCP:Machin=
e_check_polls
>     158.50 =C2=B1 18%     -15.4%     134.17 =C2=B1 16%  interrupts.CPU17.=
NMI:Non-maskable_interrupts
>     158.50 =C2=B1 18%     -15.4%     134.17 =C2=B1 16%  interrupts.CPU17.=
PMI:Performance_monitoring_interrupts
>     619.00 =C2=B1 51%     +84.5%       1142 =C2=B1 67%  interrupts.CPU17.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1 10%      -6.7%       7.00 =C2=B1 27%  interrupts.CPU17.=
TLB:TLB_shootdowns
>     150.33 =C2=B1  2%      -0.8%     149.17        interrupts.CPU18.211:I=
R-PCI-MSI.25690174-edge.eth0-TxRx-62
>       0.00          -100.0%       0.00        interrupts.CPU18.274:IR-PCI=
-MSI.25692221-edge
>       0.00          -100.0%       0.00        interrupts.CPU18.378:IR-PCI=
-MSI.39321683-edge.nvme0q83
>       1871 =C2=B1  7%    +345.2%       8329 =C2=B1165%  interrupts.CPU18.=
CAL:Function_call_interrupts
>     606833            -6.4%     567928 =C2=B1 15%  interrupts.CPU18.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU18.MCP:Machin=
e_check_polls
>     254.00 =C2=B1 86%     +12.0%     284.50 =C2=B1118%  interrupts.CPU18.=
NMI:Non-maskable_interrupts
>     254.00 =C2=B1 86%     +12.0%     284.50 =C2=B1118%  interrupts.CPU18.=
PMI:Performance_monitoring_interrupts
>     864.67 =C2=B1 91%     +33.4%       1153 =C2=B1 90%  interrupts.CPU18.=
RES:Rescheduling_interrupts
>       8.83 =C2=B1 15%      -3.8%       8.50 =C2=B1  8%  interrupts.CPU18.=
TLB:TLB_shootdowns
>     567.50 =C2=B1 38%    +120.4%       1250 =C2=B1116%  interrupts.CPU19.=
149:IR-PCI-MSI.25690112-edge.eth0-TxRx-0
>       0.00          -100.0%       0.00        interrupts.CPU19.212:IR-PCI=
-MSI.25690175-edge.eth0
>       0.00          -100.0%       0.00        interrupts.CPU19.275:IR-PCI=
-MSI.25692222-edge
>       0.00          -100.0%       0.00        interrupts.CPU19.464:IR-PCI=
-MSI.39845972-edge.nvme1q84
>       5735 =C2=B1112%     +62.1%       9299 =C2=B1180%  interrupts.CPU19.=
CAL:Function_call_interrupts
>     606744            -6.6%     566644 =C2=B1 15%  interrupts.CPU19.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU19.MCP:Machin=
e_check_polls
>     143.00 =C2=B1 17%      -2.6%     139.33 =C2=B1 20%  interrupts.CPU19.=
NMI:Non-maskable_interrupts
>     143.00 =C2=B1 17%      -2.6%     139.33 =C2=B1 20%  interrupts.CPU19.=
PMI:Performance_monitoring_interrupts
>     498.33 =C2=B1 69%     -26.1%     368.17 =C2=B1 10%  interrupts.CPU19.=
RES:Rescheduling_interrupts
>       7.83 =C2=B1  8%      +0.0%       7.83 =C2=B1  4%  interrupts.CPU19.=
TLB:TLB_shootdowns
>     149.00            -0.4%     148.33        interrupts.CPU2.195:IR-PCI-=
MSI.25690158-edge.eth0-TxRx-46
>       0.00          -100.0%       0.00        interrupts.CPU2.258:IR-PCI-=
MSI.25692205-edge
>       0.00          -100.0%       0.00        interrupts.CPU2.362:IR-PCI-=
MSI.39321667-edge.nvme0q67
>       1907 =C2=B1 15%      -4.0%       1830 =C2=B1 11%  interrupts.CPU2.C=
AL:Function_call_interrupts
>       2.50 =C2=B1 50%     -20.0%       2.00 =C2=B1 64%  interrupts.CPU2.I=
WI:IRQ_work_interrupts
>     606934            -3.8%     584094 =C2=B1  8%  interrupts.CPU2.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU2.MCP:Machine=
_check_polls
>       7880 =C2=B1 34%     -13.0%       6859 =C2=B1 38%  interrupts.CPU2.N=
MI:Non-maskable_interrupts
>       7880 =C2=B1 34%     -13.0%       6859 =C2=B1 38%  interrupts.CPU2.P=
MI:Performance_monitoring_interrupts
>     286.00 =C2=B1  6%     +26.3%     361.33 =C2=B1 28%  interrupts.CPU2.R=
ES:Rescheduling_interrupts
>       5.33 =C2=B1 25%     -15.6%       4.50 =C2=B1 37%  interrupts.CPU2.T=
LB:TLB_shootdowns
>     236.17 =C2=B1 44%     +31.5%     310.67 =C2=B1 59%  interrupts.CPU20.=
150:IR-PCI-MSI.25690113-edge.eth0-TxRx-1
>       0.00          -100.0%       0.00        interrupts.CPU20.213:IR-PCI=
-MSI.25692160-edge
>       0.00          -100.0%       0.00        interrupts.CPU20.379:IR-PCI=
-MSI.39321685-edge.nvme0q85
>      19.00 =C2=B1100%     -66.7%       6.33 =C2=B1223%  interrupts.CPU20.=
4:IR-IO-APIC.4-edge.ttyS0
>       2928 =C2=B1 82%     -36.5%       1861 =C2=B1  9%  interrupts.CPU20.=
CAL:Function_call_interrupts
>     606854            -6.5%     567496 =C2=B1 15%  interrupts.CPU20.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU20.MCP:Machin=
e_check_polls
>     160.00 =C2=B1 16%     -13.8%     138.00 =C2=B1 18%  interrupts.CPU20.=
NMI:Non-maskable_interrupts
>     160.00 =C2=B1 16%     -13.8%     138.00 =C2=B1 18%  interrupts.CPU20.=
PMI:Performance_monitoring_interrupts
>     760.17 =C2=B1111%     -45.3%     415.50 =C2=B1 13%  interrupts.CPU20.=
RES:Rescheduling_interrupts
>       7.83 =C2=B1  8%      -6.4%       7.33 =C2=B1  6%  interrupts.CPU20.=
TLB:TLB_shootdowns
>     233.50 =C2=B1 59%     +24.5%     290.67 =C2=B1 62%  interrupts.CPU21.=
151:IR-PCI-MSI.25690114-edge.eth0-TxRx-2
>       0.00          -100.0%       0.00        interrupts.CPU21.214:IR-PCI=
-MSI.25692161-edge
>       0.00          -100.0%       0.00        interrupts.CPU21.278:IR-PCI=
-MSI.16384-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU21.381:IR-PCI=
-MSI.39321686-edge.nvme0q86
>       0.00          -100.0%       0.00        interrupts.CPU21.382:IR-PCI=
-MSI.39321686-edge.nvme0q86
>       1779         +1014.3%      19833 =C2=B1192%  interrupts.CPU21.CAL:F=
unction_call_interrupts
>     606748            -5.8%     571841 =C2=B1 13%  interrupts.CPU21.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU21.MCP:Machin=
e_check_polls
>     141.67 =C2=B1 17%     +23.6%     175.17 =C2=B1 20%  interrupts.CPU21.=
NMI:Non-maskable_interrupts
>     141.67 =C2=B1 17%     +23.6%     175.17 =C2=B1 20%  interrupts.CPU21.=
PMI:Performance_monitoring_interrupts
>     437.50 =C2=B1 16%     -15.0%     371.83 =C2=B1 14%  interrupts.CPU21.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  9%      +4.3%       8.00 =C2=B1  7%  interrupts.CPU21.=
TLB:TLB_shootdowns
>     312.33 =C2=B1 47%    +350.3%       1406 =C2=B1101%  interrupts.CPU22.=
152:IR-PCI-MSI.25690115-edge.eth0-TxRx-3
>       0.00          -100.0%       0.00        interrupts.CPU22.215:IR-PCI=
-MSI.25692162-edge
>       0.00          -100.0%       0.00        interrupts.CPU22.279:IR-PCI=
-MSI.18432-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU22.382:IR-PCI=
-MSI.39321687-edge.nvme0q87
>       0.00          -100.0%       0.00        interrupts.CPU22.383:IR-PCI=
-MSI.39321687-edge.nvme0q87
>       0.00          -100.0%       0.00        interrupts.CPU22.511:IR-PCI=
-MSI.39845975-edge.nvme1q87
>      68036 =C2=B1139%     -74.1%      17633 =C2=B1191%  interrupts.CPU22.=
CAL:Function_call_interrupts
>     606788            -5.7%     572498 =C2=B1 13%  interrupts.CPU22.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU22.MCP:Machin=
e_check_polls
>     159.67 =C2=B1 26%      -5.4%     151.00 =C2=B1 29%  interrupts.CPU22.=
NMI:Non-maskable_interrupts
>     159.67 =C2=B1 26%      -5.4%     151.00 =C2=B1 29%  interrupts.CPU22.=
PMI:Performance_monitoring_interrupts
>       1113 =C2=B1150%     -27.5%     807.83 =C2=B1109%  interrupts.CPU22.=
RES:Rescheduling_interrupts
>       8.17 =C2=B1  8%      -4.1%       7.83 =C2=B1  8%  interrupts.CPU22.=
TLB:TLB_shootdowns
>     184.00 =C2=B1 25%    +546.5%       1189 =C2=B1179%  interrupts.CPU23.=
153:IR-PCI-MSI.25690116-edge.eth0-TxRx-4
>       0.00          -100.0%       0.00        interrupts.CPU23.216:IR-PCI=
-MSI.25692163-edge
>       0.00          -100.0%       0.00        interrupts.CPU23.280:IR-PCI=
-MSI.18432-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU23.280:IR-PCI=
-MSI.20480-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU23.382:IR-PCI=
-MSI.39321688-edge.nvme0q88
>       0.00          -100.0%       0.00        interrupts.CPU23.512:IR-PCI=
-MSI.39845976-edge.nvme1q88
>       2223 =C2=B1 44%     -19.5%       1790 =C2=B1  2%  interrupts.CPU23.=
CAL:Function_call_interrupts
>     606739            -5.3%     574803 =C2=B1 12%  interrupts.CPU23.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU23.MCP:Machin=
e_check_polls
>     141.83 =C2=B1 17%      +5.9%     150.17 =C2=B1 17%  interrupts.CPU23.=
NMI:Non-maskable_interrupts
>     141.83 =C2=B1 17%      +5.9%     150.17 =C2=B1 17%  interrupts.CPU23.=
PMI:Performance_monitoring_interrupts
>     380.17 =C2=B1  9%      -4.7%     362.17 =C2=B1 14%  interrupts.CPU23.=
RES:Rescheduling_interrupts
>       7.83 =C2=B1 11%      +2.1%       8.00 =C2=B1  7%  interrupts.CPU23.=
TLB:TLB_shootdowns
>       2578 =C2=B1204%     -92.5%     194.33 =C2=B1 32%  interrupts.CPU24.=
154:IR-PCI-MSI.25690117-edge.eth0-TxRx-5
>       0.00          -100.0%       0.00        interrupts.CPU24.217:IR-PCI=
-MSI.25692164-edge
>       0.00          -100.0%       0.00        interrupts.CPU24.281:IR-PCI=
-MSI.20480-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU24.281:IR-PCI=
-MSI.22528-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU24.464:IR-PCI=
-MSI.39845977-edge.nvme1q89
>       0.00          -100.0%       0.00        interrupts.CPU24.512:IR-PCI=
-MSI.39845977-edge.nvme1q89
>       0.00          -100.0%       0.00        interrupts.CPU24.513:IR-PCI=
-MSI.39845977-edge.nvme1q89
>       1805 =C2=B1  5%    +141.9%       4367 =C2=B1127%  interrupts.CPU24.=
CAL:Function_call_interrupts
>     606785            -6.1%     569916 =C2=B1 14%  interrupts.CPU24.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU24.MCP:Machin=
e_check_polls
>     150.83 =C2=B1 17%      -3.9%     145.00 =C2=B1 18%  interrupts.CPU24.=
NMI:Non-maskable_interrupts
>     150.83 =C2=B1 17%      -3.9%     145.00 =C2=B1 18%  interrupts.CPU24.=
PMI:Performance_monitoring_interrupts
>     709.33 =C2=B1113%     -38.7%     434.50 =C2=B1 40%  interrupts.CPU24.=
RES:Rescheduling_interrupts
>       8.00 =C2=B1 10%      +2.1%       8.17 =C2=B1 14%  interrupts.CPU24.=
TLB:TLB_shootdowns
>       1936 =C2=B1177%     -72.8%     526.33 =C2=B1100%  interrupts.CPU25.=
155:IR-PCI-MSI.25690118-edge.eth0-TxRx-6
>       0.00          -100.0%       0.00        interrupts.CPU25.218:IR-PCI=
-MSI.25692165-edge
>       0.00          -100.0%       0.00        interrupts.CPU25.282:IR-PCI=
-MSI.24576-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU25.284:IR-PCI=
-MSI.22528-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU25.385:IR-PCI=
-MSI.39321690-edge.nvme0q90
>       0.00          -100.0%       0.00        interrupts.CPU25.514:IR-PCI=
-MSI.39845978-edge.nvme1q90
>       7924 =C2=B1174%     +25.1%       9910 =C2=B1168%  interrupts.CPU25.=
CAL:Function_call_interrupts
>     606987            -5.8%     571568 =C2=B1 13%  interrupts.CPU25.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU25.MCP:Machin=
e_check_polls
>     161.33 =C2=B1 13%      -9.7%     145.67 =C2=B1 18%  interrupts.CPU25.=
NMI:Non-maskable_interrupts
>     161.33 =C2=B1 13%      -9.7%     145.67 =C2=B1 18%  interrupts.CPU25.=
PMI:Performance_monitoring_interrupts
>     430.83 =C2=B1 25%     -12.6%     376.50 =C2=B1 18%  interrupts.CPU25.=
RES:Rescheduling_interrupts
>       7.83 =C2=B1  8%      -2.1%       7.67 =C2=B1  6%  interrupts.CPU25.=
TLB:TLB_shootdowns
>       1267 =C2=B1100%     -86.9%     166.50 =C2=B1 11%  interrupts.CPU26.=
156:IR-PCI-MSI.25690119-edge.eth0-TxRx-7
>       0.00          -100.0%       0.00        interrupts.CPU26.219:IR-PCI=
-MSI.25692166-edge
>       0.00          -100.0%       0.00        interrupts.CPU26.283:IR-PCI=
-MSI.26624-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU26.285:IR-PCI=
-MSI.24576-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU26.515:IR-PCI=
-MSI.39845979-edge.nvme1q91
>       1802 =C2=B1  3%    +936.2%      18675 =C2=B1202%  interrupts.CPU26.=
CAL:Function_call_interrupts
>     607754            -6.2%     570067 =C2=B1 14%  interrupts.CPU26.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU26.MCP:Machin=
e_check_polls
>     169.67 =C2=B1  2%     -15.3%     143.67 =C2=B1 18%  interrupts.CPU26.=
NMI:Non-maskable_interrupts
>     169.67 =C2=B1  2%     -15.3%     143.67 =C2=B1 18%  interrupts.CPU26.=
PMI:Performance_monitoring_interrupts
>     698.67 =C2=B1 75%     -52.6%     330.83 =C2=B1  4%  interrupts.CPU26.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1 12%      -4.3%       7.33 =C2=B1  6%  interrupts.CPU26.=
TLB:TLB_shootdowns
>     282.67 =C2=B1 90%     +45.2%     410.33 =C2=B1 84%  interrupts.CPU27.=
157:IR-PCI-MSI.25690120-edge.eth0-TxRx-8
>       0.00          -100.0%       0.00        interrupts.CPU27.220:IR-PCI=
-MSI.25692167-edge
>       0.00          -100.0%       0.00        interrupts.CPU27.282:IR-PCI=
-MSI.39321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.CPU27.284:IR-PCI=
-MSI.28672-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU27.516:IR-PCI=
-MSI.39845980-edge.nvme1q92
>       1892 =C2=B1 11%    +272.9%       7055 =C2=B1167%  interrupts.CPU27.=
CAL:Function_call_interrupts
>     606747            -5.9%     571084 =C2=B1 13%  interrupts.CPU27.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU27.MCP:Machin=
e_check_polls
>     158.67 =C2=B1 18%     +87.0%     296.67 =C2=B1115%  interrupts.CPU27.=
NMI:Non-maskable_interrupts
>     158.67 =C2=B1 18%     +87.0%     296.67 =C2=B1115%  interrupts.CPU27.=
PMI:Performance_monitoring_interrupts
>     518.17 =C2=B1 36%     -32.6%     349.50 =C2=B1  9%  interrupts.CPU27.=
RES:Rescheduling_interrupts
>       6.83 =C2=B1 19%     +14.6%       7.83 =C2=B1  4%  interrupts.CPU27.=
TLB:TLB_shootdowns
>     295.67 =C2=B1 85%     -22.5%     229.00 =C2=B1 50%  interrupts.CPU28.=
158:IR-PCI-MSI.25690121-edge.eth0-TxRx-9
>       0.00          -100.0%       0.00        interrupts.CPU28.221:IR-PCI=
-MSI.25692168-edge
>       0.00          -100.0%       0.00        interrupts.CPU28.285:IR-PCI=
-MSI.30720-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU28.286:IR-PCI=
-MSI.39845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.CPU28.517:IR-PCI=
-MSI.39845981-edge.nvme1q93
>      11274 =C2=B1180%     -83.7%       1838 =C2=B1  5%  interrupts.CPU28.=
CAL:Function_call_interrupts
>     606743            -5.8%     571455 =C2=B1 13%  interrupts.CPU28.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU28.MCP:Machin=
e_check_polls
>     162.67 =C2=B1 18%     -13.1%     141.33 =C2=B1 21%  interrupts.CPU28.=
NMI:Non-maskable_interrupts
>     162.67 =C2=B1 18%     -13.1%     141.33 =C2=B1 21%  interrupts.CPU28.=
PMI:Performance_monitoring_interrupts
>     412.17 =C2=B1 33%    +169.2%       1109 =C2=B1 98%  interrupts.CPU28.=
RES:Rescheduling_interrupts
>       7.83 =C2=B1  4%      -6.4%       7.33 =C2=B1 15%  interrupts.CPU28.=
TLB:TLB_shootdowns
>     225.33 =C2=B1 55%    +175.9%     621.67 =C2=B1 73%  interrupts.CPU29.=
159:IR-PCI-MSI.25690122-edge.eth0-TxRx-10
>       0.00          -100.0%       0.00        interrupts.CPU29.222:IR-PCI=
-MSI.25692169-edge
>       0.00          -100.0%       0.00        interrupts.CPU29.294:IR-PCI=
-MSI.39321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.CPU29.389:IR-PCI=
-MSI.39321694-edge.nvme0q94
>       0.00          -100.0%       0.00        interrupts.CPU29.471:IR-PCI=
-MSI.39321694-edge.nvme0q94
>       0.00          -100.0%       0.00        interrupts.CPU29.518:IR-PCI=
-MSI.39845982-edge.nvme1q94
>       0.00          -100.0%       0.00        interrupts.CPU29.542:IR-PCI=
-MSI.26624-edge.ioat-msix
>      15108 =C2=B1197%     -82.6%       2626 =C2=B1 68%  interrupts.CPU29.=
CAL:Function_call_interrupts
>     606956            -6.8%     565873 =C2=B1 15%  interrupts.CPU29.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU29.MCP:Machin=
e_check_polls
>     181.83 =C2=B1 21%     -33.5%     120.83 =C2=B1 22%  interrupts.CPU29.=
NMI:Non-maskable_interrupts
>     181.83 =C2=B1 21%     -33.5%     120.83 =C2=B1 22%  interrupts.CPU29.=
PMI:Performance_monitoring_interrupts
>     355.00 =C2=B1 14%    +197.3%       1055 =C2=B1141%  interrupts.CPU29.=
RES:Rescheduling_interrupts
>       7.17 =C2=B1 14%      +9.3%       7.83 =C2=B1 11%  interrupts.CPU29.=
TLB:TLB_shootdowns
>     159.67 =C2=B1 15%      -6.9%     148.67        interrupts.CPU3.196:IR=
-PCI-MSI.25690159-edge.eth0-TxRx-47
>       0.00          -100.0%       0.00        interrupts.CPU3.259:IR-PCI-=
MSI.25692206-edge
>       1768            +0.9%       1784 =C2=B1  2%  interrupts.CPU3.CAL:Fu=
nction_call_interrupts
>       1.33 =C2=B1 82%      +0.0%       1.33 =C2=B1 70%  interrupts.CPU3.I=
WI:IRQ_work_interrupts
>     606946            -4.7%     578423 =C2=B1 10%  interrupts.CPU3.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU3.MCP:Machine=
_check_polls
>       5288 =C2=B1 35%     +10.7%       5855 =C2=B1 39%  interrupts.CPU3.N=
MI:Non-maskable_interrupts
>       5288 =C2=B1 35%     +10.7%       5855 =C2=B1 39%  interrupts.CPU3.P=
MI:Performance_monitoring_interrupts
>     293.83 =C2=B1  4%     +18.3%     347.67 =C2=B1 16%  interrupts.CPU3.R=
ES:Rescheduling_interrupts
>       6.00 =C2=B1 27%      +5.6%       6.33 =C2=B1 17%  interrupts.CPU3.T=
LB:TLB_shootdowns
>     190.00 =C2=B1 29%      +6.4%     202.17 =C2=B1 51%  interrupts.CPU30.=
160:IR-PCI-MSI.25690123-edge.eth0-TxRx-11
>       0.00          -100.0%       0.00        interrupts.CPU30.223:IR-PCI=
-MSI.25692170-edge
>       0.00          -100.0%       0.00        interrupts.CPU30.290:IR-PCI=
-MSI.39321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.CPU30.293:IR-PCI=
-MSI.39321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.CPU30.294:IR-PCI=
-MSI.39321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.CPU30.295:IR-PCI=
-MSI.39321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.CPU30.295:IR-PCI=
-MSI.39845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.CPU30.519:IR-PCI=
-MSI.39845983-edge.nvme1q95
>      17600 =C2=B1201%     +10.3%      19414 =C2=B1196%  interrupts.CPU30.=
CAL:Function_call_interrupts
>     606738            -6.5%     567325 =C2=B1 15%  interrupts.CPU30.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU30.MCP:Machin=
e_check_polls
>     154.83 =C2=B1 14%      -7.9%     142.67 =C2=B1 24%  interrupts.CPU30.=
NMI:Non-maskable_interrupts
>     154.83 =C2=B1 14%      -7.9%     142.67 =C2=B1 24%  interrupts.CPU30.=
PMI:Performance_monitoring_interrupts
>     464.67 =C2=B1 29%      +7.7%     500.50 =C2=B1 66%  interrupts.CPU30.=
RES:Rescheduling_interrupts
>       8.17 =C2=B1 14%      -4.1%       7.83 =C2=B1  8%  interrupts.CPU30.=
TLB:TLB_shootdowns
>     289.83 =C2=B1 53%     +52.8%     443.00 =C2=B1 97%  interrupts.CPU31.=
161:IR-PCI-MSI.25690124-edge.eth0-TxRx-12
>       0.00          -100.0%       0.00        interrupts.CPU31.224:IR-PCI=
-MSI.25692171-edge
>       0.00          -100.0%       0.00        interrupts.CPU31.296:IR-PCI=
-MSI.39321600-edge.nvme0q0
>       0.00          -100.0%       0.00        interrupts.CPU31.296:IR-PCI=
-MSI.39845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.CPU31.392:IR-PCI=
-MSI.39321696-edge.nvme0q96
>       0.00          -100.0%       0.00        interrupts.CPU31.424:IR-PCI=
-MSI.39845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.CPU31.475:IR-PCI=
-MSI.39321696-edge.nvme0q96
>       0.00          -100.0%       0.00        interrupts.CPU31.520:IR-PCI=
-MSI.39845984-edge.nvme1q96
>       0.00          -100.0%       0.00        interrupts.CPU31.544:IR-PCI=
-MSI.28672-edge.ioat-msix
>       3113 =C2=B1 76%     -45.2%       1706 =C2=B1  7%  interrupts.CPU31.=
CAL:Function_call_interrupts
>     606882            -6.0%     570463 =C2=B1 13%  interrupts.CPU31.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU31.MCP:Machin=
e_check_polls
>     144.83 =C2=B1 18%      -6.0%     136.17 =C2=B1 21%  interrupts.CPU31.=
NMI:Non-maskable_interrupts
>     144.83 =C2=B1 18%      -6.0%     136.17 =C2=B1 21%  interrupts.CPU31.=
PMI:Performance_monitoring_interrupts
>     383.67 =C2=B1 16%      -3.3%     371.00 =C2=B1 10%  interrupts.CPU31.=
RES:Rescheduling_interrupts
>       8.17 =C2=B1 13%      -2.0%       8.00 =C2=B1  7%  interrupts.CPU31.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU32.426:IR-PCI=
-MSI.39845889-edge.nvme1q1
>       1674 =C2=B1 31%      +7.9%       1806        interrupts.CPU32.CAL:F=
unction_call_interrupts
>     606814            -6.6%     566658 =C2=B1 15%  interrupts.CPU32.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU32.MCP:Machin=
e_check_polls
>     177.67 =C2=B1 17%      -3.7%     171.17 =C2=B1 31%  interrupts.CPU32.=
NMI:Non-maskable_interrupts
>     177.67 =C2=B1 17%      -3.7%     171.17 =C2=B1 31%  interrupts.CPU32.=
PMI:Performance_monitoring_interrupts
>       1123 =C2=B1102%     +19.1%       1337 =C2=B1 78%  interrupts.CPU32.=
RES:Rescheduling_interrupts
>       6.83 =C2=B1 10%      +2.4%       7.00        interrupts.CPU32.TLB:T=
LB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU33.145:IR-PCI=
-MSI.118521856-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.CPU33.295:IR-PCI=
-MSI.39321602-edge.nvme0q2
>       0.00          -100.0%       0.00        interrupts.CPU33.425:IR-PCI=
-MSI.39845890-edge.nvme1q2
>       0.00          -100.0%       0.00        interrupts.CPU33.426:IR-PCI=
-MSI.39845890-edge.nvme1q2
>      24443 =C2=B1142%     -91.4%       2096 =C2=B1 24%  interrupts.CPU33.=
CAL:Function_call_interrupts
>     606746            -6.9%     565004 =C2=B1 16%  interrupts.CPU33.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU33.MCP:Machin=
e_check_polls
>     313.33 =C2=B1104%     -49.5%     158.33 =C2=B1 16%  interrupts.CPU33.=
NMI:Non-maskable_interrupts
>     313.33 =C2=B1104%     -49.5%     158.33 =C2=B1 16%  interrupts.CPU33.=
PMI:Performance_monitoring_interrupts
>     688.33 =C2=B1 71%    +156.1%       1762 =C2=B1110%  interrupts.CPU33.=
RES:Rescheduling_interrupts
>       7.17 =C2=B1  9%      +0.0%       7.17 =C2=B1  5%  interrupts.CPU33.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU34.146:IR-PCI=
-MSI.118538240-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.CPU34.428:IR-PCI=
-MSI.39845891-edge.nvme1q3
>      15371 =C2=B1197%     -88.4%       1776        interrupts.CPU34.CAL:F=
unction_call_interrupts
>     606780            -5.3%     574738 =C2=B1 12%  interrupts.CPU34.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU34.MCP:Machin=
e_check_polls
>     155.17 =C2=B1 20%      -0.8%     154.00 =C2=B1 16%  interrupts.CPU34.=
NMI:Non-maskable_interrupts
>     155.17 =C2=B1 20%      -0.8%     154.00 =C2=B1 16%  interrupts.CPU34.=
PMI:Performance_monitoring_interrupts
>     718.00 =C2=B1 82%      -2.5%     700.00 =C2=B1103%  interrupts.CPU34.=
RES:Rescheduling_interrupts
>       7.00 =C2=B1 14%      +7.1%       7.50 =C2=B1  6%  interrupts.CPU34.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU35.147:IR-PCI=
-MSI.118554624-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.CPU35.429:IR-PCI=
-MSI.39845892-edge.nvme1q4
>      19025 =C2=B1190%     -90.0%       1907 =C2=B1 10%  interrupts.CPU35.=
CAL:Function_call_interrupts
>     606692            -5.5%     573151 =C2=B1 12%  interrupts.CPU35.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU35.MCP:Machin=
e_check_polls
>     343.00 =C2=B1110%     -55.0%     154.33 =C2=B1 26%  interrupts.CPU35.=
NMI:Non-maskable_interrupts
>     343.00 =C2=B1110%     -55.0%     154.33 =C2=B1 26%  interrupts.CPU35.=
PMI:Performance_monitoring_interrupts
>       1333 =C2=B1129%     -50.7%     656.83 =C2=B1 80%  interrupts.CPU35.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +6.8%       7.83 =C2=B1  4%  interrupts.CPU35.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU36.148:IR-PCI=
-MSI.118571008-edge.PCIe.PME,pciehp
>       0.00          -100.0%       0.00        interrupts.CPU36.302:IR-PCI=
-MSI.39321605-edge.nvme0q5
>       0.00          -100.0%       0.00        interrupts.CPU36.429:IR-PCI=
-MSI.39845893-edge.nvme1q5
>      15291 =C2=B1196%     -88.4%       1768        interrupts.CPU36.CAL:F=
unction_call_interrupts
>     606760            -5.7%     572468 =C2=B1 13%  interrupts.CPU36.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU36.MCP:Machin=
e_check_polls
>     152.17 =C2=B1 21%     +17.6%     179.00 =C2=B1 14%  interrupts.CPU36.=
NMI:Non-maskable_interrupts
>     152.17 =C2=B1 21%     +17.6%     179.00 =C2=B1 14%  interrupts.CPU36.=
PMI:Performance_monitoring_interrupts
>     691.00 =C2=B1 82%     -13.3%     599.17 =C2=B1 74%  interrupts.CPU36.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1 10%      +0.0%       7.33 =C2=B1 10%  interrupts.CPU36.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU37.286:IR-PCI=
-MSI.67125248-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU37.302:IR-PCI=
-MSI.39321606-edge.nvme0q6
>       0.00          -100.0%       0.00        interrupts.CPU37.430:IR-PCI=
-MSI.39845894-edge.nvme1q6
>       0.00          -100.0%       0.00        interrupts.CPU37.431:IR-PCI=
-MSI.39845894-edge.nvme1q6
>       0.00          -100.0%       0.00        interrupts.CPU37.546:IR-PCI=
-MSI.67125248-edge.ioat-msix
>      18321 =C2=B1201%     -27.3%      13327 =C2=B1122%  interrupts.CPU37.=
CAL:Function_call_interrupts
>     606747            -7.8%     559601 =C2=B1 18%  interrupts.CPU37.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU37.MCP:Machin=
e_check_polls
>     175.67 =C2=B1 20%      +4.9%     184.33 =C2=B1 13%  interrupts.CPU37.=
NMI:Non-maskable_interrupts
>     175.67 =C2=B1 20%      +4.9%     184.33 =C2=B1 13%  interrupts.CPU37.=
PMI:Performance_monitoring_interrupts
>     403.33 =C2=B1 48%     +30.5%     526.50 =C2=B1 56%  interrupts.CPU37.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      +6.7%       8.00        interrupts.CPU37.TLB:T=
LB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU38.287:IR-PCI=
-MSI.67127296-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU38.431:IR-PCI=
-MSI.39845895-edge.nvme1q7
>       0.00          -100.0%       0.00        interrupts.CPU38.547:IR-PCI=
-MSI.67127296-edge.ioat-msix
>       1793 =C2=B1  2%    +424.6%       9405 =C2=B1135%  interrupts.CPU38.=
CAL:Function_call_interrupts
>     606767            -8.2%     557211 =C2=B1 19%  interrupts.CPU38.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU38.MCP:Machin=
e_check_polls
>     161.00 =C2=B1 16%     +21.2%     195.17 =C2=B1 12%  interrupts.CPU38.=
NMI:Non-maskable_interrupts
>     161.00 =C2=B1 16%     +21.2%     195.17 =C2=B1 12%  interrupts.CPU38.=
PMI:Performance_monitoring_interrupts
>     318.00 =C2=B1  2%    +176.0%     877.67 =C2=B1 80%  interrupts.CPU38.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      +2.2%       7.83 =C2=B1  8%  interrupts.CPU38.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU39.288:IR-PCI=
-MSI.67129344-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU39.289:IR-PCI=
-MSI.67129344-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU39.301:IR-PCI=
-MSI.39321608-edge.nvme0q8
>       0.00          -100.0%       0.00        interrupts.CPU39.303:IR-PCI=
-MSI.39321608-edge.nvme0q8
>       0.00          -100.0%       0.00        interrupts.CPU39.432:IR-PCI=
-MSI.39845896-edge.nvme1q8
>       0.00          -100.0%       0.00        interrupts.CPU39.548:IR-PCI=
-MSI.67129344-edge.ioat-msix
>       3221 =C2=B1101%     -58.5%       1337 =C2=B1 45%  interrupts.CPU39.=
CAL:Function_call_interrupts
>     606724            -6.7%     565872 =C2=B1 15%  interrupts.CPU39.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU39.MCP:Machin=
e_check_polls
>     187.83 =C2=B1 17%     -13.4%     162.67 =C2=B1 14%  interrupts.CPU39.=
NMI:Non-maskable_interrupts
>     187.83 =C2=B1 17%     -13.4%     162.67 =C2=B1 14%  interrupts.CPU39.=
PMI:Performance_monitoring_interrupts
>     323.17 =C2=B1  4%     +15.5%     373.33 =C2=B1 27%  interrupts.CPU39.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      -2.2%       7.50 =C2=B1  6%  interrupts.CPU39.=
TLB:TLB_shootdowns
>     177.33 =C2=B1 18%      -5.8%     167.00 =C2=B1 13%  interrupts.CPU4.1=
97:IR-PCI-MSI.25690160-edge.eth0-TxRx-48
>       0.00          -100.0%       0.00        interrupts.CPU4.260:IR-PCI-=
MSI.25692207-edge
>       0.00          -100.0%       0.00        interrupts.CPU4.421:IR-PCI-=
MSI.39321669-edge.nvme0q69
>       0.00          -100.0%       0.00        interrupts.CPU4.433:IR-PCI-=
MSI.39321669-edge.nvme0q69
>       1763            +0.0%       1764        interrupts.CPU4.CAL:Functio=
n_call_interrupts
>       1.83 =C2=B1 66%      +9.1%       2.00 =C2=B1 57%  interrupts.CPU4.I=
WI:IRQ_work_interrupts
>     606913            -3.7%     584327 =C2=B1  8%  interrupts.CPU4.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU4.MCP:Machine=
_check_polls
>       6329 =C2=B1 32%      +3.8%       6572 =C2=B1 35%  interrupts.CPU4.N=
MI:Non-maskable_interrupts
>       6329 =C2=B1 32%      +3.8%       6572 =C2=B1 35%  interrupts.CPU4.P=
MI:Performance_monitoring_interrupts
>     289.83 =C2=B1  6%      +7.8%     312.50 =C2=B1 25%  interrupts.CPU4.R=
ES:Rescheduling_interrupts
>       4.00 =C2=B1 32%     +29.2%       5.17 =C2=B1 17%  interrupts.CPU4.T=
LB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU40.289:IR-PCI=
-MSI.67131392-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU40.290:IR-PCI=
-MSI.67131392-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU40.549:IR-PCI=
-MSI.67131392-edge.ioat-msix
>       1620 =C2=B1 20%     +34.8%       2184 =C2=B1 42%  interrupts.CPU40.=
CAL:Function_call_interrupts
>     606793            -5.8%     571391 =C2=B1 13%  interrupts.CPU40.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU40.MCP:Machin=
e_check_polls
>     158.33 =C2=B1 14%      +2.2%     161.83 =C2=B1 19%  interrupts.CPU40.=
NMI:Non-maskable_interrupts
>     158.33 =C2=B1 14%      +2.2%     161.83 =C2=B1 19%  interrupts.CPU40.=
PMI:Performance_monitoring_interrupts
>     330.50 =C2=B1  9%     +42.7%     471.67 =C2=B1 63%  interrupts.CPU40.=
RES:Rescheduling_interrupts
>       7.17 =C2=B1  9%     +14.0%       8.17 =C2=B1  4%  interrupts.CPU40.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU41.290:IR-PCI=
-MSI.67133440-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU41.291:IR-PCI=
-MSI.67133440-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU41.550:IR-PCI=
-MSI.67133440-edge.ioat-msix
>       2046 =C2=B1 20%     +58.5%       3243 =C2=B1 58%  interrupts.CPU41.=
CAL:Function_call_interrupts
>       0.17 =C2=B1223%    -100.0%       0.00        interrupts.CPU41.IWI:I=
RQ_work_interrupts
>     606755            -5.8%     571528 =C2=B1 13%  interrupts.CPU41.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU41.MCP:Machin=
e_check_polls
>     194.00 =C2=B1 18%      -2.7%     188.83 =C2=B1 12%  interrupts.CPU41.=
NMI:Non-maskable_interrupts
>     194.00 =C2=B1 18%      -2.7%     188.83 =C2=B1 12%  interrupts.CPU41.=
PMI:Performance_monitoring_interrupts
>     708.33 =C2=B1 89%     -15.5%     598.50 =C2=B1105%  interrupts.CPU41.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +6.8%       7.83 =C2=B1  4%  interrupts.CPU41.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU42.291:IR-PCI=
-MSI.67135488-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU42.292:IR-PCI=
-MSI.67135488-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU42.293:IR-PCI=
-MSI.67135488-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU42.551:IR-PCI=
-MSI.67135488-edge.ioat-msix
>       1803 =C2=B1  2%    +406.1%       9127 =C2=B1179%  interrupts.CPU42.=
CAL:Function_call_interrupts
>     606742            -6.9%     564730 =C2=B1 16%  interrupts.CPU42.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU42.MCP:Machin=
e_check_polls
>     152.83 =C2=B1 19%     +15.5%     176.50 =C2=B1 21%  interrupts.CPU42.=
NMI:Non-maskable_interrupts
>     152.83 =C2=B1 19%     +15.5%     176.50 =C2=B1 21%  interrupts.CPU42.=
PMI:Performance_monitoring_interrupts
>     847.33 =C2=B1118%     -15.2%     718.50 =C2=B1123%  interrupts.CPU42.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1 10%      +6.8%       7.83 =C2=B1  4%  interrupts.CPU42.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU43.292:IR-PCI=
-MSI.67137536-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU43.293:IR-PCI=
-MSI.67137536-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU43.423:IR-PCI=
-MSI.67139584-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU43.436:IR-PCI=
-MSI.39845900-edge.nvme1q12
>       0.00          -100.0%       0.00        interrupts.CPU43.552:IR-PCI=
-MSI.67137536-edge.ioat-msix
>       1858 =C2=B1 20%    +358.2%       8512 =C2=B1177%  interrupts.CPU43.=
CAL:Function_call_interrupts
>     606852            -5.9%     571124 =C2=B1 13%  interrupts.CPU43.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU43.MCP:Machin=
e_check_polls
>     208.17 =C2=B1 27%     -25.9%     154.17 =C2=B1 17%  interrupts.CPU43.=
NMI:Non-maskable_interrupts
>     208.17 =C2=B1 27%     -25.9%     154.17 =C2=B1 17%  interrupts.CPU43.=
PMI:Performance_monitoring_interrupts
>     978.83 =C2=B1118%     -66.8%     324.83 =C2=B1  4%  interrupts.CPU43.=
RES:Rescheduling_interrupts
>       7.00 =C2=B1 16%     +14.3%       8.00        interrupts.CPU43.TLB:T=
LB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU44.293:IR-PCI=
-MSI.67139584-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU44.294:IR-PCI=
-MSI.67139584-edge.ioat-msix
>       0.00          -100.0%       0.00        interrupts.CPU44.553:IR-PCI=
-MSI.67139584-edge.ioat-msix
>       2242 =C2=B1 44%     +11.3%       2494 =C2=B1 65%  interrupts.CPU44.=
CAL:Function_call_interrupts
>     607619            -7.0%     565079 =C2=B1 16%  interrupts.CPU44.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU44.MCP:Machin=
e_check_polls
>     215.17 =C2=B1  2%     +47.5%     317.33 =C2=B1107%  interrupts.CPU44.=
NMI:Non-maskable_interrupts
>     215.17 =C2=B1  2%     +47.5%     317.33 =C2=B1107%  interrupts.CPU44.=
PMI:Performance_monitoring_interrupts
>     868.33 =C2=B1140%     -24.4%     656.33 =C2=B1 87%  interrupts.CPU44.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      +0.0%       7.50 =C2=B1 10%  interrupts.CPU44.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU45.438:IR-PCI=
-MSI.39845902-edge.nvme1q14
>       1770            +2.4%       1812 =C2=B1  5%  interrupts.CPU45.CAL:F=
unction_call_interrupts
>     606727            -8.1%     557650 =C2=B1 19%  interrupts.CPU45.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU45.MCP:Machin=
e_check_polls
>     183.83 =C2=B1  6%     +12.5%     206.83 =C2=B1 18%  interrupts.CPU45.=
NMI:Non-maskable_interrupts
>     183.83 =C2=B1  6%     +12.5%     206.83 =C2=B1 18%  interrupts.CPU45.=
PMI:Performance_monitoring_interrupts
>     438.17 =C2=B1 45%     +13.8%     498.83 =C2=B1 82%  interrupts.CPU45.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +6.8%       7.83 =C2=B1  4%  interrupts.CPU45.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU46.310:IR-PCI=
-MSI.39321615-edge.nvme0q15
>       0.00          -100.0%       0.00        interrupts.CPU46.438:IR-PCI=
-MSI.39845903-edge.nvme1q15
>       2381 =C2=B1 56%     -25.7%       1770        interrupts.CPU46.CAL:F=
unction_call_interrupts
>       0.17 =C2=B1223%    -100.0%       0.00        interrupts.CPU46.IWI:I=
RQ_work_interrupts
>     606727            -8.1%     557800 =C2=B1 19%  interrupts.CPU46.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU46.MCP:Machin=
e_check_polls
>     175.67 =C2=B1 14%      +5.9%     186.00 =C2=B1 20%  interrupts.CPU46.=
NMI:Non-maskable_interrupts
>     175.67 =C2=B1 14%      +5.9%     186.00 =C2=B1 20%  interrupts.CPU46.=
PMI:Performance_monitoring_interrupts
>     443.67 =C2=B1 47%     +14.8%     509.50 =C2=B1 79%  interrupts.CPU46.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +6.8%       7.83 =C2=B1  4%  interrupts.CPU46.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU47.439:IR-PCI=
-MSI.39845904-edge.nvme1q16
>       2107 =C2=B1 35%     -11.3%       1868 =C2=B1 12%  interrupts.CPU47.=
CAL:Function_call_interrupts
>     606702            -7.7%     560056 =C2=B1 18%  interrupts.CPU47.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU47.MCP:Machin=
e_check_polls
>     190.33 =C2=B1 12%      -5.9%     179.17 =C2=B1 20%  interrupts.CPU47.=
NMI:Non-maskable_interrupts
>     190.33 =C2=B1 12%      -5.9%     179.17 =C2=B1 20%  interrupts.CPU47.=
PMI:Performance_monitoring_interrupts
>     777.00 =C2=B1129%     -49.9%     389.17 =C2=B1 34%  interrupts.CPU47.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%     +11.4%       8.17 =C2=B1  4%  interrupts.CPU47.=
TLB:TLB_shootdowns
>      10706 =C2=B1166%     +27.5%      13648 =C2=B1194%  interrupts.CPU48.=
CAL:Function_call_interrupts
>     606777            -6.8%     565420 =C2=B1 16%  interrupts.CPU48.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU48.MCP:Machin=
e_check_polls
>     166.67 =C2=B1 12%      -7.2%     154.67 =C2=B1 24%  interrupts.CPU48.=
NMI:Non-maskable_interrupts
>     166.67 =C2=B1 12%      -7.2%     154.67 =C2=B1 24%  interrupts.CPU48.=
PMI:Performance_monitoring_interrupts
>     925.67 =C2=B1144%     -45.9%     500.50 =C2=B1 82%  interrupts.CPU48.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      +4.4%       7.83 =C2=B1  4%  interrupts.CPU48.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU49.313:IR-PCI=
-MSI.39321618-edge.nvme0q18
>       0.00          -100.0%       0.00        interrupts.CPU49.441:IR-PCI=
-MSI.39845906-edge.nvme1q18
>       2230 =C2=B1 44%    +386.0%      10842 =C2=B1183%  interrupts.CPU49.=
CAL:Function_call_interrupts
>     606755            -6.4%     567887 =C2=B1 15%  interrupts.CPU49.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU49.MCP:Machin=
e_check_polls
>     209.83 =C2=B1  3%     -13.9%     180.67 =C2=B1 17%  interrupts.CPU49.=
NMI:Non-maskable_interrupts
>     209.83 =C2=B1  3%     -13.9%     180.67 =C2=B1 17%  interrupts.CPU49.=
PMI:Performance_monitoring_interrupts
>       1446 =C2=B1120%     -40.7%     858.00 =C2=B1141%  interrupts.CPU49.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +6.8%       7.83 =C2=B1  4%  interrupts.CPU49.=
TLB:TLB_shootdowns
>     168.83 =C2=B1 15%      -7.8%     155.67 =C2=B1  6%  interrupts.CPU5.1=
98:IR-PCI-MSI.25690161-edge.eth0-TxRx-49
>       0.00          -100.0%       0.00        interrupts.CPU5.261:IR-PCI-=
MSI.25692208-edge
>       0.00          -100.0%       0.00        interrupts.CPU5.366:IR-PCI-=
MSI.39321670-edge.nvme0q70
>       0.00          -100.0%       0.00        interrupts.CPU5.426:IR-PCI-=
MSI.39845958-edge.nvme1q70
>       0.00          -100.0%       0.00        interrupts.CPU5.494:IR-PCI-=
MSI.39845958-edge.nvme1q70
>       1787 =C2=B1  2%      +7.0%       1911 =C2=B1 20%  interrupts.CPU5.C=
AL:Function_call_interrupts
>       1.83 =C2=B1 66%      -9.1%       1.67 =C2=B1 44%  interrupts.CPU5.I=
WI:IRQ_work_interrupts
>     607015            -3.8%     583875 =C2=B1  8%  interrupts.CPU5.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU5.MCP:Machine=
_check_polls
>       6619 =C2=B1 44%      -6.4%       6194 =C2=B1 24%  interrupts.CPU5.N=
MI:Non-maskable_interrupts
>       6619 =C2=B1 44%      -6.4%       6194 =C2=B1 24%  interrupts.CPU5.P=
MI:Performance_monitoring_interrupts
>     312.33 =C2=B1 45%     +10.0%     343.50 =C2=B1 24%  interrupts.CPU5.R=
ES:Rescheduling_interrupts
>       6.00 =C2=B1 23%      +2.8%       6.17 =C2=B1 27%  interrupts.CPU5.T=
LB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU50.444:IR-PCI=
-MSI.39845907-edge.nvme1q19
>       2559 =C2=B1 46%      -8.2%       2348 =C2=B1 55%  interrupts.CPU50.=
CAL:Function_call_interrupts
>       0.17 =C2=B1223%    -100.0%       0.00        interrupts.CPU50.IWI:I=
RQ_work_interrupts
>     607355            -7.7%     560601 =C2=B1 18%  interrupts.CPU50.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU50.MCP:Machin=
e_check_polls
>     212.67 =C2=B1  3%     -13.1%     184.83 =C2=B1 20%  interrupts.CPU50.=
NMI:Non-maskable_interrupts
>     212.67 =C2=B1  3%     -13.1%     184.83 =C2=B1 20%  interrupts.CPU50.=
PMI:Performance_monitoring_interrupts
>     993.00 =C2=B1116%     -18.3%     811.17 =C2=B1136%  interrupts.CPU50.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +9.1%       8.00 =C2=B1  7%  interrupts.CPU50.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU51.444:IR-PCI=
-MSI.39845908-edge.nvme1q20
>       4450 =C2=B1115%    +117.0%       9656 =C2=B1182%  interrupts.CPU51.=
CAL:Function_call_interrupts
>     607160            -5.9%     571045 =C2=B1 13%  interrupts.CPU51.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU51.MCP:Machin=
e_check_polls
>     185.00 =C2=B1 20%      -7.0%     172.00 =C2=B1 24%  interrupts.CPU51.=
NMI:Non-maskable_interrupts
>     185.00 =C2=B1 20%      -7.0%     172.00 =C2=B1 24%  interrupts.CPU51.=
PMI:Performance_monitoring_interrupts
>       1091 =C2=B1106%     -67.1%     358.83 =C2=B1 26%  interrupts.CPU51.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +9.1%       8.00        interrupts.CPU51.TLB:T=
LB_shootdowns
>       2083 =C2=B1 64%     -23.6%       1592 =C2=B1 24%  interrupts.CPU52.=
CAL:Function_call_interrupts
>     606772            -6.6%     566554 =C2=B1 15%  interrupts.CPU52.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU52.MCP:Machin=
e_check_polls
>     239.83 =C2=B1 42%     -20.4%     191.00 =C2=B1 18%  interrupts.CPU52.=
NMI:Non-maskable_interrupts
>     239.83 =C2=B1 42%     -20.4%     191.00 =C2=B1 18%  interrupts.CPU52.=
PMI:Performance_monitoring_interrupts
>       1267 =C2=B1112%     -72.8%     345.33 =C2=B1 16%  interrupts.CPU52.=
RES:Rescheduling_interrupts
>       6.83 =C2=B1 15%     +17.1%       8.00 =C2=B1  7%  interrupts.CPU52.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU53.315:IR-PCI=
-MSI.67137536-edge.ioat-msix
>       1888 =C2=B1  9%      -6.4%       1767        interrupts.CPU53.CAL:F=
unction_call_interrupts
>     606743            -6.8%     565675 =C2=B1 15%  interrupts.CPU53.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU53.MCP:Machin=
e_check_polls
>     143.50 =C2=B1 18%     +13.9%     163.50 =C2=B1 16%  interrupts.CPU53.=
NMI:Non-maskable_interrupts
>     143.50 =C2=B1 18%     +13.9%     163.50 =C2=B1 16%  interrupts.CPU53.=
PMI:Performance_monitoring_interrupts
>     900.33 =C2=B1 92%     -42.2%     520.00 =C2=B1 80%  interrupts.CPU53.=
RES:Rescheduling_interrupts
>       7.00 =C2=B1 16%     +11.9%       7.83 =C2=B1  4%  interrupts.CPU53.=
TLB:TLB_shootdowns
>       2037 =C2=B1 48%     -13.3%       1765        interrupts.CPU54.CAL:F=
unction_call_interrupts
>     606780            -6.8%     565220 =C2=B1 16%  interrupts.CPU54.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU54.MCP:Machin=
e_check_polls
>     147.83 =C2=B1 16%     +26.7%     187.33 =C2=B1 17%  interrupts.CPU54.=
NMI:Non-maskable_interrupts
>     147.83 =C2=B1 16%     +26.7%     187.33 =C2=B1 17%  interrupts.CPU54.=
PMI:Performance_monitoring_interrupts
>     954.33 =C2=B1118%     -67.0%     314.83        interrupts.CPU54.RES:R=
escheduling_interrupts
>       7.17 =C2=B1  5%      +4.7%       7.50 =C2=B1 14%  interrupts.CPU54.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU55.448:IR-PCI=
-MSI.39845912-edge.nvme1q24
>       1788 =C2=B1  2%      -0.7%       1775        interrupts.CPU55.CAL:F=
unction_call_interrupts
>     606678            -6.4%     567813 =C2=B1 15%  interrupts.CPU55.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU55.MCP:Machin=
e_check_polls
>     151.00 =C2=B1 16%    +100.1%     302.17 =C2=B1 86%  interrupts.CPU55.=
NMI:Non-maskable_interrupts
>     151.00 =C2=B1 16%    +100.1%     302.17 =C2=B1 86%  interrupts.CPU55.=
PMI:Performance_monitoring_interrupts
>     579.00 =C2=B1 71%      -9.0%     527.00 =C2=B1 83%  interrupts.CPU55.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%     +15.6%       8.67 =C2=B1 22%  interrupts.CPU55.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU56.450:IR-PCI=
-MSI.39845913-edge.nvme1q25
>       1780           -10.1%       1599 =C2=B1 23%  interrupts.CPU56.CAL:F=
unction_call_interrupts
>     606745            -6.9%     564912 =C2=B1 16%  interrupts.CPU56.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU56.MCP:Machin=
e_check_polls
>     184.33 =C2=B1 18%      +2.6%     189.17 =C2=B1 18%  interrupts.CPU56.=
NMI:Non-maskable_interrupts
>     184.33 =C2=B1 18%      +2.6%     189.17 =C2=B1 18%  interrupts.CPU56.=
PMI:Performance_monitoring_interrupts
>       1039 =C2=B1 69%     -67.8%     334.67 =C2=B1  7%  interrupts.CPU56.=
RES:Rescheduling_interrupts
>       7.17 =C2=B1  9%     +11.6%       8.00 =C2=B1  7%  interrupts.CPU56.=
TLB:TLB_shootdowns
>       1904 =C2=B1 15%      -7.4%       1763        interrupts.CPU57.CAL:F=
unction_call_interrupts
>     606709            -7.0%     563992 =C2=B1 16%  interrupts.CPU57.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU57.MCP:Machin=
e_check_polls
>     181.00 =C2=B1 21%      +5.7%     191.33 =C2=B1 18%  interrupts.CPU57.=
NMI:Non-maskable_interrupts
>     181.00 =C2=B1 21%      +5.7%     191.33 =C2=B1 18%  interrupts.CPU57.=
PMI:Performance_monitoring_interrupts
>     755.83 =C2=B1 91%     -27.7%     546.50 =C2=B1 93%  interrupts.CPU57.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      +6.7%       8.00 =C2=B1  7%  interrupts.CPU57.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU58.323:IR-PCI=
-MSI.39321627-edge.nvme0q27
>       2176 =C2=B1 41%     -18.8%       1765        interrupts.CPU58.CAL:F=
unction_call_interrupts
>     606709            -8.1%     557817 =C2=B1 19%  interrupts.CPU58.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU58.MCP:Machin=
e_check_polls
>     177.67 =C2=B1 20%     +14.3%     203.00 =C2=B1 14%  interrupts.CPU58.=
NMI:Non-maskable_interrupts
>     177.67 =C2=B1 20%     +14.3%     203.00 =C2=B1 14%  interrupts.CPU58.=
PMI:Performance_monitoring_interrupts
>     846.33 =C2=B1 86%     -42.6%     486.00 =C2=B1 69%  interrupts.CPU58.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1 10%      +4.5%       7.67 =C2=B1  6%  interrupts.CPU58.=
TLB:TLB_shootdowns
>       1666 =C2=B1 13%    +176.2%       4603 =C2=B1135%  interrupts.CPU59.=
CAL:Function_call_interrupts
>     606777            -7.6%     560504 =C2=B1 18%  interrupts.CPU59.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU59.MCP:Machin=
e_check_polls
>     144.50 =C2=B1 19%     +34.3%     194.00 =C2=B1 13%  interrupts.CPU59.=
NMI:Non-maskable_interrupts
>     144.50 =C2=B1 19%     +34.3%     194.00 =C2=B1 13%  interrupts.CPU59.=
PMI:Performance_monitoring_interrupts
>     865.33 =C2=B1 71%     -47.9%     450.83 =C2=B1 65%  interrupts.CPU59.=
RES:Rescheduling_interrupts
>       6.83 =C2=B1 13%     +14.6%       7.83 =C2=B1  4%  interrupts.CPU59.=
TLB:TLB_shootdowns
>     150.33 =C2=B1  2%      -0.4%     149.67        interrupts.CPU6.199:IR=
-PCI-MSI.25690162-edge.eth0-TxRx-50
>       0.00          -100.0%       0.00        interrupts.CPU6.262:IR-PCI-=
MSI.25692209-edge
>       0.00          -100.0%       0.00        interrupts.CPU6.367:IR-PCI-=
MSI.39321671-edge.nvme0q71
>       0.00          -100.0%       0.00        interrupts.CPU6.495:IR-PCI-=
MSI.39845959-edge.nvme1q71
>       1760 =C2=B1  4%      -0.9%       1745 =C2=B1  2%  interrupts.CPU6.C=
AL:Function_call_interrupts
>       0.83 =C2=B1128%    +200.0%       2.50 =C2=B1 44%  interrupts.CPU6.I=
WI:IRQ_work_interrupts
>     606887            -3.8%     583603 =C2=B1  8%  interrupts.CPU6.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU6.MCP:Machine=
_check_polls
>       4355 =C2=B1 60%     +84.6%       8039 =C2=B1 22%  interrupts.CPU6.N=
MI:Non-maskable_interrupts
>       4355 =C2=B1 60%     +84.6%       8039 =C2=B1 22%  interrupts.CPU6.P=
MI:Performance_monitoring_interrupts
>     371.33 =C2=B1 18%      -9.4%     336.33 =C2=B1 18%  interrupts.CPU6.R=
ES:Rescheduling_interrupts
>       6.67 =C2=B1 22%     -22.5%       5.17 =C2=B1 17%  interrupts.CPU6.T=
LB:TLB_shootdowns
>       2022 =C2=B1 28%     -12.8%       1763        interrupts.CPU60.CAL:F=
unction_call_interrupts
>       0.17 =C2=B1223%    -100.0%       0.00        interrupts.CPU60.IWI:I=
RQ_work_interrupts
>     606722            -6.8%     565730 =C2=B1 15%  interrupts.CPU60.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU60.MCP:Machin=
e_check_polls
>     167.00 =C2=B1 16%     +14.2%     190.67 =C2=B1 16%  interrupts.CPU60.=
NMI:Non-maskable_interrupts
>     167.00 =C2=B1 16%     +14.2%     190.67 =C2=B1 16%  interrupts.CPU60.=
PMI:Performance_monitoring_interrupts
>     368.50 =C2=B1 31%     -13.4%     319.17 =C2=B1  2%  interrupts.CPU60.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      +2.2%       7.83 =C2=B1  4%  interrupts.CPU60.=
TLB:TLB_shootdowns
>       2018 =C2=B1 28%     -12.5%       1765        interrupts.CPU61.CAL:F=
unction_call_interrupts
>     606745            -8.1%     557897 =C2=B1 19%  interrupts.CPU61.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU61.MCP:Machin=
e_check_polls
>     159.00 =C2=B1 22%     +24.4%     197.83 =C2=B1 14%  interrupts.CPU61.=
NMI:Non-maskable_interrupts
>     159.00 =C2=B1 22%     +24.4%     197.83 =C2=B1 14%  interrupts.CPU61.=
PMI:Performance_monitoring_interrupts
>     754.17 =C2=B1108%     -30.4%     524.83 =C2=B1 87%  interrupts.CPU61.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      +2.2%       7.83 =C2=B1  4%  interrupts.CPU61.=
TLB:TLB_shootdowns
>       1800 =C2=B1  4%      +3.6%       1865 =C2=B1  6%  interrupts.CPU62.=
CAL:Function_call_interrupts
>     606777            -7.3%     562462 =C2=B1 17%  interrupts.CPU62.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU62.MCP:Machin=
e_check_polls
>     177.00 =C2=B1 19%     +14.1%     202.00 =C2=B1 16%  interrupts.CPU62.=
NMI:Non-maskable_interrupts
>     177.00 =C2=B1 19%     +14.1%     202.00 =C2=B1 16%  interrupts.CPU62.=
PMI:Performance_monitoring_interrupts
>     326.50 =C2=B1  7%    +289.8%       1272 =C2=B1105%  interrupts.CPU62.=
RES:Rescheduling_interrupts
>       7.83 =C2=B1  8%      +0.0%       7.83 =C2=B1  4%  interrupts.CPU62.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU63.328:IR-PCI=
-MSI.39321632-edge.nvme0q32
>       1767           +47.3%       2602 =C2=B1 65%  interrupts.CPU63.CAL:F=
unction_call_interrupts
>     606769            -6.9%     564686 =C2=B1 16%  interrupts.CPU63.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU63.MCP:Machin=
e_check_polls
>     184.83 =C2=B1 47%     +72.3%     318.50 =C2=B1 56%  interrupts.CPU63.=
NMI:Non-maskable_interrupts
>     184.83 =C2=B1 47%     +72.3%     318.50 =C2=B1 56%  interrupts.CPU63.=
PMI:Performance_monitoring_interrupts
>     367.83 =C2=B1 31%    +324.5%       1561 =C2=B1 86%  interrupts.CPU63.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      +0.0%       7.67 =C2=B1  6%  interrupts.CPU63.=
TLB:TLB_shootdowns
>       2764 =C2=B1123%     -88.8%     309.17 =C2=B1 70%  interrupts.CPU64.=
162:IR-PCI-MSI.25690125-edge.eth0-TxRx-13
>       0.00          -100.0%       0.00        interrupts.CPU64.225:IR-PCI=
-MSI.25692172-edge
>       0.00          -100.0%       0.00        interrupts.CPU64.297:IR-PCI=
-MSI.39845888-edge.nvme1q0
>       0.00          -100.0%       0.00        interrupts.CPU64.3:IR-IO-AP=
IC.3-edge
>       0.00          -100.0%       0.00        interrupts.CPU64.521:IR-PCI=
-MSI.39845985-edge.nvme1q97
>       0.00          -100.0%       0.00        interrupts.CPU64.545:IR-PCI=
-MSI.30720-edge.ioat-msix
>       1758            +0.1%       1759        interrupts.CPU64.CAL:Functi=
on_call_interrupts
>       1.83 =C2=B1 58%      +0.0%       1.83 =C2=B1 73%  interrupts.CPU64.=
IWI:IRQ_work_interrupts
>     606915            -3.9%     583145 =C2=B1  8%  interrupts.CPU64.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU64.MCP:Machin=
e_check_polls
>       6111 =C2=B1 42%      +8.8%       6646 =C2=B1 42%  interrupts.CPU64.=
NMI:Non-maskable_interrupts
>       6111 =C2=B1 42%      +8.8%       6646 =C2=B1 42%  interrupts.CPU64.=
PMI:Performance_monitoring_interrupts
>     266.17 =C2=B1  9%     +21.9%     324.33 =C2=B1 22%  interrupts.CPU64.=
RES:Rescheduling_interrupts
>       5.17 =C2=B1 45%      +9.7%       5.67 =C2=B1 36%  interrupts.CPU64.=
TLB:TLB_shootdowns
>       4756 =C2=B1201%     -96.7%     155.83 =C2=B1  2%  interrupts.CPU65.=
163:IR-PCI-MSI.25690126-edge.eth0-TxRx-14
>       0.00          -100.0%       0.00        interrupts.CPU65.226:IR-PCI=
-MSI.25692173-edge
>       0.00          -100.0%       0.00        interrupts.CPU65.3:IR-IO-AP=
IC.3-edge
>       0.00          -100.0%       0.00        interrupts.CPU65.522:IR-PCI=
-MSI.39845986-edge.nvme1q98
>       1758            -0.1%       1756        interrupts.CPU65.CAL:Functi=
on_call_interrupts
>       1.17 =C2=B1 31%     +28.6%       1.50 =C2=B1 83%  interrupts.CPU65.=
IWI:IRQ_work_interrupts
>     606948            -3.6%     585343 =C2=B1  8%  interrupts.CPU65.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU65.MCP:Machin=
e_check_polls
>       5266 =C2=B1 17%      +5.6%       5562 =C2=B1 43%  interrupts.CPU65.=
NMI:Non-maskable_interrupts
>       5266 =C2=B1 17%      +5.6%       5562 =C2=B1 43%  interrupts.CPU65.=
PMI:Performance_monitoring_interrupts
>     265.67 =C2=B1  7%     +11.7%     296.83 =C2=B1 29%  interrupts.CPU65.=
RES:Rescheduling_interrupts
>       4.33 =C2=B1 45%      -7.7%       4.00 =C2=B1 32%  interrupts.CPU65.=
TLB:TLB_shootdowns
>     430.33 =C2=B1140%     -30.9%     297.50 =C2=B1 65%  interrupts.CPU66.=
164:IR-PCI-MSI.25690127-edge.eth0-TxRx-15
>       0.00          -100.0%       0.00        interrupts.CPU66.227:IR-PCI=
-MSI.25692174-edge
>       0.00          -100.0%       0.00        interrupts.CPU66.394:IR-PCI=
-MSI.39321699-edge.nvme0q99
>       1761            +2.3%       1801 =C2=B1  5%  interrupts.CPU66.CAL:F=
unction_call_interrupts
>       0.50 =C2=B1223%    +200.0%       1.50 =C2=B1 83%  interrupts.CPU66.=
IWI:IRQ_work_interrupts
>     607417            -4.3%     581530 =C2=B1  9%  interrupts.CPU66.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU66.MCP:Machin=
e_check_polls
>       3644 =C2=B1 73%     +64.5%       5993 =C2=B1 47%  interrupts.CPU66.=
NMI:Non-maskable_interrupts
>       3644 =C2=B1 73%     +64.5%       5993 =C2=B1 47%  interrupts.CPU66.=
PMI:Performance_monitoring_interrupts
>     275.17 =C2=B1 10%    +149.8%     687.50 =C2=B1117%  interrupts.CPU66.=
RES:Rescheduling_interrupts
>       5.83 =C2=B1 23%     +22.9%       7.17 =C2=B1 24%  interrupts.CPU66.=
TLB:TLB_shootdowns
>     151.50 =C2=B1  2%      +6.7%     161.67 =C2=B1  9%  interrupts.CPU67.=
165:IR-PCI-MSI.25690128-edge.eth0-TxRx-16
>       0.00          -100.0%       0.00        interrupts.CPU67.228:IR-PCI=
-MSI.25692175-edge
>       0.00          -100.0%       0.00        interrupts.CPU67.395:IR-PCI=
-MSI.39321700-edge.nvme0q100
>       0.00          -100.0%       0.00        interrupts.CPU67.396:IR-PCI=
-MSI.39321700-edge.nvme0q100
>       0.00          -100.0%       0.00        interrupts.CPU67.524:IR-PCI=
-MSI.39845988-edge.nvme1q100
>       1743            +1.6%       1771        interrupts.CPU67.CAL:Functi=
on_call_interrupts
>       1.67 =C2=B1 66%      +0.0%       1.67 =C2=B1 56%  interrupts.CPU67.=
IWI:IRQ_work_interrupts
>     606990            -3.3%     587082 =C2=B1  7%  interrupts.CPU67.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU67.MCP:Machin=
e_check_polls
>       5960 =C2=B1 38%      +1.6%       6055 =C2=B1 23%  interrupts.CPU67.=
NMI:Non-maskable_interrupts
>       5960 =C2=B1 38%      +1.6%       6055 =C2=B1 23%  interrupts.CPU67.=
PMI:Performance_monitoring_interrupts
>     254.83 =C2=B1  6%     +36.7%     348.33 =C2=B1 69%  interrupts.CPU67.=
RES:Rescheduling_interrupts
>       5.00 =C2=B1 20%     -26.7%       3.67 =C2=B1 51%  interrupts.CPU67.=
TLB:TLB_shootdowns
>     151.83 =C2=B1  3%      +0.2%     152.17 =C2=B1  5%  interrupts.CPU68.=
166:IR-PCI-MSI.25690129-edge.eth0-TxRx-17
>       0.00          -100.0%       0.00        interrupts.CPU68.229:IR-PCI=
-MSI.25692176-edge
>       0.00          -100.0%       0.00        interrupts.CPU68.397:IR-PCI=
-MSI.39321701-edge.nvme0q101
>       0.00          -100.0%       0.00        interrupts.CPU68.398:IR-PCI=
-MSI.39321701-edge.nvme0q101
>       0.00          -100.0%       0.00        interrupts.CPU68.488:IR-PCI=
-MSI.39845989-edge.nvme1q101
>       0.00          -100.0%       0.00        interrupts.CPU68.497:IR-PCI=
-MSI.39321701-edge.nvme0q101
>       0.00          -100.0%       0.00        interrupts.CPU68.525:IR-PCI=
-MSI.39845989-edge.nvme1q101
>       1760            +3.4%       1821 =C2=B1  5%  interrupts.CPU68.CAL:F=
unction_call_interrupts
>       1.17 =C2=B1 58%     +42.9%       1.67 =C2=B1 74%  interrupts.CPU68.=
IWI:IRQ_work_interrupts
>     606886            -4.3%     581083 =C2=B1  9%  interrupts.CPU68.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU68.MCP:Machin=
e_check_polls
>       5317 =C2=B1 31%     +12.1%       5963 =C2=B1 36%  interrupts.CPU68.=
NMI:Non-maskable_interrupts
>       5317 =C2=B1 31%     +12.1%       5963 =C2=B1 36%  interrupts.CPU68.=
PMI:Performance_monitoring_interrupts
>     249.67 =C2=B1  6%    +175.7%     688.33 =C2=B1124%  interrupts.CPU68.=
RES:Rescheduling_interrupts
>       6.83 =C2=B1 19%      -2.4%       6.67 =C2=B1 18%  interrupts.CPU68.=
TLB:TLB_shootdowns
>     148.83            +1.6%     151.17 =C2=B1  3%  interrupts.CPU69.167:I=
R-PCI-MSI.25690130-edge.eth0-TxRx-18
>       0.00          -100.0%       0.00        interrupts.CPU69.230:IR-PCI=
-MSI.25692177-edge
>       0.00          -100.0%       0.00        interrupts.CPU69.398:IR-PCI=
-MSI.39321702-edge.nvme0q102
>       0.00          -100.0%       0.00        interrupts.CPU69.526:IR-PCI=
-MSI.39845990-edge.nvme1q102
>       1795 =C2=B1  4%      -1.5%       1767        interrupts.CPU69.CAL:F=
unction_call_interrupts
>       1.17 =C2=B1 58%     +28.6%       1.50 =C2=B1 50%  interrupts.CPU69.=
IWI:IRQ_work_interrupts
>     606908            -4.2%     581551 =C2=B1  9%  interrupts.CPU69.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU69.MCP:Machin=
e_check_polls
>       5257 =C2=B1 47%     +21.6%       6392 =C2=B1 24%  interrupts.CPU69.=
NMI:Non-maskable_interrupts
>       5257 =C2=B1 47%     +21.6%       6392 =C2=B1 24%  interrupts.CPU69.=
PMI:Performance_monitoring_interrupts
>     654.33 =C2=B1124%     -48.3%     338.17 =C2=B1 29%  interrupts.CPU69.=
RES:Rescheduling_interrupts
>       5.00 =C2=B1 16%      +6.7%       5.33 =C2=B1 50%  interrupts.CPU69.=
TLB:TLB_shootdowns
>     148.33            +4.8%     155.50 =C2=B1  7%  interrupts.CPU7.200:IR=
-PCI-MSI.25690163-edge.eth0-TxRx-51
>       0.00          -100.0%       0.00        interrupts.CPU7.263:IR-PCI-=
MSI.25692210-edge
>       0.00          -100.0%       0.00        interrupts.CPU7.367:IR-PCI-=
MSI.39321672-edge.nvme0q72
>       0.00          -100.0%       0.00        interrupts.CPU7.368:IR-PCI-=
MSI.39321672-edge.nvme0q72
>       0.00          -100.0%       0.00        interrupts.CPU7.496:IR-PCI-=
MSI.39845960-edge.nvme1q72
>       1763            -0.2%       1759        interrupts.CPU7.CAL:Functio=
n_call_interrupts
>       1.83 =C2=B1 58%      -9.1%       1.67 =C2=B1 44%  interrupts.CPU7.I=
WI:IRQ_work_interrupts
>     606903            -3.8%     583560 =C2=B1  8%  interrupts.CPU7.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU7.MCP:Machine=
_check_polls
>       6116 =C2=B1 40%      -3.6%       5896 =C2=B1 24%  interrupts.CPU7.N=
MI:Non-maskable_interrupts
>       6116 =C2=B1 40%      -3.6%       5896 =C2=B1 24%  interrupts.CPU7.P=
MI:Performance_monitoring_interrupts
>     283.33 =C2=B1  4%     +14.9%     325.67 =C2=B1 22%  interrupts.CPU7.R=
ES:Rescheduling_interrupts
>       5.67 =C2=B1 29%      +0.0%       5.67 =C2=B1 26%  interrupts.CPU7.T=
LB:TLB_shootdowns
>     155.67            +3.4%     161.00 =C2=B1  7%  interrupts.CPU70.168:I=
R-PCI-MSI.25690131-edge.eth0-TxRx-19
>       0.00          -100.0%       0.00        interrupts.CPU70.231:IR-PCI=
-MSI.25692178-edge
>       1545 =C2=B1 31%     +15.9%       1791 =C2=B1  3%  interrupts.CPU70.=
CAL:Function_call_interrupts
>       2.50 =C2=B1 64%     -73.3%       0.67 =C2=B1111%  interrupts.CPU70.=
IWI:IRQ_work_interrupts
>     606972            -4.1%     582080 =C2=B1  9%  interrupts.CPU70.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU70.MCP:Machin=
e_check_polls
>       7917 =C2=B1 38%     -40.6%       4700 =C2=B1 40%  interrupts.CPU70.=
NMI:Non-maskable_interrupts
>       7917 =C2=B1 38%     -40.6%       4700 =C2=B1 40%  interrupts.CPU70.=
PMI:Performance_monitoring_interrupts
>     190.00 =C2=B1 35%    +207.3%     583.83 =C2=B1 95%  interrupts.CPU70.=
RES:Rescheduling_interrupts
>       4.17 =C2=B1 50%     +40.0%       5.83 =C2=B1 23%  interrupts.CPU70.=
TLB:TLB_shootdowns
>     149.17            +4.4%     155.67 =C2=B1  6%  interrupts.CPU71.169:I=
R-PCI-MSI.25690132-edge.eth0-TxRx-20
>       0.00          -100.0%       0.00        interrupts.CPU71.232:IR-PCI=
-MSI.25692179-edge
>       0.00          -100.0%       0.00        interrupts.CPU71.399:IR-PCI=
-MSI.39321704-edge.nvme0q104
>       0.00          -100.0%       0.00        interrupts.CPU71.528:IR-PCI=
-MSI.39845992-edge.nvme1q104
>       1763            +1.3%       1785 =C2=B1  2%  interrupts.CPU71.CAL:F=
unction_call_interrupts
>       1.83 =C2=B1 66%      +0.0%       1.83 =C2=B1 48%  interrupts.CPU71.=
IWI:IRQ_work_interrupts
>     606890            -4.1%     581907 =C2=B1  9%  interrupts.CPU71.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU71.MCP:Machin=
e_check_polls
>       6094 =C2=B1 44%     +10.9%       6760 =C2=B1 26%  interrupts.CPU71.=
NMI:Non-maskable_interrupts
>       6094 =C2=B1 44%     +10.9%       6760 =C2=B1 26%  interrupts.CPU71.=
PMI:Performance_monitoring_interrupts
>     269.00 =C2=B1 15%    +110.3%     565.67 =C2=B1 93%  interrupts.CPU71.=
RES:Rescheduling_interrupts
>       5.83 =C2=B1 18%      -8.6%       5.33 =C2=B1 20%  interrupts.CPU71.=
TLB:TLB_shootdowns
>     151.83 =C2=B1  4%      -2.2%     148.50        interrupts.CPU72.170:I=
R-PCI-MSI.25690133-edge.eth0-TxRx-21
>       0.00          -100.0%       0.00        interrupts.CPU72.233:IR-PCI=
-MSI.25692180-edge
>       0.00          -100.0%       0.00        interrupts.CPU72.529:IR-PCI=
-MSI.39845993-edge.nvme1q105
>       1761            +0.2%       1764        interrupts.CPU72.CAL:Functi=
on_call_interrupts
>       1.00 =C2=B1 57%      +0.0%       1.00 =C2=B1 57%  interrupts.CPU72.=
IWI:IRQ_work_interrupts
>     606930            -4.4%     580380 =C2=B1  9%  interrupts.CPU72.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU72.MCP:Machin=
e_check_polls
>       4562 =C2=B1 37%     +17.5%       5361 =C2=B1 23%  interrupts.CPU72.=
NMI:Non-maskable_interrupts
>       4562 =C2=B1 37%     +17.5%       5361 =C2=B1 23%  interrupts.CPU72.=
PMI:Performance_monitoring_interrupts
>     264.33 =C2=B1  4%     +20.6%     318.83 =C2=B1 19%  interrupts.CPU72.=
RES:Rescheduling_interrupts
>       5.83 =C2=B1 26%     +14.3%       6.67 =C2=B1 20%  interrupts.CPU72.=
TLB:TLB_shootdowns
>     148.33            +3.7%     153.83 =C2=B1  7%  interrupts.CPU73.171:I=
R-PCI-MSI.25690134-edge.eth0-TxRx-22
>       0.00          -100.0%       0.00        interrupts.CPU73.234:IR-PCI=
-MSI.25692181-edge
>       0.00          -100.0%       0.00        interrupts.CPU73.507:IR-PCI=
-MSI.39321706-edge.nvme0q106
>       1760            +0.9%       1776 =C2=B1  2%  interrupts.CPU73.CAL:F=
unction_call_interrupts
>       1.50 =C2=B1 74%     +44.4%       2.17 =C2=B1 62%  interrupts.CPU73.=
IWI:IRQ_work_interrupts
>     606983            -4.2%     581367 =C2=B1  9%  interrupts.CPU73.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU73.MCP:Machin=
e_check_polls
>       6099 =C2=B1 50%     +15.0%       7012 =C2=B1 42%  interrupts.CPU73.=
NMI:Non-maskable_interrupts
>       6099 =C2=B1 50%     +15.0%       7012 =C2=B1 42%  interrupts.CPU73.=
PMI:Performance_monitoring_interrupts
>     252.17 =C2=B1 28%     +29.7%     327.17 =C2=B1 24%  interrupts.CPU73.=
RES:Rescheduling_interrupts
>       5.17 =C2=B1 34%     -29.0%       3.67 =C2=B1 20%  interrupts.CPU73.=
TLB:TLB_shootdowns
>     148.50            +0.0%     148.50        interrupts.CPU74.172:IR-PCI=
-MSI.25690135-edge.eth0-TxRx-23
>       0.00          -100.0%       0.00        interrupts.CPU74.235:IR-PCI=
-MSI.25692182-edge
>       0.00          -100.0%       0.00        interrupts.CPU74.401:IR-PCI=
-MSI.39321707-edge.nvme0q107
>       0.00          -100.0%       0.00        interrupts.CPU74.402:IR-PCI=
-MSI.39321707-edge.nvme0q107
>       0.00          -100.0%       0.00        interrupts.CPU74.404:IR-PCI=
-MSI.39321707-edge.nvme0q107
>       0.00          -100.0%       0.00        interrupts.CPU74.510:IR-PCI=
-MSI.39845995-edge.nvme1q107
>       0.00          -100.0%       0.00        interrupts.CPU74.531:IR-PCI=
-MSI.39845995-edge.nvme1q107
>       1762            +0.1%       1763        interrupts.CPU74.CAL:Functi=
on_call_interrupts
>       2.67 =C2=B1 41%     -31.2%       1.83 =C2=B1 58%  interrupts.CPU74.=
IWI:IRQ_work_interrupts
>     606952            -4.4%     580489 =C2=B1  9%  interrupts.CPU74.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU74.MCP:Machin=
e_check_polls
>       8738 =C2=B1 30%     -26.9%       6384 =C2=B1 22%  interrupts.CPU74.=
NMI:Non-maskable_interrupts
>       8738 =C2=B1 30%     -26.9%       6384 =C2=B1 22%  interrupts.CPU74.=
PMI:Performance_monitoring_interrupts
>     229.50 =C2=B1 30%     +46.8%     336.83 =C2=B1 15%  interrupts.CPU74.=
RES:Rescheduling_interrupts
>       5.17 =C2=B1 32%      +0.0%       5.17 =C2=B1 51%  interrupts.CPU74.=
TLB:TLB_shootdowns
>     148.67            +0.6%     149.50        interrupts.CPU75.173:IR-PCI=
-MSI.25690136-edge.eth0-TxRx-24
>       0.00          -100.0%       0.00        interrupts.CPU75.236:IR-PCI=
-MSI.25692183-edge
>       0.00          -100.0%       0.00        interrupts.CPU75.403:IR-PCI=
-MSI.39321708-edge.nvme0q108
>       0.00          -100.0%       0.00        interrupts.CPU75.404:IR-PCI=
-MSI.39321708-edge.nvme0q108
>       0.00          -100.0%       0.00        interrupts.CPU75.499:IR-PCI=
-MSI.39321708-edge.nvme0q108
>       0.00          -100.0%       0.00        interrupts.CPU75.511:IR-PCI=
-MSI.39321708-edge.nvme0q108
>       0.00          -100.0%       0.00        interrupts.CPU75.532:IR-PCI=
-MSI.39845996-edge.nvme1q108
>       1759            +3.4%       1819 =C2=B1  3%  interrupts.CPU75.CAL:F=
unction_call_interrupts
>       2.17 =C2=B1 56%     -23.1%       1.67 =C2=B1 66%  interrupts.CPU75.=
IWI:IRQ_work_interrupts
>     606892            -4.2%     581225 =C2=B1  9%  interrupts.CPU75.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU75.MCP:Machin=
e_check_polls
>       7233 =C2=B1 23%     -19.5%       5825 =C2=B1 35%  interrupts.CPU75.=
NMI:Non-maskable_interrupts
>       7233 =C2=B1 23%     -19.5%       5825 =C2=B1 35%  interrupts.CPU75.=
PMI:Performance_monitoring_interrupts
>     267.33 =C2=B1 12%    +202.8%     809.50 =C2=B1 88%  interrupts.CPU75.=
RES:Rescheduling_interrupts
>       6.33 =C2=B1 38%     -23.7%       4.83 =C2=B1 32%  interrupts.CPU75.=
TLB:TLB_shootdowns
>     158.33 =C2=B1  8%      +7.5%     170.17 =C2=B1 28%  interrupts.CPU76.=
174:IR-PCI-MSI.25690137-edge.eth0-TxRx-25
>       0.00          -100.0%       0.00        interrupts.CPU76.237:IR-PCI=
-MSI.25692184-edge
>       0.00          -100.0%       0.00        interrupts.CPU76.406:IR-PCI=
-MSI.39321709-edge.nvme0q109
>       1776 =C2=B1  2%      -1.4%       1751 =C2=B1  2%  interrupts.CPU76.=
CAL:Function_call_interrupts
>       1.83 =C2=B1 37%     +27.3%       2.33 =C2=B1 63%  interrupts.CPU76.=
IWI:IRQ_work_interrupts
>     606916            -4.2%     581513 =C2=B1  9%  interrupts.CPU76.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU76.MCP:Machin=
e_check_polls
>       7377 =C2=B1 15%      +3.8%       7653 =C2=B1 40%  interrupts.CPU76.=
NMI:Non-maskable_interrupts
>       7377 =C2=B1 15%      +3.8%       7653 =C2=B1 40%  interrupts.CPU76.=
PMI:Performance_monitoring_interrupts
>     253.83 =C2=B1  3%     +36.4%     346.33 =C2=B1 44%  interrupts.CPU76.=
RES:Rescheduling_interrupts
>       5.67 =C2=B1 26%      +5.9%       6.00 =C2=B1 21%  interrupts.CPU76.=
TLB:TLB_shootdowns
>     157.50 =C2=B1  3%      -2.3%     153.83 =C2=B1  7%  interrupts.CPU77.=
175:IR-PCI-MSI.25690138-edge.eth0-TxRx-26
>       0.00          -100.0%       0.00        interrupts.CPU77.238:IR-PCI=
-MSI.25692185-edge
>       1760            +0.3%       1765        interrupts.CPU77.CAL:Functi=
on_call_interrupts
>       1.33 =C2=B1 70%     +25.0%       1.67 =C2=B1 28%  interrupts.CPU77.=
IWI:IRQ_work_interrupts
>     606934            -4.3%     580660 =C2=B1  9%  interrupts.CPU77.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU77.MCP:Machin=
e_check_polls
>       5329 =C2=B1 39%     +18.3%       6305 =C2=B1 23%  interrupts.CPU77.=
NMI:Non-maskable_interrupts
>       5329 =C2=B1 39%     +18.3%       6305 =C2=B1 23%  interrupts.CPU77.=
PMI:Performance_monitoring_interrupts
>     273.67 =C2=B1 12%     +14.3%     312.67 =C2=B1 22%  interrupts.CPU77.=
RES:Rescheduling_interrupts
>       6.83 =C2=B1 25%     -22.0%       5.33 =C2=B1 25%  interrupts.CPU77.=
TLB:TLB_shootdowns
>     150.67            +5.9%     159.50 =C2=B1 15%  interrupts.CPU78.176:I=
R-PCI-MSI.25690139-edge.eth0-TxRx-27
>       0.00          -100.0%       0.00        interrupts.CPU78.239:IR-PCI=
-MSI.25692186-edge
>       0.00          -100.0%       0.00        interrupts.CPU78.407:IR-PCI=
-MSI.39321711-edge.nvme0q111
>       0.00          -100.0%       0.00        interrupts.CPU78.408:IR-PCI=
-MSI.39321711-edge.nvme0q111
>       0.00          -100.0%       0.00        interrupts.CPU78.505:IR-PCI=
-MSI.39321711-edge.nvme0q111
>       0.00          -100.0%       0.00        interrupts.CPU78.534:IR-PCI=
-MSI.39845999-edge.nvme1q111
>       1781 =C2=B1  2%      -0.9%       1764        interrupts.CPU78.CAL:F=
unction_call_interrupts
>       2.33 =C2=B1 63%     -85.7%       0.33 =C2=B1141%  interrupts.CPU78.=
IWI:IRQ_work_interrupts
>     606894            -4.1%     581898 =C2=B1  9%  interrupts.CPU78.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU78.MCP:Machin=
e_check_polls
>       7596 =C2=B1 47%     -55.0%       3421 =C2=B1 43%  interrupts.CPU78.=
NMI:Non-maskable_interrupts
>       7596 =C2=B1 47%     -55.0%       3421 =C2=B1 43%  interrupts.CPU78.=
PMI:Performance_monitoring_interrupts
>     503.00 =C2=B1110%     -35.8%     323.00 =C2=B1 24%  interrupts.CPU78.=
RES:Rescheduling_interrupts
>       5.50 =C2=B1 22%     +27.3%       7.00 =C2=B1 28%  interrupts.CPU78.=
TLB:TLB_shootdowns
>     148.33            +1.9%     151.17 =C2=B1  2%  interrupts.CPU79.177:I=
R-PCI-MSI.25690140-edge.eth0-TxRx-28
>       0.00          -100.0%       0.00        interrupts.CPU79.240:IR-PCI=
-MSI.25692187-edge
>       0.00          -100.0%       0.00        interrupts.CPU79.536:IR-PCI=
-MSI.39846000-edge.nvme1q112
>       1759            +0.2%       1762        interrupts.CPU79.CAL:Functi=
on_call_interrupts
>       1.50 =C2=B1 74%     -66.7%       0.50 =C2=B1100%  interrupts.CPU79.=
IWI:IRQ_work_interrupts
>     606883            -4.1%     581711 =C2=B1  9%  interrupts.CPU79.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU79.MCP:Machin=
e_check_polls
>       5757 =C2=B1 41%     -27.3%       4184 =C2=B1 32%  interrupts.CPU79.=
NMI:Non-maskable_interrupts
>       5757 =C2=B1 41%     -27.3%       4184 =C2=B1 32%  interrupts.CPU79.=
PMI:Performance_monitoring_interrupts
>     258.00 =C2=B1  4%     +23.6%     319.00 =C2=B1 26%  interrupts.CPU79.=
RES:Rescheduling_interrupts
>       4.83 =C2=B1 22%      +3.4%       5.00 =C2=B1 20%  interrupts.CPU79.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU8.136:IR-PCI-=
MSI.38830080-edge.PCIe.PME,pciehp
>     148.83            +0.4%     149.50        interrupts.CPU8.201:IR-PCI-=
MSI.25690164-edge.eth0-TxRx-52
>       0.00          -100.0%       0.00        interrupts.CPU8.264:IR-PCI-=
MSI.25692211-edge
>       0.00          -100.0%       0.00        interrupts.CPU8.369:IR-PCI-=
MSI.39321673-edge.nvme0q73
>       0.00          -100.0%       0.00        interrupts.CPU8.497:IR-PCI-=
MSI.39845961-edge.nvme1q73
>       1766            -0.0%       1766        interrupts.CPU8.CAL:Functio=
n_call_interrupts
>       2.50 =C2=B1 38%     -13.3%       2.17 =C2=B1 31%  interrupts.CPU8.I=
WI:IRQ_work_interrupts
>     606911            -3.6%     584891 =C2=B1  8%  interrupts.CPU8.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU8.MCP:Machine=
_check_polls
>       7907 =C2=B1 27%      -3.2%       7652 =C2=B1 16%  interrupts.CPU8.N=
MI:Non-maskable_interrupts
>       7907 =C2=B1 27%      -3.2%       7652 =C2=B1 16%  interrupts.CPU8.P=
MI:Performance_monitoring_interrupts
>     275.33 =C2=B1  5%     +42.2%     391.50 =C2=B1 61%  interrupts.CPU8.R=
ES:Rescheduling_interrupts
>       5.83 =C2=B1 18%     -22.9%       4.50 =C2=B1 37%  interrupts.CPU8.T=
LB:TLB_shootdowns
>     149.00            +0.2%     149.33        interrupts.CPU80.178:IR-PCI=
-MSI.25690141-edge.eth0-TxRx-29
>       0.00          -100.0%       0.00        interrupts.CPU80.241:IR-PCI=
-MSI.25692188-edge
>       0.00          -100.0%       0.00        interrupts.CPU80.408:IR-PCI=
-MSI.39321713-edge.nvme0q113
>       0.00          -100.0%       0.00        interrupts.CPU80.522:IR-PCI=
-MSI.39846001-edge.nvme1q113
>       0.00          -100.0%       0.00        interrupts.CPU80.537:IR-PCI=
-MSI.39846001-edge.nvme1q113
>       1801 =C2=B1  3%      -0.9%       1784        interrupts.CPU80.CAL:F=
unction_call_interrupts
>     610320            -3.9%     586752 =C2=B1  8%  interrupts.CPU80.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU80.MCP:Machin=
e_check_polls
>     145.67 =C2=B1 17%      +6.1%     154.50 =C2=B1 33%  interrupts.CPU80.=
NMI:Non-maskable_interrupts
>     145.67 =C2=B1 17%      +6.1%     154.50 =C2=B1 33%  interrupts.CPU80.=
PMI:Performance_monitoring_interrupts
>     678.67 =C2=B1 62%     -16.1%     569.67 =C2=B1 70%  interrupts.CPU80.=
RES:Rescheduling_interrupts
>       8.00 =C2=B1 12%      +2.1%       8.17 =C2=B1  4%  interrupts.CPU80.=
TLB:TLB_shootdowns
>     148.67            -0.1%     148.50        interrupts.CPU81.179:IR-PCI=
-MSI.25690142-edge.eth0-TxRx-30
>       0.00          -100.0%       0.00        interrupts.CPU81.242:IR-PCI=
-MSI.25692189-edge
>       1787 =C2=B1  5%     +26.2%       2256 =C2=B1 39%  interrupts.CPU81.=
CAL:Function_call_interrupts
>     607932            -3.5%     586677 =C2=B1  8%  interrupts.CPU81.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU81.MCP:Machin=
e_check_polls
>     158.00 =C2=B1 15%     +65.9%     262.17 =C2=B1 93%  interrupts.CPU81.=
NMI:Non-maskable_interrupts
>     158.00 =C2=B1 15%     +65.9%     262.17 =C2=B1 93%  interrupts.CPU81.=
PMI:Performance_monitoring_interrupts
>     805.67 =C2=B1104%    +219.7%       2576 =C2=B1128%  interrupts.CPU81.=
RES:Rescheduling_interrupts
>       7.83 =C2=B1 11%      -2.1%       7.67 =C2=B1  9%  interrupts.CPU81.=
TLB:TLB_shootdowns
>     148.67            -0.1%     148.50        interrupts.CPU82.180:IR-PCI=
-MSI.25690143-edge.eth0-TxRx-31
>       0.00          -100.0%       0.00        interrupts.CPU82.243:IR-PCI=
-MSI.25692190-edge
>       4360 =C2=B1 81%     -23.8%       3323 =C2=B1 59%  interrupts.CPU82.=
CAL:Function_call_interrupts
>       0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU82.IWI:I=
RQ_work_interrupts
>     608136            -2.7%     591608 =C2=B1  7%  interrupts.CPU82.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU82.MCP:Machin=
e_check_polls
>     175.00 =C2=B1 14%      -6.3%     164.00 =C2=B1 49%  interrupts.CPU82.=
NMI:Non-maskable_interrupts
>     175.00 =C2=B1 14%      -6.3%     164.00 =C2=B1 49%  interrupts.CPU82.=
PMI:Performance_monitoring_interrupts
>      19238 =C2=B1138%     -35.8%      12343 =C2=B1116%  interrupts.CPU82.=
RES:Rescheduling_interrupts
>       7.17 =C2=B1  5%      +7.0%       7.67 =C2=B1 16%  interrupts.CPU82.=
TLB:TLB_shootdowns
>     149.00            +0.0%     149.00        interrupts.CPU83.181:IR-PCI=
-MSI.25690144-edge.eth0-TxRx-32
>       0.00          -100.0%       0.00        interrupts.CPU83.244:IR-PCI=
-MSI.25692191-edge
>       0.00          -100.0%       0.00        interrupts.CPU83.412:IR-PCI=
-MSI.39321716-edge.nvme0q116
>       0.00          -100.0%       0.00        interrupts.CPU83.540:IR-PCI=
-MSI.39846004-edge.nvme1q116
>       0.00          -100.0%       0.00        interrupts.CPU83.541:IR-PCI=
-MSI.39846004-edge.nvme1q116
>       2886 =C2=B1 77%     -14.2%       2477 =C2=B1 35%  interrupts.CPU83.=
CAL:Function_call_interrupts
>     606804            -2.7%     590402 =C2=B1  6%  interrupts.CPU83.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU83.MCP:Machin=
e_check_polls
>     166.83 =C2=B1 13%     -36.3%     106.33 =C2=B1 27%  interrupts.CPU83.=
NMI:Non-maskable_interrupts
>     166.83 =C2=B1 13%     -36.3%     106.33 =C2=B1 27%  interrupts.CPU83.=
PMI:Performance_monitoring_interrupts
>       9051 =C2=B1188%     -40.0%       5429 =C2=B1100%  interrupts.CPU83.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      +2.2%       7.83 =C2=B1  8%  interrupts.CPU83.=
TLB:TLB_shootdowns
>     148.33            +0.3%     148.83        interrupts.CPU84.182:IR-PCI=
-MSI.25690145-edge.eth0-TxRx-33
>       0.00          -100.0%       0.00        interrupts.CPU84.245:IR-PCI=
-MSI.25692192-edge
>       0.00          -100.0%       0.00        interrupts.CPU84.412:IR-PCI=
-MSI.39321717-edge.nvme0q117
>       0.00          -100.0%       0.00        interrupts.CPU84.413:IR-PCI=
-MSI.39321717-edge.nvme0q117
>       0.00          -100.0%       0.00        interrupts.CPU84.530:IR-PCI=
-MSI.39846005-edge.nvme1q117
>       0.00          -100.0%       0.00        interrupts.CPU84.541:IR-PCI=
-MSI.39846005-edge.nvme1q117
>       3265 =C2=B1 89%     -40.3%       1949 =C2=B1 13%  interrupts.CPU84.=
CAL:Function_call_interrupts
>     606919            -2.9%     589323 =C2=B1  6%  interrupts.CPU84.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU84.MCP:Machin=
e_check_polls
>     278.00 =C2=B1 97%     -63.2%     102.17 =C2=B1 30%  interrupts.CPU84.=
NMI:Non-maskable_interrupts
>     278.00 =C2=B1 97%     -63.2%     102.17 =C2=B1 30%  interrupts.CPU84.=
PMI:Performance_monitoring_interrupts
>      11427 =C2=B1180%     -81.6%       2099 =C2=B1114%  interrupts.CPU84.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      +0.0%       7.67 =C2=B1 16%  interrupts.CPU84.=
TLB:TLB_shootdowns
>     149.83 =C2=B1  2%      -1.1%     148.17        interrupts.CPU85.183:I=
R-PCI-MSI.25690146-edge.eth0-TxRx-34
>       0.00          -100.0%       0.00        interrupts.CPU85.246:IR-PCI=
-MSI.25692193-edge
>       0.00          -100.0%       0.00        interrupts.CPU85.413:IR-PCI=
-MSI.39321718-edge.nvme0q118
>       0.00          -100.0%       0.00        interrupts.CPU85.414:IR-PCI=
-MSI.39321718-edge.nvme0q118
>       0.00          -100.0%       0.00        interrupts.CPU85.541:IR-PCI=
-MSI.39846006-edge.nvme1q118
>       0.00          -100.0%       0.00        interrupts.CPU85.542:IR-PCI=
-MSI.39846006-edge.nvme1q118
>       1817 =C2=B1  4%      -2.8%       1767        interrupts.CPU85.CAL:F=
unction_call_interrupts
>     607142            -3.6%     585347 =C2=B1  8%  interrupts.CPU85.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU85.MCP:Machin=
e_check_polls
>     144.50 =C2=B1 17%     -23.0%     111.33 =C2=B1 25%  interrupts.CPU85.=
NMI:Non-maskable_interrupts
>     144.50 =C2=B1 17%     -23.0%     111.33 =C2=B1 25%  interrupts.CPU85.=
PMI:Performance_monitoring_interrupts
>     790.33 =C2=B1103%     -48.1%     409.83 =C2=B1 19%  interrupts.CPU85.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1 10%      +4.4%       7.83 =C2=B1 15%  interrupts.CPU85.=
TLB:TLB_shootdowns
>     148.83            +1.0%     150.33        interrupts.CPU86.184:IR-PCI=
-MSI.25690147-edge.eth0-TxRx-35
>       0.00          -100.0%       0.00        interrupts.CPU86.247:IR-PCI=
-MSI.25692194-edge
>       0.00          -100.0%       0.00        interrupts.CPU86.413:IR-PCI=
-MSI.39321719-edge.nvme0q119
>       0.00          -100.0%       0.00        interrupts.CPU86.414:IR-PCI=
-MSI.39321719-edge.nvme0q119
>       0.00          -100.0%       0.00        interrupts.CPU86.543:IR-PCI=
-MSI.39846007-edge.nvme1q119
>       2663 =C2=B1 75%      +9.2%       2909 =C2=B1 88%  interrupts.CPU86.=
CAL:Function_call_interrupts
>     608590            -3.6%     586581 =C2=B1  7%  interrupts.CPU86.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU86.MCP:Machin=
e_check_polls
>     151.67 =C2=B1  7%     -28.6%     108.33 =C2=B1 19%  interrupts.CPU86.=
NMI:Non-maskable_interrupts
>     151.67 =C2=B1  7%     -28.6%     108.33 =C2=B1 19%  interrupts.CPU86.=
PMI:Performance_monitoring_interrupts
>       8748 =C2=B1212%      +6.7%       9331 =C2=B1212%  interrupts.CPU86.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1  6%      -6.5%       7.17 =C2=B1  9%  interrupts.CPU86.=
TLB:TLB_shootdowns
>     148.33            -0.1%     148.17        interrupts.CPU87.185:IR-PCI=
-MSI.25690148-edge.eth0-TxRx-36
>       0.00          -100.0%       0.00        interrupts.CPU87.248:IR-PCI=
-MSI.25692195-edge
>       0.00          -100.0%       0.00        interrupts.CPU87.415:IR-PCI=
-MSI.39321720-edge.nvme0q120
>       0.00          -100.0%       0.00        interrupts.CPU87.416:IR-PCI=
-MSI.39321720-edge.nvme0q120
>       0.00          -100.0%       0.00        interrupts.CPU87.536:IR-PCI=
-MSI.39846008-edge.nvme1q120
>       0.00          -100.0%       0.00        interrupts.CPU87.544:IR-PCI=
-MSI.39846008-edge.nvme1q120
>       2084 =C2=B1 32%     -14.1%       1791 =C2=B1  7%  interrupts.CPU87.=
CAL:Function_call_interrupts
>     608358            -3.9%     584850 =C2=B1  8%  interrupts.CPU87.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU87.MCP:Machin=
e_check_polls
>     154.67 =C2=B1  7%     -30.4%     107.67 =C2=B1 27%  interrupts.CPU87.=
NMI:Non-maskable_interrupts
>     154.67 =C2=B1  7%     -30.4%     107.67 =C2=B1 27%  interrupts.CPU87.=
PMI:Performance_monitoring_interrupts
>       1455 =C2=B1126%     -68.0%     465.17 =C2=B1 27%  interrupts.CPU87.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1 12%      +4.5%       7.67 =C2=B1  9%  interrupts.CPU87.=
TLB:TLB_shootdowns
>     149.17            -0.6%     148.33        interrupts.CPU88.186:IR-PCI=
-MSI.25690149-edge.eth0-TxRx-37
>       0.00          -100.0%       0.00        interrupts.CPU88.249:IR-PCI=
-MSI.25692196-edge
>       0.00          -100.0%       0.00        interrupts.CPU88.544:IR-PCI=
-MSI.39846009-edge.nvme1q121
>       1754 =C2=B1  2%      +1.9%       1787 =C2=B1  2%  interrupts.CPU88.=
CAL:Function_call_interrupts
>     607910            -3.6%     585881 =C2=B1  7%  interrupts.CPU88.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU88.MCP:Machin=
e_check_polls
>     158.67 =C2=B1 12%     -33.5%     105.50 =C2=B1 26%  interrupts.CPU88.=
NMI:Non-maskable_interrupts
>     158.67 =C2=B1 12%     -33.5%     105.50 =C2=B1 26%  interrupts.CPU88.=
PMI:Performance_monitoring_interrupts
>     424.83 =C2=B1 20%      -1.0%     420.67 =C2=B1 22%  interrupts.CPU88.=
RES:Rescheduling_interrupts
>       7.67 =C2=B1 14%      +4.3%       8.00 =C2=B1  7%  interrupts.CPU88.=
TLB:TLB_shootdowns
>     148.83            -0.4%     148.17        interrupts.CPU89.187:IR-PCI=
-MSI.25690150-edge.eth0-TxRx-38
>       0.00          -100.0%       0.00        interrupts.CPU89.250:IR-PCI=
-MSI.25692197-edge
>       0.00          -100.0%       0.00        interrupts.CPU89.546:IR-PCI=
-MSI.39846010-edge.nvme1q122
>       1782            +1.7%       1813 =C2=B1  3%  interrupts.CPU89.CAL:F=
unction_call_interrupts
>     607412            -3.5%     586291 =C2=B1  7%  interrupts.CPU89.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU89.MCP:Machin=
e_check_polls
>     157.17 =C2=B1 11%     -28.1%     113.00 =C2=B1 27%  interrupts.CPU89.=
NMI:Non-maskable_interrupts
>     157.17 =C2=B1 11%     -28.1%     113.00 =C2=B1 27%  interrupts.CPU89.=
PMI:Performance_monitoring_interrupts
>     423.00 =C2=B1 24%     +76.9%     748.33 =C2=B1107%  interrupts.CPU89.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1 18%      +2.2%       7.67 =C2=B1  9%  interrupts.CPU89.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU9.137:IR-PCI-=
MSI.38846464-edge.PCIe.PME,pciehp
>     154.67 =C2=B1  5%      -4.2%     148.17        interrupts.CPU9.202:IR=
-PCI-MSI.25690165-edge.eth0-TxRx-53
>       0.00          -100.0%       0.00        interrupts.CPU9.265:IR-PCI-=
MSI.25692212-edge
>       0.00          -100.0%       0.00        interrupts.CPU9.444:IR-PCI-=
MSI.39845962-edge.nvme1q74
>       0.00          -100.0%       0.00        interrupts.CPU9.498:IR-PCI-=
MSI.39845962-edge.nvme1q74
>       1762            +0.1%       1764        interrupts.CPU9.CAL:Functio=
n_call_interrupts
>       1.83 =C2=B1 58%      -9.1%       1.67 =C2=B1 82%  interrupts.CPU9.I=
WI:IRQ_work_interrupts
>     606887            -3.8%     583756 =C2=B1  8%  interrupts.CPU9.LOC:Lo=
cal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU9.MCP:Machine=
_check_polls
>       6042 =C2=B1 52%      -0.5%       6010 =C2=B1 49%  interrupts.CPU9.N=
MI:Non-maskable_interrupts
>       6042 =C2=B1 52%      -0.5%       6010 =C2=B1 49%  interrupts.CPU9.P=
MI:Performance_monitoring_interrupts
>     318.83 =C2=B1 12%      +6.4%     339.33 =C2=B1 20%  interrupts.CPU9.R=
ES:Rescheduling_interrupts
>       6.17 =C2=B1 28%     +21.6%       7.50 =C2=B1 14%  interrupts.CPU9.T=
LB:TLB_shootdowns
>     148.67            +0.1%     148.83        interrupts.CPU90.188:IR-PCI=
-MSI.25690151-edge.eth0-TxRx-39
>       0.00          -100.0%       0.00        interrupts.CPU90.251:IR-PCI=
-MSI.25692198-edge
>       1796            -1.0%       1777        interrupts.CPU90.CAL:Functi=
on_call_interrupts
>     607541            -3.2%     588075 =C2=B1  7%  interrupts.CPU90.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU90.MCP:Machin=
e_check_polls
>     154.83 =C2=B1 11%     -27.6%     112.17 =C2=B1 26%  interrupts.CPU90.=
NMI:Non-maskable_interrupts
>     154.83 =C2=B1 11%     -27.6%     112.17 =C2=B1 26%  interrupts.CPU90.=
PMI:Performance_monitoring_interrupts
>     411.50 =C2=B1 18%      -3.0%     399.00 =C2=B1 14%  interrupts.CPU90.=
RES:Rescheduling_interrupts
>       7.00 =C2=B1  8%      +7.1%       7.50 =C2=B1 10%  interrupts.CPU90.=
TLB:TLB_shootdowns
>     148.33            -0.1%     148.17        interrupts.CPU91.189:IR-PCI=
-MSI.25690152-edge.eth0-TxRx-40
>       0.00          -100.0%       0.00        interrupts.CPU91.252:IR-PCI=
-MSI.25692199-edge
>       0.00          -100.0%       0.00        interrupts.CPU91.418:IR-PCI=
-MSI.39321724-edge.nvme0q124
>       0.00          -100.0%       0.00        interrupts.CPU91.419:IR-PCI=
-MSI.39321724-edge.nvme0q124
>       2341 =C2=B1 52%     -24.2%       1775        interrupts.CPU91.CAL:F=
unction_call_interrupts
>     606915            -2.9%     589034 =C2=B1  7%  interrupts.CPU91.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU91.MCP:Machin=
e_check_polls
>     163.50 =C2=B1 13%      +1.2%     165.50 =C2=B1 47%  interrupts.CPU91.=
NMI:Non-maskable_interrupts
>     163.50 =C2=B1 13%      +1.2%     165.50 =C2=B1 47%  interrupts.CPU91.=
PMI:Performance_monitoring_interrupts
>       7776 =C2=B1210%     -93.3%     521.33 =C2=B1 54%  interrupts.CPU91.=
RES:Rescheduling_interrupts
>       6.83 =C2=B1  5%     +12.2%       7.67 =C2=B1  9%  interrupts.CPU91.=
TLB:TLB_shootdowns
>     148.67            +1.1%     150.33 =C2=B1  2%  interrupts.CPU92.190:I=
R-PCI-MSI.25690153-edge.eth0-TxRx-41
>       0.00          -100.0%       0.00        interrupts.CPU92.253:IR-PCI=
-MSI.25692200-edge
>       0.00          -100.0%       0.00        interrupts.CPU92.420:IR-PCI=
-MSI.39321725-edge.nvme0q125
>       0.00          -100.0%       0.00        interrupts.CPU92.422:IR-PCI=
-MSI.39321725-edge.nvme0q125
>       2247 =C2=B1 47%     +80.4%       4054 =C2=B1 79%  interrupts.CPU92.=
CAL:Function_call_interrupts
>     607233            -3.7%     584759 =C2=B1  8%  interrupts.CPU92.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU92.MCP:Machin=
e_check_polls
>     166.00 =C2=B1 12%      -5.1%     157.50 =C2=B1 45%  interrupts.CPU92.=
NMI:Non-maskable_interrupts
>     166.00 =C2=B1 12%      -5.1%     157.50 =C2=B1 45%  interrupts.CPU92.=
PMI:Performance_monitoring_interrupts
>       2783 =C2=B1190%    +545.2%      17960 =C2=B1139%  interrupts.CPU92.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1 12%      +4.4%       7.83 =C2=B1  4%  interrupts.CPU92.=
TLB:TLB_shootdowns
>     170.00 =C2=B1 19%     -12.6%     148.50        interrupts.CPU93.191:I=
R-PCI-MSI.25690154-edge.eth0-TxRx-42
>       0.00          -100.0%       0.00        interrupts.CPU93.254:IR-PCI=
-MSI.25692201-edge
>       1831 =C2=B1  4%      -3.8%       1761 =C2=B1  2%  interrupts.CPU93.=
CAL:Function_call_interrupts
>     606790            -2.5%     591451 =C2=B1  6%  interrupts.CPU93.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU93.MCP:Machin=
e_check_polls
>     159.00 =C2=B1 12%      -4.7%     151.50 =C2=B1 56%  interrupts.CPU93.=
NMI:Non-maskable_interrupts
>     159.00 =C2=B1 12%      -4.7%     151.50 =C2=B1 56%  interrupts.CPU93.=
PMI:Performance_monitoring_interrupts
>     760.67 =C2=B1105%     -42.7%     435.67 =C2=B1 32%  interrupts.CPU93.=
RES:Rescheduling_interrupts
>       8.33 =C2=B1  8%     -16.0%       7.00 =C2=B1 11%  interrupts.CPU93.=
TLB:TLB_shootdowns
>     169.00 =C2=B1 26%     -12.0%     148.67        interrupts.CPU94.192:I=
R-PCI-MSI.25690155-edge.eth0-TxRx-43
>       0.00          -100.0%       0.00        interrupts.CPU94.255:IR-PCI=
-MSI.25692202-edge
>       0.00          -100.0%       0.00        interrupts.CPU94.423:IR-PCI=
-MSI.39321727-edge.nvme0q127
>       0.00          -100.0%       0.00        interrupts.CPU94.424:IR-PCI=
-MSI.39321727-edge.nvme0q127
>       0.00          -100.0%       0.00        interrupts.CPU94.549:IR-PCI=
-MSI.39321727-edge.nvme0q127
>       1821 =C2=B1  4%      -3.6%       1756 =C2=B1  2%  interrupts.CPU94.=
CAL:Function_call_interrupts
>     608711            -3.9%     584727 =C2=B1  8%  interrupts.CPU94.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU94.MCP:Machin=
e_check_polls
>     154.33 =C2=B1 16%      -7.6%     142.67 =C2=B1 26%  interrupts.CPU94.=
NMI:Non-maskable_interrupts
>     154.33 =C2=B1 16%      -7.6%     142.67 =C2=B1 26%  interrupts.CPU94.=
PMI:Performance_monitoring_interrupts
>     453.17 =C2=B1 29%      -5.0%     430.33 =C2=B1 24%  interrupts.CPU94.=
RES:Rescheduling_interrupts
>       8.00 =C2=B1 12%      +2.1%       8.17 =C2=B1  8%  interrupts.CPU94.=
TLB:TLB_shootdowns
>     148.83            -0.3%     148.33        interrupts.CPU95.193:IR-PCI=
-MSI.25690156-edge.eth0-TxRx-44
>       0.00          -100.0%       0.00        interrupts.CPU95.256:IR-PCI=
-MSI.25692203-edge
>       0.00          -100.0%       0.00        interrupts.CPU95.424:IR-PCI=
-MSI.39321728-edge.nvme0q128
>       0.00          -100.0%       0.00        interrupts.CPU95.539:IR-PCI=
-MSI.39321728-edge.nvme0q128
>       0.00          -100.0%       0.00        interrupts.CPU95.551:IR-PCI=
-MSI.39846016-edge.nvme1q128
>       1761 =C2=B1  2%     +27.7%       2249 =C2=B1 44%  interrupts.CPU95.=
CAL:Function_call_interrupts
>       0.00       +1.7e+101%       0.17 =C2=B1223%  interrupts.CPU95.IWI:I=
RQ_work_interrupts
>     607351            -3.7%     585029 =C2=B1  8%  interrupts.CPU95.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU95.MCP:Machin=
e_check_polls
>     152.67 =C2=B1 11%      +1.2%     154.50 =C2=B1 44%  interrupts.CPU95.=
NMI:Non-maskable_interrupts
>     152.67 =C2=B1 11%      +1.2%     154.50 =C2=B1 44%  interrupts.CPU95.=
PMI:Performance_monitoring_interrupts
>     426.83 =C2=B1 18%   +1333.1%       6116 =C2=B1184%  interrupts.CPU95.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1 12%      +6.8%       7.83 =C2=B1  8%  interrupts.CPU95.=
TLB:TLB_shootdowns
>       1787            +0.3%       1792        interrupts.CPU96.CAL:Functi=
on_call_interrupts
>     606771            -4.3%     580863 =C2=B1  9%  interrupts.CPU96.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU96.MCP:Machin=
e_check_polls
>     192.00 =C2=B1  5%     -25.1%     143.83 =C2=B1 22%  interrupts.CPU96.=
NMI:Non-maskable_interrupts
>     192.00 =C2=B1  5%     -25.1%     143.83 =C2=B1 22%  interrupts.CPU96.=
PMI:Performance_monitoring_interrupts
>     462.83 =C2=B1 53%     +20.2%     556.17 =C2=B1 88%  interrupts.CPU96.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1  6%      +0.0%       7.50 =C2=B1 18%  interrupts.CPU96.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU97.458:IR-PCI=
-MSI.39845922-edge.nvme1q34
>       1792            -0.2%       1790        interrupts.CPU97.CAL:Functi=
on_call_interrupts
>     606741            -3.5%     585570 =C2=B1  7%  interrupts.CPU97.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU97.MCP:Machin=
e_check_polls
>     200.50 =C2=B1 13%     -19.6%     161.17 =C2=B1 33%  interrupts.CPU97.=
NMI:Non-maskable_interrupts
>     200.50 =C2=B1 13%     -19.6%     161.17 =C2=B1 33%  interrupts.CPU97.=
PMI:Performance_monitoring_interrupts
>     542.83 =C2=B1 91%     -13.3%     470.83 =C2=B1 65%  interrupts.CPU97.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +2.3%       7.50 =C2=B1  6%  interrupts.CPU97.=
TLB:TLB_shootdowns
>       0.00          -100.0%       0.00        interrupts.CPU98.331:IR-PCI=
-MSI.39321635-edge.nvme0q35
>       0.00          -100.0%       0.00        interrupts.CPU98.459:IR-PCI=
-MSI.39845923-edge.nvme1q35
>       1787            +0.4%       1794        interrupts.CPU98.CAL:Functi=
on_call_interrupts
>     606771            -3.5%     585652 =C2=B1  7%  interrupts.CPU98.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU98.MCP:Machin=
e_check_polls
>     169.00 =C2=B1  9%      +9.1%     184.33 =C2=B1 36%  interrupts.CPU98.=
NMI:Non-maskable_interrupts
>     169.00 =C2=B1  9%      +9.1%     184.33 =C2=B1 36%  interrupts.CPU98.=
PMI:Performance_monitoring_interrupts
>     682.00 =C2=B1 68%     +80.7%       1232 =C2=B1 72%  interrupts.CPU98.=
RES:Rescheduling_interrupts
>       7.33 =C2=B1  6%      +0.0%       7.33 =C2=B1  6%  interrupts.CPU98.=
TLB:TLB_shootdowns
>       1790           +54.5%       2766 =C2=B1 50%  interrupts.CPU99.CAL:F=
unction_call_interrupts
>     606779            -3.6%     584808 =C2=B1  8%  interrupts.CPU99.LOC:L=
ocal_timer_interrupts
>       1.00            +0.0%       1.00        interrupts.CPU99.MCP:Machin=
e_check_polls
>     179.50            +2.8%     184.50 =C2=B1 26%  interrupts.CPU99.NMI:N=
on-maskable_interrupts
>     179.50            +2.8%     184.50 =C2=B1 26%  interrupts.CPU99.PMI:P=
erformance_monitoring_interrupts
>     555.00 =C2=B1 85%    +188.7%       1602 =C2=B1 84%  interrupts.CPU99.=
RES:Rescheduling_interrupts
>       7.50 =C2=B1 12%      +0.0%       7.50 =C2=B1  6%  interrupts.CPU99.=
TLB:TLB_shootdowns
>      52.83 =C2=B1  7%      +0.9%      53.33 =C2=B1  4%  interrupts.IWI:IR=
Q_work_interrupts
>   77696673            -4.9%   73884557 =C2=B1 11%  interrupts.LOC:Local_t=
imer_interrupts
>     128.00            +0.0%     128.00        interrupts.MCP:Machine_chec=
k_polls
>     210507 =C2=B1  5%      +2.5%     215668 =C2=B1  2%  interrupts.NMI:No=
n-maskable_interrupts
>     210507 =C2=B1  5%      +2.5%     215668 =C2=B1  2%  interrupts.PMI:Pe=
rformance_monitoring_interrupts
>     136508            +2.6%     140116 =C2=B1  2%  interrupts.RES:Resched=
uling_interrupts
>     899.17 =C2=B1  2%      +0.4%     903.17        interrupts.TLB:TLB_sho=
otdowns
> =

> > =

> > 							Thanx, Paul
> > =

> > > Details are as below:
> > > ---------------------------------------------------------------------=
----------------------------->
> > > =

> > > =

> > > To reproduce:
> > > =

> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         sudo bin/lkp install job.yaml           # job file is attache=
d in this email
> > >         bin/lkp split-job --compatible job.yaml # generate the yaml f=
ile for lkp run
> > >         sudo bin/lkp run generated-yaml-file
> > > =

> > >         # if come across any failure that blocks the test,
> > >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > > =

> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test=
/testcase/ucode:
> > >   gcc-9/performance/x86_64-rhel-8.3/process/16/debian-10.4-x86_64-202=
00603.cgz/lkp-icl-2sp2/open1/will-it-scale/0xd000280
> > > =

> > > commit: =

> > >   7f86361f71 ("rcu: Don't deboost before reporting expedited quiescen=
t state")
> > >   1385139340 ("srcu: Dynamically allocate srcu_node array")
> > > =

> > > 7f86361f71df363e 1385139340b7a1c8f35cb7a52af =

> > > ---------------- --------------------------- =

> > >          %stddev     %change         %stddev
> > >              \          |                \  =

> > >    3812018            -6.4%    3567338        will-it-scale.16.proces=
ses
> > >     238250            -6.4%     222958        will-it-scale.per_proce=
ss_ops
> > >    3812018            -6.4%    3567338        will-it-scale.workload

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.17.0-rc1 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_AS_IS_GNU=3Dy
> CONFIG_AS_VERSION=3D23502
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23502
> CONFIG_LLD_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_CAN_LINK_STATIC=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> # CONFIG_WERROR is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> CONFIG_KERNEL_GZIP=3Dy
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> # CONFIG_WATCH_QUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_MSI_IOMMU=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> # CONFIG_CONTEXT_TRACKING_FORCE is not set
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> # end of Timers subsystem
> =

> CONFIG_BPF=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> =

> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_BPF_JIT=3Dy
> CONFIG_BPF_JIT_ALWAYS_ON=3Dy
> CONFIG_BPF_JIT_DEFAULT_ON=3Dy
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy
> # CONFIG_BPF_PRELOAD is not set
> # CONFIG_BPF_LSM is not set
> # end of BPF subsystem
> =

> CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_PREEMPT_DYNAMIC is not set
> # CONFIG_SCHED_CORE is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> CONFIG_TASKSTATS=3Dy
> CONFIG_TASK_DELAY_ACCT=3Dy
> CONFIG_TASK_XACCT=3Dy
> CONFIG_TASK_IO_ACCOUNTING=3Dy
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_NOCB_CPU=3Dy
> # end of RCU Subsystem
> =

> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> # CONFIG_IKHEADERS is not set
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> # CONFIG_PRINTK_INDEX is not set
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
> =

> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_HAS_INT128=3Dy
> CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_NUMA_BALANCING=3Dy
> CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_MEMCG_SWAP=3Dy
> CONFIG_MEMCG_KMEM=3Dy
> CONFIG_BLK_CGROUP=3Dy
> CONFIG_CGROUP_WRITEBACK=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> CONFIG_CGROUP_PIDS=3Dy
> CONFIG_CGROUP_RDMA=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_HUGETLB=3Dy
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CGROUP_CPUACCT=3Dy
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_BPF=3Dy
> # CONFIG_CGROUP_MISC is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> CONFIG_TIME_NS=3Dy
> CONFIG_IPC_NS=3Dy
> CONFIG_USER_NS=3Dy
> CONFIG_PID_NS=3Dy
> CONFIG_NET_NS=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> # CONFIG_EXPERT is not set
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_IO_URING=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_KCMP=3Dy
> CONFIG_RSEQ=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_GUEST_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_NR_GPIO=3D1024
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_HAVE_INTEL_TXT=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_X2APIC=3Dy
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> # CONFIG_X86_CPU_RESCTRL is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_NUMACHIP is not set
> # CONFIG_X86_VSMP is not set
> CONFIG_X86_UV=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_MID is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> # CONFIG_ACRN_GUEST is not set
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> # CONFIG_GART_IOMMU is not set
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> CONFIG_NR_CPUS_RANGE_END=3D8192
> CONFIG_NR_CPUS_DEFAULT=3D8192
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_CLUSTER=3Dy
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> CONFIG_SCHED_MC_PRIO=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCELOG_LEGACY=3Dy
> CONFIG_X86_MCE_INTEL=3Dy
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dm
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dm
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> CONFIG_PERF_EVENTS_AMD_UNCORE=3Dy
> # end of Performance monitoring
> =

> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> CONFIG_I8K=3Dm
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> CONFIG_MICROCODE_AMD=3Dy
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_X86_5LEVEL=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> # CONFIG_AMD_MEM_ENCRYPT is not set
> CONFIG_NUMA=3Dy
> # CONFIG_AMD_NUMA is not set
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NUMA_EMU=3Dy
> CONFIG_NODES_SHIFT=3D10
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_ARCH_MEMORY_PROBE is not set
> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> CONFIG_X86_PMEM_LEGACY=3Dm
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D1
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> # CONFIG_X86_SGX is not set
> CONFIG_EFI=3Dy
> CONFIG_EFI_STUB=3Dy
> CONFIG_EFI_MIXED=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> # CONFIG_KEXEC_SIG is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_KEXEC_JUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_RANDOMIZE_MEMORY=3Dy
> CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0xa
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> # CONFIG_COMPAT_VDSO is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_LIVEPATCH=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_ARCH_HIBERNATION_HEADER=3Dy
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_HIBERNATION=3Dy
> CONFIG_HIBERNATION_SNAPSHOT_DEV=3Dy
> CONFIG_PM_STD_PARTITION=3D""
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> # CONFIG_PM_TEST_SUSPEND is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> # CONFIG_ENERGY_MODEL is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> # CONFIG_ACPI_FPDT is not set
> CONFIG_ACPI_LPIT=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> CONFIG_ACPI_EC_DEBUGFS=3Dm
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dm
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_TAD=3Dm
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_CPPC_LIB=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_IPMI=3Dm
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_PLATFORM_PROFILE=3Dm
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dm
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> CONFIG_ACPI_BGRT=3Dy
> CONFIG_ACPI_NFIT=3Dm
> # CONFIG_NFIT_SECURITY_DEBUG is not set
> CONFIG_ACPI_NUMA=3Dy
> # CONFIG_ACPI_HMAT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> CONFIG_ACPI_APEI_GHES=3Dy
> CONFIG_ACPI_APEI_PCIEAER=3Dy
> CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dm
> # CONFIG_ACPI_APEI_ERST_DEBUG is not set
> # CONFIG_ACPI_DPTF is not set
> CONFIG_ACPI_WATCHDOG=3Dy
> CONFIG_ACPI_EXTLOG=3Dm
> CONFIG_ACPI_ADXL=3Dy
> # CONFIG_ACPI_CONFIGFS is not set
> # CONFIG_ACPI_PFRUT is not set
> CONFIG_ACPI_PCC=3Dy
> CONFIG_PMIC_OPREGION=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_PRMT=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_X86_INTEL_PSTATE=3Dy
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_AMD_PSTATE is not set
> CONFIG_X86_ACPI_CPUFREQ=3Dm
> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
> CONFIG_X86_POWERNOW_K8=3Dm
> # CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dm
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dm
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> CONFIG_INTEL_IDLE=3Dy
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> CONFIG_IA32_EMULATION=3Dy
> # CONFIG_X86_X32 is not set
> CONFIG_COMPAT_32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> # end of Binary Emulations
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_HAVE_KVM_PFNCACHE=3Dy
> CONFIG_HAVE_KVM_IRQCHIP=3Dy
> CONFIG_HAVE_KVM_IRQFD=3Dy
> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> CONFIG_HAVE_KVM_DIRTY_RING=3Dy
> CONFIG_HAVE_KVM_EVENTFD=3Dy
> CONFIG_KVM_MMIO=3Dy
> CONFIG_KVM_ASYNC_PF=3Dy
> CONFIG_HAVE_KVM_MSI=3Dy
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> CONFIG_KVM_VFIO=3Dy
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> CONFIG_KVM_COMPAT=3Dy
> CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
> CONFIG_HAVE_KVM_NO_POLL=3Dy
> CONFIG_KVM_XFER_TO_GUEST_WORK=3Dy
> CONFIG_HAVE_KVM_PM_NOTIFIER=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM=3Dm
> CONFIG_KVM_INTEL=3Dm
> # CONFIG_KVM_AMD is not set
> # CONFIG_KVM_XEN is not set
> CONFIG_KVM_MMU_AUDIT=3Dy
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> # CONFIG_STATIC_CALL_SELFTEST is not set
> CONFIG_OPTPROBES=3Dy
> CONFIG_KPROBES_ON_FTRACE=3Dy
> CONFIG_UPROBES=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_KRETPROBES=3Dy
> CONFIG_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_ARCH_WANTS_NO_INSTR=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> # CONFIG_SECCOMP_CACHE_DEBUG is not set
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> CONFIG_LTO_NONE=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PUD=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> CONFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy
> CONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_COMPAT_OLD_SIGACTION=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_VMAP_STACK=3Dy
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> # CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=3Dy
> CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> CONFIG_DYNAMIC_SIGFRAME=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULE_SIG_FORMAT=3Dy
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> CONFIG_MODULE_SIG=3Dy
> # CONFIG_MODULE_SIG_FORCE is not set
> CONFIG_MODULE_SIG_ALL=3Dy
> # CONFIG_MODULE_SIG_SHA1 is not set
> # CONFIG_MODULE_SIG_SHA224 is not set
> CONFIG_MODULE_SIG_SHA256=3Dy
> # CONFIG_MODULE_SIG_SHA384 is not set
> # CONFIG_MODULE_SIG_SHA512 is not set
> CONFIG_MODULE_SIG_HASH=3D"sha256"
> CONFIG_MODULE_COMPRESS_NONE=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_CGROUP_RWSTAT=3Dy
> CONFIG_BLK_DEV_BSG_COMMON=3Dy
> CONFIG_BLK_ICQ=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_INTEGRITY_T10=3Dm
> # CONFIG_BLK_DEV_ZONED is not set
> CONFIG_BLK_DEV_THROTTLING=3Dy
> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> CONFIG_BLK_WBT=3Dy
> CONFIG_BLK_WBT_MQ=3Dy
> # CONFIG_BLK_CGROUP_IOLATENCY is not set
> # CONFIG_BLK_CGROUP_FC_APPID is not set
> # CONFIG_BLK_CGROUP_IOCOST is not set
> # CONFIG_BLK_CGROUP_IOPRIO is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> # CONFIG_BLK_INLINE_ENCRYPTION is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> # CONFIG_AIX_PARTITION is not set
> CONFIG_OSF_PARTITION=3Dy
> CONFIG_AMIGA_PARTITION=3Dy
> # CONFIG_ATARI_PARTITION is not set
> CONFIG_MAC_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_BSD_DISKLABEL=3Dy
> CONFIG_MINIX_SUBPARTITION=3Dy
> CONFIG_SOLARIS_X86_PARTITION=3Dy
> CONFIG_UNIXWARE_DISKLABEL=3Dy
> # CONFIG_LDM_PARTITION is not set
> CONFIG_SGI_PARTITION=3Dy
> # CONFIG_ULTRIX_PARTITION is not set
> CONFIG_SUN_PARTITION=3Dy
> CONFIG_KARMA_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> # CONFIG_SYSV68_PARTITION is not set
> # CONFIG_CMDLINE_PARTITION is not set
> # end of Partition Types
> =

> CONFIG_BLOCK_COMPAT=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_BLK_PM=3Dy
> CONFIG_BLOCK_HOLDER_DEPRECATED=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> CONFIG_IOSCHED_BFQ=3Dy
> CONFIG_BFQ_GROUP_IOSCHED=3Dy
> # CONFIG_BFQ_CGROUP_DEBUG is not set
> # end of IO Schedulers
> =

> CONFIG_PREEMPT_NOTIFIERS=3Dy
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_READ_UNLOCK=3Dy
> CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_WRITE_UNLOCK=3Dy
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dm
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_NUMA_KEEP_MEMINFO=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_MHP_MEMMAP_ON_MEMORY=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_PAGE_REPORTING=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_MEMORY_FAILURE=3Dy
> CONFIG_HWPOISON_INJECT=3Dm
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_THP_SWAP=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_FRONTSWAP=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZSWAP=3Dy
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=3Dy
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lzo"
> CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=3Dy
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
> CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"zbud"
> # CONFIG_ZSWAP_DEFAULT_ON is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> CONFIG_ZSMALLOC=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_PAGE_IDLE_FLAG=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> CONFIG_ZONE_DMA=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_ZONE_DEVICE=3Dy
> CONFIG_DEV_PAGEMAP_OPS=3Dy
> CONFIG_DEVICE_PRIVATE=3Dy
> CONFIG_VMAP_PFN=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> # CONFIG_READ_ONLY_THP_FOR_FS is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> CONFIG_SECRETMEM=3Dy
> # CONFIG_ANON_VMA_NAME is not set
> =

> #
> # Data Access Monitoring
> #
> # CONFIG_DAMON is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> CONFIG_PACKET_DIAG=3Dm
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_AF_UNIX_OOB=3Dy
> CONFIG_UNIX_DIAG=3Dm
> CONFIG_TLS=3Dm
> CONFIG_TLS_DEVICE=3Dy
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_OFFLOAD=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_USER=3Dy
> # CONFIG_XFRM_USER_COMPAT is not set
> # CONFIG_XFRM_INTERFACE is not set
> CONFIG_XFRM_SUB_POLICY=3Dy
> CONFIG_XFRM_MIGRATE=3Dy
> CONFIG_XFRM_STATISTICS=3Dy
> CONFIG_XFRM_AH=3Dm
> CONFIG_XFRM_ESP=3Dm
> CONFIG_XFRM_IPCOMP=3Dm
> CONFIG_NET_KEY=3Dm
> CONFIG_NET_KEY_MIGRATE=3Dy
> CONFIG_XDP_SOCKETS=3Dy
> # CONFIG_XDP_SOCKETS_DIAG is not set
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> CONFIG_IP_FIB_TRIE_STATS=3Dy
> CONFIG_IP_MULTIPLE_TABLES=3Dy
> CONFIG_IP_ROUTE_MULTIPATH=3Dy
> CONFIG_IP_ROUTE_VERBOSE=3Dy
> CONFIG_IP_ROUTE_CLASSID=3Dy
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> CONFIG_NET_IPIP=3Dm
> CONFIG_NET_IPGRE_DEMUX=3Dm
> CONFIG_NET_IP_TUNNEL=3Dm
> CONFIG_NET_IPGRE=3Dm
> CONFIG_NET_IPGRE_BROADCAST=3Dy
> CONFIG_IP_MROUTE_COMMON=3Dy
> CONFIG_IP_MROUTE=3Dy
> CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
> CONFIG_IP_PIMSM_V1=3Dy
> CONFIG_IP_PIMSM_V2=3Dy
> CONFIG_SYN_COOKIES=3Dy
> CONFIG_NET_IPVTI=3Dm
> CONFIG_NET_UDP_TUNNEL=3Dm
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> CONFIG_INET_AH=3Dm
> CONFIG_INET_ESP=3Dm
> CONFIG_INET_ESP_OFFLOAD=3Dm
> # CONFIG_INET_ESPINTCP is not set
> CONFIG_INET_IPCOMP=3Dm
> CONFIG_INET_XFRM_TUNNEL=3Dm
> CONFIG_INET_TUNNEL=3Dm
> CONFIG_INET_DIAG=3Dm
> CONFIG_INET_TCP_DIAG=3Dm
> CONFIG_INET_UDP_DIAG=3Dm
> CONFIG_INET_RAW_DIAG=3Dm
> # CONFIG_INET_DIAG_DESTROY is not set
> CONFIG_TCP_CONG_ADVANCED=3Dy
> CONFIG_TCP_CONG_BIC=3Dm
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_TCP_CONG_WESTWOOD=3Dm
> CONFIG_TCP_CONG_HTCP=3Dm
> CONFIG_TCP_CONG_HSTCP=3Dm
> CONFIG_TCP_CONG_HYBLA=3Dm
> CONFIG_TCP_CONG_VEGAS=3Dm
> CONFIG_TCP_CONG_NV=3Dm
> CONFIG_TCP_CONG_SCALABLE=3Dm
> CONFIG_TCP_CONG_LP=3Dm
> CONFIG_TCP_CONG_VENO=3Dm
> CONFIG_TCP_CONG_YEAH=3Dm
> CONFIG_TCP_CONG_ILLINOIS=3Dm
> CONFIG_TCP_CONG_DCTCP=3Dm
> # CONFIG_TCP_CONG_CDG is not set
> CONFIG_TCP_CONG_BBR=3Dm
> CONFIG_DEFAULT_CUBIC=3Dy
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> CONFIG_TCP_MD5SIG=3Dy
> CONFIG_IPV6=3Dy
> CONFIG_IPV6_ROUTER_PREF=3Dy
> CONFIG_IPV6_ROUTE_INFO=3Dy
> CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> CONFIG_INET6_AH=3Dm
> CONFIG_INET6_ESP=3Dm
> CONFIG_INET6_ESP_OFFLOAD=3Dm
> # CONFIG_INET6_ESPINTCP is not set
> CONFIG_INET6_IPCOMP=3Dm
> CONFIG_IPV6_MIP6=3Dm
> # CONFIG_IPV6_ILA is not set
> CONFIG_INET6_XFRM_TUNNEL=3Dm
> CONFIG_INET6_TUNNEL=3Dm
> CONFIG_IPV6_VTI=3Dm
> CONFIG_IPV6_SIT=3Dm
> CONFIG_IPV6_SIT_6RD=3Dy
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dm
> CONFIG_IPV6_GRE=3Dm
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> CONFIG_IPV6_MROUTE=3Dy
> CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
> CONFIG_IPV6_PIMSM_V2=3Dy
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> CONFIG_NETLABEL=3Dy
> # CONFIG_MPTCP is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> CONFIG_BRIDGE_NETFILTER=3Dm
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> CONFIG_NETFILTER_EGRESS=3Dy
> CONFIG_NETFILTER_SKIP_EGRESS=3Dy
> CONFIG_NETFILTER_NETLINK=3Dm
> CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
> CONFIG_NETFILTER_FAMILY_ARP=3Dy
> # CONFIG_NETFILTER_NETLINK_HOOK is not set
> # CONFIG_NETFILTER_NETLINK_ACCT is not set
> CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
> CONFIG_NETFILTER_NETLINK_LOG=3Dm
> CONFIG_NETFILTER_NETLINK_OSF=3Dm
> CONFIG_NF_CONNTRACK=3Dm
> CONFIG_NF_LOG_SYSLOG=3Dm
> CONFIG_NETFILTER_CONNCOUNT=3Dm
> CONFIG_NF_CONNTRACK_MARK=3Dy
> CONFIG_NF_CONNTRACK_SECMARK=3Dy
> CONFIG_NF_CONNTRACK_ZONES=3Dy
> CONFIG_NF_CONNTRACK_PROCFS=3Dy
> CONFIG_NF_CONNTRACK_EVENTS=3Dy
> CONFIG_NF_CONNTRACK_TIMEOUT=3Dy
> CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
> CONFIG_NF_CONNTRACK_LABELS=3Dy
> CONFIG_NF_CT_PROTO_DCCP=3Dy
> CONFIG_NF_CT_PROTO_GRE=3Dy
> CONFIG_NF_CT_PROTO_SCTP=3Dy
> CONFIG_NF_CT_PROTO_UDPLITE=3Dy
> CONFIG_NF_CONNTRACK_AMANDA=3Dm
> CONFIG_NF_CONNTRACK_FTP=3Dm
> CONFIG_NF_CONNTRACK_H323=3Dm
> CONFIG_NF_CONNTRACK_IRC=3Dm
> CONFIG_NF_CONNTRACK_BROADCAST=3Dm
> CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
> CONFIG_NF_CONNTRACK_SNMP=3Dm
> CONFIG_NF_CONNTRACK_PPTP=3Dm
> CONFIG_NF_CONNTRACK_SANE=3Dm
> CONFIG_NF_CONNTRACK_SIP=3Dm
> CONFIG_NF_CONNTRACK_TFTP=3Dm
> CONFIG_NF_CT_NETLINK=3Dm
> CONFIG_NF_CT_NETLINK_TIMEOUT=3Dm
> CONFIG_NF_CT_NETLINK_HELPER=3Dm
> CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
> CONFIG_NF_NAT=3Dm
> CONFIG_NF_NAT_AMANDA=3Dm
> CONFIG_NF_NAT_FTP=3Dm
> CONFIG_NF_NAT_IRC=3Dm
> CONFIG_NF_NAT_SIP=3Dm
> CONFIG_NF_NAT_TFTP=3Dm
> CONFIG_NF_NAT_REDIRECT=3Dy
> CONFIG_NF_NAT_MASQUERADE=3Dy
> CONFIG_NETFILTER_SYNPROXY=3Dm
> CONFIG_NF_TABLES=3Dm
> CONFIG_NF_TABLES_INET=3Dy
> CONFIG_NF_TABLES_NETDEV=3Dy
> CONFIG_NFT_NUMGEN=3Dm
> CONFIG_NFT_CT=3Dm
> CONFIG_NFT_CONNLIMIT=3Dm
> CONFIG_NFT_LOG=3Dm
> CONFIG_NFT_LIMIT=3Dm
> CONFIG_NFT_MASQ=3Dm
> CONFIG_NFT_REDIR=3Dm
> CONFIG_NFT_NAT=3Dm
> # CONFIG_NFT_TUNNEL is not set
> CONFIG_NFT_OBJREF=3Dm
> CONFIG_NFT_QUEUE=3Dm
> CONFIG_NFT_QUOTA=3Dm
> CONFIG_NFT_REJECT=3Dm
> CONFIG_NFT_REJECT_INET=3Dm
> CONFIG_NFT_COMPAT=3Dm
> CONFIG_NFT_HASH=3Dm
> CONFIG_NFT_FIB=3Dm
> CONFIG_NFT_FIB_INET=3Dm
> # CONFIG_NFT_XFRM is not set
> CONFIG_NFT_SOCKET=3Dm
> # CONFIG_NFT_OSF is not set
> # CONFIG_NFT_TPROXY is not set
> # CONFIG_NFT_SYNPROXY is not set
> CONFIG_NF_DUP_NETDEV=3Dm
> CONFIG_NFT_DUP_NETDEV=3Dm
> CONFIG_NFT_FWD_NETDEV=3Dm
> CONFIG_NFT_FIB_NETDEV=3Dm
> # CONFIG_NFT_REJECT_NETDEV is not set
> # CONFIG_NF_FLOW_TABLE is not set
> CONFIG_NETFILTER_XTABLES=3Dy
> CONFIG_NETFILTER_XTABLES_COMPAT=3Dy
> =

> #
> # Xtables combined modules
> #
> CONFIG_NETFILTER_XT_MARK=3Dm
> CONFIG_NETFILTER_XT_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_SET=3Dm
> =

> #
> # Xtables targets
> #
> CONFIG_NETFILTER_XT_TARGET_AUDIT=3Dm
> CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
> CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
> CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_CT=3Dm
> CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
> CONFIG_NETFILTER_XT_TARGET_HL=3Dm
> CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
> # CONFIG_NETFILTER_XT_TARGET_LED is not set
> CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
> CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
> CONFIG_NETFILTER_XT_NAT=3Dm
> CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
> CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
> CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
> CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
> CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
> CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
> CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
> CONFIG_NETFILTER_XT_TARGET_TEE=3Dm
> CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
> CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
> CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
> CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm
> =

> #
> # Xtables matches
> #
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
> CONFIG_NETFILTER_XT_MATCH_CGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
> CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNLABEL=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
> CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
> CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
> CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
> CONFIG_NETFILTER_XT_MATCH_HL=3Dm
> # CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
> CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
> CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
> CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
> CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
> CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
> # CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
> CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
> CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
> CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
> CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
> CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
> CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
> CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
> CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
> CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
> CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
> CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
> CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
> CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
> CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_TIME is not set
> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> # end of Core Netfilter Configuration
> =

> CONFIG_IP_SET=3Dm
> CONFIG_IP_SET_MAX=3D256
> CONFIG_IP_SET_BITMAP_IP=3Dm
> CONFIG_IP_SET_BITMAP_IPMAC=3Dm
> CONFIG_IP_SET_BITMAP_PORT=3Dm
> CONFIG_IP_SET_HASH_IP=3Dm
> CONFIG_IP_SET_HASH_IPMARK=3Dm
> CONFIG_IP_SET_HASH_IPPORT=3Dm
> CONFIG_IP_SET_HASH_IPPORTIP=3Dm
> CONFIG_IP_SET_HASH_IPPORTNET=3Dm
> CONFIG_IP_SET_HASH_IPMAC=3Dm
> CONFIG_IP_SET_HASH_MAC=3Dm
> CONFIG_IP_SET_HASH_NETPORTNET=3Dm
> CONFIG_IP_SET_HASH_NET=3Dm
> CONFIG_IP_SET_HASH_NETNET=3Dm
> CONFIG_IP_SET_HASH_NETPORT=3Dm
> CONFIG_IP_SET_HASH_NETIFACE=3Dm
> CONFIG_IP_SET_LIST_SET=3Dm
> CONFIG_IP_VS=3Dm
> CONFIG_IP_VS_IPV6=3Dy
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=3D12
> =

> #
> # IPVS transport protocol load balancing support
> #
> CONFIG_IP_VS_PROTO_TCP=3Dy
> CONFIG_IP_VS_PROTO_UDP=3Dy
> CONFIG_IP_VS_PROTO_AH_ESP=3Dy
> CONFIG_IP_VS_PROTO_ESP=3Dy
> CONFIG_IP_VS_PROTO_AH=3Dy
> CONFIG_IP_VS_PROTO_SCTP=3Dy
> =

> #
> # IPVS scheduler
> #
> CONFIG_IP_VS_RR=3Dm
> CONFIG_IP_VS_WRR=3Dm
> CONFIG_IP_VS_LC=3Dm
> CONFIG_IP_VS_WLC=3Dm
> CONFIG_IP_VS_FO=3Dm
> CONFIG_IP_VS_OVF=3Dm
> CONFIG_IP_VS_LBLC=3Dm
> CONFIG_IP_VS_LBLCR=3Dm
> CONFIG_IP_VS_DH=3Dm
> CONFIG_IP_VS_SH=3Dm
> # CONFIG_IP_VS_MH is not set
> CONFIG_IP_VS_SED=3Dm
> CONFIG_IP_VS_NQ=3Dm
> # CONFIG_IP_VS_TWOS is not set
> =

> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=3D8
> =

> #
> # IPVS MH scheduler
> #
> CONFIG_IP_VS_MH_TAB_INDEX=3D12
> =

> #
> # IPVS application helper
> #
> CONFIG_IP_VS_FTP=3Dm
> CONFIG_IP_VS_NFCT=3Dy
> CONFIG_IP_VS_PE_SIP=3Dm
> =

> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=3Dm
> CONFIG_NF_SOCKET_IPV4=3Dm
> CONFIG_NF_TPROXY_IPV4=3Dm
> CONFIG_NF_TABLES_IPV4=3Dy
> CONFIG_NFT_REJECT_IPV4=3Dm
> CONFIG_NFT_DUP_IPV4=3Dm
> CONFIG_NFT_FIB_IPV4=3Dm
> CONFIG_NF_TABLES_ARP=3Dy
> CONFIG_NF_DUP_IPV4=3Dm
> CONFIG_NF_LOG_ARP=3Dm
> CONFIG_NF_LOG_IPV4=3Dm
> CONFIG_NF_REJECT_IPV4=3Dm
> CONFIG_NF_NAT_SNMP_BASIC=3Dm
> CONFIG_NF_NAT_PPTP=3Dm
> CONFIG_NF_NAT_H323=3Dm
> CONFIG_IP_NF_IPTABLES=3Dm
> CONFIG_IP_NF_MATCH_AH=3Dm
> CONFIG_IP_NF_MATCH_ECN=3Dm
> CONFIG_IP_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP_NF_MATCH_TTL=3Dm
> CONFIG_IP_NF_FILTER=3Dm
> CONFIG_IP_NF_TARGET_REJECT=3Dm
> CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP_NF_NAT=3Dm
> CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP_NF_TARGET_NETMAP=3Dm
> CONFIG_IP_NF_TARGET_REDIRECT=3Dm
> CONFIG_IP_NF_MANGLE=3Dm
> # CONFIG_IP_NF_TARGET_CLUSTERIP is not set
> CONFIG_IP_NF_TARGET_ECN=3Dm
> CONFIG_IP_NF_TARGET_TTL=3Dm
> CONFIG_IP_NF_RAW=3Dm
> CONFIG_IP_NF_SECURITY=3Dm
> CONFIG_IP_NF_ARPTABLES=3Dm
> CONFIG_IP_NF_ARPFILTER=3Dm
> CONFIG_IP_NF_ARP_MANGLE=3Dm
> # end of IP: Netfilter Configuration
> =

> #
> # IPv6: Netfilter Configuration
> #
> CONFIG_NF_SOCKET_IPV6=3Dm
> CONFIG_NF_TPROXY_IPV6=3Dm
> CONFIG_NF_TABLES_IPV6=3Dy
> CONFIG_NFT_REJECT_IPV6=3Dm
> CONFIG_NFT_DUP_IPV6=3Dm
> CONFIG_NFT_FIB_IPV6=3Dm
> CONFIG_NF_DUP_IPV6=3Dm
> CONFIG_NF_REJECT_IPV6=3Dm
> CONFIG_NF_LOG_IPV6=3Dm
> CONFIG_IP6_NF_IPTABLES=3Dm
> CONFIG_IP6_NF_MATCH_AH=3Dm
> CONFIG_IP6_NF_MATCH_EUI64=3Dm
> CONFIG_IP6_NF_MATCH_FRAG=3Dm
> CONFIG_IP6_NF_MATCH_OPTS=3Dm
> CONFIG_IP6_NF_MATCH_HL=3Dm
> CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
> CONFIG_IP6_NF_MATCH_MH=3Dm
> CONFIG_IP6_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP6_NF_MATCH_RT=3Dm
> # CONFIG_IP6_NF_MATCH_SRH is not set
> # CONFIG_IP6_NF_TARGET_HL is not set
> CONFIG_IP6_NF_FILTER=3Dm
> CONFIG_IP6_NF_TARGET_REJECT=3Dm
> CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP6_NF_MANGLE=3Dm
> CONFIG_IP6_NF_RAW=3Dm
> CONFIG_IP6_NF_SECURITY=3Dm
> CONFIG_IP6_NF_NAT=3Dm
> CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP6_NF_TARGET_NPT=3Dm
> # end of IPv6: Netfilter Configuration
> =

> CONFIG_NF_DEFRAG_IPV6=3Dm
> CONFIG_NF_TABLES_BRIDGE=3Dm
> # CONFIG_NFT_BRIDGE_META is not set
> CONFIG_NFT_BRIDGE_REJECT=3Dm
> # CONFIG_NF_CONNTRACK_BRIDGE is not set
> CONFIG_BRIDGE_NF_EBTABLES=3Dm
> CONFIG_BRIDGE_EBT_BROUTE=3Dm
> CONFIG_BRIDGE_EBT_T_FILTER=3Dm
> CONFIG_BRIDGE_EBT_T_NAT=3Dm
> CONFIG_BRIDGE_EBT_802_3=3Dm
> CONFIG_BRIDGE_EBT_AMONG=3Dm
> CONFIG_BRIDGE_EBT_ARP=3Dm
> CONFIG_BRIDGE_EBT_IP=3Dm
> CONFIG_BRIDGE_EBT_IP6=3Dm
> CONFIG_BRIDGE_EBT_LIMIT=3Dm
> CONFIG_BRIDGE_EBT_MARK=3Dm
> CONFIG_BRIDGE_EBT_PKTTYPE=3Dm
> CONFIG_BRIDGE_EBT_STP=3Dm
> CONFIG_BRIDGE_EBT_VLAN=3Dm
> CONFIG_BRIDGE_EBT_ARPREPLY=3Dm
> CONFIG_BRIDGE_EBT_DNAT=3Dm
> CONFIG_BRIDGE_EBT_MARK_T=3Dm
> CONFIG_BRIDGE_EBT_REDIRECT=3Dm
> CONFIG_BRIDGE_EBT_SNAT=3Dm
> CONFIG_BRIDGE_EBT_LOG=3Dm
> CONFIG_BRIDGE_EBT_NFLOG=3Dm
> # CONFIG_BPFILTER is not set
> CONFIG_IP_DCCP=3Dy
> CONFIG_INET_DCCP_DIAG=3Dm
> =

> #
> # DCCP CCIDs Configuration
> #
> # CONFIG_IP_DCCP_CCID2_DEBUG is not set
> CONFIG_IP_DCCP_CCID3=3Dy
> # CONFIG_IP_DCCP_CCID3_DEBUG is not set
> CONFIG_IP_DCCP_TFRC_LIB=3Dy
> # end of DCCP CCIDs Configuration
> =

> #
> # DCCP Kernel Hacking
> #
> # CONFIG_IP_DCCP_DEBUG is not set
> # end of DCCP Kernel Hacking
> =

> CONFIG_IP_SCTP=3Dm
> # CONFIG_SCTP_DBG_OBJCNT is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> CONFIG_INET_SCTP_DIAG=3Dm
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dm
> CONFIG_TIPC_MEDIA_UDP=3Dy
> CONFIG_TIPC_CRYPTO=3Dy
> CONFIG_TIPC_DIAG=3Dm
> CONFIG_ATM=3Dm
> CONFIG_ATM_CLIP=3Dm
> # CONFIG_ATM_CLIP_NO_ICMP is not set
> CONFIG_ATM_LANE=3Dm
> # CONFIG_ATM_MPOA is not set
> CONFIG_ATM_BR2684=3Dm
> # CONFIG_ATM_BR2684_IPFILTER is not set
> CONFIG_L2TP=3Dm
> CONFIG_L2TP_DEBUGFS=3Dm
> CONFIG_L2TP_V3=3Dy
> CONFIG_L2TP_IP=3Dm
> CONFIG_L2TP_ETH=3Dm
> CONFIG_STP=3Dm
> CONFIG_GARP=3Dm
> CONFIG_MRP=3Dm
> CONFIG_BRIDGE=3Dm
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> # CONFIG_BRIDGE_MRP is not set
> # CONFIG_BRIDGE_CFM is not set
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dm
> CONFIG_VLAN_8021Q_GVRP=3Dy
> CONFIG_VLAN_8021Q_MVRP=3Dy
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dm
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> CONFIG_6LOWPAN=3Dm
> # CONFIG_6LOWPAN_DEBUGFS is not set
> # CONFIG_6LOWPAN_NHC is not set
> CONFIG_IEEE802154=3Dm
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> CONFIG_IEEE802154_SOCKET=3Dm
> CONFIG_IEEE802154_6LOWPAN=3Dm
> CONFIG_MAC802154=3Dm
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dm
> CONFIG_NET_SCH_HTB=3Dm
> CONFIG_NET_SCH_HFSC=3Dm
> CONFIG_NET_SCH_ATM=3Dm
> CONFIG_NET_SCH_PRIO=3Dm
> CONFIG_NET_SCH_MULTIQ=3Dm
> CONFIG_NET_SCH_RED=3Dm
> CONFIG_NET_SCH_SFB=3Dm
> CONFIG_NET_SCH_SFQ=3Dm
> CONFIG_NET_SCH_TEQL=3Dm
> CONFIG_NET_SCH_TBF=3Dm
> # CONFIG_NET_SCH_CBS is not set
> # CONFIG_NET_SCH_ETF is not set
> # CONFIG_NET_SCH_TAPRIO is not set
> CONFIG_NET_SCH_GRED=3Dm
> CONFIG_NET_SCH_DSMARK=3Dm
> CONFIG_NET_SCH_NETEM=3Dm
> CONFIG_NET_SCH_DRR=3Dm
> CONFIG_NET_SCH_MQPRIO=3Dm
> # CONFIG_NET_SCH_SKBPRIO is not set
> CONFIG_NET_SCH_CHOKE=3Dm
> CONFIG_NET_SCH_QFQ=3Dm
> CONFIG_NET_SCH_CODEL=3Dm
> CONFIG_NET_SCH_FQ_CODEL=3Dy
> # CONFIG_NET_SCH_CAKE is not set
> CONFIG_NET_SCH_FQ=3Dm
> CONFIG_NET_SCH_HHF=3Dm
> CONFIG_NET_SCH_PIE=3Dm
> # CONFIG_NET_SCH_FQ_PIE is not set
> CONFIG_NET_SCH_INGRESS=3Dm
> CONFIG_NET_SCH_PLUG=3Dm
> # CONFIG_NET_SCH_ETS is not set
> CONFIG_NET_SCH_DEFAULT=3Dy
> # CONFIG_DEFAULT_FQ is not set
> # CONFIG_DEFAULT_CODEL is not set
> CONFIG_DEFAULT_FQ_CODEL=3Dy
> # CONFIG_DEFAULT_SFQ is not set
> # CONFIG_DEFAULT_PFIFO_FAST is not set
> CONFIG_DEFAULT_NET_SCH=3D"fq_codel"
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dm
> CONFIG_NET_CLS_TCINDEX=3Dm
> CONFIG_NET_CLS_ROUTE4=3Dm
> CONFIG_NET_CLS_FW=3Dm
> CONFIG_NET_CLS_U32=3Dm
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dm
> CONFIG_NET_CLS_RSVP6=3Dm
> CONFIG_NET_CLS_FLOW=3Dm
> CONFIG_NET_CLS_CGROUP=3Dy
> CONFIG_NET_CLS_BPF=3Dm
> CONFIG_NET_CLS_FLOWER=3Dm
> CONFIG_NET_CLS_MATCHALL=3Dm
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dm
> CONFIG_NET_EMATCH_NBYTE=3Dm
> CONFIG_NET_EMATCH_U32=3Dm
> CONFIG_NET_EMATCH_META=3Dm
> CONFIG_NET_EMATCH_TEXT=3Dm
> # CONFIG_NET_EMATCH_CANID is not set
> CONFIG_NET_EMATCH_IPSET=3Dm
> # CONFIG_NET_EMATCH_IPT is not set
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dm
> CONFIG_NET_ACT_GACT=3Dm
> CONFIG_GACT_PROB=3Dy
> CONFIG_NET_ACT_MIRRED=3Dm
> CONFIG_NET_ACT_SAMPLE=3Dm
> # CONFIG_NET_ACT_IPT is not set
> CONFIG_NET_ACT_NAT=3Dm
> CONFIG_NET_ACT_PEDIT=3Dm
> CONFIG_NET_ACT_SIMP=3Dm
> CONFIG_NET_ACT_SKBEDIT=3Dm
> CONFIG_NET_ACT_CSUM=3Dm
> # CONFIG_NET_ACT_MPLS is not set
> CONFIG_NET_ACT_VLAN=3Dm
> CONFIG_NET_ACT_BPF=3Dm
> # CONFIG_NET_ACT_CONNMARK is not set
> # CONFIG_NET_ACT_CTINFO is not set
> CONFIG_NET_ACT_SKBMOD=3Dm
> # CONFIG_NET_ACT_IFE is not set
> CONFIG_NET_ACT_TUNNEL_KEY=3Dm
> # CONFIG_NET_ACT_GATE is not set
> # CONFIG_NET_TC_SKB_EXT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dm
> # CONFIG_BATMAN_ADV is not set
> CONFIG_OPENVSWITCH=3Dm
> CONFIG_OPENVSWITCH_GRE=3Dm
> CONFIG_VSOCKETS=3Dm
> CONFIG_VSOCKETS_DIAG=3Dm
> CONFIG_VSOCKETS_LOOPBACK=3Dm
> CONFIG_VMWARE_VMCI_VSOCKETS=3Dm
> CONFIG_VIRTIO_VSOCKETS=3Dm
> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
> CONFIG_HYPERV_VSOCKETS=3Dm
> CONFIG_NETLINK_DIAG=3Dm
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> CONFIG_MPLS_ROUTING=3Dm
> CONFIG_MPLS_IPTUNNEL=3Dm
> CONFIG_NET_NSH=3Dy
> # CONFIG_HSR is not set
> CONFIG_NET_SWITCHDEV=3Dy
> CONFIG_NET_L3_MASTER_DEV=3Dy
> # CONFIG_QRTR is not set
> # CONFIG_NET_NCSI is not set
> CONFIG_PCPU_DEV_REFCNT=3Dy
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> CONFIG_XPS=3Dy
> CONFIG_CGROUP_NET_PRIO=3Dy
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_BPF_STREAM_PARSER=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=3Dm
> CONFIG_NET_DROP_MONITOR=3Dy
> # end of Network testing
> # end of Networking options
> =

> # CONFIG_HAMRADIO is not set
> CONFIG_CAN=3Dm
> CONFIG_CAN_RAW=3Dm
> CONFIG_CAN_BCM=3Dm
> CONFIG_CAN_GW=3Dm
> # CONFIG_CAN_J1939 is not set
> # CONFIG_CAN_ISOTP is not set
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dm
> # CONFIG_CAN_VXCAN is not set
> CONFIG_CAN_SLCAN=3Dm
> CONFIG_CAN_DEV=3Dm
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_KVASER_PCIEFD is not set
> CONFIG_CAN_C_CAN=3Dm
> CONFIG_CAN_C_CAN_PLATFORM=3Dm
> CONFIG_CAN_C_CAN_PCI=3Dm
> CONFIG_CAN_CC770=3Dm
> # CONFIG_CAN_CC770_ISA is not set
> CONFIG_CAN_CC770_PLATFORM=3Dm
> # CONFIG_CAN_IFI_CANFD is not set
> # CONFIG_CAN_M_CAN is not set
> # CONFIG_CAN_PEAK_PCIEFD is not set
> CONFIG_CAN_SJA1000=3Dm
> CONFIG_CAN_EMS_PCI=3Dm
> # CONFIG_CAN_F81601 is not set
> CONFIG_CAN_KVASER_PCI=3Dm
> CONFIG_CAN_PEAK_PCI=3Dm
> CONFIG_CAN_PEAK_PCIEC=3Dy
> CONFIG_CAN_PLX_PCI=3Dm
> # CONFIG_CAN_SJA1000_ISA is not set
> CONFIG_CAN_SJA1000_PLATFORM=3Dm
> CONFIG_CAN_SOFTING=3Dm
> =

> #
> # CAN SPI interfaces
> #
> # CONFIG_CAN_HI311X is not set
> # CONFIG_CAN_MCP251X is not set
> # CONFIG_CAN_MCP251XFD is not set
> # end of CAN SPI interfaces
> =

> #
> # CAN USB interfaces
> #
> # CONFIG_CAN_8DEV_USB is not set
> # CONFIG_CAN_EMS_USB is not set
> # CONFIG_CAN_ESD_USB2 is not set
> # CONFIG_CAN_ETAS_ES58X is not set
> # CONFIG_CAN_GS_USB is not set
> # CONFIG_CAN_KVASER_USB is not set
> # CONFIG_CAN_MCBA_USB is not set
> # CONFIG_CAN_PEAK_USB is not set
> # CONFIG_CAN_UCAN is not set
> # end of CAN USB interfaces
> =

> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> CONFIG_BT=3Dm
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dm
> CONFIG_BT_RFCOMM_TTY=3Dy
> CONFIG_BT_BNEP=3Dm
> CONFIG_BT_BNEP_MC_FILTER=3Dy
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_HIDP=3Dm
> CONFIG_BT_HS=3Dy
> CONFIG_BT_LE=3Dy
> # CONFIG_BT_6LOWPAN is not set
> # CONFIG_BT_LEDS is not set
> # CONFIG_BT_MSFTEXT is not set
> # CONFIG_BT_AOSPEXT is not set
> CONFIG_BT_DEBUGFS=3Dy
> # CONFIG_BT_SELFTEST is not set
> =

> #
> # Bluetooth device drivers
> #
> # CONFIG_BT_HCIBTUSB is not set
> # CONFIG_BT_HCIBTSDIO is not set
> CONFIG_BT_HCIUART=3Dm
> CONFIG_BT_HCIUART_H4=3Dy
> CONFIG_BT_HCIUART_BCSP=3Dy
> CONFIG_BT_HCIUART_ATH3K=3Dy
> # CONFIG_BT_HCIUART_INTEL is not set
> # CONFIG_BT_HCIUART_AG6XX is not set
> # CONFIG_BT_HCIBCM203X is not set
> # CONFIG_BT_HCIBPA10X is not set
> # CONFIG_BT_HCIBFUSB is not set
> CONFIG_BT_HCIVHCI=3Dm
> CONFIG_BT_MRVL=3Dm
> # CONFIG_BT_MRVL_SDIO is not set
> # CONFIG_BT_MTKSDIO is not set
> # CONFIG_BT_VIRTIO is not set
> # end of Bluetooth device drivers
> =

> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_STREAM_PARSER=3Dy
> # CONFIG_MCTP is not set
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> CONFIG_CFG80211=3Dm
> # CONFIG_NL80211_TESTMODE is not set
> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> # CONFIG_CFG80211_DEBUGFS is not set
> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> # CONFIG_CFG80211_WEXT is not set
> CONFIG_MAC80211=3Dm
> CONFIG_MAC80211_HAS_RC=3Dy
> CONFIG_MAC80211_RC_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
> # CONFIG_MAC80211_MESH is not set
> CONFIG_MAC80211_LEDS=3Dy
> CONFIG_MAC80211_DEBUGFS=3Dy
> # CONFIG_MAC80211_MESSAGE_TRACING is not set
> # CONFIG_MAC80211_DEBUG_MENU is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_RFKILL=3Dm
> CONFIG_RFKILL_LEDS=3Dy
> CONFIG_RFKILL_INPUT=3Dy
> # CONFIG_RFKILL_GPIO is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_FD=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> CONFIG_CEPH_LIB=3Dm
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> # CONFIG_NFC is not set
> CONFIG_PSAMPLE=3Dm
> # CONFIG_NET_IFE is not set
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_SOCK_VALIDATE_XMIT=3Dy
> CONFIG_NET_SELFTESTS=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_FAILOVER=3Dm
> CONFIG_ETHTOOL_NETLINK=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_HOTPLUG_PCI_PCIE=3Dy
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIEAER_INJECT=3Dm
> CONFIG_PCIE_ECRC=3Dy
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCIE_DPC=3Dy
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCIE_EDR is not set
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=3Dy
> CONFIG_PCI_PF_STUB=3Dm
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> # CONFIG_PCI_P2PDMA is not set
> CONFIG_PCI_LABEL=3Dy
> CONFIG_PCI_HYPERV=3Dm
> CONFIG_HOTPLUG_PCI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI_IBM=3Dm
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> =

> #
> # PCI controller drivers
> #
> CONFIG_VMD=3Dy
> CONFIG_PCI_HYPERV_INTERFACE=3Dm
> =

> #
> # DesignWare PCI Core Support
> #
> # CONFIG_PCIE_DW_PLAT_HOST is not set
> # CONFIG_PCI_MESON is not set
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # end of PCI switch controller drivers
> =

> # CONFIG_CXL_BUS is not set
> # CONFIG_PCCARD is not set
> # CONFIG_RAPIDIO is not set
> =

> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=3Dy
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> # CONFIG_DEVTMPFS_SAFE is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> # CONFIG_FW_LOADER_COMPRESS is not set
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dm
> CONFIG_REGMAP_SPI=3Dm
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> =

> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> =

> #
> # Firmware Drivers
> #
> =

> #
> # ARM System Control and Management Interface Protocol
> #
> # end of ARM System Control and Management Interface Protocol
> =

> CONFIG_EDD=3Dm
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DMIID=3Dy
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> CONFIG_SYSFB=3Dy
> # CONFIG_SYSFB_SIMPLEFB is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> CONFIG_EFI_VARS=3Dy
> CONFIG_EFI_ESRT=3Dy
> CONFIG_EFI_VARS_PSTORE=3Dy
> CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=3Dy
> CONFIG_EFI_RUNTIME_MAP=3Dy
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=3Dy
> # CONFIG_EFI_BOOTLOADER_CONTROL is not set
> # CONFIG_EFI_CAPSULE_LOADER is not set
> # CONFIG_EFI_TEST is not set
> CONFIG_APPLE_PROPERTIES=3Dy
> # CONFIG_RESET_ATTACK_MITIGATION is not set
> # CONFIG_EFI_RCI2_TABLE is not set
> # CONFIG_EFI_DISABLE_PCI_DMA is not set
> # end of EFI (Extensible Firmware Interface) Support
> =

> CONFIG_UEFI_CPER=3Dy
> CONFIG_UEFI_CPER_X86=3Dy
> CONFIG_EFI_DEV_PATH_PARSER=3Dy
> CONFIG_EFI_EARLYCON=3Dy
> CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> # CONFIG_GNSS is not set
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dm
> CONFIG_PARPORT_PC=3Dm
> CONFIG_PARPORT_SERIAL=3Dm
> # CONFIG_PARPORT_PC_FIFO is not set
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_AX88796 is not set
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dm
> # CONFIG_BLK_DEV_FD is not set
> CONFIG_CDROM=3Dm
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> CONFIG_BLK_DEV_LOOP=3Dm
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
> # CONFIG_BLK_DEV_DRBD is not set
> CONFIG_BLK_DEV_NBD=3Dm
> # CONFIG_BLK_DEV_SX8 is not set
> CONFIG_BLK_DEV_RAM=3Dm
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D16384
> CONFIG_CDROM_PKTCDVD=3Dm
> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_VIRTIO_BLK=3Dm
> CONFIG_BLK_DEV_RBD=3Dm
> =

> #
> # NVME Support
> #
> CONFIG_NVME_CORE=3Dm
> CONFIG_BLK_DEV_NVME=3Dm
> CONFIG_NVME_MULTIPATH=3Dy
> # CONFIG_NVME_HWMON is not set
> CONFIG_NVME_FABRICS=3Dm
> CONFIG_NVME_FC=3Dm
> # CONFIG_NVME_TCP is not set
> CONFIG_NVME_TARGET=3Dm
> # CONFIG_NVME_TARGET_PASSTHRU is not set
> CONFIG_NVME_TARGET_LOOP=3Dm
> CONFIG_NVME_TARGET_FC=3Dm
> CONFIG_NVME_TARGET_FCLOOP=3Dm
> # CONFIG_NVME_TARGET_TCP is not set
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> # CONFIG_AD525X_DPOT is not set
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=3Dm
> CONFIG_TIFM_7XX1=3Dm
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dm
> CONFIG_SGI_XP=3Dm
> CONFIG_HP_ILO=3Dm
> CONFIG_SGI_GRU=3Dm
> # CONFIG_SGI_GRU_DEBUG is not set
> CONFIG_APDS9802ALS=3Dm
> CONFIG_ISL29003=3Dm
> CONFIG_ISL29020=3Dm
> CONFIG_SENSORS_TSL2550=3Dm
> CONFIG_SENSORS_BH1770=3Dm
> CONFIG_SENSORS_APDS990X=3Dm
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> CONFIG_VMWARE_BALLOON=3Dm
> # CONFIG_LATTICE_ECP3_CONFIG is not set
> # CONFIG_SRAM is not set
> # CONFIG_DW_XDATA_PCIE is not set
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dm
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> # CONFIG_EEPROM_AT25 is not set
> CONFIG_EEPROM_LEGACY=3Dm
> CONFIG_EEPROM_MAX6875=3Dm
> CONFIG_EEPROM_93CX6=3Dm
> # CONFIG_EEPROM_93XX46 is not set
> # CONFIG_EEPROM_IDT_89HPESX is not set
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dm
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> CONFIG_SENSORS_LIS3_I2C=3Dm
> CONFIG_ALTERA_STAPL=3Dm
> CONFIG_INTEL_MEI=3Dm
> CONFIG_INTEL_MEI_ME=3Dm
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_INTEL_MEI_HDCP is not set
> # CONFIG_INTEL_MEI_PXP is not set
> CONFIG_VMWARE_VMCI=3Dm
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_BCM_VK is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> CONFIG_MISC_RTSX_PCI=3Dm
> # CONFIG_MISC_RTSX_USB is not set
> # CONFIG_HABANA_AI is not set
> # CONFIG_UACCE is not set
> CONFIG_PVPANIC=3Dy
> # CONFIG_PVPANIC_MMIO is not set
> # CONFIG_PVPANIC_PCI is not set
> # end of Misc devices
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dm
> CONFIG_SCSI_COMMON=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_NETLINK=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dm
> CONFIG_CHR_DEV_ST=3Dm
> CONFIG_BLK_DEV_SR=3Dm
> CONFIG_CHR_DEV_SG=3Dm
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_CHR_DEV_SCH=3Dm
> CONFIG_SCSI_ENCLOSURE=3Dm
> CONFIG_SCSI_CONSTANTS=3Dy
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dm
> CONFIG_SCSI_FC_ATTRS=3Dm
> CONFIG_SCSI_ISCSI_ATTRS=3Dm
> CONFIG_SCSI_SAS_ATTRS=3Dm
> CONFIG_SCSI_SAS_LIBSAS=3Dm
> CONFIG_SCSI_SAS_ATA=3Dy
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> CONFIG_SCSI_SRP_ATTRS=3Dm
> # end of SCSI Transports
> =

> CONFIG_SCSI_LOWLEVEL=3Dy
> # CONFIG_ISCSI_TCP is not set
> # CONFIG_ISCSI_BOOT_SYSFS is not set
> # CONFIG_SCSI_CXGB3_ISCSI is not set
> # CONFIG_SCSI_CXGB4_ISCSI is not set
> # CONFIG_SCSI_BNX2_ISCSI is not set
> # CONFIG_BE2ISCSI is not set
> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> # CONFIG_SCSI_HPSA is not set
> # CONFIG_SCSI_3W_9XXX is not set
> # CONFIG_SCSI_3W_SAS is not set
> # CONFIG_SCSI_ACARD is not set
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> # CONFIG_SCSI_AIC79XX is not set
> # CONFIG_SCSI_AIC94XX is not set
> # CONFIG_SCSI_MVSAS is not set
> # CONFIG_SCSI_MVUMI is not set
> # CONFIG_SCSI_DPT_I2O is not set
> # CONFIG_SCSI_ADVANSYS is not set
> # CONFIG_SCSI_ARCMSR is not set
> # CONFIG_SCSI_ESAS2R is not set
> # CONFIG_MEGARAID_NEWGEN is not set
> # CONFIG_MEGARAID_LEGACY is not set
> # CONFIG_MEGARAID_SAS is not set
> CONFIG_SCSI_MPT3SAS=3Dm
> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
> # CONFIG_SCSI_MPT2SAS is not set
> # CONFIG_SCSI_MPI3MR is not set
> # CONFIG_SCSI_SMARTPQI is not set
> # CONFIG_SCSI_UFSHCD is not set
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_SCSI_BUSLOGIC is not set
> # CONFIG_SCSI_MYRB is not set
> # CONFIG_SCSI_MYRS is not set
> # CONFIG_VMWARE_PVSCSI is not set
> CONFIG_HYPERV_STORAGE=3Dm
> # CONFIG_LIBFC is not set
> # CONFIG_SCSI_SNIC is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_FDOMAIN_PCI is not set
> CONFIG_SCSI_ISCI=3Dm
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> # CONFIG_SCSI_PPA is not set
> # CONFIG_SCSI_IMM is not set
> # CONFIG_SCSI_STEX is not set
> # CONFIG_SCSI_SYM53C8XX_2 is not set
> # CONFIG_SCSI_IPR is not set
> # CONFIG_SCSI_QLOGIC_1280 is not set
> # CONFIG_SCSI_QLA_FC is not set
> # CONFIG_SCSI_QLA_ISCSI is not set
> # CONFIG_SCSI_LPFC is not set
> # CONFIG_SCSI_EFCT is not set
> # CONFIG_SCSI_DC395x is not set
> # CONFIG_SCSI_AM53C974 is not set
> # CONFIG_SCSI_WD719X is not set
> CONFIG_SCSI_DEBUG=3Dm
> # CONFIG_SCSI_PMCRAID is not set
> # CONFIG_SCSI_PM8001 is not set
> # CONFIG_SCSI_BFA_FC is not set
> # CONFIG_SCSI_VIRTIO is not set
> # CONFIG_SCSI_CHELSIO_FCOE is not set
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dy
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dy
> CONFIG_SCSI_DH_ALUA=3Dy
> # end of SCSI device support
> =

> CONFIG_ATA=3Dm
> CONFIG_SATA_HOST=3Dy
> CONFIG_PATA_TIMINGS=3Dy
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> CONFIG_ATA_FORCE=3Dy
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dm
> CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> CONFIG_SATA_AHCI_PLATFORM=3Dm
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> # CONFIG_PDC_ADMA is not set
> # CONFIG_SATA_QSTOR is not set
> # CONFIG_SATA_SX4 is not set
> CONFIG_ATA_BMDMA=3Dy
> =

> #
> # SATA SFF controllers with BMDMA
> #
> CONFIG_ATA_PIIX=3Dm
> # CONFIG_SATA_DWC is not set
> # CONFIG_SATA_MV is not set
> # CONFIG_SATA_NV is not set
> # CONFIG_SATA_PROMISE is not set
> # CONFIG_SATA_SIL is not set
> # CONFIG_SATA_SIS is not set
> # CONFIG_SATA_SVW is not set
> # CONFIG_SATA_ULI is not set
> # CONFIG_SATA_VIA is not set
> # CONFIG_SATA_VITESSE is not set
> =

> #
> # PATA SFF controllers with BMDMA
> #
> # CONFIG_PATA_ALI is not set
> # CONFIG_PATA_AMD is not set
> # CONFIG_PATA_ARTOP is not set
> # CONFIG_PATA_ATIIXP is not set
> # CONFIG_PATA_ATP867X is not set
> # CONFIG_PATA_CMD64X is not set
> # CONFIG_PATA_CYPRESS is not set
> # CONFIG_PATA_EFAR is not set
> # CONFIG_PATA_HPT366 is not set
> # CONFIG_PATA_HPT37X is not set
> # CONFIG_PATA_HPT3X2N is not set
> # CONFIG_PATA_HPT3X3 is not set
> # CONFIG_PATA_IT8213 is not set
> # CONFIG_PATA_IT821X is not set
> # CONFIG_PATA_JMICRON is not set
> # CONFIG_PATA_MARVELL is not set
> # CONFIG_PATA_NETCELL is not set
> # CONFIG_PATA_NINJA32 is not set
> # CONFIG_PATA_NS87415 is not set
> # CONFIG_PATA_OLDPIIX is not set
> # CONFIG_PATA_OPTIDMA is not set
> # CONFIG_PATA_PDC2027X is not set
> # CONFIG_PATA_PDC_OLD is not set
> # CONFIG_PATA_RADISYS is not set
> # CONFIG_PATA_RDC is not set
> # CONFIG_PATA_SCH is not set
> # CONFIG_PATA_SERVERWORKS is not set
> # CONFIG_PATA_SIL680 is not set
> # CONFIG_PATA_SIS is not set
> # CONFIG_PATA_TOSHIBA is not set
> # CONFIG_PATA_TRIFLEX is not set
> # CONFIG_PATA_VIA is not set
> # CONFIG_PATA_WINBOND is not set
> =

> #
> # PIO-only SFF controllers
> #
> # CONFIG_PATA_CMD640_PCI is not set
> # CONFIG_PATA_MPIIX is not set
> # CONFIG_PATA_NS87410 is not set
> # CONFIG_PATA_OPTI is not set
> # CONFIG_PATA_RZ1000 is not set
> =

> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_ACPI is not set
> CONFIG_ATA_GENERIC=3Dm
> # CONFIG_PATA_LEGACY is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> CONFIG_MD_AUTODETECT=3Dy
> CONFIG_MD_LINEAR=3Dm
> CONFIG_MD_RAID0=3Dm
> CONFIG_MD_RAID1=3Dm
> CONFIG_MD_RAID10=3Dm
> CONFIG_MD_RAID456=3Dm
> # CONFIG_MD_MULTIPATH is not set
> CONFIG_MD_FAULTY=3Dm
> CONFIG_MD_CLUSTER=3Dm
> # CONFIG_BCACHE is not set
> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> CONFIG_BLK_DEV_DM=3Dm
> CONFIG_DM_DEBUG=3Dy
> CONFIG_DM_BUFIO=3Dm
> # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> CONFIG_DM_BIO_PRISON=3Dm
> CONFIG_DM_PERSISTENT_DATA=3Dm
> # CONFIG_DM_UNSTRIPED is not set
> CONFIG_DM_CRYPT=3Dm
> CONFIG_DM_SNAPSHOT=3Dm
> CONFIG_DM_THIN_PROVISIONING=3Dm
> CONFIG_DM_CACHE=3Dm
> CONFIG_DM_CACHE_SMQ=3Dm
> CONFIG_DM_WRITECACHE=3Dm
> # CONFIG_DM_EBS is not set
> CONFIG_DM_ERA=3Dm
> # CONFIG_DM_CLONE is not set
> CONFIG_DM_MIRROR=3Dm
> CONFIG_DM_LOG_USERSPACE=3Dm
> CONFIG_DM_RAID=3Dm
> CONFIG_DM_ZERO=3Dm
> CONFIG_DM_MULTIPATH=3Dm
> CONFIG_DM_MULTIPATH_QL=3Dm
> CONFIG_DM_MULTIPATH_ST=3Dm
> # CONFIG_DM_MULTIPATH_HST is not set
> # CONFIG_DM_MULTIPATH_IOA is not set
> CONFIG_DM_DELAY=3Dm
> # CONFIG_DM_DUST is not set
> CONFIG_DM_UEVENT=3Dy
> CONFIG_DM_FLAKEY=3Dm
> CONFIG_DM_VERITY=3Dm
> # CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
> # CONFIG_DM_VERITY_FEC is not set
> CONFIG_DM_SWITCH=3Dm
> CONFIG_DM_LOG_WRITES=3Dm
> CONFIG_DM_INTEGRITY=3Dm
> CONFIG_DM_AUDIT=3Dy
> CONFIG_TARGET_CORE=3Dm
> CONFIG_TCM_IBLOCK=3Dm
> CONFIG_TCM_FILEIO=3Dm
> CONFIG_TCM_PSCSI=3Dm
> CONFIG_TCM_USER2=3Dm
> CONFIG_LOOPBACK_TARGET=3Dm
> CONFIG_ISCSI_TARGET=3Dm
> # CONFIG_SBP_TARGET is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dm
> CONFIG_FIREWIRE_OHCI=3Dm
> CONFIG_FIREWIRE_SBP2=3Dm
> CONFIG_FIREWIRE_NET=3Dm
> # CONFIG_FIREWIRE_NOSY is not set
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> CONFIG_MAC_EMUMOUSEBTN=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
> # CONFIG_IFB is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_AMT is not set
> # CONFIG_MACSEC is not set
> CONFIG_NETCONSOLE=3Dm
> CONFIG_NETCONSOLE_DYNAMIC=3Dy
> CONFIG_NETPOLL=3Dy
> CONFIG_NET_POLL_CONTROLLER=3Dy
> CONFIG_TUN=3Dm
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> CONFIG_VIRTIO_NET=3Dm
> # CONFIG_NLMON is not set
> # CONFIG_NET_VRF is not set
> # CONFIG_VSOCKMON is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dy
> # CONFIG_NET_VENDOR_3COM is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> # CONFIG_ENA_ETHERNET is not set
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ASIX=3Dy
> # CONFIG_SPI_AX88796C is not set
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> CONFIG_CAVIUM_PTP=3Dy
> # CONFIG_LIQUIDIO is not set
> # CONFIG_LIQUIDIO_VF is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_ENGLEDER=3Dy
> # CONFIG_TSNEP is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> # CONFIG_GVE is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> # CONFIG_HINIC is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> CONFIG_E1000E=3Dy
> CONFIG_E1000E_HWTS=3Dy
> CONFIG_IGB=3Dy
> CONFIG_IGB_HWMON=3Dy
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> CONFIG_IXGBE=3Dy
> CONFIG_IXGBE_HWMON=3Dy
> # CONFIG_IXGBE_DCB is not set
> CONFIG_IXGBE_IPSEC=3Dy
> # CONFIG_IXGBEVF is not set
> CONFIG_I40E=3Dy
> # CONFIG_I40E_DCB is not set
> # CONFIG_I40EVF is not set
> # CONFIG_ICE is not set
> # CONFIG_FM10K is not set
> CONFIG_IGC=3Dy
> CONFIG_NET_VENDOR_MICROSOFT=3Dy
> # CONFIG_MICROSOFT_MANA is not set
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_LITEX=3Dy
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> # CONFIG_PRESTERA is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> CONFIG_R8169=3Dy
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> # CONFIG_ROCKER is not set
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VERTEXCOM=3Dy
> # CONFIG_MSE102X is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> CONFIG_PHYLIB=3Dy
> CONFIG_SWPHY=3Dy
> # CONFIG_LED_TRIGGER_PHY is not set
> CONFIG_FIXED_PHY=3Dy
> =

> #
> # MII PHY device drivers
> #
> # CONFIG_AMD_PHY is not set
> # CONFIG_ADIN_PHY is not set
> # CONFIG_AQUANTIA_PHY is not set
> CONFIG_AX88796B_PHY=3Dy
> # CONFIG_BROADCOM_PHY is not set
> # CONFIG_BCM54140_PHY is not set
> # CONFIG_BCM7XXX_PHY is not set
> # CONFIG_BCM84881_PHY is not set
> # CONFIG_BCM87XX_PHY is not set
> # CONFIG_CICADA_PHY is not set
> # CONFIG_CORTINA_PHY is not set
> # CONFIG_DAVICOM_PHY is not set
> # CONFIG_ICPLUS_PHY is not set
> # CONFIG_LXT_PHY is not set
> # CONFIG_INTEL_XWAY_PHY is not set
> # CONFIG_LSI_ET1011C_PHY is not set
> # CONFIG_MARVELL_PHY is not set
> # CONFIG_MARVELL_10G_PHY is not set
> # CONFIG_MARVELL_88X2222_PHY is not set
> # CONFIG_MAXLINEAR_GPHY is not set
> # CONFIG_MEDIATEK_GE_PHY is not set
> # CONFIG_MICREL_PHY is not set
> # CONFIG_MICROCHIP_PHY is not set
> # CONFIG_MICROCHIP_T1_PHY is not set
> # CONFIG_MICROSEMI_PHY is not set
> # CONFIG_MOTORCOMM_PHY is not set
> # CONFIG_NATIONAL_PHY is not set
> # CONFIG_NXP_C45_TJA11XX_PHY is not set
> # CONFIG_NXP_TJA11XX_PHY is not set
> # CONFIG_QSEMI_PHY is not set
> CONFIG_REALTEK_PHY=3Dy
> # CONFIG_RENESAS_PHY is not set
> # CONFIG_ROCKCHIP_PHY is not set
> # CONFIG_SMSC_PHY is not set
> # CONFIG_STE10XP is not set
> # CONFIG_TERANETICS_PHY is not set
> # CONFIG_DP83822_PHY is not set
> # CONFIG_DP83TC811_PHY is not set
> # CONFIG_DP83848_PHY is not set
> # CONFIG_DP83867_PHY is not set
> # CONFIG_DP83869_PHY is not set
> # CONFIG_VITESSE_PHY is not set
> # CONFIG_XILINX_GMII2RGMII is not set
> # CONFIG_MICREL_KS8995MA is not set
> CONFIG_MDIO_DEVICE=3Dy
> CONFIG_MDIO_BUS=3Dy
> CONFIG_FWNODE_MDIO=3Dy
> CONFIG_ACPI_MDIO=3Dy
> CONFIG_MDIO_DEVRES=3Dy
> # CONFIG_MDIO_BITBANG is not set
> # CONFIG_MDIO_BCM_UNIMAC is not set
> # CONFIG_MDIO_MVUSB is not set
> # CONFIG_MDIO_THUNDER is not set
> =

> #
> # MDIO Multiplexers
> #
> =

> #
> # PCS device drivers
> #
> # CONFIG_PCS_XPCS is not set
> # end of PCS device drivers
> =

> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> CONFIG_USB_NET_DRIVERS=3Dy
> # CONFIG_USB_CATC is not set
> # CONFIG_USB_KAWETH is not set
> # CONFIG_USB_PEGASUS is not set
> # CONFIG_USB_RTL8150 is not set
> CONFIG_USB_RTL8152=3Dy
> # CONFIG_USB_LAN78XX is not set
> CONFIG_USB_USBNET=3Dy
> CONFIG_USB_NET_AX8817X=3Dy
> CONFIG_USB_NET_AX88179_178A=3Dy
> # CONFIG_USB_NET_CDCETHER is not set
> # CONFIG_USB_NET_CDC_EEM is not set
> # CONFIG_USB_NET_CDC_NCM is not set
> # CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
> # CONFIG_USB_NET_CDC_MBIM is not set
> # CONFIG_USB_NET_DM9601 is not set
> # CONFIG_USB_NET_SR9700 is not set
> # CONFIG_USB_NET_SR9800 is not set
> # CONFIG_USB_NET_SMSC75XX is not set
> # CONFIG_USB_NET_SMSC95XX is not set
> # CONFIG_USB_NET_GL620A is not set
> # CONFIG_USB_NET_NET1080 is not set
> # CONFIG_USB_NET_PLUSB is not set
> # CONFIG_USB_NET_MCS7830 is not set
> # CONFIG_USB_NET_RNDIS_HOST is not set
> # CONFIG_USB_NET_CDC_SUBSET is not set
> # CONFIG_USB_NET_ZAURUS is not set
> # CONFIG_USB_NET_CX82310_ETH is not set
> # CONFIG_USB_NET_KALMIA is not set
> # CONFIG_USB_NET_QMI_WWAN is not set
> # CONFIG_USB_HSO is not set
> # CONFIG_USB_NET_INT51X1 is not set
> # CONFIG_USB_IPHETH is not set
> # CONFIG_USB_SIERRA_NET is not set
> # CONFIG_USB_NET_CH9200 is not set
> # CONFIG_USB_NET_AQC111 is not set
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> # CONFIG_ADM8211 is not set
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K is not set
> # CONFIG_ATH5K_PCI is not set
> # CONFIG_ATH9K is not set
> # CONFIG_ATH9K_HTC is not set
> # CONFIG_CARL9170 is not set
> # CONFIG_ATH6KL is not set
> # CONFIG_AR5523 is not set
> # CONFIG_WIL6210 is not set
> # CONFIG_ATH10K is not set
> # CONFIG_WCN36XX is not set
> # CONFIG_ATH11K is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> # CONFIG_ATMEL is not set
> # CONFIG_AT76C50X_USB is not set
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> # CONFIG_B43 is not set
> # CONFIG_B43LEGACY is not set
> # CONFIG_BRCMSMAC is not set
> # CONFIG_BRCMFMAC is not set
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> # CONFIG_AIRO is not set
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> # CONFIG_IPW2100 is not set
> # CONFIG_IPW2200 is not set
> # CONFIG_IWL4965 is not set
> # CONFIG_IWL3945 is not set
> # CONFIG_IWLWIFI is not set
> # CONFIG_IWLMEI is not set
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> # CONFIG_HERMES is not set
> # CONFIG_P54_COMMON is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> # CONFIG_LIBERTAS is not set
> # CONFIG_LIBERTAS_THINFIRM is not set
> # CONFIG_MWIFIEX is not set
> # CONFIG_MWL8K is not set
> # CONFIG_WLAN_VENDOR_MEDIATEK is not set
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> # CONFIG_WILC1000_SDIO is not set
> # CONFIG_WILC1000_SPI is not set
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> # CONFIG_RT2X00 is not set
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> # CONFIG_RTL8180 is not set
> # CONFIG_RTL8187 is not set
> CONFIG_RTL_CARDS=3Dm
> # CONFIG_RTL8192CE is not set
> # CONFIG_RTL8192SE is not set
> # CONFIG_RTL8192DE is not set
> # CONFIG_RTL8723AE is not set
> # CONFIG_RTL8723BE is not set
> # CONFIG_RTL8188EE is not set
> # CONFIG_RTL8192EE is not set
> # CONFIG_RTL8821AE is not set
> # CONFIG_RTL8192CU is not set
> # CONFIG_RTL8XXXU is not set
> # CONFIG_RTW88 is not set
> # CONFIG_RTW89 is not set
> CONFIG_WLAN_VENDOR_RSI=3Dy
> # CONFIG_RSI_91X is not set
> CONFIG_WLAN_VENDOR_ST=3Dy
> # CONFIG_CW1200 is not set
> CONFIG_WLAN_VENDOR_TI=3Dy
> # CONFIG_WL1251 is not set
> # CONFIG_WL12XX is not set
> # CONFIG_WL18XX is not set
> # CONFIG_WLCORE is not set
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> # CONFIG_USB_ZD1201 is not set
> # CONFIG_ZD1211RW is not set
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_QTNFMAC_PCIE is not set
> # CONFIG_MAC80211_HWSIM is not set
> # CONFIG_USB_NET_RNDIS_WLAN is not set
> # CONFIG_VIRT_WIFI is not set
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dm
> # CONFIG_IEEE802154_FAKELB is not set
> # CONFIG_IEEE802154_AT86RF230 is not set
> # CONFIG_IEEE802154_MRF24J40 is not set
> # CONFIG_IEEE802154_CC2520 is not set
> # CONFIG_IEEE802154_ATUSB is not set
> # CONFIG_IEEE802154_ADF7242 is not set
> # CONFIG_IEEE802154_CA8210 is not set
> # CONFIG_IEEE802154_MCR20A is not set
> # CONFIG_IEEE802154_HWSIM is not set
> =

> #
> # Wireless WAN
> #
> # CONFIG_WWAN is not set
> # end of Wireless WAN
> =

> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_HYPERV_NET is not set
> # CONFIG_NETDEVSIM is not set
> CONFIG_NET_FAILOVER=3Dm
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dm
> CONFIG_INPUT_SPARSEKMAP=3Dm
> # CONFIG_INPUT_MATRIXKMAP is not set
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dm
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> # CONFIG_KEYBOARD_APPLESPI is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> CONFIG_MOUSE_PS2_ELANTECH=3Dy
> CONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> CONFIG_MOUSE_PS2_VMMOUSE=3Dy
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> CONFIG_MOUSE_SERIAL=3Dm
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dm
> CONFIG_MOUSE_ELAN_I2C=3Dm
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> CONFIG_MOUSE_VSXXXAA=3Dm
> # CONFIG_MOUSE_GPIO is not set
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> CONFIG_RMI4_CORE=3Dm
> CONFIG_RMI4_I2C=3Dm
> CONFIG_RMI4_SPI=3Dm
> CONFIG_RMI4_SMB=3Dm
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dm
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> CONFIG_RMI4_F34=3Dy
> # CONFIG_RMI4_F3A is not set
> # CONFIG_RMI4_F54 is not set
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> # CONFIG_SERIO_CT82C710 is not set
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> CONFIG_SERIO_ALTERA_PS2=3Dm
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=3Dm
> CONFIG_HYPERV_KEYBOARD=3Dm
> # CONFIG_SERIO_GPIO_PS2 is not set
> # CONFIG_USERIO is not set
> # CONFIG_GAMEPORT is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_VT_CONSOLE_SLEEP=3Dy
> CONFIG_HW_CONSOLE=3Dy
> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D64
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=3Dy
> CONFIG_SERIAL_8250_DWLIB=3Dy
> CONFIG_SERIAL_8250_DW=3Dy
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> CONFIG_SERIAL_8250_PERICOM=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dm
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_BCM63XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_ARC=3Dm
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> CONFIG_SERIAL_NONSTANDARD=3Dy
> # CONFIG_MOXA_INTELLIO is not set
> # CONFIG_MOXA_SMARTIO is not set
> CONFIG_SYNCLINK_GT=3Dm
> CONFIG_N_HDLC=3Dm
> CONFIG_N_GSM=3Dm
> CONFIG_NOZOMI=3Dm
> # CONFIG_NULL_TTY is not set
> CONFIG_HVC_DRIVER=3Dy
> # CONFIG_SERIAL_DEV_BUS is not set
> CONFIG_PRINTER=3Dm
> # CONFIG_LP_CONSOLE is not set
> CONFIG_PPDEV=3Dm
> CONFIG_VIRTIO_CONSOLE=3Dm
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_DMI_DECODE=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SSIF=3Dm
> CONFIG_IPMI_WATCHDOG=3Dm
> CONFIG_IPMI_POWEROFF=3Dm
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> CONFIG_HW_RANDOM_INTEL=3Dm
> CONFIG_HW_RANDOM_AMD=3Dm
> # CONFIG_HW_RANDOM_BA431 is not set
> CONFIG_HW_RANDOM_VIA=3Dm
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> # CONFIG_HW_RANDOM_XIPHERA is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_MWAVE is not set
> CONFIG_DEVMEM=3Dy
> CONFIG_NVRAM=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> # CONFIG_HPET_MMAP_DEFAULT is not set
> CONFIG_HANGCHECK_TIMER=3Dm
> CONFIG_UV_MMTIMER=3Dm
> CONFIG_TCG_TPM=3Dy
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_SPI is not set
> # CONFIG_TCG_TIS_I2C_CR50 is not set
> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> CONFIG_TCG_NSC=3Dm
> CONFIG_TCG_ATMEL=3Dm
> CONFIG_TCG_INFINEON=3Dm
> CONFIG_TCG_CRB=3Dy
> # CONFIG_TCG_VTPM_PROXY is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dm
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> CONFIG_TELCLOCK=3Dm
> # CONFIG_XILLYBUS is not set
> # CONFIG_XILLYUSB is not set
> # CONFIG_RANDOM_TRUST_CPU is not set
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> # end of Character devices
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_MUX_GPIO is not set
> # CONFIG_I2C_MUX_LTC4306 is not set
> # CONFIG_I2C_MUX_PCA9541 is not set
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> # end of Multiplexer I2C Chip support
> =

> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCA=3Dm
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=3Dm
> CONFIG_I2C_AMD756_S4882=3Dm
> CONFIG_I2C_AMD8111=3Dm
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dm
> CONFIG_I2C_ISMT=3Dm
> CONFIG_I2C_PIIX4=3Dm
> CONFIG_I2C_NFORCE2=3Dm
> CONFIG_I2C_NFORCE2_S4985=3Dm
> # CONFIG_I2C_NVIDIA_GPU is not set
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> CONFIG_I2C_SIS96X=3Dm
> CONFIG_I2C_VIA=3Dm
> CONFIG_I2C_VIAPRO=3Dm
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dm
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dm
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dm
> CONFIG_I2C_SIMTEC=3Dm
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> # CONFIG_I2C_CP2615 is not set
> CONFIG_I2C_PARPORT=3Dm
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dm
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> =

> CONFIG_I2C_STUB=3Dm
> # CONFIG_I2C_SLAVE is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> CONFIG_SPI=3Dy
> # CONFIG_SPI_DEBUG is not set
> CONFIG_SPI_MASTER=3Dy
> # CONFIG_SPI_MEM is not set
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> # CONFIG_SPI_AXI_SPI_ENGINE is not set
> # CONFIG_SPI_BITBANG is not set
> # CONFIG_SPI_BUTTERFLY is not set
> # CONFIG_SPI_CADENCE is not set
> # CONFIG_SPI_DESIGNWARE is not set
> # CONFIG_SPI_NXP_FLEXSPI is not set
> # CONFIG_SPI_GPIO is not set
> # CONFIG_SPI_LM70_LLP is not set
> # CONFIG_SPI_LANTIQ_SSC is not set
> # CONFIG_SPI_OC_TINY is not set
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_ROCKCHIP is not set
> # CONFIG_SPI_SC18IS602 is not set
> # CONFIG_SPI_SIFIVE is not set
> # CONFIG_SPI_MXIC is not set
> # CONFIG_SPI_XCOMM is not set
> # CONFIG_SPI_XILINX is not set
> # CONFIG_SPI_ZYNQMP_GQSPI is not set
> # CONFIG_SPI_AMD is not set
> =

> #
> # SPI Multiplexer support
> #
> # CONFIG_SPI_MUX is not set
> =

> #
> # SPI Protocol Masters
> #
> # CONFIG_SPI_SPIDEV is not set
> # CONFIG_SPI_LOOPBACK_TEST is not set
> # CONFIG_SPI_TLE62X0 is not set
> # CONFIG_SPI_SLAVE is not set
> CONFIG_SPI_DYNAMIC=3Dy
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> CONFIG_PPS_CLIENT_LDISC=3Dm
> CONFIG_PPS_CLIENT_PARPORT=3Dm
> CONFIG_PPS_CLIENT_GPIO=3Dm
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=3Dy
> CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> # CONFIG_DP83640_PHY is not set
> # CONFIG_PTP_1588_CLOCK_INES is not set
> CONFIG_PTP_1588_CLOCK_KVM=3Dm
> # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
> # CONFIG_PTP_1588_CLOCK_IDTCM is not set
> # CONFIG_PTP_1588_CLOCK_VMW is not set
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> # CONFIG_DEBUG_PINCTRL is not set
> CONFIG_PINCTRL_AMD=3Dm
> # CONFIG_PINCTRL_MCP23S08 is not set
> # CONFIG_PINCTRL_SX150X is not set
> =

> #
> # Intel pinctrl drivers
> #
> CONFIG_PINCTRL_BAYTRAIL=3Dy
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> CONFIG_PINCTRL_INTEL=3Dy
> # CONFIG_PINCTRL_ALDERLAKE is not set
> CONFIG_PINCTRL_BROXTON=3Dm
> CONFIG_PINCTRL_CANNONLAKE=3Dm
> CONFIG_PINCTRL_CEDARFORK=3Dm
> CONFIG_PINCTRL_DENVERTON=3Dm
> # CONFIG_PINCTRL_ELKHARTLAKE is not set
> # CONFIG_PINCTRL_EMMITSBURG is not set
> CONFIG_PINCTRL_GEMINILAKE=3Dm
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_JASPERLAKE is not set
> # CONFIG_PINCTRL_LAKEFIELD is not set
> CONFIG_PINCTRL_LEWISBURG=3Dm
> CONFIG_PINCTRL_SUNRISEPOINT=3Dm
> # CONFIG_PINCTRL_TIGERLAKE is not set
> # end of Intel pinctrl drivers
> =

> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> =

> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_CDEV=3Dy
> CONFIG_GPIO_CDEV_V1=3Dy
> CONFIG_GPIO_GENERIC=3Dm
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_AMDPT=3Dm
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_ICH=3Dm
> # CONFIG_GPIO_MB86S7X is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_F7188X is not set
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_WINBOND is not set
> # CONFIG_GPIO_WS16C48 is not set
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> # CONFIG_GPIO_PCA953X is not set
> # CONFIG_GPIO_PCA9570 is not set
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
> =

> #
> # SPI GPIO expanders
> #
> # CONFIG_GPIO_MAX3191X is not set
> # CONFIG_GPIO_MAX7301 is not set
> # CONFIG_GPIO_MC33880 is not set
> # CONFIG_GPIO_PISOSR is not set
> # CONFIG_GPIO_XRA1403 is not set
> # end of SPI GPIO expanders
> =

> #
> # USB GPIO expanders
> #
> # end of USB GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> # CONFIG_GPIO_AGGREGATOR is not set
> # CONFIG_GPIO_MOCKUP is not set
> # CONFIG_GPIO_VIRTIO is not set
> # CONFIG_GPIO_SIM is not set
> # end of Virtual GPIO drivers
> =

> # CONFIG_W1 is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_CW2015 is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_CHARGER_SBS is not set
> # CONFIG_MANAGER_SBS is not set
> # CONFIG_BATTERY_BQ27XXX is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_LTC4162L is not set
> # CONFIG_CHARGER_MAX77976 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ2515X is not set
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_BQ25980 is not set
> # CONFIG_CHARGER_BQ256XX is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_BATTERY_GOLDFISH is not set
> # CONFIG_BATTERY_RT5033 is not set
> # CONFIG_CHARGER_RT9455 is not set
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dm
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dm
> CONFIG_SENSORS_ABITUGURU3=3Dm
> # CONFIG_SENSORS_AD7314 is not set
> CONFIG_SENSORS_AD7414=3Dm
> CONFIG_SENSORS_AD7418=3Dm
> CONFIG_SENSORS_ADM1021=3Dm
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> CONFIG_SENSORS_ADM1031=3Dm
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dm
> # CONFIG_SENSORS_ADT7310 is not set
> CONFIG_SENSORS_ADT7410=3Dm
> CONFIG_SENSORS_ADT7411=3Dm
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> CONFIG_SENSORS_ADT7475=3Dm
> # CONFIG_SENSORS_AHT10 is not set
> # CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dm
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> CONFIG_SENSORS_K8TEMP=3Dm
> CONFIG_SENSORS_K10TEMP=3Dm
> CONFIG_SENSORS_FAM15H_POWER=3Dm
> CONFIG_SENSORS_APPLESMC=3Dm
> CONFIG_SENSORS_ASB100=3Dm
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dm
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> # CONFIG_SENSORS_DRIVETEMP is not set
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dm
> CONFIG_SENSORS_I5K_AMB=3Dm
> CONFIG_SENSORS_F71805F=3Dm
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_FSCHMD=3Dm
> # CONFIG_SENSORS_FTSTEUTATES is not set
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> # CONFIG_SENSORS_G762 is not set
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dm
> CONFIG_SENSORS_IBMPEX=3Dm
> CONFIG_SENSORS_I5500=3Dm
> CONFIG_SENSORS_CORETEMP=3Dm
> CONFIG_SENSORS_IT87=3Dm
> CONFIG_SENSORS_JC42=3Dm
> # CONFIG_SENSORS_POWR1220 is not set
> CONFIG_SENSORS_LINEAGE=3Dm
> # CONFIG_SENSORS_LTC2945 is not set
> # CONFIG_SENSORS_LTC2947_I2C is not set
> # CONFIG_SENSORS_LTC2947_SPI is not set
> # CONFIG_SENSORS_LTC2990 is not set
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dm
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dm
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dm
> # CONFIG_SENSORS_MAX1111 is not set
> # CONFIG_SENSORS_MAX127 is not set
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dm
> # CONFIG_SENSORS_MAX31722 is not set
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX6620 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dm
> CONFIG_SENSORS_MAX6642=3Dm
> CONFIG_SENSORS_MAX6650=3Dm
> CONFIG_SENSORS_MAX6697=3Dm
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=3Dm
> # CONFIG_SENSORS_MLXREG_FAN is not set
> # CONFIG_SENSORS_TC654 is not set
> # CONFIG_SENSORS_TPS23861 is not set
> # CONFIG_SENSORS_MR75203 is not set
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=3Dm
> # CONFIG_SENSORS_LM70 is not set
> CONFIG_SENSORS_LM73=3Dm
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dm
> CONFIG_SENSORS_LM78=3Dm
> CONFIG_SENSORS_LM80=3Dm
> CONFIG_SENSORS_LM83=3Dm
> CONFIG_SENSORS_LM85=3Dm
> CONFIG_SENSORS_LM87=3Dm
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dm
> CONFIG_SENSORS_LM95234=3Dm
> CONFIG_SENSORS_LM95241=3Dm
> CONFIG_SENSORS_LM95245=3Dm
> CONFIG_SENSORS_PC87360=3Dm
> CONFIG_SENSORS_PC87427=3Dm
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775=3Dm
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_NCT7904 is not set
> # CONFIG_SENSORS_NPCM7XX is not set
> # CONFIG_SENSORS_NZXT_KRAKEN2 is not set
> # CONFIG_SENSORS_NZXT_SMART2 is not set
> CONFIG_SENSORS_PCF8591=3Dm
> CONFIG_PMBUS=3Dm
> CONFIG_SENSORS_PMBUS=3Dm
> # CONFIG_SENSORS_ADM1266 is not set
> CONFIG_SENSORS_ADM1275=3Dm
> # CONFIG_SENSORS_BEL_PFE is not set
> # CONFIG_SENSORS_BPA_RS600 is not set
> # CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
> # CONFIG_SENSORS_FSP_3Y is not set
> # CONFIG_SENSORS_IBM_CFFPS is not set
> # CONFIG_SENSORS_DPS920AB is not set
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> # CONFIG_SENSORS_IR35221 is not set
> # CONFIG_SENSORS_IR36021 is not set
> # CONFIG_SENSORS_IR38064 is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dm
> # CONFIG_SENSORS_LTC3815 is not set
> # CONFIG_SENSORS_MAX15301 is not set
> CONFIG_SENSORS_MAX16064=3Dm
> # CONFIG_SENSORS_MAX16601 is not set
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> CONFIG_SENSORS_MAX34440=3Dm
> CONFIG_SENSORS_MAX8688=3Dm
> # CONFIG_SENSORS_MP2888 is not set
> # CONFIG_SENSORS_MP2975 is not set
> # CONFIG_SENSORS_MP5023 is not set
> # CONFIG_SENSORS_PIM4328 is not set
> # CONFIG_SENSORS_PM6764TR is not set
> # CONFIG_SENSORS_PXE1610 is not set
> # CONFIG_SENSORS_Q54SJ108A2 is not set
> # CONFIG_SENSORS_STPDDC60 is not set
> # CONFIG_SENSORS_TPS40422 is not set
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_UCD9000=3Dm
> CONFIG_SENSORS_UCD9200=3Dm
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=3Dm
> # CONFIG_SENSORS_SBTSI is not set
> # CONFIG_SENSORS_SBRMI is not set
> CONFIG_SENSORS_SHT15=3Dm
> CONFIG_SENSORS_SHT21=3Dm
> # CONFIG_SENSORS_SHT3x is not set
> # CONFIG_SENSORS_SHT4x is not set
> # CONFIG_SENSORS_SHTC1 is not set
> CONFIG_SENSORS_SIS5595=3Dm
> CONFIG_SENSORS_DME1737=3Dm
> CONFIG_SENSORS_EMC1403=3Dm
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dm
> CONFIG_SENSORS_SMSC47M1=3Dm
> CONFIG_SENSORS_SMSC47M192=3Dm
> CONFIG_SENSORS_SMSC47B397=3Dm
> CONFIG_SENSORS_SCH56XX_COMMON=3Dm
> CONFIG_SENSORS_SCH5627=3Dm
> CONFIG_SENSORS_SCH5636=3Dm
> # CONFIG_SENSORS_STTS751 is not set
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS7828=3Dm
> # CONFIG_SENSORS_ADS7871 is not set
> CONFIG_SENSORS_AMC6821=3Dm
> CONFIG_SENSORS_INA209=3Dm
> CONFIG_SENSORS_INA2XX=3Dm
> # CONFIG_SENSORS_INA238 is not set
> # CONFIG_SENSORS_INA3221 is not set
> # CONFIG_SENSORS_TC74 is not set
> CONFIG_SENSORS_THMC50=3Dm
> CONFIG_SENSORS_TMP102=3Dm
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dm
> CONFIG_SENSORS_TMP421=3Dm
> # CONFIG_SENSORS_TMP513 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> CONFIG_SENSORS_VIA686A=3Dm
> CONFIG_SENSORS_VT1211=3Dm
> CONFIG_SENSORS_VT8231=3Dm
> # CONFIG_SENSORS_W83773G is not set
> CONFIG_SENSORS_W83781D=3Dm
> CONFIG_SENSORS_W83791D=3Dm
> CONFIG_SENSORS_W83792D=3Dm
> CONFIG_SENSORS_W83793=3Dm
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> CONFIG_SENSORS_W83L786NG=3Dm
> CONFIG_SENSORS_W83627HF=3Dm
> CONFIG_SENSORS_W83627EHF=3Dm
> # CONFIG_SENSORS_XGENE is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dm
> CONFIG_SENSORS_ATK0110=3Dm
> # CONFIG_SENSORS_ASUS_WMI is not set
> # CONFIG_SENSORS_ASUS_WMI_EC is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> =

> #
> # Intel thermal drivers
> #
> CONFIG_INTEL_POWERCLAMP=3Dm
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> =

> CONFIG_INTEL_PCH_THERMAL=3Dm
> # CONFIG_INTEL_TCC_COOLING is not set
> # CONFIG_INTEL_MENLOW is not set
> # end of Intel thermal drivers
> =

> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> CONFIG_WATCHDOG_SYSFS=3Dy
> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
> =

> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dm
> CONFIG_WDAT_WDT=3Dm
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> # CONFIG_MLX_WDT is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> # CONFIG_ACQUIRE_WDT is not set
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=3Dm
> CONFIG_ALIM7101_WDT=3Dm
> # CONFIG_EBC_C384_WDT is not set
> CONFIG_F71808E_WDT=3Dm
> # CONFIG_SP5100_TCO is not set
> CONFIG_SBC_FITPC2_WATCHDOG=3Dm
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dm
> CONFIG_IBMASR=3Dm
> # CONFIG_WAFER_WDT is not set
> CONFIG_I6300ESB_WDT=3Dy
> CONFIG_IE6XX_WDT=3Dm
> CONFIG_ITCO_WDT=3Dy
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> CONFIG_IT8712F_WDT=3Dm
> CONFIG_IT87_WDT=3Dm
> CONFIG_HP_WATCHDOG=3Dm
> CONFIG_HPWDT_NMI_DECODING=3Dy
> # CONFIG_SC1200_WDT is not set
> # CONFIG_PC87413_WDT is not set
> CONFIG_NV_TCO=3Dm
> # CONFIG_60XX_WDT is not set
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dm
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_TQMX86_WDT is not set
> CONFIG_VIA_WDT=3Dm
> CONFIG_W83627HF_WDT=3Dm
> CONFIG_W83877F_WDT=3Dm
> CONFIG_W83977F_WDT=3Dm
> CONFIG_MACHZ_WDT=3Dm
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> CONFIG_INTEL_MEI_WDT=3Dm
> # CONFIG_NI903X_WDT is not set
> # CONFIG_NIC7018_WDT is not set
> # CONFIG_MEN_A21_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dm
> CONFIG_WDTPCI=3Dm
> =

> #
> # USB-based Watchdog Cards
> #
> # CONFIG_USBPCWATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dm
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_BCM590XX is not set
> # CONFIG_MFD_BD9571MWV is not set
> # CONFIG_MFD_AXP20X_I2C is not set
> # CONFIG_MFD_MADERA is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> # CONFIG_MFD_DA9063 is not set
> # CONFIG_MFD_DA9150 is not set
> # CONFIG_MFD_DLN2 is not set
> # CONFIG_MFD_MC13XXX_SPI is not set
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_MFD_MP2629 is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dm
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> # CONFIG_MFD_INTEL_PMC_BXT is not set
> # CONFIG_MFD_IQS62X is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MT6360 is not set
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> # CONFIG_EZX_PCAP is not set
> # CONFIG_MFD_VIPERBOARD is not set
> # CONFIG_MFD_RETU is not set
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT4831 is not set
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dm
> CONFIG_MFD_SM501_GPIO=3Dy
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_MFD_SYSCON is not set
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_MFD_PALMAS is not set
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> # CONFIG_MFD_TPS65086 is not set
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_MFD_TPS65912_SPI is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=3Dm
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_ARIZONA_SPI is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM831X_SPI is not set
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_MFD_ATC260X_I2C is not set
> # CONFIG_MFD_INTEL_M10_BMC is not set
> # end of Multifunction device drivers
> =

> # CONFIG_REGULATOR is not set
> CONFIG_RC_CORE=3Dm
> CONFIG_RC_MAP=3Dm
> CONFIG_LIRC=3Dy
> CONFIG_RC_DECODERS=3Dy
> CONFIG_IR_NEC_DECODER=3Dm
> CONFIG_IR_RC5_DECODER=3Dm
> CONFIG_IR_RC6_DECODER=3Dm
> CONFIG_IR_JVC_DECODER=3Dm
> CONFIG_IR_SONY_DECODER=3Dm
> CONFIG_IR_SANYO_DECODER=3Dm
> # CONFIG_IR_SHARP_DECODER is not set
> CONFIG_IR_MCE_KBD_DECODER=3Dm
> # CONFIG_IR_XMP_DECODER is not set
> CONFIG_IR_IMON_DECODER=3Dm
> # CONFIG_IR_RCMM_DECODER is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> CONFIG_IR_ENE=3Dm
> # CONFIG_IR_IMON is not set
> # CONFIG_IR_IMON_RAW is not set
> # CONFIG_IR_MCEUSB is not set
> CONFIG_IR_ITE_CIR=3Dm
> CONFIG_IR_FINTEK=3Dm
> CONFIG_IR_NUVOTON=3Dm
> # CONFIG_IR_REDRAT3 is not set
> # CONFIG_IR_STREAMZAP is not set
> CONFIG_IR_WINBOND_CIR=3Dm
> # CONFIG_IR_IGORPLUGUSB is not set
> # CONFIG_IR_IGUANA is not set
> # CONFIG_IR_TTUSBIR is not set
> # CONFIG_RC_LOOPBACK is not set
> CONFIG_IR_SERIAL=3Dm
> CONFIG_IR_SERIAL_TRANSMITTER=3Dy
> # CONFIG_RC_XBOX_DVD is not set
> # CONFIG_IR_TOY is not set
> =

> #
> # CEC support
> #
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> # CONFIG_CEC_CH7322 is not set
> # CONFIG_CEC_SECO is not set
> # CONFIG_USB_PULSE8_CEC is not set
> # CONFIG_USB_RAINSHADOW_CEC is not set
> # end of CEC support
> =

> CONFIG_MEDIA_SUPPORT=3Dm
> # CONFIG_MEDIA_SUPPORT_FILTER is not set
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> =

> #
> # Media device types
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
> CONFIG_MEDIA_TEST_SUPPORT=3Dy
> # end of Media device types
> =

> #
> # Media core support
> #
> CONFIG_VIDEO_DEV=3Dm
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_DVB_CORE=3Dm
> # end of Media core support
> =

> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2=3Dm
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> # end of Video4Linux options
> =

> #
> # Media controller options
> #
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> # end of Media controller options
> =

> #
> # Digital TV options
> #
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> # end of Digital TV options
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_USB_SUPPORT is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_RADIO_ADAPTERS=3Dy
> # CONFIG_RADIO_SI470X is not set
> # CONFIG_RADIO_SI4713 is not set
> # CONFIG_USB_MR800 is not set
> # CONFIG_USB_DSBR is not set
> # CONFIG_RADIO_MAXIRADIO is not set
> # CONFIG_RADIO_SHARK is not set
> # CONFIG_RADIO_SHARK2 is not set
> # CONFIG_USB_KEENE is not set
> # CONFIG_USB_RAREMONO is not set
> # CONFIG_USB_MA901 is not set
> # CONFIG_RADIO_TEA5764 is not set
> # CONFIG_RADIO_SAA7706H is not set
> # CONFIG_RADIO_TEF6862 is not set
> # CONFIG_RADIO_WL1273 is not set
> CONFIG_VIDEOBUF2_CORE=3Dm
> CONFIG_VIDEOBUF2_V4L2=3Dm
> CONFIG_VIDEOBUF2_MEMOPS=3Dm
> CONFIG_VIDEOBUF2_VMALLOC=3Dm
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> # CONFIG_SDR_PLATFORM_DRIVERS is not set
> =

> #
> # MMC/SDIO DVB adapters
> #
> # CONFIG_SMS_SDIO_DRV is not set
> # CONFIG_V4L_TEST_DRIVERS is not set
> # CONFIG_DVB_TEST_DRIVERS is not set
> =

> #
> # FireWire (IEEE 1394) Adapters
> #
> # CONFIG_DVB_FIREDTV is not set
> # end of Media drivers
> =

> #
> # Media ancillary drivers
> #
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
> =

> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_TVAUDIO is not set
> # CONFIG_VIDEO_TDA7432 is not set
> # CONFIG_VIDEO_TDA9840 is not set
> # CONFIG_VIDEO_TEA6415C is not set
> # CONFIG_VIDEO_TEA6420 is not set
> # CONFIG_VIDEO_MSP3400 is not set
> # CONFIG_VIDEO_CS3308 is not set
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> # CONFIG_VIDEO_TLV320AIC23B is not set
> # CONFIG_VIDEO_UDA1342 is not set
> # CONFIG_VIDEO_WM8775 is not set
> # CONFIG_VIDEO_WM8739 is not set
> # CONFIG_VIDEO_VP27SMPX is not set
> # CONFIG_VIDEO_SONY_BTF_MPX is not set
> # end of Audio decoders, processors and mixers
> =

> #
> # RDS decoders
> #
> # CONFIG_VIDEO_SAA6588 is not set
> # end of RDS decoders
> =

> #
> # Video decoders
> #
> # CONFIG_VIDEO_ADV7180 is not set
> # CONFIG_VIDEO_ADV7183 is not set
> # CONFIG_VIDEO_ADV7604 is not set
> # CONFIG_VIDEO_ADV7842 is not set
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> # CONFIG_VIDEO_BT866 is not set
> # CONFIG_VIDEO_KS0127 is not set
> # CONFIG_VIDEO_ML86V7667 is not set
> # CONFIG_VIDEO_SAA7110 is not set
> # CONFIG_VIDEO_SAA711X is not set
> # CONFIG_VIDEO_TC358743 is not set
> # CONFIG_VIDEO_TVP514X is not set
> # CONFIG_VIDEO_TVP5150 is not set
> # CONFIG_VIDEO_TVP7002 is not set
> # CONFIG_VIDEO_TW2804 is not set
> # CONFIG_VIDEO_TW9903 is not set
> # CONFIG_VIDEO_TW9906 is not set
> # CONFIG_VIDEO_TW9910 is not set
> # CONFIG_VIDEO_VPX3220 is not set
> =

> #
> # Video and audio decoders
> #
> # CONFIG_VIDEO_SAA717X is not set
> # CONFIG_VIDEO_CX25840 is not set
> # end of Video decoders
> =

> #
> # Video encoders
> #
> # CONFIG_VIDEO_SAA7127 is not set
> # CONFIG_VIDEO_SAA7185 is not set
> # CONFIG_VIDEO_ADV7170 is not set
> # CONFIG_VIDEO_ADV7175 is not set
> # CONFIG_VIDEO_ADV7343 is not set
> # CONFIG_VIDEO_ADV7393 is not set
> # CONFIG_VIDEO_ADV7511 is not set
> # CONFIG_VIDEO_AD9389B is not set
> # CONFIG_VIDEO_AK881X is not set
> # CONFIG_VIDEO_THS8200 is not set
> # end of Video encoders
> =

> #
> # Video improvement chips
> #
> # CONFIG_VIDEO_UPD64031A is not set
> # CONFIG_VIDEO_UPD64083 is not set
> # end of Video improvement chips
> =

> #
> # Audio/Video compression chips
> #
> # CONFIG_VIDEO_SAA6752HS is not set
> # end of Audio/Video compression chips
> =

> #
> # SDR tuner chips
> #
> # CONFIG_SDR_MAX2175 is not set
> # end of SDR tuner chips
> =

> #
> # Miscellaneous helper chips
> #
> # CONFIG_VIDEO_THS7303 is not set
> # CONFIG_VIDEO_M52790 is not set
> # CONFIG_VIDEO_I2C is not set
> # CONFIG_VIDEO_ST_MIPID02 is not set
> # end of Miscellaneous helper chips
> =

> #
> # Camera sensor devices
> #
> # CONFIG_VIDEO_HI556 is not set
> # CONFIG_VIDEO_HI846 is not set
> # CONFIG_VIDEO_IMX208 is not set
> # CONFIG_VIDEO_IMX214 is not set
> # CONFIG_VIDEO_IMX219 is not set
> # CONFIG_VIDEO_IMX258 is not set
> # CONFIG_VIDEO_IMX274 is not set
> # CONFIG_VIDEO_IMX290 is not set
> # CONFIG_VIDEO_IMX319 is not set
> # CONFIG_VIDEO_IMX355 is not set
> # CONFIG_VIDEO_OV02A10 is not set
> # CONFIG_VIDEO_OV2640 is not set
> # CONFIG_VIDEO_OV2659 is not set
> # CONFIG_VIDEO_OV2680 is not set
> # CONFIG_VIDEO_OV2685 is not set
> # CONFIG_VIDEO_OV2740 is not set
> # CONFIG_VIDEO_OV5647 is not set
> # CONFIG_VIDEO_OV5648 is not set
> # CONFIG_VIDEO_OV6650 is not set
> # CONFIG_VIDEO_OV5670 is not set
> # CONFIG_VIDEO_OV5675 is not set
> # CONFIG_VIDEO_OV5693 is not set
> # CONFIG_VIDEO_OV5695 is not set
> # CONFIG_VIDEO_OV7251 is not set
> # CONFIG_VIDEO_OV772X is not set
> # CONFIG_VIDEO_OV7640 is not set
> # CONFIG_VIDEO_OV7670 is not set
> # CONFIG_VIDEO_OV7740 is not set
> # CONFIG_VIDEO_OV8856 is not set
> # CONFIG_VIDEO_OV8865 is not set
> # CONFIG_VIDEO_OV9640 is not set
> # CONFIG_VIDEO_OV9650 is not set
> # CONFIG_VIDEO_OV9734 is not set
> # CONFIG_VIDEO_OV13858 is not set
> # CONFIG_VIDEO_OV13B10 is not set
> # CONFIG_VIDEO_VS6624 is not set
> # CONFIG_VIDEO_MT9M001 is not set
> # CONFIG_VIDEO_MT9M032 is not set
> # CONFIG_VIDEO_MT9M111 is not set
> # CONFIG_VIDEO_MT9P031 is not set
> # CONFIG_VIDEO_MT9T001 is not set
> # CONFIG_VIDEO_MT9T112 is not set
> # CONFIG_VIDEO_MT9V011 is not set
> # CONFIG_VIDEO_MT9V032 is not set
> # CONFIG_VIDEO_MT9V111 is not set
> # CONFIG_VIDEO_SR030PC30 is not set
> # CONFIG_VIDEO_NOON010PC30 is not set
> # CONFIG_VIDEO_M5MOLS is not set
> # CONFIG_VIDEO_RDACM20 is not set
> # CONFIG_VIDEO_RDACM21 is not set
> # CONFIG_VIDEO_RJ54N1 is not set
> # CONFIG_VIDEO_S5K6AA is not set
> # CONFIG_VIDEO_S5K6A3 is not set
> # CONFIG_VIDEO_S5K4ECGX is not set
> # CONFIG_VIDEO_S5K5BAF is not set
> # CONFIG_VIDEO_CCS is not set
> # CONFIG_VIDEO_ET8EK8 is not set
> # CONFIG_VIDEO_S5C73M3 is not set
> # end of Camera sensor devices
> =

> #
> # Lens drivers
> #
> # CONFIG_VIDEO_AD5820 is not set
> # CONFIG_VIDEO_AK7375 is not set
> # CONFIG_VIDEO_DW9714 is not set
> # CONFIG_VIDEO_DW9768 is not set
> # CONFIG_VIDEO_DW9807_VCM is not set
> # end of Lens drivers
> =

> #
> # Flash devices
> #
> # CONFIG_VIDEO_ADP1653 is not set
> # CONFIG_VIDEO_LM3560 is not set
> # CONFIG_VIDEO_LM3646 is not set
> # end of Flash devices
> =

> #
> # SPI helper chips
> #
> # CONFIG_VIDEO_GS1662 is not set
> # end of SPI helper chips
> =

> #
> # Media SPI Adapters
> #
> CONFIG_CXD2880_SPI_DRV=3Dm
> # end of Media SPI Adapters
> =

> CONFIG_MEDIA_TUNER=3Dm
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> CONFIG_MEDIA_TUNER_TDA18250=3Dm
> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> CONFIG_MEDIA_TUNER_TEA5761=3Dm
> CONFIG_MEDIA_TUNER_TEA5767=3Dm
> CONFIG_MEDIA_TUNER_MSI001=3Dm
> CONFIG_MEDIA_TUNER_MT20XX=3Dm
> CONFIG_MEDIA_TUNER_MT2060=3Dm
> CONFIG_MEDIA_TUNER_MT2063=3Dm
> CONFIG_MEDIA_TUNER_MT2266=3Dm
> CONFIG_MEDIA_TUNER_MT2131=3Dm
> CONFIG_MEDIA_TUNER_QT1010=3Dm
> CONFIG_MEDIA_TUNER_XC2028=3Dm
> CONFIG_MEDIA_TUNER_XC5000=3Dm
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> CONFIG_MEDIA_TUNER_MC44S803=3Dm
> CONFIG_MEDIA_TUNER_MAX2165=3Dm
> CONFIG_MEDIA_TUNER_TDA18218=3Dm
> CONFIG_MEDIA_TUNER_FC0011=3Dm
> CONFIG_MEDIA_TUNER_FC0012=3Dm
> CONFIG_MEDIA_TUNER_FC0013=3Dm
> CONFIG_MEDIA_TUNER_TDA18212=3Dm
> CONFIG_MEDIA_TUNER_E4000=3Dm
> CONFIG_MEDIA_TUNER_FC2580=3Dm
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> CONFIG_MEDIA_TUNER_TUA9001=3Dm
> CONFIG_MEDIA_TUNER_SI2157=3Dm
> CONFIG_MEDIA_TUNER_IT913X=3Dm
> CONFIG_MEDIA_TUNER_R820T=3Dm
> CONFIG_MEDIA_TUNER_MXL301RF=3Dm
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> # end of Customize TV tuners
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dm
> CONFIG_DVB_STB6100=3Dm
> CONFIG_DVB_STV090x=3Dm
> CONFIG_DVB_STV0910=3Dm
> CONFIG_DVB_STV6110x=3Dm
> CONFIG_DVB_STV6111=3Dm
> CONFIG_DVB_MXL5XX=3Dm
> CONFIG_DVB_M88DS3103=3Dm
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dm
> CONFIG_DVB_TDA18271C2DD=3Dm
> CONFIG_DVB_SI2165=3Dm
> CONFIG_DVB_MN88472=3Dm
> CONFIG_DVB_MN88473=3Dm
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dm
> CONFIG_DVB_CX24123=3Dm
> CONFIG_DVB_MT312=3Dm
> CONFIG_DVB_ZL10036=3Dm
> CONFIG_DVB_ZL10039=3Dm
> CONFIG_DVB_S5H1420=3Dm
> CONFIG_DVB_STV0288=3Dm
> CONFIG_DVB_STB6000=3Dm
> CONFIG_DVB_STV0299=3Dm
> CONFIG_DVB_STV6110=3Dm
> CONFIG_DVB_STV0900=3Dm
> CONFIG_DVB_TDA8083=3Dm
> CONFIG_DVB_TDA10086=3Dm
> CONFIG_DVB_TDA8261=3Dm
> CONFIG_DVB_VES1X93=3Dm
> CONFIG_DVB_TUNER_ITD1000=3Dm
> CONFIG_DVB_TUNER_CX24113=3Dm
> CONFIG_DVB_TDA826X=3Dm
> CONFIG_DVB_TUA6100=3Dm
> CONFIG_DVB_CX24116=3Dm
> CONFIG_DVB_CX24117=3Dm
> CONFIG_DVB_CX24120=3Dm
> CONFIG_DVB_SI21XX=3Dm
> CONFIG_DVB_TS2020=3Dm
> CONFIG_DVB_DS3000=3Dm
> CONFIG_DVB_MB86A16=3Dm
> CONFIG_DVB_TDA10071=3Dm
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP887X=3Dm
> CONFIG_DVB_CX22700=3Dm
> CONFIG_DVB_CX22702=3Dm
> CONFIG_DVB_S5H1432=3Dm
> CONFIG_DVB_DRXD=3Dm
> CONFIG_DVB_L64781=3Dm
> CONFIG_DVB_TDA1004X=3Dm
> CONFIG_DVB_NXT6000=3Dm
> CONFIG_DVB_MT352=3Dm
> CONFIG_DVB_ZL10353=3Dm
> CONFIG_DVB_DIB3000MB=3Dm
> CONFIG_DVB_DIB3000MC=3Dm
> CONFIG_DVB_DIB7000M=3Dm
> CONFIG_DVB_DIB7000P=3Dm
> CONFIG_DVB_DIB9000=3Dm
> CONFIG_DVB_TDA10048=3Dm
> CONFIG_DVB_AF9013=3Dm
> CONFIG_DVB_EC100=3Dm
> CONFIG_DVB_STV0367=3Dm
> CONFIG_DVB_CXD2820R=3Dm
> CONFIG_DVB_CXD2841ER=3Dm
> CONFIG_DVB_RTL2830=3Dm
> CONFIG_DVB_RTL2832=3Dm
> CONFIG_DVB_RTL2832_SDR=3Dm
> CONFIG_DVB_SI2168=3Dm
> CONFIG_DVB_ZD1301_DEMOD=3Dm
> CONFIG_DVB_CXD2880=3Dm
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dm
> CONFIG_DVB_TDA10021=3Dm
> CONFIG_DVB_TDA10023=3Dm
> CONFIG_DVB_STV0297=3Dm
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dm
> CONFIG_DVB_OR51211=3Dm
> CONFIG_DVB_OR51132=3Dm
> CONFIG_DVB_BCM3510=3Dm
> CONFIG_DVB_LGDT330X=3Dm
> CONFIG_DVB_LGDT3305=3Dm
> CONFIG_DVB_LGDT3306A=3Dm
> CONFIG_DVB_LG2160=3Dm
> CONFIG_DVB_S5H1409=3Dm
> CONFIG_DVB_AU8522=3Dm
> CONFIG_DVB_AU8522_DTV=3Dm
> CONFIG_DVB_AU8522_V4L=3Dm
> CONFIG_DVB_S5H1411=3Dm
> CONFIG_DVB_MXL692=3Dm
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_S921=3Dm
> CONFIG_DVB_DIB8000=3Dm
> CONFIG_DVB_MB86A20S=3Dm
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=3Dm
> CONFIG_DVB_MN88443X=3Dm
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dm
> CONFIG_DVB_TUNER_DIB0070=3Dm
> CONFIG_DVB_TUNER_DIB0090=3Dm
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dm
> CONFIG_DVB_LNBH25=3Dm
> CONFIG_DVB_LNBH29=3Dm
> CONFIG_DVB_LNBP21=3Dm
> CONFIG_DVB_LNBP22=3Dm
> CONFIG_DVB_ISL6405=3Dm
> CONFIG_DVB_ISL6421=3Dm
> CONFIG_DVB_ISL6423=3Dm
> CONFIG_DVB_A8293=3Dm
> CONFIG_DVB_LGS8GL5=3Dm
> CONFIG_DVB_LGS8GXX=3Dm
> CONFIG_DVB_ATBM8830=3Dm
> CONFIG_DVB_TDA665x=3Dm
> CONFIG_DVB_IX2505V=3Dm
> CONFIG_DVB_M88RS2000=3Dm
> CONFIG_DVB_AF9033=3Dm
> CONFIG_DVB_HORUS3A=3Dm
> CONFIG_DVB_ASCOT2E=3Dm
> CONFIG_DVB_HELENE=3Dm
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=3Dm
> CONFIG_DVB_SP2=3Dm
> # end of Customise DVB Frontends
> =

> #
> # Tools to develop new frontends
> #
> # CONFIG_DVB_DUMMY_FE is not set
> # end of Media ancillary drivers
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_INTEL_GTT=3Dm
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D64
> CONFIG_VGA_SWITCHEROO=3Dy
> CONFIG_DRM=3Dm
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> # CONFIG_DRM_DEBUG_SELFTEST is not set
> CONFIG_DRM_KMS_HELPER=3Dm
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_DRM_FBDEV_OVERALLOC=3D100
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_TTM=3Dm
> CONFIG_DRM_VRAM_HELPER=3Dm
> CONFIG_DRM_TTM_HELPER=3Dm
> CONFIG_DRM_GEM_SHMEM_HELPER=3Dm
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dm
> CONFIG_DRM_I2C_SIL164=3Dm
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I915=3Dm
> CONFIG_DRM_I915_FORCE_PROBE=3D""
> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> CONFIG_DRM_I915_USERPTR=3Dy
> CONFIG_DRM_I915_GVT=3Dy
> # CONFIG_DRM_I915_GVT_KVMGT is not set
> CONFIG_DRM_I915_REQUEST_TIMEOUT=3D20000
> CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> # CONFIG_DRM_VGEM is not set
> # CONFIG_DRM_VKMS is not set
> # CONFIG_DRM_VMWGFX is not set
> CONFIG_DRM_GMA500=3Dm
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dm
> CONFIG_DRM_MGAG200=3Dm
> CONFIG_DRM_QXL=3Dm
> CONFIG_DRM_VIRTIO_GPU=3Dm
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> # CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> # end of Display Interface Bridges
> =

> # CONFIG_DRM_ETNAVIV is not set
> CONFIG_DRM_BOCHS=3Dm
> CONFIG_DRM_CIRRUS_QEMU=3Dm
> # CONFIG_DRM_GM12U320 is not set
> # CONFIG_DRM_SIMPLEDRM is not set
> # CONFIG_TINYDRM_HX8357D is not set
> # CONFIG_TINYDRM_ILI9163 is not set
> # CONFIG_TINYDRM_ILI9225 is not set
> # CONFIG_TINYDRM_ILI9341 is not set
> # CONFIG_TINYDRM_ILI9486 is not set
> # CONFIG_TINYDRM_MI0283QT is not set
> # CONFIG_TINYDRM_REPAPER is not set
> # CONFIG_TINYDRM_ST7586 is not set
> # CONFIG_TINYDRM_ST7735R is not set
> # CONFIG_DRM_VBOXVIDEO is not set
> # CONFIG_DRM_GUD is not set
> # CONFIG_DRM_HYPERV is not set
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> CONFIG_DRM_NOMODESET=3Dy
> CONFIG_DRM_PRIVACY_SCREEN=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dm
> CONFIG_FB_SYS_COPYAREA=3Dm
> CONFIG_FB_SYS_IMAGEBLIT=3Dm
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dm
> CONFIG_FB_DEFERRED_IO=3Dy
> # CONFIG_FB_MODE_HELPERS is not set
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_UVESA is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_EFI=3Dy
> # CONFIG_FB_N411 is not set
> # CONFIG_FB_HGA is not set
> # CONFIG_FB_OPENCORES is not set
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_HYPERV=3Dm
> # CONFIG_FB_SIMPLE is not set
> # CONFIG_FB_SSD1307 is not set
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dm
> # CONFIG_LCD_L4F00242T03 is not set
> # CONFIG_LCD_LMS283GF05 is not set
> # CONFIG_LCD_LTV350QV is not set
> # CONFIG_LCD_ILI922X is not set
> # CONFIG_LCD_ILI9320 is not set
> # CONFIG_LCD_TDO24M is not set
> # CONFIG_LCD_VGG2432A4 is not set
> CONFIG_LCD_PLATFORM=3Dm
> # CONFIG_LCD_AMS369FG06 is not set
> # CONFIG_LCD_LMS501KF03 is not set
> # CONFIG_LCD_HX8357 is not set
> # CONFIG_LCD_OTM3225A is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_KTD253 is not set
> # CONFIG_BACKLIGHT_PWM is not set
> CONFIG_BACKLIGHT_APPLE=3Dm
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> # CONFIG_BACKLIGHT_LM3630A is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> # end of Backlight & LCD device support
> =

> CONFIG_HDMI=3Dy
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
> # end of Console display driver support
> =

> CONFIG_LOGO=3Dy
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> CONFIG_LOGO_LINUX_CLUT224=3Dy
> # end of Graphics support
> =

> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dm
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> # CONFIG_HID_ACCUTOUCH is not set
> CONFIG_HID_ACRUX=3Dm
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_APPLEIR is not set
> CONFIG_HID_ASUS=3Dm
> CONFIG_HID_AUREAL=3Dm
> CONFIG_HID_BELKIN=3Dm
> # CONFIG_HID_BETOP_FF is not set
> # CONFIG_HID_BIGBEN_FF is not set
> CONFIG_HID_CHERRY=3Dm
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_CORSAIR is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> CONFIG_HID_CMEDIA=3Dm
> # CONFIG_HID_CP2112 is not set
> # CONFIG_HID_CREATIVE_SB0540 is not set
> CONFIG_HID_CYPRESS=3Dm
> CONFIG_HID_DRAGONRISE=3Dm
> # CONFIG_DRAGONRISE_FF is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELAN is not set
> CONFIG_HID_ELECOM=3Dm
> # CONFIG_HID_ELO is not set
> CONFIG_HID_EZKEY=3Dm
> # CONFIG_HID_FT260 is not set
> CONFIG_HID_GEMBIRD=3Dm
> CONFIG_HID_GFRM=3Dm
> # CONFIG_HID_GLORIOUS is not set
> # CONFIG_HID_HOLTEK is not set
> # CONFIG_HID_VIVALDI is not set
> # CONFIG_HID_GT683R is not set
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dm
> # CONFIG_HID_UCLOGIC is not set
> CONFIG_HID_WALTOP=3Dm
> # CONFIG_HID_VIEWSONIC is not set
> # CONFIG_HID_XIAOMI is not set
> CONFIG_HID_GYRATION=3Dm
> CONFIG_HID_ICADE=3Dm
> CONFIG_HID_ITE=3Dm
> CONFIG_HID_JABRA=3Dm
> CONFIG_HID_TWINHAN=3Dm
> CONFIG_HID_KENSINGTON=3Dm
> CONFIG_HID_LCPOWER=3Dm
> CONFIG_HID_LED=3Dm
> CONFIG_HID_LENOVO=3Dm
> # CONFIG_HID_LETSKETCH is not set
> CONFIG_HID_LOGITECH=3Dm
> CONFIG_HID_LOGITECH_DJ=3Dm
> CONFIG_HID_LOGITECH_HIDPP=3Dm
> # CONFIG_LOGITECH_FF is not set
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=3Dm
> CONFIG_HID_MONTEREY=3Dm
> CONFIG_HID_MULTITOUCH=3Dm
> # CONFIG_HID_NINTENDO is not set
> CONFIG_HID_NTI=3Dm
> # CONFIG_HID_NTRIG is not set
> CONFIG_HID_ORTEK=3Dm
> CONFIG_HID_PANTHERLORD=3Dm
> # CONFIG_PANTHERLORD_FF is not set
> # CONFIG_HID_PENMOUNT is not set
> CONFIG_HID_PETALYNX=3Dm
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LCD=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PICOLCD_CIR=3Dy
> CONFIG_HID_PLANTRONICS=3Dm
> CONFIG_HID_PRIMAX=3Dm
> # CONFIG_HID_RETRODE is not set
> # CONFIG_HID_ROCCAT is not set
> CONFIG_HID_SAITEK=3Dm
> CONFIG_HID_SAMSUNG=3Dm
> # CONFIG_HID_SEMITEK is not set
> # CONFIG_HID_SONY is not set
> CONFIG_HID_SPEEDLINK=3Dm
> # CONFIG_HID_STEAM is not set
> CONFIG_HID_STEELSERIES=3Dm
> CONFIG_HID_SUNPLUS=3Dm
> CONFIG_HID_RMI=3Dm
> CONFIG_HID_GREENASIA=3Dm
> # CONFIG_GREENASIA_FF is not set
> CONFIG_HID_HYPERV_MOUSE=3Dm
> CONFIG_HID_SMARTJOYPLUS=3Dm
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dm
> CONFIG_HID_TOPSEED=3Dm
> CONFIG_HID_THINGM=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> # CONFIG_THRUSTMASTER_FF is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_U2FZERO is not set
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dm
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dm
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dm
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> CONFIG_HID_ALPS=3Dm
> # CONFIG_HID_MCP2221 is not set
> # end of Special HID drivers
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> # CONFIG_HID_PID is not set
> # CONFIG_USB_HIDDEV is not set
> # end of USB HID support
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID_ACPI is not set
> # end of I2C HID support
> =

> #
> # Intel ISH HID support
> #
> CONFIG_INTEL_ISH_HID=3Dm
> # CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
> # end of Intel ISH HID support
> =

> #
> # AMD SFH HID Support
> #
> # CONFIG_AMD_SFH_HID is not set
> # end of AMD SFH HID Support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_PCI=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=3Dy
> # CONFIG_USB_FEW_INIT_RETRIES is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_PRODUCTLIST is not set
> CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dy
> CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> CONFIG_USB_MON=3Dy
> =

> #
> # USB Host Controller Drivers
> #
> # CONFIG_USB_C67X00_HCD is not set
> CONFIG_USB_XHCI_HCD=3Dy
> # CONFIG_USB_XHCI_DBGCAP is not set
> CONFIG_USB_XHCI_PCI=3Dy
> # CONFIG_USB_XHCI_PCI_RENESAS is not set
> # CONFIG_USB_XHCI_PLATFORM is not set
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> CONFIG_USB_EHCI_PCI=3Dy
> # CONFIG_USB_EHCI_FSL is not set
> # CONFIG_USB_EHCI_HCD_PLATFORM is not set
> # CONFIG_USB_OXU210HP_HCD is not set
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_FOTG210_HCD is not set
> # CONFIG_USB_MAX3421_HCD is not set
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PCI=3Dy
> # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> CONFIG_USB_UHCI_HCD=3Dy
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_HCD_BCMA is not set
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> # CONFIG_USB_PRINTER is not set
> # CONFIG_USB_WDM is not set
> # CONFIG_USB_TMC is not set
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> CONFIG_USB_STORAGE=3Dm
> # CONFIG_USB_STORAGE_DEBUG is not set
> # CONFIG_USB_STORAGE_REALTEK is not set
> # CONFIG_USB_STORAGE_DATAFAB is not set
> # CONFIG_USB_STORAGE_FREECOM is not set
> # CONFIG_USB_STORAGE_ISD200 is not set
> # CONFIG_USB_STORAGE_USBAT is not set
> # CONFIG_USB_STORAGE_SDDR09 is not set
> # CONFIG_USB_STORAGE_SDDR55 is not set
> # CONFIG_USB_STORAGE_JUMPSHOT is not set
> # CONFIG_USB_STORAGE_ALAUDA is not set
> # CONFIG_USB_STORAGE_ONETOUCH is not set
> # CONFIG_USB_STORAGE_KARMA is not set
> # CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> # CONFIG_USB_STORAGE_ENE_UB6250 is not set
> # CONFIG_USB_UAS is not set
> =

> #
> # USB Imaging devices
> #
> # CONFIG_USB_MDC800 is not set
> # CONFIG_USB_MICROTEK is not set
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_CDNS_SUPPORT is not set
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> # CONFIG_USB_DWC2 is not set
> # CONFIG_USB_CHIPIDEA is not set
> # CONFIG_USB_ISP1760 is not set
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> CONFIG_USB_SERIAL=3Dm
> CONFIG_USB_SERIAL_GENERIC=3Dy
> # CONFIG_USB_SERIAL_SIMPLE is not set
> # CONFIG_USB_SERIAL_AIRCABLE is not set
> # CONFIG_USB_SERIAL_ARK3116 is not set
> # CONFIG_USB_SERIAL_BELKIN is not set
> # CONFIG_USB_SERIAL_CH341 is not set
> # CONFIG_USB_SERIAL_WHITEHEAT is not set
> # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> # CONFIG_USB_SERIAL_CP210X is not set
> # CONFIG_USB_SERIAL_CYPRESS_M8 is not set
> # CONFIG_USB_SERIAL_EMPEG is not set
> # CONFIG_USB_SERIAL_FTDI_SIO is not set
> # CONFIG_USB_SERIAL_VISOR is not set
> # CONFIG_USB_SERIAL_IPAQ is not set
> # CONFIG_USB_SERIAL_IR is not set
> # CONFIG_USB_SERIAL_EDGEPORT is not set
> # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> # CONFIG_USB_SERIAL_F81232 is not set
> # CONFIG_USB_SERIAL_F8153X is not set
> # CONFIG_USB_SERIAL_GARMIN is not set
> # CONFIG_USB_SERIAL_IPW is not set
> # CONFIG_USB_SERIAL_IUU is not set
> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> # CONFIG_USB_SERIAL_KEYSPAN is not set
> # CONFIG_USB_SERIAL_KLSI is not set
> # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> # CONFIG_USB_SERIAL_MCT_U232 is not set
> # CONFIG_USB_SERIAL_METRO is not set
> # CONFIG_USB_SERIAL_MOS7720 is not set
> # CONFIG_USB_SERIAL_MOS7840 is not set
> # CONFIG_USB_SERIAL_MXUPORT is not set
> # CONFIG_USB_SERIAL_NAVMAN is not set
> # CONFIG_USB_SERIAL_PL2303 is not set
> # CONFIG_USB_SERIAL_OTI6858 is not set
> # CONFIG_USB_SERIAL_QCAUX is not set
> # CONFIG_USB_SERIAL_QUALCOMM is not set
> # CONFIG_USB_SERIAL_SPCP8X5 is not set
> # CONFIG_USB_SERIAL_SAFE is not set
> # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> # CONFIG_USB_SERIAL_SYMBOL is not set
> # CONFIG_USB_SERIAL_TI is not set
> # CONFIG_USB_SERIAL_CYBERJACK is not set
> # CONFIG_USB_SERIAL_OPTION is not set
> # CONFIG_USB_SERIAL_OMNINET is not set
> # CONFIG_USB_SERIAL_OPTICON is not set
> # CONFIG_USB_SERIAL_XSENS_MT is not set
> # CONFIG_USB_SERIAL_WISHBONE is not set
> # CONFIG_USB_SERIAL_SSU100 is not set
> # CONFIG_USB_SERIAL_QT2 is not set
> # CONFIG_USB_SERIAL_UPD78F0730 is not set
> # CONFIG_USB_SERIAL_XR is not set
> CONFIG_USB_SERIAL_DEBUG=3Dm
> =

> #
> # USB Miscellaneous drivers
> #
> # CONFIG_USB_EMI62 is not set
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> # CONFIG_USB_LEGOTOWER is not set
> # CONFIG_USB_LCD is not set
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> # CONFIG_USB_CYTHERM is not set
> # CONFIG_USB_IDMOUSE is not set
> # CONFIG_USB_FTDI_ELAN is not set
> # CONFIG_USB_APPLEDISPLAY is not set
> # CONFIG_APPLE_MFI_FASTCHARGE is not set
> # CONFIG_USB_SISUSBVGA is not set
> # CONFIG_USB_LD is not set
> # CONFIG_USB_TRANCEVIBRATOR is not set
> # CONFIG_USB_IOWARRIOR is not set
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> # CONFIG_USB_EZUSB_FX2 is not set
> # CONFIG_USB_HUB_USB251XB is not set
> # CONFIG_USB_HSIC_USB3503 is not set
> # CONFIG_USB_HSIC_USB4604 is not set
> # CONFIG_USB_LINK_LAYER_TEST is not set
> # CONFIG_USB_CHAOSKEY is not set
> # CONFIG_USB_ATM is not set
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_ISP1301 is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=3Dy
> # CONFIG_TYPEC_TCPM is not set
> CONFIG_TYPEC_UCSI=3Dy
> # CONFIG_UCSI_CCG is not set
> CONFIG_UCSI_ACPI=3Dy
> # CONFIG_TYPEC_TPS6598X is not set
> # CONFIG_TYPEC_STUSB160X is not set
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> # CONFIG_TYPEC_DP_ALTMODE is not set
> # end of USB Type-C Alternate Mode drivers
> =

> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=3Dm
> CONFIG_MMC_BLOCK=3Dm
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_SDIO_UART=3Dm
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dm
> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dm
> CONFIG_MMC_RICOH_MMC=3Dy
> CONFIG_MMC_SDHCI_ACPI=3Dm
> CONFIG_MMC_SDHCI_PLTFM=3Dm
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> # CONFIG_MMC_WBSD is not set
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_SPI is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> # CONFIG_MMC_VUB300 is not set
> # CONFIG_MMC_USHC is not set
> # CONFIG_MMC_USDHI6ROL0 is not set
> # CONFIG_MMC_REALTEK_PCI is not set
> CONFIG_MMC_CQHCI=3Dm
> # CONFIG_MMC_HSQ is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> # CONFIG_MMC_MTK is not set
> # CONFIG_MMC_SDHCI_XENON is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_APU is not set
> CONFIG_LEDS_LM3530=3Dm
> # CONFIG_LEDS_LM3532 is not set
> # CONFIG_LEDS_LM3642 is not set
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dm
> # CONFIG_LEDS_LP3952 is not set
> # CONFIG_LEDS_LP50XX is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dm
> # CONFIG_LEDS_PCA955X is not set
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_DAC124S085 is not set
> # CONFIG_LEDS_PWM is not set
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_INTEL_SS4200=3Dm
> CONFIG_LEDS_LT3593=3Dm
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> # CONFIG_LEDS_LM355x is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dm
> CONFIG_LEDS_MLXCPLD=3Dm
> # CONFIG_LEDS_MLXREG is not set
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> =

> #
> # Flash and Torch LED drivers
> #
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dm
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> # CONFIG_LEDS_TRIGGER_DISK is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dm
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> # CONFIG_LEDS_TRIGGER_NETDEV is not set
> # CONFIG_LEDS_TRIGGER_PATTERN is not set
> CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> # CONFIG_LEDS_TRIGGER_TTY is not set
> =

> #
> # Simple LED drivers
> #
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_DECODE_MCE=3Dm
> CONFIG_EDAC_GHES=3Dy
> CONFIG_EDAC_AMD64=3Dm
> CONFIG_EDAC_E752X=3Dm
> CONFIG_EDAC_I82975X=3Dm
> CONFIG_EDAC_I3000=3Dm
> CONFIG_EDAC_I3200=3Dm
> CONFIG_EDAC_IE31200=3Dm
> CONFIG_EDAC_X38=3Dm
> CONFIG_EDAC_I5400=3Dm
> CONFIG_EDAC_I7CORE=3Dm
> CONFIG_EDAC_I5000=3Dm
> CONFIG_EDAC_I5100=3Dm
> CONFIG_EDAC_I7300=3Dm
> CONFIG_EDAC_SBRIDGE=3Dm
> CONFIG_EDAC_SKX=3Dm
> # CONFIG_EDAC_I10NM is not set
> CONFIG_EDAC_PND2=3Dm
> # CONFIG_EDAC_IGEN6 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_NVMEM=3Dy
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> # CONFIG_RTC_DRV_ABX80X is not set
> CONFIG_RTC_DRV_DS1307=3Dm
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> CONFIG_RTC_DRV_DS1374=3Dm
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=3Dm
> CONFIG_RTC_DRV_MAX6900=3Dm
> CONFIG_RTC_DRV_RS5C372=3Dm
> CONFIG_RTC_DRV_ISL1208=3Dm
> CONFIG_RTC_DRV_ISL12022=3Dm
> CONFIG_RTC_DRV_X1205=3Dm
> CONFIG_RTC_DRV_PCF8523=3Dm
> # CONFIG_RTC_DRV_PCF85063 is not set
> # CONFIG_RTC_DRV_PCF85363 is not set
> CONFIG_RTC_DRV_PCF8563=3Dm
> CONFIG_RTC_DRV_PCF8583=3Dm
> CONFIG_RTC_DRV_M41T80=3Dm
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> CONFIG_RTC_DRV_BQ32K=3Dm
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=3Dm
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dm
> CONFIG_RTC_DRV_RX8025=3Dm
> CONFIG_RTC_DRV_EM3027=3Dm
> # CONFIG_RTC_DRV_RV3028 is not set
> # CONFIG_RTC_DRV_RV3032 is not set
> # CONFIG_RTC_DRV_RV8803 is not set
> # CONFIG_RTC_DRV_SD3078 is not set
> =

> #
> # SPI RTC drivers
> #
> # CONFIG_RTC_DRV_M41T93 is not set
> # CONFIG_RTC_DRV_M41T94 is not set
> # CONFIG_RTC_DRV_DS1302 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> # CONFIG_RTC_DRV_DS1343 is not set
> # CONFIG_RTC_DRV_DS1347 is not set
> # CONFIG_RTC_DRV_DS1390 is not set
> # CONFIG_RTC_DRV_MAX6916 is not set
> # CONFIG_RTC_DRV_R9701 is not set
> CONFIG_RTC_DRV_RX4581=3Dm
> # CONFIG_RTC_DRV_RS5C348 is not set
> # CONFIG_RTC_DRV_MAX6902 is not set
> # CONFIG_RTC_DRV_PCF2123 is not set
> # CONFIG_RTC_DRV_MCP795 is not set
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dm
> CONFIG_RTC_DRV_DS3232_HWMON=3Dy
> # CONFIG_RTC_DRV_PCF2127 is not set
> CONFIG_RTC_DRV_RV3029C2=3Dm
> # CONFIG_RTC_DRV_RV3029_HWMON is not set
> # CONFIG_RTC_DRV_RX6110 is not set
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dm
> CONFIG_RTC_DRV_DS1511=3Dm
> CONFIG_RTC_DRV_DS1553=3Dm
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=3Dm
> CONFIG_RTC_DRV_DS2404=3Dm
> CONFIG_RTC_DRV_STK17TA8=3Dm
> # CONFIG_RTC_DRV_M48T86 is not set
> CONFIG_RTC_DRV_M48T35=3Dm
> CONFIG_RTC_DRV_M48T59=3Dm
> CONFIG_RTC_DRV_MSM6242=3Dm
> CONFIG_RTC_DRV_BQ4802=3Dm
> CONFIG_RTC_DRV_RP5C01=3Dm
> CONFIG_RTC_DRV_V3020=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_FTRTC010 is not set
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_RTC_DRV_GOLDFISH is not set
> CONFIG_DMADEVICES=3Dy
> # CONFIG_DMADEVICES_DEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> # CONFIG_ALTERA_MSGDMA is not set
> CONFIG_INTEL_IDMA64=3Dm
> # CONFIG_INTEL_IDXD is not set
> # CONFIG_INTEL_IDXD_COMPAT is not set
> CONFIG_INTEL_IOATDMA=3Dm
> # CONFIG_PLX_DMA is not set
> # CONFIG_AMD_PTDMA is not set
> # CONFIG_QCOM_HIDMA_MGMT is not set
> # CONFIG_QCOM_HIDMA is not set
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dm
> CONFIG_DW_DMAC_PCI=3Dy
> # CONFIG_DW_EDMA is not set
> # CONFIG_DW_EDMA_PCIE is not set
> CONFIG_HSU_DMA=3Dy
> # CONFIG_SF_PDMA is not set
> # CONFIG_INTEL_LDMA is not set
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> CONFIG_DMATEST=3Dm
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_SW_SYNC is not set
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # CONFIG_DMABUF_SYSFS_STATS is not set
> # end of DMABUF options
> =

> CONFIG_DCA=3Dm
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_PANEL is not set
> CONFIG_UIO=3Dm
> CONFIG_UIO_CIF=3Dm
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> # CONFIG_UIO_DMEM_GENIRQ is not set
> CONFIG_UIO_AEC=3Dm
> CONFIG_UIO_SERCOS3=3Dm
> CONFIG_UIO_PCI_GENERIC=3Dm
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> CONFIG_UIO_HV_GENERIC=3Dm
> CONFIG_VFIO=3Dm
> CONFIG_VFIO_IOMMU_TYPE1=3Dm
> CONFIG_VFIO_VIRQFD=3Dm
> CONFIG_VFIO_NOIOMMU=3Dy
> CONFIG_VFIO_PCI_CORE=3Dm
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> CONFIG_VFIO_PCI=3Dm
> # CONFIG_VFIO_PCI_VGA is not set
> # CONFIG_VFIO_PCI_IGD is not set
> CONFIG_VFIO_MDEV=3Dm
> CONFIG_IRQ_BYPASS_MANAGER=3Dm
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_PCI_LIB=3Dy
> CONFIG_VIRTIO_PCI_LIB_LEGACY=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> # CONFIG_VIRTIO_PMEM is not set
> CONFIG_VIRTIO_BALLOON=3Dm
> CONFIG_VIRTIO_MEM=3Dm
> CONFIG_VIRTIO_INPUT=3Dm
> # CONFIG_VIRTIO_MMIO is not set
> CONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dm
> # CONFIG_VDPA is not set
> CONFIG_VHOST_IOTLB=3Dm
> CONFIG_VHOST=3Dm
> CONFIG_VHOST_MENU=3Dy
> CONFIG_VHOST_NET=3Dm
> # CONFIG_VHOST_SCSI is not set
> CONFIG_VHOST_VSOCK=3Dm
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_HYPERV=3Dm
> CONFIG_HYPERV_TIMER=3Dy
> CONFIG_HYPERV_UTILS=3Dm
> CONFIG_HYPERV_BALLOON=3Dm
> # end of Microsoft Hyper-V guest support
> =

> # CONFIG_GREYBUS is not set
> # CONFIG_COMEDI is not set
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACPI_WMI=3Dm
> CONFIG_WMI_BMOF=3Dm
> # CONFIG_HUAWEI_WMI is not set
> # CONFIG_UV_SYSFS is not set
> CONFIG_MXM_WMI=3Dm
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
> # CONFIG_XIAOMI_WMI is not set
> # CONFIG_GIGABYTE_WMI is not set
> # CONFIG_YOGABOOK_WMI is not set
> CONFIG_ACERHDF=3Dm
> # CONFIG_ACER_WIRELESS is not set
> CONFIG_ACER_WMI=3Dm
> # CONFIG_AMD_PMC is not set
> # CONFIG_ADV_SWBUTTON is not set
> CONFIG_APPLE_GMUX=3Dm
> CONFIG_ASUS_LAPTOP=3Dm
> # CONFIG_ASUS_WIRELESS is not set
> CONFIG_ASUS_WMI=3Dm
> CONFIG_ASUS_NB_WMI=3Dm
> # CONFIG_ASUS_TF103C_DOCK is not set
> # CONFIG_MERAKI_MX100 is not set
> CONFIG_EEEPC_LAPTOP=3Dm
> CONFIG_EEEPC_WMI=3Dm
> # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
> CONFIG_AMILO_RFKILL=3Dm
> CONFIG_FUJITSU_LAPTOP=3Dm
> CONFIG_FUJITSU_TABLET=3Dm
> # CONFIG_GPD_POCKET_FAN is not set
> CONFIG_HP_ACCEL=3Dm
> # CONFIG_WIRELESS_HOTKEY is not set
> CONFIG_HP_WMI=3Dm
> # CONFIG_IBM_RTL is not set
> CONFIG_IDEAPAD_LAPTOP=3Dm
> CONFIG_SENSORS_HDAPS=3Dm
> CONFIG_THINKPAD_ACPI=3Dm
> # CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
> # CONFIG_THINKPAD_ACPI_DEBUG is not set
> # CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
> CONFIG_THINKPAD_ACPI_VIDEO=3Dy
> CONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy
> # CONFIG_THINKPAD_LMI is not set
> # CONFIG_INTEL_ATOMISP2_PM is not set
> # CONFIG_INTEL_SAR_INT1092 is not set
> CONFIG_INTEL_PMC_CORE=3Dm
> =

> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> =

> CONFIG_INTEL_WMI=3Dy
> # CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
> CONFIG_INTEL_WMI_THUNDERBOLT=3Dm
> CONFIG_INTEL_HID_EVENT=3Dm
> CONFIG_INTEL_VBTN=3Dm
> # CONFIG_INTEL_INT0002_VGPIO is not set
> CONFIG_INTEL_OAKTRAIL=3Dm
> # CONFIG_INTEL_ISHTP_ECLITE is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> CONFIG_INTEL_RST=3Dm
> # CONFIG_INTEL_SMARTCONNECT is not set
> CONFIG_INTEL_TURBO_MAX_3=3Dy
> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> # CONFIG_INTEL_VSEC is not set
> CONFIG_MSI_LAPTOP=3Dm
> CONFIG_MSI_WMI=3Dm
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_BARCO_P50_GPIO is not set
> CONFIG_SAMSUNG_LAPTOP=3Dm
> CONFIG_SAMSUNG_Q10=3Dm
> CONFIG_TOSHIBA_BT_RFKILL=3Dm
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> CONFIG_ACPI_CMPC=3Dm
> CONFIG_COMPAL_LAPTOP=3Dm
> # CONFIG_LG_LAPTOP is not set
> CONFIG_PANASONIC_LAPTOP=3Dm
> CONFIG_SONY_LAPTOP=3Dm
> CONFIG_SONYPI_COMPAT=3Dy
> # CONFIG_SYSTEM76_ACPI is not set
> CONFIG_TOPSTAR_LAPTOP=3Dm
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> CONFIG_MLX_PLATFORM=3Dm
> CONFIG_INTEL_IPS=3Dm
> # CONFIG_INTEL_SCU_PCI is not set
> # CONFIG_INTEL_SCU_PLATFORM is not set
> # CONFIG_SIEMENS_SIMATIC_IPC is not set
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_CHROME_PLATFORMS is not set
> CONFIG_MELLANOX_PLATFORM=3Dy
> CONFIG_MLXREG_HOTPLUG=3Dm
> # CONFIG_MLXREG_IO is not set
> # CONFIG_MLXREG_LC is not set
> CONFIG_SURFACE_PLATFORMS=3Dy
> # CONFIG_SURFACE3_WMI is not set
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_GPE is not set
> # CONFIG_SURFACE_HOTPLUG is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> # CONFIG_LMK04832 is not set
> # CONFIG_COMMON_CLK_MAX9485 is not set
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_LAN966X is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_XILINX_VCU is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> CONFIG_PCC=3Dy
> # CONFIG_ALTERA_MBOX is not set
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_IOASID=3Dy
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> =

> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
> CONFIG_IOMMU_DEFAULT_DMA_LAZY=3Dy
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> CONFIG_IOMMU_DMA=3Dy
> # CONFIG_AMD_IOMMU is not set
> CONFIG_DMAR_TABLE=3Dy
> CONFIG_INTEL_IOMMU=3Dy
> # CONFIG_INTEL_IOMMU_SVM is not set
> # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
> CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
> CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=3Dy
> CONFIG_IRQ_REMAP=3Dy
> CONFIG_HYPERV_IOMMU=3Dy
> # CONFIG_VIRTIO_IOMMU is not set
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
> =

> # CONFIG_SOUNDWIRE is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Enable LiteX SoC Builder specific drivers
> #
> # end of Enable LiteX SoC Builder specific drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> # CONFIG_PM_DEVFREQ is not set
> # CONFIG_EXTCON is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dm
> # CONFIG_NTB_MSI is not set
> # CONFIG_NTB_AMD is not set
> # CONFIG_NTB_IDT is not set
> # CONFIG_NTB_INTEL is not set
> # CONFIG_NTB_EPF is not set
> # CONFIG_NTB_SWITCHTEC is not set
> # CONFIG_NTB_PINGPONG is not set
> # CONFIG_NTB_TOOL is not set
> # CONFIG_NTB_PERF is not set
> # CONFIG_NTB_TRANSPORT is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_DEBUG is not set
> # CONFIG_PWM_DWC is not set
> CONFIG_PWM_LPSS=3Dm
> CONFIG_PWM_LPSS_PCI=3Dm
> CONFIG_PWM_LPSS_PLATFORM=3Dm
> # CONFIG_PWM_PCA9685 is not set
> =

> #
> # IRQ chip support
> #
> # end of IRQ chip support
> =

> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> =

> #
> # PHY Subsystem
> #
> # CONFIG_GENERIC_PHY is not set
> # CONFIG_USB_LGM_PHY is not set
> # CONFIG_PHY_CAN_TRANSCEIVER is not set
> =

> #
> # PHY drivers for Broadcom platforms
> #
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # end of PHY drivers for Broadcom platforms
> =

> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_INTEL_LGM_EMMC is not set
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL_CORE=3Dm
> CONFIG_INTEL_RAPL=3Dm
> # CONFIG_IDLE_INJECT is not set
> # CONFIG_DTPM is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> # CONFIG_RAS_CEC is not set
> # CONFIG_USB4 is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # end of Android
> =

> CONFIG_LIBNVDIMM=3Dm
> CONFIG_BLK_DEV_PMEM=3Dm
> CONFIG_ND_BLK=3Dm
> CONFIG_ND_CLAIM=3Dy
> CONFIG_ND_BTT=3Dm
> CONFIG_BTT=3Dy
> CONFIG_ND_PFN=3Dm
> CONFIG_NVDIMM_PFN=3Dy
> CONFIG_NVDIMM_DAX=3Dy
> CONFIG_NVDIMM_KEYS=3Dy
> CONFIG_DAX=3Dy
> CONFIG_DEV_DAX=3Dm
> CONFIG_DEV_DAX_PMEM=3Dm
> CONFIG_DEV_DAX_KMEM=3Dm
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> # CONFIG_NVMEM_RMEM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dm
> # CONFIG_STM_PROTO_BASIC is not set
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=3Dm
> CONFIG_STM_SOURCE_CONSOLE=3Dm
> CONFIG_STM_SOURCE_HEARTBEAT=3Dm
> CONFIG_STM_SOURCE_FTRACE=3Dm
> CONFIG_INTEL_TH=3Dm
> CONFIG_INTEL_TH_PCI=3Dm
> CONFIG_INTEL_TH_ACPI=3Dm
> CONFIG_INTEL_TH_GTH=3Dm
> CONFIG_INTEL_TH_STH=3Dm
> CONFIG_INTEL_TH_MSU=3Dm
> CONFIG_INTEL_TH_PTI=3Dm
> # CONFIG_INTEL_TH_DEBUG is not set
> # end of HW tracing support
> =

> # CONFIG_FPGA is not set
> # CONFIG_TEE is not set
> # CONFIG_UNISYS_VISORBUS is not set
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> # CONFIG_INTERCONNECT is not set
> # CONFIG_COUNTER is not set
> # CONFIG_MOST is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_IOMAP=3Dy
> CONFIG_EXT2_FS=3Dm
> # CONFIG_EXT2_FS_XATTR is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dm
> CONFIG_XFS_SUPPORT_V4=3Dy
> CONFIG_XFS_QUOTA=3Dy
> CONFIG_XFS_POSIX_ACL=3Dy
> CONFIG_XFS_RT=3Dy
> CONFIG_XFS_ONLINE_SCRUB=3Dy
> # CONFIG_XFS_ONLINE_REPAIR is not set
> CONFIG_XFS_DEBUG=3Dy
> CONFIG_XFS_ASSERT_FATAL=3Dy
> CONFIG_GFS2_FS=3Dm
> CONFIG_GFS2_FS_LOCKING_DLM=3Dy
> CONFIG_OCFS2_FS=3Dm
> CONFIG_OCFS2_FS_O2CB=3Dm
> CONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dm
> CONFIG_OCFS2_FS_STATS=3Dy
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> # CONFIG_OCFS2_DEBUG_FS is not set
> CONFIG_BTRFS_FS=3Dm
> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_BTRFS_FS_REF_VERIFY is not set
> # CONFIG_NILFS2_FS is not set
> CONFIG_F2FS_FS=3Dm
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> CONFIG_F2FS_FS_POSIX_ACL=3Dy
> # CONFIG_F2FS_FS_SECURITY is not set
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_F2FS_FAULT_INJECTION is not set
> # CONFIG_F2FS_FS_COMPRESSION is not set
> CONFIG_F2FS_IOSTAT=3Dy
> CONFIG_FS_DAX=3Dy
> CONFIG_FS_DAX_PMD=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FS_ENCRYPTION_ALGS=3Dy
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> # CONFIG_VIRTIO_FS is not set
> CONFIG_OVERLAY_FS=3Dm
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
> =

> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=3Dm
> CONFIG_NETFS_STATS=3Dy
> CONFIG_FSCACHE=3Dm
> CONFIG_FSCACHE_STATS=3Dy
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_CACHEFILES=3Dm
> # CONFIG_CACHEFILES_DEBUG is not set
> # CONFIG_CACHEFILES_ERROR_INJECTION is not set
> # end of Caches
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dm
> CONFIG_JOLIET=3Dy
> CONFIG_ZISOFS=3Dy
> CONFIG_UDF_FS=3Dm
> # end of CD-ROM/DVD Filesystems
> =

> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dm
> CONFIG_MSDOS_FS=3Dm
> CONFIG_VFAT_FS=3Dm
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> # CONFIG_EXFAT_FS is not set
> # CONFIG_NTFS_FS is not set
> # CONFIG_NTFS3_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> CONFIG_PROC_VMCORE=3Dy
> CONFIG_PROC_VMCORE_DEVICE_DUMP=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> # CONFIG_TMPFS_INODE64 is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_HUGETLB_PAGE_FREE_VMEMMAP=3Dy
> # CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON is not set
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> # CONFIG_ECRYPT_FS is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> CONFIG_CRAMFS=3Dm
> CONFIG_CRAMFS_BLOCKDEV=3Dy
> CONFIG_SQUASHFS=3Dm
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> CONFIG_SQUASHFS_XATTR=3Dy
> CONFIG_SQUASHFS_ZLIB=3Dy
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> CONFIG_SQUASHFS_XZ=3Dy
> # CONFIG_SQUASHFS_ZSTD is not set
> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> # CONFIG_VXFS_FS is not set
> # CONFIG_MINIX_FS is not set
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_QNX6FS_FS is not set
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> # CONFIG_PSTORE_842_COMPRESS is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> # CONFIG_PSTORE_FTRACE is not set
> CONFIG_PSTORE_RAM=3Dm
> # CONFIG_PSTORE_BLK is not set
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> # CONFIG_EROFS_FS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> # CONFIG_NFS_V2 is not set
> CONFIG_NFS_V3=3Dy
> CONFIG_NFS_V3_ACL=3Dy
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> CONFIG_NFS_V4_1=3Dy
> CONFIG_NFS_V4_2=3Dy
> CONFIG_PNFS_FILE_LAYOUT=3Dm
> CONFIG_PNFS_BLOCK=3Dm
> CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
> # CONFIG_NFS_V4_1_MIGRATION is not set
> CONFIG_NFS_V4_SECURITY_LABEL=3Dy
> CONFIG_ROOT_NFS=3Dy
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> CONFIG_NFS_DEBUG=3Dy
> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> # CONFIG_NFS_V4_2_READ_PLUS is not set
> CONFIG_NFSD=3Dm
> CONFIG_NFSD_V2_ACL=3Dy
> CONFIG_NFSD_V3=3Dy
> CONFIG_NFSD_V3_ACL=3Dy
> CONFIG_NFSD_V4=3Dy
> CONFIG_NFSD_PNFS=3Dy
> # CONFIG_NFSD_BLOCKLAYOUT is not set
> CONFIG_NFSD_SCSILAYOUT=3Dy
> # CONFIG_NFSD_FLEXFILELAYOUT is not set
> # CONFIG_NFSD_V4_2_INTER_SSC is not set
> CONFIG_NFSD_V4_SECURITY_LABEL=3Dy
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_ACL_SUPPORT=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_NFS_V4_2_SSC_HELPER=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dm
> CONFIG_SUNRPC_BACKCHANNEL=3Dy
> CONFIG_RPCSEC_GSS_KRB5=3Dm
> # CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
> CONFIG_SUNRPC_DEBUG=3Dy
> CONFIG_CEPH_FS=3Dm
> # CONFIG_CEPH_FSCACHE is not set
> CONFIG_CEPH_FS_POSIX_ACL=3Dy
> # CONFIG_CEPH_FS_SECURITY_LABEL is not set
> CONFIG_CIFS=3Dm
> CONFIG_CIFS_STATS2=3Dy
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> CONFIG_CIFS_UPCALL=3Dy
> CONFIG_CIFS_XATTR=3Dy
> CONFIG_CIFS_POSIX=3Dy
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> CONFIG_CIFS_DFS_UPCALL=3Dy
> # CONFIG_CIFS_SWN_UPCALL is not set
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_SMB_SERVER is not set
> CONFIG_SMBFS_COMMON=3Dm
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"utf8"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dm
> CONFIG_NLS_CODEPAGE_775=3Dm
> CONFIG_NLS_CODEPAGE_850=3Dm
> CONFIG_NLS_CODEPAGE_852=3Dm
> CONFIG_NLS_CODEPAGE_855=3Dm
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dm
> CONFIG_NLS_CODEPAGE_861=3Dm
> CONFIG_NLS_CODEPAGE_862=3Dm
> CONFIG_NLS_CODEPAGE_863=3Dm
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> CONFIG_NLS_CODEPAGE_866=3Dm
> CONFIG_NLS_CODEPAGE_869=3Dm
> CONFIG_NLS_CODEPAGE_936=3Dm
> CONFIG_NLS_CODEPAGE_950=3Dm
> CONFIG_NLS_CODEPAGE_932=3Dm
> CONFIG_NLS_CODEPAGE_949=3Dm
> CONFIG_NLS_CODEPAGE_874=3Dm
> CONFIG_NLS_ISO8859_8=3Dm
> CONFIG_NLS_CODEPAGE_1250=3Dm
> CONFIG_NLS_CODEPAGE_1251=3Dm
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dm
> CONFIG_NLS_ISO8859_2=3Dm
> CONFIG_NLS_ISO8859_3=3Dm
> CONFIG_NLS_ISO8859_4=3Dm
> CONFIG_NLS_ISO8859_5=3Dm
> CONFIG_NLS_ISO8859_6=3Dm
> CONFIG_NLS_ISO8859_7=3Dm
> CONFIG_NLS_ISO8859_9=3Dm
> CONFIG_NLS_ISO8859_13=3Dm
> CONFIG_NLS_ISO8859_14=3Dm
> CONFIG_NLS_ISO8859_15=3Dm
> CONFIG_NLS_KOI8_R=3Dm
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dm
> CONFIG_NLS_MAC_CROATIAN=3Dm
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> CONFIG_NLS_MAC_ICELAND=3Dm
> CONFIG_NLS_MAC_INUIT=3Dm
> CONFIG_NLS_MAC_ROMANIAN=3Dm
> CONFIG_NLS_MAC_TURKISH=3Dm
> CONFIG_NLS_UTF8=3Dm
> CONFIG_DLM=3Dm
> CONFIG_DLM_DEBUG=3Dy
> # CONFIG_UNICODE is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITY_WRITABLE_HOOKS=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> CONFIG_PAGE_TABLE_ISOLATION=3Dy
> CONFIG_SECURITY_NETWORK_XFRM=3Dy
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_INTEL_TXT=3Dy
> CONFIG_LSM_MMAP_MIN_ADDR=3D65535
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_SECURITY_SELINUX=3Dy
> CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
> CONFIG_SECURITY_SELINUX_DISABLE=3Dy
> CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
> CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
> CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
> CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D9
> CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_HASH=3Dy
> CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
> # CONFIG_SECURITY_APPARMOR_DEBUG is not set
> # CONFIG_SECURITY_LOADPIN is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_SECURITY_LANDLOCK is not set
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
> # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
> CONFIG_INTEGRITY_AUDIT=3Dy
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> CONFIG_IMA_LSM_RULES=3Dy
> # CONFIG_IMA_TEMPLATE is not set
> CONFIG_IMA_NG_TEMPLATE=3Dy
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> # CONFIG_IMA_WRITE_POLICY is not set
> # CONFIG_IMA_READ_POLICY is not set
> CONFIG_IMA_APPRAISE=3Dy
> # CONFIG_IMA_ARCH_POLICY is not set
> # CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
> CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
> # CONFIG_IMA_APPRAISE_MODSIG is not set
> CONFIG_IMA_TRUSTED_KEYRING=3Dy
> # CONFIG_IMA_BLACKLIST_KEYRING is not set
> # CONFIG_IMA_LOAD_X509 is not set
> CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
> CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=3Dy
> # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> # CONFIG_IMA_DISABLE_HTABLE is not set
> CONFIG_EVM=3Dy
> CONFIG_EVM_ATTR_FSUUID=3Dy
> # CONFIG_EVM_ADD_XATTRS is not set
> # CONFIG_EVM_LOAD_X509 is not set
> CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
> # CONFIG_DEFAULT_SECURITY_APPARMOR is not set
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,selinux,=
smack,tomoyo,apparmor,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dm
> CONFIG_ASYNC_CORE=3Dm
> CONFIG_ASYNC_MEMCPY=3Dm
> CONFIG_ASYNC_XOR=3Dm
> CONFIG_ASYNC_PQ=3Dm
> CONFIG_ASYNC_RAID6_RECOV=3Dm
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dm
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dm
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dm
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dm
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_SIMD=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dm
> CONFIG_CRYPTO_ECC=3Dm
> CONFIG_CRYPTO_ECDH=3Dm
> # CONFIG_CRYPTO_ECDSA is not set
> # CONFIG_CRYPTO_ECRDSA is not set
> # CONFIG_CRYPTO_SM2 is not set
> # CONFIG_CRYPTO_CURVE25519 is not set
> # CONFIG_CRYPTO_CURVE25519_X86 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dm
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dm
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dm
> CONFIG_CRYPTO_OFB=3Dm
> CONFIG_CRYPTO_PCBC=3Dm
> CONFIG_CRYPTO_XTS=3Dm
> # CONFIG_CRYPTO_KEYWRAP is not set
> # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> # CONFIG_CRYPTO_ADIANTUM is not set
> CONFIG_CRYPTO_ESSIV=3Dm
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dm
> CONFIG_CRYPTO_VMAC=3Dm
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> CONFIG_CRYPTO_CRC32=3Dm
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> CONFIG_CRYPTO_XXHASH=3Dm
> CONFIG_CRYPTO_BLAKE2B=3Dm
> # CONFIG_CRYPTO_BLAKE2S is not set
> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dm
> CONFIG_CRYPTO_POLY1305_X86_64=3Dm
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> CONFIG_CRYPTO_RMD160=3Dm
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> CONFIG_CRYPTO_SHA512_SSSE3=3Dm
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dm
> # CONFIG_CRYPTO_SM3 is not set
> # CONFIG_CRYPTO_STREEBOG is not set
> CONFIG_CRYPTO_WP512=3Dm
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> # CONFIG_CRYPTO_AES_TI is not set
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dm
> CONFIG_CRYPTO_ARC4=3Dm
> CONFIG_CRYPTO_BLOWFISH=3Dm
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA=3Dm
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
> CONFIG_CRYPTO_CAST_COMMON=3Dm
> CONFIG_CRYPTO_CAST5=3Dm
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAST6=3Dm
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
> CONFIG_CRYPTO_DES=3Dm
> # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> CONFIG_CRYPTO_FCRYPT=3Dm
> CONFIG_CRYPTO_KHAZAD=3Dm
> CONFIG_CRYPTO_CHACHA20=3Dm
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dm
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dm
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
> CONFIG_CRYPTO_SM4=3Dm
> # CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
> # CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_TEA=3Dm
> CONFIG_CRYPTO_TWOFISH=3Dm
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_842 is not set
> # CONFIG_CRYPTO_LZ4 is not set
> # CONFIG_CRYPTO_LZ4HC is not set
> # CONFIG_CRYPTO_ZSTD is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
> # CONFIG_CRYPTO_STATS is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dm
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dm
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> CONFIG_CRYPTO_DEV_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_DD=3Dm
> CONFIG_CRYPTO_DEV_SP_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_CRYPTO=3Dm
> CONFIG_CRYPTO_DEV_SP_PSP=3Dy
> # CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
> CONFIG_CRYPTO_DEV_QAT=3Dm
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
> CONFIG_CRYPTO_DEV_QAT_C62X=3Dm
> # CONFIG_CRYPTO_DEV_QAT_4XXX is not set
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm
> CONFIG_CRYPTO_DEV_NITROX=3Dm
> CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dm
> # CONFIG_CRYPTO_DEV_VIRTIO is not set
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> =

> #
> # Certificates for signature checking
> #
> CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> CONFIG_MODULE_SIG_KEY_TYPE_RSA=3Dy
> # CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> # CONFIG_SYSTEM_REVOCATION_LIST is not set
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dm
> CONFIG_RAID6_PQ_BENCHMARK=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_CORDIC=3Dm
> # CONFIG_PRIME_NUMBERS is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_LIB_ARC4=3Dm
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_CHACHA is not set
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=3Dm
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dm
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_LIB_SM4=3Dm
> # end of Crypto library routines
> =

> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dm
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC64 is not set
> # CONFIG_CRC4 is not set
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dm
> CONFIG_CRC8=3Dm
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dm
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> # CONFIG_XZ_DEC_MICROLZMA is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_TEXTSEARCH=3Dy
> CONFIG_TEXTSEARCH_KMP=3Dm
> CONFIG_TEXTSEARCH_BM=3Dm
> CONFIG_TEXTSEARCH_FSM=3Dm
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_XARRAY_MULTI=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DMA_OPS=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_SWIOTLB=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_MEMREGION=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_COPY_MC=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_SBITMAP=3Dy
> # end of Library routines
> =

> CONFIG_ASN1_ENCODER=3Dy
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_PRINTK_CALLER=3Dy
> # CONFIG_STACKTRACE_BUILD_ID is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_DYNAMIC_DEBUG_CORE=3Dy
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> CONFIG_DEBUG_INFO_DWARF4=3Dy
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN is not set
> CONFIG_HAVE_ARCH_KCSAN=3Dy
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Networking Debugging
> #
> # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> # CONFIG_NET_NS_REFCNT_TRACKER is not set
> # end of Networking Debugging
> =

> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_OWNER is not set
> # CONFIG_PAGE_TABLE_CHECK is not set
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_PAGE_REF is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> # CONFIG_KASAN is not set
> CONFIG_HAVE_ARCH_KFENCE=3Dy
> # CONFIG_KFENCE is not set
> # end of Memory Debugging
> =

> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> # CONFIG_DEBUG_TIMEKEEPING is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_RWSEMS is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PLIST is not set
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> # end of Debug kernel data structures
> =

> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> # CONFIG_RCU_SCALE_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_BUILDTIME_MCOUNT_SORT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_BOOTTIME_TRACING is not set
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_STACK_TRACER=3Dy
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> CONFIG_HWLAT_TRACER=3Dy
> # CONFIG_OSNOISE_TRACER is not set
> # CONFIG_TIMERLAT_TRACER is not set
> # CONFIG_MMIOTRACE is not set
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_BLK_DEV_IO_TRACE=3Dy
> CONFIG_KPROBE_EVENTS=3Dy
> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_DYNAMIC_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> # CONFIG_BPF_KPROBE_OVERRIDE is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_FTRACE_MCOUNT_USE_CC=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_SYNTH_EVENTS=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACE_EVENT_INJECT is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dm
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> # CONFIG_FTRACE_RECORD_RECURSION is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_FTRACE_SORT_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> # CONFIG_HIST_TRIGGERS_DEBUG is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=3Dy
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=3Dy
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> # CONFIG_IO_STRICT_DEVMEM is not set
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> # CONFIG_EFI_PGT_DUMP is not set
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_X86_DECODER_SELFTEST=3Dy
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> # CONFIG_KCOV is not set
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_DIV64 is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_TEST_REF_TRACKER is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_ASYNC_RAID6_TEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_STRING_SELFTEST is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_STRSCPY is not set
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_SCANF is not set
> # CONFIG_TEST_BITMAP is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_SIPHASH is not set
> # CONFIG_TEST_IDA is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_BITOPS is not set
> # CONFIG_TEST_VMALLOC is not set
> # CONFIG_TEST_USER_COPY is not set
> CONFIG_TEST_BPF=3Dm
> # CONFIG_TEST_BLACKHOLE_DEV is not set
> # CONFIG_FIND_BIT_BENCHMARK is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_KMOD is not set
> # CONFIG_TEST_MEMCAT_P is not set
> # CONFIG_TEST_LIVEPATCH is not set
> # CONFIG_TEST_STACKINIT is not set
> # CONFIG_TEST_MEMINIT is not set
> # CONFIG_TEST_HMM is not set
> # CONFIG_TEST_FREE_PAGES is not set
> # CONFIG_TEST_FPU is not set
> # CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
> CONFIG_ARCH_USE_MEMTEST=3Dy
> # CONFIG_MEMTEST is not set
> # CONFIG_HYPERV_TESTING is not set
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

--===============1069680561483127206==--

