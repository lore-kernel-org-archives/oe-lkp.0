Content-Type: multipart/mixed; boundary="===============4656403915504717603=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] c75e839414: aim7.jobs-per-min -9.1% regression
Date: Mon, 15 Jun 2020 11:21:32 +0800
Message-ID: <cc74fe05-da4e-ba65-a2e9-8df742627445@linux.intel.com>
In-Reply-To: <20200612061144.GM12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4656403915504717603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Josef,

    Do you have time to take a look at this? Thanks.

On 6/12/2020 2:11 PM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -9.1% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: c75e839414d3610e6487ae3145199c500d55f7f7 ("btrfs: kill the subvol=
_srcu")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: aim7
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
> =

> 	disk: 4BRD_12G
> 	md: RAID0
> 	fs: btrfs
> 	test: disk_wrt
> 	load: 1500
> 	cpufreq_governor: performance
> 	ucode: 0x500002c
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

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
testcase/ucode:
>    gcc-7/performance/4BRD_12G/btrfs/x86_64-rhel-7.6/1500/RAID0/debian-x86=
_64-20191114.cgz/lkp-csl-2ap2/disk_wrt/aim7/0x500002c
> =

> commit:
>    efc3453494 ("btrfs: make btrfs_cleanup_fs_roots use the radix tree loc=
k")
>    c75e839414 ("btrfs: kill the subvol_srcu")
> =

> efc3453494af7818 c75e839414d3610e6487ae31451
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>            3:9          -33%            :8     dmesg.WARNING:at#for_ip_sw=
apgs_restore_regs_and_return_to_usermode/0x
>           %stddev     %change         %stddev
>               \          |                \
>       29509 =C2=B1  2%      -9.1%      26837 =C2=B1  2%  aim7.jobs-per-min
>      305.28 =C2=B1  2%     +10.0%     335.72 =C2=B1  2%  aim7.time.elapse=
d_time
>      305.28 =C2=B1  2%     +10.0%     335.72 =C2=B1  2%  aim7.time.elapse=
d_time.max
>     4883135 =C2=B1 10%     +37.9%    6735464 =C2=B1  7%  aim7.time.involu=
ntary_context_switches
>       56288 =C2=B1  2%     +10.5%      62202 =C2=B1  2%  aim7.time.system=
_time
>     2344783            +6.5%    2497364 =C2=B1  2%  aim7.time.voluntary_c=
ontext_switches
>    62337721 =C2=B1  2%      +9.8%   68456490 =C2=B1  2%  turbostat.IRQ
>      431.56 =C2=B1  6%     +22.3%     527.88 =C2=B1  4%  vmstat.procs.r
>       27340 =C2=B1  2%     +11.2%      30397 =C2=B1  2%  vmstat.system.cs
>      226804 =C2=B1  6%     +21.7%     276057 =C2=B1  4%  meminfo.Active(f=
ile)
>      221309 =C2=B1  6%     +22.3%     270668 =C2=B1  4%  meminfo.Dirty
>      720.89 =C2=B1111%     +49.3%       1076 =C2=B1 73%  meminfo.Mlocked
>       14278 =C2=B1  2%      -8.3%      13094 =C2=B1  2%  meminfo.max_used=
_kB
>       57228 =C2=B1  6%     +22.7%      70195 =C2=B1  5%  numa-meminfo.nod=
e0.Active(file)
>       55433 =C2=B1  6%     +21.6%      67431 =C2=B1  4%  numa-meminfo.nod=
e0.Dirty
>       56152 =C2=B1  6%     +21.4%      68180 =C2=B1  5%  numa-meminfo.nod=
e1.Active(file)
>       55001 =C2=B1  6%     +22.5%      67397 =C2=B1  4%  numa-meminfo.nod=
e1.Dirty
>       56373 =C2=B1  6%     +21.7%      68594 =C2=B1  4%  numa-meminfo.nod=
e2.Active(file)
>       55222 =C2=B1  7%     +22.6%      67726 =C2=B1  4%  numa-meminfo.nod=
e2.Dirty
>       56671 =C2=B1  6%     +20.5%      68317 =C2=B1  3%  numa-meminfo.nod=
e3.Active(file)
>       55285 =C2=B1  6%     +21.8%      67355 =C2=B1  4%  numa-meminfo.nod=
e3.Dirty
>       56694 =C2=B1  6%     +21.7%      69019 =C2=B1  4%  proc-vmstat.nr_a=
ctive_file
>       55342 =C2=B1  6%     +22.3%      67662 =C2=B1  4%  proc-vmstat.nr_d=
irty
>      402316            +2.1%     410951        proc-vmstat.nr_file_pages
>      180.22 =C2=B1111%     +49.4%     269.25 =C2=B1 73%  proc-vmstat.nr_m=
lock
>       56694 =C2=B1  6%     +21.7%      69019 =C2=B1  4%  proc-vmstat.nr_z=
one_active_file
>       54680 =C2=B1  6%     +22.8%      67168 =C2=B1  4%  proc-vmstat.nr_z=
one_write_pending
>     3144381 =C2=B1  2%      +6.1%    3335275        proc-vmstat.pgactivate
>     1387558 =C2=B1  2%      +7.9%    1496754 =C2=B1  2%  proc-vmstat.pgfa=
ult
>      983.33 =C2=B1  4%      +5.4%       1036        proc-vmstat.unevictab=
le_pgs_culled
>       14331 =C2=B1  6%     +22.6%      17566 =C2=B1  5%  numa-vmstat.node=
0.nr_active_file
>       13884 =C2=B1  6%     +21.6%      16884 =C2=B1  4%  numa-vmstat.node=
0.nr_dirty
>       14330 =C2=B1  6%     +22.6%      17566 =C2=B1  5%  numa-vmstat.node=
0.nr_zone_active_file
>       13714 =C2=B1  6%     +22.2%      16755 =C2=B1  4%  numa-vmstat.node=
0.nr_zone_write_pending
>       14047 =C2=B1  6%     +21.3%      17043 =C2=B1  4%  numa-vmstat.node=
1.nr_active_file
>       13763 =C2=B1  6%     +22.3%      16838 =C2=B1  4%  numa-vmstat.node=
1.nr_dirty
>       14047 =C2=B1  6%     +21.3%      17043 =C2=B1  4%  numa-vmstat.node=
1.nr_zone_active_file
>       13599 =C2=B1  6%     +23.0%      16726 =C2=B1  4%  numa-vmstat.node=
1.nr_zone_write_pending
>       14074 =C2=B1  5%     +21.7%      17130 =C2=B1  4%  numa-vmstat.node=
2.nr_active_file
>       13786 =C2=B1  6%     +22.6%      16906 =C2=B1  4%  numa-vmstat.node=
2.nr_dirty
>       14074 =C2=B1  5%     +21.7%      17130 =C2=B1  4%  numa-vmstat.node=
2.nr_zone_active_file
>       13617 =C2=B1  7%     +23.3%      16789 =C2=B1  4%  numa-vmstat.node=
2.nr_zone_write_pending
>       14151 =C2=B1  6%     +20.7%      17074 =C2=B1  3%  numa-vmstat.node=
3.nr_active_file
>       13790 =C2=B1  6%     +22.1%      16832 =C2=B1  4%  numa-vmstat.node=
3.nr_dirty
>       14152 =C2=B1  6%     +20.7%      17074 =C2=B1  3%  numa-vmstat.node=
3.nr_zone_active_file
>       13627 =C2=B1  6%     +22.5%      16696 =C2=B1  4%  numa-vmstat.node=
3.nr_zone_write_pending
>      828631 =C2=B1 16%     +49.9%    1241934 =C2=B1  8%  sched_debug.cfs_=
rq:/.min_vruntime.stddev
>        1.33 =C2=B1 30%     +96.9%       2.61 =C2=B1 14%  sched_debug.cfs_=
rq:/.nr_spread_over.avg
>      831152 =C2=B1 16%     +49.7%    1244586 =C2=B1  8%  sched_debug.cfs_=
rq:/.spread0.stddev
>        1.92 =C2=B1 14%     +28.4%       2.47 =C2=B1  8%  sched_debug.cpu.=
nr_running.avg
>        5.00 =C2=B1  9%     +29.7%       6.48 =C2=B1  9%  sched_debug.cpu.=
nr_running.max
>        0.90 =C2=B1  9%     +16.0%       1.05 =C2=B1  3%  sched_debug.cpu.=
nr_running.stddev
>       21790 =C2=B1 11%     +16.7%      25440 =C2=B1  2%  sched_debug.cpu.=
nr_switches.avg
>       19761 =C2=B1 11%     +17.9%      23289 =C2=B1  2%  sched_debug.cpu.=
nr_switches.min
>       20403 =C2=B1 12%     +18.1%      24101 =C2=B1  2%  sched_debug.cpu.=
sched_count.avg
>       27825 =C2=B1 10%     +15.8%      32227 =C2=B1  4%  sched_debug.cpu.=
sched_count.max
>       18995 =C2=B1 13%     +18.3%      22463 =C2=B1  2%  sched_debug.cpu.=
sched_count.min
>        1143 =C2=B1 11%     +15.6%       1322 =C2=B1  4%  sched_debug.cpu.=
sched_count.stddev
>        1404 =C2=B1  7%     -31.0%     969.66 =C2=B1 11%  sched_debug.cpu.=
sched_goidle.avg
>        1186 =C2=B1  8%     -36.0%     759.25 =C2=B1 14%  sched_debug.cpu.=
sched_goidle.min
>       16821 =C2=B1 14%     +20.6%      20284 =C2=B1  6%  sched_debug.cpu.=
ttwu_count.max
>        2790 =C2=B1 11%     +21.7%       3395 =C2=B1  7%  sched_debug.cpu.=
ttwu_count.stddev
>      398.19 =C2=B1 16%     +28.3%     510.73 =C2=B1 10%  sched_debug.cpu.=
ttwu_local.stddev
>    43238516 =C2=B1  5%     +19.0%   51459028 =C2=B1  4%  perf-stat.i.cach=
e-misses
>    83870573 =C2=B1  4%     +13.8%   95436555 =C2=B1  4%  perf-stat.i.cach=
e-references
>       27181 =C2=B1  2%     +11.1%      30198 =C2=B1  2%  perf-stat.i.cont=
ext-switches
>        3008 =C2=B1  2%      -7.1%       2794        perf-stat.i.cpu-migra=
tions
>       12612 =C2=B1  5%     -15.6%      10641 =C2=B1  3%  perf-stat.i.cycl=
es-between-cache-misses
>     1.1e+09 =C2=B1  2%      -7.3%  1.019e+09 =C2=B1  2%  perf-stat.i.dTLB=
-stores
>    10684629 =C2=B1  2%     +10.8%   11842781 =C2=B1  2%  perf-stat.i.node=
-load-misses
>      641429 =C2=B1  2%     +24.4%     798190 =C2=B1  2%  perf-stat.i.node=
-loads
>     5915955 =C2=B1  2%      -6.3%    5543368 =C2=B1  2%  perf-stat.i.node=
-store-misses
>      380971            -6.7%     355629 =C2=B1  2%  perf-stat.i.node-stor=
es
>        1.66 =C2=B1  4%     +14.4%       1.90 =C2=B1  3%  perf-stat.overal=
l.MPKI
>       13064 =C2=B1  5%     -15.8%      10999 =C2=B1  4%  perf-stat.overal=
l.cycles-between-cache-misses
>    43484558 =C2=B1  5%     +19.2%   51837476 =C2=B1  4%  perf-stat.ps.cac=
he-misses
>    83278267 =C2=B1  4%     +14.4%   95253129 =C2=B1  3%  perf-stat.ps.cac=
he-references
>       27414 =C2=B1  2%     +11.2%      30486 =C2=B1  2%  perf-stat.ps.con=
text-switches
>        3028 =C2=B1  2%      -7.0%       2817        perf-stat.ps.cpu-migr=
ations
>   1.104e+09 =C2=B1  2%      -7.3%  1.023e+09 =C2=B1  2%  perf-stat.ps.dTL=
B-stores
>        4394            -1.8%       4315        perf-stat.ps.minor-faults
>    10766873 =C2=B1  2%     +11.0%   11947268 =C2=B1  2%  perf-stat.ps.nod=
e-load-misses
>      645940 =C2=B1  2%     +24.7%     805392 =C2=B1  2%  perf-stat.ps.nod=
e-loads
>     5965618 =C2=B1  2%      -6.2%    5595562 =C2=B1  2%  perf-stat.ps.nod=
e-store-misses
>      383092            -6.5%     358124 =C2=B1  2%  perf-stat.ps.node-sto=
res
>        4395            -1.8%       4315        perf-stat.ps.page-faults
>   1.538e+13 =C2=B1  2%     +10.0%  1.692e+13 =C2=B1  2%  perf-stat.total.=
instructions
>       27.39            -0.1       27.28        perf-profile.calltrace.cyc=
les-pp.btrfs_dirty_pages.btrfs_buffered_write.btrfs_file_write_iter.new_syn=
c_write.vfs_write
>       35.13            +0.1       35.23        perf-profile.calltrace.cyc=
les-pp.native_queued_spin_lock_slowpath._raw_spin_lock.btrfs_reserve_metada=
ta_bytes.btrfs_delalloc_reserve_metadata.btrfs_buffered_write
>       35.23            +0.1       35.34        perf-profile.calltrace.cyc=
les-pp._raw_spin_lock.btrfs_reserve_metadata_bytes.btrfs_delalloc_reserve_m=
etadata.btrfs_buffered_write.btrfs_file_write_iter
>       35.48            +0.1       35.60        perf-profile.calltrace.cyc=
les-pp.btrfs_reserve_metadata_bytes.btrfs_delalloc_reserve_metadata.btrfs_b=
uffered_write.btrfs_file_write_iter.new_sync_write
>       35.08            +0.1       35.22        perf-profile.calltrace.cyc=
les-pp._raw_spin_lock.btrfs_block_rsv_release.btrfs_inode_rsv_release.btrfs=
_buffered_write.btrfs_file_write_iter
>       34.97            +0.1       35.12        perf-profile.calltrace.cyc=
les-pp.native_queued_spin_lock_slowpath._raw_spin_lock.btrfs_block_rsv_rele=
ase.btrfs_inode_rsv_release.btrfs_buffered_write
>       35.57            +0.1       35.72        perf-profile.calltrace.cyc=
les-pp.btrfs_delalloc_reserve_metadata.btrfs_buffered_write.btrfs_file_writ=
e_iter.new_sync_write.vfs_write
>       35.10            +0.2       35.26        perf-profile.calltrace.cyc=
les-pp.btrfs_block_rsv_release.btrfs_inode_rsv_release.btrfs_buffered_write=
.btrfs_file_write_iter.new_sync_write
>       35.11            +0.2       35.27        perf-profile.calltrace.cyc=
les-pp.btrfs_inode_rsv_release.btrfs_buffered_write.btrfs_file_write_iter.n=
ew_sync_write.vfs_write
>       98.71            +0.2       98.88        perf-profile.calltrace.cyc=
les-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       98.69            +0.2       98.87        perf-profile.calltrace.cyc=
les-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       98.74            +0.2       98.91        perf-profile.calltrace.cyc=
les-pp.write
>       98.71            +0.2       98.89        perf-profile.calltrace.cyc=
les-pp.entry_SYSCALL_64_after_hwframe.write
>       98.68            +0.2       98.86        perf-profile.calltrace.cyc=
les-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wr=
ite
>       98.64            +0.2       98.82        perf-profile.calltrace.cyc=
les-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
>       98.63            +0.2       98.81        perf-profile.calltrace.cyc=
les-pp.btrfs_file_write_iter.new_sync_write.vfs_write.ksys_write.do_syscall=
_64
>       98.58            +0.2       98.77        perf-profile.calltrace.cyc=
les-pp.btrfs_buffered_write.btrfs_file_write_iter.new_sync_write.vfs_write.=
ksys_write
>       27.39            -0.1       27.28        perf-profile.children.cycl=
es-pp.btrfs_dirty_pages
>        0.56 =C2=B1  5%      -0.1        0.46 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.btrfs_get_extent
>        0.51 =C2=B1  5%      -0.1        0.41 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.btrfs_lookup_file_extent
>        0.52 =C2=B1  5%      -0.1        0.43 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.btrfs_search_slot
>        0.44 =C2=B1  6%      -0.1        0.35 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.btrfs_read_lock_root_node
>        0.43 =C2=B1  6%      -0.1        0.34 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.btrfs_tree_read_lock
>        0.19 =C2=B1 15%      -0.1        0.11 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.start_secondary
>        0.19 =C2=B1 16%      -0.1        0.10 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.cpuidle_enter
>        0.19 =C2=B1 16%      -0.1        0.10 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.cpuidle_enter_state
>        0.41 =C2=B1  7%      -0.1        0.33 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.rwsem_optimistic_spin
>        0.46 =C2=B1  7%      -0.1        0.38 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.rwsem_down_write_slowpath
>        0.19 =C2=B1 15%      -0.1        0.11 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.secondary_startup_64
>        0.19 =C2=B1 15%      -0.1        0.11 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.cpu_startup_entry
>        0.19 =C2=B1 15%      -0.1        0.11 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.do_idle
>        0.18 =C2=B1 15%      -0.1        0.10 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.intel_idle
>        0.29 =C2=B1  9%      -0.1        0.22 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.osq_lock
>        0.19 =C2=B1  6%      -0.0        0.15 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.finish_wait
>        0.39 =C2=B1  5%      -0.0        0.35 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.do_unlinkat
>        0.39 =C2=B1  6%      -0.0        0.35 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.unlink
>        0.26 =C2=B1  5%      -0.0        0.22 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.do_sys_open
>        0.26 =C2=B1  5%      -0.0        0.22 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.do_sys_openat2
>        0.26 =C2=B1  4%      -0.0        0.22 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.do_filp_open
>        0.26 =C2=B1  4%      -0.0        0.22 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.path_openat
>        0.26 =C2=B1  4%      -0.0        0.22 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.creat
>        0.00            +0.0        0.05        perf-profile.children.cycl=
es-pp.btrfs_calculate_inode_block_rsv_size
>       99.65            +0.1       99.73        perf-profile.children.cycl=
es-pp.do_syscall_64
>       99.66            +0.1       99.74        perf-profile.children.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>       35.62            +0.1       35.74        perf-profile.children.cycl=
es-pp.btrfs_reserve_metadata_bytes
>       35.57            +0.1       35.72        perf-profile.children.cycl=
es-pp.btrfs_delalloc_reserve_metadata
>       97.55            +0.2       97.72        perf-profile.children.cycl=
es-pp.native_queued_spin_lock_slowpath
>       98.74            +0.2       98.92        perf-profile.children.cycl=
es-pp.write
>       98.70            +0.2       98.88        perf-profile.children.cycl=
es-pp.ksys_write
>       98.69            +0.2       98.87        perf-profile.children.cycl=
es-pp.vfs_write
>       98.65            +0.2       98.83        perf-profile.children.cycl=
es-pp.new_sync_write
>       98.63            +0.2       98.81        perf-profile.children.cycl=
es-pp.btrfs_file_write_iter
>       98.59            +0.2       98.78        perf-profile.children.cycl=
es-pp.btrfs_buffered_write
>       97.60            +0.2       97.79        perf-profile.children.cycl=
es-pp._raw_spin_lock
>        0.18 =C2=B1 15%      -0.1        0.10 =C2=B1 24%  perf-profile.sel=
f.cycles-pp.intel_idle
>        0.28 =C2=B1  9%      -0.1        0.21 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.osq_lock
>        0.45 =C2=B1  2%      -0.0        0.41 =C2=B1  2%  perf-profile.sel=
f.cycles-pp._raw_spin_lock
>      135788 =C2=B1  2%     +13.1%     153639 =C2=B1  3%  softirqs.CPU0.RCU
>      115547 =C2=B1  3%      +8.0%     124768 =C2=B1  4%  softirqs.CPU0.TI=
MER
>      135243 =C2=B1  3%     +14.0%     154188 =C2=B1  2%  softirqs.CPU1.RCU
>      136056 =C2=B1  3%     +12.4%     152960 =C2=B1  3%  softirqs.CPU10.R=
CU
>      134253 =C2=B1  3%     +14.2%     153260 =C2=B1  3%  softirqs.CPU100.=
RCU
>      134668 =C2=B1  4%     +13.7%     153157 =C2=B1  2%  softirqs.CPU101.=
RCU
>      109995 =C2=B1  3%      +7.9%     118637 =C2=B1  3%  softirqs.CPU101.=
TIMER
>      134989 =C2=B1  4%     +13.9%     153700 =C2=B1  2%  softirqs.CPU102.=
RCU
>      109876 =C2=B1  3%      +8.9%     119608 =C2=B1  2%  softirqs.CPU102.=
TIMER
>      134868 =C2=B1  4%     +13.8%     153427 =C2=B1  3%  softirqs.CPU103.=
RCU
>      109933 =C2=B1  3%      +8.2%     118946 =C2=B1  3%  softirqs.CPU103.=
TIMER
>      134454 =C2=B1  3%     +14.0%     153285 =C2=B1  3%  softirqs.CPU104.=
RCU
>      109731 =C2=B1  2%      +8.4%     118965 =C2=B1  3%  softirqs.CPU104.=
TIMER
>      134878 =C2=B1  3%     +13.6%     153283 =C2=B1  3%  softirqs.CPU105.=
RCU
>      134096 =C2=B1  3%     +14.1%     153022 =C2=B1  3%  softirqs.CPU106.=
RCU
>      109821 =C2=B1  2%      +8.2%     118845 =C2=B1  3%  softirqs.CPU106.=
TIMER
>      133905 =C2=B1  3%     +15.0%     154004 =C2=B1  3%  softirqs.CPU107.=
RCU
>      134117 =C2=B1  3%     +14.3%     153232 =C2=B1  3%  softirqs.CPU108.=
RCU
>      109545 =C2=B1  2%      +8.8%     119182 =C2=B1  3%  softirqs.CPU108.=
TIMER
>      134574 =C2=B1  3%     +13.8%     153202 =C2=B1  3%  softirqs.CPU109.=
RCU
>      109804 =C2=B1  3%      +8.2%     118760 =C2=B1  3%  softirqs.CPU109.=
TIMER
>      135106 =C2=B1  3%     +14.8%     155124 =C2=B1  3%  softirqs.CPU11.R=
CU
>      111746 =C2=B1  4%      +7.8%     120460 =C2=B1  3%  softirqs.CPU11.T=
IMER
>      134482 =C2=B1  4%     +14.3%     153687 =C2=B1  3%  softirqs.CPU110.=
RCU
>      110314 =C2=B1  3%      +8.1%     119241 =C2=B1  3%  softirqs.CPU110.=
TIMER
>      134464 =C2=B1  3%     +14.3%     153634 =C2=B1  3%  softirqs.CPU111.=
RCU
>      110626 =C2=B1  3%      +8.3%     119815 =C2=B1  3%  softirqs.CPU111.=
TIMER
>      134895 =C2=B1  3%     +14.4%     154257 =C2=B1  3%  softirqs.CPU112.=
RCU
>      110040 =C2=B1  3%     +14.6%     126058 =C2=B1 16%  softirqs.CPU112.=
TIMER
>      134644 =C2=B1  3%     +13.6%     152993 =C2=B1  3%  softirqs.CPU113.=
RCU
>      109693 =C2=B1  3%      +8.1%     118569 =C2=B1  3%  softirqs.CPU113.=
TIMER
>      134313 =C2=B1  3%     +13.9%     152993 =C2=B1  3%  softirqs.CPU114.=
RCU
>      109711 =C2=B1  3%      +8.6%     119143 =C2=B1  3%  softirqs.CPU114.=
TIMER
>      134559 =C2=B1  3%     +13.8%     153115 =C2=B1  3%  softirqs.CPU115.=
RCU
>      110226 =C2=B1  3%      +8.2%     119221 =C2=B1  3%  softirqs.CPU115.=
TIMER
>      134087 =C2=B1  3%     +14.2%     153077 =C2=B1  3%  softirqs.CPU116.=
RCU
>      110225 =C2=B1  3%      +9.0%     120184 =C2=B1  3%  softirqs.CPU116.=
TIMER
>      134271 =C2=B1  3%     +14.1%     153220 =C2=B1  3%  softirqs.CPU117.=
RCU
>      109179 =C2=B1  2%      +8.3%     118274 =C2=B1  3%  softirqs.CPU117.=
TIMER
>      134281 =C2=B1  3%     +14.1%     153230 =C2=B1  3%  softirqs.CPU118.=
RCU
>      134415 =C2=B1  3%     +14.0%     153215 =C2=B1  3%  softirqs.CPU119.=
RCU
>      109514 =C2=B1  2%      +8.3%     118643 =C2=B1  3%  softirqs.CPU119.=
TIMER
>      135560 =C2=B1  3%     +13.5%     153874 =C2=B1  3%  softirqs.CPU12.R=
CU
>      110316 =C2=B1  2%      +8.5%     119734 =C2=B1  3%  softirqs.CPU12.T=
IMER
>      134177 =C2=B1  3%     +14.6%     153815 =C2=B1  3%  softirqs.CPU120.=
RCU
>      134367 =C2=B1  3%     +15.0%     154493 =C2=B1  3%  softirqs.CPU121.=
RCU
>      133972 =C2=B1  3%     +14.3%     153173 =C2=B1  3%  softirqs.CPU122.=
RCU
>      134801 =C2=B1  4%     +13.6%     153136 =C2=B1  3%  softirqs.CPU123.=
RCU
>      134709 =C2=B1  3%     +13.9%     153440 =C2=B1  3%  softirqs.CPU124.=
RCU
>      135185 =C2=B1  3%     +13.1%     152925 =C2=B1  3%  softirqs.CPU125.=
RCU
>      134977 =C2=B1  3%     +13.8%     153608 =C2=B1  3%  softirqs.CPU126.=
RCU
>      133862 =C2=B1  4%     +14.7%     153558 =C2=B1  3%  softirqs.CPU127.=
RCU
>      134554 =C2=B1  3%     +13.9%     153237 =C2=B1  3%  softirqs.CPU128.=
RCU
>      134254 =C2=B1  3%     +14.1%     153130 =C2=B1  3%  softirqs.CPU129.=
RCU
>      135133 =C2=B1  3%     +14.0%     154103 =C2=B1  3%  softirqs.CPU13.R=
CU
>      110389 =C2=B1  2%      +8.1%     119382 =C2=B1  3%  softirqs.CPU13.T=
IMER
>      134319 =C2=B1  3%     +13.8%     152909 =C2=B1  3%  softirqs.CPU130.=
RCU
>      133590 =C2=B1  3%     +14.5%     152925 =C2=B1  3%  softirqs.CPU131.=
RCU
>      134416 =C2=B1  4%     +14.0%     153223 =C2=B1  3%  softirqs.CPU132.=
RCU
>      133931 =C2=B1  3%     +14.5%     153359 =C2=B1  3%  softirqs.CPU133.=
RCU
>      134031 =C2=B1  3%     +14.5%     153527 =C2=B1  3%  softirqs.CPU134.=
RCU
>      133851 =C2=B1  4%     +14.3%     153052 =C2=B1  3%  softirqs.CPU135.=
RCU
>      134235 =C2=B1  4%     +13.9%     152959 =C2=B1  3%  softirqs.CPU136.=
RCU
>      134003 =C2=B1  3%     +14.2%     153037 =C2=B1  3%  softirqs.CPU137.=
RCU
>      133453 =C2=B1  3%     +14.4%     152625 =C2=B1  3%  softirqs.CPU138.=
RCU
>      133514 =C2=B1  3%     +14.8%     153289 =C2=B1  3%  softirqs.CPU139.=
RCU
>      134952 =C2=B1  3%     +13.6%     153372 =C2=B1  3%  softirqs.CPU14.R=
CU
>      134045 =C2=B1  3%     +13.7%     152361 =C2=B1  3%  softirqs.CPU140.=
RCU
>      133662 =C2=B1  3%     +14.1%     152528 =C2=B1  3%  softirqs.CPU141.=
RCU
>      133643 =C2=B1  3%     +14.7%     153283 =C2=B1  2%  softirqs.CPU142.=
RCU
>      133313 =C2=B1  3%     +15.0%     153254 =C2=B1  3%  softirqs.CPU143.=
RCU
>      133585 =C2=B1  3%     +14.4%     152837 =C2=B1  3%  softirqs.CPU144.=
RCU
>      108590 =C2=B1  3%     +12.7%     122339 =C2=B1  5%  softirqs.CPU144.=
TIMER
>      133471 =C2=B1  3%     +14.5%     152883 =C2=B1  3%  softirqs.CPU145.=
RCU
>      108095 =C2=B1  3%     +14.5%     123726 =C2=B1  6%  softirqs.CPU145.=
TIMER
>      133588 =C2=B1  3%     +15.4%     154173 =C2=B1  3%  softirqs.CPU146.=
RCU
>      108268 =C2=B1  3%     +19.8%     129684 =C2=B1 16%  softirqs.CPU146.=
TIMER
>      134060 =C2=B1  3%     +14.3%     153270 =C2=B1  3%  softirqs.CPU147.=
RCU
>      108731 =C2=B1  3%     +13.0%     122902 =C2=B1  5%  softirqs.CPU147.=
TIMER
>      133778 =C2=B1  3%     +14.1%     152681 =C2=B1  3%  softirqs.CPU148.=
RCU
>      108208 =C2=B1  3%     +12.6%     121875 =C2=B1  5%  softirqs.CPU148.=
TIMER
>      133514 =C2=B1  3%     +14.2%     152460 =C2=B1  3%  softirqs.CPU149.=
RCU
>      108054 =C2=B1  3%     +15.6%     124938 =C2=B1  9%  softirqs.CPU149.=
TIMER
>      134677 =C2=B1  3%     +14.5%     154138 =C2=B1  2%  softirqs.CPU15.R=
CU
>      133245 =C2=B1  3%     +14.4%     152373 =C2=B1  3%  softirqs.CPU150.=
RCU
>      107788 =C2=B1  3%     +13.1%     121957 =C2=B1  5%  softirqs.CPU150.=
TIMER
>      133747 =C2=B1  3%     +14.0%     152473 =C2=B1  3%  softirqs.CPU151.=
RCU
>      108258 =C2=B1  4%     +12.4%     121662 =C2=B1  5%  softirqs.CPU151.=
TIMER
>      133819 =C2=B1  3%     +14.1%     152726 =C2=B1  3%  softirqs.CPU152.=
RCU
>      108163 =C2=B1  3%     +12.7%     121940 =C2=B1  5%  softirqs.CPU152.=
TIMER
>      134057 =C2=B1  3%     +14.0%     152844 =C2=B1  3%  softirqs.CPU153.=
RCU
>      107680 =C2=B1  3%     +13.1%     121787 =C2=B1  5%  softirqs.CPU153.=
TIMER
>      133660 =C2=B1  3%     +14.2%     152675 =C2=B1  3%  softirqs.CPU154.=
RCU
>      107911 =C2=B1  3%     +15.4%     124485 =C2=B1  9%  softirqs.CPU154.=
TIMER
>      133349 =C2=B1  3%     +14.6%     152811 =C2=B1  3%  softirqs.CPU155.=
RCU
>      107513 =C2=B1  3%     +15.1%     123737 =C2=B1  6%  softirqs.CPU155.=
TIMER
>      133901 =C2=B1  3%     +14.0%     152615 =C2=B1  3%  softirqs.CPU156.=
RCU
>      107853 =C2=B1  3%     +13.0%     121904 =C2=B1  5%  softirqs.CPU156.=
TIMER
>      133621 =C2=B1  3%     +14.2%     152615 =C2=B1  3%  softirqs.CPU157.=
RCU
>      108040 =C2=B1  3%     +12.6%     121684 =C2=B1  5%  softirqs.CPU157.=
TIMER
>      133891 =C2=B1  3%     +14.2%     152862 =C2=B1  3%  softirqs.CPU158.=
RCU
>      108534 =C2=B1  3%     +12.7%     122300 =C2=B1  5%  softirqs.CPU158.=
TIMER
>      133925 =C2=B1  3%     +14.5%     153347 =C2=B1  3%  softirqs.CPU159.=
RCU
>      108099 =C2=B1  3%     +12.9%     122015 =C2=B1  5%  softirqs.CPU159.=
TIMER
>      134893 =C2=B1  3%     +14.5%     154389 =C2=B1  3%  softirqs.CPU16.R=
CU
>      134169 =C2=B1  3%     +13.9%     152812 =C2=B1  3%  softirqs.CPU160.=
RCU
>      108300 =C2=B1  3%     +12.9%     122318 =C2=B1  5%  softirqs.CPU160.=
TIMER
>      133818 =C2=B1  3%     +15.1%     154048 =C2=B1  4%  softirqs.CPU161.=
RCU
>      107919 =C2=B1  3%     +13.6%     122606 =C2=B1  6%  softirqs.CPU161.=
TIMER
>      133867 =C2=B1  3%     +14.2%     152856 =C2=B1  3%  softirqs.CPU162.=
RCU
>      107991 =C2=B1  3%     +13.2%     122209 =C2=B1  5%  softirqs.CPU162.=
TIMER
>      133579 =C2=B1  3%     +14.3%     152654 =C2=B1  3%  softirqs.CPU163.=
RCU
>      108317 =C2=B1  3%     +12.9%     122271 =C2=B1  5%  softirqs.CPU163.=
TIMER
>      133914 =C2=B1  3%     +14.4%     153158 =C2=B1  3%  softirqs.CPU164.=
RCU
>      133684 =C2=B1  3%     +14.4%     152895 =C2=B1  3%  softirqs.CPU165.=
RCU
>      107435 =C2=B1  3%     +12.5%     120877 =C2=B1  5%  softirqs.CPU165.=
TIMER
>      133983 =C2=B1  3%     +13.9%     152582 =C2=B1  3%  softirqs.CPU166.=
RCU
>      107432 =C2=B1  3%     +13.2%     121641 =C2=B1  5%  softirqs.CPU166.=
TIMER
>      133947 =C2=B1  3%     +13.6%     152137 =C2=B1  3%  softirqs.CPU167.=
RCU
>      134005 =C2=B1  3%     +14.5%     153385 =C2=B1  4%  softirqs.CPU168.=
RCU
>      115752 =C2=B1  4%     +12.0%     129634 =C2=B1  4%  softirqs.CPU168.=
TIMER
>      133557 =C2=B1  3%     +15.2%     153865 =C2=B1  4%  softirqs.CPU169.=
RCU
>      115884 =C2=B1  3%     +11.7%     129481 =C2=B1  4%  softirqs.CPU169.=
TIMER
>      135348 =C2=B1  3%     +13.8%     153977 =C2=B1  3%  softirqs.CPU17.R=
CU
>      110589 =C2=B1  3%      +7.9%     119298 =C2=B1  3%  softirqs.CPU17.T=
IMER
>      134463 =C2=B1  3%     +14.0%     153229 =C2=B1  3%  softirqs.CPU170.=
RCU
>      133740 =C2=B1  3%     +14.1%     152630 =C2=B1  3%  softirqs.CPU171.=
RCU
>      116524 =C2=B1  4%     +10.9%     129237 =C2=B1  3%  softirqs.CPU171.=
TIMER
>      133716 =C2=B1  3%     +13.8%     152196 =C2=B1  3%  softirqs.CPU172.=
RCU
>      116393 =C2=B1  4%     +10.9%     129087 =C2=B1  4%  softirqs.CPU172.=
TIMER
>      133564 =C2=B1  3%     +13.9%     152165 =C2=B1  3%  softirqs.CPU173.=
RCU
>      116237 =C2=B1  3%     +11.4%     129460 =C2=B1  3%  softirqs.CPU173.=
TIMER
>      133411 =C2=B1  3%     +14.5%     152764 =C2=B1  3%  softirqs.CPU174.=
RCU
>      116018 =C2=B1  3%     +11.2%     129006 =C2=B1  4%  softirqs.CPU174.=
TIMER
>      133147 =C2=B1  3%     +15.0%     153104 =C2=B1  2%  softirqs.CPU175.=
RCU
>      116052 =C2=B1  4%     +11.7%     129664 =C2=B1  3%  softirqs.CPU175.=
TIMER
>      133989 =C2=B1  3%     +13.8%     152504 =C2=B1  3%  softirqs.CPU176.=
RCU
>      116071 =C2=B1  4%     +10.9%     128756 =C2=B1  3%  softirqs.CPU176.=
TIMER
>      133902 =C2=B1  3%     +14.1%     152811 =C2=B1  3%  softirqs.CPU177.=
RCU
>      115994 =C2=B1  3%     +11.1%     128849 =C2=B1  4%  softirqs.CPU177.=
TIMER
>      133679 =C2=B1  3%     +14.4%     152887 =C2=B1  3%  softirqs.CPU178.=
RCU
>      115942 =C2=B1  4%     +13.4%     131439 =C2=B1  5%  softirqs.CPU178.=
TIMER
>      133985 =C2=B1  3%     +14.0%     152762 =C2=B1  3%  softirqs.CPU179.=
RCU
>      116347 =C2=B1  4%     +11.2%     129422 =C2=B1  4%  softirqs.CPU179.=
TIMER
>      134982 =C2=B1  3%     +14.0%     153838 =C2=B1  3%  softirqs.CPU18.R=
CU
>      110310 =C2=B1  3%      +8.6%     119851 =C2=B1  3%  softirqs.CPU18.T=
IMER
>      133236 =C2=B1  3%     +14.7%     152870 =C2=B1  3%  softirqs.CPU180.=
RCU
>      115901 =C2=B1  4%     +11.3%     129054 =C2=B1  4%  softirqs.CPU180.=
TIMER
>      133615 =C2=B1  3%     +14.4%     152876 =C2=B1  3%  softirqs.CPU181.=
RCU
>      115505 =C2=B1  4%     +11.3%     128560 =C2=B1  3%  softirqs.CPU181.=
TIMER
>      133171 =C2=B1  3%     +14.7%     152810 =C2=B1  3%  softirqs.CPU182.=
RCU
>      115955 =C2=B1  4%     +11.0%     128687 =C2=B1  3%  softirqs.CPU182.=
TIMER
>      133413 =C2=B1  3%     +14.4%     152671 =C2=B1  3%  softirqs.CPU183.=
RCU
>      116313 =C2=B1  4%     +11.0%     129140 =C2=B1  3%  softirqs.CPU183.=
TIMER
>      133598 =C2=B1  3%     +14.8%     153388 =C2=B1  3%  softirqs.CPU184.=
RCU
>      115462 =C2=B1  3%     +13.0%     130430 =C2=B1  6%  softirqs.CPU184.=
TIMER
>      133884 =C2=B1  3%     +13.9%     152525 =C2=B1  3%  softirqs.CPU185.=
RCU
>      115598 =C2=B1  4%     +11.1%     128397 =C2=B1  4%  softirqs.CPU185.=
TIMER
>      133262 =C2=B1  3%     +14.5%     152646 =C2=B1  3%  softirqs.CPU186.=
RCU
>      115745 =C2=B1  3%     +11.1%     128612 =C2=B1  4%  softirqs.CPU186.=
TIMER
>      133430 =C2=B1  3%     +14.5%     152767 =C2=B1  3%  softirqs.CPU187.=
RCU
>      115769 =C2=B1  4%     +11.0%     128464 =C2=B1  3%  softirqs.CPU187.=
TIMER
>      133259 =C2=B1  3%     +14.8%     153036 =C2=B1  3%  softirqs.CPU188.=
RCU
>      116108 =C2=B1  4%     +11.3%     129232 =C2=B1  3%  softirqs.CPU188.=
TIMER
>      133609 =C2=B1  3%     +14.1%     152436 =C2=B1  3%  softirqs.CPU189.=
RCU
>      115984 =C2=B1  4%     +11.0%     128710 =C2=B1  3%  softirqs.CPU189.=
TIMER
>      135090 =C2=B1  3%     +13.9%     153802 =C2=B1  3%  softirqs.CPU19.R=
CU
>      110865 =C2=B1  2%      +8.2%     119936 =C2=B1  3%  softirqs.CPU19.T=
IMER
>      133685 =C2=B1  3%     +14.2%     152631 =C2=B1  3%  softirqs.CPU190.=
RCU
>      115642 =C2=B1  3%     +11.2%     128581 =C2=B1  4%  softirqs.CPU190.=
TIMER
>      131031 =C2=B1  3%     +14.6%     150126 =C2=B1  3%  softirqs.CPU191.=
RCU
>      114275 =C2=B1  4%     +11.4%     127249 =C2=B1  4%  softirqs.CPU191.=
TIMER
>      134928 =C2=B1  3%     +14.3%     154165 =C2=B1  3%  softirqs.CPU2.RCU
>      135126 =C2=B1  3%     +14.0%     154083 =C2=B1  3%  softirqs.CPU20.R=
CU
>      111013 =C2=B1  3%      +8.6%     120549 =C2=B1  3%  softirqs.CPU20.T=
IMER
>      134663 =C2=B1  3%     +14.5%     154251 =C2=B1  3%  softirqs.CPU21.R=
CU
>      109671 =C2=B1  2%      +8.2%     118708 =C2=B1  3%  softirqs.CPU21.T=
IMER
>      135047 =C2=B1  3%     +13.9%     153766 =C2=B1  3%  softirqs.CPU22.R=
CU
>      134437 =C2=B1  3%     +14.2%     153492 =C2=B1  3%  softirqs.CPU23.R=
CU
>      109675 =C2=B1  2%      +8.3%     118824 =C2=B1  3%  softirqs.CPU23.T=
IMER
>      136114 =C2=B1  3%     +13.3%     154277 =C2=B1  3%  softirqs.CPU24.R=
CU
>      134825 =C2=B1  3%     +14.2%     154007 =C2=B1  3%  softirqs.CPU25.R=
CU
>      139234 =C2=B1  4%     +13.8%     158515 =C2=B1  3%  softirqs.CPU26.R=
CU
>      135056 =C2=B1  3%     +14.1%     154062 =C2=B1  3%  softirqs.CPU27.R=
CU
>      135307 =C2=B1  3%     +13.7%     153897 =C2=B1  3%  softirqs.CPU28.R=
CU
>      134686 =C2=B1  3%     +14.7%     154497 =C2=B1  3%  softirqs.CPU29.R=
CU
>      134688 =C2=B1  3%     +14.4%     154115 =C2=B1  2%  softirqs.CPU3.RCU
>      134642 =C2=B1  3%     +14.5%     154226 =C2=B1  3%  softirqs.CPU30.R=
CU
>      134773 =C2=B1  3%     +14.2%     153887 =C2=B1  3%  softirqs.CPU31.R=
CU
>      134523 =C2=B1  3%     +14.3%     153733 =C2=B1  3%  softirqs.CPU32.R=
CU
>      134488 =C2=B1  3%     +14.4%     153801 =C2=B1  3%  softirqs.CPU33.R=
CU
>      134483 =C2=B1  3%     +14.1%     153380 =C2=B1  3%  softirqs.CPU34.R=
CU
>      134886 =C2=B1  3%     +13.6%     153180 =C2=B1  3%  softirqs.CPU35.R=
CU
>      135021 =C2=B1  3%     +13.6%     153340 =C2=B1  3%  softirqs.CPU36.R=
CU
>      134064 =C2=B1  3%     +15.1%     154277 =C2=B1  3%  softirqs.CPU37.R=
CU
>      134166 =C2=B1  3%     +14.8%     153967 =C2=B1  3%  softirqs.CPU38.R=
CU
>      134488 =C2=B1  3%     +14.4%     153871 =C2=B1  3%  softirqs.CPU39.R=
CU
>      135294 =C2=B1  2%     +14.6%     155025 =C2=B1  3%  softirqs.CPU4.RCU
>      134598 =C2=B1  4%     +14.3%     153848 =C2=B1  3%  softirqs.CPU40.R=
CU
>      134255 =C2=B1  3%     +14.8%     154099 =C2=B1  3%  softirqs.CPU41.R=
CU
>      134334 =C2=B1  3%     +14.3%     153491 =C2=B1  3%  softirqs.CPU42.R=
CU
>      134201 =C2=B1  3%     +14.5%     153654 =C2=B1  3%  softirqs.CPU43.R=
CU
>      134260 =C2=B1  3%     +14.2%     153359 =C2=B1  3%  softirqs.CPU44.R=
CU
>      134005 =C2=B1  3%     +14.4%     153367 =C2=B1  3%  softirqs.CPU45.R=
CU
>      134236 =C2=B1  3%     +14.3%     153419 =C2=B1  3%  softirqs.CPU46.R=
CU
>      134552 =C2=B1  3%     +13.8%     153056 =C2=B1  3%  softirqs.CPU47.R=
CU
>      134623 =C2=B1  3%     +14.4%     154028 =C2=B1  3%  softirqs.CPU48.R=
CU
>      134348 =C2=B1  3%     +14.7%     154080 =C2=B1  3%  softirqs.CPU49.R=
CU
>      109020 =C2=B1  3%     +18.6%     129279 =C2=B1 14%  softirqs.CPU49.T=
IMER
>      134334 =C2=B1  3%     +15.0%     154455 =C2=B1  3%  softirqs.CPU5.RCU
>      110260 =C2=B1  2%      +8.8%     119951 =C2=B1  4%  softirqs.CPU5.TI=
MER
>      134377 =C2=B1  3%     +13.8%     152954 =C2=B1  3%  softirqs.CPU50.R=
CU
>      109169 =C2=B1  3%     +15.0%     125548 =C2=B1  9%  softirqs.CPU50.T=
IMER
>      134780 =C2=B1  3%     +14.2%     153967 =C2=B1  3%  softirqs.CPU51.R=
CU
>      109951 =C2=B1  3%     +12.5%     123641 =C2=B1  5%  softirqs.CPU51.T=
IMER
>      133929 =C2=B1  3%     +15.0%     154012 =C2=B1  3%  softirqs.CPU52.R=
CU
>      108665 =C2=B1  3%     +12.8%     122613 =C2=B1  5%  softirqs.CPU52.T=
IMER
>      133761 =C2=B1  3%     +14.9%     153675 =C2=B1  3%  softirqs.CPU53.R=
CU
>      108606 =C2=B1  3%     +19.6%     129861 =C2=B1 16%  softirqs.CPU53.T=
IMER
>      134369 =C2=B1  3%     +14.1%     153255 =C2=B1  3%  softirqs.CPU54.R=
CU
>      108917 =C2=B1  3%     +12.5%     122585 =C2=B1  5%  softirqs.CPU54.T=
IMER
>      133810 =C2=B1  3%     +14.6%     153282 =C2=B1  3%  softirqs.CPU55.R=
CU
>      108875 =C2=B1  3%     +12.5%     122468 =C2=B1  5%  softirqs.CPU55.T=
IMER
>      134038 =C2=B1  3%     +14.3%     153248 =C2=B1  3%  softirqs.CPU56.R=
CU
>      108569 =C2=B1  3%     +12.8%     122502 =C2=B1  5%  softirqs.CPU56.T=
IMER
>      133993 =C2=B1  4%     +14.5%     153426 =C2=B1  3%  softirqs.CPU57.R=
CU
>      108465 =C2=B1  3%     +12.8%     122399 =C2=B1  5%  softirqs.CPU57.T=
IMER
>      134049 =C2=B1  3%     +14.7%     153708 =C2=B1  3%  softirqs.CPU58.R=
CU
>      108634 =C2=B1  4%     +18.8%     129107 =C2=B1 16%  softirqs.CPU58.T=
IMER
>      134025 =C2=B1  3%     +14.9%     154015 =C2=B1  3%  softirqs.CPU59.R=
CU
>      108501 =C2=B1  3%     +18.6%     128721 =C2=B1 13%  softirqs.CPU59.T=
IMER
>      135247 =C2=B1  3%     +14.5%     154804 =C2=B1  3%  softirqs.CPU6.RCU
>      133745 =C2=B1  4%     +14.7%     153452 =C2=B1  3%  softirqs.CPU60.R=
CU
>      108526 =C2=B1  3%     +13.0%     122688 =C2=B1  5%  softirqs.CPU60.T=
IMER
>      133931 =C2=B1  3%     +14.6%     153549 =C2=B1  3%  softirqs.CPU61.R=
CU
>      108764 =C2=B1  3%     +12.9%     122787 =C2=B1  5%  softirqs.CPU61.T=
IMER
>      134682 =C2=B1  3%     +13.8%     153266 =C2=B1  3%  softirqs.CPU62.R=
CU
>      109188 =C2=B1  3%     +12.5%     122806 =C2=B1  5%  softirqs.CPU62.T=
IMER
>      134190 =C2=B1  3%     +14.6%     153761 =C2=B1  2%  softirqs.CPU63.R=
CU
>      108489 =C2=B1  3%     +12.8%     122426 =C2=B1  5%  softirqs.CPU63.T=
IMER
>      134280 =C2=B1  3%     +14.3%     153538 =C2=B1  3%  softirqs.CPU64.R=
CU
>      108493 =C2=B1  3%     +13.3%     122953 =C2=B1  5%  softirqs.CPU64.T=
IMER
>      134074 =C2=B1  3%     +14.7%     153765 =C2=B1  3%  softirqs.CPU65.R=
CU
>      108331 =C2=B1  3%     +13.0%     122440 =C2=B1  5%  softirqs.CPU65.T=
IMER
>      134424 =C2=B1  4%     +14.3%     153692 =C2=B1  3%  softirqs.CPU66.R=
CU
>      108874 =C2=B1  3%     +12.5%     122490 =C2=B1  5%  softirqs.CPU66.T=
IMER
>      133801 =C2=B1  3%     +14.9%     153746 =C2=B1  3%  softirqs.CPU67.R=
CU
>      108903 =C2=B1  3%     +13.2%     123240 =C2=B1  5%  softirqs.CPU67.T=
IMER
>      134085 =C2=B1  3%     +14.4%     153371 =C2=B1  3%  softirqs.CPU68.R=
CU
>      109310 =C2=B1  3%     +12.3%     122810 =C2=B1  5%  softirqs.CPU68.T=
IMER
>      134091 =C2=B1  3%     +14.5%     153515 =C2=B1  3%  softirqs.CPU69.R=
CU
>      108193 =C2=B1  3%     +12.5%     121716 =C2=B1  5%  softirqs.CPU69.T=
IMER
>      134883 =C2=B1  3%     +13.6%     153181 =C2=B1  3%  softirqs.CPU7.RCU
>      134392 =C2=B1  3%     +14.8%     154240 =C2=B1  3%  softirqs.CPU70.R=
CU
>      108056 =C2=B1  3%     +13.4%     122578 =C2=B1  5%  softirqs.CPU70.T=
IMER
>      133901 =C2=B1  3%     +14.2%     152873 =C2=B1  3%  softirqs.CPU71.R=
CU
>      134273 =C2=B1  3%     +14.4%     153630 =C2=B1  3%  softirqs.CPU72.R=
CU
>      116189 =C2=B1  3%     +11.5%     129495 =C2=B1  3%  softirqs.CPU72.T=
IMER
>      134231 =C2=B1  3%     +14.5%     153682 =C2=B1  3%  softirqs.CPU73.R=
CU
>      116348 =C2=B1  3%     +11.3%     129453 =C2=B1  3%  softirqs.CPU73.T=
IMER
>      134235 =C2=B1  3%     +14.1%     153158 =C2=B1  3%  softirqs.CPU74.R=
CU
>      133896 =C2=B1  3%     +14.6%     153477 =C2=B1  3%  softirqs.CPU75.R=
CU
>      116933 =C2=B1  4%     +11.2%     129980 =C2=B1  3%  softirqs.CPU75.T=
IMER
>      134014 =C2=B1  3%     +14.3%     153198 =C2=B1  3%  softirqs.CPU76.R=
CU
>      116889 =C2=B1  3%     +11.0%     129768 =C2=B1  3%  softirqs.CPU76.T=
IMER
>      134608 =C2=B1  3%     +13.7%     152994 =C2=B1  3%  softirqs.CPU77.R=
CU
>      117342 =C2=B1  3%     +11.0%     130274 =C2=B1  3%  softirqs.CPU77.T=
IMER
>      134551 =C2=B1  3%     +13.9%     153253 =C2=B1  3%  softirqs.CPU78.R=
CU
>      117229 =C2=B1  4%     +10.5%     129549 =C2=B1  4%  softirqs.CPU78.T=
IMER
>      134118 =C2=B1  3%     +14.3%     153325 =C2=B1  3%  softirqs.CPU79.R=
CU
>      116982 =C2=B1  3%     +11.0%     129802 =C2=B1  3%  softirqs.CPU79.T=
IMER
>      135303 =C2=B1  3%     +13.9%     154129 =C2=B1  3%  softirqs.CPU8.RCU
>      134699 =C2=B1  3%     +13.6%     153047 =C2=B1  3%  softirqs.CPU80.R=
CU
>      117058 =C2=B1  4%     +10.6%     129470 =C2=B1  3%  softirqs.CPU80.T=
IMER
>      134088 =C2=B1  3%     +15.6%     155063 =C2=B1  3%  softirqs.CPU81.R=
CU
>      116539 =C2=B1  4%     +12.3%     130886 =C2=B1  5%  softirqs.CPU81.T=
IMER
>      133989 =C2=B1  3%     +14.6%     153526 =C2=B1  3%  softirqs.CPU82.R=
CU
>      116614 =C2=B1  4%     +16.8%     136238 =C2=B1 12%  softirqs.CPU82.T=
IMER
>      133966 =C2=B1  3%     +14.3%     153142 =C2=B1  3%  softirqs.CPU83.R=
CU
>      117140 =C2=B1  3%     +11.2%     130205 =C2=B1  4%  softirqs.CPU83.T=
IMER
>      133561 =C2=B1  3%     +15.0%     153661 =C2=B1  3%  softirqs.CPU84.R=
CU
>      116648 =C2=B1  4%     +11.3%     129844 =C2=B1  4%  softirqs.CPU84.T=
IMER
>      134217 =C2=B1  3%     +14.2%     153330 =C2=B1  3%  softirqs.CPU85.R=
CU
>      116247 =C2=B1  4%     +11.3%     129336 =C2=B1  3%  softirqs.CPU85.T=
IMER
>      133956 =C2=B1  3%     +14.5%     153338 =C2=B1  3%  softirqs.CPU86.R=
CU
>      116654 =C2=B1  4%     +11.1%     129560 =C2=B1  3%  softirqs.CPU86.T=
IMER
>      133834 =C2=B1  3%     +15.1%     154049 =C2=B1  2%  softirqs.CPU87.R=
CU
>      116898 =C2=B1  4%     +12.0%     130912 =C2=B1  3%  softirqs.CPU87.T=
IMER
>      133951 =C2=B1  3%     +15.1%     154211 =C2=B1  3%  softirqs.CPU88.R=
CU
>      116139 =C2=B1  3%     +16.0%     134676 =C2=B1 13%  softirqs.CPU88.T=
IMER
>      134288 =C2=B1  3%     +14.3%     153433 =C2=B1  2%  softirqs.CPU89.R=
CU
>      116227 =C2=B1  3%     +11.0%     129064 =C2=B1  3%  softirqs.CPU89.T=
IMER
>      135289 =C2=B1  3%     +13.6%     153744 =C2=B1  3%  softirqs.CPU9.RCU
>      133598 =C2=B1  3%     +14.5%     153019 =C2=B1  3%  softirqs.CPU90.R=
CU
>      116395 =C2=B1  3%     +10.9%     129084 =C2=B1  4%  softirqs.CPU90.T=
IMER
>      133854 =C2=B1  4%     +14.9%     153799 =C2=B1  3%  softirqs.CPU91.R=
CU
>      116562 =C2=B1  4%     +11.1%     129452 =C2=B1  3%  softirqs.CPU91.T=
IMER
>      134107 =C2=B1  3%     +14.1%     152958 =C2=B1  3%  softirqs.CPU92.R=
CU
>      117107 =C2=B1  4%     +10.6%     129559 =C2=B1  3%  softirqs.CPU92.T=
IMER
>      133800 =C2=B1  3%     +14.7%     153465 =C2=B1  3%  softirqs.CPU93.R=
CU
>      116415 =C2=B1  3%     +11.5%     129823 =C2=B1  4%  softirqs.CPU93.T=
IMER
>      134092 =C2=B1  3%     +14.0%     152835 =C2=B1  3%  softirqs.CPU94.R=
CU
>      116063 =C2=B1  3%     +11.4%     129252 =C2=B1  4%  softirqs.CPU94.T=
IMER
>      134284 =C2=B1  3%     +14.1%     153230 =C2=B1  4%  softirqs.CPU95.R=
CU
>      117908 =C2=B1  3%     +11.0%     130904 =C2=B1  4%  softirqs.CPU95.T=
IMER
>      134264 =C2=B1  3%     +14.3%     153455 =C2=B1  3%  softirqs.CPU96.R=
CU
>      109819 =C2=B1  3%      +8.6%     119258 =C2=B1  3%  softirqs.CPU96.T=
IMER
>      135000 =C2=B1  3%     +13.7%     153529 =C2=B1  3%  softirqs.CPU97.R=
CU
>      134163 =C2=B1  3%     +14.2%     153253 =C2=B1  3%  softirqs.CPU98.R=
CU
>      109990 =C2=B1  3%      +8.1%     118896 =C2=B1  3%  softirqs.CPU98.T=
IMER
>      134966 =C2=B1  3%     +13.5%     153245 =C2=B1  3%  softirqs.CPU99.R=
CU
>    25776297 =C2=B1  3%     +14.3%   29452390 =C2=B1  3%  softirqs.RCU
>    21445010 =C2=B1  3%      +9.5%   23488096 =C2=B1  3%  softirqs.TIMER
>      614.00 =C2=B1  2%      +9.9%     674.50 =C2=B1  2%  interrupts.9:IO-=
APIC.9-fasteoi.acpi
>      611854 =C2=B1  2%     +10.1%     673945 =C2=B1  2%  interrupts.CPU0.=
LOC:Local_timer_interrupts
>      614.00 =C2=B1  2%      +9.9%     674.50 =C2=B1  2%  interrupts.CPU1.=
9:IO-APIC.9-fasteoi.acpi
>      611835 =C2=B1  2%     +10.1%     673883 =C2=B1  2%  interrupts.CPU1.=
LOC:Local_timer_interrupts
>      611859 =C2=B1  2%     +10.2%     673975 =C2=B1  2%  interrupts.CPU10=
.LOC:Local_timer_interrupts
>        7508 =C2=B1  5%     +15.5%       8675 =C2=B1  4%  interrupts.CPU10=
.RES:Rescheduling_interrupts
>      611802 =C2=B1  2%     +10.2%     673904 =C2=B1  2%  interrupts.CPU10=
0.LOC:Local_timer_interrupts
>        7323 =C2=B1  5%     +16.1%       8503 =C2=B1  3%  interrupts.CPU10=
0.RES:Rescheduling_interrupts
>      611804 =C2=B1  2%     +10.2%     673917 =C2=B1  2%  interrupts.CPU10=
1.LOC:Local_timer_interrupts
>        7342 =C2=B1  3%     +13.8%       8352 =C2=B1  3%  interrupts.CPU10=
1.RES:Rescheduling_interrupts
>      611780 =C2=B1  2%     +10.2%     673877 =C2=B1  2%  interrupts.CPU10=
2.LOC:Local_timer_interrupts
>        7506 =C2=B1  5%     +12.2%       8424 =C2=B1  4%  interrupts.CPU10=
2.RES:Rescheduling_interrupts
>      611734 =C2=B1  2%     +10.2%     673851 =C2=B1  2%  interrupts.CPU10=
3.LOC:Local_timer_interrupts
>        7436 =C2=B1  3%     +15.8%       8607 =C2=B1  4%  interrupts.CPU10=
3.RES:Rescheduling_interrupts
>      611800 =C2=B1  2%     +10.2%     673908 =C2=B1  2%  interrupts.CPU10=
4.LOC:Local_timer_interrupts
>        7519 =C2=B1  5%     +13.1%       8502 =C2=B1  2%  interrupts.CPU10=
4.RES:Rescheduling_interrupts
>      611790 =C2=B1  2%     +10.1%     673864 =C2=B1  2%  interrupts.CPU10=
5.LOC:Local_timer_interrupts
>        7346 =C2=B1  5%     +16.4%       8553 =C2=B1  2%  interrupts.CPU10=
5.RES:Rescheduling_interrupts
>      611801 =C2=B1  2%     +10.1%     673859 =C2=B1  2%  interrupts.CPU10=
6.LOC:Local_timer_interrupts
>        7352 =C2=B1  5%     +16.5%       8567 =C2=B1  2%  interrupts.CPU10=
6.RES:Rescheduling_interrupts
>      611797 =C2=B1  2%     +10.1%     673890 =C2=B1  2%  interrupts.CPU10=
7.LOC:Local_timer_interrupts
>        7238 =C2=B1  6%     +15.3%       8344 =C2=B1  4%  interrupts.CPU10=
7.RES:Rescheduling_interrupts
>      611778 =C2=B1  2%     +10.2%     673882 =C2=B1  2%  interrupts.CPU10=
8.LOC:Local_timer_interrupts
>        7310 =C2=B1  5%     +16.3%       8503 =C2=B1  5%  interrupts.CPU10=
8.RES:Rescheduling_interrupts
>      611788 =C2=B1  2%     +10.1%     673881 =C2=B1  2%  interrupts.CPU10=
9.LOC:Local_timer_interrupts
>        7324 =C2=B1  6%     +13.4%       8307        interrupts.CPU109.RES=
:Rescheduling_interrupts
>      611827 =C2=B1  2%     +10.2%     673960 =C2=B1  2%  interrupts.CPU11=
.LOC:Local_timer_interrupts
>        7598 =C2=B1  6%     +12.6%       8557 =C2=B1  5%  interrupts.CPU11=
.RES:Rescheduling_interrupts
>      611796 =C2=B1  2%     +10.1%     673865 =C2=B1  2%  interrupts.CPU11=
0.LOC:Local_timer_interrupts
>        7326 =C2=B1  4%     +16.2%       8513 =C2=B1  4%  interrupts.CPU11=
0.RES:Rescheduling_interrupts
>      611804 =C2=B1  2%     +10.1%     673890 =C2=B1  2%  interrupts.CPU11=
1.LOC:Local_timer_interrupts
>        7312 =C2=B1  3%     +14.4%       8365 =C2=B1  3%  interrupts.CPU11=
1.RES:Rescheduling_interrupts
>      611801 =C2=B1  2%     +10.1%     673890 =C2=B1  2%  interrupts.CPU11=
2.LOC:Local_timer_interrupts
>        7277 =C2=B1  2%     +14.6%       8337 =C2=B1  5%  interrupts.CPU11=
2.RES:Rescheduling_interrupts
>      611789 =C2=B1  2%     +10.2%     673896 =C2=B1  2%  interrupts.CPU11=
3.LOC:Local_timer_interrupts
>        7346 =C2=B1  4%     +15.2%       8461 =C2=B1  4%  interrupts.CPU11=
3.RES:Rescheduling_interrupts
>      611759 =C2=B1  2%     +10.2%     673861 =C2=B1  2%  interrupts.CPU11=
4.LOC:Local_timer_interrupts
>        7290 =C2=B1  4%     +17.9%       8594 =C2=B1  4%  interrupts.CPU11=
4.RES:Rescheduling_interrupts
>      611783 =C2=B1  2%     +10.2%     673883 =C2=B1  2%  interrupts.CPU11=
5.LOC:Local_timer_interrupts
>        7470 =C2=B1  4%     +13.6%       8489 =C2=B1  5%  interrupts.CPU11=
5.RES:Rescheduling_interrupts
>      611807 =C2=B1  2%     +10.2%     673925 =C2=B1  2%  interrupts.CPU11=
6.LOC:Local_timer_interrupts
>        7336 =C2=B1  4%     +15.3%       8455 =C2=B1  2%  interrupts.CPU11=
6.RES:Rescheduling_interrupts
>      611778 =C2=B1  2%     +10.2%     673890 =C2=B1  2%  interrupts.CPU11=
7.LOC:Local_timer_interrupts
>        7326 =C2=B1  5%     +15.9%       8493 =C2=B1  3%  interrupts.CPU11=
7.RES:Rescheduling_interrupts
>      611782 =C2=B1  2%     +10.1%     673849 =C2=B1  2%  interrupts.CPU11=
8.LOC:Local_timer_interrupts
>        7239 =C2=B1  4%     +18.4%       8574 =C2=B1  5%  interrupts.CPU11=
8.RES:Rescheduling_interrupts
>      611778 =C2=B1  2%     +10.2%     673881 =C2=B1  2%  interrupts.CPU11=
9.LOC:Local_timer_interrupts
>        7327 =C2=B1  4%     +13.7%       8335 =C2=B1  6%  interrupts.CPU11=
9.RES:Rescheduling_interrupts
>      611853 =C2=B1  2%     +10.1%     673944 =C2=B1  2%  interrupts.CPU12=
.LOC:Local_timer_interrupts
>        7516 =C2=B1  4%     +17.0%       8798 =C2=B1  6%  interrupts.CPU12=
.RES:Rescheduling_interrupts
>      611417 =C2=B1  2%     +10.2%     673606 =C2=B1  2%  interrupts.CPU12=
0.LOC:Local_timer_interrupts
>        7392 =C2=B1  4%     +14.2%       8444 =C2=B1  5%  interrupts.CPU12=
0.RES:Rescheduling_interrupts
>      611457 =C2=B1  2%     +10.2%     673608 =C2=B1  2%  interrupts.CPU12=
1.LOC:Local_timer_interrupts
>        7376 =C2=B1  3%     +15.6%       8525 =C2=B1  4%  interrupts.CPU12=
1.RES:Rescheduling_interrupts
>      611426 =C2=B1  2%     +10.2%     673610 =C2=B1  2%  interrupts.CPU12=
2.LOC:Local_timer_interrupts
>        7466 =C2=B1  5%     +11.7%       8336 =C2=B1  4%  interrupts.CPU12=
2.RES:Rescheduling_interrupts
>      611384 =C2=B1  2%     +10.2%     673577 =C2=B1  2%  interrupts.CPU12=
3.LOC:Local_timer_interrupts
>        7240 =C2=B1  5%     +18.2%       8559 =C2=B1  3%  interrupts.CPU12=
3.RES:Rescheduling_interrupts
>      611388 =C2=B1  2%     +10.2%     673597 =C2=B1  2%  interrupts.CPU12=
4.LOC:Local_timer_interrupts
>        7245 =C2=B1  5%     +18.0%       8548 =C2=B1  5%  interrupts.CPU12=
4.RES:Rescheduling_interrupts
>      611391 =C2=B1  2%     +10.2%     673567 =C2=B1  2%  interrupts.CPU12=
5.LOC:Local_timer_interrupts
>        7318 =C2=B1  3%     +15.3%       8436 =C2=B1  5%  interrupts.CPU12=
5.RES:Rescheduling_interrupts
>      611421 =C2=B1  2%     +10.2%     673570 =C2=B1  2%  interrupts.CPU12=
6.LOC:Local_timer_interrupts
>        7258 =C2=B1  5%     +16.4%       8448 =C2=B1  4%  interrupts.CPU12=
6.RES:Rescheduling_interrupts
>      611468 =C2=B1  2%     +10.2%     673614 =C2=B1  2%  interrupts.CPU12=
7.LOC:Local_timer_interrupts
>        7276 =C2=B1  5%     +16.9%       8508 =C2=B1  5%  interrupts.CPU12=
7.RES:Rescheduling_interrupts
>      611422 =C2=B1  2%     +10.2%     673591 =C2=B1  2%  interrupts.CPU12=
8.LOC:Local_timer_interrupts
>        7278 =C2=B1  4%     +17.0%       8518 =C2=B1  3%  interrupts.CPU12=
8.RES:Rescheduling_interrupts
>      611407 =C2=B1  2%     +10.2%     673562 =C2=B1  2%  interrupts.CPU12=
9.LOC:Local_timer_interrupts
>        7284 =C2=B1  3%     +17.0%       8519 =C2=B1  5%  interrupts.CPU12=
9.RES:Rescheduling_interrupts
>      611825 =C2=B1  2%     +10.1%     673920 =C2=B1  2%  interrupts.CPU13=
.LOC:Local_timer_interrupts
>        7550 =C2=B1  4%     +16.2%       8771 =C2=B1  3%  interrupts.CPU13=
.RES:Rescheduling_interrupts
>      611428 =C2=B1  2%     +10.2%     673571 =C2=B1  2%  interrupts.CPU13=
0.LOC:Local_timer_interrupts
>        7337 =C2=B1  5%     +16.4%       8541 =C2=B1  5%  interrupts.CPU13=
0.RES:Rescheduling_interrupts
>      611406 =C2=B1  2%     +10.2%     673582 =C2=B1  2%  interrupts.CPU13=
1.LOC:Local_timer_interrupts
>        7205 =C2=B1  5%     +17.1%       8440 =C2=B1  6%  interrupts.CPU13=
1.RES:Rescheduling_interrupts
>      611449 =C2=B1  2%     +10.2%     673586 =C2=B1  2%  interrupts.CPU13=
2.LOC:Local_timer_interrupts
>        7431 =C2=B1  4%     +12.7%       8372 =C2=B1  3%  interrupts.CPU13=
2.RES:Rescheduling_interrupts
>      611464 =C2=B1  2%     +10.2%     673588 =C2=B1  2%  interrupts.CPU13=
3.LOC:Local_timer_interrupts
>        7289 =C2=B1  4%     +15.9%       8446 =C2=B1  3%  interrupts.CPU13=
3.RES:Rescheduling_interrupts
>      611437 =C2=B1  2%     +10.2%     673583 =C2=B1  2%  interrupts.CPU13=
4.LOC:Local_timer_interrupts
>        7321 =C2=B1  4%     +17.7%       8616 =C2=B1  4%  interrupts.CPU13=
4.RES:Rescheduling_interrupts
>      611401 =C2=B1  2%     +10.2%     673595 =C2=B1  2%  interrupts.CPU13=
5.LOC:Local_timer_interrupts
>        7300 =C2=B1  4%     +15.7%       8446 =C2=B1  4%  interrupts.CPU13=
5.RES:Rescheduling_interrupts
>      611462 =C2=B1  2%     +10.2%     673602 =C2=B1  2%  interrupts.CPU13=
6.LOC:Local_timer_interrupts
>        7389 =C2=B1  4%     +13.9%       8417 =C2=B1  5%  interrupts.CPU13=
6.RES:Rescheduling_interrupts
>      611424 =C2=B1  2%     +10.2%     673588 =C2=B1  2%  interrupts.CPU13=
7.LOC:Local_timer_interrupts
>        7126 =C2=B1  4%     +20.0%       8550 =C2=B1  5%  interrupts.CPU13=
7.RES:Rescheduling_interrupts
>      611383 =C2=B1  2%     +10.2%     673556 =C2=B1  2%  interrupts.CPU13=
8.LOC:Local_timer_interrupts
>        7297 =C2=B1  5%     +16.1%       8475 =C2=B1  5%  interrupts.CPU13=
8.RES:Rescheduling_interrupts
>      611422 =C2=B1  2%     +10.2%     673603 =C2=B1  2%  interrupts.CPU13=
9.LOC:Local_timer_interrupts
>        7160 =C2=B1  4%     +17.6%       8423 =C2=B1  4%  interrupts.CPU13=
9.RES:Rescheduling_interrupts
>      611815 =C2=B1  2%     +10.1%     673901 =C2=B1  2%  interrupts.CPU14=
.LOC:Local_timer_interrupts
>        7576 =C2=B1  5%     +16.3%       8810 =C2=B1  3%  interrupts.CPU14=
.RES:Rescheduling_interrupts
>      611388 =C2=B1  2%     +10.2%     673577 =C2=B1  2%  interrupts.CPU14=
0.LOC:Local_timer_interrupts
>        7342 =C2=B1  6%     +12.9%       8293 =C2=B1  4%  interrupts.CPU14=
0.RES:Rescheduling_interrupts
>      611394 =C2=B1  2%     +10.2%     673596 =C2=B1  2%  interrupts.CPU14=
1.LOC:Local_timer_interrupts
>        7257 =C2=B1  4%     +16.1%       8423 =C2=B1  5%  interrupts.CPU14=
1.RES:Rescheduling_interrupts
>      611411 =C2=B1  2%     +10.2%     673590 =C2=B1  2%  interrupts.CPU14=
2.LOC:Local_timer_interrupts
>        7300 =C2=B1  6%     +16.1%       8475 =C2=B1  3%  interrupts.CPU14=
2.RES:Rescheduling_interrupts
>      611396 =C2=B1  2%     +10.2%     673622 =C2=B1  2%  interrupts.CPU14=
3.LOC:Local_timer_interrupts
>        7399 =C2=B1  5%     +14.0%       8435 =C2=B1  4%  interrupts.CPU14=
3.RES:Rescheduling_interrupts
>      610929 =C2=B1  2%     +10.3%     673686 =C2=B1  2%  interrupts.CPU14=
4.LOC:Local_timer_interrupts
>        7281 =C2=B1  5%     +13.4%       8257 =C2=B1  5%  interrupts.CPU14=
4.RES:Rescheduling_interrupts
>      610918 =C2=B1  2%     +10.3%     673755 =C2=B1  2%  interrupts.CPU14=
5.LOC:Local_timer_interrupts
>        7343 =C2=B1  5%     +14.5%       8408 =C2=B1  4%  interrupts.CPU14=
5.RES:Rescheduling_interrupts
>      610910 =C2=B1  2%     +10.3%     673705 =C2=B1  2%  interrupts.CPU14=
6.LOC:Local_timer_interrupts
>        7524 =C2=B1  4%     +13.6%       8550 =C2=B1  6%  interrupts.CPU14=
6.RES:Rescheduling_interrupts
>      610858 =C2=B1  2%     +10.3%     673769 =C2=B1  2%  interrupts.CPU14=
7.LOC:Local_timer_interrupts
>        7433 =C2=B1  4%     +10.8%       8237 =C2=B1  3%  interrupts.CPU14=
7.RES:Rescheduling_interrupts
>      610872 =C2=B1  2%     +10.3%     673727 =C2=B1  2%  interrupts.CPU14=
8.LOC:Local_timer_interrupts
>        7354 =C2=B1  3%     +13.1%       8320 =C2=B1  4%  interrupts.CPU14=
8.RES:Rescheduling_interrupts
>      610909 =C2=B1  2%     +10.3%     673750 =C2=B1  2%  interrupts.CPU14=
9.LOC:Local_timer_interrupts
>        7365 =C2=B1  3%     +16.5%       8582 =C2=B1  3%  interrupts.CPU14=
9.RES:Rescheduling_interrupts
>      611818 =C2=B1  2%     +10.2%     673937 =C2=B1  2%  interrupts.CPU15=
.LOC:Local_timer_interrupts
>        7632 =C2=B1  4%     +12.5%       8587 =C2=B1  4%  interrupts.CPU15=
.RES:Rescheduling_interrupts
>      610898 =C2=B1  2%     +10.3%     673770 =C2=B1  2%  interrupts.CPU15=
0.LOC:Local_timer_interrupts
>        7369 =C2=B1  4%     +12.4%       8282 =C2=B1  3%  interrupts.CPU15=
0.RES:Rescheduling_interrupts
>      610887 =C2=B1  2%     +10.3%     673754 =C2=B1  2%  interrupts.CPU15=
1.LOC:Local_timer_interrupts
>        7322 =C2=B1  4%     +15.3%       8445 =C2=B1  3%  interrupts.CPU15=
1.RES:Rescheduling_interrupts
>      610849 =C2=B1  2%     +10.3%     673762 =C2=B1  2%  interrupts.CPU15=
2.LOC:Local_timer_interrupts
>        7305 =C2=B1  4%     +15.5%       8439 =C2=B1  5%  interrupts.CPU15=
2.RES:Rescheduling_interrupts
>      610909 =C2=B1  2%     +10.3%     673759 =C2=B1  2%  interrupts.CPU15=
3.LOC:Local_timer_interrupts
>        7363 =C2=B1  6%     +14.5%       8432 =C2=B1  2%  interrupts.CPU15=
3.RES:Rescheduling_interrupts
>      610878 =C2=B1  2%     +10.3%     673730 =C2=B1  2%  interrupts.CPU15=
4.LOC:Local_timer_interrupts
>        7373 =C2=B1  4%     +14.1%       8414 =C2=B1  4%  interrupts.CPU15=
4.RES:Rescheduling_interrupts
>      610891 =C2=B1  2%     +10.3%     673720 =C2=B1  2%  interrupts.CPU15=
5.LOC:Local_timer_interrupts
>        7385 =C2=B1  5%     +11.8%       8260 =C2=B1  4%  interrupts.CPU15=
5.RES:Rescheduling_interrupts
>      610909 =C2=B1  2%     +10.3%     673753 =C2=B1  2%  interrupts.CPU15=
6.LOC:Local_timer_interrupts
>        7377 =C2=B1  5%     +14.0%       8410 =C2=B1  5%  interrupts.CPU15=
6.RES:Rescheduling_interrupts
>      610886 =C2=B1  2%     +10.3%     673754 =C2=B1  2%  interrupts.CPU15=
7.LOC:Local_timer_interrupts
>        7399 =C2=B1  5%     +13.1%       8370 =C2=B1  4%  interrupts.CPU15=
7.RES:Rescheduling_interrupts
>      610854 =C2=B1  2%     +10.3%     673699 =C2=B1  2%  interrupts.CPU15=
8.LOC:Local_timer_interrupts
>        7489 =C2=B1  4%     +10.5%       8278 =C2=B1  2%  interrupts.CPU15=
8.RES:Rescheduling_interrupts
>      610921 =C2=B1  2%     +10.3%     673726 =C2=B1  2%  interrupts.CPU15=
9.LOC:Local_timer_interrupts
>        7281 =C2=B1  5%     +15.4%       8402 =C2=B1  4%  interrupts.CPU15=
9.RES:Rescheduling_interrupts
>      611836 =C2=B1  2%     +10.1%     673889 =C2=B1  2%  interrupts.CPU16=
.LOC:Local_timer_interrupts
>        7548 =C2=B1  4%     +15.6%       8723 =C2=B1  5%  interrupts.CPU16=
.RES:Rescheduling_interrupts
>      610870 =C2=B1  2%     +10.3%     673742 =C2=B1  2%  interrupts.CPU16=
0.LOC:Local_timer_interrupts
>      610856 =C2=B1  2%     +10.3%     673722 =C2=B1  2%  interrupts.CPU16=
1.LOC:Local_timer_interrupts
>        7472 =C2=B1  5%     +13.4%       8475 =C2=B1  5%  interrupts.CPU16=
1.RES:Rescheduling_interrupts
>      610891 =C2=B1  2%     +10.3%     673708 =C2=B1  2%  interrupts.CPU16=
2.LOC:Local_timer_interrupts
>        7177 =C2=B1  5%     +14.8%       8239 =C2=B1  5%  interrupts.CPU16=
2.RES:Rescheduling_interrupts
>      610864 =C2=B1  2%     +10.3%     673696 =C2=B1  2%  interrupts.CPU16=
3.LOC:Local_timer_interrupts
>        7337 =C2=B1  5%     +12.7%       8266 =C2=B1  4%  interrupts.CPU16=
3.RES:Rescheduling_interrupts
>      610858 =C2=B1  2%     +10.3%     673724 =C2=B1  2%  interrupts.CPU16=
4.LOC:Local_timer_interrupts
>        7269 =C2=B1  5%     +15.2%       8376 =C2=B1  4%  interrupts.CPU16=
4.RES:Rescheduling_interrupts
>      610861 =C2=B1  2%     +10.3%     673711 =C2=B1  2%  interrupts.CPU16=
5.LOC:Local_timer_interrupts
>        7431 =C2=B1  4%      +9.4%       8131 =C2=B1  4%  interrupts.CPU16=
5.RES:Rescheduling_interrupts
>      610867 =C2=B1  2%     +10.3%     673684 =C2=B1  2%  interrupts.CPU16=
6.LOC:Local_timer_interrupts
>        7339 =C2=B1  2%     +14.1%       8374 =C2=B1  4%  interrupts.CPU16=
6.RES:Rescheduling_interrupts
>      610913 =C2=B1  2%     +10.3%     673730 =C2=B1  2%  interrupts.CPU16=
7.LOC:Local_timer_interrupts
>        7174 =C2=B1  3%     +17.5%       8427 =C2=B1  4%  interrupts.CPU16=
7.RES:Rescheduling_interrupts
>      611289 =C2=B1  2%     +10.2%     673888 =C2=B1  2%  interrupts.CPU16=
8.LOC:Local_timer_interrupts
>        7311 =C2=B1  5%     +14.7%       8382 =C2=B1  3%  interrupts.CPU16=
8.RES:Rescheduling_interrupts
>      611333 =C2=B1  2%     +10.2%     673887 =C2=B1  2%  interrupts.CPU16=
9.LOC:Local_timer_interrupts
>        7232 =C2=B1  2%     +17.8%       8517 =C2=B1  5%  interrupts.CPU16=
9.RES:Rescheduling_interrupts
>      611838 =C2=B1  2%     +10.1%     673879 =C2=B1  2%  interrupts.CPU17=
.LOC:Local_timer_interrupts
>        7539 =C2=B1  2%     +17.7%       8873 =C2=B1 10%  interrupts.CPU17=
.RES:Rescheduling_interrupts
>      611349 =C2=B1  2%     +10.2%     673889 =C2=B1  2%  interrupts.CPU17=
0.LOC:Local_timer_interrupts
>        7374 =C2=B1  2%     +14.2%       8424 =C2=B1  5%  interrupts.CPU17=
0.RES:Rescheduling_interrupts
>      611297 =C2=B1  2%     +10.2%     673873 =C2=B1  2%  interrupts.CPU17=
1.LOC:Local_timer_interrupts
>        7438 =C2=B1  4%     +13.9%       8471 =C2=B1  5%  interrupts.CPU17=
1.RES:Rescheduling_interrupts
>      611304 =C2=B1  2%     +10.2%     673845 =C2=B1  2%  interrupts.CPU17=
2.LOC:Local_timer_interrupts
>        7317 =C2=B1  3%     +16.6%       8529 =C2=B1  5%  interrupts.CPU17=
2.RES:Rescheduling_interrupts
>      611297 =C2=B1  2%     +10.2%     673887 =C2=B1  2%  interrupts.CPU17=
3.LOC:Local_timer_interrupts
>      611309 =C2=B1  2%     +10.2%     673858 =C2=B1  2%  interrupts.CPU17=
4.LOC:Local_timer_interrupts
>        7369 =C2=B1  5%     +15.8%       8531 =C2=B1  5%  interrupts.CPU17=
4.RES:Rescheduling_interrupts
>      611311 =C2=B1  2%     +10.2%     673872 =C2=B1  2%  interrupts.CPU17=
5.LOC:Local_timer_interrupts
>        7352 =C2=B1  4%     +15.1%       8465 =C2=B1  4%  interrupts.CPU17=
5.RES:Rescheduling_interrupts
>      611309 =C2=B1  2%     +10.2%     673886 =C2=B1  2%  interrupts.CPU17=
6.LOC:Local_timer_interrupts
>        7395 =C2=B1  2%     +14.0%       8434 =C2=B1  5%  interrupts.CPU17=
6.RES:Rescheduling_interrupts
>      611322 =C2=B1  2%     +10.2%     673868 =C2=B1  2%  interrupts.CPU17=
7.LOC:Local_timer_interrupts
>      611248 =C2=B1  2%     +10.2%     673805 =C2=B1  2%  interrupts.CPU17=
8.LOC:Local_timer_interrupts
>        7355 =C2=B1  5%     +14.1%       8393 =C2=B1  4%  interrupts.CPU17=
8.RES:Rescheduling_interrupts
>      611319 =C2=B1  2%     +10.2%     673906 =C2=B1  2%  interrupts.CPU17=
9.LOC:Local_timer_interrupts
>        7269 =C2=B1  4%     +15.2%       8374 =C2=B1  6%  interrupts.CPU17=
9.RES:Rescheduling_interrupts
>      611799 =C2=B1  2%     +10.1%     673864 =C2=B1  2%  interrupts.CPU18=
.LOC:Local_timer_interrupts
>        7585 =C2=B1  4%     +14.5%       8683 =C2=B1  4%  interrupts.CPU18=
.RES:Rescheduling_interrupts
>      611330 =C2=B1  2%     +10.2%     673869 =C2=B1  2%  interrupts.CPU18=
0.LOC:Local_timer_interrupts
>        7404 =C2=B1  4%     +14.0%       8442 =C2=B1  5%  interrupts.CPU18=
0.RES:Rescheduling_interrupts
>      611324 =C2=B1  2%     +10.2%     673889 =C2=B1  2%  interrupts.CPU18=
1.LOC:Local_timer_interrupts
>        7435 =C2=B1  2%     +13.0%       8399 =C2=B1  3%  interrupts.CPU18=
1.RES:Rescheduling_interrupts
>      611322 =C2=B1  2%     +10.2%     673874 =C2=B1  2%  interrupts.CPU18=
2.LOC:Local_timer_interrupts
>        7250 =C2=B1  4%     +14.6%       8305 =C2=B1  4%  interrupts.CPU18=
2.RES:Rescheduling_interrupts
>      611307 =C2=B1  2%     +10.2%     673852 =C2=B1  2%  interrupts.CPU18=
3.LOC:Local_timer_interrupts
>        7320 =C2=B1  4%     +13.2%       8290 =C2=B1  5%  interrupts.CPU18=
3.RES:Rescheduling_interrupts
>      611329 =C2=B1  2%     +10.2%     673877 =C2=B1  2%  interrupts.CPU18=
4.LOC:Local_timer_interrupts
>        7377 =C2=B1  4%     +12.5%       8299 =C2=B1  5%  interrupts.CPU18=
4.RES:Rescheduling_interrupts
>      611312 =C2=B1  2%     +10.2%     673866 =C2=B1  2%  interrupts.CPU18=
5.LOC:Local_timer_interrupts
>        7333 =C2=B1  4%     +13.9%       8351 =C2=B1  5%  interrupts.CPU18=
5.RES:Rescheduling_interrupts
>      611290 =C2=B1  2%     +10.2%     673868 =C2=B1  2%  interrupts.CPU18=
6.LOC:Local_timer_interrupts
>        7426 =C2=B1  4%     +14.1%       8471 =C2=B1  3%  interrupts.CPU18=
6.RES:Rescheduling_interrupts
>      611304 =C2=B1  2%     +10.2%     673853 =C2=B1  2%  interrupts.CPU18=
7.LOC:Local_timer_interrupts
>        7380 =C2=B1  3%     +12.5%       8304 =C2=B1  5%  interrupts.CPU18=
7.RES:Rescheduling_interrupts
>      611307 =C2=B1  2%     +10.2%     673881 =C2=B1  2%  interrupts.CPU18=
8.LOC:Local_timer_interrupts
>        7277 =C2=B1  5%     +16.3%       8467 =C2=B1  6%  interrupts.CPU18=
8.RES:Rescheduling_interrupts
>      611299 =C2=B1  2%     +10.2%     673879 =C2=B1  2%  interrupts.CPU18=
9.LOC:Local_timer_interrupts
>        7436 =C2=B1  3%     +14.5%       8514 =C2=B1  6%  interrupts.CPU18=
9.RES:Rescheduling_interrupts
>      611761 =C2=B1  2%     +10.2%     673928 =C2=B1  2%  interrupts.CPU19=
.LOC:Local_timer_interrupts
>        7515 =C2=B1  6%     +12.7%       8467 =C2=B1  4%  interrupts.CPU19=
.RES:Rescheduling_interrupts
>      611321 =C2=B1  2%     +10.2%     673856 =C2=B1  2%  interrupts.CPU19=
0.LOC:Local_timer_interrupts
>        7188 =C2=B1  3%     +16.4%       8366 =C2=B1  5%  interrupts.CPU19=
0.RES:Rescheduling_interrupts
>      611544 =C2=B1  2%     +10.2%     674120 =C2=B1  2%  interrupts.CPU19=
1.LOC:Local_timer_interrupts
>        7207 =C2=B1  3%     +15.3%       8312 =C2=B1  3%  interrupts.CPU19=
1.RES:Rescheduling_interrupts
>      611805 =C2=B1  2%     +10.2%     673920 =C2=B1  2%  interrupts.CPU2.=
LOC:Local_timer_interrupts
>      611781 =C2=B1  2%     +10.2%     673897 =C2=B1  2%  interrupts.CPU20=
.LOC:Local_timer_interrupts
>        7531 =C2=B1  5%     +16.4%       8768 =C2=B1  3%  interrupts.CPU20=
.RES:Rescheduling_interrupts
>      611715 =C2=B1  2%     +10.2%     673897 =C2=B1  2%  interrupts.CPU21=
.LOC:Local_timer_interrupts
>        7467 =C2=B1  3%     +14.9%       8577 =C2=B1  4%  interrupts.CPU21=
.RES:Rescheduling_interrupts
>      611834 =C2=B1  2%     +10.1%     673900 =C2=B1  2%  interrupts.CPU22=
.LOC:Local_timer_interrupts
>        7427 =C2=B1  6%     +17.9%       8754 =C2=B1  4%  interrupts.CPU22=
.RES:Rescheduling_interrupts
>      611788 =C2=B1  2%     +10.1%     673869 =C2=B1  2%  interrupts.CPU23=
.LOC:Local_timer_interrupts
>        7592 =C2=B1  4%     +12.2%       8518 =C2=B1  4%  interrupts.CPU23=
.RES:Rescheduling_interrupts
>      611426 =C2=B1  2%     +10.2%     673619 =C2=B1  2%  interrupts.CPU24=
.LOC:Local_timer_interrupts
>        7457 =C2=B1  4%     +14.7%       8551 =C2=B1  3%  interrupts.CPU24=
.RES:Rescheduling_interrupts
>      611439 =C2=B1  2%     +10.2%     673636 =C2=B1  2%  interrupts.CPU25=
.LOC:Local_timer_interrupts
>      611402 =C2=B1  2%     +10.2%     673620 =C2=B1  2%  interrupts.CPU26=
.LOC:Local_timer_interrupts
>        7463 =C2=B1  3%     +18.4%       8838 =C2=B1  7%  interrupts.CPU26=
.RES:Rescheduling_interrupts
>      611413 =C2=B1  2%     +10.2%     673615 =C2=B1  2%  interrupts.CPU27=
.LOC:Local_timer_interrupts
>        7412 =C2=B1  4%     +16.1%       8607 =C2=B1  4%  interrupts.CPU27=
.RES:Rescheduling_interrupts
>      611409 =C2=B1  2%     +10.2%     673625 =C2=B1  2%  interrupts.CPU28=
.LOC:Local_timer_interrupts
>        7478 =C2=B1  5%     +15.6%       8648 =C2=B1  3%  interrupts.CPU28=
.RES:Rescheduling_interrupts
>      611415 =C2=B1  2%     +10.2%     673620 =C2=B1  2%  interrupts.CPU29=
.LOC:Local_timer_interrupts
>        7431 =C2=B1  2%     +15.5%       8585 =C2=B1  2%  interrupts.CPU29=
.RES:Rescheduling_interrupts
>      611807 =C2=B1  2%     +10.1%     673896 =C2=B1  2%  interrupts.CPU3.=
LOC:Local_timer_interrupts
>        7659 =C2=B1  5%     +20.9%       9264 =C2=B1 10%  interrupts.CPU3.=
RES:Rescheduling_interrupts
>      611433 =C2=B1  2%     +10.2%     673520 =C2=B1  2%  interrupts.CPU30=
.LOC:Local_timer_interrupts
>        7432 =C2=B1  3%     +16.5%       8659 =C2=B1  4%  interrupts.CPU30=
.RES:Rescheduling_interrupts
>      611450 =C2=B1  2%     +10.2%     673604 =C2=B1  2%  interrupts.CPU31=
.LOC:Local_timer_interrupts
>        7490 =C2=B1  4%     +14.6%       8585 =C2=B1  5%  interrupts.CPU31=
.RES:Rescheduling_interrupts
>      611444 =C2=B1  2%     +10.2%     673588 =C2=B1  2%  interrupts.CPU32=
.LOC:Local_timer_interrupts
>        7393 =C2=B1  4%     +19.0%       8799 =C2=B1  3%  interrupts.CPU32=
.RES:Rescheduling_interrupts
>      611407 =C2=B1  2%     +10.2%     673606 =C2=B1  2%  interrupts.CPU33=
.LOC:Local_timer_interrupts
>        7398 =C2=B1  4%     +16.8%       8644 =C2=B1  4%  interrupts.CPU33=
.RES:Rescheduling_interrupts
>      611452 =C2=B1  2%     +10.2%     673609 =C2=B1  2%  interrupts.CPU34=
.LOC:Local_timer_interrupts
>        7414 =C2=B1  5%     +18.8%       8806 =C2=B1  4%  interrupts.CPU34=
.RES:Rescheduling_interrupts
>      611433 =C2=B1  2%     +10.2%     673588 =C2=B1  2%  interrupts.CPU35=
.LOC:Local_timer_interrupts
>        7486 =C2=B1  5%     +18.6%       8878 =C2=B1  3%  interrupts.CPU35=
.RES:Rescheduling_interrupts
>      611450 =C2=B1  2%     +10.2%     673603 =C2=B1  2%  interrupts.CPU36=
.LOC:Local_timer_interrupts
>        7503 =C2=B1  3%     +15.0%       8627 =C2=B1  3%  interrupts.CPU36=
.RES:Rescheduling_interrupts
>      611465 =C2=B1  2%     +10.2%     673611 =C2=B1  2%  interrupts.CPU37=
.LOC:Local_timer_interrupts
>        7416 =C2=B1  3%     +17.6%       8719 =C2=B1  2%  interrupts.CPU37=
.RES:Rescheduling_interrupts
>      611445 =C2=B1  2%     +10.2%     673575 =C2=B1  2%  interrupts.CPU38=
.LOC:Local_timer_interrupts
>        7477 =C2=B1  5%     +14.2%       8540 =C2=B1  3%  interrupts.CPU38=
.RES:Rescheduling_interrupts
>      611420 =C2=B1  2%     +10.2%     673600 =C2=B1  2%  interrupts.CPU39=
.LOC:Local_timer_interrupts
>        7562 =C2=B1  5%     +14.0%       8620 =C2=B1  4%  interrupts.CPU39=
.RES:Rescheduling_interrupts
>      611823 =C2=B1  2%     +10.2%     673949 =C2=B1  2%  interrupts.CPU4.=
LOC:Local_timer_interrupts
>        7579 =C2=B1  4%     +14.9%       8708 =C2=B1  3%  interrupts.CPU4.=
RES:Rescheduling_interrupts
>      611390 =C2=B1  2%     +10.2%     673618 =C2=B1  2%  interrupts.CPU40=
.LOC:Local_timer_interrupts
>        7444 =C2=B1  4%     +15.9%       8626 =C2=B1  3%  interrupts.CPU40=
.RES:Rescheduling_interrupts
>      611429 =C2=B1  2%     +10.2%     673612 =C2=B1  2%  interrupts.CPU41=
.LOC:Local_timer_interrupts
>        7464 =C2=B1  5%     +15.3%       8605 =C2=B1  2%  interrupts.CPU41=
.RES:Rescheduling_interrupts
>      611418 =C2=B1  2%     +10.2%     673597 =C2=B1  2%  interrupts.CPU42=
.LOC:Local_timer_interrupts
>        7394 =C2=B1  4%     +18.6%       8772 =C2=B1  5%  interrupts.CPU42=
.RES:Rescheduling_interrupts
>      611364 =C2=B1  2%     +10.2%     673601 =C2=B1  2%  interrupts.CPU43=
.LOC:Local_timer_interrupts
>        7483 =C2=B1  5%     +15.3%       8630 =C2=B1  3%  interrupts.CPU43=
.RES:Rescheduling_interrupts
>      611421 =C2=B1  2%     +10.2%     673593 =C2=B1  2%  interrupts.CPU44=
.LOC:Local_timer_interrupts
>        7463 =C2=B1  2%     +16.0%       8656 =C2=B1  4%  interrupts.CPU44=
.RES:Rescheduling_interrupts
>      611423 =C2=B1  2%     +10.2%     673593 =C2=B1  2%  interrupts.CPU45=
.LOC:Local_timer_interrupts
>        7455 =C2=B1  4%     +14.8%       8558 =C2=B1  3%  interrupts.CPU45=
.RES:Rescheduling_interrupts
>      611333 =C2=B1  2%     +10.2%     673616 =C2=B1  2%  interrupts.CPU46=
.LOC:Local_timer_interrupts
>        7406 =C2=B1  3%     +17.4%       8696 =C2=B1  3%  interrupts.CPU46=
.RES:Rescheduling_interrupts
>      611421 =C2=B1  2%     +10.2%     673605 =C2=B1  2%  interrupts.CPU47=
.LOC:Local_timer_interrupts
>        7482 =C2=B1  5%     +15.7%       8660 =C2=B1  2%  interrupts.CPU47=
.RES:Rescheduling_interrupts
>      610910 =C2=B1  2%     +10.3%     673737 =C2=B1  2%  interrupts.CPU48=
.LOC:Local_timer_interrupts
>        7521 =C2=B1  6%     +15.1%       8655 =C2=B1  4%  interrupts.CPU48=
.RES:Rescheduling_interrupts
>      610921 =C2=B1  2%     +10.3%     673770 =C2=B1  2%  interrupts.CPU49=
.LOC:Local_timer_interrupts
>        7594 =C2=B1  5%     +12.7%       8558 =C2=B1  3%  interrupts.CPU49=
.RES:Rescheduling_interrupts
>      611796 =C2=B1  2%     +10.1%     673831 =C2=B1  2%  interrupts.CPU5.=
LOC:Local_timer_interrupts
>      610930 =C2=B1  2%     +10.3%     673671 =C2=B1  2%  interrupts.CPU50=
.LOC:Local_timer_interrupts
>        7504 =C2=B1  2%     +17.6%       8824 =C2=B1  4%  interrupts.CPU50=
.RES:Rescheduling_interrupts
>      610882 =C2=B1  2%     +10.3%     673738 =C2=B1  2%  interrupts.CPU51=
.LOC:Local_timer_interrupts
>      610884 =C2=B1  2%     +10.3%     673731 =C2=B1  2%  interrupts.CPU52=
.LOC:Local_timer_interrupts
>        7436 =C2=B1  4%     +18.1%       8783 =C2=B1  3%  interrupts.CPU52=
.RES:Rescheduling_interrupts
>      610885 =C2=B1  2%     +10.3%     673774 =C2=B1  2%  interrupts.CPU53=
.LOC:Local_timer_interrupts
>        7544 =C2=B1  4%     +15.3%       8700 =C2=B1  4%  interrupts.CPU53=
.RES:Rescheduling_interrupts
>      610902 =C2=B1  2%     +10.3%     673763 =C2=B1  2%  interrupts.CPU54=
.LOC:Local_timer_interrupts
>        7534 =C2=B1  4%     +15.6%       8709 =C2=B1  6%  interrupts.CPU54=
.RES:Rescheduling_interrupts
>      610927 =C2=B1  2%     +10.3%     673739 =C2=B1  2%  interrupts.CPU55=
.LOC:Local_timer_interrupts
>      610883 =C2=B1  2%     +10.3%     673719 =C2=B1  2%  interrupts.CPU56=
.LOC:Local_timer_interrupts
>      610921 =C2=B1  2%     +10.3%     673689 =C2=B1  2%  interrupts.CPU57=
.LOC:Local_timer_interrupts
>        7473 =C2=B1  5%     +14.8%       8577 =C2=B1  4%  interrupts.CPU57=
.RES:Rescheduling_interrupts
>      610893 =C2=B1  2%     +10.3%     673781 =C2=B1  2%  interrupts.CPU58=
.LOC:Local_timer_interrupts
>        7407 =C2=B1  5%     +16.6%       8635 =C2=B1  3%  interrupts.CPU58=
.RES:Rescheduling_interrupts
>      610898 =C2=B1  2%     +10.3%     673763 =C2=B1  2%  interrupts.CPU59=
.LOC:Local_timer_interrupts
>        7642 =C2=B1  5%     +13.1%       8643 =C2=B1  3%  interrupts.CPU59=
.RES:Rescheduling_interrupts
>      611823 =C2=B1  2%     +10.1%     673914 =C2=B1  2%  interrupts.CPU6.=
LOC:Local_timer_interrupts
>        7542 =C2=B1  3%     +17.3%       8845 =C2=B1  3%  interrupts.CPU6.=
RES:Rescheduling_interrupts
>      610869 =C2=B1  2%     +10.3%     673784 =C2=B1  2%  interrupts.CPU60=
.LOC:Local_timer_interrupts
>        7535 =C2=B1  4%     +14.8%       8647 =C2=B1  5%  interrupts.CPU60=
.RES:Rescheduling_interrupts
>      610906 =C2=B1  2%     +10.3%     673701 =C2=B1  2%  interrupts.CPU61=
.LOC:Local_timer_interrupts
>        7631 =C2=B1  4%     +13.5%       8660 =C2=B1  4%  interrupts.CPU61=
.RES:Rescheduling_interrupts
>      610863 =C2=B1  2%     +10.3%     673705 =C2=B1  2%  interrupts.CPU62=
.LOC:Local_timer_interrupts
>        7634 =C2=B1  4%     +11.8%       8532 =C2=B1  4%  interrupts.CPU62=
.RES:Rescheduling_interrupts
>      610920 =C2=B1  2%     +10.3%     673730 =C2=B1  2%  interrupts.CPU63=
.LOC:Local_timer_interrupts
>        7549 =C2=B1  5%     +14.8%       8663 =C2=B1  5%  interrupts.CPU63=
.RES:Rescheduling_interrupts
>      610884 =C2=B1  2%     +10.3%     673727 =C2=B1  2%  interrupts.CPU64=
.LOC:Local_timer_interrupts
>        7644 =C2=B1  3%     +13.4%       8672 =C2=B1  3%  interrupts.CPU64=
.RES:Rescheduling_interrupts
>      610853 =C2=B1  2%     +10.3%     673708 =C2=B1  2%  interrupts.CPU65=
.LOC:Local_timer_interrupts
>        7555 =C2=B1  5%     +14.8%       8672 =C2=B1  3%  interrupts.CPU65=
.RES:Rescheduling_interrupts
>      610950 =C2=B1  2%     +10.3%     673804 =C2=B1  2%  interrupts.CPU66=
.LOC:Local_timer_interrupts
>        7457 =C2=B1  5%     +16.8%       8710 =C2=B1  4%  interrupts.CPU66=
.RES:Rescheduling_interrupts
>      610888 =C2=B1  2%     +10.3%     673735 =C2=B1  2%  interrupts.CPU67=
.LOC:Local_timer_interrupts
>        7550 =C2=B1  4%     +11.5%       8415 =C2=B1  5%  interrupts.CPU67=
.RES:Rescheduling_interrupts
>      610891 =C2=B1  2%     +10.3%     673727 =C2=B1  2%  interrupts.CPU68=
.LOC:Local_timer_interrupts
>        7612 =C2=B1  4%     +12.1%       8534 =C2=B1  3%  interrupts.CPU68=
.RES:Rescheduling_interrupts
>      610901 =C2=B1  2%     +10.3%     673659 =C2=B1  2%  interrupts.CPU69=
.LOC:Local_timer_interrupts
>        7493 =C2=B1  4%     +14.8%       8601 =C2=B1  4%  interrupts.CPU69=
.RES:Rescheduling_interrupts
>      611808 =C2=B1  2%     +10.1%     673844 =C2=B1  2%  interrupts.CPU7.=
LOC:Local_timer_interrupts
>        7673 =C2=B1  5%     +15.0%       8821 =C2=B1  4%  interrupts.CPU7.=
RES:Rescheduling_interrupts
>      610906 =C2=B1  2%     +10.3%     673733 =C2=B1  2%  interrupts.CPU70=
.LOC:Local_timer_interrupts
>        7412 =C2=B1  3%     +16.9%       8664 =C2=B1  4%  interrupts.CPU70=
.RES:Rescheduling_interrupts
>      610871 =C2=B1  2%     +10.3%     673671 =C2=B1  2%  interrupts.CPU71=
.LOC:Local_timer_interrupts
>        7519 =C2=B1  4%     +13.8%       8557 =C2=B1  5%  interrupts.CPU71=
.RES:Rescheduling_interrupts
>      611325 =C2=B1  2%     +10.2%     673906 =C2=B1  2%  interrupts.CPU72=
.LOC:Local_timer_interrupts
>        7720 =C2=B1  4%      +9.6%       8459 =C2=B1  4%  interrupts.CPU72=
.RES:Rescheduling_interrupts
>      611328 =C2=B1  2%     +10.2%     673908 =C2=B1  2%  interrupts.CPU73=
.LOC:Local_timer_interrupts
>        7535 =C2=B1  4%     +14.6%       8634 =C2=B1  4%  interrupts.CPU73=
.RES:Rescheduling_interrupts
>      611311 =C2=B1  2%     +10.2%     673883 =C2=B1  2%  interrupts.CPU74=
.LOC:Local_timer_interrupts
>        7526 =C2=B1  5%     +14.7%       8635 =C2=B1  6%  interrupts.CPU74=
.RES:Rescheduling_interrupts
>      611315 =C2=B1  2%     +10.2%     673868 =C2=B1  2%  interrupts.CPU75=
.LOC:Local_timer_interrupts
>        7712 =C2=B1  5%      +9.8%       8469 =C2=B1  4%  interrupts.CPU75=
.RES:Rescheduling_interrupts
>      611304 =C2=B1  2%     +10.2%     673860 =C2=B1  2%  interrupts.CPU76=
.LOC:Local_timer_interrupts
>        7476 =C2=B1  5%     +14.2%       8537 =C2=B1  5%  interrupts.CPU76=
.RES:Rescheduling_interrupts
>      611322 =C2=B1  2%     +10.2%     673834 =C2=B1  2%  interrupts.CPU77=
.LOC:Local_timer_interrupts
>        7670 =C2=B1  3%     +12.5%       8630 =C2=B1  5%  interrupts.CPU77=
.RES:Rescheduling_interrupts
>      611326 =C2=B1  2%     +10.2%     673851 =C2=B1  2%  interrupts.CPU78=
.LOC:Local_timer_interrupts
>        7417 =C2=B1  3%     +15.6%       8578 =C2=B1  4%  interrupts.CPU78=
.RES:Rescheduling_interrupts
>      611328 =C2=B1  2%     +10.2%     673820 =C2=B1  2%  interrupts.CPU79=
.LOC:Local_timer_interrupts
>        7545 =C2=B1  4%     +13.9%       8590 =C2=B1  4%  interrupts.CPU79=
.RES:Rescheduling_interrupts
>      611842 =C2=B1  2%     +10.1%     673928 =C2=B1  2%  interrupts.CPU8.=
LOC:Local_timer_interrupts
>        7673 =C2=B1  3%     +14.9%       8818 =C2=B1  4%  interrupts.CPU8.=
RES:Rescheduling_interrupts
>      611366 =C2=B1  2%     +10.2%     673868 =C2=B1  2%  interrupts.CPU80=
.LOC:Local_timer_interrupts
>        7513 =C2=B1  3%     +16.1%       8723 =C2=B1  5%  interrupts.CPU80=
.RES:Rescheduling_interrupts
>      611322 =C2=B1  2%     +10.2%     673860 =C2=B1  2%  interrupts.CPU81=
.LOC:Local_timer_interrupts
>      611299 =C2=B1  2%     +10.2%     673868 =C2=B1  2%  interrupts.CPU82=
.LOC:Local_timer_interrupts
>        7523 =C2=B1  4%     +13.8%       8562 =C2=B1  4%  interrupts.CPU82=
.RES:Rescheduling_interrupts
>      611320 =C2=B1  2%     +10.2%     673727 =C2=B1  2%  interrupts.CPU83=
.LOC:Local_timer_interrupts
>        7518 =C2=B1  5%     +12.4%       8454 =C2=B1  5%  interrupts.CPU83=
.RES:Rescheduling_interrupts
>      611326 =C2=B1  2%     +10.2%     673899 =C2=B1  2%  interrupts.CPU84=
.LOC:Local_timer_interrupts
>        7452 =C2=B1  6%     +12.3%       8365 =C2=B1  5%  interrupts.CPU84=
.RES:Rescheduling_interrupts
>      611329 =C2=B1  2%     +10.2%     673885 =C2=B1  2%  interrupts.CPU85=
.LOC:Local_timer_interrupts
>        7399 =C2=B1  5%     +11.1%       8218 =C2=B1  5%  interrupts.CPU85=
.RES:Rescheduling_interrupts
>      611278 =C2=B1  2%     +10.2%     673875 =C2=B1  2%  interrupts.CPU86=
.LOC:Local_timer_interrupts
>        7376 =C2=B1  4%     +16.3%       8581 =C2=B1  3%  interrupts.CPU86=
.RES:Rescheduling_interrupts
>      611313 =C2=B1  2%     +10.2%     673874 =C2=B1  2%  interrupts.CPU87=
.LOC:Local_timer_interrupts
>        7544 =C2=B1  4%     +12.8%       8508 =C2=B1  4%  interrupts.CPU87=
.RES:Rescheduling_interrupts
>      611351 =C2=B1  2%     +10.2%     673928 =C2=B1  2%  interrupts.CPU88=
.LOC:Local_timer_interrupts
>        7418 =C2=B1  6%     +13.3%       8406 =C2=B1  4%  interrupts.CPU88=
.RES:Rescheduling_interrupts
>      611324 =C2=B1  2%     +10.2%     673795 =C2=B1  2%  interrupts.CPU89=
.LOC:Local_timer_interrupts
>        7426 =C2=B1  4%     +13.6%       8439 =C2=B1  5%  interrupts.CPU89=
.RES:Rescheduling_interrupts
>      611832 =C2=B1  2%     +10.2%     673968 =C2=B1  2%  interrupts.CPU9.=
LOC:Local_timer_interrupts
>        7538 =C2=B1  3%     +15.6%       8715 =C2=B1  4%  interrupts.CPU9.=
RES:Rescheduling_interrupts
>      611298 =C2=B1  2%     +10.2%     673878 =C2=B1  2%  interrupts.CPU90=
.LOC:Local_timer_interrupts
>        7421 =C2=B1  3%     +12.7%       8363 =C2=B1  4%  interrupts.CPU90=
.RES:Rescheduling_interrupts
>      611305 =C2=B1  2%     +10.2%     673874 =C2=B1  2%  interrupts.CPU91=
.LOC:Local_timer_interrupts
>        7377 =C2=B1  5%     +15.6%       8528 =C2=B1  5%  interrupts.CPU91=
.RES:Rescheduling_interrupts
>      611288 =C2=B1  2%     +10.2%     673876 =C2=B1  2%  interrupts.CPU92=
.LOC:Local_timer_interrupts
>        7349 =C2=B1  4%     +12.0%       8234 =C2=B1  4%  interrupts.CPU92=
.RES:Rescheduling_interrupts
>      611329 =C2=B1  2%     +10.2%     673857 =C2=B1  2%  interrupts.CPU93=
.LOC:Local_timer_interrupts
>        7438 =C2=B1  3%     +14.7%       8530 =C2=B1  4%  interrupts.CPU93=
.RES:Rescheduling_interrupts
>      611276 =C2=B1  2%     +10.2%     673866 =C2=B1  2%  interrupts.CPU94=
.LOC:Local_timer_interrupts
>        7363 =C2=B1  4%     +12.7%       8300 =C2=B1  5%  interrupts.CPU94=
.RES:Rescheduling_interrupts
>      611381 =C2=B1  2%     +10.2%     673922 =C2=B1  2%  interrupts.CPU95=
.LOC:Local_timer_interrupts
>       10549 =C2=B1  3%     +14.9%      12117 =C2=B1  4%  interrupts.CPU95=
.RES:Rescheduling_interrupts
>      611824 =C2=B1  2%     +10.1%     673847 =C2=B1  2%  interrupts.CPU96=
.LOC:Local_timer_interrupts
>        7416 =C2=B1  3%     +12.9%       8375 =C2=B1  5%  interrupts.CPU96=
.RES:Rescheduling_interrupts
>      611751 =C2=B1  2%     +10.2%     673870 =C2=B1  2%  interrupts.CPU97=
.LOC:Local_timer_interrupts
>        7437 =C2=B1  4%     +14.0%       8477 =C2=B1  4%  interrupts.CPU97=
.RES:Rescheduling_interrupts
>      611787 =C2=B1  2%     +10.1%     673877 =C2=B1  2%  interrupts.CPU98=
.LOC:Local_timer_interrupts
>        7555 =C2=B1  4%     +13.0%       8534 =C2=B1  3%  interrupts.CPU98=
.RES:Rescheduling_interrupts
>      611783 =C2=B1  2%     +10.1%     673872 =C2=B1  2%  interrupts.CPU99=
.LOC:Local_timer_interrupts
>        7452 =C2=B1  3%     +12.8%       8404 =C2=B1  5%  interrupts.CPU99=
.RES:Rescheduling_interrupts
>   1.174e+08 =C2=B1  2%     +10.2%  1.294e+08 =C2=B1  2%  interrupts.LOC:L=
ocal_timer_interrupts
>     1433875 =C2=B1  3%     +14.6%    1643307 =C2=B1  3%  interrupts.RES:R=
escheduling_interrupts
> =

> =

>                                                                          =
        =

>                                    aim7.jobs-per-min
>                                                                          =
        =

>    30500 +---------------------------------------------------------------=
----+
>          |                               ..+....                         =
   .|
>    30000 |-+                       ......       ...                      =
... |
>    29500 |................   ......                ..                 ...=
    |
>          |                +..                        ...            ..   =
    |
>    29000 |-+                                            ...      ...     =
    |
>    28500 |-+                                               .  ...        =
    |
>          |                                                  +.           =
    |
>    28000 |-+              O                                 O            =
    |
>    27500 |-+                                                             =
    |
>          |                                                               =
    |
>    27000 |-+                                                             =
    |
>    26500 |-+                                                             =
    |
>          |                                 O                             =
    |
>    26000 +---------------------------------------------------------------=
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
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =


-- =

Zhengjun Xing
--===============4656403915504717603==--

