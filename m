Content-Type: multipart/mixed; boundary="===============1838614826858677368=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm] 46cfb125d6: No primary result change, 11.3% fsmark.time.minor_page_faults
Date: Thu, 08 Oct 2015 14:10:51 +0800
Message-ID: <87d1wpx53o.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1838614826858677368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 46cfb125d673f2f30acf06b3c02485bf693d54e9 ("mm: increase SWAP_CLUSTER=
_MAX to batch TLB flushes")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/btrfs/16MB/60G/fsyncBeforeClose/16d/256fpd

commit: =

  284f74b8c06045dcc1b5caaf5f412219f18cfc60
  46cfb125d673f2f30acf06b3c02485bf693d54e9

284f74b8c06045dc 46cfb125d673f2f30acf06b3c0 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     14126 =C2=B1  3%     +11.3%      15720 =C2=B1  4%  fsmark.time.minor_p=
age_faults
     17.00 =C2=B1  0%      +5.9%      18.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     88.97 =C2=B1  0%      +8.8%      96.80 =C2=B1  0%  fsmark.time.system_=
time
     52682 =C2=B1  0%     -18.1%      43155 =C2=B1  0%  softirqs.BLOCK
     14126 =C2=B1  3%     +11.3%      15720 =C2=B1  4%  time.minor_page_fau=
lts
  25179737 =C2=B1  8%     -18.5%   20528816 =C2=B1  5%  cpuidle.C1E-NHM.time
    133847 =C2=B1  3%     -14.1%     114908 =C2=B1  4%  cpuidle.C3-NHM.usage
     92678 =C2=B1  2%     -20.8%      73391 =C2=B1  1%  meminfo.Dirty
    124930 =C2=B1  1%     +21.4%     151629 =C2=B1  0%  meminfo.Writeback
      3.45 =C2=B1  1%      +3.4%       3.56 =C2=B1  0%  turbostat.%Busy
    111.50 =C2=B1  1%      +3.8%     115.75 =C2=B1  0%  turbostat.Avg_MHz
    101775 =C2=B1157%    +329.9%     437551 =C2=B1169%  latency_stats.max.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].btrfs_new_inode.[btrfs].btrfs_create.[b=
trfs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath
      8005 =C2=B1 19%   +5364.1%     437413 =C2=B1169%  latency_stats.max.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].btrfs_inse=
rt_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_create.[btrfs].vfs_create.=
path_openat.do_filp_open.do_sys_open
    469382 =C2=B1 66%     -98.7%       6266 =C2=B1 18%  latency_stats.max.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_inode.[btrfs]=
.__btrfs_update_delayed_inode.[btrfs].btrfs_commit_inode_delayed_items.[btr=
fs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry=
_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
    363661 =C2=B1103%    -100.0%      84.50 =C2=B1 19%  latency_stats.max.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log_=
inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].=
btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
    404767 =C2=B1170%     -98.6%       5611 =C2=B1114%  latency_stats.max.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_dir_item.[btrfs].btrfs_lookup_dentry.[btrfs].btrf=
