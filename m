Content-Type: multipart/mixed; boundary="===============2226019353681805244=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] fe1897eaa6: aim7.jobs-per-min -60.9% regression
Date: Mon, 13 Apr 2020 18:51:24 +0800
Message-ID: <20200413105124.GA49945@shbuild999.sh.intel.com>
In-Reply-To: <20191208154145.GM32275@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2226019353681805244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 08, 2019 at 11:41:46PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -60.9% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: fe1897eaa6646f5a64a4cee0e6473ed9887d324b ("f2fs: fix to update ti=
me in lazytime mode")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: aim7
> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz wit=
h 64G memory
> with following parameters:
> =

> 	disk: 4BRD_12G
> 	md: RAID1
> 	fs: f2fs
> 	test: sync_disk_rw
> 	load: 200
> 	cpufreq_governor: performance
> 	ucode: 0x42e
> =

> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
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
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
testcase/ucode:
>   gcc-7/performance/4BRD_12G/f2fs/x86_64-rhel-7.6/200/RAID1/debian-x86_64=
-2019-11-14.cgz/lkp-ivb-2ep1/sync_disk_rw/aim7/0x42e
> =

> commit: =

>   b145b0eb20 (" ARM and x86 bugfixes of all kinds.  The most visible one =
is that migrating")
>   fe1897eaa6 ("f2fs: fix to update time in lazytime mode")
> =

> b145b0eb2031a620 fe1897eaa6646f5a64a4cee0e64 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           1:4          -25%            :4     dmesg.WARNING:at#for_ip_int=
errupt_entry/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>       1208           -60.9%     473.12        aim7.jobs-per-min

Hi Chao Yu,

Any thoughts on this? =


IIUC, this commit is a fix, and if you think it is necessary, we will
stop tracking this regresion.

Thanks,
Feng


>     992.70          +155.6%       2537        aim7.time.elapsed_time
>     992.70          +155.6%       2537        aim7.time.elapsed_time.max
>  1.078e+08           +60.0%  1.724e+08        aim7.time.file_system_outpu=
ts
>    9646301            -4.2%    9238717        aim7.time.involuntary_conte=
xt_switches
>      24107 =C2=B1  3%     +58.2%      38130 =C2=B1 17%  aim7.time.minor_p=
age_faults
>       3295          +202.3%       9963        aim7.time.system_time
>      26.75           +51.4%      40.49        aim7.time.user_time
>   5.02e+08          +210.5%  1.559e+09        aim7.time.voluntary_context=
_switches
>    9294452 =C2=B1  4%     -15.7%    7835497 =C2=B1 16%  numa-numastat.nod=
e0.local_node
>    9298417 =C2=B1  4%     -15.7%    7840991 =C2=B1 16%  numa-numastat.nod=
e0.numa_hit
>       3.66 =C2=B1  3%      +4.2        7.82 =C2=B1 18%  mpstat.cpu.all.id=
le%
>       0.01 =C2=B1 32%      -0.0        0.00 =C2=B1 31%  mpstat.cpu.all.so=
ft%
>       0.06            -0.0        0.04        mpstat.cpu.all.usr%
>       3.85 =C2=B1  3%    +105.0%       7.89 =C2=B1 17%  iostat.cpu.idle
>      89.80            -4.9%      85.36        iostat.cpu.iowait
>       6.29            +6.6%       6.70        iostat.cpu.system
>      23968           -48.4%      12356        iostat.md0.w/s
>      53780           -37.1%      33824        iostat.md0.wkB/s
>      89.00            -4.8%      84.75        vmstat.cpu.wa
>      53779           -37.1%      33833        vmstat.io.bo
>   29311046           -28.6%   20935254        vmstat.memory.free
>    1026388           +19.4%    1225080        vmstat.system.cs
>     103289            +8.5%     112038        vmstat.system.in
>      24013 =C2=B1 29%     -58.5%       9976 =C2=B1120%  numa-meminfo.node=
0.Dirty
>     119019 =C2=B1 10%     +44.6%     172139 =C2=B1 13%  numa-meminfo.node=
1.Active
>       3503 =C2=B1 56%    +464.8%      19786 =C2=B1 38%  numa-meminfo.node=
1.Active(file)
>      40477 =C2=B1 16%     -38.5%      24896 =C2=B1 47%  numa-meminfo.node=
1.Dirty
>   19966008 =C2=B1  2%     -29.5%   14084594 =C2=B1 44%  numa-meminfo.node=
1.MemFree
>   13014643 =C2=B1  4%     +45.2%   18896052 =C2=B1 32%  numa-meminfo.node=
1.MemUsed
>      12018 =C2=B1 41%    +184.8%      34228 =C2=B1 35%  numa-meminfo.node=
1.Shmem
>   2.09e+10          +127.4%  4.752e+10 =C2=B1  4%  cpuidle.C1.time
>  2.558e+08          +140.1%  6.143e+08 =C2=B1  4%  cpuidle.C1.usage
>  3.017e+09 =C2=B1 10%    +301.2%  1.211e+10 =C2=B1  9%  cpuidle.C1E.time
>   18225961 =C2=B1  9%    +430.1%   96624314 =C2=B1  6%  cpuidle.C1E.usage
>  4.627e+08 =C2=B1 14%    +147.5%  1.145e+09 =C2=B1 20%  cpuidle.C6.time
>     802166 =C2=B1 17%    +186.9%    2301023 =C2=B1 26%  cpuidle.C6.usage
>  1.799e+10          +148.9%  4.476e+10        cpuidle.POLL.time
>  2.616e+08 =C2=B1  2%    +246.4%  9.063e+08 =C2=B1  2%  cpuidle.POLL.usage
>       6017 =C2=B1 29%     -58.5%       2496 =C2=B1120%  numa-vmstat.node0=
.nr_dirty
>       5742 =C2=B1 29%     -65.0%       2011 =C2=B1120%  numa-vmstat.node0=
.nr_zone_write_pending
>     874.50 =C2=B1 56%    +465.6%       4946 =C2=B1 38%  numa-vmstat.node1=
.nr_active_file
>      10139 =C2=B1 16%     -38.6%       6224 =C2=B1 47%  numa-vmstat.node1=
.nr_dirty
>    4992144 =C2=B1  2%     -29.5%    3521200 =C2=B1 44%  numa-vmstat.node1=
.nr_free_pages
>       3003 =C2=B1 41%    +184.9%       8556 =C2=B1 35%  numa-vmstat.node1=
.nr_shmem
>     874.50 =C2=B1 56%    +465.6%       4946 =C2=B1 38%  numa-vmstat.node1=
.nr_zone_active_file
>       9775 =C2=B1 16%     -47.9%       5089 =C2=B1 47%  numa-vmstat.node1=
.nr_zone_write_pending
>  2.558e+08          +140.1%  6.143e+08 =C2=B1  4%  turbostat.C1
>      43.77            -4.8       38.98 =C2=B1  3%  turbostat.C1%
>   18225642 =C2=B1  9%    +430.2%   96624037 =C2=B1  6%  turbostat.C1E
>       6.31 =C2=B1 10%      +3.6        9.94 =C2=B1  9%  turbostat.C1E%
>     795117 =C2=B1 17%    +188.4%    2292823 =C2=B1 26%  turbostat.C6
>       0.38 =C2=B1 42%     -63.6%       0.14 =C2=B1 13%  turbostat.CPU%c6
>  1.028e+08          +176.7%  2.844e+08        turbostat.IRQ
>       0.23 =C2=B1 33%     -69.1%       0.07 =C2=B1 22%  turbostat.Pkg%pc2
>     275064           +12.3%     308846 =C2=B1  4%  meminfo.Active
>       8036 =C2=B1 21%    +261.7%      29072 =C2=B1 52%  meminfo.Active(fi=
le)
>      64400           -45.9%      34850        meminfo.Dirty
>      16481           +10.8%      18264        meminfo.Inactive(anon)
>     147067           +12.8%     165858 =C2=B1  2%  meminfo.KReclaimable
>   29120417           -28.8%   20740075        meminfo.MemAvailable
>   29335165           -28.6%   20936804        meminfo.MemFree
>   36511133           +23.0%   44909491        meminfo.Memused
>     147067           +12.8%     165858 =C2=B1  2%  meminfo.SReclaimable
>      36567 =C2=B1  6%     +37.2%      50173        meminfo.Shmem
>      51580           -60.8%      20220        meminfo.max_used_kB
>       4.27 =C2=B1  7%     -13.9%       3.67 =C2=B1  4%  perf-stat.i.MPKI
>       0.71 =C2=B1  3%      -0.0        0.67        perf-stat.i.branch-mis=
s-rate%
>      17.93            +3.5       21.41 =C2=B1  2%  perf-stat.i.cache-miss=
-rate%
>    1029337           +19.1%    1226025        perf-stat.i.context-switches
>      11421 =C2=B1  4%     +41.1%      16120 =C2=B1  6%  perf-stat.i.cpu-m=
igrations
>       0.42 =C2=B1  2%      +0.0        0.45 =C2=B1  6%  perf-stat.i.dTLB-=
load-miss-rate%
>       0.11 =C2=B1 27%      -0.0        0.08 =C2=B1  3%  perf-stat.i.dTLB-=
store-miss-rate%
>      84.04 =C2=B1  2%      -2.3       81.75 =C2=B1  2%  perf-stat.i.iTLB-=
load-miss-rate%
>    7375571            +7.3%    7917282        perf-stat.i.iTLB-load-misses
>       3.91 =C2=B1  7%      -9.2%       3.56 =C2=B1  4%  perf-stat.overall=
.MPKI
>      17.90            +4.1       21.96 =C2=B1  3%  perf-stat.overall.cach=
e-miss-rate%
>       0.41 =C2=B1  2%      +0.0        0.45 =C2=B1  6%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.10 =C2=B1 27%      -0.0        0.08 =C2=B1  3%  perf-stat.overall=
.dTLB-store-miss-rate%
>      83.99 =C2=B1  2%      -2.3       81.72 =C2=B1  2%  perf-stat.overall=
.iTLB-load-miss-rate%
>    1028292           +19.2%    1225532        perf-stat.ps.context-switch=
es
>      11410 =C2=B1  4%     +41.2%      16114 =C2=B1  6%  perf-stat.ps.cpu-=
migrations
>    7368087            +7.4%    7914119        perf-stat.ps.iTLB-load-miss=
es
>  2.558e+13 =C2=B1  2%    +157.0%  6.575e+13 =C2=B1  3%  perf-stat.total.i=
nstructions
>       9128 =C2=B1  2%     -25.3%       6821 =C2=B1  4%  slabinfo.dmaengin=
e-unmap-16.active_objs
>       9175 =C2=B1  2%     -24.4%       6938 =C2=B1  4%  slabinfo.dmaengin=
e-unmap-16.num_objs
>      28309           +12.5%      31840        slabinfo.f2fs_extent_node.a=
ctive_objs
>      28704           +13.0%      32429        slabinfo.f2fs_extent_node.n=
um_objs
>     964.00 =C2=B1  5%     -13.3%     836.00 =C2=B1  6%  slabinfo.kmem_cac=
he_node.active_objs
>       1008 =C2=B1  5%     -12.7%     880.00 =C2=B1  6%  slabinfo.kmem_cac=
he_node.num_objs
>      13017           -33.1%       8707        slabinfo.nat_entry.active_o=
bjs
>      13036           -33.2%       8707        slabinfo.nat_entry.num_objs
>     433.75 =C2=B1  9%     +32.4%     574.50 =C2=B1  2%  slabinfo.nfs_read=
_data.active_objs
>     433.75 =C2=B1  9%     +32.4%     574.50 =C2=B1  2%  slabinfo.nfs_read=
_data.num_objs
>     697.50 =C2=B1  3%     +48.6%       1036 =C2=B1 33%  slabinfo.numa_pol=
icy.active_objs
>     697.50 =C2=B1  3%     +48.6%       1036 =C2=B1 33%  slabinfo.numa_pol=
icy.num_objs
>     153098           +22.3%     187296        slabinfo.radix_tree_node.ac=
tive_objs
>       2733           +22.3%       3344        slabinfo.radix_tree_node.ac=
tive_slabs
>     153098           +22.3%     187296        slabinfo.radix_tree_node.nu=
m_objs
>       2733           +22.3%       3344        slabinfo.radix_tree_node.nu=
m_slabs
>     542.00 =C2=B1 10%     +29.5%     702.00 =C2=B1  6%  slabinfo.xfrm_sta=
te.active_objs
>     542.00 =C2=B1 10%     +29.5%     702.00 =C2=B1  6%  slabinfo.xfrm_sta=
te.num_objs
>      66757            +4.8%      69942        proc-vmstat.nr_active_anon
>       2009 =C2=B1 21%    +261.7%       7267 =C2=B1 52%  proc-vmstat.nr_ac=
tive_file
>      96.00            +3.9%      99.75        proc-vmstat.nr_anon_transpa=
rent_hugepages
>   13466177           +60.0%   21542226        proc-vmstat.nr_dirtied
>      16154           -46.0%       8719        proc-vmstat.nr_dirty
>     726643           -28.8%     517541        proc-vmstat.nr_dirty_backgr=
ound_threshold
>    1455064           -28.8%    1036348        proc-vmstat.nr_dirty_thresh=
old
>     311402            +2.4%     318957        proc-vmstat.nr_file_pages
>    7332853           -28.6%    5234441        proc-vmstat.nr_free_pages
>       4120           +10.8%       4565        proc-vmstat.nr_inactive_anon
>      13939            -1.2%      13772        proc-vmstat.nr_kernel_stack
>       2845            -1.5%       2803        proc-vmstat.nr_page_table_p=
ages
>       9142 =C2=B1  6%     +37.2%      12542        proc-vmstat.nr_shmem
>      36767           +12.8%      41463 =C2=B1  2%  proc-vmstat.nr_slab_re=
claimable
>   13387539           +60.3%   21463781        proc-vmstat.nr_written
>      66757            +4.8%      69942        proc-vmstat.nr_zone_active_=
anon
>       2009 =C2=B1 21%    +261.7%       7267 =C2=B1 52%  proc-vmstat.nr_zo=
ne_active_file
>       4120           +10.8%       4565        proc-vmstat.nr_zone_inactiv=
e_anon
>      15494           -54.2%       7089        proc-vmstat.nr_zone_write_p=
ending
>     582146 =C2=B1102%    +628.1%    4238850 =C2=B1  6%  proc-vmstat.numa_=
foreign
>      13506 =C2=B1  3%    +114.5%      28974 =C2=B1 31%  proc-vmstat.numa_=
hint_faults
>       8913 =C2=B1  6%    +148.6%      22154 =C2=B1 35%  proc-vmstat.numa_=
hint_faults_local
>     582146 =C2=B1102%    +628.1%    4238850 =C2=B1  6%  proc-vmstat.numa_=
miss
>     597885 =C2=B1 99%    +611.6%    4254585 =C2=B1  6%  proc-vmstat.numa_=
other
>    1014174 =C2=B1 20%     -46.1%     547135 =C2=B1 57%  proc-vmstat.pgall=
oc_dma32
>   16157005           +22.4%   19769138        proc-vmstat.pgalloc_normal
>    2516271          +152.8%    6360808        proc-vmstat.pgfault
>    4866589           +64.4%    8002519        proc-vmstat.pgfree
>   53553588           +60.3%   85856803        proc-vmstat.pgpgout
>       1.55 =C2=B1  4%      +0.1        1.65        perf-profile.calltrace=
.cycles-pp.__schedule.schedule.io_schedule.wait_on_page_bit.f2fs_wait_on_pa=
ge_writeback
>       1.58 =C2=B1  4%      +0.1        1.69        perf-profile.calltrace=
.cycles-pp.schedule.io_schedule.wait_on_page_bit.f2fs_wait_on_page_writebac=
k.f2fs_wait_on_node_pages_writeback
>       1.60 =C2=B1  4%      +0.1        1.71        perf-profile.calltrace=
.cycles-pp.io_schedule.wait_on_page_bit.f2fs_wait_on_page_writeback.f2fs_wa=
it_on_node_pages_writeback.f2fs_do_sync_file
>       0.75 =C2=B1  2%      +0.2        0.91 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64
>       0.70 =C2=B1  4%      -0.3        0.36 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       0.69 =C2=B1  4%      -0.3        0.35 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       0.57 =C2=B1  5%      -0.3        0.25 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__filemap_fdatawrite_range
>       0.58 =C2=B1  5%      -0.3        0.26 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.file_write_and_wait_range
>       0.57 =C2=B1  6%      -0.3        0.25 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.do_writepages
>       0.57 =C2=B1  5%      -0.3        0.25 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.f2fs_write_data_pages
>       0.64 =C2=B1  5%      -0.3        0.34 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.f2fs_write_begin
>       0.57 =C2=B1  5%      -0.2        0.32 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.f2fs_put_page
>       0.31 =C2=B1 10%      -0.2        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.blk_finish_plug
>       0.31 =C2=B1 10%      -0.2        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.blk_flush_plug_list
>       0.30 =C2=B1 11%      -0.2        0.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.raid1_unplug
>       0.26            -0.1        0.14 =C2=B1 12%  perf-profile.children.=
cycles-pp.f2fs_write_cache_pages
>       0.22 =C2=B1 20%      -0.1        0.11 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.brd_do_bvec
>       0.14 =C2=B1 12%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.submit_bio_wait
>       0.21 =C2=B1 10%      -0.1        0.11 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.submit_bio
>       0.23 =C2=B1 17%      -0.1        0.13 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       0.20 =C2=B1  3%      -0.1        0.11 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__write_data_page
>       0.14 =C2=B1 15%      -0.1        0.05 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__submit_flush_wait
>       0.17 =C2=B1 12%      -0.1        0.09 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.md_make_request
>       0.16 =C2=B1 11%      -0.1        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.md_handle_request
>       0.15 =C2=B1  9%      -0.1        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.raid1_make_request
>       0.14 =C2=B1 17%      -0.1        0.06 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.f2fs_issue_flush
>       0.14 =C2=B1  6%      -0.1        0.08 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.f2fs_do_write_data_page
>       0.10 =C2=B1 33%      -0.0        0.06 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.reschedule_interrupt
>       0.09 =C2=B1 37%      -0.0        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.scheduler_ipi
>       0.06 =C2=B1  6%      +0.0        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.up_read
>       0.10 =C2=B1  4%      +0.0        0.12 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.pick_next_task_idle
>       0.20 =C2=B1  2%      +0.0        0.23 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.get_next_timer_interrupt
>       0.16 =C2=B1  6%      +0.0        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.irq_exit
>       0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.put_prev_task_fair
>       0.27 =C2=B1  3%      +0.1        0.33 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       0.35 =C2=B1  3%      +0.1        0.42 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       1.60 =C2=B1  4%      +0.1        1.72        perf-profile.children.=
cycles-pp.io_schedule
>       0.78 =C2=B1  2%      +0.1        0.92 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.menu_select
>       0.06 =C2=B1  6%      +0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.up_read
>       0.08 =C2=B1  5%      +0.0        0.11 =C2=B1 11%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>       0.35 =C2=B1  5%      +0.0        0.39 =C2=B1  5%  perf-profile.self=
.cycles-pp.f2fs_wait_on_node_pages_writeback
>       0.35 =C2=B1  4%      +0.1        0.41 =C2=B1  3%  perf-profile.self=
.cycles-pp.menu_select
>       8096 =C2=B1 28%    +278.9%      30679 =C2=B1 20%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>     158062 =C2=B1 17%    +299.5%     631442 =C2=B1  8%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>      32629 =C2=B1 22%    +289.7%     127148 =C2=B1 13%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>      44053          +192.3%     128774        sched_debug.cfs_rq:/.exec_c=
lock.avg
>     140530 =C2=B1  9%    +377.8%     671471 =C2=B1 29%  sched_debug.cfs_r=
q:/.exec_clock.max
>      33108 =C2=B1  2%    +109.9%      69484 =C2=B1  2%  sched_debug.cfs_r=
q:/.exec_clock.min
>      20291 =C2=B1  7%    +386.1%      98642 =C2=B1 21%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>       0.25 =C2=B1 82%     -88.4%       0.03 =C2=B1131%  sched_debug.cfs_r=
q:/.load_avg.min
>       8096 =C2=B1 28%    +278.9%      30679 =C2=B1 20%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>     158062 =C2=B1 17%    +299.5%     631442 =C2=B1  8%  sched_debug.cfs_r=
q:/.max_vruntime.max
>      32629 =C2=B1 22%    +289.7%     127148 =C2=B1 13%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>     184170          +218.6%     586859 =C2=B1  2%  sched_debug.cfs_rq:/.m=
in_vruntime.avg
>     251516 =C2=B1  4%    +254.5%     891702 =C2=B1 11%  sched_debug.cfs_r=
q:/.min_vruntime.max
>     165614          +131.3%     383025 =C2=B1  2%  sched_debug.cfs_rq:/.m=
in_vruntime.min
>      15286 =C2=B1  9%   +1057.3%     176903 =C2=B1 10%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.67 =C2=B1  6%     +45.5%       0.98 =C2=B1  9%  sched_debug.cfs_r=
q:/.nr_spread_over.avg
>       0.74 =C2=B1 20%     +32.4%       0.98 =C2=B1 13%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>       3.43 =C2=B1 29%     -60.7%       1.35 =C2=B1100%  sched_debug.cfs_r=
q:/.removed.load_avg.avg
>      75.10 =C2=B1 34%     -84.1%      11.91 =C2=B1100%  sched_debug.cfs_r=
q:/.removed.load_avg.max
>      15.24 =C2=B1 23%     -75.5%       3.74 =C2=B1100%  sched_debug.cfs_r=
q:/.removed.load_avg.stddev
>     157.58 =C2=B1 29%     -60.5%      62.19 =C2=B1100%  sched_debug.cfs_r=
q:/.removed.runnable_sum.avg
>       3459 =C2=B1 34%     -84.0%     552.75 =C2=B1 99%  sched_debug.cfs_r=
q:/.removed.runnable_sum.max
>     700.79 =C2=B1 23%     -75.4%     172.66 =C2=B1100%  sched_debug.cfs_r=
q:/.removed.runnable_sum.stddev
>      34.81 =C2=B1 42%     -87.0%       4.53 =C2=B1100%  sched_debug.cfs_r=
q:/.removed.util_avg.max
>       5.89 =C2=B1 31%     -79.0%       1.23 =C2=B1100%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>      59642 =C2=B1 58%    +506.4%     361657 =C2=B1 61%  sched_debug.cfs_r=
q:/.spread0.max
>      15286 =C2=B1  9%   +1057.2%     176904 =C2=B1 10%  sched_debug.cfs_r=
q:/.spread0.stddev
>      15.81 =C2=B1 15%     +28.7%      20.34 =C2=B1  2%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     553.04 =C2=B1 15%     +42.8%     789.60 =C2=B1  2%  sched_debug.cfs_r=
q:/.util_est_enqueued.max
>      83.37 =C2=B1 15%     +37.7%     114.78 =C2=B1  2%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>     130721           -17.9%     107295        sched_debug.cpu.avg_idle.avg
>      32650 =C2=B1  7%     -16.9%      27145 =C2=B1  6%  sched_debug.cpu.a=
vg_idle.min
>     509212          +151.7%    1281639        sched_debug.cpu.clock.avg
>     509215          +151.7%    1281642        sched_debug.cpu.clock.max
>     509209          +151.7%    1281636        sched_debug.cpu.clock.min
>     509212          +151.7%    1281639        sched_debug.cpu.clock_task.=
avg
>     509215          +151.7%    1281642        sched_debug.cpu.clock_task.=
max
>     509209          +151.7%    1281636        sched_debug.cpu.clock_task.=
min
>     480.69 =C2=B1  2%     +89.2%     909.42 =C2=B1  3%  sched_debug.cpu.c=
urr->pid.avg
>      14037          +135.4%      33040        sched_debug.cpu.curr->pid.m=
ax
>       2146 =C2=B1  2%    +125.6%       4843        sched_debug.cpu.curr->=
pid.stddev
>       0.12 =C2=B1  5%     +10.2%       0.13 =C2=B1  3%  sched_debug.cpu.n=
r_running.avg
>   10174129          +208.2%   31360192        sched_debug.cpu.nr_switches=
.avg
>   10849045          +290.1%   42321541 =C2=B1  3%  sched_debug.cpu.nr_swi=
tches.max
>     564008 =C2=B1 15%   +1719.4%   10261545 =C2=B1  8%  sched_debug.cpu.n=
r_switches.stddev
>     -87.16          +262.4%    -315.83        sched_debug.cpu.nr_uninterr=
uptible.min
>      66.84 =C2=B1 14%    +143.1%     162.48 =C2=B1 21%  sched_debug.cpu.n=
r_uninterruptible.stddev
>   10172460          +208.3%   31358619        sched_debug.cpu.sched_count=
.avg
>   10847113          +290.1%   42319816 =C2=B1  3%  sched_debug.cpu.sched_=
count.max
>     563945 =C2=B1 15%   +1719.6%   10261603 =C2=B1  8%  sched_debug.cpu.s=
ched_count.stddev
>    4957584          +211.1%   15425344        sched_debug.cpu.sched_goidl=
e.avg
>    5286410          +291.7%   20709361 =C2=B1  3%  sched_debug.cpu.sched_=
goidle.max
>     272603 =C2=B1 14%   +1717.5%    4954528 =C2=B1  7%  sched_debug.cpu.s=
ched_goidle.stddev
>    5120024          +209.4%   15841794        sched_debug.cpu.ttwu_count.=
avg
>   58965381 =C2=B1 14%    +567.2%  3.934e+08 =C2=B1 33%  sched_debug.cpu.t=
twu_count.max
>     132694 =C2=B1  2%     -41.0%      78274 =C2=B1  5%  sched_debug.cpu.t=
twu_count.min
>   11266172 =C2=B1  8%    +482.6%   65635267 =C2=B1 21%  sched_debug.cpu.t=
twu_count.stddev
>     114955           +26.1%     144930 =C2=B1  3%  sched_debug.cpu.ttwu_l=
ocal.max
>      83595 =C2=B1  4%     -53.0%      39284 =C2=B1 30%  sched_debug.cpu.t=
twu_local.min
>       5967 =C2=B1 16%    +460.9%      33468 =C2=B1  9%  sched_debug.cpu.t=
twu_local.stddev
>     509209          +151.7%    1281636        sched_debug.cpu_clk
>     506629          +152.5%    1279056        sched_debug.ktime
>     509627          +151.6%    1282053        sched_debug.sched_clk
--===============2226019353681805244==--

