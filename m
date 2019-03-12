Content-Type: multipart/mixed; boundary="===============0740330413690902776=="
MIME-Version: 1.0
From: Qu Wenruo <wqu@suse.de>
To: lkp@lists.01.org
Subject: Re: [btrfs] 44fe89de7d: aim7.jobs-per-min -15.1% regression
Date: Tue, 12 Mar 2019 21:59:49 +0800
Message-ID: <307f0c16-ef39-416a-8625-eb010b6807e5@suse.de>
In-Reply-To: <20190312135044.GA2983@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0740330413690902776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2019/3/12 =E4=B8=8B=E5=8D=889:50, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -15.1% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: 44fe89de7d5157a4f31f13d94802c7619e23f462 ("btrfs: Do mandatory tr=
ee block check before submitting bio")

That commit will cause extra check before writing tree block back onto disk.

It's expected to cause regression for metadata heavy workload.

I'm more interesting if there is any new real world performance
regression like database or other more dedicated workload.

Thanks,
Qu

> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: aim7
> on test machine: 72 threads Intel(R) Xeon(R) Gold 6139 CPU @ 2.30GHz with=
 128G memory
> with following parameters:
> =

> 	disk: 4BRD_12G
> 	md: RAID0
> 	fs: btrfs
> 	test: sync_disk_rw
> 	load: 20
> 	cpufreq_governor: performance
> =

> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
------------------+
> | testcase: change | aim7: aim7.jobs-per-min -20.8% regression           =
                  |
> | test machine     | 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz=
 with 384G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                    |
> |                  | disk=3D4BRD_12G                                     =
                    |
> |                  | fs=3Dbtrfs                                          =
                    |
> |                  | load=3D20                                           =
                    |
> |                  | md=3DRAID0                                          =
                    |
> |                  | test=3Dsync_disk_rw                                 =
                    |
> +------------------+-----------------------------------------------------=
------------------+
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
testcase:
>   gcc-8/performance/4BRD_12G/btrfs/x86_64-rhel-7.6/20/RAID0/debian-x86_64=
-2018-04-03.cgz/lkp-skl-2sp7/sync_disk_rw/aim7
> =

> commit: =

>   a92e9c3a3c ("btrfs: extent_io: Handle error better in extent_writepages=
()")
>   44fe89de7d ("btrfs: Do mandatory tree block check before submitting bio=
")
> =

> a92e9c3a3cef4c0c 44fe89de7d5157a4f31f13d9480 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4           50%           2:4     dmesg.WARNING:at#for_ip_int=
errupt_entry/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>       1204           -15.1%       1022        aim7.jobs-per-min
>      99.66           +18.3%     117.93        aim7.time.elapsed_time
>      99.66           +18.3%     117.93        aim7.time.elapsed_time.max
>       3014 =C2=B1  2%      -3.1%       2921        aim7.time.minor_page_f=
aults
>  1.236e+09           +44.6%  1.787e+09 =C2=B1 27%  cpuidle.C1.time
>      90473           +15.8%     104758 =C2=B1  2%  meminfo.AnonHugePages
>     102742           -16.5%      85841 =C2=B1  2%  meminfo.max_used_kB
>      11.68            -1.8        9.85        mpstat.cpu.-1.sys%
>       0.07 =C2=B1  7%      -0.0        0.05 =C2=B1 17%  mpstat.cpu.-1.usr%
>     664.25 =C2=B1  4%     +18.1%     784.25 =C2=B1  6%  slabinfo.dmaengin=
e-unmap-16.active_objs
>     664.25 =C2=B1  4%     +18.1%     784.25 =C2=B1  6%  slabinfo.dmaengin=
e-unmap-16.num_objs
>      88.00            +2.3%      90.00        vmstat.cpu.id
>     346712           -15.5%     293086        vmstat.io.bo
>     558192           -15.4%     472096        vmstat.system.cs
>      88.42            +2.0%      90.19        iostat.cpu.idle
>      11.50           -15.3%       9.74        iostat.cpu.system
>      19892           -15.2%      16877        iostat.md0.w/s
>     451087           -15.4%     381436        iostat.md0.wkB/s
>     252.75 =C2=B1  2%     -19.8%     202.67 =C2=B1 16%  sched_debug.cfs_r=
q:/.removed.util_avg.max
>      57.62 =C2=B1  2%     +71.4%      98.79 =C2=B1 51%  sched_debug.cpu.c=
pu_load[1].max
>      47.75 =C2=B1 13%     +81.6%      86.71 =C2=B1 43%  sched_debug.cpu.c=
pu_load[2].max
>       7.35 =C2=B1 13%     -16.4%       6.14 =C2=B1  4%  sched_debug.cpu.c=
pu_load[4].avg
>     422.75           -14.3%     362.50        turbostat.Avg_MHz
>      14.00            -2.0       12.04        turbostat.Busy%
>   15068782           +15.6%   17424116 =C2=B1  2%  turbostat.IRQ
>     163.49            -2.2%     159.86        turbostat.PkgWatt
>     516444            +2.0%     526872        proc-vmstat.nr_active_file
>     890319            +1.4%     902554        proc-vmstat.nr_file_pages
>       4668            -1.7%       4591        proc-vmstat.nr_inactive_anon
>     516444            +2.0%     526872        proc-vmstat.nr_zone_active_=
file
>       4668            -1.7%       4591        proc-vmstat.nr_zone_inactiv=
e_anon
>     288573           +14.8%     331243        proc-vmstat.pgfault
>     716355            +7.5%     770096        proc-vmstat.pgfree
>   24648391           -12.7%   21521966 =C2=B1  5%  perf-stat.i.branch-mis=
ses
>      27.60            -1.9       25.66 =C2=B1  2%  perf-stat.i.cache-miss=
-rate%
>   33238901           -22.5%   25763877 =C2=B1  2%  perf-stat.i.cache-miss=
es
>  1.163e+08           -13.8%  1.002e+08 =C2=B1  3%  perf-stat.i.cache-refe=
rences
>     570181           -15.7%     480734        perf-stat.i.context-switches
>       4.53 =C2=B1  3%     -20.6%       3.60 =C2=B1  2%  perf-stat.i.cpi
>   3.02e+10           -14.5%  2.581e+10        perf-stat.i.cpu-cycles
>      12.93 =C2=B1 11%     -23.2%       9.92 =C2=B1  7%  perf-stat.i.cpu-m=
igrations
>   1.81e+09            +8.7%  1.968e+09 =C2=B1  3%  perf-stat.i.dTLB-loads
>  1.018e+09           +10.9%  1.129e+09        perf-stat.i.dTLB-stores
>    8329645           -15.2%    7063121        perf-stat.i.iTLB-loads
>  6.662e+09            +9.5%  7.297e+09        perf-stat.i.instructions
>      93411 =C2=B1  7%     +20.1%     112199 =C2=B1  6%  perf-stat.i.instr=
uctions-per-iTLB-miss
>       0.24 =C2=B1  4%     +21.3%       0.30        perf-stat.i.ipc
>       2719            -2.6%       2650        perf-stat.i.minor-faults
>   10179150           -22.8%    7861388 =C2=B1  2%  perf-stat.i.node-load-=
misses
>     819501           -18.0%     672068        perf-stat.i.node-loads
>      79.98            -3.6       76.35        perf-stat.i.node-store-miss=
-rate%
>    3971266           -23.9%    3020404        perf-stat.i.node-store-miss=
es
>     760058 =C2=B1  3%      -7.2%     705596        perf-stat.i.node-stores
>       2720            -2.6%       2650        perf-stat.i.page-faults
>      17.46           -21.4%      13.73 =C2=B1  2%  perf-stat.overall.MPKI
>       1.87            -0.3        1.59 =C2=B1  3%  perf-stat.overall.bran=
ch-miss-rate%
>      28.58            -2.8       25.75 =C2=B1  4%  perf-stat.overall.cach=
e-miss-rate%
>       4.53           -22.0%       3.54        perf-stat.overall.cpi
>     908.69           +10.3%       1002 =C2=B1  2%  perf-stat.overall.cycl=
es-between-cache-misses
>       0.22           +28.1%       0.28        perf-stat.overall.ipc
>      83.93            -2.9       81.06        perf-stat.overall.node-stor=
e-miss-rate%
>   24408968           -12.5%   21345782 =C2=B1  5%  perf-stat.ps.branch-mi=
sses
>   32896998           -22.4%   25539476 =C2=B1  2%  perf-stat.ps.cache-mis=
ses
>  1.151e+08           -13.7%   99343827 =C2=B1  3%  perf-stat.ps.cache-ref=
erences
>     564308           -15.6%     476544        perf-stat.ps.context-switch=
es
>  2.989e+10           -14.4%  2.558e+10        perf-stat.ps.cpu-cycles
>      12.79 =C2=B1 11%     -23.1%       9.84 =C2=B1  7%  perf-stat.ps.cpu-=
migrations
>  1.792e+09            +8.9%  1.951e+09 =C2=B1  3%  perf-stat.ps.dTLB-loads
>  1.008e+09           +11.1%   1.12e+09        perf-stat.ps.dTLB-stores
>    8244056           -15.1%    7001712        perf-stat.ps.iTLB-loads
>  6.595e+09            +9.7%  7.235e+09        perf-stat.ps.instructions
>       2693            -2.4%       2628        perf-stat.ps.minor-faults
>   10074272           -22.6%    7792778 =C2=B1  2%  perf-stat.ps.node-load=
-misses
>     811079           -17.9%     666222        perf-stat.ps.node-loads
>    3930342           -23.8%    2994037        perf-stat.ps.node-store-mis=
ses
>     752248 =C2=B1  3%      -7.0%     699463        perf-stat.ps.node-stor=
es
>       2693            -2.4%       2628        perf-stat.ps.page-faults
>    6.6e+11           +29.8%  8.564e+11        perf-stat.total.instructions
>      44.42            -3.1       41.36 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.start_s=
econdary
>      46.97            -2.2       44.77 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secondary.se=
condary_startup_64
>      50.60            -1.9       48.74 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.secondary_startup_64
>      49.88            -1.7       48.21 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>      49.90            -1.7       48.24 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>      49.90            -1.7       48.24 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64
>       4.89 =C2=B1 12%      -1.0        3.84 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.btrfs_search_slot.btrfs_lookup_file_extent.__btrfs_drop_ext=
ents.insert_reserved_file_extent.btrfs_finish_ordered_io
>       4.89 =C2=B1 12%      -1.0        3.84 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.btrfs_lookup_file_extent.__btrfs_drop_extents.insert_reserv=
ed_file_extent.btrfs_finish_ordered_io.normal_work_helper
>       5.75 =C2=B1  6%      -0.7        5.07 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search=
_slot.btrfs_lookup_file_extent.__btrfs_drop_extents
>       2.90 =C2=B1 11%      -0.6        2.30 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_fi=
le_extent.__btrfs_drop_extents.insert_reserved_file_extent
>       5.82 =C2=B1  2%      -0.5        5.35 =C2=B1  2%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.finish_wait.btrfs_tree_read_lock.btr=
fs_read_lock_root_node.btrfs_search_slot
>       1.78 =C2=B1 14%      -0.4        1.34 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_lookup_file_ex=
tent.__btrfs_drop_extents.insert_reserved_file_extent
>       4.25 =C2=B1  7%      -0.4        3.82        perf-profile.calltrace=
.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.btrfs_loo=
kup_file_extent.__btrfs_drop_extents
>       2.73 =C2=B1  7%      -0.3        2.43 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.prepare_to_wait_event.btrfs_tree_read_lock.btrfs_read_lock_=
root_node.btrfs_search_slot.btrfs_lookup_file_extent
>       8.78            -0.3        8.49 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.btrfs_tree_read_loc=
k.btrfs_read_lock_root_node.btrfs_search_slot
>       1.78 =C2=B1  8%      -0.3        1.52 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.finish_wait.btrfs_tree_read_lock.btrfs_read_lock_root_node.=
btrfs_search_slot.btrfs_lookup_file_extent
>       8.54            -0.3        8.28 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_=
to_wait_event.btrfs_tree_read_lock.btrfs_read_lock_root_node
>       2.15 =C2=B1  2%      -0.2        1.99 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.finish_wait.btrfs_tree_read_lock.btrfs_read_lock_root_node.=
btrfs_search_slot.btrfs_insert_empty_items
>       1.43            -0.1        1.36 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.finish_wait.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs=
_search_slot.btrfs_lookup_csum
>       1.02 =C2=B1  2%      -0.1        0.97        perf-profile.calltrace=
.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_csum_file_bloc=
ks.btrfs_log_changed_extents.btrfs_log_inode
>       1.02 =C2=B1  3%      -0.0        0.97        perf-profile.calltrace=
.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search_slot=
.btrfs_csum_file_blocks.btrfs_log_changed_extents
>       0.95 =C2=B1  5%      +0.2        1.11 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.__extent_writepage.extent_write_cache_pages.extent_writepag=
es.do_writepages.__filemap_fdatawrite_range
>       1.12 =C2=B1  2%      +0.2        1.32 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.osq_lock.__mutex_lock.wait_log_commit.btrfs_sync_log.btrfs_=
sync_file
>       1.05 =C2=B1  3%      +0.2        1.24 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.extent_write_cache_pages.extent_writepages.do_writepages.__=
filemap_fdatawrite_range.btrfs_fdatawrite_range
>       1.25 =C2=B1  2%      +0.2        1.46 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__mutex_lock.wait_log_commit.btrfs_sync_log.btrfs_sync_file=
.btrfs_file_write_iter
>       0.68 =C2=B1  6%      +0.2        0.92 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_se=
condary
>       1.45 =C2=B1  2%      +0.2        1.70 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.wait_log_commit.btrfs_sync_log.btrfs_sync_file.btrfs_file_w=
rite_iter.__vfs_write
>       0.84 =C2=B1 13%      +0.3        1.10 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secon=
dary_startup_64
>       0.70 =C2=B1  6%      +0.3        0.95 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64
>       0.25 =C2=B1100%      +0.3        0.56 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.btrfs_map_bio.btree_submit_bio_hook.submit_one_bio.btree_wr=
ite_cache_pages.do_writepages
>       1.55 =C2=B1  2%      +0.3        1.87 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.do_writepages.__filemap_fdatawrite_range.btrfs_fdatawrite_r=
ange.start_ordered_ops.btrfs_sync_file
>       1.55 =C2=B1  2%      +0.3        1.87 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.extent_writepages.do_writepages.__filemap_fdatawrite_range.=
btrfs_fdatawrite_range.start_ordered_ops
>       1.57 =C2=B1  2%      +0.3        1.89 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.start_ordered_ops.btrfs_sync_file.btrfs_file_write_iter.__v=
fs_write.vfs_write
>       1.56 =C2=B1  2%      +0.3        1.88 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__filemap_fdatawrite_range.btrfs_fdatawrite_range.start_ord=
ered_ops.btrfs_sync_file.btrfs_file_write_iter
>       1.56 =C2=B1  2%      +0.3        1.88 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.btrfs_fdatawrite_range.start_ordered_ops.btrfs_sync_file.bt=
rfs_file_write_iter.__vfs_write
>       0.26 =C2=B1100%      +0.4        0.62 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.submit_one_bio.extent_writepages.do_writepages.__filemap_fd=
atawrite_range.btrfs_fdatawrite_range
>       0.26 =C2=B1100%      +0.4        0.62 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.btrfs_submit_bio_hook.submit_one_bio.extent_writepages.do_w=
ritepages.__filemap_fdatawrite_range
>       0.00            +0.6        0.56 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.submit_bio.btrfs_map_bio.btree_submit_bio_hook.submit_one_bio.bt=
ree_write_cache_pages
>       0.00            +0.6        0.56 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.generic_make_request.submit_bio.btrfs_map_bio.btree_submit_bio_h=
ook.submit_one_bio
>       0.00            +0.6        0.58 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.btrfs_map_bio.btrfs_submit_bio_hook.submit_one_bio.extent_writep=
ages.do_writepages
>       0.19 =C2=B1173%      +0.6        0.78 =C2=B1 27%  perf-profile.call=
trace.cycles-pp.btrfs_next_old_leaf.btrfs_csum_file_blocks.btrfs_log_change=
d_extents.btrfs_log_inode.btrfs_log_inode_parent
>       0.00            +0.8        0.84 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.btrfs_get_token_32.check_leaf.csum_tree_block.btree_csum_one_bio=
.btree_submit_bio_hook
>       0.00            +1.3        1.32 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.check_leaf.csum_tree_block.btree_csum_one_bio.btree_submit_bio_h=
ook.submit_one_bio
>       0.00            +1.4        1.39 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.csum_tree_block.btree_csum_one_bio.btree_submit_bio_hook.submit_=
one_bio.btree_write_cache_pages
>       0.00            +1.4        1.39 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.btree_csum_one_bio.btree_submit_bio_hook.submit_one_bio.btree_wr=
ite_cache_pages.do_writepages
>       0.75 =C2=B1  4%      +1.5        2.23 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.btree_write_cache_pages.do_writepages.__filemap_fdatawrite_=
range.btrfs_write_marked_extents.btrfs_sync_log
>       0.76 =C2=B1  3%      +1.5        2.24 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.btrfs_write_marked_extents.btrfs_sync_log.btrfs_sync_file.b=
trfs_file_write_iter.__vfs_write
>       0.75 =C2=B1  4%      +1.5        2.23 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs=
_sync_log.btrfs_sync_file.btrfs_file_write_iter
>       0.75 =C2=B1  4%      +1.5        2.23 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.do_writepages.__filemap_fdatawrite_range.btrfs_write_marked=
_extents.btrfs_sync_log.btrfs_sync_file
>       0.38 =C2=B1 57%      +1.6        1.96 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.btree_submit_bio_hook.submit_one_bio.btree_write_cache_page=
s.do_writepages.__filemap_fdatawrite_range
>       0.38 =C2=B1 57%      +1.6        1.96 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.submit_one_bio.btree_write_cache_pages.do_writepages.__file=
map_fdatawrite_range.btrfs_write_marked_extents
>       2.42 =C2=B1  2%      +1.8        4.18 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.btrfs_sync_log.btrfs_sync_file.btrfs_file_write_iter.__vfs_=
write.vfs_write
>      38.62            +2.5       41.15 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.btrfs_sync_file.btrfs_file_write_iter.__vfs_write.vfs_write.ksys=
_write
>      39.95            +2.6       42.52 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.__vfs_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
>      39.95            +2.6       42.52 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.btrfs_file_write_iter.__vfs_write.vfs_write.ksys_write.do_syscal=
l_64
>      39.99            +2.6       42.56 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      39.98            +2.6       42.55 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      40.19            +2.6       42.81 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>      40.19            +2.6       42.81 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      97.75 =C2=B1 21%     +77.5%     173.50 =C2=B1 21%  interrupts.70:PCI=
-MSI.12589059-edge.eth3-TxRx-2
>      63.25 =C2=B1  9%     +51.4%      95.75 =C2=B1 25%  interrupts.71:PCI=
-MSI.12589060-edge.eth3-TxRx-3
>     202.50           +17.8%     238.50        interrupts.9:IO-APIC.9-fast=
eoi.acpi
>      88724           +12.8%     100056        interrupts.CAL:Function_cal=
l_interrupts
>       1255           +12.4%       1410        interrupts.CPU0.CAL:Functio=
n_call_interrupts
>     201136           +17.1%     235497 =C2=B1  2%  interrupts.CPU0.LOC:Lo=
cal_timer_interrupts
>     202.50           +17.8%     238.50        interrupts.CPU1.9:IO-APIC.9=
-fasteoi.acpi
>       1242           +13.2%       1407        interrupts.CPU1.CAL:Functio=
n_call_interrupts
>     200860           +16.6%     234199 =C2=B1  2%  interrupts.CPU1.LOC:Lo=
cal_timer_interrupts
>       3195 =C2=B1 24%     -60.2%       1273 =C2=B1 95%  interrupts.CPU1.N=
MI:Non-maskable_interrupts
>       3195 =C2=B1 24%     -60.2%       1273 =C2=B1 95%  interrupts.CPU1.P=
MI:Performance_monitoring_interrupts
>     200768           +16.8%     234566        interrupts.CPU10.LOC:Local_=
timer_interrupts
>     200322           +17.1%     234482 =C2=B1  2%  interrupts.CPU11.LOC:L=
ocal_timer_interrupts
>       1174 =C2=B1 11%     +18.3%       1389        interrupts.CPU12.CAL:F=
unction_call_interrupts
>     200965           +16.4%     233853        interrupts.CPU12.LOC:Local_=
timer_interrupts
>       1209 =C2=B1  4%     +15.4%       1396        interrupts.CPU13.CAL:F=
unction_call_interrupts
>     199915           +17.6%     235085 =C2=B1  2%  interrupts.CPU13.LOC:L=
ocal_timer_interrupts
>       1187 =C2=B1  8%     +18.1%       1403        interrupts.CPU14.CAL:F=
unction_call_interrupts
>     200677           +17.2%     235290 =C2=B1  2%  interrupts.CPU14.LOC:L=
ocal_timer_interrupts
>       1208 =C2=B1  5%     +13.2%       1367 =C2=B1  4%  interrupts.CPU15.=
CAL:Function_call_interrupts
>     200566           +17.3%     235226 =C2=B1  2%  interrupts.CPU15.LOC:L=
ocal_timer_interrupts
>     200800           +17.1%     235099 =C2=B1  2%  interrupts.CPU16.LOC:L=
ocal_timer_interrupts
>       1217 =C2=B1  4%     +15.3%       1403        interrupts.CPU17.CAL:F=
unction_call_interrupts
>     200473           +16.6%     233816        interrupts.CPU17.LOC:Local_=
timer_interrupts
>       1246           +12.8%       1406        interrupts.CPU18.CAL:Functi=
on_call_interrupts
>     200863           +16.4%     233829 =C2=B1  3%  interrupts.CPU18.LOC:L=
ocal_timer_interrupts
>       1243           +12.7%       1400        interrupts.CPU19.CAL:Functi=
on_call_interrupts
>     200576           +16.0%     232732 =C2=B1  2%  interrupts.CPU19.LOC:L=
ocal_timer_interrupts
>       1247           +12.9%       1407        interrupts.CPU2.CAL:Functio=
n_call_interrupts
>     200971           +16.9%     234895 =C2=B1  2%  interrupts.CPU2.LOC:Lo=
cal_timer_interrupts
>       1247           +12.7%       1406        interrupts.CPU20.CAL:Functi=
on_call_interrupts
>     200473           +16.6%     233803 =C2=B1  3%  interrupts.CPU20.LOC:L=
ocal_timer_interrupts
>       1247           +12.6%       1404        interrupts.CPU21.CAL:Functi=
on_call_interrupts
>     200696           +16.2%     233299 =C2=B1  2%  interrupts.CPU21.LOC:L=
ocal_timer_interrupts
>       1247           +13.1%       1411        interrupts.CPU22.CAL:Functi=
on_call_interrupts
>     200814           +16.4%     233758 =C2=B1  3%  interrupts.CPU22.LOC:L=
ocal_timer_interrupts
>       4891 =C2=B1 12%     -24.7%       3681 =C2=B1 12%  interrupts.CPU22.=
RES:Rescheduling_interrupts
>       1247           +13.0%       1410        interrupts.CPU23.CAL:Functi=
on_call_interrupts
>     200828           +16.4%     233716 =C2=B1  3%  interrupts.CPU23.LOC:L=
ocal_timer_interrupts
>       1247           +14.3%       1426 =C2=B1  3%  interrupts.CPU24.CAL:F=
unction_call_interrupts
>     200833           +16.5%     233997 =C2=B1  3%  interrupts.CPU24.LOC:L=
ocal_timer_interrupts
>       1246           +12.9%       1407        interrupts.CPU25.CAL:Functi=
on_call_interrupts
>     201055           +16.3%     233920 =C2=B1  3%  interrupts.CPU25.LOC:L=
ocal_timer_interrupts
>       1265 =C2=B1  2%     +12.7%       1425 =C2=B1  2%  interrupts.CPU26.=
CAL:Function_call_interrupts
>     201132           +15.9%     233180 =C2=B1  3%  interrupts.CPU26.LOC:L=
ocal_timer_interrupts
>       1173 =C2=B1 10%     +20.0%       1407        interrupts.CPU27.CAL:F=
unction_call_interrupts
>     201166           +15.9%     233210 =C2=B1  3%  interrupts.CPU27.LOC:L=
ocal_timer_interrupts
>       1263 =C2=B1  2%     +11.4%       1407        interrupts.CPU28.CAL:F=
unction_call_interrupts
>     201049           +16.3%     233848 =C2=B1  3%  interrupts.CPU28.LOC:L=
ocal_timer_interrupts
>       1241           +13.5%       1409        interrupts.CPU29.CAL:Functi=
on_call_interrupts
>     200963           +16.3%     233774 =C2=B1  3%  interrupts.CPU29.LOC:L=
ocal_timer_interrupts
>      97.75 =C2=B1 21%     +77.5%     173.50 =C2=B1 21%  interrupts.CPU3.7=
0:PCI-MSI.12589059-edge.eth3-TxRx-2
>       1210 =C2=B1  5%     +13.2%       1369 =C2=B1  3%  interrupts.CPU3.C=
AL:Function_call_interrupts
>     199954           +17.1%     234167 =C2=B1  2%  interrupts.CPU3.LOC:Lo=
cal_timer_interrupts
>       1181 =C2=B1  9%     +19.1%       1407        interrupts.CPU30.CAL:F=
unction_call_interrupts
>     200986           +16.4%     233892 =C2=B1  3%  interrupts.CPU30.LOC:L=
ocal_timer_interrupts
>       1127 =C2=B1 18%     +24.7%       1406        interrupts.CPU31.CAL:F=
unction_call_interrupts
>     201110           +16.2%     233756 =C2=B1  3%  interrupts.CPU31.LOC:L=
ocal_timer_interrupts
>       1249           +13.0%       1412        interrupts.CPU32.CAL:Functi=
on_call_interrupts
>     200832           +16.4%     233787 =C2=B1  3%  interrupts.CPU32.LOC:L=
ocal_timer_interrupts
>       1249           +13.3%       1416        interrupts.CPU33.CAL:Functi=
on_call_interrupts
>     200969           +16.3%     233758 =C2=B1  3%  interrupts.CPU33.LOC:L=
ocal_timer_interrupts
>       1246           +13.4%       1413        interrupts.CPU34.CAL:Functi=
on_call_interrupts
>     199891           +17.1%     234012 =C2=B1  3%  interrupts.CPU34.LOC:L=
ocal_timer_interrupts
>       1234           +13.3%       1399        interrupts.CPU35.CAL:Functi=
on_call_interrupts
>     200721           +16.2%     233256 =C2=B1  2%  interrupts.CPU35.LOC:L=
ocal_timer_interrupts
>       3994 =C2=B1 14%     -50.7%       1970 =C2=B1 48%  interrupts.CPU35.=
RES:Rescheduling_interrupts
>       1242           +12.9%       1402 =C2=B1  2%  interrupts.CPU36.CAL:F=
unction_call_interrupts
>     199765           +17.7%     235071 =C2=B1  2%  interrupts.CPU36.LOC:L=
ocal_timer_interrupts
>     200843           +16.6%     234175 =C2=B1  2%  interrupts.CPU37.LOC:L=
ocal_timer_interrupts
>       1248           +13.4%       1415        interrupts.CPU38.CAL:Functi=
on_call_interrupts
>     200016           +17.0%     234095 =C2=B1  2%  interrupts.CPU38.LOC:L=
ocal_timer_interrupts
>       1249           +13.0%       1411        interrupts.CPU39.CAL:Functi=
on_call_interrupts
>     200714           +17.2%     235250 =C2=B1  2%  interrupts.CPU39.LOC:L=
ocal_timer_interrupts
>      63.25 =C2=B1  9%     +51.4%      95.75 =C2=B1 25%  interrupts.CPU4.7=
1:PCI-MSI.12589060-edge.eth3-TxRx-3
>       1246           +13.9%       1419 =C2=B1  2%  interrupts.CPU4.CAL:Fu=
nction_call_interrupts
>     200637           +17.2%     235179 =C2=B1  2%  interrupts.CPU4.LOC:Lo=
cal_timer_interrupts
>     200593           +17.2%     235093 =C2=B1  2%  interrupts.CPU40.LOC:L=
ocal_timer_interrupts
>       1248           +13.0%       1410        interrupts.CPU41.CAL:Functi=
on_call_interrupts
>     200998           +16.6%     234380        interrupts.CPU41.LOC:Local_=
timer_interrupts
>       1249           +12.9%       1410        interrupts.CPU42.CAL:Functi=
on_call_interrupts
>     200934           +16.6%     234357        interrupts.CPU42.LOC:Local_=
timer_interrupts
>       1246           +13.2%       1411        interrupts.CPU43.CAL:Functi=
on_call_interrupts
>     200894           +16.9%     234942 =C2=B1  2%  interrupts.CPU43.LOC:L=
ocal_timer_interrupts
>       1211 =C2=B1  5%     +16.3%       1408        interrupts.CPU44.CAL:F=
unction_call_interrupts
>     200154           +17.4%     235070 =C2=B1  2%  interrupts.CPU44.LOC:L=
ocal_timer_interrupts
>       2454 =C2=B1 23%     +50.0%       3682 =C2=B1 14%  interrupts.CPU44.=
RES:Rescheduling_interrupts
>       1248           +13.0%       1410        interrupts.CPU45.CAL:Functi=
on_call_interrupts
>     200774           +16.7%     234259 =C2=B1  2%  interrupts.CPU45.LOC:L=
ocal_timer_interrupts
>       1246           +13.1%       1410        interrupts.CPU46.CAL:Functi=
on_call_interrupts
>     201184           +16.8%     234966 =C2=B1  2%  interrupts.CPU46.LOC:L=
ocal_timer_interrupts
>       1246           +13.1%       1409        interrupts.CPU47.CAL:Functi=
on_call_interrupts
>     200672           +16.7%     234200        interrupts.CPU47.LOC:Local_=
timer_interrupts
>     200070           +17.7%     235463 =C2=B1  2%  interrupts.CPU48.LOC:L=
ocal_timer_interrupts
>       1251           +12.6%       1409        interrupts.CPU49.CAL:Functi=
on_call_interrupts
>     200232           +17.4%     235071 =C2=B1  2%  interrupts.CPU49.LOC:L=
ocal_timer_interrupts
>     200450           +17.4%     235328 =C2=B1  2%  interrupts.CPU5.LOC:Lo=
cal_timer_interrupts
>       1216 =C2=B1  5%     +15.7%       1407        interrupts.CPU50.CAL:F=
unction_call_interrupts
>     201051           +16.5%     234316        interrupts.CPU50.LOC:Local_=
timer_interrupts
>       1252           +12.6%       1410        interrupts.CPU51.CAL:Functi=
on_call_interrupts
>     200007           +17.5%     235046 =C2=B1  2%  interrupts.CPU51.LOC:L=
ocal_timer_interrupts
>       1253           +12.4%       1408        interrupts.CPU52.CAL:Functi=
on_call_interrupts
>     200770           +17.0%     234811 =C2=B1  2%  interrupts.CPU52.LOC:L=
ocal_timer_interrupts
>       1252           +12.2%       1405        interrupts.CPU53.CAL:Functi=
on_call_interrupts
>     200095           +17.4%     235004 =C2=B1  2%  interrupts.CPU53.LOC:L=
ocal_timer_interrupts
>       1252           +12.6%       1410        interrupts.CPU54.CAL:Functi=
on_call_interrupts
>     200697           +16.5%     233818 =C2=B1  3%  interrupts.CPU54.LOC:L=
ocal_timer_interrupts
>       1252           +12.6%       1409        interrupts.CPU55.CAL:Functi=
on_call_interrupts
>     200852           +16.5%     234024 =C2=B1  3%  interrupts.CPU55.LOC:L=
ocal_timer_interrupts
>       1251           +12.5%       1407        interrupts.CPU56.CAL:Functi=
on_call_interrupts
>     200874           +16.4%     233828 =C2=B1  3%  interrupts.CPU56.LOC:L=
ocal_timer_interrupts
>       1251           +12.3%       1404        interrupts.CPU57.CAL:Functi=
on_call_interrupts
>     200887           +16.5%     233974 =C2=B1  3%  interrupts.CPU57.LOC:L=
ocal_timer_interrupts
>       1250           +12.8%       1411        interrupts.CPU58.CAL:Functi=
on_call_interrupts
>     200837           +16.4%     233702 =C2=B1  3%  interrupts.CPU58.LOC:L=
ocal_timer_interrupts
>       1250           +12.8%       1410        interrupts.CPU59.CAL:Functi=
on_call_interrupts
>     199809           +17.1%     233932 =C2=B1  3%  interrupts.CPU59.LOC:L=
ocal_timer_interrupts
>       1262 =C2=B1  2%     +10.5%       1394        interrupts.CPU6.CAL:Fu=
nction_call_interrupts
>     201108           +16.6%     234545        interrupts.CPU6.LOC:Local_t=
imer_interrupts
>       1253           +12.6%       1411        interrupts.CPU60.CAL:Functi=
on_call_interrupts
>     200941           +16.4%     233857 =C2=B1  3%  interrupts.CPU60.LOC:L=
ocal_timer_interrupts
>       2285 =C2=B1 53%     -55.3%       1021 =C2=B1 85%  interrupts.CPU60.=
NMI:Non-maskable_interrupts
>       2285 =C2=B1 53%     -55.3%       1021 =C2=B1 85%  interrupts.CPU60.=
PMI:Performance_monitoring_interrupts
>       1213 =C2=B1  4%     +16.2%       1410        interrupts.CPU61.CAL:F=
unction_call_interrupts
>     200849           +16.4%     233812 =C2=B1  3%  interrupts.CPU61.LOC:L=
ocal_timer_interrupts
>       1250           +12.7%       1408        interrupts.CPU62.CAL:Functi=
on_call_interrupts
>     200858           +16.4%     233847 =C2=B1  3%  interrupts.CPU62.LOC:L=
ocal_timer_interrupts
>       1249           +12.7%       1408        interrupts.CPU63.CAL:Functi=
on_call_interrupts
>     200846           +16.3%     233509 =C2=B1  3%  interrupts.CPU63.LOC:L=
ocal_timer_interrupts
>       1249           +12.6%       1407        interrupts.CPU64.CAL:Functi=
on_call_interrupts
>     201010           +16.3%     233868 =C2=B1  3%  interrupts.CPU64.LOC:L=
ocal_timer_interrupts
>       1249           +12.6%       1407        interrupts.CPU65.CAL:Functi=
on_call_interrupts
>     201188           +16.2%     233840 =C2=B1  3%  interrupts.CPU65.LOC:L=
ocal_timer_interrupts
>       1249           +12.6%       1405        interrupts.CPU66.CAL:Functi=
on_call_interrupts
>     201142           +16.3%     233885 =C2=B1  3%  interrupts.CPU66.LOC:L=
ocal_timer_interrupts
>       1249           +12.6%       1406        interrupts.CPU67.CAL:Functi=
on_call_interrupts
>     200840           +16.5%     233913 =C2=B1  3%  interrupts.CPU67.LOC:L=
ocal_timer_interrupts
>       1249           +12.7%       1408        interrupts.CPU68.CAL:Functi=
on_call_interrupts
>     200815           +16.4%     233774 =C2=B1  3%  interrupts.CPU68.LOC:L=
ocal_timer_interrupts
>       1249           +12.8%       1409        interrupts.CPU69.CAL:Functi=
on_call_interrupts
>     200983           +16.3%     233829 =C2=B1  3%  interrupts.CPU69.LOC:L=
ocal_timer_interrupts
>     200912           +17.1%     235169 =C2=B1  2%  interrupts.CPU7.LOC:Lo=
cal_timer_interrupts
>       1249           +13.0%       1412        interrupts.CPU70.CAL:Functi=
on_call_interrupts
>     200821           +16.4%     233823 =C2=B1  3%  interrupts.CPU70.LOC:L=
ocal_timer_interrupts
>       1247           +12.9%       1408        interrupts.CPU71.CAL:Functi=
on_call_interrupts
>     200673           +16.4%     233586 =C2=B1  3%  interrupts.CPU71.LOC:L=
ocal_timer_interrupts
>       3112 =C2=B1 28%     -55.8%       1376 =C2=B1 92%  interrupts.CPU71.=
NMI:Non-maskable_interrupts
>       3112 =C2=B1 28%     -55.8%       1376 =C2=B1 92%  interrupts.CPU71.=
PMI:Performance_monitoring_interrupts
>       2655 =C2=B1 18%     +53.3%       4071 =C2=B1 21%  interrupts.CPU71.=
RES:Rescheduling_interrupts
>       1088 =C2=B1 16%     +25.1%       1361 =C2=B1  4%  interrupts.CPU8.C=
AL:Function_call_interrupts
>     201291           +16.9%     235317 =C2=B1  2%  interrupts.CPU8.LOC:Lo=
cal_timer_interrupts
>     201246           +16.4%     234250        interrupts.CPU9.LOC:Local_t=
imer_interrupts
>   14452726           +16.7%   16865906 =C2=B1  2%  interrupts.LOC:Local_t=
imer_interrupts
>      25553 =C2=B1  7%     +26.4%      32295        softirqs.CPU0.RCU
>      17578           +14.6%      20147 =C2=B1  2%  softirqs.CPU0.SCHED
>      40851           +20.4%      49167 =C2=B1  3%  softirqs.CPU0.TIMER
>      40546           +17.0%      47455 =C2=B1  5%  softirqs.CPU1.TIMER
>      25814           +27.1%      32807 =C2=B1 10%  softirqs.CPU10.RCU
>      38717 =C2=B1  2%     +14.6%      44386 =C2=B1  5%  softirqs.CPU10.TI=
MER
>      38245           +16.3%      44468 =C2=B1  5%  softirqs.CPU11.TIMER
>      26439 =C2=B1  4%     +21.3%      32083 =C2=B1  4%  softirqs.CPU12.RCU
>      15582 =C2=B1  4%     +14.4%      17827 =C2=B1  2%  softirqs.CPU12.SC=
HED
>      38686           +17.5%      45474 =C2=B1  4%  softirqs.CPU12.TIMER
>      25962 =C2=B1  4%     +18.3%      30720 =C2=B1  4%  softirqs.CPU13.RCU
>      16126 =C2=B1  5%     +17.9%      19013 =C2=B1  5%  softirqs.CPU13.SC=
HED
>      25846 =C2=B1  2%     +20.4%      31108 =C2=B1  5%  softirqs.CPU14.RCU
>      15629 =C2=B1  4%     +21.3%      18953 =C2=B1  6%  softirqs.CPU14.SC=
HED
>      37591           +17.9%      44326 =C2=B1  5%  softirqs.CPU14.TIMER
>      24676 =C2=B1  2%     +20.2%      29658        softirqs.CPU15.RCU
>      38217           +16.0%      44331 =C2=B1  4%  softirqs.CPU15.TIMER
>      24680 =C2=B1  2%     +18.6%      29278 =C2=B1  5%  softirqs.CPU16.RCU
>      38783           +17.9%      45709 =C2=B1  4%  softirqs.CPU16.TIMER
>      24738           +20.6%      29833 =C2=B1 10%  softirqs.CPU17.RCU
>      39088           +16.3%      45476 =C2=B1  5%  softirqs.CPU17.TIMER
>      27971           +24.7%      34880 =C2=B1  4%  softirqs.CPU18.RCU
>      27800           +19.7%      33276 =C2=B1  2%  softirqs.CPU19.RCU
>      16069 =C2=B1  5%     +14.6%      18417 =C2=B1  3%  softirqs.CPU19.SC=
HED
>      39339           +18.2%      46516 =C2=B1  5%  softirqs.CPU19.TIMER
>      26084           +10.4%      28804 =C2=B1  5%  softirqs.CPU2.RCU
>      16601 =C2=B1  8%     +15.0%      19085 =C2=B1 10%  softirqs.CPU2.SCH=
ED
>      38625           +22.4%      47291 =C2=B1  5%  softirqs.CPU2.TIMER
>      27472           +27.0%      34877 =C2=B1  7%  softirqs.CPU20.RCU
>      16088 =C2=B1  3%     +10.7%      17811 =C2=B1  4%  softirqs.CPU20.SC=
HED
>      38845           +17.6%      45674 =C2=B1  3%  softirqs.CPU20.TIMER
>      28205 =C2=B1  6%     +20.2%      33906 =C2=B1  7%  softirqs.CPU21.RCU
>      39324           +13.8%      44753 =C2=B1  4%  softirqs.CPU21.TIMER
>      27282 =C2=B1  9%     +20.0%      32736 =C2=B1  4%  softirqs.CPU22.RCU
>      39542           +13.9%      45038 =C2=B1  3%  softirqs.CPU22.TIMER
>      27295 =C2=B1  7%     +22.3%      33387 =C2=B1  2%  softirqs.CPU23.RCU
>      15694 =C2=B1  3%     +13.2%      17772 =C2=B1  3%  softirqs.CPU23.SC=
HED
>      37452           +16.5%      43645 =C2=B1  5%  softirqs.CPU23.TIMER
>      25529 =C2=B1 10%     +30.1%      33204        softirqs.CPU24.RCU
>      16068 =C2=B1  6%     +13.8%      18289 =C2=B1  4%  softirqs.CPU24.SC=
HED
>      39129           +29.4%      50648 =C2=B1 17%  softirqs.CPU24.TIMER
>      27444 =C2=B1  3%     +18.3%      32463 =C2=B1  4%  softirqs.CPU25.RCU
>      38658           +14.6%      44286 =C2=B1  6%  softirqs.CPU25.TIMER
>      27586 =C2=B1  2%     +21.4%      33496        softirqs.CPU26.RCU
>      39631           +13.9%      45136 =C2=B1  4%  softirqs.CPU26.TIMER
>      27618 =C2=B1  3%     +15.9%      32011 =C2=B1  2%  softirqs.CPU27.RCU
>      26884           +24.1%      33355 =C2=B1  7%  softirqs.CPU28.RCU
>      39120           +14.6%      44813 =C2=B1  5%  softirqs.CPU28.TIMER
>      27542 =C2=B1  4%     +21.4%      33433 =C2=B1  5%  softirqs.CPU29.RCU
>      38659 =C2=B1  2%     +15.9%      44815 =C2=B1  5%  softirqs.CPU29.TI=
MER
>      27539 =C2=B1  3%     +14.2%      31446        softirqs.CPU3.RCU
>      16465 =C2=B1  4%     +16.6%      19192 =C2=B1  6%  softirqs.CPU3.SCH=
ED
>      38875           +17.9%      45849 =C2=B1  5%  softirqs.CPU3.TIMER
>      26139           +23.5%      32277 =C2=B1  4%  softirqs.CPU30.RCU
>      39666           +11.6%      44285 =C2=B1  5%  softirqs.CPU30.TIMER
>      26559 =C2=B1  2%     +23.7%      32855 =C2=B1  8%  softirqs.CPU31.RCU
>      16278 =C2=B1  2%     +19.3%      19420 =C2=B1 10%  softirqs.CPU31.SC=
HED
>      39178           +15.2%      45121 =C2=B1  4%  softirqs.CPU31.TIMER
>      25781           +20.9%      31163 =C2=B1  2%  softirqs.CPU32.RCU
>      37670           +13.6%      42811 =C2=B1  5%  softirqs.CPU32.TIMER
>      27107 =C2=B1  5%     +16.7%      31625 =C2=B1  4%  softirqs.CPU33.RCU
>      16098 =C2=B1  2%     +12.3%      18071 =C2=B1  2%  softirqs.CPU33.SC=
HED
>      38565           +15.6%      44572 =C2=B1  4%  softirqs.CPU33.TIMER
>      26241 =C2=B1  3%     +18.9%      31209 =C2=B1  5%  softirqs.CPU34.RCU
>      38223           +18.1%      45160 =C2=B1  5%  softirqs.CPU34.TIMER
>      25360 =C2=B1  6%     +27.0%      32210 =C2=B1  2%  softirqs.CPU35.RCU
>      39986 =C2=B1  2%     +13.8%      45494 =C2=B1  3%  softirqs.CPU35.TI=
MER
>      26626 =C2=B1  2%     +23.9%      32987 =C2=B1  4%  softirqs.CPU36.RCU
>      16281 =C2=B1  5%     +12.6%      18329        softirqs.CPU36.SCHED
>      27227           +23.8%      33703 =C2=B1  2%  softirqs.CPU37.RCU
>      26701 =C2=B1  2%     +29.1%      34462 =C2=B1  8%  softirqs.CPU38.RCU
>      15157 =C2=B1  5%     +15.5%      17507 =C2=B1  4%  softirqs.CPU38.SC=
HED
>      37119 =C2=B1  4%     +37.9%      51191 =C2=B1 27%  softirqs.CPU38.TI=
MER
>      28007 =C2=B1  2%     +21.4%      33990 =C2=B1  2%  softirqs.CPU39.RCU
>      15700 =C2=B1  2%     +11.8%      17545 =C2=B1  3%  softirqs.CPU39.SC=
HED
>      37509 =C2=B1  2%     +14.9%      43109 =C2=B1  6%  softirqs.CPU39.TI=
MER
>      25877           +24.6%      32254 =C2=B1  3%  softirqs.CPU4.RCU
>      38648           +16.9%      45191 =C2=B1  5%  softirqs.CPU4.TIMER
>      27903           +17.8%      32867 =C2=B1  2%  softirqs.CPU40.RCU
>      15256 =C2=B1  2%     +12.8%      17202 =C2=B1  7%  softirqs.CPU40.SC=
HED
>      36371 =C2=B1  2%     +17.0%      42572 =C2=B1  4%  softirqs.CPU40.TI=
MER
>      26560 =C2=B1  5%     +19.9%      31840 =C2=B1  6%  softirqs.CPU41.RCU
>      15067 =C2=B1  3%     +13.8%      17142 =C2=B1  4%  softirqs.CPU41.SC=
HED
>      36473 =C2=B1  3%     +14.2%      41657 =C2=B1  4%  softirqs.CPU41.TI=
MER
>      27250           +22.5%      33387 =C2=B1  2%  softirqs.CPU42.RCU
>      15376 =C2=B1  4%     +15.4%      17744 =C2=B1  3%  softirqs.CPU42.SC=
HED
>      37838           +13.4%      42895 =C2=B1  3%  softirqs.CPU42.TIMER
>      27137 =C2=B1  4%     +23.2%      33425        softirqs.CPU43.RCU
>      27818 =C2=B1  3%     +22.5%      34073 =C2=B1  6%  softirqs.CPU44.RCU
>      14305 =C2=B1  4%     +22.5%      17522 =C2=B1  2%  softirqs.CPU44.SC=
HED
>      36151 =C2=B1  4%     +16.7%      42187 =C2=B1  4%  softirqs.CPU44.TI=
MER
>      25734 =C2=B1  3%     +25.6%      32319 =C2=B1  4%  softirqs.CPU45.RCU
>      14522           +14.8%      16674 =C2=B1  6%  softirqs.CPU45.SCHED
>      36594           +15.8%      42364 =C2=B1  5%  softirqs.CPU45.TIMER
>      28660 =C2=B1  3%     +18.8%      34052 =C2=B1  7%  softirqs.CPU46.RCU
>      15306 =C2=B1  4%     +13.5%      17370 =C2=B1  7%  softirqs.CPU46.SC=
HED
>      37095 =C2=B1  3%     +14.3%      42388 =C2=B1  5%  softirqs.CPU46.TI=
MER
>      28906 =C2=B1  5%     +15.3%      33324 =C2=B1  7%  softirqs.CPU47.RCU
>      14758 =C2=B1  5%     +13.7%      16775 =C2=B1  5%  softirqs.CPU47.SC=
HED
>      36736 =C2=B1  3%     +14.2%      41969 =C2=B1  4%  softirqs.CPU47.TI=
MER
>      28049 =C2=B1  4%     +24.0%      34791 =C2=B1  2%  softirqs.CPU48.RCU
>      14583 =C2=B1  4%     +18.9%      17340 =C2=B1  8%  softirqs.CPU48.SC=
HED
>      36095 =C2=B1  4%     +19.5%      43117 =C2=B1  6%  softirqs.CPU48.TI=
MER
>      27551 =C2=B1  5%     +21.0%      33349 =C2=B1  4%  softirqs.CPU49.RCU
>      36024           +18.1%      42545 =C2=B1  4%  softirqs.CPU49.TIMER
>      25870 =C2=B1  2%     +22.4%      31677 =C2=B1  3%  softirqs.CPU5.RCU
>      15740 =C2=B1  6%     +26.8%      19951 =C2=B1  9%  softirqs.CPU5.SCH=
ED
>      37622           +33.5%      50234 =C2=B1 18%  softirqs.CPU5.TIMER
>      27424           +19.6%      32798 =C2=B1  2%  softirqs.CPU50.RCU
>      14010 =C2=B1  2%     +21.8%      17060 =C2=B1  6%  softirqs.CPU50.SC=
HED
>      36485 =C2=B1  3%     +14.7%      41862 =C2=B1  4%  softirqs.CPU50.TI=
MER
>      27884           +18.9%      33160 =C2=B1  3%  softirqs.CPU51.RCU
>      36212 =C2=B1  3%     +16.6%      42210 =C2=B1  4%  softirqs.CPU51.TI=
MER
>      27031 =C2=B1  7%     +29.8%      35075 =C2=B1  5%  softirqs.CPU52.RCU
>      14772 =C2=B1  2%     +18.1%      17451 =C2=B1  4%  softirqs.CPU52.SC=
HED
>      37031 =C2=B1  4%     +17.9%      43648 =C2=B1  4%  softirqs.CPU52.TI=
MER
>      25188 =C2=B1 12%     +28.7%      32423 =C2=B1  3%  softirqs.CPU53.RCU
>      16289 =C2=B1  6%     +18.4%      19280 =C2=B1  5%  softirqs.CPU53.SC=
HED
>      37616 =C2=B1  3%     +35.6%      51010 =C2=B1 21%  softirqs.CPU53.TI=
MER
>      26693 =C2=B1  3%     +19.4%      31870 =C2=B1  2%  softirqs.CPU54.RCU
>      38094           +16.5%      44379 =C2=B1  4%  softirqs.CPU54.TIMER
>      26082 =C2=B1  2%     +23.1%      32100        softirqs.CPU55.RCU
>      37589 =C2=B1  2%     +16.5%      43779 =C2=B1  5%  softirqs.CPU55.TI=
MER
>      26352 =C2=B1  2%     +18.7%      31284        softirqs.CPU56.RCU
>      15591 =C2=B1  4%     +15.9%      18066 =C2=B1  8%  softirqs.CPU56.SC=
HED
>      37070           +16.8%      43309 =C2=B1  2%  softirqs.CPU56.TIMER
>      27520 =C2=B1  4%     +15.7%      31841 =C2=B1  5%  softirqs.CPU57.RCU
>      37916 =C2=B1  2%     +13.9%      43170 =C2=B1  2%  softirqs.CPU57.TI=
MER
>      27067           +20.8%      32709 =C2=B1  7%  softirqs.CPU58.RCU
>      15059           +19.1%      17935 =C2=B1  8%  softirqs.CPU58.SCHED
>      37123           +13.8%      42241        softirqs.CPU58.TIMER
>      25199 =C2=B1  4%     +19.6%      30126 =C2=B1  6%  softirqs.CPU59.RCU
>      36384 =C2=B1  2%     +16.8%      42479 =C2=B1  2%  softirqs.CPU59.TI=
MER
>      25871 =C2=B1  3%     +17.5%      30409 =C2=B1  3%  softirqs.CPU6.RCU
>      16584 =C2=B1  2%     +14.8%      19032 =C2=B1  5%  softirqs.CPU6.SCH=
ED
>      38784           +15.6%      44850 =C2=B1  4%  softirqs.CPU6.TIMER
>      24777 =C2=B1  5%     +15.0%      28502 =C2=B1  5%  softirqs.CPU60.RCU
>      37468           +14.2%      42794 =C2=B1  6%  softirqs.CPU60.TIMER
>      23108 =C2=B1  3%     +30.1%      30065 =C2=B1  2%  softirqs.CPU61.RCU
>      15059 =C2=B1  6%     +16.5%      17540 =C2=B1  6%  softirqs.CPU61.SC=
HED
>      37002           +16.8%      43227 =C2=B1  3%  softirqs.CPU61.TIMER
>      23023 =C2=B1  7%     +33.6%      30769 =C2=B1  6%  softirqs.CPU62.RCU
>      37164 =C2=B1  2%     +16.2%      43203 =C2=B1  2%  softirqs.CPU62.TI=
MER
>      23069 =C2=B1  2%     +25.1%      28850        softirqs.CPU63.RCU
>      14642 =C2=B1  5%     +15.4%      16900 =C2=B1  8%  softirqs.CPU63.SC=
HED
>      36254 =C2=B1  2%     +15.4%      41854 =C2=B1  3%  softirqs.CPU63.TI=
MER
>      24304 =C2=B1  2%     +25.9%      30593 =C2=B1  2%  softirqs.CPU64.RCU
>      14666           +15.5%      16938 =C2=B1  3%  softirqs.CPU64.SCHED
>      37048           +15.7%      42877 =C2=B1  4%  softirqs.CPU64.TIMER
>      24438 =C2=B1  9%     +23.6%      30212 =C2=B1  5%  softirqs.CPU65.RCU
>      37505           +12.8%      42288 =C2=B1  2%  softirqs.CPU65.TIMER
>      24568           +20.4%      29569        softirqs.CPU66.RCU
>      15290 =C2=B1  5%      +8.4%      16569 =C2=B1  4%  softirqs.CPU66.SC=
HED
>      37381           +14.9%      42968 =C2=B1  3%  softirqs.CPU66.TIMER
>      23253 =C2=B1  9%     +29.7%      30150 =C2=B1  2%  softirqs.CPU67.RCU
>      14645 =C2=B1  6%     +13.4%      16613 =C2=B1  6%  softirqs.CPU67.SC=
HED
>      37012           +14.1%      42221 =C2=B1  2%  softirqs.CPU67.TIMER
>      36993           +15.0%      42536 =C2=B1  4%  softirqs.CPU68.TIMER
>      24695 =C2=B1  7%     +23.7%      30551 =C2=B1  3%  softirqs.CPU69.RCU
>      14441 =C2=B1  3%     +11.4%      16089 =C2=B1  4%  softirqs.CPU69.SC=
HED
>      36999           +14.3%      42299        softirqs.CPU69.TIMER
>      26022 =C2=B1  3%     +21.4%      31579 =C2=B1  2%  softirqs.CPU7.RCU
>      38481           +18.7%      45661 =C2=B1  3%  softirqs.CPU7.TIMER
>      25083 =C2=B1  8%     +18.5%      29721 =C2=B1  2%  softirqs.CPU70.RCU
>      14845 =C2=B1  7%     +15.7%      17173 =C2=B1  4%  softirqs.CPU70.SC=
HED
>      37094           +18.5%      43948 =C2=B1  3%  softirqs.CPU70.TIMER
>      24438 =C2=B1  2%     +20.6%      29461 =C2=B1  2%  softirqs.CPU71.RCU
>      15821 =C2=B1  4%     +13.6%      17978 =C2=B1  4%  softirqs.CPU71.SC=
HED
>      26912 =C2=B1  7%     +22.3%      32925 =C2=B1  6%  softirqs.CPU8.RCU
>      39193           +15.2%      45167 =C2=B1  4%  softirqs.CPU8.TIMER
>      25829 =C2=B1  2%     +20.7%      31178        softirqs.CPU9.RCU
>      37434 =C2=B1  2%     +16.6%      43665 =C2=B1  5%  softirqs.CPU9.TIM=
ER
>    1897274           +21.5%    2304570 =C2=B1  2%  softirqs.RCU
>    1150548           +11.9%    1287616        softirqs.SCHED
>    2757329           +15.8%    3193002 =C2=B1  3%  softirqs.TIMER
> =

> =

>                                                                          =
       =

>                                  aim7.jobs-per-min                       =
       =

>                                                                          =
       =

>   1400 +-+---------------------------------------------------------------=
---+   =

>        |                                                                 =
   |   =

>   1200 +-+++.++.++.+++.++.++  +  ++.+  +  +++.++  +  ++.++.++.++.+++.++.+=
+.+|   =

>        |                   :  :  :  :  :  :    :  :  :                   =
   |   =

>   1000 OO+OO OO OO OOO OO OO OOO OO OO OO OOO OO OO OOO O                =
   |   =

>        |                    : :  :  :  :  :     : :: :                   =
   |   =

>    800 +-+                  : : :   : :: :      : :: :                   =
   |   =

>        |                    : : :   : :: :      : :: :                   =
   |   =

>    600 +-+                  : :::    :: ::      : :: :                   =
   |   =

>        |                    :: ::    :: ::      :: ::                    =
   |   =

>    400 +-+                  :: ::    :: ::      :: ::                    =
   |   =

>        |                     : ::    :: ::       :  :                    =
   |   =

>    200 +-+                   : :     :  :        :  :                    =
   |   =

>        |                     : :     :  :        :  :                    =
   |   =

>      0 +-+---------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                               aim7.time.elapsed_time                     =
       =

>                                                                          =
       =

>   140 +-+----------------------------------------------------------------=
---+   =

>       |                                                                  =
   |   =

>   120 OO+OO OO OO OO OO O O OO OO  O OO OOO OO OO OO OO O                =
   |   =

>       |                  O        O                                      =
   |   =

>   100 +-+++.++.++.++.++.+++  +  +.++  +  ++.++.+  +  ++.++.+++.++.++.++.+=
+.+|   =

>       |                   :  :  :  :  :  :     :  :  :                   =
   |   =

>    80 +-+                 :  :  :  :  :  :     :  :  :                   =
   |   =

>       |                    : :: :   : :: :     : :: :                    =
   |   =

>    60 +-+                  : :: :   : :: :     : :: :                    =
   |   =

>       |                    : :: :   : :: :      :: ::                    =
   |   =

>    40 +-+                  :: ::    :: ::       :: ::                    =
   |   =

>       |                    :: ::    :: ::       :: ::                    =
   |   =

>    20 +-+                   :  :     :  :       :  :                     =
   |   =

>       |                     :  :     :  :       :  :                     =
   |   =

>     0 +-+----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             aim7.time.elapsed_time.max                   =
       =

>                                                                          =
       =

>   140 +-+----------------------------------------------------------------=
---+   =

>       |                                                                  =
   |   =

>   120 OO+OO OO OO OO OO O O OO OO  O OO OOO OO OO OO OO O                =
   |   =

>       |                  O        O                                      =
   |   =

>   100 +-+++.++.++.++.++.+++  +  +.++  +  ++.++.+  +  ++.++.+++.++.++.++.+=
+.+|   =

>       |                   :  :  :  :  :  :     :  :  :                   =
   |   =

>    80 +-+                 :  :  :  :  :  :     :  :  :                   =
   |   =

>       |                    : :: :   : :: :     : :: :                    =
   |   =

>    60 +-+                  : :: :   : :: :     : :: :                    =
   |   =

>       |                    : :: :   : :: :      :: ::                    =
   |   =

>    40 +-+                  :: ::    :: ::       :: ::                    =
   |   =

>       |                    :: ::    :: ::       :: ::                    =
   |   =

>    20 +-+                   :  :     :  :       :  :                     =
   |   =

>       |                     :  :     :  :       :  :                     =
   |   =

>     0 +-+----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
       =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

> *************************************************************************=
**************************
> lkp-ivb-ep01: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz with 3=
84G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
testcase:
>   gcc-8/performance/4BRD_12G/btrfs/x86_64-rhel-7.6/20/RAID0/debian-x86_64=
-2018-04-03.cgz/lkp-ivb-ep01/sync_disk_rw/aim7
> =

> commit: =

>   a92e9c3a3c ("btrfs: extent_io: Handle error better in extent_writepages=
()")
>   44fe89de7d ("btrfs: Do mandatory tree block check before submitting bio=
")
> =

> a92e9c3a3cef4c0c 44fe89de7d5157a4f31f13d9480 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     474.71           -20.8%     376.09        aim7.jobs-per-min
>     252.89           +26.2%     319.19        aim7.time.elapsed_time
>     252.89           +26.2%     319.19        aim7.time.elapsed_time.max
>       8376 =C2=B1  3%      +9.4%       9167 =C2=B1  3%  aim7.time.minor_p=
age_faults
>       1760            +6.3%       1872        aim7.time.system_time
>      22.58            -1.5%      22.24        boot-time.dhcp
>      40945 =C2=B1  2%     -22.3%      31813 =C2=B1  3%  meminfo.max_used_=
kB
>     670014           +24.2%     832471        proc-vmstat.pgfault
>    1013780           +13.7%    1152374        proc-vmstat.pgfree
>  3.022e+09 =C2=B1  4%     +50.2%   4.54e+09 =C2=B1 19%  cpuidle.C1.time
>   34330913 =C2=B1  2%     +16.1%   39848597 =C2=B1  9%  cpuidle.C1.usage
>  2.611e+09 =C2=B1 16%     +48.9%  3.887e+09 =C2=B1  3%  cpuidle.C6.time
>       0.02 =C2=B1 15%      -0.0        0.00 =C2=B1113%  mpstat.cpu.-1.sof=
t%
>      21.36            -3.4       17.98        mpstat.cpu.-1.sys%
>       0.14            -0.0        0.12        mpstat.cpu.-1.usr%
>      78.00            +4.8%      81.75        vmstat.cpu.id
>     138672           -21.1%     109467        vmstat.io.bo
>     299636           -21.0%     236781        vmstat.system.cs
>      78.64            +4.3%      81.99        iostat.cpu.idle
>      21.21           -15.7%      17.88        iostat.cpu.system
>       7947           -20.5%       6318        iostat.md0.w/s
>     180043           -20.9%     142377        iostat.md0.wkB/s
>       3098 =C2=B1 30%    +270.4%      11475 =C2=B1 34%  numa-meminfo.node=
0.Inactive(anon)
>       9526           +37.0%      13052 =C2=B1 15%  numa-meminfo.node0.Map=
ped
>       5474 =C2=B1 26%    +188.7%      15807 =C2=B1 23%  numa-meminfo.node=
0.Shmem
>      75040 =C2=B1  2%     +10.4%      82807 =C2=B1  7%  numa-meminfo.node=
0.Slab
>      16192 =C2=B1  5%     -51.6%       7838 =C2=B1 51%  numa-meminfo.node=
1.Inactive(anon)
>      20174 =C2=B1  7%     -50.1%      10076 =C2=B1 36%  numa-meminfo.node=
1.Shmem
>     774.25 =C2=B1 30%    +270.4%       2867 =C2=B1 34%  numa-vmstat.node0=
.nr_inactive_anon
>       2474 =C2=B1  2%     +35.6%       3354 =C2=B1 14%  numa-vmstat.node0=
.nr_mapped
>       1367 =C2=B1 26%    +188.9%       3950 =C2=B1 23%  numa-vmstat.node0=
.nr_shmem
>     774.25 =C2=B1 30%    +270.4%       2867 =C2=B1 34%  numa-vmstat.node0=
.nr_zone_inactive_anon
>       4046 =C2=B1  5%     -51.6%       1958 =C2=B1 51%  numa-vmstat.node1=
.nr_inactive_anon
>       5042 =C2=B1  7%     -50.1%       2518 =C2=B1 36%  numa-vmstat.node1=
.nr_shmem
>       4046 =C2=B1  5%     -51.6%       1958 =C2=B1 51%  numa-vmstat.node1=
.nr_zone_inactive_anon
>     312.25           -15.1%     265.25        turbostat.Avg_MHz
>      25.87            -3.9       22.02        turbostat.Busy%
>   34326534 =C2=B1  2%     +16.1%   39845190 =C2=B1  9%  turbostat.C1
>      33.45            -4.6%      31.92        turbostat.CorWatt
>   21163841           +25.1%   26466542        turbostat.IRQ
>      59.45            -2.7%      57.87        turbostat.PkgWatt
>      32.25            -1.7%      31.71        turbostat.RAMWatt
>      20330           +26.1%      25630        turbostat.SMI
>       6.46 =C2=B1  2%      -0.6        5.89 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__btrfs_drop_extents.btrfs_log_changed_extents.btrfs_log_in=
ode.btrfs_log_inode_parent.btrfs_log_dentry_safe
>       2.75 =C2=B1  5%      -0.6        2.19 =C2=B1 11%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.finish_wait.btrfs_tree_lock.btrfs_lo=
ck_root_node.btrfs_search_slot
>       5.46 =C2=B1  2%      -0.5        4.92 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_search_slot.btrfs_lookup_file_extent.__btrfs_drop_ext=
ents.btrfs_log_changed_extents.btrfs_log_inode
>       5.46 =C2=B1  2%      -0.5        4.93 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_lookup_file_extent.__btrfs_drop_extents.btrfs_log_cha=
nged_extents.btrfs_log_inode.btrfs_log_inode_parent
>       0.69 =C2=B1  9%      -0.4        0.27 =C2=B1100%  perf-profile.call=
trace.cycles-pp.btrfs_delalloc_reserve_metadata.btrfs_buffered_write.btrfs_=
file_write_iter.__vfs_write.vfs_write
>       1.74 =C2=B1  6%      -0.4        1.39 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.btrfs_buffered_write.btrfs_file_write_iter.__vfs_write.vfs_=
write.ksys_write
>       0.63 =C2=B1  3%      -0.3        0.30 =C2=B1100%  perf-profile.call=
trace.cycles-pp.submit_bio.btrfs_map_bio.btrfs_submit_bio_hook.submit_one_b=
io.extent_writepages
>       2.35 =C2=B1  4%      -0.2        2.13 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_lookup_file_ex=
tent.__btrfs_drop_extents.btrfs_log_changed_extents
>       0.92 =C2=B1  9%      -0.1        0.80 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.writepage_delalloc.__extent_writepage.extent_write_cache_pa=
ges.extent_writepages.do_writepages
>       0.86 =C2=B1 10%      -0.1        0.74 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.btrfs_run_delalloc_range.writepage_delalloc.__extent_writep=
age.extent_write_cache_pages.extent_writepages
>       0.85 =C2=B1  9%      -0.1        0.73 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.cow_file_range.btrfs_run_delalloc_range.writepage_delalloc.=
__extent_writepage.extent_write_cache_pages
>       0.70 =C2=B1  5%      -0.1        0.57 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.queued_read_lock_slowpath.btrfs_tree_read_lock.btrfs_read_l=
ock_root_node.btrfs_search_slot.btrfs_lookup_file_extent
>       1.40 =C2=B1  5%      +0.2        1.55        perf-profile.calltrace=
.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_=
startup_64
>       0.65 =C2=B1 11%      +0.3        0.94 =C2=B1 23%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.irq_exit.smp_apic_timer_interrupt=
.apic_timer_interrupt.cpuidle_enter_state
>       0.79 =C2=B1  8%      +0.3        1.13 =C2=B1 21%  perf-profile.call=
trace.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpui=
dle_enter_state.do_idle
>       0.26 =C2=B1100%      +0.3        0.61 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_=
entry.start_secondary
>       1.44 =C2=B1  8%      +0.4        1.87 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_inter=
rupt.cpuidle_enter_state.do_idle
>       0.14 =C2=B1173%      +0.6        0.70 =C2=B1 27%  perf-profile.call=
trace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp=
_apic_timer_interrupt.apic_timer_interrupt
>       2.44 =C2=B1  5%      +0.6        3.04 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.btrfs_sync_log.btrfs_sync_file.btrfs_file_write_iter.__vfs_=
write.vfs_write
>       0.00            +0.7        0.72 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.btrfs_get_token_32.check_leaf.csum_tree_block.btree_csum_one_bio=
.btree_submit_bio_hook
>       2.51 =C2=B1  6%      +0.8        3.30 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter=
_state.do_idle.cpu_startup_entry
>       2.71 =C2=B1  6%      +0.8        3.53 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.do_idle.cpu_startu=
p_entry.start_secondary
>       0.73 =C2=B1  6%      +1.0        1.69 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.btrfs_write_marked_extents.btrfs_sync_log.btrfs_sync_file.b=
trfs_file_write_iter.__vfs_write
>       0.72 =C2=B1  6%      +1.0        1.69 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.do_writepages.__filemap_fdatawrite_range.btrfs_write_marked=
_extents.btrfs_sync_log.btrfs_sync_file
>       0.72 =C2=B1  6%      +1.0        1.69 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs=
_sync_log.btrfs_sync_file.btrfs_file_write_iter
>       0.72 =C2=B1  6%      +1.0        1.69 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.btree_write_cache_pages.do_writepages.__filemap_fdatawrite_=
range.btrfs_write_marked_extents.btrfs_sync_log
>       0.00            +1.0        1.05        perf-profile.calltrace.cycl=
es-pp.check_leaf.csum_tree_block.btree_csum_one_bio.btree_submit_bio_hook.s=
ubmit_one_bio
>       0.00            +1.1        1.08        perf-profile.calltrace.cycl=
es-pp.csum_tree_block.btree_csum_one_bio.btree_submit_bio_hook.submit_one_b=
io.btree_write_cache_pages
>       0.00            +1.1        1.09        perf-profile.calltrace.cycl=
es-pp.btree_csum_one_bio.btree_submit_bio_hook.submit_one_bio.btree_write_c=
ache_pages.do_writepages
>       0.00            +1.5        1.46        perf-profile.calltrace.cycl=
es-pp.submit_one_bio.btree_write_cache_pages.do_writepages.__filemap_fdataw=
rite_range.btrfs_write_marked_extents
>       0.00            +1.5        1.46        perf-profile.calltrace.cycl=
es-pp.btree_submit_bio_hook.submit_one_bio.btree_write_cache_pages.do_write=
pages.__filemap_fdatawrite_range
>      71.60 =C2=B1  7%     -16.2%      59.98 =C2=B1  8%  sched_debug.cfs_r=
q:/.load_avg.avg
>      96.11 =C2=B1 10%     -16.2%      80.58 =C2=B1  6%  sched_debug.cfs_r=
q:/.load_avg.stddev
>     187997            -8.8%     171461 =C2=B1  2%  sched_debug.cfs_rq:/.m=
in_vruntime.avg
>     226472 =C2=B1  2%     -10.8%     202016 =C2=B1  6%  sched_debug.cfs_r=
q:/.min_vruntime.max
>      17261 =C2=B1  7%     -21.5%      13550 =C2=B1 15%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       8.89 =C2=B1 47%     -64.7%       3.14 =C2=B1 57%  sched_debug.cfs_r=
q:/.removed.load_avg.avg
>     204.15           -38.5%     125.58 =C2=B1 57%  sched_debug.cfs_rq:/.r=
emoved.load_avg.max
>      40.32 =C2=B1 22%     -51.4%      19.61 =C2=B1 57%  sched_debug.cfs_r=
q:/.removed.load_avg.stddev
>     409.91 =C2=B1 47%     -64.8%     144.41 =C2=B1 57%  sched_debug.cfs_r=
q:/.removed.runnable_sum.avg
>       9437           -38.8%       5776 =C2=B1 57%  sched_debug.cfs_rq:/.r=
emoved.runnable_sum.max
>       1859 =C2=B1 22%     -51.5%     901.87 =C2=B1 57%  sched_debug.cfs_r=
q:/.removed.runnable_sum.stddev
>       2.95 =C2=B1 44%     -79.5%       0.60 =C2=B1 75%  sched_debug.cfs_r=
q:/.removed.util_avg.avg
>      72.25 =C2=B1  8%     -66.6%      24.17 =C2=B1 75%  sched_debug.cfs_r=
q:/.removed.util_avg.max
>      13.53 =C2=B1 23%     -72.1%       3.77 =C2=B1 75%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>       9.43 =C2=B1  5%     +27.0%      11.97 =C2=B1 14%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>     103.80 =C2=B1 10%     +62.1%     168.29 =C2=B1 27%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>      22.41 =C2=B1  7%     +39.0%      31.15 =C2=B1 20%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>      12421 =C2=B1 59%     +64.4%      20419 =C2=B1 40%  sched_debug.cfs_r=
q:/.spread0.avg
>     -24890           -69.6%      -7575        sched_debug.cfs_rq:/.spread=
0.min
>      17263 =C2=B1  7%     -21.5%      13551 =C2=B1 15%  sched_debug.cfs_r=
q:/.spread0.stddev
>     325.68 =C2=B1  2%     -14.6%     278.27 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_avg.avg
>     186.27 =C2=B1  3%     -11.0%     165.84 =C2=B1  2%  sched_debug.cfs_r=
q:/.util_avg.stddev
>     132.45           -12.4%     116.05 =C2=B1  7%  sched_debug.cfs_rq:/.u=
til_est_enqueued.stddev
>     155113           +19.3%     185086        sched_debug.cpu.clock.avg
>     155121           +19.3%     185093        sched_debug.cpu.clock.max
>     155106           +19.3%     185079        sched_debug.cpu.clock.min
>     155113           +19.3%     185086        sched_debug.cpu.clock_task.=
avg
>     155121           +19.3%     185093        sched_debug.cpu.clock_task.=
max
>     155106           +19.3%     185079        sched_debug.cpu.clock_task.=
min
>     104.40 =C2=B1  7%     +61.5%     168.62 =C2=B1 27%  sched_debug.cpu.c=
pu_load[0].max
>      96.20 =C2=B1  8%     +74.1%     167.46 =C2=B1 30%  sched_debug.cpu.c=
pu_load[1].max
>       4871           +14.8%       5592        sched_debug.cpu.curr->pid.m=
ax
>     127731           +23.5%     157685        sched_debug.cpu.nr_load_upd=
ates.avg
>     134899           +20.9%     163058        sched_debug.cpu.nr_load_upd=
ates.max
>     125325           +24.0%     155428        sched_debug.cpu.nr_load_upd=
ates.min
>     155106           +19.3%     185079        sched_debug.cpu_clk
>     151513           +19.8%     181485        sched_debug.ktime
>     155537           +19.3%     185526        sched_debug.sched_clk
>      19.77           -15.1%      16.78 =C2=B1  3%  perf-stat.i.MPKI
>  8.783e+08            -9.0%  7.989e+08        perf-stat.i.branch-instruct=
ions
>      19.44            -0.2       19.21        perf-stat.i.cache-miss-rate%
>   14932557           -19.1%   12081970        perf-stat.i.cache-misses
>   77250252           -18.0%   63363496        perf-stat.i.cache-references
>     302132           -21.2%     238146        perf-stat.i.context-switches
>       3.13           -11.6%       2.77 =C2=B1  2%  perf-stat.i.cpi
>  1.254e+10           -15.4%  1.061e+10        perf-stat.i.cpu-cycles
>     229.12 =C2=B1  3%     -21.3%     180.36 =C2=B1  3%  perf-stat.i.cpu-m=
igrations
>     840.12            +4.5%     877.89        perf-stat.i.cycles-between-=
cache-misses
>  1.129e+09            -5.4%  1.068e+09        perf-stat.i.dTLB-loads
>       0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-stat.i.dTLB-=
store-miss-rate%
>     538827 =C2=B1  3%     -16.1%     452028 =C2=B1  4%  perf-stat.i.dTLB-=
store-misses
>      47.32            +3.3       50.67 =C2=B1  3%  perf-stat.i.iTLB-load-=
miss-rate%
>    2556829           -20.4%    2034861 =C2=B1  2%  perf-stat.i.iTLB-loads
>  4.153e+09            -4.5%  3.964e+09        perf-stat.i.instructions
>       0.33           +12.2%       0.37 =C2=B1  2%  perf-stat.i.ipc
>    6672298           -19.6%    5364393        perf-stat.i.node-load-misses
>    7193961           -19.6%    5786904        perf-stat.i.node-loads
>    4765580           -20.6%    3784168        perf-stat.i.node-store-miss=
es
>    6965089           -20.3%    5548679        perf-stat.i.node-stores
>      18.60           -14.0%      15.99 =C2=B1  2%  perf-stat.overall.MPKI
>      19.33            -0.3       19.07        perf-stat.overall.cache-mis=
s-rate%
>       3.02           -11.3%       2.68 =C2=B1  2%  perf-stat.overall.cpi
>     839.71            +4.6%     878.19        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-stat.overall=
.dTLB-store-miss-rate%
>      45.63            +3.8       49.47 =C2=B1  3%  perf-stat.overall.iTLB=
-load-miss-rate%
>       0.33           +12.8%       0.37 =C2=B1  2%  perf-stat.overall.ipc
>  8.748e+08            -9.0%  7.964e+08        perf-stat.ps.branch-instruc=
tions
>   14872846           -19.0%   12043692        perf-stat.ps.cache-misses
>   76941024           -17.9%   63162394        perf-stat.ps.cache-referenc=
es
>     300917           -21.1%     237386        perf-stat.ps.context-switch=
es
>  1.249e+10           -15.3%  1.058e+10        perf-stat.ps.cpu-cycles
>     228.20 =C2=B1  3%     -21.2%     179.78 =C2=B1  3%  perf-stat.ps.cpu-=
migrations
>  1.124e+09            -5.3%  1.065e+09        perf-stat.ps.dTLB-loads
>     536681 =C2=B1  3%     -16.0%     450604 =C2=B1  4%  perf-stat.ps.dTLB=
-store-misses
>    2546543           -20.3%    2028370 =C2=B1  2%  perf-stat.ps.iTLB-loads
>  4.137e+09            -4.5%  3.952e+09        perf-stat.ps.instructions
>    6645469           -19.5%    5347283        perf-stat.ps.node-load-miss=
es
>    7165042           -19.5%    5768454        perf-stat.ps.node-loads
>    4746415           -20.5%    3772102        perf-stat.ps.node-store-mis=
ses
>    6937096           -20.3%    5531006        perf-stat.ps.node-stores
>  1.049e+12           +20.4%  1.263e+12        perf-stat.total.instructions
>     160.75 =C2=B1 18%     +49.5%     240.25 =C2=B1 27%  interrupts.42:IR-=
PCI-MSI.524294-edge.eth0-TxRx-5
>     123.75           +26.3%     156.25        interrupts.76:IR-PCI-MSI.51=
2000-edge.ahci[0000:00:1f.2]
>     100313 =C2=B1  7%     +13.4%     113737        interrupts.CAL:Functio=
n_call_interrupts
>     508519           +26.0%     640668        interrupts.CPU0.LOC:Local_t=
imer_interrupts
>       2437 =C2=B1 12%     +18.1%       2877 =C2=B1  4%  interrupts.CPU1.C=
AL:Function_call_interrupts
>     508036           +26.1%     640579        interrupts.CPU1.LOC:Local_t=
imer_interrupts
>       2521 =C2=B1 10%     +14.3%       2882 =C2=B1  5%  interrupts.CPU10.=
CAL:Function_call_interrupts
>     507477           +26.1%     639993        interrupts.CPU10.LOC:Local_=
timer_interrupts
>       2519 =C2=B1  2%     +17.9%       2969 =C2=B1  6%  interrupts.CPU11.=
CAL:Function_call_interrupts
>     508051           +26.1%     640531        interrupts.CPU11.LOC:Local_=
timer_interrupts
>     508353           +25.8%     639418        interrupts.CPU12.LOC:Local_=
timer_interrupts
>     508289           +26.0%     640385        interrupts.CPU13.LOC:Local_=
timer_interrupts
>     508136           +25.8%     639470        interrupts.CPU14.LOC:Local_=
timer_interrupts
>       2417 =C2=B1  5%     +20.2%       2906 =C2=B1  6%  interrupts.CPU15.=
CAL:Function_call_interrupts
>     508330           +25.9%     640229        interrupts.CPU15.LOC:Local_=
timer_interrupts
>     508351           +25.9%     639790        interrupts.CPU16.LOC:Local_=
timer_interrupts
>       2508 =C2=B1 10%     +18.4%       2968 =C2=B1  6%  interrupts.CPU17.=
CAL:Function_call_interrupts
>     508084           +26.0%     640420        interrupts.CPU17.LOC:Local_=
timer_interrupts
>      17327 =C2=B1 18%     +26.1%      21856 =C2=B1  4%  interrupts.CPU17.=
RES:Rescheduling_interrupts
>     508457           +25.8%     639737        interrupts.CPU18.LOC:Local_=
timer_interrupts
>     508140           +26.0%     640214        interrupts.CPU19.LOC:Local_=
timer_interrupts
>       2280 =C2=B1  8%     +22.2%       2786 =C2=B1  5%  interrupts.CPU2.C=
AL:Function_call_interrupts
>     508336           +26.0%     640548        interrupts.CPU2.LOC:Local_t=
imer_interrupts
>     507912           +26.1%     640315        interrupts.CPU20.LOC:Local_=
timer_interrupts
>       2595 =C2=B1  7%     +13.4%       2943 =C2=B1  5%  interrupts.CPU21.=
CAL:Function_call_interrupts
>     508108           +26.1%     640485        interrupts.CPU21.LOC:Local_=
timer_interrupts
>     508306           +26.0%     640244        interrupts.CPU22.LOC:Local_=
timer_interrupts
>       1303 =C2=B1 34%     -29.2%     922.75 =C2=B1 32%  interrupts.CPU22.=
NMI:Non-maskable_interrupts
>       1303 =C2=B1 34%     -29.2%     922.75 =C2=B1 32%  interrupts.CPU22.=
PMI:Performance_monitoring_interrupts
>       2522 =C2=B1  9%     +17.2%       2956 =C2=B1  4%  interrupts.CPU23.=
CAL:Function_call_interrupts
>     508123           +26.1%     640526        interrupts.CPU23.LOC:Local_=
timer_interrupts
>     508372           +26.0%     640372        interrupts.CPU24.LOC:Local_=
timer_interrupts
>     507678           +26.1%     640435        interrupts.CPU25.LOC:Local_=
timer_interrupts
>     508375           +26.0%     640407        interrupts.CPU26.LOC:Local_=
timer_interrupts
>       2406 =C2=B1 11%     +19.9%       2885 =C2=B1  5%  interrupts.CPU27.=
CAL:Function_call_interrupts
>     508242           +26.0%     640265        interrupts.CPU27.LOC:Local_=
timer_interrupts
>       2449 =C2=B1 11%     +21.8%       2982 =C2=B1  5%  interrupts.CPU28.=
CAL:Function_call_interrupts
>     508292           +26.0%     640304        interrupts.CPU28.LOC:Local_=
timer_interrupts
>       2510 =C2=B1  6%     +14.4%       2870 =C2=B1  5%  interrupts.CPU29.=
CAL:Function_call_interrupts
>     508085           +26.0%     640167        interrupts.CPU29.LOC:Local_=
timer_interrupts
>     508172           +26.0%     640443        interrupts.CPU3.LOC:Local_t=
imer_interrupts
>     508342           +25.9%     639891        interrupts.CPU30.LOC:Local_=
timer_interrupts
>     508009           +26.1%     640402        interrupts.CPU31.LOC:Local_=
timer_interrupts
>       2522 =C2=B1 11%     +16.8%       2946 =C2=B1  4%  interrupts.CPU32.=
CAL:Function_call_interrupts
>     508138           +25.9%     639578        interrupts.CPU32.LOC:Local_=
timer_interrupts
>     508010           +26.1%     640577        interrupts.CPU33.LOC:Local_=
timer_interrupts
>     508029           +25.9%     639405        interrupts.CPU34.LOC:Local_=
timer_interrupts
>       2464 =C2=B1  8%     +15.3%       2840 =C2=B1  5%  interrupts.CPU35.=
CAL:Function_call_interrupts
>     508216           +26.0%     640171        interrupts.CPU35.LOC:Local_=
timer_interrupts
>     160.75 =C2=B1 18%     +49.5%     240.25 =C2=B1 27%  interrupts.CPU36.=
42:IR-PCI-MSI.524294-edge.eth0-TxRx-5
>     507990           +25.9%     639575        interrupts.CPU36.LOC:Local_=
timer_interrupts
>     508010           +26.0%     640200        interrupts.CPU37.LOC:Local_=
timer_interrupts
>       2536 =C2=B1  8%     +13.9%       2888 =C2=B1  6%  interrupts.CPU38.=
CAL:Function_call_interrupts
>     507853           +25.9%     639351        interrupts.CPU38.LOC:Local_=
timer_interrupts
>       2414 =C2=B1  7%     +19.6%       2887 =C2=B1  7%  interrupts.CPU39.=
CAL:Function_call_interrupts
>     507619           +26.0%     639416        interrupts.CPU39.LOC:Local_=
timer_interrupts
>     508318           +25.9%     640069        interrupts.CPU4.LOC:Local_t=
imer_interrupts
>       2463 =C2=B1 12%     +26.6%       3119 =C2=B1  2%  interrupts.CPU5.C=
AL:Function_call_interrupts
>     508112           +26.1%     640497        interrupts.CPU5.LOC:Local_t=
imer_interrupts
>     123.75           +26.3%     156.25        interrupts.CPU6.76:IR-PCI-M=
SI.512000-edge.ahci[0000:00:1f.2]
>       2351 =C2=B1  9%     +21.5%       2856 =C2=B1  5%  interrupts.CPU6.C=
AL:Function_call_interrupts
>     508563           +25.8%     639582        interrupts.CPU6.LOC:Local_t=
imer_interrupts
>       2592 =C2=B1  4%     +13.6%       2943 =C2=B1  4%  interrupts.CPU7.C=
AL:Function_call_interrupts
>     508150           +26.0%     640378        interrupts.CPU7.LOC:Local_t=
imer_interrupts
>     508498           +25.9%     640139        interrupts.CPU8.LOC:Local_t=
imer_interrupts
>       2501 =C2=B1 10%     +18.4%       2960 =C2=B1  7%  interrupts.CPU9.C=
AL:Function_call_interrupts
>     508092           +26.0%     640432        interrupts.CPU9.LOC:Local_t=
imer_interrupts
>   20326190           +26.0%   25605623        interrupts.LOC:Local_timer_=
interrupts
>      26401 =C2=B1  5%      -9.9%      23785 =C2=B1  4%  interrupts.NMI:No=
n-maskable_interrupts
>      26401 =C2=B1  5%      -9.9%      23785 =C2=B1  4%  interrupts.PMI:Pe=
rformance_monitoring_interrupts
>      69901 =C2=B1  3%     +27.9%      89422 =C2=B1  3%  softirqs.CPU0.RCU
>      45503 =C2=B1  2%     +18.1%      53752        softirqs.CPU0.SCHED
>      90281 =C2=B1  2%     +17.4%     105987 =C2=B1  2%  softirqs.CPU0.TIM=
ER
>      72001 =C2=B1  4%     +30.7%      94130 =C2=B1  2%  softirqs.CPU1.RCU
>      42373           +18.9%      50374 =C2=B1  2%  softirqs.CPU1.SCHED
>      89928 =C2=B1  3%     +18.5%     106554 =C2=B1  4%  softirqs.CPU1.TIM=
ER
>      73216 =C2=B1  6%     +24.5%      91156 =C2=B1  3%  softirqs.CPU10.RCU
>      42693           +16.8%      49881 =C2=B1  2%  softirqs.CPU10.SCHED
>      86975 =C2=B1  2%     +19.4%     103822 =C2=B1  3%  softirqs.CPU10.TI=
MER
>      71035           +31.2%      93194 =C2=B1  2%  softirqs.CPU11.RCU
>      42794           +19.6%      51168 =C2=B1  2%  softirqs.CPU11.SCHED
>      86533           +18.9%     102845 =C2=B1  4%  softirqs.CPU11.TIMER
>      70358 =C2=B1  3%     +33.3%      93810 =C2=B1  3%  softirqs.CPU12.RCU
>      42548           +17.2%      49878        softirqs.CPU12.SCHED
>      87303 =C2=B1  2%     +21.8%     106341 =C2=B1  3%  softirqs.CPU12.TI=
MER
>      70364 =C2=B1  3%     +31.7%      92648 =C2=B1  4%  softirqs.CPU13.RCU
>      42421           +18.9%      50428        softirqs.CPU13.SCHED
>      86875           +19.5%     103817 =C2=B1  3%  softirqs.CPU13.TIMER
>      69128 =C2=B1  2%     +30.7%      90331 =C2=B1  3%  softirqs.CPU14.RCU
>      42975 =C2=B1  2%     +15.4%      49575        softirqs.CPU14.SCHED
>      84688 =C2=B1  3%     +21.6%     102994 =C2=B1  3%  softirqs.CPU14.TI=
MER
>      72010 =C2=B1  2%     +30.6%      94068 =C2=B1  3%  softirqs.CPU15.RCU
>      42893           +17.0%      50178        softirqs.CPU15.SCHED
>      86458           +20.4%     104117 =C2=B1  4%  softirqs.CPU15.TIMER
>      70886 =C2=B1  2%     +30.3%      92387 =C2=B1  2%  softirqs.CPU16.RCU
>      42970           +16.3%      49975        softirqs.CPU16.SCHED
>      87944 =C2=B1  2%     +19.7%     105244 =C2=B1  2%  softirqs.CPU16.TI=
MER
>      70757 =C2=B1  2%     +30.5%      92359 =C2=B1  2%  softirqs.CPU17.RCU
>      42742           +17.7%      50310 =C2=B1  2%  softirqs.CPU17.SCHED
>      87096 =C2=B1  2%     +17.9%     102652 =C2=B1  3%  softirqs.CPU17.TI=
MER
>      69077 =C2=B1  3%     +32.6%      91630 =C2=B1  3%  softirqs.CPU18.RCU
>      42942           +17.0%      50245 =C2=B1  2%  softirqs.CPU18.SCHED
>      68722 =C2=B1  2%     +29.7%      89150 =C2=B1  2%  softirqs.CPU19.RCU
>      42964 =C2=B1  2%     +17.2%      50334 =C2=B1  2%  softirqs.CPU19.SC=
HED
>      84910 =C2=B1  4%     +24.0%     105326 =C2=B1  7%  softirqs.CPU19.TI=
MER
>      72687 =C2=B1  4%     +25.6%      91315 =C2=B1  3%  softirqs.CPU2.RCU
>      42688           +16.2%      49622        softirqs.CPU2.SCHED
>      88869 =C2=B1  5%     +16.3%     103332        softirqs.CPU2.TIMER
>      70693 =C2=B1  2%     +26.6%      89525 =C2=B1  4%  softirqs.CPU20.RCU
>      42228           +17.5%      49611 =C2=B1  2%  softirqs.CPU20.SCHED
>      88647 =C2=B1  2%     +16.4%     103227 =C2=B1  2%  softirqs.CPU20.TI=
MER
>      70857 =C2=B1  3%     +32.1%      93633 =C2=B1  3%  softirqs.CPU21.RCU
>      42878           +17.2%      50239        softirqs.CPU21.SCHED
>      87325           +18.2%     103214 =C2=B1  4%  softirqs.CPU21.TIMER
>      71099 =C2=B1  3%     +29.0%      91711 =C2=B1  3%  softirqs.CPU22.RCU
>      42534           +17.3%      49888        softirqs.CPU22.SCHED
>      87698 =C2=B1  3%     +19.3%     104642        softirqs.CPU22.TIMER
>      72098 =C2=B1  2%     +30.3%      93930 =C2=B1  3%  softirqs.CPU23.RCU
>      42771           +17.0%      50022 =C2=B1  2%  softirqs.CPU23.SCHED
>      87931           +17.5%     103319 =C2=B1  3%  softirqs.CPU23.TIMER
>      70804 =C2=B1  3%     +33.4%      94432 =C2=B1  6%  softirqs.CPU24.RCU
>      42554 =C2=B1  3%     +16.4%      49516 =C2=B1  2%  softirqs.CPU24.SC=
HED
>      71435 =C2=B1  3%     +35.0%      96465 =C2=B1  3%  softirqs.CPU25.RCU
>      42605           +16.9%      49815        softirqs.CPU25.SCHED
>      87163           +21.2%     105672        softirqs.CPU25.TIMER
>      70216           +31.0%      91964 =C2=B1  3%  softirqs.CPU26.RCU
>      42147           +19.0%      50165 =C2=B1  2%  softirqs.CPU26.SCHED
>      88215 =C2=B1  3%     +36.3%     120217 =C2=B1 21%  softirqs.CPU26.TI=
MER
>      70713           +32.5%      93695 =C2=B1  6%  softirqs.CPU27.RCU
>      42528           +18.2%      50249 =C2=B1  2%  softirqs.CPU27.SCHED
>      88110           +38.5%     122002 =C2=B1 24%  softirqs.CPU27.TIMER
>      69654 =C2=B1  2%     +34.1%      93398 =C2=B1  3%  softirqs.CPU28.RCU
>      42052           +18.0%      49636 =C2=B1  2%  softirqs.CPU28.SCHED
>      86876 =C2=B1  2%     +21.6%     105634 =C2=B1  2%  softirqs.CPU28.TI=
MER
>      70230 =C2=B1  2%     +37.8%      96776 =C2=B1  5%  softirqs.CPU29.RCU
>      42440           +17.0%      49673 =C2=B1  2%  softirqs.CPU29.SCHED
>      87058           +18.9%     103502 =C2=B1  2%  softirqs.CPU29.TIMER
>      70519 =C2=B1  3%     +34.2%      94624 =C2=B1  2%  softirqs.CPU3.RCU
>      43299           +16.2%      50322 =C2=B1  2%  softirqs.CPU3.SCHED
>      87572           +19.2%     104386 =C2=B1  4%  softirqs.CPU3.TIMER
>      70538 =C2=B1  2%     +31.0%      92391 =C2=B1  5%  softirqs.CPU30.RCU
>      42038 =C2=B1  2%     +17.9%      49574        softirqs.CPU30.SCHED
>      86446 =C2=B1  3%     +20.6%     104284        softirqs.CPU30.TIMER
>      71140 =C2=B1  2%     +33.6%      95050 =C2=B1  3%  softirqs.CPU31.RCU
>      42599           +16.5%      49608 =C2=B1  2%  softirqs.CPU31.SCHED
>      86417           +19.6%     103393 =C2=B1  3%  softirqs.CPU31.TIMER
>      59293 =C2=B1  2%     +29.7%      76894 =C2=B1  4%  softirqs.CPU32.RCU
>      42200           +17.8%      49711        softirqs.CPU32.SCHED
>      86726           +18.8%     103045 =C2=B1  3%  softirqs.CPU32.TIMER
>      58507           +31.6%      76967        softirqs.CPU33.RCU
>      42587           +16.7%      49683        softirqs.CPU33.SCHED
>      86567           +19.1%     103101 =C2=B1  3%  softirqs.CPU33.TIMER
>      59394 =C2=B1  2%     +27.1%      75493 =C2=B1  5%  softirqs.CPU34.RCU
>      42682           +16.6%      49753        softirqs.CPU34.SCHED
>      59949 =C2=B1  3%     +29.2%      77459        softirqs.CPU35.RCU
>      42681 =C2=B1  2%     +17.3%      50047 =C2=B1  2%  softirqs.CPU35.SC=
HED
>      85785           +19.9%     102825 =C2=B1  2%  softirqs.CPU35.TIMER
>      61089           +25.4%      76612        softirqs.CPU36.RCU
>      42662           +16.9%      49870        softirqs.CPU36.SCHED
>      87784 =C2=B1  2%     +17.3%     102973 =C2=B1  3%  softirqs.CPU36.TI=
MER
>      60018           +29.3%      77596        softirqs.CPU37.RCU
>      42378 =C2=B1  2%     +18.0%      50012        softirqs.CPU37.SCHED
>      85919           +20.3%     103386 =C2=B1  2%  softirqs.CPU37.TIMER
>      59781 =C2=B1  2%     +28.6%      76877        softirqs.CPU38.RCU
>      42779           +17.1%      50105        softirqs.CPU38.SCHED
>      85246 =C2=B1  4%     +20.7%     102859 =C2=B1  2%  softirqs.CPU38.TI=
MER
>      59657           +26.9%      75699 =C2=B1  2%  softirqs.CPU39.RCU
>      43011 =C2=B1  2%     +17.6%      50580 =C2=B1  3%  softirqs.CPU39.SC=
HED
>      98669 =C2=B1 20%     +36.3%     134491 =C2=B1 24%  softirqs.CPU39.TI=
MER
>      68912 =C2=B1  2%     +32.7%      91479 =C2=B1  2%  softirqs.CPU4.RCU
>      43101           +15.9%      49946        softirqs.CPU4.SCHED
>      86425 =C2=B1  5%     +18.4%     102344 =C2=B1  3%  softirqs.CPU4.TIM=
ER
>      70893 =C2=B1  3%     +32.1%      93618 =C2=B1  3%  softirqs.CPU5.RCU
>      42977           +17.2%      50381        softirqs.CPU5.SCHED
>      87301           +17.7%     102788 =C2=B1  3%  softirqs.CPU5.TIMER
>      71151           +25.0%      88965 =C2=B1  3%  softirqs.CPU6.RCU
>      42864           +17.3%      50282        softirqs.CPU6.SCHED
>      87741 =C2=B1  2%     +22.5%     107458 =C2=B1  4%  softirqs.CPU6.TIM=
ER
>      71242 =C2=B1  4%     +30.5%      92999 =C2=B1  3%  softirqs.CPU7.RCU
>      43014 =C2=B1  2%     +17.7%      50619        softirqs.CPU7.SCHED
>      87907           +15.8%     101781 =C2=B1  5%  softirqs.CPU7.TIMER
>      69638 =C2=B1  2%     +32.6%      92309 =C2=B1  4%  softirqs.CPU8.RCU
>      42479           +17.6%      49947        softirqs.CPU8.SCHED
>      86964 =C2=B1  2%     +18.6%     103128 =C2=B1  3%  softirqs.CPU8.TIM=
ER
>      69585 =C2=B1  2%     +36.1%      94684 =C2=B1  2%  softirqs.CPU9.RCU
>      42667           +18.0%      50343        softirqs.CPU9.SCHED
>      86913           +19.2%     103596 =C2=B1  4%  softirqs.CPU9.TIMER
>    2739272           +30.7%    3580875 =C2=B1  2%  softirqs.RCU
>    1709285           +17.3%    2005342        softirqs.SCHED
>    3539953           +19.4%    4226728 =C2=B1  2%  softirqs.TIMER
> =

> =

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



--===============0740330413690902776==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVMZDl5NWFXbFc2
aWRxa0xod2oyUjg2RWwvcWdGQWx5SHUxVUFDZ2tRd2oyUjg2RWwKL3FpSXRRZi9SbS9rbmpIR1Vx
Qm9PbXFtSE94NTFFeDBZSDBnSmhIb05NZG5DN3owUTV6RHplTld5ZkJIUXN1NgpKeXkvZEIzY3Qx
RlVqQmpkL1BZYm4xd2t0U2JxZDVEelpJY3c4Y1FBUDFIaWkvb2JwU1A1bDZCZUpxQWdUQXRmCkRr
TEs3L0Rsb2YwRklxQloxbjNyMXdxN2RHM2VqeUNmN0RlNzRXR1FXZkpweitRSUZ3WHI1eXI1WWZi
cklMR1UKNWRhSmJFb3pJYnNyZmtCY3dScUxBVGVmcDdSeUxlVys2eitSaE5PMWkzbS8xTnVjR2Nt
clM5d0d2czEvdUhuRQpRZ3gxQkdwUnp5NnRNYzFLWWgxQ0gyaHNMclFYVDhHMlBJVlloUVhWMXpM
cXZlTmNzK01LRkRvSlBGZGlaMzJSCm5URTRMRjZkbGNQOW9ucDNEMHcrbkVOTHA3c2VvUT09Cj1D
bDhpCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0740330413690902776==--