s_lookup.[btrfs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.=
entry_SYSCALL_64_fastpath
     35516 =C2=B1145%   +1126.2%     435514 =C2=B1170%  latency_stats.max.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_xattr.[btrfs].__btrfs_getxattr.[btrfs].btrfs_getx=
attr.[btrfs].cap_inode_need_killpriv.security_inode_need_killpriv.dentry_ne=
eds_remove_privs.file_remove_privs.btrfs_file_write_iter.[btrfs].__vfs_write
   1107650 =C2=B1130%     -72.4%     305514 =C2=B1 96%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.btrfs_wai=
t_marked_extents.[btrfs].btrfs_write_and_wait_transaction.[btrfs].btrfs_com=
mit_transaction.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.Sy=
S_fsync.entry_SYSCALL_64_fastpath
    199353 =C2=B1 84%    +377.4%     951697 =C2=B1154%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].btrfs_new_inode.[btrfs].btrfs_create.[b=
trfs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath
     62503 =C2=B1 33%    +657.0%     473167 =C2=B1155%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_lock_root_node.[btrfs].btrfs_search_slot.[btrf=
s].btrfs_insert_empty_items.[btrfs].insert_with_overflow.[btrfs].btrfs_inse=
rt_dir_item.[btrfs].btrfs_add_link.[btrfs].btrfs_create.[btrfs].vfs_create.=
path_openat.do_filp_open.do_sys_open
   5568453 =C2=B1 73%     -75.9%    1342137 =C2=B1 11%  latency_stats.sum.b=
trfs_tree_lock.[btrfs].btrfs_search_slot.[btrfs].btrfs_lookup_inode.[btrfs]=
.__btrfs_update_delayed_inode.[btrfs].btrfs_commit_inode_delayed_items.[btr=
fs].btrfs_log_inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry=
_safe.[btrfs].btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
   1647770 =C2=B1118%     -99.5%       7733 =C2=B1 11%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_insert_empty_items.[btrfs].copy_items.[btrfs].btrfs_log_=
inode.[btrfs].btrfs_log_inode_parent.[btrfs].btrfs_log_dentry_safe.[btrfs].=
btrfs_sync_file.[btrfs].vfs_fsync_range.do_fsync.SyS_fsync
   4780008 =C2=B1170%     -99.2%      36367 =C2=B1 61%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_dir_item.[btrfs].btrfs_lookup_dentry.[btrfs].btrf=
s_lookup.[btrfs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.=
entry_SYSCALL_64_fastpath
     88081 =C2=B1118%    +919.9%     898339 =C2=B1164%  latency_stats.sum.b=
trfs_tree_read_lock.[btrfs].btrfs_read_lock_root_node.[btrfs].btrfs_search_=
slot.[btrfs].btrfs_lookup_xattr.[btrfs].__btrfs_getxattr.[btrfs].btrfs_getx=
attr.[btrfs].cap_inode_need_killpriv.security_inode_need_killpriv.dentry_ne=
eds_remove_privs.file_remove_privs.btrfs_file_write_iter.[btrfs].__vfs_write
     20472 =C2=B1  0%     -24.3%      15507 =C2=B1  0%  proc-vmstat.allocst=
all
      1021 =C2=B1 34%     -73.5%     271.00 =C2=B1 26%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
     23142 =C2=B1  2%     -20.9%      18301 =C2=B1  1%  proc-vmstat.nr_dirty
      2441 =C2=B1 28%     -82.8%     419.50 =C2=B1 29%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
     31236 =C2=B1  1%     +21.5%      37946 =C2=B1  1%  proc-vmstat.nr_writ=
eback
      8479 =C2=B1  5%     +18.8%      10075 =C2=B1  7%  proc-vmstat.numa_hi=
nt_faults
      8479 =C2=B1  5%     +18.8%      10075 =C2=B1  7%  proc-vmstat.numa_hi=
nt_faults_local
      9293 =C2=B1  4%     +18.1%      10977 =C2=B1  6%  proc-vmstat.numa_pt=
e_updates
    683.50 =C2=B1 95%     -86.0%      96.00 =C2=B1 67%  proc-vmstat.pgdeact=
ivate
      1298 =C2=B1 11%     -39.7%     783.50 =C2=B1 45%  proc-vmstat.pgmigra=
te_success
    796.75 =C2=B1 81%     -71.9%     224.25 =C2=B1 30%  proc-vmstat.pgrefil=
l_dma
   2969680 =C2=B1  0%    +110.2%    6241700 =C2=B1  0%  proc-vmstat.pgscan_=
direct_dma32
      9735 =C2=B1 15%     -86.3%       1332 =C2=B1 20%  proc-vmstat.pgscan_=
kswapd_dma
  12295232 =C2=B1  0%     -26.7%    9017741 =C2=B1  0%  proc-vmstat.pgscan_=
kswapd_dma32
   2893713 =C2=B1  1%    +113.0%    6162694 =C2=B1  0%  proc-vmstat.pgsteal=
_direct_dma32
  12278505 =C2=B1  0%     -26.7%    9003970 =C2=B1  0%  proc-vmstat.pgsteal=
_kswapd_dma32
      7.00 =C2=B1141%    +225.0%      22.75 =C2=B1 30%  sched_debug.cfs_rq[=
0]:/.load
     88.75 =C2=B1 47%    +166.2%     236.25 =C2=B1 19%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      0.50 =C2=B1100%   +3150.0%      16.25 =C2=B1 47%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     86.25 =C2=B1 42%    +175.1%     237.25 =C2=B1 19%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     87.25 =C2=B1 41%    +175.4%     240.25 =C2=B1 20%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     22.75 =C2=B1 35%    +217.6%      72.25 =C2=B1 44%  sched_debug.cfs_rq[=
2]:/.util_avg
      7.00 =C2=B1 82%    +128.6%      16.00 =C2=B1 32%  sched_debug.cfs_rq[=
3]:/.load_avg
   -533786 =C2=B1 -7%     -15.0%    -453453 =C2=B1 -6%  sched_debug.cfs_rq[=
3]:/.spread0
     88.75 =C2=B1 40%    +169.6%     239.25 =C2=B1 19%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      7.00 =C2=B1 82%    +135.7%      16.50 =C2=B1 35%  sched_debug.cfs_rq[=
3]:/.tg_load_avg_contrib
     23.50 =C2=B1 58%    +217.0%      74.50 =C2=B1 44%  sched_debug.cfs_rq[=
3]:/.util_avg
     89.00 =C2=B1 40%    +168.8%     239.25 =C2=B1 19%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     89.50 =C2=B1 39%    +169.6%     241.25 =C2=B1 18%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     28.75 =C2=B1 90%    +173.0%      78.50 =C2=B1 61%  sched_debug.cfs_rq[=
5]:/.util_avg
      5799 =C2=B1  5%     +14.2%       6619 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.exec_clock
     90.50 =C2=B1 39%    +167.7%     242.25 =C2=B1 19%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     13.00 =C2=B1105%    +142.3%      31.50 =C2=B1 60%  sched_debug.cfs_rq[=
7]:/.load_avg
     93.00 =C2=B1 40%    +162.4%     244.00 =C2=B1 19%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     13.00 =C2=B1105%    +165.4%      34.50 =C2=B1 64%  sched_debug.cfs_rq[=
7]:/.tg_load_avg_contrib
      0.75 =C2=B1110%    +733.3%       6.25 =C2=B1 60%  sched_debug.cpu#0.c=
pu_load[3]
      0.75 =C2=B1110%   +1033.3%       8.50 =C2=B1 45%  sched_debug.cpu#0.c=
pu_load[4]
     34.33 =C2=B1141%    +759.2%     295.00 =C2=B1 42%  sched_debug.cpu#0.c=
urr->pid
      5.75 =C2=B1153%    +791.3%      51.25 =C2=B1 83%  sched_debug.cpu#0.l=
oad
   -821.75 =C2=B1 -3%     -13.2%    -713.25 =C2=B1 -2%  sched_debug.cpu#0.n=
r_uninterruptible
      1.00 =C2=B1100%    +750.0%       8.50 =C2=B1 48%  sched_debug.cpu#1.c=
pu_load[1]
      1.75 =C2=B1 84%    +400.0%       8.75 =C2=B1 48%  sched_debug.cpu#1.c=
pu_load[2]
     30329 =C2=B1 51%     -46.2%      16309 =C2=B1  5%  sched_debug.cpu#2.n=
r_load_updates
      4.00 =C2=B1 98%    +918.8%      40.75 =C2=B1 69%  sched_debug.cpu#6.c=
pu_load[0]
      2.25 =C2=B1 85%   +1400.0%      33.75 =C2=B1 85%  sched_debug.cpu#6.c=
pu_load[1]
      1.75 =C2=B1 84%   +1557.1%      29.00 =C2=B1 90%  sched_debug.cpu#6.c=
pu_load[2]
      1.25 =C2=B1 87%   +1960.0%      25.75 =C2=B1 93%  sched_debug.cpu#6.c=
pu_load[3]
    149.50 =C2=B1 20%     -29.3%     105.75 =C2=B1 15%  sched_debug.cpu#6.n=
r_uninterruptible
     36817 =C2=B1  8%   +4975.8%    1868779 =C2=B1169%  sched_debug.cpu#7.n=
r_switches
     37382 =C2=B1  9%   +4900.3%    1869233 =C2=B1169%  sched_debug.cpu#7.s=
ched_count
     16197 =C2=B1  9%   +5605.7%     924151 =C2=B1169%  sched_debug.cpu#7.s=
ched_goidle
      0.49 =C2=B1  2%   +1020.2%       5.53 =C2=B1103%  sched_debug.rt_rq[0=
]:/.rt_time


nhm4: Nehalem
Memory: 4G


                              fsmark.time.system_time

  100 ++-------------------------------------------------------------------=
-+
      |    O                                                               =
 |
   98 O+ O    O O    O    O    O                                           =
 |
      |            O              O O    O    O  O O                       =
 |
   96 ++                O    O         O    O                              =
 |
      |                                                                    =
 |
   94 ++                                                                   =
 |
      |                                                                    =
 |
   92 ++                                                                   =
 |
      |                          .*.  .*.*..      .*..                     =
 |
   90 ++                    .*.*.   *.      *.*..*    *                    =
 |
      *..*.*..*.  .*.    .*.                           +  .*.*..*.*..*.*..*=
.*
   88 ++        *.   *..*                               *.                 =
 |
      |                                                                    =
 |
   86 ++-------------------------------------------------------------------=
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

--===============1838614826858677368==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogMDI5MzY0NTg1NmVj
NTI3NjM5YjU5MDJmMDIxZmE1YWViYTkzZTMwNQptb2RlbDogTmVoYWxlbQpucl9jcHU6IDgKbWVt
b3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZC
WVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQy
Igpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0w
MTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQzIgpuZXRjb25zb2xlX3BvcnQ6IDY2NDkKY2F0ZWdv
cnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJlYWRzOiAzMnQKZGlzazogMUhERApm
czogYnRyZnMKZnMyOiAKZnNtYXJrOgogIGZpbGVzaXplOiAxNk1CCiAgdGVzdF9zaXplOiA2MEcK
ICBzeW5jX21ldGhvZDogZnN5bmNCZWZvcmVDbG9zZQogIG5yX2RpcmVjdG9yaWVzOiAxNmQKICBu
cl9maWxlc19wZXJfZGlyZWN0b3J5OiAyNTZmcGQKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94OiBuaG00
CnRib3hfZ3JvdXA6IG5obTQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1
LTA5LTI4IDEyOjM4OjAwLjg0OTQ5MzUxMyArMDg6MDAKaWQ6IDRhMzhhNGFlMTkxNWZhMTI2OWE0
YWU4ZDI0ZGRiMWFhMmZjYmRkY2MKdXNlcjogbGtwCmNvbXBpbGVyOiBnY2MtNC45CmhlYWRfY29t
bWl0OiAwMjkzNjQ1ODU2ZWM1Mjc2MzliNTkwMmYwMjFmYTVhZWJhOTNlMzA1CmJhc2VfY29tbWl0
OiA5ZmZlY2IxMDI4MzUwODI2MDkzNmI5NjAyMmQ0ZWU0M2E3Nzk4YjRjCmJyYW5jaDogbGludXgt
bmV4dC9tYXN0ZXIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzAyOTM2
NDU4NTZlYzUyNzYzOWI1OTAyZjAyMWZhNWFlYmE5M2UzMDUvdm1saW51ei00LjMuMC1yYzMtbmV4
dC0yMDE1MDkyOSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9y
b290OiAiL3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtYnRyZnMtMTZNQi02
MEctZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkL25obTQvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzAyOTM2NDU4NTZlYzUyNzYzOWI1OTAyZjAyMWZh
NWFlYmE5M2UzMDUvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9uaG00L2N5Y2xpY19mc21h
cmstcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQtYnRyZnMtMTZNQi02MEctZnN5bmNCZWZvcmVDbG9z
ZS0xNmQtMjU2ZnBkLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELTAyOTM2NDU4NTZlYzUyNzYzOWI1
OTAyZjAyMWZhNWFlYmE5M2UzMDUtMjAxNTA5MjgtMTI2NTkxLXJ5Znc5MS0wLnlhbWwiCmRlcXVl
dWVfdGltZTogMjAxNS0wOS0zMCAwOTo1NToyNS43ODgwMzQ0OTUgKzA4OjAwCm1heF91cHRpbWU6
IDE2NzAuMjgwMDAwMDAwMDAwMgppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1
c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9uaG00L2N5Y2xpY19mc21hcmstcGVyZm9ybWFu
Y2UtMXgtMzJ0LTFIREQtYnRyZnMtMTZNQi02MEctZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBk
LXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELTAyOTM2NDU4NTZlYzUyNzYzOWI1OTAyZjAyMWZhNWFl
YmE5M2UzMDUtMjAxNTA5MjgtMTI2NTkxLXJ5Znc5MS0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtj
b25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtbmV4dC9tYXN0ZXIKLSBjb21taXQ9MDI5
MzY0NTg1NmVjNTI3NjM5YjU5MDJmMDIxZmE1YWViYTkzZTMwNQotIEJPT1RfSU1BR0U9L3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzAyOTM2NDU4NTZlYzUyNzYzOWI1OTAyZjAyMWZhNWFl
YmE5M2UzMDUvdm1saW51ei00LjMuMC1yYzMtbmV4dC0yMDE1MDkyOQotIG1heF91cHRpbWU9MTY3
MAotIFJFU1VMVF9ST09UPS9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0xSERELWJ0
cmZzLTE2TUItNjBHLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9uaG00L2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8wMjkzNjQ1ODU2ZWM1Mjc2Mzli
NTkwMmYwMjFmYTVhZWJhOTNlMzA1LzAKLSBMS1BfU0VSVkVSPWlubgotIHwtCiAgbGliYXRhLmZv
cmNlPTEuNUdicHMKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVs
PWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1
X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlf
d2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0w
CiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtw
X2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wMjkzNjQ1ODU2ZWM1Mjc2MzliNTkwMmYwMjFmYTVh
ZWJhOTNlMzA1L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0
LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMuY2d6LC9v
c2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIuY2d6LC9sa3AvYmVu
Y2htYXJrcy9mc21hcmsuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDI3Ljc5IDI1
Ljc2IDEzLjYwIDEvMTgzIDc0OTMKc3RhcnRfdGltZTogJzE0NDM1NzgxNTEnCmVuZF90aW1lOiAn
MTQ0MzU3ODY2NycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA5MzAtMDk1NTA5Igo=

--===============1838614826858677368==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgpta2ZzIC10IGJ0cmZzIC9kZXYvc2RiMQptb3VudCAtdCBidHJmcyAvZGV2
L3NkYjEgL2ZzL3NkYjEKLi9mc19tYXJrIC1kIC9mcy9zZGIxLzEgLWQgL2ZzL3NkYjEvMiAtZCAv
ZnMvc2RiMS8zIC1kIC9mcy9zZGIxLzQgLWQgL2ZzL3NkYjEvNSAtZCAvZnMvc2RiMS82IC1kIC9m
cy9zZGIxLzcgLWQgL2ZzL3NkYjEvOCAtZCAvZnMvc2RiMS85IC1kIC9mcy9zZGIxLzEwIC1kIC9m
cy9zZGIxLzExIC1kIC9mcy9zZGIxLzEyIC1kIC9mcy9zZGIxLzEzIC1kIC9mcy9zZGIxLzE0IC1k
IC9mcy9zZGIxLzE1IC1kIC9mcy9zZGIxLzE2IC1kIC9mcy9zZGIxLzE3IC1kIC9mcy9zZGIxLzE4
IC1kIC9mcy9zZGIxLzE5IC1kIC9mcy9zZGIxLzIwIC1kIC9mcy9zZGIxLzIxIC1kIC9mcy9zZGIx
LzIyIC1kIC9mcy9zZGIxLzIzIC1kIC9mcy9zZGIxLzI0IC1kIC9mcy9zZGIxLzI1IC1kIC9mcy9z
ZGIxLzI2IC1kIC9mcy9zZGIxLzI3IC1kIC9mcy9zZGIxLzI4IC1kIC9mcy9zZGIxLzI5IC1kIC9m
cy9zZGIxLzMwIC1kIC9mcy9zZGIxLzMxIC1kIC9mcy9zZGIxLzMyIC1EIDE2IC1OIDI1NiAtbiAx
MjAgLUwgMSAtUyAxIC1zIDE2Nzc3MjE2Cg==

--===============1838614826858677368==--

