Content-Type: multipart/mixed; boundary="===============2576638205324962638=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/preempt] fe32d3cd5e: -5.0% fsmark.files_per_sec
Date: Thu, 10 Sep 2015 10:02:15 +0800
Message-ID: <874mj3c9qw.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2576638205324962638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit fe32d3cd5e8eb0f82e459763374aa80797023403 ("sched/preempt: Fix cond_r=
esched_lock() and cond_resched_softirq()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_files_=
per_directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/nfsv4/5K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  c56dadf39761a6157239cac39e3988998c994f98
  fe32d3cd5e8eb0f82e459763374aa80797023403

c56dadf39761a615 fe32d3cd5e8eb0f82e45976337 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  24905032 =C2=B1  2%     -23.3%   19104197 =C2=B1  2%  fsmark.app_overhead
    128.00 =C2=B1  0%      -5.0%     121.60 =C2=B1  0%  fsmark.files_per_sec
    640.73 =C2=B1  0%      +5.6%     676.69 =C2=B1  0%  fsmark.time.elapsed=
_time
    640.73 =C2=B1  0%      +5.6%     676.69 =C2=B1  0%  fsmark.time.elapsed=
_time.max
     88485 =C2=B1  0%     +14.6%     101386 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    374807 =C2=B1  0%      -2.8%     364148 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
     88485 =C2=B1  0%     +14.6%     101386 =C2=B1  0%  time.involuntary_co=
ntext_switches
     18539 =C2=B1  1%     -11.8%      16345 =C2=B1  1%  slabinfo.kmalloc-12=
8.active_objs
     19786 =C2=B1  1%     -10.7%      17675 =C2=B1  1%  slabinfo.kmalloc-12=
8.num_objs
  4.23e+08 =C2=B1  1%     +19.2%  5.042e+08 =C2=B1  3%  cpuidle.C1-NHM.time
  84188847 =C2=B1  1%     +22.9%  1.034e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
     85925 =C2=B1  0%     +21.8%     104644 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
      1.81 =C2=B1  0%      -5.4%       1.71 =C2=B1  0%  turbostat.%Busy
     53.00 =C2=B1  0%      -5.7%      50.00 =C2=B1  0%  turbostat.Avg_MHz
     19.57 =C2=B1  1%     +11.1%      21.73 =C2=B1  2%  turbostat.CPU%c1
      1589 =C2=B1  0%      -5.0%       1510 =C2=B1  0%  vmstat.io.bo
     22835 =C2=B1  0%      -3.8%      21965 =C2=B1  0%  vmstat.system.cs
      7892 =C2=B1  0%      -5.7%       7445 =C2=B1  0%  vmstat.system.in
     75995 =C2=B1  0%     +10.1%      83680 =C2=B1  0%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
    370488 =C2=B1 65%     -48.0%     192671 =C2=B1  8%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastp=
ath
   1353699 =C2=B1  0%      +4.2%    1410361 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
   2451859 =C2=B1  1%      +4.4%    2559496 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
  18995177 =C2=B1  4%     -26.9%   13876200 =C2=B1  1%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_dcache.__lookup_hash
 5.941e+09 =C2=B1  0%      +2.9%  6.116e+09 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv4]._=
_nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].__pu=
t_nfs_open_context.nfs_release.nfs_file_release.__fput.____fput.task_work_r=
un
 6.257e+09 =C2=B1  0%     +10.1%   6.89e+09 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[nfs=
v4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.=
[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.entry=
_SYSCALL_64_fastpath
 4.633e+09 =C2=B1  0%      +6.9%  4.951e+09 =C2=B1  0%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4_f=
ile_fsync.[nfsv4].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fastp=
ath
    429.00 =C2=B1 10%     -10.5%     384.00 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
    430.75 =C2=B1 10%     -10.6%     385.25 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     15.50 =C2=B1  5%     +21.0%      18.75 =C2=B1  4%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
    431.50 =C2=B1 10%     -10.2%     387.50 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
    437.75 =C2=B1 10%     -10.1%     393.75 =C2=B1  7%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
    441.00 =C2=B1  9%     -10.3%     395.75 =C2=B1  6%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
    442.75 =C2=B1  9%     -10.2%     397.75 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
      1888 =C2=B1 41%     -55.4%     843.00 =C2=B1 39%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
    443.50 =C2=B1  9%      -9.3%     402.25 =C2=B1  6%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
      1916 =C2=B1 41%     -54.9%     865.25 =C2=B1 39%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    320180 =C2=B1  0%      +9.7%     351102 =C2=B1  0%  sched_debug.cpu#0.c=
lock
    320180 =C2=B1  0%      +9.7%     351102 =C2=B1  0%  sched_debug.cpu#0.c=
lock_task
     46298 =C2=B1 11%     +20.5%      55770 =C2=B1 16%  sched_debug.cpu#0.n=
r_load_updates
     -3942 =C2=B1 -2%      -7.1%      -3663 =C2=B1 -1%  sched_debug.cpu#0.n=
r_uninterruptible
    320181 =C2=B1  0%      +9.7%     351102 =C2=B1  0%  sched_debug.cpu#1.c=
lock
    320181 =C2=B1  0%      +9.7%     351102 =C2=B1  0%  sched_debug.cpu#1.c=
lock_task
    320181 =C2=B1  0%      +9.7%     351104 =C2=B1  0%  sched_debug.cpu#2.c=
lock
    320181 =C2=B1  0%      +9.7%     351104 =C2=B1  0%  sched_debug.cpu#2.c=
lock_task
    418.25 =C2=B1  7%     +35.0%     564.50 =C2=B1  0%  sched_debug.cpu#2.n=
r_uninterruptible
    320180 =C2=B1  0%      +9.7%     351103 =C2=B1  0%  sched_debug.cpu#3.c=
lock
    320180 =C2=B1  0%      +9.7%     351103 =C2=B1  0%  sched_debug.cpu#3.c=
lock_task
     43361 =C2=B1  0%     +28.5%      55731 =C2=B1 21%  sched_debug.cpu#3.n=
r_load_updates
    503.00 =C2=B1  5%     +16.1%     583.75 =C2=B1  3%  sched_debug.cpu#3.n=
r_uninterruptible
     60027 =C2=B1  0%    +997.9%     659006 =C2=B1155%  sched_debug.cpu#3.t=
twu_local
    320179 =C2=B1  0%      +9.7%     351103 =C2=B1  0%  sched_debug.cpu#4.c=
lock
    320179 =C2=B1  0%      +9.7%     351103 =C2=B1  0%  sched_debug.cpu#4.c=
lock_task
      3.50 =C2=B1 95%    +135.7%       8.25 =C2=B1 51%  sched_debug.cpu#4.c=
pu_load[2]
      1090 =C2=B1  2%     +13.7%       1239 =C2=B1  2%  sched_debug.cpu#4.n=
r_uninterruptible
    320178 =C2=B1  0%      +9.7%     351087 =C2=B1  0%  sched_debug.cpu#5.c=
lock
    320178 =C2=B1  0%      +9.7%     351087 =C2=B1  0%  sched_debug.cpu#5.c=
lock_task
    547.50 =C2=B1  3%     -45.8%     296.75 =C2=B1  4%  sched_debug.cpu#5.n=
r_uninterruptible
    320178 =C2=B1  0%      +9.7%     351105 =C2=B1  0%  sched_debug.cpu#6.c=
lock
    320178 =C2=B1  0%      +9.7%     351105 =C2=B1  0%  sched_debug.cpu#6.c=
lock_task
    542.75 =C2=B1  2%     -46.0%     293.25 =C2=B1 13%  sched_debug.cpu#6.n=
r_uninterruptible
    320182 =C2=B1  0%      +9.7%     351104 =C2=B1  0%  sched_debug.cpu#7.c=
lock
    320182 =C2=B1  0%      +9.7%     351104 =C2=B1  0%  sched_debug.cpu#7.c=
lock_task
    495.75 =C2=B1  3%     -39.0%     302.50 =C2=B1  6%  sched_debug.cpu#7.n=
r_uninterruptible
    320182 =C2=B1  0%      +9.7%     351105 =C2=B1  0%  sched_debug.cpu_clk
    320014 =C2=B1  0%      +9.7%     350935 =C2=B1  0%  sched_debug.ktime
    320182 =C2=B1  0%      +9.7%     351105 =C2=B1  0%  sched_debug.sched_c=
lk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_files_=
per_directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/xfs/nfsv4/8K/400M/fsyncBeforeClose/16d/256fpd

commit: =

  c56dadf39761a6157239cac39e3988998c994f98
  fe32d3cd5e8eb0f82e459763374aa80797023403

c56dadf39761a615 fe32d3cd5e8eb0f82e45976337 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          2:4          -50%            :4     kmsg.Spurious_LAPIC_timer_int=
errupt_on_cpu
         %stddev     %change         %stddev
             \          |                \  =

   5006474 =C2=B1  0%      +8.3%    5423397 =C2=B1  1%  fsmark.app_overhead
     55958 =C2=B1  0%      +8.2%      60571 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    229728 =C2=B1  0%      -1.8%     225635 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
   2156965 =C2=B1  0%     +15.7%    2495398 =C2=B1  0%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync_=
sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4].=
nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.looku=
p_dcache.__lookup_hash
      2481 =C2=B1  2%     +10.1%       2731 =C2=B1  2%  slabinfo.kmalloc-25=
6.num_objs
      5226 =C2=B1  8%      -8.5%       4783 =C2=B1  4%  slabinfo.vm_area_st=
ruct.active_objs
      2584 =C2=B1  6%     -21.8%       2021 =C2=B1  8%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     -1883 =C2=B1-12%     +38.9%      -2614 =C2=B1 -8%  sched_debug.cfs_rq[=
2]:/.spread0
      7666 =C2=B1165%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.load
    229.25 =C2=B1110%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
     -2331 =C2=B1 -9%     +17.2%      -2731 =C2=B1 -6%  sched_debug.cfs_rq[=
4]:/.spread0
    437.25 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
      2091 =C2=B1  7%     +22.3%       2558 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     -2376 =C2=B1 -6%     -12.6%      -2077 =C2=B1 -8%  sched_debug.cfs_rq[=
5]:/.spread0
   1537704 =C2=B1 96%     -93.1%     105402 =C2=B1 33%  sched_debug.cpu#7.n=
r_switches
   1537765 =C2=B1 96%     -93.1%     105462 =C2=B1 33%  sched_debug.cpu#7.s=
ched_count
    756633 =C2=B1 98%     -94.6%      41165 =C2=B1 43%  sched_debug.cpu#7.s=
ched_goidle


nhm4: Nehalem
Memory: 4G




                      fsmark.time.involuntary_context_switches

  65000 ++-----------------------------------------------------------------=
-+
  64000 ++                        O                                        =
 |
        O  O  O  O    O  O  O  O    O  O  O  O  O  O O                     =
 |
  63000 ++         O                                                       =
 |
  62000 ++                                                                 =
 |
        |                                                                  =
 |
  61000 ++                                                 O     O  O O    =
 O
  60000 ++                                              O     O          O =
 |
  59000 ++                                                                 =
 |
        |                                                                  =
 |
  58000 ++                                                                 =
 |
  57000 ++                                                                 =
 |
        *..*..  .*.     .*..                        .*                     =
 |
  56000 ++    *.   *..*.    *..*..*.*..*..*..*..*..*                       =
 |
  55000 ++-----------------------------------------------------------------=
-+


                       fsmark.time.voluntary_context_switches

  231000 ++----------------------------------------------------------------=
-+
         |                    .*..                                         =
 |
  230000 ++   .*.*..*..     .*            .*.*..     .*                    =
 |
         *..*.         *..*.      *..  .*.      *..*.                      =
 |
  229000 ++                          *.                                    =
 |
         |                                                                 =
 |
  228000 ++                                                                =
 |
         |                                                                 =
 |
  227000 ++                                                                =
 |
         O                                                                 =
 |
  226000 ++                                                   O     O      =
 |
         |  O    O     O  O  O O  O  O  O  O            O  O     O       O =
 O
  225000 ++    O    O                        O  O  O  O               O    =
 |
         |                                                                 =
 |
  224000 ++----------------------------------------------------------------=
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

--===============2576638205324962638==
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
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogOWNmY2M2NThkYTk2
OTNmNjVlNzIyNGU4MzI5ZTQwYWRhMmYzYzY5OQptb2RlbDogTmVoYWxlbQpucl9jcHU6IDgKbWVt
b3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZC
WVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQy
Igpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0w
MTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQzIgpuZXRjb25zb2xlX3BvcnQ6IDY2NDkKY2F0ZWdv
cnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJlYWRzOiAzMnQKZGlzazogMUhERApm
czogeGZzCmZzMjogbmZzdjQKZnNtYXJrOgogIGZpbGVzaXplOiA4SwogIHRlc3Rfc2l6ZTogNDAw
TQogIHN5bmNfbWV0aG9kOiBmc3luY0JlZm9yZUNsb3NlCiAgbnJfZGlyZWN0b3JpZXM6IDE2ZAog
IG5yX2ZpbGVzX3Blcl9kaXJlY3Rvcnk6IDI1NmZwZApxdWV1ZTogY3ljbGljCnRlc3Rib3g6IG5o
bTQKdGJveF9ncm91cDogbmhtNAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIw
MTUtMDktMDUgMjI6MDE6MTIuNDE3NDY2ODQ1ICswODowMAppZDogNmNhZmQwNzg2NzViMzM1YTZk
NDdlNmRkYzhkYWViZDAwNTlmMGM4OAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9j
b21taXQ6IDljZmNjNjU4ZGE5NjkzZjY1ZTcyMjRlODMyOWU0MGFkYTJmM2M2OTkKYmFzZV9jb21t
aXQ6IGJmNTllNjYyM2EzYTkyYTJiZjQyOGYyZDY1OTJjODFhYWU2MzE3ZTEKYnJhbmNoOiBsaW51
cy9tYXN0ZXIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzljZmNjNjU4
ZGE5NjkzZjY1ZTcyMjRlODMyOWU0MGFkYTJmM2M2OTkvdm1saW51ei00LjIuMC0wOTYyOC1nOWNm
Y2M2NSIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAi
L3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQteGZzLW5mc3Y0LThLLTQwME0t
ZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkL25obTQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzljZmNjNjU4ZGE5NjkzZjY1ZTcyMjRlODMyOWU0MGFk
YTJmM2M2OTkvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9uaG00L2N5Y2xpY19mc21hcmst
cGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQteGZzLW5mc3Y0LThLLTQwME0tZnN5bmNCZWZvcmVDbG9z
ZS0xNmQtMjU2ZnBkLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELTljZmNjNjU4ZGE5NjkzZjY1ZTcy
MjRlODMyOWU0MGFkYTJmM2M2OTktMjAxNTA5MDUtOTg5NTYtNjF0d3NtLTAueWFtbCIKZGVxdWV1
ZV90aW1lOiAyMDE1LTA5LTA3IDAzOjEzOjU3LjA0OTQ1NTQzNyArMDg6MDAKbWF4X3VwdGltZTog
OTE3LjE2MDAwMDAwMDAwMDEKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNl
cj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbmhtNC9jeWNsaWNfZnNtYXJrLXBlcmZvcm1hbmNl
LTF4LTMydC0xSERELXhmcy1uZnN2NC04Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZw
ZC14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC05Y2ZjYzY1OGRhOTY5M2Y2NWU3MjI0ZTgzMjllNDBh
ZGEyZjNjNjk5LTIwMTUwOTA1LTk4OTU2LTYxdHdzbS0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtj
b25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXMvbWFzdGVyCi0gY29tbWl0PTljZmNjNjU4
ZGE5NjkzZjY1ZTcyMjRlODMyOWU0MGFkYTJmM2M2OTkKLSBCT09UX0lNQUdFPS9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS85Y2ZjYzY1OGRhOTY5M2Y2NWU3MjI0ZTgzMjllNDBhZGEyZjNj
Njk5L3ZtbGludXotNC4yLjAtMDk2MjgtZzljZmNjNjUKLSBtYXhfdXB0aW1lPTkxNwotIFJFU1VM
VF9ST09UPS9yZXN1bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0xSERELXhmcy1uZnN2NC04
Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC9uaG00L2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS85Y2ZjYzY1OGRhOTY5M2Y2NWU3MjI0ZTgz
MjllNDBhZGEyZjNjNjk5LzAKLSBMS1BfU0VSVkVSPWlubgotIHwtCiAgbGliYXRhLmZvcmNlPTEu
NUdicHMKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgog
IGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9z
dGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hk
b2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29u
c29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRy
ZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS85Y2ZjYzY1OGRhOTY5M2Y2NWU3MjI0ZTgzMjllNDBhZGEyZjNj
Njk5L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMuY2d6LC9vc2ltYWdl
L2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIuY2d6LC9sa3AvYmVuY2htYXJr
cy9mc21hcmsuY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDI3LjEyIDExLjEzIDQu
MTQgMS8xODcgMjY5OQpzdGFydF90aW1lOiAnMTQ0MTU2Njg5NicKZW5kX3RpbWU6ICcxNDQxNTY3
MDIzJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDkwNi0yMDU2NTYiCg==

--===============2576638205324962638==
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
bGluZ19nb3Zlcm5vcgpta2ZzIC10IHhmcyAvZGV2L3NkYTEKbW91bnQgLXQgeGZzIC1vIG5vYmFy
cmllcixpbm9kZTY0IC9kZXYvc2RhMSAvZnMvc2RhMQovZXRjL2luaXQuZC9ycGNiaW5kIHN0YXJ0
Ci9ldGMvaW5pdC5kL25mcy1jb21tb24gc3RhcnQKL2V0Yy9pbml0LmQvbmZzLWtlcm5lbC1zZXJ2
ZXIgc3RhcnQKbW91bnQgLXQgbmZzIC1vIHZlcnM9NCBsb2NhbGhvc3Q6L2ZzL3NkYTEgL25mcy9z
ZGExCi4vZnNfbWFyayAtZCAvbmZzL3NkYTEvMSAtZCAvbmZzL3NkYTEvMiAtZCAvbmZzL3NkYTEv
MyAtZCAvbmZzL3NkYTEvNCAtZCAvbmZzL3NkYTEvNSAtZCAvbmZzL3NkYTEvNiAtZCAvbmZzL3Nk
YTEvNyAtZCAvbmZzL3NkYTEvOCAtZCAvbmZzL3NkYTEvOSAtZCAvbmZzL3NkYTEvMTAgLWQgL25m
cy9zZGExLzExIC1kIC9uZnMvc2RhMS8xMiAtZCAvbmZzL3NkYTEvMTMgLWQgL25mcy9zZGExLzE0
IC1kIC9uZnMvc2RhMS8xNSAtZCAvbmZzL3NkYTEvMTYgLWQgL25mcy9zZGExLzE3IC1kIC9uZnMv
c2RhMS8xOCAtZCAvbmZzL3NkYTEvMTkgLWQgL25mcy9zZGExLzIwIC1kIC9uZnMvc2RhMS8yMSAt
ZCAvbmZzL3NkYTEvMjIgLWQgL25mcy9zZGExLzIzIC1kIC9uZnMvc2RhMS8yNCAtZCAvbmZzL3Nk
YTEvMjUgLWQgL25mcy9zZGExLzI2IC1kIC9uZnMvc2RhMS8yNyAtZCAvbmZzL3NkYTEvMjggLWQg
L25mcy9zZGExLzI5IC1kIC9uZnMvc2RhMS8zMCAtZCAvbmZzL3NkYTEvMzEgLWQgL25mcy9zZGEx
LzMyIC1EIDE2IC1OIDI1NiAtbiAxNjAwIC1MIDEgLVMgMSAtcyA4MTkyCg==

--===============2576638205324962638==--

