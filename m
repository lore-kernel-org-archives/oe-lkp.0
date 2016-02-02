Content-Type: multipart/mixed; boundary="===============3521896193682721300=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm] 5c6dc7978a: -17.6% blogbench.read_score, +19.3% blogbench.write_score
Date: Tue, 02 Feb 2016 10:18:06 +0800
Message-ID: <87a8njrh29.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3521896193682721300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux-balancenuma mm-vm=
scan-node-lru-v2r26
commit 5c6dc7978afb41bff22b2b9002b8a619b3a76955 ("mm: vmscan: Do not reclai=
m from kswapd if there is any eligible zone")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/testcase:
  gcc-4.9/performance/1SSD/btrfs/x86_64-rhel/debian-x86_64-2015-02-07.cgz/l=
kp-bdw01/blogbench

commit: =

  26599ca376581478c5da5fb2316eda236b6fd1e1
  5c6dc7978afb41bff22b2b9002b8a619b3a76955

26599ca376581478 5c6dc7978afb41bff22b2b9002 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    459703 =C2=B1  3%     -17.6%     378624 =C2=B1  3%  blogbench.read_score
 1.049e+08 =C2=B1  3%      +8.0%  1.134e+08 =C2=B1  2%  blogbench.time.file=
_system_inputs
  34609582 =C2=B1  2%     +23.5%   42737212 =C2=B1  1%  blogbench.time.file=
_system_outputs
   4686729 =C2=B1  2%     +18.2%    5540148 =C2=B1  0%  blogbench.time.invo=
luntary_context_switches
      2854 =C2=B1  1%    +204.1%       8679 =C2=B1  2%  blogbench.time.maxi=
mum_resident_set_size
     48.88 =C2=B1  2%     -14.7%      41.71 =C2=B1  1%  blogbench.time.user=
_time
   4624746 =C2=B1  3%     +42.5%    6590480 =C2=B1  2%  blogbench.time.volu=
ntary_context_switches
      3447 =C2=B1  2%     +19.3%       4112 =C2=B1  1%  blogbench.write_sco=
re
    131671 =C2=B1  2%     +34.1%     176572 =C2=B1  1%  softirqs.SCHED
      3.17 =C2=B1  6%     -27.5%       2.30 =C2=B1  2%  turbostat.CPU%c1
      0.02 =C2=B1 48%     -55.6%       0.01 =C2=B1-10000%  turbostat.CPU%c3
  34609582 =C2=B1  2%     +23.5%   42737212 =C2=B1  1%  time.file_system_ou=
tputs
   4686729 =C2=B1  2%     +18.2%    5540148 =C2=B1  0%  time.involuntary_co=
ntext_switches
      2854 =C2=B1  1%    +204.1%       8679 =C2=B1  2%  time.maximum_reside=
nt_set_size
     48.88 =C2=B1  2%     -14.7%      41.71 =C2=B1  1%  time.user_time
   4624746 =C2=B1  3%     +42.5%    6590480 =C2=B1  2%  time.voluntary_cont=
ext_switches
    173695 =C2=B1  3%      +7.7%     187054 =C2=B1  2%  vmstat.io.bi
     67545 =C2=B1  2%     +28.5%      86794 =C2=B1  1%  vmstat.io.bo
    532739 =C2=B1  1%     +53.1%     815649 =C2=B1  1%  vmstat.memory.free
     47.75 =C2=B1  1%     +20.4%      57.50 =C2=B1  1%  vmstat.procs.b
     53.75 =C2=B1  1%     -16.7%      44.75 =C2=B1  2%  vmstat.procs.r
     63290 =C2=B1  2%     +23.2%      77966 =C2=B1  0%  vmstat.system.cs
     16184 =C2=B1  2%     +21.2%      19619 =C2=B1  0%  vmstat.system.in
  32931925 =C2=B1  7%     -24.4%   24884744 =C2=B1  2%  cpuidle.C1-BDW.time
    156977 =C2=B1  2%     -23.9%     119495 =C2=B1  1%  cpuidle.C1-BDW.usage
   4329633 =C2=B1  5%     -50.4%    2146304 =C2=B1 18%  cpuidle.C1E-BDW.time
     12510 =C2=B1  7%     -44.2%       6979 =C2=B1 16%  cpuidle.C1E-BDW.usa=
ge
    655993 =C2=B1 10%     -62.5%     245977 =C2=B1 19%  cpuidle.C3-BDW.time
      1792 =C2=B1 19%     -59.6%     723.75 =C2=B1 13%  cpuidle.C3-BDW.usage
    199.00 =C2=B1 35%     -66.0%      67.75 =C2=B1 25%  cpuidle.C7s-BDW.usa=
ge
     98.25 =C2=B1 36%     -47.8%      51.25 =C2=B1 39%  cpuidle.C8-BDW.usage
   1533646 =C2=B1  3%     +25.0%    1916951 =C2=B1  1%  cpuidle.POLL.usage
     37068 =C2=B1 78%     -80.0%       7416 =C2=B1 80%  latency_stats.max.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].btrfs_inse=
rt_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_mkdir.[btrfs].vfs_mkdir.Sy=
S_mkdir.entry_SYSCALL_64_fastpath
      5502 =C2=B1 69%    +199.2%      16461 =C2=B1108%  latency_stats.max.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].cow_file_range_inline.[btrfs]=
.cow_file_range.[btrfs].run_delalloc_range.[btrfs].writepage_delalloc.[btrf=
s].__extent_writepage.[btrfs].extent_write_cache_pages.[btrfs].extent_write=
pages.[btrfs].btrfs_writepages.[btrfs]
      0.00 =C2=B1 -1%      +Inf%      85685 =C2=B1100%  latency_stats.max.f=
ilename_create.SyS_mkdir.entry_SYSCALL_64_fastpath
     75945 =C2=B1 46%     -83.1%      12804 =C2=B1100%  latency_stats.sum.b=
trfs_commit_inode_delayed_inode.[btrfs].btrfs_evict_inode.[btrfs].evict.ipu=
t.__dentry_kill.dput.SyS_rename.entry_SYSCALL_64_fastpath
   1555524 =C2=B1 11%     -71.4%     445632 =C2=B1 21%  latency_stats.sum.b=
trfs_delete_delayed_dir_index.[btrfs].__btrfs_unlink_inode.[btrfs].btrfs_re=
name2.[btrfs].vfs_rename.SyS_rename.entry_SYSCALL_64_fastpath
    127279 =C2=B1 85%     -79.4%      26177 =C2=B1 42%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].btrfs_inse=
rt_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_mkdir.[btrfs].vfs_mkdir.Sy=
S_mkdir.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      59705 =C2=B1 64%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_file_extent.[=
btrfs].__btrfs_drop_extents.[btrfs].cow_file_range_inline.[btrfs].cow_file_=
range.[btrfs].run_delalloc_range.[btrfs].writepage_delalloc.[btrfs].__exten=
t_writepage.[btrfs].extent_write_cache_pages.[btrfs].extent_writepages.[btr=
fs].btrfs_writepages.[btrfs]
  42284072 =C2=B1 12%     -70.0%   12684139 =C2=B1  7%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_dir_item.[btrfs].btrfs_lookup_dentry.[btrfs].btrf=
