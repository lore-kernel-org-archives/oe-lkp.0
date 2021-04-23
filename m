Content-Type: multipart/mixed; boundary="===============3189690026850539577=="
MIME-Version: 1.0
From: Junxiao Bi <junxiao.bi@oracle.com>
To: lkp@lists.01.org
Subject: Re: [block] 658f2fb7d2: fxmark.hdd_f2fs_dbench_client_72_directio.works/sec -21.4% regression
Date: Thu, 22 Apr 2021 22:26:44 -0700
Message-ID: <816f906d-eafe-0271-9edd-7f25fd757fa0@oracle.com>
In-Reply-To: <20210423025518.GA13944@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3189690026850539577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/22/21 7:55 PM, kernel test robot wrote:

>
> Greeting,
>
> FYI, we noticed a -21.4% regression of fxmark.hdd_f2fs_dbench_client_72_d=
irectio.works/sec due to commit:
>
>
> commit: 658f2fb7d2139d7a218083b7e8688dd288c6512d ("[PATCH] block: fix io =
hung by block throttle")
> url: https://github.com/0day-ci/linux/commits/Junxiao-Bi/block-fix-io-hun=
g-by-block-throttle/20210415-052219
> base: https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git =
for-next
>
> in testcase: fxmark
> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz wit=
h 80G memory
> with following parameters:
>
> 	disk: 1HDD
> 	media: hdd
> 	test: dbench_client
> 	fstype: f2fs
> 	directio: directio

This test is doing directio? The throttle didn't take care direct io, =

see wbt_should_throttle(), in that case, the changed code will not even =

be run.

Thanks,

Junxiao.

> 	cpufreq_governor: performance
> 	ucode: 0x11
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install                job.yaml  # job file is attached =
in this email
>          bin/lkp split-job --compatible job.yaml
>          bin/lkp run                    compatible-job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_=
group/test/testcase/ucode:
>    gcc-9/performance/directio/1HDD/f2fs/x86_64-rhel-8.3/hdd/debian-10.4-x=
86_64-20200603.cgz/lkp-knm01/dbench_client/fxmark/0x11
>
> commit:
>    901b8e44f6 ("Merge branch 'for-5.13/io_uring' into for-next")
>    658f2fb7d2 ("block: fix io hung by block throttle")
>
> 901b8e44f6b08436 658f2fb7d2139d7a218083b7e86
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>       66.02 =C2=B1  2%     -14.2%      56.65 =C2=B1  3%  fxmark.hdd_f2fs_=
dbench_client_36_directio.sys_sec
>        3.04 =C2=B1  2%     -14.3%       2.61 =C2=B1  3%  fxmark.hdd_f2fs_=
dbench_client_36_directio.sys_util
>       19.47 =C2=B1  3%     -13.4%      16.85 =C2=B1  3%  fxmark.hdd_f2fs_=
dbench_client_36_directio.user_sec
>        0.90 =C2=B1  3%     -13.5%       0.78 =C2=B1  3%  fxmark.hdd_f2fs_=
dbench_client_36_directio.user_util
>      128.18 =C2=B1  2%     -18.2%     104.90 =C2=B1  5%  fxmark.hdd_f2fs_=
dbench_client_36_directio.works/sec
>        8.65            -9.0%       7.87 =C2=B1  3%  fxmark.hdd_f2fs_dbenc=
h_client_54_directio.softirq_sec
>        0.27            -9.1%       0.24 =C2=B1  3%  fxmark.hdd_f2fs_dbenc=
h_client_54_directio.softirq_util
>      103.82 =C2=B1  3%     -20.8%      82.22 =C2=B1  3%  fxmark.hdd_f2fs_=
dbench_client_54_directio.sys_sec
>        3.19 =C2=B1  3%     -20.9%       2.52 =C2=B1  3%  fxmark.hdd_f2fs_=
dbench_client_54_directio.sys_util
>       29.38 =C2=B1  2%     -18.4%      23.98        fxmark.hdd_f2fs_dbenc=
h_client_54_directio.user_sec
>        0.90 =C2=B1  2%     -18.5%       0.74        fxmark.hdd_f2fs_dbenc=
h_client_54_directio.user_util
>      162.84 =C2=B1  4%     -24.8%     122.39 =C2=B1  3%  fxmark.hdd_f2fs_=
dbench_client_54_directio.works/sec
>       10.29            -8.7%       9.40 =C2=B1  3%  fxmark.hdd_f2fs_dbenc=
h_client_72_directio.softirq_sec
>        0.24            -8.8%       0.22 =C2=B1  3%  fxmark.hdd_f2fs_dbenc=
h_client_72_directio.softirq_util
>      132.66 =C2=B1  2%     -19.3%     107.01 =C2=B1  2%  fxmark.hdd_f2fs_=
dbench_client_72_directio.sys_sec
>        3.05 =C2=B1  2%     -19.4%       2.46 =C2=B1  2%  fxmark.hdd_f2fs_=
dbench_client_72_directio.sys_util
>       29.72 =C2=B1  3%     -18.2%      24.31 =C2=B1  2%  fxmark.hdd_f2fs_=
dbench_client_72_directio.user_sec
>        0.68 =C2=B1  3%     -18.3%       0.56 =C2=B1  2%  fxmark.hdd_f2fs_=
dbench_client_72_directio.user_util
>      183.55 =C2=B1  3%     -21.4%     144.32 =C2=B1  3%  fxmark.hdd_f2fs_=
dbench_client_72_directio.works/sec
>    26566804            -9.9%   23936362        fxmark.time.file_system_ou=
tputs
>       72184            -2.6%      70322        fxmark.time.involuntary_co=
ntext_switches
>       88.33           -15.9%      74.29        fxmark.time.percent_of_cpu=
_this_job_got
>      357.13           -15.9%     300.26        fxmark.time.system_time
>       91.39           -14.5%      78.18        fxmark.time.user_time
>      930788 =C2=B1  3%     -30.6%     645881 =C2=B1  2%  fxmark.time.volu=
ntary_context_switches
>        9.40            -2.7%       9.14        iostat.cpu.system
>        2.70            -2.0%       2.64        iostat.cpu.user
>        6281 =C2=B1  6%     -21.4%       4939 =C2=B1  8%  meminfo.Active(a=
non)
>       71273 =C2=B1  4%     -20.3%      56818 =C2=B1  7%  meminfo.Shmem
>        6267 =C2=B1  5%     -21.1%       4946 =C2=B1  8%  numa-meminfo.nod=
e0.Active(anon)
>       71236 =C2=B1  4%     -20.2%      56833 =C2=B1  7%  numa-meminfo.nod=
e0.Shmem
>        6729           -12.4%       5897        vmstat.io.bo
>        6385 =C2=B1  2%     -17.6%       5262        vmstat.system.cs
>        6088 =C2=B1  2%     -18.6%       4958        perf-stat.i.context-s=
witches
>      176.01           -15.1%     149.46        perf-stat.i.cpu-migrations
>        6074 =C2=B1  2%     -18.6%       4945        perf-stat.ps.context-=
switches
>      175.89           -15.1%     149.36        perf-stat.ps.cpu-migrations
>        1570 =C2=B1  6%     -21.5%       1233 =C2=B1  8%  numa-vmstat.node=
0.nr_active_anon
>     2302914           -11.0%    2050036        numa-vmstat.node0.nr_dirti=
ed
>       17815 =C2=B1  4%     -20.3%      14202 =C2=B1  7%  numa-vmstat.node=
0.nr_shmem
>      540895           -14.6%     461814        numa-vmstat.node0.nr_writt=
en
>        1570 =C2=B1  6%     -21.5%       1233 =C2=B1  8%  numa-vmstat.node=
0.nr_zone_active_anon
>        2679 =C2=B1  4%     -15.2%       2272 =C2=B1  4%  slabinfo.dmaengi=
ne-unmap-16.active_objs
>        3266 =C2=B1  7%     -13.0%       2841 =C2=B1  4%  slabinfo.dmaengi=
ne-unmap-16.num_objs
>        5826 =C2=B1  4%     -12.6%       5093 =C2=B1  3%  slabinfo.ext4_io=
_end.active_objs
>        5994 =C2=B1  4%     -12.3%       5257 =C2=B1  3%  slabinfo.ext4_io=
_end.num_objs
>       18698 =C2=B1  2%      -9.5%      16920        slabinfo.ext4_pending=
_reservation.active_objs
>       18783 =C2=B1  2%      -9.5%      17007        slabinfo.ext4_pending=
_reservation.num_objs
>       32425 =C2=B1  2%     -11.6%      28671 =C2=B1  2%  slabinfo.f2fs_fr=
ee_nid.active_objs
>       32622 =C2=B1  2%     -11.6%      28825 =C2=B1  2%  slabinfo.f2fs_fr=
ee_nid.num_objs
>        1584 =C2=B1  5%     -22.1%       1233 =C2=B1  8%  proc-vmstat.nr_a=
ctive_anon
>       20434            -2.0%      20027        proc-vmstat.nr_active_file
>     3316154            -9.9%    2986902        proc-vmstat.nr_dirtied
>      405121            -0.9%     401332        proc-vmstat.nr_file_pages
>       82265            -4.4%      78653        proc-vmstat.nr_inactive_an=
on
>       17866 =C2=B1  4%     -20.2%      14252 =C2=B1  7%  proc-vmstat.nr_s=
hmem
>      850118           -12.4%     744638        proc-vmstat.nr_written
>        1584 =C2=B1  5%     -22.1%       1233 =C2=B1  8%  proc-vmstat.nr_z=
one_active_anon
>       20434            -2.0%      20027        proc-vmstat.nr_zone_active=
_file
>       82265            -4.4%      78653        proc-vmstat.nr_zone_inacti=
ve_anon
>     4971269            -6.1%    4667688        proc-vmstat.numa_hit
>     4971268            -6.1%    4667687        proc-vmstat.numa_local
>      293150            -4.6%     279668        proc-vmstat.pgactivate
>     5110253            -5.9%    4808331        proc-vmstat.pgalloc_normal
>      144088           -17.3%     119141        proc-vmstat.pgdeactivate
>     5087969            -5.8%    4791351        proc-vmstat.pgfree
>     3400472           -12.4%    2978555        proc-vmstat.pgpgout
>      126836           -16.8%     105510        proc-vmstat.pgrotated
>      616731            -5.1%     585318        interrupts.CAL:Function_ca=
ll_interrupts
>        6785 =C2=B1  4%     -11.8%       5983 =C2=B1  4%  interrupts.CPU11=
.CAL:Function_call_interrupts
>        6543 =C2=B1  3%     -12.3%       5735 =C2=B1  3%  interrupts.CPU17=
.CAL:Function_call_interrupts
>       34.17 =C2=B1 19%    +185.6%      97.57 =C2=B1108%  interrupts.CPU18=
.TLB:TLB_shootdowns
>      402.33 =C2=B1 33%     -42.1%     232.86 =C2=B1 21%  interrupts.CPU2.=
NMI:Non-maskable_interrupts
>      402.33 =C2=B1 33%     -42.1%     232.86 =C2=B1 21%  interrupts.CPU2.=
PMI:Performance_monitoring_interrupts
>        5327 =C2=B1  6%     -15.6%       4496 =C2=B1  6%  interrupts.CPU20=
.CAL:Function_call_interrupts
>        5017 =C2=B1  4%     -12.6%       4384 =C2=B1  6%  interrupts.CPU21=
.CAL:Function_call_interrupts
>        5106 =C2=B1  4%     -12.6%       4461 =C2=B1  6%  interrupts.CPU22=
.CAL:Function_call_interrupts
>        5046 =C2=B1  3%     -13.0%       4389 =C2=B1  5%  interrupts.CPU25=
.CAL:Function_call_interrupts
>        5126 =C2=B1  2%     -13.7%       4422 =C2=B1  5%  interrupts.CPU26=
.CAL:Function_call_interrupts
>        5025 =C2=B1  5%     -14.1%       4318 =C2=B1  3%  interrupts.CPU27=
.CAL:Function_call_interrupts
>        5074 =C2=B1  5%     -12.3%       4451 =C2=B1  4%  interrupts.CPU28=
.CAL:Function_call_interrupts
>        4985 =C2=B1  3%     -12.0%       4386 =C2=B1  3%  interrupts.CPU29=
.CAL:Function_call_interrupts
>        5168 =C2=B1  7%     -14.2%       4436 =C2=B1  6%  interrupts.CPU31=
.CAL:Function_call_interrupts
>        5390 =C2=B1 10%     -16.7%       4492 =C2=B1  8%  interrupts.CPU33=
.CAL:Function_call_interrupts
>        4929 =C2=B1  2%     -11.1%       4379 =C2=B1  5%  interrupts.CPU34=
.CAL:Function_call_interrupts
>        4942 =C2=B1  3%     -11.7%       4366 =C2=B1  5%  interrupts.CPU35=
.CAL:Function_call_interrupts
>        3625 =C2=B1  3%      -8.2%       3329 =C2=B1  5%  interrupts.CPU39=
.CAL:Function_call_interrupts
>        3658 =C2=B1  4%     -10.0%       3290 =C2=B1  3%  interrupts.CPU40=
.CAL:Function_call_interrupts
>        3825 =C2=B1  6%     -16.3%       3203 =C2=B1  6%  interrupts.CPU42=
.CAL:Function_call_interrupts
>        3665 =C2=B1  4%     -15.7%       3088 =C2=B1 10%  interrupts.CPU43=
.CAL:Function_call_interrupts
>        3664 =C2=B1  6%     -10.5%       3279 =C2=B1  6%  interrupts.CPU44=
.CAL:Function_call_interrupts
>        3788 =C2=B1  7%     -13.4%       3280 =C2=B1  4%  interrupts.CPU46=
.CAL:Function_call_interrupts
>        3895 =C2=B1 15%     -16.3%       3261 =C2=B1  4%  interrupts.CPU47=
.CAL:Function_call_interrupts
>        3945 =C2=B1  7%     -15.0%       3352 =C2=B1  5%  interrupts.CPU48=
.CAL:Function_call_interrupts
>        3838 =C2=B1 10%     -15.7%       3237 =C2=B1  4%  interrupts.CPU49=
.CAL:Function_call_interrupts
>        6927 =C2=B1  5%     -13.5%       5991 =C2=B1  8%  interrupts.CPU5.=
CAL:Function_call_interrupts
>        3459 =C2=B1  6%     -13.1%       3005 =C2=B1  6%  interrupts.CPU53=
.CAL:Function_call_interrupts
>        2564 =C2=B1  3%     -10.2%       2302 =C2=B1  7%  interrupts.CPU54=
.CAL:Function_call_interrupts
>        2517 =C2=B1  2%      -8.9%       2294 =C2=B1  6%  interrupts.CPU56=
.CAL:Function_call_interrupts
>        2517 =C2=B1  3%     -10.7%       2246 =C2=B1  7%  interrupts.CPU70=
.CAL:Function_call_interrupts
>       20310 =C2=B1  4%     -13.1%      17648 =C2=B1  8%  interrupts.NMI:N=
on-maskable_interrupts
>       20310 =C2=B1  4%     -13.1%      17648 =C2=B1  8%  interrupts.PMI:P=
erformance_monitoring_interrupts
>        0.06 =C2=B1 91%     -86.0%       0.01 =C2=B1130%  perf-sched.sch_d=
elay.avg.ms.preempt_schedule_common.__cond_resched.pagecache_get_page.__get=
_node_page.f2fs_update_inode_page
>        0.04 =C2=B1  6%     +16.1%       0.05 =C2=B1  8%  perf-sched.sch_d=
elay.avg.ms.rwsem_down_read_slowpath.__submit_merged_write_cond.f2fs_fsync_=
node_pages.f2fs_do_sync_file
>        0.03 =C2=B1  9%    +110.0%       0.07 =C2=B1 97%  perf-sched.sch_d=
elay.avg.ms.rwsem_down_write_slowpath.set_node_addr.__write_node_page.f2fs_=
fsync_node_pages
>        0.67 =C2=B1 66%     -66.9%       0.22 =C2=B1 43%  perf-sched.sch_d=
elay.max.ms.issue_flush_thread.kthread.ret_from_fork
>        0.19 =C2=B1 89%     -93.9%       0.01 =C2=B1127%  perf-sched.sch_d=
elay.max.ms.preempt_schedule_common.__cond_resched.pagecache_get_page.__get=
_node_page.f2fs_update_inode_page
>        0.45 =C2=B1 43%     -56.5%       0.20 =C2=B1 68%  perf-sched.sch_d=
elay.max.ms.rwsem_down_read_slowpath.f2fs_submit_merged_ipu_write.f2fs_wait=
_on_page_writeback.f2fs_wait_on_node_pages_writeback
>        8.98 =C2=B1198%     -93.0%       0.63 =C2=B1 28%  perf-sched.sch_d=
elay.max.ms.rwsem_down_write_slowpath.set_node_addr.f2fs_new_node_page.f2fs=
_new_inode_page
>        0.08 =C2=B1 34%     -41.0%       0.05 =C2=B1 38%  perf-sched.sch_d=
elay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.=
0.do_sys_poll
>       45.26 =C2=B1  6%     +28.5%      58.17 =C2=B1  7%  perf-sched.total=
_wait_and_delay.average.ms
>       61502 =C2=B1  6%     -27.7%      44475 =C2=B1 11%  perf-sched.total=
_wait_and_delay.count.ms
>       45.23 =C2=B1  6%     +28.5%      58.14 =C2=B1  7%  perf-sched.total=
_wait_time.average.ms
>        6.59 =C2=B1 10%     +39.7%       9.20 =C2=B1 10%  perf-sched.wait_=
and_delay.avg.ms.io_schedule.wait_on_page_bit.wait_on_page_writeback.f2fs_w=
ait_on_page_writeback
>        4.48 =C2=B1  9%     -53.8%       2.07 =C2=B1 71%  perf-sched.wait_=
and_delay.avg.ms.rwsem_down_read_slowpath.f2fs_need_inode_block_update.f2fs=
_do_sync_file.do_fsync
>        9.17 =C2=B1 14%     -31.8%       6.25 =C2=B1 11%  perf-sched.wait_=
and_delay.avg.ms.rwsem_down_write_slowpath.set_node_addr.__write_node_page.=
f2fs_fsync_node_pages
>        7540 =C2=B1 11%     -26.6%       5536 =C2=B1 17%  perf-sched.wait_=
and_delay.count.io_schedule.wait_on_page_bit.wait_on_page_writeback.__filem=
ap_fdatawait_range
>       19838 =C2=B1  8%     -35.6%      12768 =C2=B1 15%  perf-sched.wait_=
and_delay.count.io_schedule.wait_on_page_bit.wait_on_page_writeback.f2fs_wa=
it_on_page_writeback
>      911.33 =C2=B1  6%     -29.8%     639.43 =C2=B1 10%  perf-sched.wait_=
and_delay.count.rwsem_down_read_slowpath.__submit_merged_write_cond.f2fs_fs=
ync_node_pages.f2fs_do_sync_file
>        2795 =C2=B1  6%     -43.1%       1589 =C2=B1 20%  perf-sched.wait_=
and_delay.count.rwsem_down_read_slowpath.__submit_merged_write_cond.f2fs_wa=
it_on_page_writeback.f2fs_wait_on_node_pages_writeback
>      491.67 =C2=B1 14%     -46.0%     265.29 =C2=B1 49%  perf-sched.wait_=
and_delay.count.rwsem_down_read_slowpath.f2fs_get_node_info.__write_node_pa=
ge.f2fs_fsync_node_pages
>        1726 =C2=B1 28%     -48.5%     889.29 =C2=B1 42%  perf-sched.wait_=
and_delay.count.rwsem_down_read_slowpath.f2fs_get_node_info.f2fs_do_write_d=
ata_page.f2fs_write_single_data_page
>      839.00 =C2=B1 31%     -59.6%     338.57 =C2=B1 56%  perf-sched.wait_=
and_delay.count.rwsem_down_read_slowpath.f2fs_get_node_info.truncate_node.f=
2fs_remove_inode_page
>      509.67 =C2=B1 12%     -46.6%     272.00 =C2=B1 48%  perf-sched.wait_=
and_delay.count.rwsem_down_read_slowpath.f2fs_need_dentry_mark.f2fs_fsync_n=
ode_pages.f2fs_do_sync_file
>      497.83 =C2=B1 12%     -58.8%     205.00 =C2=B1 67%  perf-sched.wait_=
and_delay.count.rwsem_down_read_slowpath.f2fs_need_inode_block_update.f2fs_=
do_sync_file.do_fsync
>      267.17 =C2=B1 23%     -75.7%      64.86 =C2=B1128%  perf-sched.wait_=
and_delay.count.rwsem_down_write_slowpath.f2fs_merge_page_bio.f2fs_inplace_=
write_data.f2fs_do_write_data_page
>        1539 =C2=B1  5%     -49.4%     779.14 =C2=B1 15%  perf-sched.wait_=
and_delay.count.rwsem_down_write_slowpath.f2fs_submit_page_write.do_write_p=
age.f2fs_do_write_node_page
>      791.00 =C2=B1 13%     -45.2%     433.57 =C2=B1 27%  perf-sched.wait_=
and_delay.count.rwsem_down_write_slowpath.set_node_addr.__write_node_page.f=
2fs_fsync_node_pages
>      910.67 =C2=B1 20%     -54.1%     417.86 =C2=B1 38%  perf-sched.wait_=
and_delay.count.rwsem_down_write_slowpath.set_node_addr.f2fs_new_node_page.=
f2fs_new_inode_page
>      856.83 =C2=B1 29%     -60.2%     341.14 =C2=B1 57%  perf-sched.wait_=
and_delay.count.rwsem_down_write_slowpath.set_node_addr.truncate_node.f2fs_=
remove_inode_page
>        3465 =C2=B1  2%     -21.4%       2725 =C2=B1  8%  perf-sched.wait_=
and_delay.count.schedule_timeout.wait_for_completion.f2fs_issue_flush.f2fs_=
do_sync_file
>      142.28 =C2=B1  8%   +1126.8%       1745 =C2=B1 97%  perf-sched.wait_=
and_delay.max.ms.io_schedule.wait_on_page_bit.wait_on_page_writeback.__file=
map_fdatawait_range
>        5186 =C2=B1  2%     +22.8%       6370 =C2=B1 11%  perf-sched.wait_=
and_delay.max.ms.worker_thread.kthread.ret_from_fork
>        6.56 =C2=B1 10%     +39.7%       9.17 =C2=B1 10%  perf-sched.wait_=
time.avg.ms.io_schedule.wait_on_page_bit.wait_on_page_writeback.f2fs_wait_o=
n_page_writeback
>       15.00 =C2=B1 88%     -75.6%       3.65 =C2=B1165%  perf-sched.wait_=
time.avg.ms.preempt_schedule_common.__cond_resched.pagecache_get_page.__get=
_node_page.f2fs_find_in_inline_dir
>        2.74 =C2=B1 17%     +90.3%       5.22 =C2=B1 24%  perf-sched.wait_=
time.avg.ms.rwsem_down_read_slowpath.f2fs_get_node_info.__write_node_page.f=
2fs_fsync_node_pages
>        4.46 =C2=B1  9%     -43.4%       2.52 =C2=B1 35%  perf-sched.wait_=
time.avg.ms.rwsem_down_read_slowpath.f2fs_need_inode_block_update.f2fs_do_s=
ync_file.do_fsync
>        9.14 =C2=B1 14%     -32.3%       6.18 =C2=B1 12%  perf-sched.wait_=
time.avg.ms.rwsem_down_write_slowpath.set_node_addr.__write_node_page.f2fs_=
fsync_node_pages
>      142.23 =C2=B1  8%   +1127.2%       1745 =C2=B1 97%  perf-sched.wait_=
time.max.ms.io_schedule.wait_on_page_bit.wait_on_page_writeback.__filemap_f=
datawait_range
>       33.23 =C2=B1 80%     -62.6%      12.44 =C2=B1158%  perf-sched.wait_=
time.max.ms.preempt_schedule_common.__cond_resched.mnt_want_write.do_unlink=
at.do_syscall_64
>       52.12 =C2=B1 53%     -73.9%      13.59 =C2=B1161%  perf-sched.wait_=
time.max.ms.preempt_schedule_common.__cond_resched.pagecache_get_page.__get=
_node_page.f2fs_update_inode_page
>        5186 =C2=B1  2%     +22.8%       6370 =C2=B1 11%  perf-sched.wait_=
time.max.ms.worker_thread.kthread.ret_from_fork
>       43.08 =C2=B1  8%      -8.5       34.60 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>       41.46 =C2=B1  9%      -8.2       33.29 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        4.91 =C2=B1 10%      -1.2        3.67 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.vfs_write.ksys_pwrite64.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
>        4.94 =C2=B1 10%      -1.2        3.70 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.ksys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        4.77 =C2=B1 11%      -1.2        3.57 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.new_sync_write.vfs_write.ksys_pwrite64.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>        4.72 =C2=B1 11%      -1.2        3.53 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.f2fs_file_write_iter.new_sync_write.vfs_write.ksys_pwrite6=
4.do_syscall_64
>        5.97 =C2=B1  9%      -1.2        4.80 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.do_sys_open.do_sys=
call_64
>        6.06 =C2=B1  9%      -1.2        4.89 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>        3.52 =C2=B1 13%      -0.9        2.60 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        3.06 =C2=B1 12%      -0.8        2.30 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.__generic_file_write_iter.f2fs_file_write_iter.new_sync_wr=
ite.vfs_write.ksys_pwrite64
>        2.62 =C2=B1 15%      -0.7        1.91 =C2=B1 16%  perf-profile.cal=
ltrace.cycles-pp.evict.do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
>        2.52 =C2=B1 15%      -0.7        1.82 =C2=B1 16%  perf-profile.cal=
ltrace.cycles-pp.f2fs_evict_inode.evict.do_unlinkat.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>        3.45 =C2=B1  5%      -0.7        2.79 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
>        2.16 =C2=B1 15%      -0.6        1.52 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.f2fs_create.path_openat.do_filp_open.do_sys_openat2.do_sys=
_open
>        3.30 =C2=B1  6%      -0.6        2.67 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.vfs_statx.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
>        2.43 =C2=B1  9%      -0.6        1.84 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.f2fs_wait_on_node_pages_writeback.f2fs_do_sync_file.do_fsy=
nc.__x64_sys_fsync.do_syscall_64
>        2.37 =C2=B1  9%      -0.6        1.80 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.f2fs_wait_on_page_writeback.f2fs_wait_on_node_pages_writeb=
ack.f2fs_do_sync_file.do_fsync.__x64_sys_fsync
>        2.19 =C2=B1  6%      -0.4        1.75 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.__do_sys_newstat.d=
o_syscall_64
>        1.39 =C2=B1 16%      -0.4        0.96 =C2=B1 17%  perf-profile.cal=
ltrace.cycles-pp.f2fs_do_add_link.f2fs_create.path_openat.do_filp_open.do_s=
ys_openat2
>        1.34 =C2=B1 16%      -0.4        0.91 =C2=B1 18%  perf-profile.cal=
ltrace.cycles-pp.f2fs_add_dentry.f2fs_do_add_link.f2fs_create.path_openat.d=
o_filp_open
>        1.33 =C2=B1 16%      -0.4        0.90 =C2=B1 18%  perf-profile.cal=
ltrace.cycles-pp.f2fs_add_inline_entry.f2fs_add_dentry.f2fs_do_add_link.f2f=
s_create.path_openat
>        1.71 =C2=B1 15%      -0.4        1.29 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.se=
condary_startup_64_no_verify
>        1.02 =C2=B1 14%      -0.4        0.60 =C2=B1 43%  perf-profile.cal=
ltrace.cycles-pp.f2fs_remove_inode_page.f2fs_evict_inode.evict.do_unlinkat.=
do_syscall_64
>        1.69 =C2=B1 15%      -0.4        1.27 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_s=
econdary
>        1.59 =C2=B1  7%      -0.4        1.18 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.link_path_walk.path_lookupat.filename_lookup.vfs_statx.__d=
o_sys_newstat
>        1.47 =C2=B1  9%      -0.4        1.06 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.f2fs_preallocate_blocks.f2fs_file_write_iter.new_sync_writ=
e.vfs_write.ksys_pwrite64
>        0.94 =C2=B1 14%      -0.4        0.54 =C2=B1 44%  perf-profile.cal=
ltrace.cycles-pp.truncate_node.f2fs_remove_inode_page.f2fs_evict_inode.evic=
t.do_unlinkat
>        1.78 =C2=B1 10%      -0.4        1.42 =C2=B1 16%  perf-profile.cal=
ltrace.cycles-pp.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        1.74 =C2=B1 11%      -0.3        1.39 =C2=B1 17%  perf-profile.cal=
ltrace.cycles-pp.vfs_read.ksys_pread64.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
>        0.77 =C2=B1 15%      -0.3        0.45 =C2=B1 65%  perf-profile.cal=
ltrace.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_sweve=
nt_overflow.perf_tp_event.perf_trace_sched_switch
>        1.07 =C2=B1  7%      -0.3        0.75 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.f2fs_convert_inline_inode.f2fs_preallocate_blocks.f2fs_fil=
e_write_iter.new_sync_write.vfs_write
>        0.61 =C2=B1  9%      -0.3        0.31 =C2=B1 86%  perf-profile.cal=
ltrace.cycles-pp.user_path_at_empty.vfs_statx.__do_sys_newstat.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
>        0.62 =C2=B1 12%      -0.3        0.32 =C2=B1 87%  perf-profile.cal=
ltrace.cycles-pp.truncate_inode_pages_range.f2fs_evict_inode.evict.do_unlin=
kat.do_syscall_64
>        1.46 =C2=B1 10%      -0.3        1.18 =C2=B1 20%  perf-profile.cal=
ltrace.cycles-pp.f2fs_file_read_iter.new_sync_read.vfs_read.ksys_pread64.do=
_syscall_64
>        1.39 =C2=B1 10%      -0.3        1.11 =C2=B1 19%  perf-profile.cal=
ltrace.cycles-pp.filemap_read.f2fs_file_read_iter.new_sync_read.vfs_read.ks=
ys_pread64
>        0.91 =C2=B1  8%      -0.3        0.64 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp.f2fs_convert_inline_page.f2fs_convert_inline_inode.f2fs_pr=
eallocate_blocks.f2fs_file_write_iter.new_sync_write
>        1.40 =C2=B1  9%      -0.3        1.13 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
>        1.00 =C2=B1 15%      -0.2        0.77 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.__filemap_fdatawait_range.file_write_and_wait_range.f2fs_d=
o_sync_file.do_fsync.__x64_sys_fsync
>        0.95 =C2=B1 15%      -0.2        0.72 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.wait_on_page_writeback.__filemap_fdatawait_range.file_writ=
e_and_wait_range.f2fs_do_sync_file.do_fsync
>        0.94 =C2=B1 15%      -0.2        0.71 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.wait_on_page_bit.wait_on_page_writeback.__filemap_fdatawai=
t_range.file_write_and_wait_range.f2fs_do_sync_file
>        0.91 =C2=B1 15%      -0.2        0.70 =C2=B1 16%  perf-profile.cal=
ltrace.cycles-pp.io_schedule.wait_on_page_bit.wait_on_page_writeback.__file=
map_fdatawait_range.file_write_and_wait_range
>        0.90 =C2=B1 15%      -0.2        0.69 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.schedule.io_schedule.wait_on_page_bit.wait_on_page_writeba=
ck.__filemap_fdatawait_range
>        1.16 =C2=B1 10%      -0.2        0.96 =C2=B1 15%  perf-profile.cal=
ltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_=
SYSCALL_64_after_hwframe
>        1.12 =C2=B1  9%      -0.2        0.93 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.do_=
sys_open
>        0.83 =C2=B1  9%      -0.2        0.66 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.walk_component.link_path_walk.path_lookupat.filename_looku=
p.vfs_statx
>        0.74 =C2=B1  9%      +0.1        0.88 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.rebalan=
ce_domains.__softirqentry_text_start
>        0.82 =C2=B1  8%      +0.1        0.96 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.find_busiest_group.load_balance.rebalance_domains.__softir=
qentry_text_start.irq_exit_rcu
>        1.16 =C2=B1  4%      +0.2        1.38 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.load_balance.rebalance_domains.__softirqentry_text_start.i=
rq_exit_rcu.sysvec_apic_timer_interrupt
>        1.36 =C2=B1  4%      +0.2        1.61 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.rebalance_domains.__softirqentry_text_start.irq_exit_rcu.s=
ysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>        1.53 =C2=B1  4%      +0.3        1.84 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick=
_sched_timer.__hrtimer_run_queues
>        1.05 =C2=B1  5%      +0.3        1.36 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.__sy=
svec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>        3.10 =C2=B1  2%      +0.7        3.80 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__=
hrtimer_run_queues.hrtimer_interrupt
>        3.54 =C2=B1  2%      +0.7        4.26 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_i=
nterrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>        3.35 =C2=B1  2%      +0.8        4.12 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hr=
timer_interrupt.__sysvec_apic_timer_interrupt
>        4.14 =C2=B1  3%      +0.8        4.97 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_t=
imer_interrupt.cpuidle_enter_state.cpuidle_enter
>       43.33 =C2=B1  7%      +8.1       51.42 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.secondary_startup_64_no_verify
>       42.38 =C2=B1  7%      +8.2       50.54 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startu=
p_64_no_verify
>       42.46 =C2=B1  7%      +8.2       50.64 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>       42.46 =C2=B1  7%      +8.2       50.64 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_=
verify
>       48.00 =C2=B1  6%      -7.9       40.13 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.entry_SYSCALL_64_after_hwframe
>       46.03 =C2=B1  7%      -7.6       38.47 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.do_syscall_64
>        8.17 =C2=B1 10%      -1.9        6.28 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__schedule
>        6.38 =C2=B1  9%      -1.5        4.89 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.schedule
>        6.11 =C2=B1 10%      -1.3        4.77 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.perf_tp_event
>        5.66 =C2=B1  9%      -1.3        4.33 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.vfs_write
>        5.49 =C2=B1  9%      -1.3        4.20 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.new_sync_write
>        5.86 =C2=B1 11%      -1.3        4.58 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.perf_swevent_overflow
>        5.83 =C2=B1 11%      -1.3        4.55 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.__perf_event_overflow
>        5.77 =C2=B1 11%      -1.3        4.50 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.perf_event_output_forward
>        4.94 =C2=B1 10%      -1.2        3.70 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.ksys_pwrite64
>        4.72 =C2=B1 11%      -1.2        3.53 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.f2fs_file_write_iter
>        4.99 =C2=B1 11%      -1.2        3.81 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.perf_prepare_sample
>        4.50 =C2=B1 11%      -1.1        3.40 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.get_perf_callchain
>        4.52 =C2=B1 12%      -1.1        3.43 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.perf_callchain
>        3.69 =C2=B1 12%      -1.0        2.73 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.perf_callchain_kernel
>        3.52 =C2=B1 13%      -0.9        2.60 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.do_unlinkat
>        3.54 =C2=B1 11%      -0.8        2.72 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.__generic_file_write_iter
>        3.31 =C2=B1 13%      -0.8        2.55 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.generic_perform_write
>        3.08 =C2=B1 10%      -0.7        2.35 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.io_schedule
>        2.64 =C2=B1 15%      -0.7        1.93 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.evict
>        2.53 =C2=B1 15%      -0.7        1.83 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.f2fs_evict_inode
>        3.14 =C2=B1  9%      -0.7        2.44 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.wait_on_page_writeback
>        2.93 =C2=B1  8%      -0.7        2.24 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.f2fs_wait_on_page_writeback
>        3.11 =C2=B1  9%      -0.7        2.41 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.wait_on_page_bit
>        1.45 =C2=B1 20%      -0.7        0.79 =C2=B1 22%  perf-profile.chi=
ldren.cycles-pp.rwsem_down_write_slowpath
>        2.16 =C2=B1 15%      -0.6        1.52 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.f2fs_create
>        3.93 =C2=B1  4%      -0.6        3.33 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__do_sys_newstat
>        3.79 =C2=B1  5%      -0.6        3.20 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.vfs_statx
>        2.43 =C2=B1  9%      -0.6        1.84 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.f2fs_wait_on_node_pages_writeback
>        3.30 =C2=B1  6%      -0.6        2.71 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.link_path_walk
>        2.20 =C2=B1 13%      -0.6        1.65 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.perf_trace_sched_switch
>        1.26 =C2=B1 11%      -0.5        0.74 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.rwsem_down_read_slowpath
>        1.54 =C2=B1 15%      -0.5        1.03 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.do_write_page
>        0.98 =C2=B1 22%      -0.5        0.47 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.native_queued_spin_lock_slowpath
>        1.96 =C2=B1 13%      -0.5        1.47 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.pagecache_get_page
>        2.11 =C2=B1 11%      -0.5        1.63 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.dequeue_task_fair
>        2.33 =C2=B1 11%      -0.5        1.85 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.newidle_balance
>        1.45 =C2=B1 16%      -0.5        0.99 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.f2fs_do_add_link
>        2.02 =C2=B1 11%      -0.4        1.57 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.dequeue_entity
>        1.39 =C2=B1 16%      -0.4        0.94 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.f2fs_add_dentry
>        1.38 =C2=B1 16%      -0.4        0.94 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.f2fs_add_inline_entry
>        1.74 =C2=B1 15%      -0.4        1.30 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.schedule_idle
>        3.00 =C2=B1  5%      -0.4        2.58 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.filename_lookup
>        1.48 =C2=B1  9%      -0.4        1.06 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.f2fs_preallocate_blocks
>        1.78 =C2=B1 10%      -0.4        1.42 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.ksys_pread64
>        1.02 =C2=B1 14%      -0.4        0.67 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.f2fs_remove_inode_page
>        0.95 =C2=B1 14%      -0.3        0.60 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.truncate_node
>        1.10 =C2=B1 16%      -0.3        0.75 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.f2fs_outplace_write_data
>        0.78 =C2=B1 19%      -0.3        0.44 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.rwsem_wake
>        1.09 =C2=B1  7%      -0.3        0.76 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.f2fs_convert_inline_inode
>        1.38 =C2=B1 11%      -0.3        1.06 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.perf_trace_sched_wakeup_template
>        0.76 =C2=B1 20%      -0.3        0.44 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.wake_up_q
>        1.50 =C2=B1  9%      -0.3        1.20 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.filemap_read
>        0.81 =C2=B1 15%      -0.3        0.52 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.f2fs_submit_page_write
>        0.63 =C2=B1 17%      -0.3        0.34 =C2=B1 42%  perf-profile.chi=
ldren.cycles-pp.f2fs_get_node_info
>        1.39 =C2=B1 12%      -0.3        1.10 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.__unwind_start
>        0.52 =C2=B1 29%      -0.3        0.24 =C2=B1 50%  perf-profile.chi=
ldren.cycles-pp.osq_lock
>        1.46 =C2=B1 10%      -0.3        1.18 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.f2fs_file_read_iter
>        1.19 =C2=B1 14%      -0.3        0.91 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock
>        0.91 =C2=B1  8%      -0.3        0.64 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.f2fs_convert_inline_page
>        0.95 =C2=B1 11%      -0.2        0.70 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.__orc_find
>        1.18 =C2=B1  5%      -0.2        0.93 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__submit_merged_write_cond
>        1.00 =C2=B1 15%      -0.2        0.77 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.__filemap_fdatawait_range
>        2.31 =C2=B1  7%      -0.2        2.08 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.walk_component
>        0.84 =C2=B1 12%      -0.2        0.63 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.inode_permission
>        0.78 =C2=B1 11%      -0.2        0.57 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.add_to_page_cache_lru
>        0.65 =C2=B1 12%      -0.2        0.46 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.__add_to_page_cache_locked
>        0.64 =C2=B1 11%      -0.2        0.45 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.orc_find
>        0.36 =C2=B1 24%      -0.2        0.19 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.f2fs_invalidate_blocks
>        0.53 =C2=B1 24%      -0.2        0.37 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.generic_permission
>        0.58 =C2=B1 21%      -0.2        0.41 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.finish_task_switch
>        0.76 =C2=B1 25%      -0.2        0.61 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_free
>        0.57 =C2=B1 10%      -0.1        0.43 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.sched_ttwu_pending
>        0.52 =C2=B1 14%      -0.1        0.37 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.asm_sysvec_call_function_single
>        0.48 =C2=B1 24%      -0.1        0.34 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.make_kuid
>        0.48 =C2=B1 14%      -0.1        0.35 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.sysvec_call_function_single
>        0.60 =C2=B1 10%      -0.1        0.48 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.__entry_text_start
>        0.32 =C2=B1 21%      -0.1        0.20 =C2=B1 21%  perf-profile.chi=
ldren.cycles-pp.filemap_get_pages
>        0.67 =C2=B1 14%      -0.1        0.55 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.step_into
>        0.45 =C2=B1 24%      -0.1        0.34 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.map_id_range_down
>        0.60 =C2=B1 10%      -0.1        0.49 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.vfs_unlink
>        0.33 =C2=B1 13%      -0.1        0.24 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.do_renameat2
>        0.24 =C2=B1 16%      -0.1        0.17 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.aa_get_task_label
>        0.17 =C2=B1 26%      -0.1        0.11 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.filename_parentat
>        0.20 =C2=B1 15%      -0.1        0.14 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.__sysvec_call_function_single
>        0.09 =C2=B1 24%      -0.1        0.04 =C2=B1 63%  perf-profile.chi=
ldren.cycles-pp.xas_create
>        0.14 =C2=B1 10%      -0.1        0.09 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.set_page_dirty
>        0.15 =C2=B1 18%      -0.1        0.10 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.path_parentat
>        0.12 =C2=B1 35%      -0.0        0.07 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.truncate_cleanup_page
>        0.17 =C2=B1  9%      -0.0        0.12 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.__f2fs_find_entry
>        0.14 =C2=B1 11%      -0.0        0.10 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.mem_cgroup_uncharge_list
>        0.11 =C2=B1 19%      -0.0        0.07 =C2=B1 49%  perf-profile.chi=
ldren.cycles-pp.set_task_cpu
>        0.26 =C2=B1  7%      -0.0        0.22 =C2=B1 17%  perf-profile.chi=
ldren.cycles-pp.entry_SYSCALL_64_safe_stack
>        0.19 =C2=B1 14%      -0.0        0.14 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.lru_add_drain_cpu
>        0.15 =C2=B1 11%      -0.0        0.11 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.f2fs_find_in_inline_dir
>        0.08 =C2=B1 18%      -0.0        0.04 =C2=B1 65%  perf-profile.chi=
ldren.cycles-pp.perf_trace_buf_update
>        0.12 =C2=B1 16%      -0.0        0.09 =C2=B1 26%  perf-profile.chi=
ldren.cycles-pp.__test_set_page_writeback
>        0.14 =C2=B1 13%      -0.0        0.11 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__mark_inode_dirty
>        0.15 =C2=B1 10%      -0.0        0.12 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__list_add_valid
>        0.15 =C2=B1 14%      +0.0        0.20 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.nr_iowait_cpu
>        0.30 =C2=B1  9%      +0.1        0.37 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.mmput
>        0.29 =C2=B1  8%      +0.1        0.37 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.exit_mmap
>        0.16 =C2=B1 11%      +0.1        0.23 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.rb_next
>        0.03 =C2=B1100%      +0.1        0.11 =C2=B1 32%  perf-profile.chi=
ldren.cycles-pp.sys_imageblit
>        0.03 =C2=B1100%      +0.1        0.11 =C2=B1 32%  perf-profile.chi=
ldren.cycles-pp.drm_fb_helper_sys_imageblit
>        0.18 =C2=B1 10%      +0.1        0.27 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.trigger_load_balance
>        0.50 =C2=B1  5%      +0.1        0.58 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__hrtimer_next_event_base
>        0.05 =C2=B1 45%      +0.1        0.14 =C2=B1 42%  perf-profile.chi=
ldren.cycles-pp.vt_console_print
>        1.06 =C2=B1  7%      +0.2        1.26 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.update_blocked_averages
>        1.43 =C2=B1  5%      +0.3        1.69 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.rebalance_domains
>        1.79 =C2=B1  5%      +0.4        2.20 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.clockevents_program_event
>       43.33 =C2=B1  7%      +8.1       51.42 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.secondary_startup_64_no_verify
>       43.33 =C2=B1  7%      +8.1       51.42 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.cpu_startup_entry
>       43.32 =C2=B1  7%      +8.1       51.42 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.do_idle
>       42.46 =C2=B1  7%      +8.2       50.64 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.start_secondary
>        0.49 =C2=B1 28%      -0.3        0.23 =C2=B1 48%  perf-profile.sel=
f.cycles-pp.osq_lock
>        0.94 =C2=B1 11%      -0.3        0.69 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.__orc_find
>        1.07 =C2=B1  7%      -0.2        0.85 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.copy_user_enhanced_fast_string
>        0.60 =C2=B1 10%      -0.1        0.46 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.__entry_text_start
>        0.29 =C2=B1 12%      -0.1        0.23 =C2=B1 15%  perf-profile.sel=
f.cycles-pp.__schedule
>        0.17 =C2=B1 15%      -0.1        0.12 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.update_curr
>        0.14 =C2=B1 16%      -0.0        0.10 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.path_init
>        0.21 =C2=B1  6%      -0.0        0.17 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.entry_SYSCALL_64_safe_stack
>        0.09 =C2=B1 18%      -0.0        0.05 =C2=B1 42%  perf-profile.sel=
f.cycles-pp.current_time
>        0.17 =C2=B1  8%      -0.0        0.13 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.f2fs_fill_dentries
>        0.08 =C2=B1 11%      -0.0        0.05 =C2=B1 44%  perf-profile.sel=
f.cycles-pp.path_lookupat
>        0.10 =C2=B1  9%      -0.0        0.08 =C2=B1 21%  perf-profile.sel=
f.cycles-pp.__lookup_mnt
>        0.09 =C2=B1 20%      +0.1        0.16 =C2=B1 24%  perf-profile.sel=
f.cycles-pp.rcu_core
>        0.15 =C2=B1 14%      +0.1        0.23 =C2=B1 19%  perf-profile.sel=
f.cycles-pp.trigger_load_balance
>
>
>                                                                          =
        =

>                  fxmark.hdd_f2fs_dbench_client_72_directio.works_sec
>                                                                          =
        =

>    200 +-----------------------------------------------------------------=
----+
>        |                                                                 =
+.  |
>    190 |.+.+   +.   .+         +. .+.+.+.+.+.+.+. .+.+.+. .+.+.         :=
  +.|
>    180 |-+  + +  +.+  +       +  +               +       +     +. .+.   :=
    |
>        |     +         +.+.+.+                                   +   +.+ =
    |
>    170 |-+                                                               =
    |
>        |                                                                 =
    |
>    160 |-+         O                                                     =
    |
>        |   O                                                             =
    |
>    150 |-O                   O   O O       O O     O O   O O     O O     =
    |
>    140 |-+               O O           O O     O O           O O         =
    |
>        |       O O   O               O                                   =
    |
>    130 |-+             O       O                       O             O   =
    |
>        |     O                                                           =
    |
>    120 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                   fxmark.hdd_f2fs_dbench_client_72_directio.sys_sec
>                                                                          =
        =

>    145 +-----------------------------------------------------------------=
----+
>    140 |-+     +   +   +                                                .=
+   |
>        |.+.   : + + : : +     .+.   .+.+. .+.+.        +.   .+        .+ =
 :  |
>    135 |-+ +. :  +  : :  +   +   +.+     +     +.+.+. +  +.+  +     .+   =
 :  |
>    130 |-+   +       +    + +                        +         +.+.+     =
  +.|
>    125 |-+                 +                                             =
    |
>    120 |-+                                                               =
    |
>        |                                                                 =
    |
>    115 |-O         O         O                                           =
    |
>    110 |-+ O     O       O O   O O O   O   O O       O   O O       O     =
    |
>    105 |-+     O     O               O   O     O O O         O O O       =
    |
>    100 |-+             O                               O             O   =
    |
>        |                                                                 =
    |
>     95 |-+   O                                                           =
    |
>     90 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                  fxmark.hdd_f2fs_dbench_client_72_directio.sys_util
>                                                                          =
        =

>    3.4 +-----------------------------------------------------------------=
----+
>        |           +                                                     =
    |
>    3.2 |.+     +. + :  +      .+    .+.   .+.                           .=
+   |
>        | +.+. +  +  : + +    +  + .+   +.+   +.+.     .+.+. .+.       .+ =
 +  |
>      3 |-+   +       +   +. +    +               +.+.+     +   +. .+.+   =
  +.|
>        |                   +                                     +       =
    |
>    2.8 |-+                                                               =
    |
>        |                                                                 =
    |
>    2.6 |-O O       O         O                                           =
    |
>        |         O       O O   O O O   O O O O O     O   O O O     O     =
    |
>    2.4 |-+     O     O               O           O O           O O       =
    |
>        |               O                               O             O   =
    |
>    2.2 |-+   O                                                           =
    |
>        |                                                                 =
    |
>      2 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                   fxmark.hdd_f2fs_dbench_client_54_directio.sys_sec
>                                                                          =
        =

>    110 +-----------------------------------------------------------------=
----+
>        |.+                          .+.+   +.+                .+    .+.+ =
    |
>    105 |-++ .+   +.          +.   .+    + +   + .+.+   +   +.+  :  +    +=
   :|
>    100 |-+ +  + +  +.+      +  +.+       +     +    + + + +     : +      =
+. :|
>        |       +      + .+.+                         +   +       +       =
  + |
>     95 |-+             +                                                 =
    |
>        |                                                                 =
    |
>     90 |-+                                                               =
    |
>        |               O                                                 =
    |
>     85 |-+     O   O O       O     O       O O   O       O O   O         =
    |
>     80 |-O                           O   O           O O           O O   =
    |
>        |     O   O             O O     O       O   O         O   O       =
    |
>     75 |-+ O             O O                                             =
    |
>        |                                                                 =
    |
>     70 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                  fxmark.hdd_f2fs_dbench_client_54_directio.sys_util
>                                                                          =
        =

>    3.3 +-----------------------------------------------------------------=
----+
>    3.2 |-++ .+                    .+.+  + .+  +   .+   +   +. .+   +.+.+.=
    |
>        |   +  + .+.+.+      .+.+.+       +     +.+  + + + +  +  + +      =
+  :|
>    3.1 |-+     +      :  +.+                         +   +       +       =
 + :|
>      3 |-+            : +                                                =
  + |
>    2.9 |-+             +                                                 =
    |
>    2.8 |-+                                                               =
    |
>        |                                                                 =
    |
>    2.7 |-+             O                                                 =
    |
>    2.6 |-+         O         O     O       O O   O       O O   O         =
    |
>    2.5 |-O     O     O               O   O                               =
    |
>    2.4 |-+   O   O             O       O       O   O O O     O   O O O   =
    |
>        |   O               O     O                                       =
    |
>    2.3 |-+               O                                               =
    |
>    2.2 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                fxmark.time.user_time
>                                                                          =
        =

>    96 +------------------------------------------------------------------=
----+
>    94 |-+      .+                                                        =
    |
>       |.+. .+.+  +           .+   +.+.+.  .+.+. .+.+        .+.+        .=
+   |
>    92 |-+ +       +.+.+. .+.+  + +      +.     +    + .+.+.+    + .+.+.+ =
 :  |
>    90 |-+               +       +                    +           +       =
 : +|
>       |                                                                  =
  + |
>    88 |-+                                                                =
    |
>    86 |-+                                                                =
    |
>    84 |-+                                                                =
    |
>       |                                                                  =
    |
>    82 |-+         O                                                      =
    |
>    80 |-O       O         O O     O          O             O             =
    |
>       |   O           O             O O O            O O           O O   =
    |
>    78 |-+   O O     O   O     O O          O   O O O     O   O O O       =
    |
>    76 +------------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                fxmark.time.system_time
>                                                                          =
        =

>    370 +-----------------------------------------------------------------=
----+
>        |.+.+. .+.+.+.         .+. .+.+.+.+.+.+.+.+.+   +.   .+.         .=
+   |
>    360 |-+   +       +.+.   .+   +                  + +  +.+   +. .+.+.+ =
 :  |
>    350 |-+               +.+                         +           +       =
 : +|
>        |                                                                 =
  + |
>    340 |-+                                                               =
    |
>    330 |-+                                                               =
    |
>        |                                                                 =
    |
>    320 |-+                                                               =
    |
>    310 |-O         O                                                     =
    |
>        |   O     O         O O     O     O   O       O     O       O     =
    |
>    300 |-+     O     O O       O O   O O   O   O O O   O O   O O O   O   =
    |
>    290 |-+               O                                               =
    |
>        |     O                                                           =
    |
>    280 +-----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                          fxmark.time.voluntary_context_switches
>                                                                          =
        =

>    1.05e+06 +------------------------------------------------------------=
----+
>       1e+06 |-+                       +.                                 =
    |
>             |.+.+.++.+.+.+.+.    .+. +  +.+.++.+.+.+.+   ++.+.+.+.      .=
+   |
>      950000 |-+              +.++   +                 + +         +. .++ =
 :  |
>      900000 |-+                                        +            +    =
 : +|
>             |                                                            =
  + |
>      850000 |-+                                                          =
    |
>      800000 |-+                                                          =
    |
>      750000 |-+                                                          =
    |
>             |          O                                                 =
    |
>      700000 |-O                 O     O                                  =
    |
>      650000 |-+ O  O O   O O   O        O O OO O O     O  O O O     O    =
    |
>             |                O    O O              O O   O      O O   O  =
    |
>      600000 |-+   O                                                      =
    |
>      550000 +------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                              fxmark.time.file_system_outputs
>                                                                          =
        =

>    2.75e+07 +------------------------------------------------------------=
----+
>             |                     +                                      =
    |
>     2.7e+07 |.+. .++.+.+.        + + .+.+.+. +.+. .+.+   +   .+.+       .=
+   |
>    2.65e+07 |-+ +        +. .+. +   +       +    +    + + :.+    + .+.++ =
 : :|
>             |              +   +                       +  +       +      =
 : :|
>     2.6e+07 |-+                                                          =
  + |
>             |                                                            =
    |
>    2.55e+07 |-+                                                          =
    |
>             |                                                            =
    |
>     2.5e+07 |-+                                                          =
    |
>    2.45e+07 |-+        O              O                                  =
    |
>             | O O    O         O        O      O            O            =
    |
>     2.4e+07 |-+    O     O O    O         O OO         O  O         O    =
    |
>             |                O    O O            O O O   O    O O O   O  =
    |
>    2.35e+07 +------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
        =

> [*] bisect-good sample
> [O] bisect-bad  sample
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
>
--===============3189690026850539577==--

