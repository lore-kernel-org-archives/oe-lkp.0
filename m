Content-Type: multipart/mixed; boundary="===============6426354816325479412=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [AHCI] 18dcf433f3d: -3.3% fileio.requests_per_sec
Date: Mon, 27 Oct 2014 10:16:51 +0800
Message-ID: <20141027021651.GF27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6426354816325479412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 18dcf433f3ded61eb140a55e7048ec2fef79e723 ("AHCI: Optimize single IRQ=
 interrupt processing")


227dfb4dbf109596  18dcf433f3ded61eb140a55e70  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

     61.60 =C2=B1  1%      -3.3%      59.56 =C2=B1  0%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     61.60            -3.3%      59.56        GEO-MEAN fileio.requests_per_=
sec

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    436798 =C2=B1 28%     -73.4%     116066 =C2=B1 33%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    436798           -73.4%     116066        GEO-MEAN sched_debug.cpu#2.tt=
wu_local

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     29791 =C2=B1  4%     -72.7%       8123 =C2=B1  6%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     29791           -72.7%       8123        GEO-MEAN sched_debug.cfs_rq[2=
]:/.exec_clock

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     26505 =C2=B1  3%     -71.1%       7657 =C2=B1  6%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     26505           -71.1%       7657        GEO-MEAN sched_debug.cfs_rq[3=
]:/.exec_clock

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    211746 =C2=B1 47%    +122.7%     471499 =C2=B1 23%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    211746          +122.7%     471499        GEO-MEAN sched_debug.cpu#3.tt=
wu_count

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

        25 =C2=B1 38%    +206.3%         77 =C2=B1 12%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
        25          +206.3%         77        GEO-MEAN sched_debug.cfs_rq[0=
]:/.tg_runnable_contrib

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    395023 =C2=B1 21%    +179.3%    1103475 =C2=B1  9%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    395023          +179.3%    1103475        GEO-MEAN sched_debug.cpu#0.sc=
hed_goidle

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     26678 =C2=B1  6%    +185.9%      76281 =C2=B1  0%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     26678          +185.9%      76281        GEO-MEAN sched_debug.cfs_rq[0=
]:/.exec_clock

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    206903 =C2=B1 45%    +105.1%     424444 =C2=B1 26%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    206903          +105.1%     424444        GEO-MEAN sched_debug.cpu#3.sc=
hed_goidle

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    814594 =C2=B1 21%    +173.2%    2225796 =C2=B1  9%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    814594          +173.2%    2225795        GEO-MEAN sched_debug.cpu#0.nr=
_switches

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    815199 =C2=B1 21%    +173.2%    2227078 =C2=B1  9%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    815198          +173.2%    2227078        GEO-MEAN sched_debug.cpu#0.sc=
hed_count

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1213 =C2=B1 36%    +195.3%       3583 =C2=B1 12%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      1213          +195.3%       3583        GEO-MEAN sched_debug.cfs_rq[0=
]:/.avg->runnable_avg_sum

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     29624 =C2=B1  6%    +176.5%      81923 =C2=B1  1%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     29624          +176.5%      81923        GEO-MEAN sched_debug.cfs_rq[0=
]:/.min_vruntime

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    193739 =C2=B1 46%     +99.9%     387345 =C2=B1 15%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    193739           +99.9%     387345        GEO-MEAN sched_debug.cpu#1.sc=
hed_goidle

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    482611 =C2=B1 24%     -60.5%     190666 =C2=B1 19%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    482611           -60.5%     190666        GEO-MEAN sched_debug.cpu#2.sc=
hed_goidle

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     31073 =C2=B1  4%     -63.6%      11312 =C2=B1  2%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     31073           -63.6%      11312        GEO-MEAN sched_debug.cfs_rq[3=
]:/.min_vruntime

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

        12 =C2=B1 33%     -68.3%          4 =C2=B1 27%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
        12           -68.3%          4        GEO-MEAN sched_debug.cpu#3.cp=
u_load[4]

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    440281 =C2=B1 42%     +97.4%     869268 =C2=B1 25%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    440281           +97.4%     869268        GEO-MEAN sched_debug.cpu#3.nr=
_switches

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    440898 =C2=B1 42%     +97.2%     869665 =C2=B1 25%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    440898           +97.2%     869665        GEO-MEAN sched_debug.cpu#3.sc=
hed_count

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     33967 =C2=B1  4%     -63.3%      12450 =C2=B1  3%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     33967           -63.3%      12450        GEO-MEAN sched_debug.cfs_rq[2=
]:/.min_vruntime

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    413955 =C2=B1 43%     +93.7%     801767 =C2=B1 14%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    413955           +93.7%     801767        GEO-MEAN sched_debug.cpu#1.nr=
_switches

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    414509 =C2=B1 43%     +93.5%     802162 =C2=B1 14%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    414509           +93.5%     802162        GEO-MEAN sched_debug.cpu#1.sc=
hed_count

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    991210 =C2=B1 24%     -57.1%     425186 =C2=B1 17%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    991210           -57.1%     425186        GEO-MEAN sched_debug.cpu#2.nr=
_switches

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    991832 =C2=B1 24%     -57.1%     425587 =C2=B1 17%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    991831           -57.1%     425587        GEO-MEAN sched_debug.cpu#2.sc=
hed_count

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       437 =C2=B1 14%     -59.6%        176 =C2=B1 27%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
       539 =C2=B1  7%     -50.6%        266 =C2=B1  7%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
       485           -55.3%        217        GEO-MEAN slabinfo.xfs_buf.act=
ive_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       446 =C2=B1 14%     -57.7%        188 =C2=B1 30%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
       548 =C2=B1  6%     -43.9%        307 =C2=B1  4%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
       494           -51.3%        240        GEO-MEAN slabinfo.xfs_buf.num=
_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    216837 =C2=B1 39%     +85.6%     402550 =C2=B1 14%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    216837           +85.6%     402550        GEO-MEAN sched_debug.cpu#1.tt=
wu_count

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    496141 =C2=B1 24%    +117.8%    1080683 =C2=B1  2%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    496141          +117.8%    1080683        GEO-MEAN sched_debug.cpu#2.tt=
wu_count

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     23697 =C2=B1  7%     -51.9%      11404 =C2=B1  2%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     23697           -51.9%      11404        GEO-MEAN sched_debug.cfs_rq[1=
]:/.min_vruntime

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     88762 =C2=B1  5%     +94.9%     173015 =C2=B1  2%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     88762           +94.9%     173015        GEO-MEAN sched_debug.cpu#0.nr=
_load_updates

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     21233 =C2=B1  8%     -49.3%      10767 =C2=B1  5%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     21233           -49.3%      10767        GEO-MEAN sched_debug.cfs_rq[1=
]:/.exec_clock

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

        14 =C2=B1 29%     -51.4%          7 =C2=B1 15%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
        14           -51.4%          6        GEO-MEAN sched_debug.cpu#3.cp=
u_load[3]

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

        44 =C2=B1 13%     -45.2%         24 =C2=B1  7%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
        44           -45.2%         24        GEO-MEAN sched_debug.cfs_rq[3=
]:/.tg_runnable_contrib

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      5.00 =C2=B1 16%     -31.1%       3.45 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      5.00           -31.1%       3.45        GEO-MEAN perf-profile.cpu-cyc=
les.__writeback_inodes_wb.wb_writeback.bdi_writeback_workfn.process_one_wor=
k.worker_thread

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      5.00 =C2=B1 16%     -31.6%       3.42 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      5.00           -31.6%       3.42        GEO-MEAN perf-profile.cpu-cyc=
les.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback.bdi_writeback_wo=
rkfn.process_one_work

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4.99 =C2=B1 16%     -31.6%       3.41 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      4.99           -31.6%       3.41        GEO-MEAN perf-profile.cpu-cyc=
les.write_cache_pages.generic_writepages.xfs_vm_writepages.do_writepages.__=
writeback_single_inode

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4.99 =C2=B1 16%     -31.6%       3.41 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      4.99           -31.6%       3.41        GEO-MEAN perf-profile.cpu-cyc=
les.xfs_vm_writepages.do_writepages.__writeback_single_inode.writeback_sb_i=
nodes.__writeback_inodes_wb

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      5.00 =C2=B1 16%     -31.1%       3.45 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      5.00           -31.1%       3.45        GEO-MEAN perf-profile.cpu-cyc=
les.wb_writeback.bdi_writeback_workfn.process_one_work.worker_thread.kthread

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4.99 =C2=B1 16%     -31.6%       3.41 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      4.99           -31.6%       3.41        GEO-MEAN perf-profile.cpu-cyc=
les.do_writepages.__writeback_single_inode.writeback_sb_inodes.__writeback_=
inodes_wb.wb_writeback

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4.98 =C2=B1 16%     -31.4%       3.41 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      4.98           -31.4%       3.41        GEO-MEAN perf-profile.cpu-cyc=
les.__writepage.write_cache_pages.generic_writepages.xfs_vm_writepages.do_w=
ritepages

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      5.00 =C2=B1 16%     -31.7%       3.41 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      5.00           -31.7%       3.41        GEO-MEAN perf-profile.cpu-cyc=
les.__writeback_single_inode.writeback_sb_inodes.__writeback_inodes_wb.wb_w=
riteback.bdi_writeback_workfn

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4.98 =C2=B1 16%     -31.4%       3.41 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      4.98           -31.4%       3.41        GEO-MEAN perf-profile.cpu-cyc=
les.xfs_vm_writepage.__writepage.write_cache_pages.generic_writepages.xfs_v=
m_writepages

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4.99 =C2=B1 16%     -31.6%       3.41 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      4.99           -31.6%       3.41        GEO-MEAN perf-profile.cpu-cyc=
les.generic_writepages.xfs_vm_writepages.do_writepages.__writeback_single_i=
node.writeback_sb_inodes

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      5.00 =C2=B1 16%     -31.1%       3.45 =C2=B1 28%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      5.00           -31.1%       3.45        GEO-MEAN perf-profile.cpu-cyc=
les.bdi_writeback_workfn.process_one_work.worker_thread.kthread.ret_from_fo=
rk

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4.02 =C2=B1 17%     -37.3%       2.52 =C2=B1 32%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      4.02           -37.3%       2.52        GEO-MEAN perf-profile.cpu-cyc=
les.xfs_cluster_write.xfs_vm_writepage.__writepage.write_cache_pages.generi=
c_writepages

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      2071 =C2=B1 12%     -43.9%       1162 =C2=B1  6%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      2071           -43.9%       1162        GEO-MEAN sched_debug.cfs_rq[3=
]:/.avg->runnable_avg_sum

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

        13 =C2=B1 48%     -42.6%          7 =C2=B1 18%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
        13           -42.6%          7        GEO-MEAN sched_debug.cpu#2.cp=
u_load[3]

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      3.20 =C2=B1 19%     -37.6%       1.99 =C2=B1 25%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      3.20           -37.6%       1.99        GEO-MEAN perf-profile.cpu-cyc=
les.xfs_convert_page.isra.11.xfs_cluster_write.xfs_vm_writepage.__writepage=
.write_cache_pages

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

         9 =C2=B1 16%     -43.7%          5 =C2=B1 49%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
         9           -43.8%          5        GEO-MEAN sched_debug.cfs_rq[0=
]:/.runnable_load_avg

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       627 =C2=B1 12%     +55.9%        978 =C2=B1  8%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
       627           +55.9%        978        GEO-MEAN slabinfo.btrfs_delay=
ed_tree_ref.num_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       627 =C2=B1 12%     +54.9%        972 =C2=B1  8%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
       627           +54.9%        972        GEO-MEAN slabinfo.btrfs_delay=
ed_tree_ref.active_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      2552 =C2=B1  8%     -35.9%       1635 =C2=B1 10%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      2552           -35.9%       1635        GEO-MEAN slabinfo.kmalloc-96.=
active_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      2577 =C2=B1  7%     -35.0%       1676 =C2=B1  9%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      2577           -35.0%       1676        GEO-MEAN slabinfo.kmalloc-96.=
num_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       650 =C2=B1  5%     -29.7%        457 =C2=B1  7%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
       649           -29.7%        457        GEO-MEAN slabinfo.blkdev_requ=
ests.active_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1.17 =C2=B1 13%     +24.6%       1.46 =C2=B1  8%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      1.17           +24.6%       1.46        GEO-MEAN perf-profile.cpu-cyc=
les.try_to_release_page.shrink_page_list.shrink_inactive_list.shrink_lruvec=
.shrink_zone

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       664 =C2=B1  4%     -26.8%        486 =C2=B1  7%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
       664           -26.8%        486        GEO-MEAN slabinfo.blkdev_requ=
ests.num_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1.40 =C2=B1  4%     -23.4%       1.07 =C2=B1  9%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      1.40           -23.4%       1.07        GEO-MEAN perf-profile.cpu-cyc=
les.default_idle.arch_cpu_idle.cpu_startup_entry.rest_init.start_kernel

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1.40 =C2=B1  4%     -22.8%       1.08 =C2=B1 10%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      1.40           -22.8%       1.08        GEO-MEAN perf-profile.cpu-cyc=
les.arch_cpu_idle.cpu_startup_entry.rest_init.start_kernel.x86_64_start_res=
ervations

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    100710 =C2=B1  5%     +28.7%     129619 =C2=B1  0%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    100710           +28.7%     129619        GEO-MEAN sched_debug.cpu#2.nr=
_load_updates

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      2671 =C2=B1 10%     +19.1%       3181 =C2=B1  6%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      2671           +19.1%       3181        GEO-MEAN slabinfo.anon_vma.nu=
m_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     86107 =C2=B1  5%     -21.2%      67836 =C2=B1  8%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     86107           -21.2%      67835        GEO-MEAN sched_debug.cpu#3.nr=
_load_updates

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1.57 =C2=B1  5%     -15.2%       1.33 =C2=B1  9%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      1.57           -15.2%       1.33        GEO-MEAN perf-profile.cpu-cyc=
les.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1.56 =C2=B1  5%     -14.5%       1.33 =C2=B1  9%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      1.56           -14.5%       1.33        GEO-MEAN perf-profile.cpu-cyc=
les.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86_=
64_start_kernel

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1.57 =C2=B1  5%     -15.2%       1.33 =C2=B1  9%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      1.57           -15.2%       1.33        GEO-MEAN perf-profile.cpu-cyc=
les.x86_64_start_reservations.x86_64_start_kernel

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1.57 =C2=B1  5%     -15.2%       1.33 =C2=B1  9%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      1.57           -15.2%       1.33        GEO-MEAN perf-profile.cpu-cyc=
les.x86_64_start_kernel

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1.57 =C2=B1  5%     -15.2%       1.33 =C2=B1  9%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      1.57           -15.2%       1.33        GEO-MEAN perf-profile.cpu-cyc=
les.start_kernel.x86_64_start_reservations.x86_64_start_kernel

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

        50 =C2=B1 32%     -34.0%         33 =C2=B1  5%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
        49           -34.0%         33        GEO-MEAN sched_debug.cfs_rq[2=
]:/.tg_runnable_contrib

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    815734 =C2=B1  1%     -16.3%     682841 =C2=B1  2%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    815734           -16.3%     682841        GEO-MEAN sched_debug.cpu#0.av=
g_idle

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      2341 =C2=B1 31%     -33.3%       1560 =C2=B1  4%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      2340           -33.3%       1560        GEO-MEAN sched_debug.cfs_rq[2=
]:/.avg->runnable_avg_sum

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     77032 =C2=B1  7%     -15.7%      64945 =C2=B1  4%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     77032           -15.7%      64945        GEO-MEAN sched_debug.cpu#1.nr=
_load_updates

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       718 =C2=B1  5%     +18.6%        852 =C2=B1  3%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
       718           +18.6%        852        GEO-MEAN slabinfo.btrfs_trans=
_handle.active_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       723 =C2=B1  5%     +18.8%        859 =C2=B1  3%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
       723           +18.8%        859        GEO-MEAN slabinfo.btrfs_trans=
_handle.num_objs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4889 =C2=B1  5%     -13.4%       4233 =C2=B1  5%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      4889           -13.4%       4233        GEO-MEAN sched_debug.cpu#3.cu=
rr->pid

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      4606 =C2=B1  2%     +14.4%       5268 =C2=B1  3%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      4606           +14.4%       5268        GEO-MEAN sched_debug.cpu#2.cu=
rr->pid

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     63213 =C2=B1  0%     +13.2%      71544 =C2=B1  0%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     63213           +13.2%      71544        GEO-MEAN softirqs.SCHED

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

       166 =C2=B1  4%     +10.1%        183 =C2=B1  4%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
       166           +10.1%        183        GEO-MEAN uptime.idle

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    418402 =C2=B1  6%    +250.9%    1468345 =C2=B1  0%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    418402          +250.9%    1468345        GEO-MEAN time.voluntary_conte=
xt_switches

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      1434 =C2=B1  0%     +56.3%       2241 =C2=B1  1%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      1433           +56.3%       2241        GEO-MEAN vmstat.system.in

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

      5144 =C2=B1  0%      +6.8%       5493 =C2=B1  0%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
      2610 =C2=B1  0%     +65.1%       4310 =C2=B1  1%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
      3664           +32.8%       4865        GEO-MEAN vmstat.system.cs

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

     10375 =C2=B1  3%      -7.7%       9576 =C2=B1  3%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
     10374            -7.7%       9576        GEO-MEAN time.involuntary_con=
text_switches

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

   3210548 =C2=B1  0%      +6.7%    3426526 =C2=B1  0%  bay/dd-write/perfor=
mance-1HDD-cfq-xfs-10dd
   3210548            +6.7%    3426526        GEO-MEAN perf-stat.context-sw=
itches

227dfb4dbf109596  18dcf433f3ded61eb140a55e70  =

----------------  --------------------------  =

    706310 =C2=B1  1%      -3.2%     683678 =C2=B1  0%  bay/fileio/performa=
nce-600s-100%-1HDD-btrfs-64G-1024f-rndrw-sync
    706310            -3.2%     683678        GEO-MEAN time.file_system_inp=
uts

bay: Pentium D
Memory: 2G




                            time.voluntary_context_switches

  1.6e+06 ++---------------------------------------------------------------=
-+
          |        O O O O O  O O O O OO O O O O                           =
 |
  1.4e+06 O+O O OO          O                                              =
 |
          |                                                                =
 |
  1.2e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
   800000 ++                                                               =
 |
          |                                                                =
 |
   600000 ++                                                               =
 |
          |                                                         .*.    =
 |
   400000 *+*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*.*.**.*.*.*   **.*=
.*
          |                                                                =
 |
   200000 ++---------------------------------------------------------------=
-+


                                   softirqs.SCHED

  78000 ++-----------------------------------------------------------------=
-+
        |              O                                                   =
 |
  76000 ++      O                                                          =
 |
  74000 ++                                                                 =
 |
        |     O  O O       O     O  O       *                              =
 |
  72000 ++O O        O   O   O O  O   O O   O O                            =
 |
  70000 O+                                O ::                             =
 |
        |                                  : :                             =
 |
  68000 ++                                 : :                             =
 |
  66000 ++                                 : :                             =
 |
        |                                  :  :                            =
 |
  64000 *+                                :   :.*.**.       .*.*.   *.*. .*=
.|
  62000 ++  *.*.* .*.*.*. .*.*.*. *.   .*.*   *      *.*.*.*     *.*    *  =
 *
        |: +     *       *       *  *.*                                    =
 |
  60000 ++*----------------------------------------------------------------=
-+


                                 vmstat.system.in

  2600 ++------------------------------------------------------------------=
-+
  2400 ++           O                                                      =
 |
       |       O   O  O O O O O   O   O      O                             =
 |
  2200 O+O O O   O              O   O   O OO                               =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1800 ++                                                                  =
 |
  1600 ++                                                                  =
 |
  1400 *+  *.*.*.*.**.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*=
.*
       |   :                                                               =
 |
  1200 ++ :                                                                =
 |
  1000 ++ :                                                                =
 |
       | :                                                                 =
 |
   800 ++*                                                                 =
 |
   600 ++------------------------------------------------------------------=
-+


                                 vmstat.system.cs

  5000 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  4500 ++    O O O OO O O   O   O   O     OO O                             =
 |
  4000 O+O O              O   O   O   O O                                  =
 |
       |                                                                   =
 |
  3500 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |   *.*.*.    .*. .*.*.*.*.*. .*.   *.*.*.*. .*. .*.*.*.*.**.*.*.*.*=
.*
  2500 *+  :     *.**   *           *   *.*        *   *                   =
 |
  2000 ++ :                                                                =
 |
       |: :                                                                =
 |
  1500 ++:                                                                 =
 |
       | *                                                                 =
 |
  1000 ++------------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[3]:/.exec_clock

  35000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  30000 ++                            *                                    =
 |
        |      .*   .*.*     *. .*   : +       .*. *.*.*.   .*         .*  =
 |
        |.*.*.*  :.*    +   +  *  *. :  *   *.*   *      *.*  + .*.**.*  + =
.*
  25000 *+       *       *.*        *    + +                   *          *=
 |
        |                                 *                                =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        O O O                                                              =
 |
        |                O                                                 =
 |
  10000 ++             O   O O O  O     O                                  =
 |
        |     O OO O O           O  O O   O O O                            =
 |
   5000 ++-----------------------------------------------------------------=
-+


                        sched_debug.cfs_rq[3]:/.min_vruntime

  40000 ++-----------------------------------------------------------------=
-+
        |                             *                                    =
 |
  35000 ++                            ::           *                       =
 |
        |           .*.*        .*   : :       .*. :+       .*             =
 |
        |      .*  *    +   .*.*  *. :  :   *.*   *  *.*. .*  + .*.**.*.*. =
.*
  30000 ++*.*.*  :+      *.*        *   *. +             *     *          *=
 |
        *        *                        *                                =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
        O                                                                  =
 |
  15000 ++O O            O   O                                             =
 |
        |          O O O   O   O OO O O O O                                =
 |
  10000 ++----O-OO--------------------------O-O----------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby ruby-oj
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============6426354816325479412==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBmaWxlaW8KZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEt
dm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6IAog
IG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxh
dGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0
czogCiAgZW5lcmd5OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0dXJib3N0YXQ6IAogIHNj
aGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVyOiAKZGVmYXVsdF93YXRjaGRvZ3M6
CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6Ci0gcGVyZm9ybWFu
Y2UKY29tbWl0OiBmMTE0MDQwZTNlYTZlMDczNzIzMzRhZGU3NWQxZWUwNzc1YzM1NWUxCm1vZGVs
OiBQZW50aXVtIEQKbnJfY3B1OiA0Cm1lbW9yeTogMkcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rp
c2svYnktaWQvYXRhLVNUMzc1MDUyOEFTXzZWUDJUQ1pOLXBhcnQxIgpzd2FwX3BhcnRpdGlvbnM6
ICIvZGV2L2Rpc2svYnktaWQvYXRhLVNUMzc1MDUyOEFTXzlWUDVMUEhOLXBhcnQ1Igpyb290ZnNf
cGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDM3NTA1MjhBU182VlAyVENaTi1wYXJ0
MiIKcGVyaW9kOiA2MDBzCm5yX3RocmVhZHM6IDEwMCUKZGlzazogMUhERApmczoKLSBidHJmcwpz
aXplOiA2NEcKZmlsZWlvOgogIGZpbGVudW06IDEwMjRmCiAgcndtb2RlOgogIC0gcm5kcncKICBp
b21vZGU6CiAgLSBzeW5jCmVucXVldWVfdGltZTogMjAxNC0xMC0yMCAxMDowOTozNS43NjYxMjc3
NzIgKzA4OjAwCnRlc3Rib3g6IGJheQp0Ym94X2dyb3VwOiBiYXkKa2NvbmZpZzogeDg2XzY0LXJo
ZWwKaGVhZF9jb21taXQ6IGUwOTExYTVkOGI1Njc1MzcxNmJkMTVkZTNkMmZiMWQ1ZmEzOWNlZDIK
YmFzZV9jb21taXQ6IGYxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1ZTEKYnJh
bmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNDEwMjAxNgprZXJuZWw6ICIva2VybmVs
L3g4Nl82NC1yaGVsL2YxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1ZTEvdm1s
aW51ei0zLjE4LjAtcmMxLWdmMTE0MDQwIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyZXN1bHRf
cm9vdDogIi9yZXN1bHQvYmF5L2ZpbGVpby9wZXJmb3JtYW5jZS02MDBzLTEwMCUtMUhERC1idHJm
cy02NEctMTAyNGYtcm5kcnctc3luYy9kZWJpYW4teDg2XzY0LmNnei94ODZfNjQtcmhlbC9mMTE0
MDQwZTNlYTZlMDczNzIzMzRhZGU3NWQxZWUwNzc1YzM1NWUxLzAiCmpvYl9maWxlOiAiL2xrcC9z
Y2hlZHVsZWQvYmF5L2N5Y2xpY19maWxlaW8tcGVyZm9ybWFuY2UtNjAwcy0xMDAlLTFIREQtYnRy
ZnMtNjRHLTEwMjRmLXJuZHJ3LXN5bmMteDg2XzY0LXJoZWwtQkFTRS1mMTE0MDQwZTNlYTZlMDcz
NzIzMzRhZGU3NWQxZWUwNzc1YzM1NWUxLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0LTEwLTIw
IDE3OjQxOjA2LjU5MDQ0NjExNyArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAz
LjEyIDMuNDEgMi4xOCAxLzEzMSAxNjc2NApzdGFydF90aW1lOiAnMTQxMzc5ODEwOScKZW5kX3Rp
bWU6ICcxNDEzNzk5NDkzJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTAyMC0xNzEwMDMi
Cg==

--===============6426354816325479412==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCm1rZnMgLXQgYnRyZnMgL2Rldi9zZGExCm1vdW50IC10IGJ0cmZzIC9kZXYvc2RhMSAv
ZnMvc2RhMQpjZCAvZnMvc2RhMQpzeXNiZW5jaCAtLXRlc3Q9ZmlsZWlvIC0tbWF4LXJlcXVlc3Rz
PTAgLS1udW0tdGhyZWFkcz00IC0tbWF4LXRpbWU9NjAwIC0tZmlsZS10ZXN0LW1vZGU9cm5kcncg
LS1maWxlLXRvdGFsLXNpemU9Njg3MTk0NzY3MzYgLS1maWxlLWlvLW1vZGU9c3luYyAtLWZpbGUt
bnVtPTEwMjQgcHJlcGFyZQpzeXNiZW5jaCAtLXRlc3Q9ZmlsZWlvIC0tbWF4LXJlcXVlc3RzPTAg
LS1udW0tdGhyZWFkcz00IC0tbWF4LXRpbWU9NjAwIC0tZmlsZS10ZXN0LW1vZGU9cm5kcncgLS1m
aWxlLXRvdGFsLXNpemU9Njg3MTk0NzY3MzYgLS1maWxlLWlvLW1vZGU9c3luYyAtLWZpbGUtbnVt
PTEwMjQgcnVuCg==

--===============6426354816325479412==--