s_lookup.[btrfs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.=
entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     274080 =C2=B1102%  latency_stats.sum.f=
ilename_create.SyS_mkdir.entry_SYSCALL_64_fastpath
     21264 =C2=B1  4%     +23.6%      26279 =C2=B1  3%  meminfo.Active
      1320 =C2=B1  2%     -24.3%       1000 =C2=B1  2%  meminfo.Active(anon)
     19943 =C2=B1  4%     +26.8%      25278 =C2=B1  3%  meminfo.Active(file)
      5120 =C2=B1 20%    +109.5%      10726 =C2=B1  8%  meminfo.AnonHugePag=
es
     19943 =C2=B1  4%     +26.8%      25278 =C2=B1  3%  meminfo.AnonPages
    499678 =C2=B1  1%     +58.6%     792537 =C2=B1  1%  meminfo.Inactive
    499678 =C2=B1  1%     +58.6%     792537 =C2=B1  1%  meminfo.Inactive(an=
on)
    781175 =C2=B1  1%     +29.4%    1010738 =C2=B1  1%  meminfo.MemAvailable
    499678 =C2=B1  1%     +58.6%     792537 =C2=B1  1%  meminfo.MemFree
    313044 =C2=B1  0%     -21.9%     244568 =C2=B1  1%  meminfo.SReclaimable
    347708 =C2=B1  0%     -20.3%     277117 =C2=B1  1%  meminfo.Slab
      4042 =C2=B1 12%     +38.6%       5601 =C2=B1  9%  meminfo.Writeback
    342347 =C2=B1  8%     -29.2%     242451 =C2=B1 14%  sched_debug.cpu.avg=
_idle.2
    348057 =C2=B1  4%     -20.7%     276024 =C2=B1 17%  sched_debug.cpu.avg=
_idle.avg
    194.50 =C2=B1 15%     +47.0%     286.00 =C2=B1 22%  sched_debug.cpu.cpu=
_load[0].1
     65.70 =C2=B1 27%     +32.0%      86.71 =C2=B1 17%  sched_debug.cpu.cpu=
_load[1].stddev
   1827889 =C2=B1  7%     +22.8%    2244113 =C2=B1  2%  sched_debug.cpu.nr_=
switches.0
   1834119 =C2=B1  6%     +32.1%    2423230 =C2=B1  4%  sched_debug.cpu.nr_=
switches.1
   2035714 =C2=B1  5%     +25.2%    2549686 =C2=B1  5%  sched_debug.cpu.nr_=
switches.2
   2019975 =C2=B1  2%     +19.2%    2407047 =C2=B1  1%  sched_debug.cpu.nr_=
switches.3
   1929425 =C2=B1  2%     +24.7%    2406019 =C2=B1  1%  sched_debug.cpu.nr_=
switches.avg
   2113648 =C2=B1  1%     +22.9%    2597031 =C2=B1  3%  sched_debug.cpu.nr_=
switches.max
   1732554 =C2=B1  5%     +27.1%    2202672 =C2=B1  1%  sched_debug.cpu.nr_=
switches.min
   2138340 =C2=B1  6%     +19.5%    2555213 =C2=B1  2%  sched_debug.cpu.sch=
ed_count.0
   1835798 =C2=B1  6%     +32.1%    2425180 =C2=B1  4%  sched_debug.cpu.sch=
ed_count.1
   2037410 =C2=B1  5%     +25.2%    2551583 =C2=B1  5%  sched_debug.cpu.sch=
ed_count.2
   2021688 =C2=B1  2%     +19.2%    2409014 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.3
   2008309 =C2=B1  2%     +23.7%    2485248 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.avg
   2225771 =C2=B1  2%     +21.6%    2706711 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.max
   1813605 =C2=B1  5%     +27.4%    2311275 =C2=B1  1%  sched_debug.cpu.sch=
ed_count.min
    113405 =C2=B1  2%     +29.4%     146787 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.0
    162197 =C2=B1  4%     +34.7%     218436 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.1
    140829 =C2=B1  4%     +33.9%     188508 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.2
    156043 =C2=B1  3%     +35.9%     212014 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.3
    143119 =C2=B1  3%     +33.8%     191437 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.avg
    162420 =C2=B1  4%     +34.7%     218756 =C2=B1  1%  sched_debug.cpu.sch=
ed_goidle.max
    112440 =C2=B1  2%     +29.7%     145784 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.min
     19494 =C2=B1  7%     +48.3%      28918 =C2=B1  9%  sched_debug.cpu.sch=
ed_goidle.stddev
   1542496 =C2=B1  5%     +20.0%    1850574 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.0
   1032479 =C2=B1  6%     +38.0%    1424732 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.1
   1171762 =C2=B1  3%     +30.3%    1526534 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.2
   1095693 =C2=B1  1%     +27.5%    1396581 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.3
   1210608 =C2=B1  3%     +28.0%    1549606 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.avg
   1568449 =C2=B1  4%     +18.2%    1853276 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.max
   1012973 =C2=B1  4%     +35.5%    1372386 =C2=B1  1%  sched_debug.cpu.ttw=
u_count.min
    379141 =C2=B1 11%     +26.2%     478424 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.1
    464858 =C2=B1  1%     +10.0%     511132 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.avg
    358796 =C2=B1  8%     +21.8%     436860 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.min
     37501 =C2=B1115%    -100.0%       5.50 =C2=B1 58%  proc-vmstat.allocst=
all
    322.00 =C2=B1  1%     -99.7%       1.00 =C2=B1  0%  proc-vmstat.compact=
_fail
  29862869 =C2=B1  6%     -99.8%      56638 =C2=B1 36%  proc-vmstat.compact=
_free_scanned
   1756818 =C2=B1  9%    -100.0%     113.00 =C2=B1 47%  proc-vmstat.compact=
_isolated
   3699714 =C2=B1 40%     -99.9%       3875 =C2=B1  2%  proc-vmstat.compact=
_migrate_scanned
    387.75 =C2=B1  2%     -99.5%       1.75 =C2=B1 47%  proc-vmstat.compact=
_stall
     23849 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
   4798041 =C2=B1  2%    +277.7%   18120500 =C2=B1  2%  proc-vmstat.kswapd_=
inodesteal
     56675 =C2=B1  4%    -100.0%       0.33 =C2=B1141%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
      5058 =C2=B1  4%     +26.4%       6393 =C2=B1  3%  proc-vmstat.nr_acti=
ve_anon
    499504 =C2=B1  0%     -16.9%     414900 =C2=B1  2%  proc-vmstat.nr_acti=
ve_file
    328.50 =C2=B1  3%     -25.9%     243.50 =C2=B1  1%  proc-vmstat.nr_allo=
c_batch
      4984 =C2=B1  4%     +26.8%       6318 =C2=B1  3%  proc-vmstat.nr_anon=
_pages
   5307143 =C2=B1  2%     +28.3%    6810058 =C2=B1  1%  proc-vmstat.nr_dirt=
ied
    125249 =C2=B1  2%     +57.7%     197501 =C2=B1  1%  proc-vmstat.nr_free=
_pages
    229322 =C2=B1  1%     +22.8%     281647 =C2=B1  2%  proc-vmstat.nr_inac=
tive_file
     78209 =C2=B1  0%     -21.8%      61189 =C2=B1  1%  proc-vmstat.nr_slab=
_reclaimable
     33245 =C2=B1 15%     -71.8%       9384 =C2=B1 88%  proc-vmstat.nr_unev=
ictable
    356807 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
     82546 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.nr_vmsc=
an_write
    994.50 =C2=B1 14%     +47.3%       1464 =C2=B1  7%  proc-vmstat.nr_writ=
eback
   5224316 =C2=B1  2%     +28.3%    6704211 =C2=B1  1%  proc-vmstat.nr_writ=
ten
     87262 =C2=B1  4%     -99.9%     112.50 =C2=B1  2%  proc-vmstat.pageout=
run
   8209800 =C2=B1  2%     -22.6%    6357584 =C2=B1  2%  proc-vmstat.pgactiv=
ate
   5918065 =C2=B1  1%    +146.2%   14568370 =C2=B1  1%  proc-vmstat.pgalloc=
_dma32
  13467120 =C2=B1  2%     -50.8%    6626596 =C2=B1  2%  proc-vmstat.pgalloc=
_normal
  10143912 =C2=B1  3%     -99.9%      13934 =C2=B1140%  proc-vmstat.pgdeact=
ivate
     34957 =C2=B1  5%     -96.3%       1300 =C2=B1124%  proc-vmstat.pginode=
steal
    175912 =C2=B1 19%    -100.0%       1.33 =C2=B1141%  proc-vmstat.pgmigra=
te_fail
     83594 =C2=B1  4%     -99.9%      55.00 =C2=B1 45%  proc-vmstat.pgmigra=
te_success
  20440083 =C2=B1  2%     +28.5%   26272256 =C2=B1  1%  proc-vmstat.pgpgout
  10157444 =C2=B1  3%     -99.8%      19647 =C2=B1108%  proc-vmstat.pgrefill
    187716 =C2=B1 10%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.pgrotat=
ed
     96040 =C2=B1 11%     -90.2%       9415 =C2=B1131%  proc-vmstat.pgscan_=
direct
  12320286 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgscan_=
kswapd
     89886 =C2=B1 10%     -99.9%      55.00 =C2=B1100%  proc-vmstat.pgsteal=
_direct
  11628160 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgsteal=
_kswapd
  18528288 =C2=B1  2%     +44.4%   26754604 =C2=B1  3%  proc-vmstat.slabs_s=
canned
     48971 =C2=B1 15%     -69.2%      15100 =C2=B1 94%  proc-vmstat.unevict=
able_pgs_culled
   2159015 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.working=
set_activate
   2363876 =C2=B1  5%    -100.0%       0.50 =C2=B1100%  proc-vmstat.working=
set_refault
    163809 =C2=B1  0%     -26.2%     120877 =C2=B1  0%  slabinfo.Acpi-State=
.active_objs
      3280 =C2=B1  0%     -17.1%       2720 =C2=B1  1%  slabinfo.Acpi-State=
.active_slabs
    167286 =C2=B1  0%     -17.1%     138763 =C2=B1  1%  slabinfo.Acpi-State=
.num_objs
      3280 =C2=B1  0%     -17.1%       2720 =C2=B1  1%  slabinfo.Acpi-State=
.num_slabs
     78003 =C2=B1  1%     -39.7%      47031 =C2=B1  1%  slabinfo.btrfs_dela=
yed_node.active_objs
      3637 =C2=B1  1%     -40.3%       2172 =C2=B1  0%  slabinfo.btrfs_dela=
yed_node.active_slabs
     94577 =C2=B1  1%     -40.3%      56509 =C2=B1  0%  slabinfo.btrfs_dela=
yed_node.num_objs
      3637 =C2=B1  1%     -40.3%       2172 =C2=B1  0%  slabinfo.btrfs_dela=
yed_node.num_slabs
      6691 =C2=B1 17%     -30.2%       4674 =C2=B1  8%  slabinfo.btrfs_dela=
yed_ref_head.active_objs
      7097 =C2=B1 16%     -29.8%       4981 =C2=B1  7%  slabinfo.btrfs_dela=
yed_ref_head.num_objs
     16611 =C2=B1  3%     +35.3%      22475 =C2=B1  0%  slabinfo.btrfs_exte=
nt_buffer.active_objs
    581.75 =C2=B1  2%     +34.5%     782.50 =C2=B1  0%  slabinfo.btrfs_exte=
nt_buffer.active_slabs
     16862 =C2=B1  2%     +34.7%      22709 =C2=B1  0%  slabinfo.btrfs_exte=
nt_buffer.num_objs
    581.75 =C2=B1  2%     +34.5%     782.50 =C2=B1  0%  slabinfo.btrfs_exte=
nt_buffer.num_slabs
    116112 =C2=B1  0%     -33.4%      77363 =C2=B1  1%  slabinfo.btrfs_exte=
nt_map.active_objs
      4287 =C2=B1  0%     -22.8%       3310 =C2=B1  1%  slabinfo.btrfs_exte=
nt_map.active_slabs
    120054 =C2=B1  0%     -22.8%      92699 =C2=B1  1%  slabinfo.btrfs_exte=
nt_map.num_objs
      4287 =C2=B1  0%     -22.8%       3310 =C2=B1  1%  slabinfo.btrfs_exte=
nt_map.num_slabs
    102061 =C2=B1  0%     -19.7%      81986 =C2=B1  0%  slabinfo.btrfs_exte=
nt_state.active_objs
      2379 =C2=B1  0%     -18.6%       1936 =C2=B1  1%  slabinfo.btrfs_exte=
nt_state.active_slabs
    121372 =C2=B1  0%     -18.6%      98788 =C2=B1  1%  slabinfo.btrfs_exte=
nt_state.num_objs
      2379 =C2=B1  0%     -18.6%       1936 =C2=B1  1%  slabinfo.btrfs_exte=
nt_state.num_slabs
    125087 =C2=B1  0%     -31.8%      85358 =C2=B1  1%  slabinfo.btrfs_inod=
e.active_objs
      4258 =C2=B1  2%     -24.8%       3203 =C2=B1  1%  slabinfo.btrfs_inod=
e.active_slabs
    128521 =C2=B1  0%     -20.5%     102190 =C2=B1  2%  slabinfo.btrfs_inod=
e.num_objs
      4258 =C2=B1  2%     -24.8%       3203 =C2=B1  1%  slabinfo.btrfs_inod=
e.num_slabs
      1166 =C2=B1  2%     +21.4%       1416 =C2=B1  2%  slabinfo.btrfs_orde=
red_extent.active_objs
      1287 =C2=B1  2%     +22.3%       1574 =C2=B1  2%  slabinfo.btrfs_orde=
red_extent.num_objs
      4545 =C2=B1 16%     -26.2%       3353 =C2=B1 12%  slabinfo.btrfs_path=
.active_objs
      4650 =C2=B1 15%     -25.7%       3457 =C2=B1 11%  slabinfo.btrfs_path=
.num_objs
      3349 =C2=B1 10%     -20.8%       2651 =C2=B1  3%  slabinfo.buffer_hea=
d.active_objs
      3530 =C2=B1 10%     -21.6%       2768 =C2=B1  3%  slabinfo.buffer_hea=
d.num_objs
    132150 =C2=B1  0%     -30.8%      91384 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      6915 =C2=B1  0%     -35.0%       4493 =C2=B1  0%  slabinfo.dentry.act=
ive_slabs
    145225 =C2=B1  0%     -35.0%      94359 =C2=B1  0%  slabinfo.dentry.num=
_objs
      6915 =C2=B1  0%     -35.0%       4493 =C2=B1  0%  slabinfo.dentry.num=
_slabs
      2389 =C2=B1  1%     +13.4%       2710 =C2=B1  3%  slabinfo.ext4_io_en=
d.active_objs
      2473 =C2=B1  1%     +16.0%       2869 =C2=B1  2%  slabinfo.ext4_io_en=
d.num_objs
    862.25 =C2=B1  3%     -13.0%     749.75 =C2=B1  8%  slabinfo.kmalloc-10=
24.active_objs
    866.75 =C2=B1  2%     -11.5%     766.75 =C2=B1  6%  slabinfo.kmalloc-10=
24.num_objs
      1299 =C2=B1  1%     -37.1%     816.75 =C2=B1 12%  slabinfo.proc_inode=
_cache.active_objs
      1344 =C2=B1  4%     -31.4%     922.75 =C2=B1  9%  slabinfo.proc_inode=
_cache.num_objs
    120832 =C2=B1  0%     -33.5%      80360 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
      4457 =C2=B1  0%     -21.2%       3510 =C2=B1  1%  slabinfo.radix_tree=
_node.active_slabs
    123934 =C2=B1  0%     -20.7%      98312 =C2=B1  1%  slabinfo.radix_tree=
_node.num_objs
      4457 =C2=B1  0%     -21.2%       3510 =C2=B1  1%  slabinfo.radix_tree=
_node.num_slabs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-hsw=
-ep2/lru-file-mmap-read/vm-scalability

commit: =

  26599ca376581478c5da5fb2316eda236b6fd1e1
  5c6dc7978afb41bff22b2b9002b8a619b3a76955

26599ca376581478 5c6dc7978afb41bff22b2b9002 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  12328762 =C2=B1  5%     -24.7%    9277920 =C2=B1  9%  vm-scalability.thro=
ughput
   2474335 =C2=B1  3%      +8.6%    2687066 =C2=B1  2%  vm-scalability.time=
.maximum_resident_set_size
  39367796 =C2=B1 17%     -49.6%   19859813 =C2=B1 15%  vm-scalability.time=
.minor_page_faults
      1222 =C2=B1  5%     -28.2%     878.27 =C2=B1 11%  vm-scalability.time=
.user_time
      1496 =C2=B1  0%   +2160.9%      33829 =C2=B1108%  vm-scalability.time=
.voluntary_context_switches
   3266412 =C2=B1  4%     -25.5%    2433401 =C2=B1  7%  meminfo.PageTables
    476675 =C2=B1  2%     -17.4%     393600 =C2=B1 11%  meminfo.Shmem
   1623436 =C2=B1  4%     -26.9%    1186308 =C2=B1  7%  numa-meminfo.node0.=
PageTables
   1618915 =C2=B1  3%     -24.9%    1216339 =C2=B1  7%  numa-meminfo.node1.=
PageTables
      2.50 =C2=B1  8%     -35.5%       1.61 =C2=B1 30%  turbostat.Pkg%pc2
     71.22 =C2=B1  1%      -7.5%      65.91 =C2=B1  3%  turbostat.RAMWatt
      5068 =C2=B1  3%     -10.8%       4519 =C2=B1  5%  vmstat.system.cs
    374306 =C2=B1  0%     -15.8%     315290 =C2=B1  5%  vmstat.system.in
   3128873 =C2=B1 35%    +109.4%    6551158 =C2=B1 29%  cpuidle.C1-HSW.time
   3849893 =C2=B1 43%    +124.7%    8649880 =C2=B1 27%  cpuidle.C1E-HSW.time
      1752 =C2=B1 16%    +480.4%      10169 =C2=B1 92%  cpuidle.C1E-HSW.usa=
ge
  38799823 =C2=B1 25%     -49.1%   19750901 =C2=B1 25%  cpuidle.POLL.time
   2474335 =C2=B1  3%      +8.6%    2687066 =C2=B1  2%  time.maximum_reside=
nt_set_size
  39367796 =C2=B1 17%     -49.6%   19859813 =C2=B1 15%  time.minor_page_fau=
lts
      1222 =C2=B1  5%     -28.2%     878.27 =C2=B1 11%  time.user_time
      1496 =C2=B1  0%   +2160.9%      33829 =C2=B1108%  time.voluntary_cont=
ext_switches
 2.986e+08 =C2=B1  3%     -24.0%   2.27e+08 =C2=B1 12%  numa-numastat.node0=
.local_node
 1.023e+08 =C2=B1 17%     -44.8%   56480884 =C2=B1 15%  numa-numastat.node0=
.numa_foreign
 2.986e+08 =C2=B1  3%     -24.0%   2.27e+08 =C2=B1 12%  numa-numastat.node0=
.numa_hit
  97234595 =C2=B1 17%     -47.9%   50703373 =C2=B1  5%  numa-numastat.node0=
.numa_miss
  97239280 =C2=B1 17%     -47.9%   50708053 =C2=B1  5%  numa-numastat.node0=
.other_node
 2.965e+08 =C2=B1  2%     -22.3%  2.303e+08 =C2=B1 10%  numa-numastat.node1=
.local_node
  97234595 =C2=B1 17%     -47.9%   50703373 =C2=B1  5%  numa-numastat.node1=
.numa_foreign
 2.965e+08 =C2=B1  2%     -22.3%  2.303e+08 =C2=B1 10%  numa-numastat.node1=
.numa_hit
 1.023e+08 =C2=B1 17%     -44.8%   56480884 =C2=B1 15%  numa-numastat.node1=
.numa_miss
 1.023e+08 =C2=B1 17%     -44.8%   56485577 =C2=B1 15%  numa-numastat.node1=
.other_node
      4216 =C2=B1141%    +807.1%      38249 =C2=B1 51%  latency_stats.avg.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
     27.50 =C2=B1 61%  +1.1e+05%      29406 =C2=B1113%  latency_stats.hits.=
throttle_direct_reclaim.try_to_free_pages.__alloc_pages_slowpath.__alloc_pa=
ges_nodemask.alloc_pages_current.__page_cache_alloc.filemap_fault.xfs_filem=
ap_fault.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault
   4283070 =C2=B1 41%    +251.9%   15071625 =C2=B1132%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   2837250 =C2=B1 57%     -97.1%      83492 =C2=B1 43%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      4216 =C2=B1141%   +2176.3%      95985 =C2=B1 20%  latency_stats.max.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      8459 =C2=B1117%     -90.4%     814.00 =C2=B1 25%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs4_file_open.[nfsv4].do_dentry_open.vfs_open.path_openat.do_filp_=
open.do_sys_open
   8532453 =C2=B1 89%    +210.7%   26512390 =C2=B1123%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      4216 =C2=B1141%   +3253.8%     141418 =C2=B1 18%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%       4823 =C2=B1101%  latency_stats.sum.t=
hrottle_direct_reclaim.try_to_free_pages.__alloc_pages_slowpath.__alloc_pag=
es_nodemask.alloc_pages_current.__get_free_pages.pgd_alloc.mm_init.mm_alloc=
.do_execveat_common.SyS_execve.return_from_execve
      2363 =C2=B1127%  +11355.4%     270748 =C2=B1125%  latency_stats.sum.t=
hrottle_direct_reclaim.try_to_free_pages.__alloc_pages_slowpath.__alloc_pag=
es_nodemask.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahea=
d.ondemand_readahead.page_cache_async_readahead.filemap_fault.xfs_filemap_f=
ault.__do_fault
     10160 =C2=B1 67%  +37000.6%    3769701 =C2=B1117%  latency_stats.sum.t=
hrottle_direct_reclaim.try_to_free_pages.__alloc_pages_slowpath.__alloc_pag=
es_nodemask.alloc_pages_current.__page_cache_alloc.filemap_fault.xfs_filema=
p_fault.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault
    781.00 =C2=B1 25%   +2356.8%      19187 =C2=B1 56%  latency_stats.sum.t=
hrottle_direct_reclaim.try_to_free_pages.__alloc_pages_slowpath.__alloc_pag=
es_nodemask.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault._=
_do_page_fault.do_page_fault.page_fault
     65025 =C2=B1 34%  +16343.4%   10692430 =C2=B1172%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.nfs4_file_fsync.[nfsv4].vfs_fsync_range.vfs_fsync.nfs4_=
file_flush.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     803404 =C2=B1 72%  latency_stats.sum.x=
fs_iget.xfs_lookup.xfs_vn_lookup.lookup_real.__lookup_hash.walk_component.p=
ath_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.SYSC_newfstatat=
.SyS_newfstatat
    405453 =C2=B1  4%     -26.9%     296585 =C2=B1  7%  numa-vmstat.node0.n=
r_page_table_pages
      2893 =C2=B1 23%     -86.7%     383.50 =C2=B1118%  numa-vmstat.node0.n=
r_pages_scanned
  58018952 =C2=B1 15%     -39.8%   34901400 =C2=B1 18%  numa-vmstat.node0.n=
uma_foreign
  1.88e+08 =C2=B1  2%     -18.2%  1.538e+08 =C2=B1 12%  numa-vmstat.node0.n=
uma_hit
  1.88e+08 =C2=B1  2%     -18.2%  1.537e+08 =C2=B1 13%  numa-vmstat.node0.n=
uma_local
  55114581 =C2=B1 15%     -44.3%   30679438 =C2=B1  8%  numa-vmstat.node0.n=
uma_miss
  55187040 =C2=B1 14%     -44.3%   30750686 =C2=B1  7%  numa-vmstat.node0.n=
uma_other
   2811824 =C2=B1  7%     -40.2%    1680948 =C2=B1 22%  numa-vmstat.node0.w=
orkingset_nodereclaim
    119.50 =C2=B1 15%     -48.1%      62.00 =C2=B1 17%  numa-vmstat.node1.n=
r_isolated_file
    404543 =C2=B1  3%     -24.8%     304160 =C2=B1  7%  numa-vmstat.node1.n=
r_page_table_pages
      4355 =C2=B1 92%     -85.0%     651.25 =C2=B1 85%  numa-vmstat.node1.n=
r_pages_scanned
  55140101 =C2=B1 15%     -44.3%   30691651 =C2=B1  8%  numa-vmstat.node1.n=
uma_foreign
 1.864e+08 =C2=B1  2%     -16.8%  1.551e+08 =C2=B1 10%  numa-vmstat.node1.n=
uma_hit
 1.864e+08 =C2=B1  2%     -16.8%  1.551e+08 =C2=B1 10%  numa-vmstat.node1.n=
uma_local
  58043707 =C2=B1 15%     -39.8%   34915222 =C2=B1 18%  numa-vmstat.node1.n=
uma_miss
  58077679 =C2=B1 15%     -39.8%   34950390 =C2=B1 18%  numa-vmstat.node1.n=
uma_other
   2256172 =C2=B1  6%     -24.3%    1708157 =C2=B1 18%  numa-vmstat.node1.w=
orkingset_nodereclaim
     53141 =C2=B1  3%     -14.5%      45432 =C2=B1  0%  slabinfo.Acpi-State=
.active_objs
      1049 =C2=B1  3%     -14.6%     896.25 =C2=B1  0%  slabinfo.Acpi-State=
.active_slabs
     53538 =C2=B1  3%     -14.6%      45736 =C2=B1  0%  slabinfo.Acpi-State=
.num_objs
      1049 =C2=B1  3%     -14.6%     896.25 =C2=B1  0%  slabinfo.Acpi-State=
.num_slabs
     54816 =C2=B1  1%      -8.6%      50125 =C2=B1  2%  slabinfo.dentry.act=
ive_objs
      1330 =C2=B1  1%      -9.0%       1211 =C2=B1  2%  slabinfo.dentry.act=
ive_slabs
     55894 =C2=B1  1%      -8.9%      50892 =C2=B1  2%  slabinfo.dentry.num=
_objs
      1330 =C2=B1  1%      -9.0%       1211 =C2=B1  2%  slabinfo.dentry.num=
_slabs
     43069 =C2=B1  1%     -10.3%      38631 =C2=B1  0%  slabinfo.inode_cach=
e.active_objs
    789.00 =C2=B1  0%     -13.4%     683.50 =C2=B1  0%  slabinfo.inode_cach=
e.active_slabs
     44983 =C2=B1  0%     -13.3%      38994 =C2=B1  0%  slabinfo.inode_cach=
e.num_objs
    789.00 =C2=B1  0%     -13.4%     683.50 =C2=B1  0%  slabinfo.inode_cach=
e.num_slabs
    184.25 =C2=B1 16%     -64.7%      65.00 =C2=B1 23%  slabinfo.nfs_commit=
_data.active_objs
    184.25 =C2=B1 16%     -64.7%      65.00 =C2=B1 23%  slabinfo.nfs_commit=
_data.num_objs
      9279 =C2=B1  3%     -31.3%       6376 =C2=B1  3%  slabinfo.proc_inode=
_cache.active_objs
      9674 =C2=B1  2%     -30.8%       6694 =C2=B1  2%  slabinfo.proc_inode=
_cache.num_objs
     81516 =C2=B1  9%     -47.7%      42665 =C2=B1  7%  slabinfo.radix_tree=
_node.active_slabs
     81516 =C2=B1  9%     -47.7%      42665 =C2=B1  7%  slabinfo.radix_tree=
_node.num_slabs
  40361834 =C2=B1  8%     +25.1%   50511172 =C2=B1  4%  proc-vmstat.allocst=
all
  22880785 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.compact=
_free_scanned
     99071 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.compact=
_isolated
    246347 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.compact=
_migrate_scanned
    391095 =C2=B1 12%    +896.3%    3896431 =C2=B1  3%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
     34910 =C2=B1 30%     -65.1%      12168 =C2=B1 12%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
    106660 =C2=B1  2%     -19.6%      85755 =C2=B1 12%  proc-vmstat.nr_acti=
ve_anon
    193.25 =C2=B1 15%     -46.7%     103.00 =C2=B1 18%  proc-vmstat.nr_isol=
ated_file
    816349 =C2=B1  4%     -25.8%     605667 =C2=B1  7%  proc-vmstat.nr_page=
_table_pages
      7441 =C2=B1 38%     -91.5%     634.00 =C2=B1112%  proc-vmstat.nr_page=
s_scanned
    119186 =C2=B1  1%     -17.7%      98074 =C2=B1 11%  proc-vmstat.nr_shmem
 1.995e+08 =C2=B1 17%     -46.3%  1.072e+08 =C2=B1 10%  proc-vmstat.numa_fo=
reign
     10329 =C2=B1  4%     +26.8%      13096 =C2=B1 12%  proc-vmstat.numa_hi=
nt_faults
      8516 =C2=B1  3%     +27.5%      10854 =C2=B1 16%  proc-vmstat.numa_hi=
nt_faults_local
 5.951e+08 =C2=B1  3%     -23.1%  4.573e+08 =C2=B1 11%  proc-vmstat.numa_hit
 5.951e+08 =C2=B1  3%     -23.1%  4.573e+08 =C2=B1 11%  proc-vmstat.numa_lo=
cal
 1.995e+08 =C2=B1 17%     -46.3%  1.072e+08 =C2=B1 10%  proc-vmstat.numa_mi=
ss
 1.995e+08 =C2=B1 17%     -46.3%  1.072e+08 =C2=B1 10%  proc-vmstat.numa_ot=
her
    443443 =C2=B1 13%    +796.6%    3975774 =C2=B1  3%  proc-vmstat.pageout=
run
 7.946e+08 =C2=B1  6%     -29.0%  5.645e+08 =C2=B1 11%  proc-vmstat.pgalloc=
_normal
 7.944e+08 =C2=B1  6%     -28.9%  5.645e+08 =C2=B1 11%  proc-vmstat.pgfree
 1.276e+09 =C2=B1  7%     -16.3%  1.069e+09 =C2=B1 11%  proc-vmstat.pgscan_=
direct
     36.00 =C2=B1 68%   +2734.7%       1020 =C2=B1 10%  proc-vmstat.pgscan_=
direct_throttle
 2.547e+08 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgscan_=
kswapd
 6.613e+08 =C2=B1  9%     -19.9%  5.297e+08 =C2=B1 11%  proc-vmstat.pgsteal=
_direct
 1.001e+08 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.pgsteal=
_kswapd
  10440768 =C2=B1  8%     -38.8%    6394742 =C2=B1 16%  proc-vmstat.slabs_s=
canned
   5047407 =C2=B1  6%     -32.7%    3394455 =C2=B1 20%  proc-vmstat.working=
set_nodereclaim
      2373 =C2=B1 23%     +43.2%       3399 =C2=B1 12%  proc-vmstat.working=
set_refault
      0.88 =C2=B1 23%     -99.6%       0.00 =C2=B1141%  perf-profile.cycles=
-pp.___slab_alloc.__slab_alloc.kmem_cache_alloc.__radix_tree_preload.radix_=
tree_maybe_preload
      1.33 =C2=B1 22%     -93.4%       0.09 =C2=B1 61%  perf-profile.cycles=
-pp.__add_to_page_cache_locked.add_to_page_cache_lru.mpage_readpages.xfs_vm=
_readpages.__do_page_cache_readahead
     18.84 =C2=B1 18%     -78.8%       3.99 =C2=B1 64%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_page=
_cache_readahead.ondemand_readahead
     27.73 =C2=B1 47%    +172.6%      75.61 =C2=B1  9%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.filemap_f=
ault.xfs_filemap_fault
     24.23 =C2=B1 27%     -83.8%       3.92 =C2=B1 58%  perf-profile.cycles=
-pp.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one.__pte_alloc.ha=
ndle_mm_fault
     16.23 =C2=B1 12%     -76.0%       3.90 =C2=B1 63%  perf-profile.cycles=
-pp.__alloc_pages_slowpath.constprop.89.__alloc_pages_nodemask.alloc_pages_=
current.__page_cache_alloc.__do_page_cache_readahead
     26.38 =C2=B1 49%    +183.2%      74.72 =C2=B1 10%  perf-profile.cycles=
-pp.__alloc_pages_slowpath.constprop.89.__alloc_pages_nodemask.alloc_pages_=
current.__page_cache_alloc.filemap_fault
     24.33 =C2=B1 26%     -83.6%       4.00 =C2=B1 57%  perf-profile.cycles=
-pp.__alloc_pages_slowpath.constprop.89.__alloc_pages_nodemask.alloc_pages_=
current.pte_alloc_one.__pte_alloc
     68.45 =C2=B1  8%     +26.4%      86.53 =C2=B1  3%  perf-profile.cycles=
-pp.__do_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     32.39 =C2=B1 26%     -84.6%       5.00 =C2=B1 64%  perf-profile.cycles=
-pp.__do_page_cache_readahead.ondemand_readahead.page_cache_async_readahead=
.filemap_fault.xfs_filemap_fault
      4.65 =C2=B1  6%     -50.6%       2.30 =C2=B1 23%  perf-profile.cycles=
-pp.__lru_cache_add.lru_cache_add.add_to_page_cache_lru.filemap_fault.xfs_f=
ilemap_fault
      7.99 =C2=B1 47%     -96.2%       0.30 =C2=B1 68%  perf-profile.cycles=
-pp.__lru_cache_add.lru_cache_add.add_to_page_cache_lru.mpage_readpages.xfs=
_vm_readpages
     18.91 =C2=B1 18%     -78.8%       4.00 =C2=B1 64%  perf-profile.cycles=
-pp.__page_cache_alloc.__do_page_cache_readahead.ondemand_readahead.page_ca=
che_async_readahead.filemap_fault
     27.80 =C2=B1 47%    +172.2%      75.69 =C2=B1  9%  perf-profile.cycles=
-pp.__page_cache_alloc.filemap_fault.xfs_filemap_fault.__do_fault.handle_mm=
_fault
     24.52 =C2=B1 25%     -75.9%       5.90 =C2=B1 35%  perf-profile.cycles=
-pp.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      0.85 =C2=B1 25%     -99.6%       0.00 =C2=B1141%  perf-profile.cycles=
-pp.__radix_tree_preload.radix_tree_maybe_preload.__add_to_page_cache_locke=
d.add_to_page_cache_lru.mpage_readpages
      1.32 =C2=B1  2%     -60.2%       0.53 =C2=B1 40%  perf-profile.cycles=
-pp.__remove_mapping.shrink_page_list.shrink_inactive_list.shrink_zone_memc=
g.shrink_node
      0.88 =C2=B1 23%     -99.6%       0.00 =C2=B1141%  perf-profile.cycles=
-pp.__slab_alloc.kmem_cache_alloc.__radix_tree_preload.radix_tree_maybe_pre=
load.__add_to_page_cache_locked
      0.00 =C2=B1 -1%      +Inf%       1.00 =C2=B1 19%  perf-profile.cycles=
-pp.__wake_up.wakeup_kswapd.__alloc_pages_slowpath.__alloc_pages_nodemask.a=
lloc_pages_current
      6.57 =C2=B1 47%     -61.8%       2.51 =C2=B1 27%  perf-profile.cycles=
-pp._raw_spin_lock.free_pcppages_bulk.drain_pages_zone.drain_pages.drain_lo=
cal_pages
      1.47 =C2=B1 10%     -81.9%       0.27 =C2=B1 53%  perf-profile.cycles=
-pp._raw_spin_lock.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_page=
_list.shrink_page_list
      2.96 =C2=B1 51%     -89.8%       0.30 =C2=B1 50%  perf-profile.cycles=
-pp._raw_spin_lock.get_page_from_freelist.__alloc_pages_nodemask.alloc_page=
s_current.__page_cache_alloc
      7.79 =C2=B1 21%     -53.4%       3.64 =C2=B1 13%  perf-profile.cycles=
-pp._raw_spin_lock.get_page_from_freelist.__alloc_pages_slowpath.__alloc_pa=
ges_nodemask.alloc_pages_current
      0.05 =C2=B1173%   +2295.2%       1.26 =C2=B1 21%  perf-profile.cycles=
-pp._raw_spin_lock.vmpressure.vmpressure_prio.do_try_to_free_pages.try_to_f=
ree_pages
     24.26 =C2=B1 49%    +147.7%      60.09 =C2=B1  5%  perf-profile.cycles=
-pp._raw_spin_lock_irq.mem_cgroup_soft_limit_reclaim.do_try_to_free_pages.t=
ry_to_free_pages.__alloc_pages_slowpath
      0.11 =C2=B1 52%   +1034.1%       1.25 =C2=B1  4%  perf-profile.cycles=
-pp._raw_spin_lock_irq.mem_cgroup_soft_limit_reclaim.kswapd.kthread.ret_fro=
m_fork
     10.22 =C2=B1 28%     -84.2%       1.61 =C2=B1 57%  perf-profile.cycles=
-pp._raw_spin_lock_irq.shrink_inactive_list.shrink_zone_memcg.shrink_node.d=
o_try_to_free_pages
      0.00 =C2=B1 -1%      +Inf%       1.01 =C2=B1 11%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.__wake_up.wakeup_kswapd.__alloc_pages_slowpath._=
_alloc_pages_nodemask
     11.10 =C2=B1 28%     -79.8%       2.24 =C2=B1 32%  perf-profile.cycles=
-pp._raw_spin_lock_irqsave.pagevec_lru_move_fn.__lru_cache_add.lru_cache_ad=
d.add_to_page_cache_lru
      5.06 =C2=B1  7%     -48.5%       2.60 =C2=B1 26%  perf-profile.cycles=
-pp.add_to_page_cache_lru.filemap_fault.xfs_filemap_fault.__do_fault.handle=
_mm_fault
      9.43 =C2=B1 43%     -95.6%       0.41 =C2=B1 69%  perf-profile.cycles=
-pp.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.__do_page_cache_=
readahead.ondemand_readahead
     18.91 =C2=B1 18%     -78.9%       4.00 =C2=B1 64%  perf-profile.cycles=
-pp.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.ondema=
nd_readahead.page_cache_async_readahead
     27.77 =C2=B1 47%    +172.5%      75.68 =C2=B1  9%  perf-profile.cycles=
-pp.alloc_pages_current.__page_cache_alloc.filemap_fault.xfs_filemap_fault.=
__do_fault
     24.21 =C2=B1 27%     -83.8%       3.92 =C2=B1 58%  perf-profile.cycles=
-pp.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page=
_fault
      0.91 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.call_function_interrupt.pagevec_lru_move_fn.__lru_cache_add.lru_cache_a=
dd.add_to_page_cache_lru
      1.29 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.call_function_interrupt.shrink_zone_memcg.shrink_node.do_try_to_free_pa=
ges.try_to_free_pages
      3.66 =C2=B1 18%     -85.3%       0.54 =C2=B1 66%  perf-profile.cycles=
-pp.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_page_cache_read=
ahead.ondemand_readahead
     57.73 =C2=B1 11%     +34.1%      77.44 =C2=B1  2%  perf-profile.cycles=
-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_p=
ages_nodemask.alloc_pages_current
      6.80 =C2=B1 47%     -61.4%       2.62 =C2=B1 28%  perf-profile.cycles=
-pp.drain_local_pages.flush_smp_call_function_queue.generic_smp_call_functi=
on_single_interrupt.smp_call_function_interrupt.call_function_interrupt
      6.80 =C2=B1 47%     -61.4%       2.62 =C2=B1 28%  perf-profile.cycles=
-pp.drain_pages.drain_local_pages.flush_smp_call_function_queue.generic_smp=
_call_function_single_interrupt.smp_call_function_interrupt
      6.80 =C2=B1 47%     -61.6%       2.61 =C2=B1 29%  perf-profile.cycles=
-pp.drain_pages_zone.drain_pages.drain_local_pages.flush_smp_call_function_=
queue.generic_smp_call_function_single_interrupt
     68.34 =C2=B1  8%     +26.4%      86.41 =C2=B1  3%  perf-profile.cycles=
-pp.filemap_fault.xfs_filemap_fault.__do_fault.handle_mm_fault.__do_page_fa=
ult
      0.99 =C2=B1 10%     -28.5%       0.71 =C2=B1  2%  perf-profile.cycles=
-pp.filemap_map_pages.handle_mm_fault.__do_page_fault.do_page_fault.page_fa=
ult
      0.94 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.flush_smp_call_function_queue.generic_smp_call_function_single_interrup=
t.smp_call_function_interrupt.call_function_interrupt.pagevec_lru_move_fn
      1.36 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.flush_smp_call_function_queue.generic_smp_call_function_single_interrup=
t.smp_call_function_interrupt.call_function_interrupt.shrink_zone_memcg
      2.20 =C2=B1 10%     -73.6%       0.58 =C2=B1 43%  perf-profile.cycles=
-pp.free_hot_cold_page.free_hot_cold_page_list.shrink_page_list.shrink_inac=
tive_list.shrink_zone_memcg
      2.52 =C2=B1  5%     -74.2%       0.65 =C2=B1 40%  perf-profile.cycles=
-pp.free_hot_cold_page_list.shrink_page_list.shrink_inactive_list.shrink_zo=
ne_memcg.shrink_node
      6.78 =C2=B1 47%     -61.3%       2.62 =C2=B1 28%  perf-profile.cycles=
-pp.free_pcppages_bulk.drain_pages_zone.drain_pages.drain_local_pages.flush=
_smp_call_function_queue
      1.91 =C2=B1 11%     -72.0%       0.53 =C2=B1 37%  perf-profile.cycles=
-pp.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_page_list.shrink_pa=
ge_list.shrink_inactive_list
      0.92 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.generic_smp_call_function_single_interrupt.smp_call_function_interrupt.=
call_function_interrupt.pagevec_lru_move_fn.__lru_cache_add
      1.36 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.generic_smp_call_function_single_interrupt.smp_call_function_interrupt.=
call_function_interrupt.shrink_zone_memcg.shrink_node
      2.73 =C2=B1 54%     -95.5%       0.12 =C2=B1 69%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__pag=
e_cache_alloc.__do_page_cache_readahead
      1.23 =C2=B1  6%     -40.0%       0.73 =C2=B1 19%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__pag=
e_cache_alloc.filemap_fault
      8.78 =C2=B1 17%     -49.8%       4.41 =C2=B1 10%  perf-profile.cycles=
-pp.get_page_from_freelist.__alloc_pages_slowpath.__alloc_pages_nodemask.al=
loc_pages_current.__page_cache_alloc
      1.03 =C2=B1 11%     -51.8%       0.49 =C2=B1 47%  perf-profile.cycles=
-pp.isolate_lru_pages.isra.53.shrink_inactive_list.shrink_zone_memcg.shrink=
_node.do_try_to_free_pages
      0.89 =C2=B1 23%     -99.6%       0.00 =C2=B1141%  perf-profile.cycles=
-pp.kmem_cache_alloc.__radix_tree_preload.radix_tree_maybe_preload.__add_to=
_page_cache_locked.add_to_page_cache_lru
      2.81 =C2=B1  3%     +17.6%       3.31 =C2=B1  7%  perf-profile.cycles=
-pp.kswapd.kthread.ret_from_fork
      4.65 =C2=B1  6%     -50.6%       2.30 =C2=B1 23%  perf-profile.cycles=
-pp.lru_cache_add.add_to_page_cache_lru.filemap_fault.xfs_filemap_fault.__d=
o_fault
      7.99 =C2=B1 47%     -96.2%       0.30 =C2=B1 68%  perf-profile.cycles=
-pp.lru_cache_add.add_to_page_cache_lru.mpage_readpages.xfs_vm_readpages.__=
do_page_cache_readahead
      2.00 =C2=B1 29%     +63.3%       3.27 =C2=B1  6%  perf-profile.cycles=
-pp.mem_cgroup_iter.shrink_node.do_try_to_free_pages.try_to_free_pages.__al=
loc_pages_slowpath
     24.44 =C2=B1 49%    +146.9%      60.34 =C2=B1  5%  perf-profile.cycles=
-pp.mem_cgroup_soft_limit_reclaim.do_try_to_free_pages.try_to_free_pages.__=
alloc_pages_slowpath.__alloc_pages_nodemask
      0.12 =C2=B1 46%    +989.1%       1.25 =C2=B1  4%  perf-profile.cycles=
-pp.mem_cgroup_soft_limit_reclaim.kswapd.kthread.ret_from_fork
     13.27 =C2=B1 36%     -92.8%       0.96 =C2=B1 67%  perf-profile.cycles=
-pp.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.ondemand_rea=
dahead.page_cache_async_readahead
      6.56 =C2=B1 47%     -62.0%       2.50 =C2=B1 27%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bulk.drai=
n_pages_zone.drain_pages
      1.45 =C2=B1 10%     -83.4%       0.24 =C2=B1 56%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bulk.free=
_hot_cold_page.free_hot_cold_page_list
      3.08 =C2=B1 51%     -89.8%       0.31 =C2=B1 51%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.get_page_from_freelist.=
__alloc_pages_nodemask.alloc_pages_current
      7.79 =C2=B1 21%     -53.5%       3.63 =C2=B1 13%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.get_page_from_freelist.=
__alloc_pages_slowpath.__alloc_pages_nodemask
      0.00 =C2=B1 -1%      +Inf%       1.14 =C2=B1 22%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock.vmpressure.vmpressure_p=
rio.do_try_to_free_pages
     23.60 =C2=B1 50%    +150.0%      59.00 =C2=B1  5%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.mem_cgroup_soft_lim=
it_reclaim.do_try_to_free_pages.try_to_free_pages
      0.11 =C2=B1 52%   +1023.3%       1.21 =C2=B1  4%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.mem_cgroup_soft_lim=
it_reclaim.kswapd.kthread
     10.92 =C2=B1 27%     -85.4%       1.60 =C2=B1 57%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.shrink_inactive_lis=
t.shrink_zone_memcg.shrink_node
     11.04 =C2=B1 28%     -91.8%       0.90 =C2=B1134%  perf-profile.cycles=
-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.pagevec_lru_mov=
e_fn.__lru_cache_add.lru_cache_add
      0.88 =C2=B1 23%     -99.6%       0.00 =C2=B1141%  perf-profile.cycles=
-pp.new_slab.___slab_alloc.__slab_alloc.kmem_cache_alloc.__radix_tree_prelo=
ad
     32.41 =C2=B1 26%     -84.6%       4.99 =C2=B1 64%  perf-profile.cycles=
-pp.ondemand_readahead.page_cache_async_readahead.filemap_fault.xfs_filemap=
_fault.__do_fault
     32.42 =C2=B1 26%     -84.6%       4.99 =C2=B1 64%  perf-profile.cycles=
-pp.page_cache_async_readahead.filemap_fault.xfs_filemap_fault.__do_fault.h=
andle_mm_fault
      1.89 =C2=B1  5%     -58.7%       0.78 =C2=B1 46%  perf-profile.cycles=
-pp.page_referenced.shrink_page_list.shrink_inactive_list.shrink_zone_memcg=
.shrink_node
      4.62 =C2=B1  6%     -50.6%       2.28 =C2=B1 23%  perf-profile.cycles=
-pp.pagevec_lru_move_fn.__lru_cache_add.lru_cache_add.add_to_page_cache_lru=
.filemap_fault
      7.95 =C2=B1 47%     -96.3%       0.29 =C2=B1 69%  perf-profile.cycles=
-pp.pagevec_lru_move_fn.__lru_cache_add.lru_cache_add.add_to_page_cache_lru=
.mpage_readpages
     24.52 =C2=B1 25%     -75.9%       5.90 =C2=B1 35%  perf-profile.cycles=
-pp.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fault.do_page_fault
      0.86 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.radix_tree_maybe_preload.__add_to_page_cache_locked.add_to_page_cache_l=
ru.mpage_readpages.xfs_vm_readpages
      1.67 =C2=B1  3%     -50.2%       0.83 =C2=B1 34%  perf-profile.cycles=
-pp.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_list.shrink_=
zone_memcg
      1.42 =C2=B1  0%     -43.1%       0.81 =C2=B1 19%  perf-profile.cycles=
-pp.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_zon=
e_memcg
     24.99 =C2=B1 21%     -68.9%       7.78 =C2=B1 34%  perf-profile.cycles=
-pp.shrink_inactive_list.shrink_zone_memcg.shrink_node.do_try_to_free_pages=
.try_to_free_pages
      2.25 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_inactive_list.shrink_zone_memcg.shrink_node.kswapd.kthread
     30.41 =C2=B1 17%     -54.6%      13.81 =C2=B1 16%  perf-profile.cycles=
-pp.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpa=
th.__alloc_pages_nodemask
      2.57 =C2=B1  1%     -50.5%       1.27 =C2=B1 10%  perf-profile.cycles=
-pp.shrink_node.kswapd.kthread.ret_from_fork
     12.95 =C2=B1 19%     -61.5%       4.98 =C2=B1 26%  perf-profile.cycles=
-pp.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.shrink_node.do_=
try_to_free_pages
      1.28 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.shrink_node.ksw=
apd
      0.21 =C2=B1 10%    +385.7%       1.02 =C2=B1 10%  perf-profile.cycles=
-pp.shrink_slab.part.45.shrink_node.kswapd.kthread.ret_from_fork
     27.44 =C2=B1 21%     -66.6%       9.16 =C2=B1 28%  perf-profile.cycles=
-pp.shrink_zone_memcg.shrink_node.do_try_to_free_pages.try_to_free_pages.__=
alloc_pages_slowpath
      2.32 =C2=B1  1%     -97.2%       0.07 =C2=B1 13%  perf-profile.cycles=
-pp.shrink_zone_memcg.shrink_node.kswapd.kthread.ret_from_fork
      0.91 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_call_function_interrupt.call_function_interrupt.pagevec_lru_move_fn=
.__lru_cache_add.lru_cache_add
      1.29 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
-pp.smp_call_function_interrupt.call_function_interrupt.shrink_zone_memcg.s=
hrink_node.do_try_to_free_pages
      5.56 =C2=B1 38%     -76.8%       1.29 =C2=B1 19%  perf-profile.cycles=
-pp.smp_call_function_many.try_to_unmap_flush.shrink_page_list.shrink_inact=
ive_list.shrink_zone_memcg
     31.63 =C2=B1 40%    +122.8%      70.45 =C2=B1  6%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_p=
ages_current.__page_cache_alloc
     24.14 =C2=B1 26%     -83.4%       4.01 =C2=B1 57%  perf-profile.cycles=
-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_p=
ages_current.pte_alloc_one
      1.42 =C2=B1  2%     -44.3%       0.79 =C2=B1 25%  perf-profile.cycles=
-pp.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.sh=
rink_node
      5.85 =C2=B1 38%     -76.3%       1.39 =C2=B1 18%  perf-profile.cycles=
-pp.try_to_unmap_flush.shrink_page_list.shrink_inactive_list.shrink_zone_me=
mcg.shrink_node
      0.96 =C2=B1  7%     -59.7%       0.39 =C2=B1 33%  perf-profile.cycles=
-pp.try_to_unmap_one.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactiv=
e_list
      0.29 =C2=B1 62%    +381.6%       1.37 =C2=B1 20%  perf-profile.cycles=
-pp.vmpressure.vmpressure_prio.do_try_to_free_pages.try_to_free_pages.__all=
oc_pages_slowpath
      0.30 =C2=B1 60%    +367.2%       1.39 =C2=B1 17%  perf-profile.cycles=
-pp.vmpressure_prio.do_try_to_free_pages.try_to_free_pages.__alloc_pages_sl=
owpath.__alloc_pages_nodemask
      0.09 =C2=B1 59%   +1700.0%       1.53 =C2=B1 12%  perf-profile.cycles=
-pp.wakeup_kswapd.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_pages=
_current.__page_cache_alloc
     68.44 =C2=B1  8%     +26.4%      86.51 =C2=B1  3%  perf-profile.cycles=
-pp.xfs_filemap_fault.__do_fault.handle_mm_fault.__do_page_fault.do_page_fa=
ult
     13.28 =C2=B1 36%     -92.8%       0.96 =C2=B1 67%  perf-profile.cycles=
-pp.xfs_vm_readpages.__do_page_cache_readahead.ondemand_readahead.page_cach=
e_async_readahead.filemap_fault
    108.50 =C2=B1129%     -92.2%       8.50 =C2=B1 10%  sched_debug.cfs_rq:=
/.load.35
     15.50 =C2=B1 26%     -40.3%       9.25 =C2=B1 23%  sched_debug.cfs_rq:=
/.load.5
     29.02 =C2=B1  4%     +24.6%      36.15 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.avg
    762.38 =C2=B1  8%     +11.0%     845.92 =C2=B1  4%  sched_debug.cfs_rq:=
/.load.max
    114.31 =C2=B1  2%     +25.0%     142.89 =C2=B1  3%  sched_debug.cfs_rq:=
/.load.stddev
     98.75 =C2=B1 81%     -91.1%       8.75 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.20
     98.25 =C2=B1142%     -87.0%      12.75 =C2=B1 16%  sched_debug.cfs_rq:=
/.load_avg.35
     97.75 =C2=B1 81%     -88.5%      11.25 =C2=B1 14%  sched_debug.cfs_rq:=
/.load_avg.4
     23.75 =C2=B1 55%     -58.9%       9.75 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.40
     25.00 =C2=B1 28%     -68.0%       8.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.load_avg.54
    105.00 =C2=B1131%     -90.7%       9.75 =C2=B1 25%  sched_debug.cfs_rq:=
/.load_avg.63
     21.25 =C2=B1 52%     -55.3%       9.50 =C2=B1 27%  sched_debug.cfs_rq:=
/.load_avg.64
     37.27 =C2=B1  6%      +9.9%      40.97 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.avg
    130.36 =C2=B1  6%     +17.7%     153.48 =C2=B1  6%  sched_debug.cfs_rq:=
/.load_avg.stddev
  11057974 =C2=B1  0%     -17.4%    9132164 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.10
  11299584 =C2=B1  0%     -26.8%    8266403 =C2=B1 26%  sched_debug.cfs_rq:=
/.min_vruntime.46
      1.25 =C2=B1131%   +1900.0%      25.00 =C2=B1126%  sched_debug.cfs_rq:=
/.nr_spread_over.34
      0.00 =C2=B1  0%      +Inf%      45.00 =C2=B1116%  sched_debug.cfs_rq:=
/.nr_spread_over.46
     10.75 =C2=B1 12%     -23.3%       8.25 =C2=B1  5%  sched_debug.cfs_rq:=
/.runnable_load_avg.23
     52.75 =C2=B1128%     -83.4%       8.75 =C2=B1  9%  sched_debug.cfs_rq:=
/.runnable_load_avg.4
     12.00 =C2=B1 17%     -35.4%       7.75 =C2=B1  5%  sched_debug.cfs_rq:=
/.runnable_load_avg.54
     52.75 =C2=B1136%     -84.8%       8.00 =C2=B1 17%  sched_debug.cfs_rq:=
/.runnable_load_avg.62
     92.50 =C2=B1154%     -91.4%       8.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.63
     27.47 =C2=B1  3%     +18.1%      32.45 =C2=B1  8%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
     47063 =C2=B1234%   -4172.4%   -1916598 =C2=B1-70%  sched_debug.cfs_rq:=
/.spread0.10
    124719 =C2=B1153%   -1456.9%   -1692374 =C2=B1-158%  sched_debug.cfs_rq=
:/.spread0.13
   -204689 =C2=B1-113%    -151.2%     104824 =C2=B1 69%  sched_debug.cfs_rq=
:/.spread0.22
     14333 =C2=B11307%   +1312.1%     202407 =C2=B1 48%  sched_debug.cfs_rq=
:/.spread0.23
   -134666 =C2=B1-108%    -238.6%     186606 =C2=B1 54%  sched_debug.cfs_rq=
:/.spread0.24
  -1118648 =C2=B1-159%    -121.6%     241345 =C2=B1 47%  sched_debug.cfs_rq=
:/.spread0.30
    -25248 =C2=B1-177%   +7559.7%   -1933975 =C2=B1-139%  sched_debug.cfs_r=
q:/.spread0.34
    342215 =C2=B1 55%    -123.1%     -79023 =C2=B1-367%  sched_debug.cfs_rq=
:/.spread0.43
    281351 =C2=B1 66%   -1090.5%   -2786704 =C2=B1-75%  sched_debug.cfs_rq:=
/.spread0.46
   -356882 =C2=B1-233%    -179.1%     282353 =C2=B1 28%  sched_debug.cfs_rq=
:/.spread0.54
    146463 =C2=B1 33%    -598.6%    -730203 =C2=B1-168%  sched_debug.cfs_rq=
:/.spread0.70
    778.25 =C2=B1  9%     -13.0%     677.00 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.0
    828.25 =C2=B1  8%     -16.3%     693.50 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.1
    811.00 =C2=B1  7%     -13.7%     700.25 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.10
    772.00 =C2=B1  9%     -13.3%     669.25 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.13
    771.00 =C2=B1 10%     -10.1%     692.75 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.21
    813.00 =C2=B1  5%     -15.6%     686.50 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.25
    781.00 =C2=B1 11%     -13.2%     678.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.35
    884.50 =C2=B1 10%     -23.1%     679.75 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.4
    780.25 =C2=B1  9%     -12.9%     679.50 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.40
    763.25 =C2=B1  8%     -12.0%     671.50 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.42
    764.75 =C2=B1  6%      -9.4%     692.75 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.44
    770.75 =C2=B1 10%     -11.7%     680.50 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.45
    781.00 =C2=B1  8%     -12.9%     680.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.46
    802.75 =C2=B1  4%     -13.9%     691.50 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.53
    808.50 =C2=B1  9%     -16.2%     677.25 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.54
    819.50 =C2=B1 10%     -22.0%     639.00 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.62
    762.50 =C2=B1 10%     -11.0%     679.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.68
    772.00 =C2=B1 10%     -11.3%     684.50 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.70
    763.75 =C2=B1 10%     -11.4%     676.50 =C2=B1  0%  sched_debug.cfs_rq:=
/.util_avg.71
    772.50 =C2=B1 10%     -10.1%     694.25 =C2=B1  3%  sched_debug.cfs_rq:=
/.util_avg.9
    915949 =C2=B1  4%     -28.6%     653920 =C2=B1 33%  sched_debug.cpu.avg=
_idle.19
    946762 =C2=B1  3%     -35.3%     612888 =C2=B1 13%  sched_debug.cpu.avg=
_idle.20
   1285759 =C2=B1 42%     -51.3%     626701 =C2=B1 14%  sched_debug.cpu.avg=
_idle.23
    953325 =C2=B1  5%     -30.7%     660871 =C2=B1 13%  sched_debug.cpu.avg=
_idle.29
    957657 =C2=B1  1%     -30.6%     664474 =C2=B1 25%  sched_debug.cpu.avg=
_idle.30
   1896042 =C2=B1 91%     -66.2%     641472 =C2=B1 16%  sched_debug.cpu.avg=
_idle.31
    961262 =C2=B1  4%     -30.5%     668351 =C2=B1 24%  sched_debug.cpu.avg=
_idle.33
    987474 =C2=B1  1%     -17.9%     810690 =C2=B1 15%  sched_debug.cpu.avg=
_idle.34
    942078 =C2=B1  5%     -21.3%     741238 =C2=B1 10%  sched_debug.cpu.avg=
_idle.35
    891666 =C2=B1 11%     -30.5%     620080 =C2=B1 10%  sched_debug.cpu.avg=
_idle.55
    947867 =C2=B1  2%     -29.4%     669528 =C2=B1 14%  sched_debug.cpu.avg=
_idle.56
    968395 =C2=B1  1%     -34.8%     631497 =C2=B1 36%  sched_debug.cpu.avg=
_idle.58
    965380 =C2=B1  3%     -32.5%     651434 =C2=B1 23%  sched_debug.cpu.avg=
_idle.59
    938254 =C2=B1  4%     -35.0%     609908 =C2=B1 13%  sched_debug.cpu.avg=
_idle.60
    943098 =C2=B1  7%     -33.0%     631792 =C2=B1 20%  sched_debug.cpu.avg=
_idle.61
    962675 =C2=B1  2%     -31.9%     655593 =C2=B1 15%  sched_debug.cpu.avg=
_idle.62
    919345 =C2=B1  8%     -40.5%     546855 =C2=B1 21%  sched_debug.cpu.avg=
_idle.63
    971231 =C2=B1  2%     -37.5%     607096 =C2=B1 24%  sched_debug.cpu.avg=
_idle.64
    965548 =C2=B1  3%     -32.4%     653130 =C2=B1 16%  sched_debug.cpu.avg=
_idle.65
    910816 =C2=B1 15%     -32.9%     611123 =C2=B1  7%  sched_debug.cpu.avg=
_idle.66
    916841 =C2=B1  8%     -35.9%     588047 =C2=B1 27%  sched_debug.cpu.avg=
_idle.67
    951406 =C2=B1  2%     -39.9%     571448 =C2=B1 25%  sched_debug.cpu.avg=
_idle.68
    917218 =C2=B1  5%     -32.0%     623827 =C2=B1 21%  sched_debug.cpu.avg=
_idle.69
    968216 =C2=B1  1%     -34.1%     637949 =C2=B1  9%  sched_debug.cpu.avg=
_idle.71
   1073266 =C2=B1 19%     -21.3%     844924 =C2=B1  5%  sched_debug.cpu.avg=
_idle.avg
    495329 =C2=B1 10%     -62.7%     184682 =C2=B1 32%  sched_debug.cpu.avg=
_idle.min
     52.50 =C2=B1129%     -83.3%       8.75 =C2=B1  9%  sched_debug.cpu.cpu=
_load[0].4
     12.25 =C2=B1 17%     -36.7%       7.75 =C2=B1  5%  sched_debug.cpu.cpu=
_load[0].54
     52.75 =C2=B1136%     -83.9%       8.50 =C2=B1 10%  sched_debug.cpu.cpu=
_load[0].62
     92.50 =C2=B1154%     -91.4%       8.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[0].63
     52.25 =C2=B1129%     -83.3%       8.75 =C2=B1  9%  sched_debug.cpu.cpu=
_load[1].4
     12.00 =C2=B1 18%     -35.4%       7.75 =C2=B1  5%  sched_debug.cpu.cpu=
_load[1].54
     52.75 =C2=B1136%     -83.9%       8.50 =C2=B1 10%  sched_debug.cpu.cpu=
_load[1].62
     92.75 =C2=B1154%     -91.4%       8.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[1].63
     28.77 =C2=B1  1%     +12.9%      32.48 =C2=B1  6%  sched_debug.cpu.cpu=
_load[1].avg
     51.25 =C2=B1128%     -82.9%       8.75 =C2=B1  9%  sched_debug.cpu.cpu=
_load[2].4
     12.00 =C2=B1 18%     -35.4%       7.75 =C2=B1  5%  sched_debug.cpu.cpu=
_load[2].54
     52.75 =C2=B1136%     -83.9%       8.50 =C2=B1 10%  sched_debug.cpu.cpu=
_load[2].62
     92.75 =C2=B1154%     -91.4%       8.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[2].63
     28.28 =C2=B1  1%     +13.7%      32.14 =C2=B1  6%  sched_debug.cpu.cpu=
_load[2].avg
     51.00 =C2=B1128%     -82.8%       8.75 =C2=B1  9%  sched_debug.cpu.cpu=
_load[3].4
     12.00 =C2=B1 18%     -35.4%       7.75 =C2=B1  5%  sched_debug.cpu.cpu=
_load[3].54
     92.75 =C2=B1154%     -91.4%       8.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[3].63
     28.20 =C2=B1  0%     +12.3%      31.68 =C2=B1  6%  sched_debug.cpu.cpu=
_load[3].avg
     51.50 =C2=B1128%     -83.0%       8.75 =C2=B1  9%  sched_debug.cpu.cpu=
_load[4].4
     12.00 =C2=B1 18%     -35.4%       7.75 =C2=B1  5%  sched_debug.cpu.cpu=
_load[4].54
     92.75 =C2=B1154%     -91.4%       8.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[4].63
      1520 =C2=B1 17%     -21.2%       1197 =C2=B1 10%  sched_debug.cpu.cur=
r->pid.11
      1638 =C2=B1 17%     -23.7%       1249 =C2=B1  2%  sched_debug.cpu.cur=
r->pid.20
      1416 =C2=B1  8%      -9.8%       1277 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.22
      1489 =C2=B1  8%     -14.8%       1270 =C2=B1  2%  sched_debug.cpu.cur=
r->pid.23
      1689 =C2=B1 14%     -26.0%       1249 =C2=B1  3%  sched_debug.cpu.cur=
r->pid.31
      1488 =C2=B1  8%     -19.8%       1193 =C2=B1  8%  sched_debug.cpu.cur=
r->pid.46
      1618 =C2=B1  6%     -21.4%       1273 =C2=B1  2%  sched_debug.cpu.cur=
r->pid.5
      1553 =C2=B1  2%     -23.5%       1188 =C2=B1  8%  sched_debug.cpu.cur=
r->pid.52
      1374 =C2=B1 12%     -13.6%       1187 =C2=B1 16%  sched_debug.cpu.cur=
r->pid.55
      1615 =C2=B1 13%     -25.5%       1203 =C2=B1  3%  sched_debug.cpu.cur=
r->pid.6
      1707 =C2=B1 26%     -29.9%       1197 =C2=B1  9%  sched_debug.cpu.cur=
r->pid.70
      1985 =C2=B1 33%     -37.6%       1238 =C2=B1  1%  sched_debug.cpu.cur=
r->pid.8
      1514 =C2=B1  3%     -16.8%       1259 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.9
      1467 =C2=B1  7%     -10.4%       1314 =C2=B1  1%  sched_debug.cpu.cur=
r->pid.avg
    137.25 =C2=B1160%     -93.8%       8.50 =C2=B1 10%  sched_debug.cpu.loa=
d.14
    108.50 =C2=B1129%     -92.2%       8.50 =C2=B1 10%  sched_debug.cpu.loa=
d.35
     15.50 =C2=B1 26%     -40.3%       9.25 =C2=B1 23%  sched_debug.cpu.loa=
d.5
     29.67 =C2=B1  4%     +21.7%      36.10 =C2=B1  3%  sched_debug.cpu.loa=
d.avg
    762.92 =C2=B1  8%     +10.9%     845.88 =C2=B1  4%  sched_debug.cpu.loa=
d.max
    116.42 =C2=B1  0%     +22.7%     142.85 =C2=B1  3%  sched_debug.cpu.loa=
d.stddev
      4935 =C2=B1 46%    +574.9%      33310 =C2=B1 70%  sched_debug.cpu.nr_=
switches.10
      5147 =C2=B1 20%    +323.8%      21814 =C2=B1 45%  sched_debug.cpu.nr_=
switches.13
     19240 =C2=B1 25%     -79.9%       3873 =C2=B1 26%  sched_debug.cpu.nr_=
switches.31
     15958 =C2=B1 63%     -70.4%       4728 =C2=B1 13%  sched_debug.cpu.nr_=
switches.34
      1996 =C2=B1  9%    +795.5%      17873 =C2=B1135%  sched_debug.cpu.nr_=
switches.43
      1894 =C2=B1 26%    +900.0%      18942 =C2=B1 78%  sched_debug.cpu.nr_=
switches.48
     -6.25 =C2=B1-32%    -120.0%       1.25 =C2=B1198%  sched_debug.cpu.nr_=
uninterruptible.16
     -2.25 =C2=B1-79%    -133.3%       0.75 =C2=B1110%  sched_debug.cpu.nr_=
uninterruptible.2
      1.25 =C2=B1273%    -840.0%      -9.25 =C2=B1-30%  sched_debug.cpu.nr_=
uninterruptible.28
      0.50 =C2=B1223%   -1033.3%      -4.67 =C2=B1-61%  sched_debug.cpu.nr_=
uninterruptible.31
      0.00 =C2=B1  1%      +Inf%       5.50 =C2=B1 48%  sched_debug.cpu.nr_=
uninterruptible.41
      6.75 =C2=B1 56%     -90.1%       0.67 =C2=B1141%  sched_debug.cpu.nr_=
uninterruptible.52
      0.75 =C2=B1256%    +600.0%       5.25 =C2=B1 45%  sched_debug.cpu.nr_=
uninterruptible.54
      1.00 =C2=B1122%    +275.0%       3.75 =C2=B1 34%  sched_debug.cpu.nr_=
uninterruptible.56
      1.50 =C2=B1166%     +33.3%       2.00 =C2=B1 35%  sched_debug.cpu.nr_=
uninterruptible.61
      0.00 =C2=B1  1%      +Inf%       1.50 =C2=B1218%  sched_debug.cpu.nr_=
uninterruptible.69
     11809 =C2=B1 84%    +294.5%      46581 =C2=B1 68%  sched_debug.cpu.sch=
ed_count.10
      6201 =C2=B1 20%    +268.0%      22818 =C2=B1 43%  sched_debug.cpu.sch=
ed_count.13
     15343 =C2=B1 61%     -53.2%       7181 =C2=B1 51%  sched_debug.cpu.sch=
ed_count.14
     20306 =C2=B1 23%     -75.4%       5004 =C2=B1 22%  sched_debug.cpu.sch=
ed_count.31
     17210 =C2=B1 57%     -61.9%       6558 =C2=B1 12%  sched_debug.cpu.sch=
ed_count.34
     38498 =C2=B1 55%     -80.8%       7373 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.4
      2732 =C2=B1  9%    +819.1%      25117 =C2=B1 91%  sched_debug.cpu.sch=
ed_count.43
      5544 =C2=B1 95%    +379.5%      26588 =C2=B1 44%  sched_debug.cpu.sch=
ed_count.48
      5047 =C2=B1 42%    +205.1%      15399 =C2=B1 96%  sched_debug.cpu.sch=
ed_count.61
      2009 =C2=B1  2%     +25.7%       2524 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.min
      1278 =C2=B1 18%     +26.6%       1617 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.0
    298.25 =C2=B1 12%    +298.1%       1187 =C2=B1 43%  sched_debug.cpu.sch=
ed_goidle.10
    560.25 =C2=B1 42%     +90.9%       1069 =C2=B1 47%  sched_debug.cpu.sch=
ed_goidle.29
    441.75 =C2=B1 32%     +91.4%     845.50 =C2=B1 44%  sched_debug.cpu.sch=
ed_goidle.31
    308.25 =C2=B1 75%    +194.6%     908.00 =C2=B1 74%  sched_debug.cpu.sch=
ed_goidle.55
    174.50 =C2=B1 40%    +691.7%       1381 =C2=B1 76%  sched_debug.cpu.sch=
ed_goidle.57
    188.50 =C2=B1 24%    +249.1%     658.00 =C2=B1 93%  sched_debug.cpu.sch=
ed_goidle.62
    235.75 =C2=B1 71%    +205.2%     719.50 =C2=B1 80%  sched_debug.cpu.sch=
ed_goidle.64
    183.00 =C2=B1  7%    +192.2%     534.75 =C2=B1 44%  sched_debug.cpu.sch=
ed_goidle.65
    172.75 =C2=B1 14%    +284.4%     664.00 =C2=B1 98%  sched_debug.cpu.sch=
ed_goidle.67
      3207 =C2=B1 41%    +639.6%      23720 =C2=B1 55%  sched_debug.cpu.ttw=
u_count.10
      4399 =C2=B1 98%    +350.6%      19822 =C2=B1 74%  sched_debug.cpu.ttw=
u_count.12
      3161 =C2=B1 17%    +411.9%      16181 =C2=B1 23%  sched_debug.cpu.ttw=
u_count.13
      5397 =C2=B1 49%    +106.8%      11159 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.14
      6285 =C2=B1 43%    +179.0%      17536 =C2=B1 40%  sched_debug.cpu.ttw=
u_count.16
      2315 =C2=B1 21%    +536.4%      14732 =C2=B1 44%  sched_debug.cpu.ttw=
u_count.17
      4673 =C2=B1 37%    +159.8%      12140 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.20
      3256 =C2=B1 50%    +360.9%      15006 =C2=B1 43%  sched_debug.cpu.ttw=
u_count.29
      3694 =C2=B1 24%    +296.4%      14644 =C2=B1 29%  sched_debug.cpu.ttw=
u_count.3
      6425 =C2=B1 67%    +127.3%      14605 =C2=B1 33%  sched_debug.cpu.ttw=
u_count.32
      4574 =C2=B1 54%    +128.4%      10446 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.36
      2164 =C2=B1 31%    +377.9%      10342 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.37
      3858 =C2=B1 60%    +191.1%      11232 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.38
      2829 =C2=B1 40%    +317.0%      11796 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.39
      5410 =C2=B1 48%    +258.7%      19407 =C2=B1 77%  sched_debug.cpu.ttw=
u_count.40
      2970 =C2=B1 19%    +512.5%      18195 =C2=B1 47%  sched_debug.cpu.ttw=
u_count.41
      1881 =C2=B1 23%    +870.4%      18259 =C2=B1 69%  sched_debug.cpu.ttw=
u_count.43
      4395 =C2=B1 67%    +253.1%      15523 =C2=B1 29%  sched_debug.cpu.ttw=
u_count.44
      2470 =C2=B1 11%    +403.2%      12432 =C2=B1 19%  sched_debug.cpu.ttw=
u_count.45
      3261 =C2=B1 24%    +287.7%      12644 =C2=B1 55%  sched_debug.cpu.ttw=
u_count.46
      1529 =C2=B1 27%   +1033.9%      17346 =C2=B1 44%  sched_debug.cpu.ttw=
u_count.48
      4699 =C2=B1 92%    +203.9%      14282 =C2=B1 28%  sched_debug.cpu.ttw=
u_count.49
      2338 =C2=B1 38%    +500.1%      14032 =C2=B1 45%  sched_debug.cpu.ttw=
u_count.50
      3432 =C2=B1 38%    +273.9%      12834 =C2=B1 53%  sched_debug.cpu.ttw=
u_count.52
      3897 =C2=B1 53%    +133.3%       9093 =C2=B1  5%  sched_debug.cpu.ttw=
u_count.53
      4456 =C2=B1 38%    +134.1%      10430 =C2=B1 10%  sched_debug.cpu.ttw=
u_count.56
      3914 =C2=B1 65%    +217.6%      12430 =C2=B1 39%  sched_debug.cpu.ttw=
u_count.57
      1918 =C2=B1 33%    +388.7%       9375 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.59
      4774 =C2=B1 62%    +178.6%      13300 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.6
      2338 =C2=B1 37%    +287.9%       9069 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.60
      2729 =C2=B1 29%    +441.2%      14769 =C2=B1 56%  sched_debug.cpu.ttw=
u_count.61
      3229 =C2=B1 49%    +256.6%      11517 =C2=B1 19%  sched_debug.cpu.ttw=
u_count.62
      3826 =C2=B1 52%    +176.1%      10562 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.63
      2502 =C2=B1 33%    +324.5%      10623 =C2=B1 15%  sched_debug.cpu.ttw=
u_count.64
      1900 =C2=B1 25%    +367.0%       8874 =C2=B1  8%  sched_debug.cpu.ttw=
u_count.67
      2724 =C2=B1 52%    +365.3%      12676 =C2=B1 38%  sched_debug.cpu.ttw=
u_count.69
      2296 =C2=B1 35%    +339.4%      10088 =C2=B1  7%  sched_debug.cpu.ttw=
u_count.70
      2668 =C2=B1 16%    +277.5%      10074 =C2=B1 12%  sched_debug.cpu.ttw=
u_count.71
      3077 =C2=B1 17%    +430.4%      16319 =C2=B1 27%  sched_debug.cpu.ttw=
u_count.8
      6075 =C2=B1  4%    +126.3%      13750 =C2=B1  4%  sched_debug.cpu.ttw=
u_count.avg
     37108 =C2=B1  8%     +55.5%      57712 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.max
      1158 =C2=B1 18%    +530.1%       7298 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.min
      1844 =C2=B1 62%    +673.1%      14259 =C2=B1 87%  sched_debug.cpu.ttw=
u_local.10
      1819 =C2=B1 33%    +366.2%       8481 =C2=B1 47%  sched_debug.cpu.ttw=
u_local.13
      3967 =C2=B1 65%     -69.4%       1214 =C2=B1 68%  sched_debug.cpu.ttw=
u_local.14
      8652 =C2=B1 27%     -92.9%     613.50 =C2=B1 41%  sched_debug.cpu.ttw=
u_local.31
      7011 =C2=B1 73%     -85.4%       1025 =C2=B1 37%  sched_debug.cpu.ttw=
u_local.34
      5342 =C2=B1 80%     -61.2%       2075 =C2=B1 34%  sched_debug.cpu.ttw=
u_local.4
    607.25 =C2=B1 23%   +1252.9%       8215 =C2=B1146%  sched_debug.cpu.ttw=
u_local.43
    577.25 =C2=B1 30%   +1378.3%       8533 =C2=B1 89%  sched_debug.cpu.ttw=
u_local.48
      3079 =C2=B1 46%     -72.9%     834.50 =C2=B1 74%  sched_debug.cpu.ttw=
u_local.56
    861.50 =C2=B1 37%     -59.5%     348.50 =C2=B1 23%  sched_debug.cpu.ttw=
u_local.67
      4690 =C2=B1  3%     -11.7%       4141 =C2=B1  7%  sched_debug.cpu.ttw=
u_local.avg
     35180 =C2=B1  9%     +23.6%      43479 =C2=B1 13%  sched_debug.cpu.ttw=
u_local.max
    273.67 =C2=B1  6%     -17.3%     226.38 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.min


lkp-bdw01: Broadwell ULT
Memory: 4G

lkp-hsw-ep2: Brickland Haswell-EP
Memory: 128G

                      blogbench.time.voluntary_context_switches

  1e+07 ++-----------------------------------------------------------------=
-+
        O   O                                                              =
 |
  9e+06 ++O  O O O O                                                       =
 |
        |                                                                  =
 |
  8e+06 ++                                                                 =
 |
        |                                                                  =
 |
  7e+06 ++                O                          O                     =
 |
        |            OO O   OO   O O OO O O   OO O     OO O                =
 |
  6e+06 ++                     O            O      O                       =
 |
        |                                                      *.*         =
 |
  5e+06 ++                                                     :  +   .*   =
 |
        |                                                  .*.*    *.*  *.*=
.*
  4e+06 *+*.**.*.*.*.**.*.*.**.*.*.*.**.*.*.*.**.*.*.*.**.*                =
 |
        |                                                                  =
 |
  3e+06 ++-----------------------------------------------------------------=
-+


                             proc-vmstat.kswapd_inodesteal

    2e+07 ++---------------------------------------------------------------=
-+
  1.8e+07 O+OO O O OO     OO O          OO    O O    O O O                 =
 |
          |           O O      O OO O O    O O    O O      O               =
 |
  1.6e+07 ++                                                               =
 |
  1.4e+07 ++                                                               =
 |
          |                                                                =
 |
  1.2e+07 ++                                                               =
 |
    1e+07 ++                                                               =
 |
    8e+06 ++                                                               =
 |
          |                                                                =
 |
    6e+06 ++                                                               =
 |
    4e+06 ++                                                *.*.   *.*.*.**=
.*
          |                                                 :   *.*        =
 |
    2e+06 *+**.*.*.**.*.*.**.*.*.**.*.*.**.*.**.*.*.**.*.*.*               =
 |
        0 ++---------------------------------------------------------------=
-+


                       proc-vmstat.nr_vmscan_immediate_reclaim

  500000 ++----------------------------------------------------------------=
-+
  450000 ++                                                   *            =
 |
         |                                                   ::      *.    =
 |
  400000 ++                                                  ::     +  *   =
 |
  350000 ++                                                 *  :   *    *.*=
 |
         |                                                  :  :   :       =
+|
  300000 ++                                                :   :  :        =
 *
  250000 ++                                                :   :  :        =
 |
  200000 ++                                                :   :  :        =
 |
         |                                                 :   :  :        =
 |
  150000 ++ .**.*.*. *. .*.* .*.      .*.*.**.     *.*.*.*:     ::         =
 |
  100000 ++*        *  *    *   *.* .*        *. .*       *     :*         =
 |
         *                         *            *               *          =
 |
   50000 ++                                                                =
 |
       0 O+O-OO-O-O-OO-O-O-OO-O-O------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============3521896193682721300==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogYmxvZ2JlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogNWM2ZGM3OTc4
YWZiNDFiZmYyMmIyYjkwMDJiOGE2MTliM2E3Njk1NQptb2RlbDogQnJvYWR3ZWxsIFVMVApucl9j
cHU6IDQKbWVtb3J5OiA0Rwpucl9zc2RfcGFydGl0aW9uczogMQpzc2RfcGFydGl0aW9uczogIi9k
ZXYvZGlzay9ieS1pZC9hdGEtSU5URUxfU1NEU0MyQ1cxMjBBM19DVkNWMjUyNTA1WUYxMjBCR04t
cGFydDEiCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRhLUlOVEVMX1NTRFND
MkNXMTIwQTNfQ1ZDVjI1MjUwNVlGMTIwQkdOLXBhcnQyIgpjYXRlZ29yeTogYmVuY2htYXJrCmRp
c2s6IDFTU0QKZnM6IGJ0cmZzCmJsb2diZW5jaDogCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogbGtw
LWJkdzAxCnRib3hfZ3JvdXA6IGxrcC1iZHcwMQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVl
X3RpbWU6IDIwMTYtMDItMDEgMDk6MjQ6NTEuNTM0NDkwNDg2ICswODowMAppZDogOWZlOTQ2ZWQ4
MWVkMmVkYzY0YzgzM2U3OGMyMjM4OTllZTQwOGUzOQp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00
LjkKaGVhZF9jb21taXQ6IGE2NmFlZjIwMzhjZTBjZTczODZjNDBlMmEwMTBiZWIyY2I3ODk1ZDIK
YmFzZV9jb21taXQ6IDkyZTk2M2Y1MGZjNzQwNDFiNWU5ZTc0NGMzMzBkY2E0OGUwNGYwOGQKYnJh
bmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAxMzExOQpyb290ZnM6IGRlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2Jsb2diZW5jaC9wZXJm
b3JtYW5jZS0xU1NELWJ0cmZzL2xrcC1iZHcwMS9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3g4Nl82NC1yaGVsL2djYy00LjkvNWM2ZGM3OTc4YWZiNDFiZmYyMmIyYjkwMDJiOGE2MTliM2E3
Njk1NS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1iZHcwMS9iaXNlY3RfYmxvZ2Jl
bmNoLXBlcmZvcm1hbmNlLTFTU0QtYnRyZnMtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14
ODZfNjQtcmhlbC01YzZkYzc5NzhhZmI0MWJmZjIyYjJiOTAwMmI4YTYxOWIzYTc2OTU1LTIwMTYw
MjAxLTY1MzAyLTE3ZTY3bHctMC55YW1sIgptYXhfdXB0aW1lOiAxMjc5Ljc4MDAwMDAwMDAwMDIK
aW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJv
b3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9z
Y2hlZHVsZWQvbGtwLWJkdzAxL2Jpc2VjdF9ibG9nYmVuY2gtcGVyZm9ybWFuY2UtMVNTRC1idHJm
cy1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTVjNmRjNzk3OGFmYjQx
YmZmMjJiMmI5MDAyYjhhNjE5YjNhNzY5NTUtMjAxNjAyMDEtNjUzMDItMTdlNjdsdy0wLnlhbWwK
LSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwv
ZGV2ZWwtaG91cmx5LTIwMTYwMTMxMTkKLSBjb21taXQ9NWM2ZGM3OTc4YWZiNDFiZmYyMmIyYjkw
MDJiOGE2MTliM2E3Njk1NQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2Mt
NC45LzVjNmRjNzk3OGFmYjQxYmZmMjJiMmI5MDAyYjhhNjE5YjNhNzY5NTUvdm1saW51ei00LjUu
MC1yYzEtMDAwMTItZzVjNmRjNzkKLSBtYXhfdXB0aW1lPTEyNzkKLSBSRVNVTFRfUk9PVD0vcmVz
dWx0L2Jsb2diZW5jaC9wZXJmb3JtYW5jZS0xU1NELWJ0cmZzL2xrcC1iZHcwMS9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNWM2ZGM3OTc4YWZiNDFiZmYy
MmIyYjkwMDJiOGE2MTliM2E3Njk1NS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5
cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRl
YnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0x
MDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9
cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1
MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9s
a3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2dj
Yy00LjkvNWM2ZGM3OTc4YWZiNDFiZmYyMmIyYjkwMDJiOGE2MTliM2E3Njk1NS9tb2R1bGVzLmNn
eiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1p
cGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1
cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwvbGtwL2JlbmNobWFya3MvYmxvZ2Jl
bmNoLmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2dj
Yy00LjkvNWM2ZGM3OTc4YWZiNDFiZmYyMmIyYjkwMDJiOGE2MTliM2E3Njk1NS9saW51eC1oZWFk
ZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2Nj
LTQuOS81YzZkYzc5NzhhZmI0MWJmZjIyYjJiOTAwMmI4YTYxOWIzYTc2OTU1L3ZtbGludXotNC41
LjAtcmMxLTAwMDEyLWc1YzZkYzc5IgpkZXF1ZXVlX3RpbWU6IDIwMTYtMDItMDEgMDk6MjY6MTQu
Nzk4MTQxOTA1ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDExMC40OCA2OS42
MyAzMC4yMCAxLzE1MiA0NTY0CnN0YXJ0X3RpbWU6ICcxNDU0MjkwMDI1JwplbmRfdGltZTogJzE0
NTQyOTAzMjUnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMTI3LTIyMzg1MyIK

--===============3521896193682721300==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0wMSAwOToyNjo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0wMSAwOToyNjo0OCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0wMSAwOToyNjo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
Mi0wMSAwOToyNjo0OCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0wMSAwOToyNjo0OCBta2ZzIC10
IGJ0cmZzIC9kZXYvc2RhMQoyMDE2LTAyLTAxIDA5OjI3OjA0IG1vdW50IC10IGJ0cmZzIC9kZXYv
c2RhMSAvZnMvc2RhMQoyMDE2LTAyLTAxIDA5OjI3OjA1IC4vYmxvZ2JlbmNoIC1kIC9mcy9zZGEx
Cg==

--===============3521896193682721300==--

