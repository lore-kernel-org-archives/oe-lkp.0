Content-Type: multipart/mixed; boundary="===============0936104062613100930=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [perf/core] 17fcdff68f: +86.7% aim9.brk_test.ops_per_sec
Date: Mon, 22 Feb 2016 16:55:46 +0800
Message-ID: <87wppx15v1.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0936104062613100930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Kan,

We finally enabled the Intel internal tree testing and reporting
support.  This is the first performance report for Intel internal git
trees.

The report is for performance increase so is a good news in general.
But a dmesg.xz on i386 platform with kernel bug about perf is found
too.  The dmesg is attached with the email.  That may be not related to
your patch, please take a look.

FYI, we noticed the below changes on

ssh://lab_lkp(a)git-amr-3.devtools.intel.com:29418/kan_lkp-lkp lkp
commit 17fcdff68f9a69f8beb7600c0803c12efed503f1 ("perf/core: find auxiliary=
 events in running pmus list")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-hsx04/al=
l/aim9/5s

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2050637 =C2=B1  4%     +86.7%    3828182 =C2=B1  0%  aim9.brk_test.ops_p=
er_sec
   2265615 =C2=B1  2%      +2.7%    2327160 =C2=B1  0%  aim9.fifo_test.ops_=
per_sec
    602225 =C2=B1  0%     +14.4%     689002 =C2=B1  0%  aim9.page_test.ops_=
per_sec
    352111 =C2=B1  0%      +1.0%     355662 =C2=B1  0%  aim9.tcp_test.ops_p=
er_sec
   7599375 =C2=B1  0%      +5.3%    8005468 =C2=B1  0%  aim9.time.minor_pag=
e_faults
      6303 =C2=B1  3%     -27.1%       4596 =C2=B1  6%  cpuidle.C1-HSW.usage
      6366 =C2=B1  1%     +23.5%       7863 =C2=B1  9%  meminfo.AnonHugePag=
es
    147.86 =C2=B1  0%      -1.7%     145.34 =C2=B1  1%  turbostat.RAMWatt
      6213 =C2=B1 89%     -87.8%     760.67 =C2=B1126%  latency_stats.max.l=
oad_module.SYSC_finit_module.SyS_finit_module.entry_SYSCALL_64_fastpath
      6798 =C2=B1 83%     -80.0%       1356 =C2=B1132%  latency_stats.sum.l=
oad_module.SYSC_finit_module.SyS_finit_module.entry_SYSCALL_64_fastpath
      1.52 =C2=B1  1%     +10.7%       1.68 =C2=B1  2%  perf-profile.cycles=
-pp.rw_verify_area.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      1.22 =C2=B1  2%     +15.7%       1.42 =C2=B1  4%  perf-profile.cycles=
-pp.security_file_permission.rw_verify_area.vfs_read.sys_read.entry_SYSCALL=
_64_fastpath
    142.10 =C2=B1 28%     -40.1%      85.13 =C2=B1 49%  sched_debug.cfs_rq:=
/.exec_clock.103
    106.04 =C2=B1 16%     +61.9%     171.66 =C2=B1  4%  sched_debug.cfs_rq:=
/.exec_clock.12
    100.69 =C2=B1 45%     +71.0%     172.14 =C2=B1 33%  sched_debug.cfs_rq:=
/.exec_clock.125
     63.68 =C2=B1 28%     +62.1%     103.24 =C2=B1 17%  sched_debug.cfs_rq:=
/.exec_clock.131
     71.39 =C2=B1 10%     +52.4%     108.80 =C2=B1 23%  sched_debug.cfs_rq:=
/.exec_clock.133
     58.02 =C2=B1 16%    +125.1%     130.62 =C2=B1 25%  sched_debug.cfs_rq:=
/.exec_clock.134
    323.84 =C2=B1 64%   +9241.1%      30250 =C2=B1146%  sched_debug.cfs_rq:=
/.exec_clock.36
    120.15 =C2=B1 26%   +5403.8%       6613 =C2=B1168%  sched_debug.cfs_rq:=
/.exec_clock.45
    106.21 =C2=B1 33%    +130.2%     244.51 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.46
     76.77 =C2=B1 26%     +92.5%     147.81 =C2=B1 45%  sched_debug.cfs_rq:=
/.exec_clock.66
    150.36 =C2=B1 21%     -41.4%      88.12 =C2=B1 46%  sched_debug.cfs_rq:=
/.exec_clock.90
      6864 =C2=B1 74%    +190.7%      19957 =C2=B1 32%  sched_debug.cfs_rq:=
/.min_vruntime.101
     27696 =C2=B1 57%     -52.3%      13224 =C2=B1 28%  sched_debug.cfs_rq:=
/.min_vruntime.27
     15116 =C2=B1 34%   +1818.6%     290027 =C2=B1135%  sched_debug.cfs_rq:=
/.min_vruntime.36
     27852 =C2=B1 46%     -45.1%      15291 =C2=B1 29%  sched_debug.cfs_rq:=
/.min_vruntime.37
     18947 =C2=B1 11%     -49.4%       9587 =C2=B1 15%  sched_debug.cfs_rq:=
/.min_vruntime.75
     25747 =C2=B1 47%     -82.6%       4484 =C2=B1 45%  sched_debug.cfs_rq:=
/.min_vruntime.92
      9540 =C2=B1 54%     +73.8%      16579 =C2=B1 42%  sched_debug.cfs_rq:=
/.min_vruntime.93
      3094 =C2=B1 72%     -53.5%       1438 =C2=B1 36%  sched_debug.cfs_rq:=
/.min_vruntime.min
     14.50 =C2=B1 51%    +327.6%      62.00 =C2=B1 30%  sched_debug.cfs_rq:=
/.util_avg.103
     77.25 =C2=B1 59%     -97.4%       2.00 =C2=B1 61%  sched_debug.cfs_rq:=
/.util_avg.105
     57.50 =C2=B1 70%     -77.0%      13.25 =C2=B1138%  sched_debug.cfs_rq:=
/.util_avg.19
     83.25 =C2=B1 65%     -92.8%       6.00 =C2=B1 13%  sched_debug.cfs_rq:=
/.util_avg.49
     16.25 =C2=B1101%     -84.6%       2.50 =C2=B1150%  sched_debug.cfs_rq:=
/.util_avg.74
     11286 =C2=B1 15%     -35.9%       7239 =C2=B1 18%  sched_debug.cpu.nr_=
load_updates.19
      7926 =C2=B1 16%     -14.3%       6792 =C2=B1 18%  sched_debug.cpu.nr_=
load_updates.22
      9021 =C2=B1 13%     -23.0%       6946 =C2=B1 24%  sched_debug.cpu.nr_=
load_updates.26
      9132 =C2=B1  6%     -23.6%       6980 =C2=B1 17%  sched_debug.cpu.nr_=
load_updates.33
      9410 =C2=B1  5%     -31.3%       6464 =C2=B1 19%  sched_debug.cpu.nr_=
load_updates.70
      7319 =C2=B1 21%     -29.3%       5174 =C2=B1 25%  sched_debug.cpu.nr_=
load_updates.92
    824.25 =C2=B1 13%    +108.9%       1721 =C2=B1 25%  sched_debug.cpu.nr_=
switches.132
    978.25 =C2=B1 15%     +57.0%       1536 =C2=B1 19%  sched_debug.cpu.nr_=
switches.134
      4783 =C2=B1 23%     +95.4%       9347 =C2=B1 10%  sched_debug.cpu.nr_=
switches.3
      7000 =C2=B1 36%     -49.2%       3554 =C2=B1 34%  sched_debug.cpu.nr_=
switches.49
      3736 =C2=B1  4%    +146.1%       9196 =C2=B1 40%  sched_debug.cpu.nr_=
switches.51
      4614 =C2=B1 39%     +65.5%       7634 =C2=B1 27%  sched_debug.cpu.nr_=
switches.6
      3774 =C2=B1 20%     +40.8%       5314 =C2=B1 12%  sched_debug.cpu.nr_=
switches.62
     -1.50 =C2=B1-74%    +350.0%      -6.75 =C2=B1-42%  sched_debug.cpu.nr_=
uninterruptible.25
      0.00 =C2=B1  2%      -Inf%      -5.50 =C2=B1-45%  sched_debug.cpu.nr_=
uninterruptible.31
     -1.00 =C2=B1-100%    +725.0%      -8.25 =C2=B1-48%  sched_debug.cpu.nr=
_uninterruptible.33
     -3.50 =C2=B1-58%    -114.3%       0.50 =C2=B1300%  sched_debug.cpu.nr_=
uninterruptible.49
      0.75 =C2=B1145%    -800.0%      -5.25 =C2=B1-38%  sched_debug.cpu.nr_=
uninterruptible.54
     -1.25 =C2=B1-163%    -340.0%       3.00 =C2=B1 97%  sched_debug.cpu.nr=
_uninterruptible.55
     -1.00 =C2=B1-339%    -650.0%       5.50 =C2=B1174%  sched_debug.cpu.nr=
_uninterruptible.57
      1.00 =C2=B1 81%    -400.0%      -3.00 =C2=B1-40%  sched_debug.cpu.nr_=
uninterruptible.59
      1.00 =C2=B1-100%    +175.0%       2.75 =C2=B1 53%  sched_debug.cpu.nr=
_uninterruptible.77
      1.75 =C2=B1 62%    -157.1%      -1.00 =C2=B1-70%  sched_debug.cpu.nr_=
uninterruptible.97
      6.37 =C2=B1  7%    +249.7%      22.29 =C2=B1 80%  sched_debug.cpu.nr_=
uninterruptible.max
    639.75 =C2=B1 19%    +140.6%       1539 =C2=B1 28%  sched_debug.cpu.sch=
ed_count.132
    722.25 =C2=B1 18%     +80.8%       1305 =C2=B1 22%  sched_debug.cpu.sch=
ed_count.134
    752.00 =C2=B1 31%     +76.0%       1323 =C2=B1 25%  sched_debug.cpu.sch=
ed_count.135
    700.00 =C2=B1 16%     +61.2%       1128 =C2=B1 31%  sched_debug.cpu.sch=
ed_count.136
      3216 =C2=B1 50%    +153.8%       8164 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.3
      6091 =C2=B1 48%     -49.3%       3089 =C2=B1 41%  sched_debug.cpu.sch=
ed_count.49
      3188 =C2=B1 22%     +50.7%       4805 =C2=B1 18%  sched_debug.cpu.sch=
ed_count.62
    302.50 =C2=B1 19%     +65.3%     500.00 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.127
    264.00 =C2=B1 16%    +142.0%     639.00 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.132
    302.25 =C2=B1 15%     +82.4%     551.25 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.134
    322.00 =C2=B1 31%     +69.2%     544.75 =C2=B1 30%  sched_debug.cpu.sch=
ed_goidle.135
    287.75 =C2=B1 10%     +65.1%     475.00 =C2=B1 35%  sched_debug.cpu.sch=
ed_goidle.136
    303.75 =C2=B1 14%     +87.2%     568.75 =C2=B1 58%  sched_debug.cpu.sch=
ed_goidle.138
    304.25 =C2=B1  9%     +60.0%     486.75 =C2=B1 38%  sched_debug.cpu.sch=
ed_goidle.142
      3094 =C2=B1 47%     -51.2%       1510 =C2=B1 22%  sched_debug.cpu.sch=
ed_goidle.24
      1557 =C2=B1 50%    +159.6%       4044 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.3
      2955 =C2=B1 50%     -48.9%       1511 =C2=B1 39%  sched_debug.cpu.sch=
ed_goidle.49
      1545 =C2=B1 23%     +50.5%       2325 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.62
      1959 =C2=B1 42%     +87.8%       3679 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.1
      1611 =C2=B1 75%     -74.6%     409.00 =C2=B1 67%  sched_debug.cpu.ttw=
u_count.114
    641.25 =C2=B1 98%    +185.1%       1828 =C2=B1 69%  sched_debug.cpu.ttw=
u_count.128
    404.25 =C2=B1 59%    +309.3%       1654 =C2=B1 79%  sched_debug.cpu.ttw=
u_count.130
    296.00 =C2=B1 28%    +253.5%       1046 =C2=B1 62%  sched_debug.cpu.ttw=
u_count.131
    358.00 =C2=B1 30%    +211.7%       1116 =C2=B1 54%  sched_debug.cpu.ttw=
u_count.133
    286.75 =C2=B1 22%    +278.2%       1084 =C2=B1 82%  sched_debug.cpu.ttw=
u_count.134
    301.00 =C2=B1 31%    +423.8%       1576 =C2=B1 78%  sched_debug.cpu.ttw=
u_count.137
      2422 =C2=B1 25%     -50.0%       1212 =C2=B1 36%  sched_debug.cpu.ttw=
u_count.24
      1238 =C2=B1 75%    +135.6%       2917 =C2=B1 62%  sched_debug.cpu.ttw=
u_count.3
      1091 =C2=B1 15%     +98.3%       2163 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.61
    145.25 =C2=B1 35%    +102.2%     293.75 =C2=B1 42%  sched_debug.cpu.ttw=
u_local.132
    142.75 =C2=B1 34%     +83.4%     261.75 =C2=B1 20%  sched_debug.cpu.ttw=
u_local.135
      1029 =C2=B1 42%     -71.4%     294.00 =C2=B1 18%  sched_debug.cpu.ttw=
u_local.20
      1082 =C2=B1 94%     -83.9%     174.25 =C2=B1 20%  sched_debug.cpu.ttw=
u_local.37
    775.25 =C2=B1107%     -76.7%     181.00 =C2=B1 26%  sched_debug.cpu.ttw=
u_local.39
    440.50 =C2=B1 40%     -49.9%     220.75 =C2=B1 54%  sched_debug.cpu.ttw=
u_local.42
    278.25 =C2=B1 38%    +198.8%     831.50 =C2=B1 55%  sched_debug.cpu.ttw=
u_local.47
    249.00 =C2=B1 16%     -39.1%     151.75 =C2=B1 22%  sched_debug.cpu.ttw=
u_local.52

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb43/all/ai=
m9/5s

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2481150 =C2=B1  0%     +52.0%    3770425 =C2=B1  0%  aim9.brk_test.ops_p=
er_sec
    774700 =C2=B1  0%      -5.2%     734250 =C2=B1  0%  aim9.creat-clo.ops_=
per_sec
   1252315 =C2=B1  0%      +2.7%    1285975 =C2=B1  0%  aim9.dgram_pipe.ops=
_per_sec
   1399630 =C2=B1  1%      -2.8%    1360896 =C2=B1  0%  aim9.disk_cp.ops_pe=
r_sec
   2136576 =C2=B1  0%      -2.3%    2087936 =C2=B1  0%  aim9.disk_wrt.ops_p=
er_sec
    642005 =C2=B1  0%      +7.2%     688330 =C2=B1  1%  aim9.page_test.ops_=
per_sec
    362.65 =C2=B1  0%      +1.5%     367.95 =C2=B1  0%  aim9.shell_rtns_2.o=
ps_per_sec
    363.67 =C2=B1  0%      +2.1%     371.20 =C2=B1  0%  aim9.shell_rtns_3.o=
ps_per_sec
    193.02 =C2=B1  0%      -2.4%     188.43 =C2=B1  0%  aim9.sieve.ops_per_=
sec
   1441050 =C2=B1  0%      -2.6%    1403875 =C2=B1  0%  aim9.stream_pipe.op=
s_per_sec
   2092365 =C2=B1  0%      -2.3%    2044800 =C2=B1  0%  aim9.sync_disk_wrt.=
ops_per_sec
    527720 =C2=B1  1%      -6.3%     494415 =C2=B1  3%  aim9.udp_test.ops_p=
er_sec
    948.00 =C2=B1 17%     -31.3%     651.50 =C2=B1  9%  proc-vmstat.numa_pt=
e_updates
     51688 =C2=B1  5%     +16.6%      60292 =C2=B1  7%  softirqs.RCU
      3.56 =C2=B1  1%      -3.0%       3.45 =C2=B1  1%  turbostat.RAMWatt
  40801038 =C2=B1 15%     +67.1%   68183060 =C2=B1 22%  cpuidle.C1E-IVT.time
     30446 =C2=B1  8%     -23.6%      23262 =C2=B1 21%  cpuidle.C1E-IVT.usa=
ge
     12724 =C2=B1  6%     -10.0%      11455 =C2=B1  6%  slabinfo.radix_tree=
_node.active_objs
     12813 =C2=B1  6%      -9.4%      11613 =C2=B1  7%  slabinfo.radix_tree=
_node.num_objs
      1.65 =C2=B1  4%     -10.3%       1.48 =C2=B1  1%  perf-profile.cycles=
-pp.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_write_begin.gene=
ric_perform_write
      0.98 =C2=B1  3%      -9.9%       0.89 =C2=B1  6%  perf-profile.cycles=
-pp.free_hot_cold_page.free_hot_cold_page_list.release_pages.__pagevec_rele=
ase.shmem_undo_range
      1.95 =C2=B1  2%      -7.4%       1.81 =C2=B1  3%  perf-profile.cycles=
-pp.truncate_inode_page.shmem_undo_range.shmem_truncate_range.shmem_evict_i=
node.evict
    916.81 =C2=B1 46%     -68.6%     288.12 =C2=B1 50%  sched_debug.cfs_rq:=
/.exec_clock.11
    247.41 =C2=B1 44%    +178.3%     688.51 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.13
    470.48 =C2=B1 14%    +185.8%       1344 =C2=B1 75%  sched_debug.cfs_rq:=
/.exec_clock.14
    397.15 =C2=B1 43%   +8238.1%      33115 =C2=B1158%  sched_debug.cfs_rq:=
/.exec_clock.16
    314.47 =C2=B1 51%    +115.7%     678.41 =C2=B1 13%  sched_debug.cfs_rq:=
/.exec_clock.17
    307.91 =C2=B1 41%    +377.4%       1469 =C2=B1 97%  sched_debug.cfs_rq:=
/.exec_clock.21
    338.97 =C2=B1 54%     +87.9%     636.85 =C2=B1 25%  sched_debug.cfs_rq:=
/.exec_clock.22
    288.60 =C2=B1 44%    +122.3%     641.55 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.23
    744.66 =C2=B1 21%     -61.2%     288.72 =C2=B1 44%  sched_debug.cfs_rq:=
/.exec_clock.3
    174.12 =C2=B1 54%    +104.6%     356.25 =C2=B1 44%  sched_debug.cfs_rq:=
/.exec_clock.36
    168.93 =C2=B1 43%     +74.8%     295.31 =C2=B1 25%  sched_debug.cfs_rq:=
/.exec_clock.37
    176.70 =C2=B1 51%    +113.7%     377.57 =C2=B1 35%  sched_debug.cfs_rq:=
/.exec_clock.46
    188.10 =C2=B1 44%     +94.9%     366.58 =C2=B1 42%  sched_debug.cfs_rq:=
/.exec_clock.47
    567.29 =C2=B1 16%     -57.5%     241.00 =C2=B1 33%  sched_debug.cfs_rq:=
/.exec_clock.8
     13087 =C2=B1151%     -97.4%     336.14 =C2=B1 72%  sched_debug.cfs_rq:=
/.exec_clock.9
     75.75 =C2=B1 95%     -38.0%      47.00 =C2=B1 -2%  sched_debug.cfs_rq:=
/.load.14
     22709 =C2=B1 60%     -61.4%       8765 =C2=B1 21%  sched_debug.cfs_rq:=
/.min_vruntime.11
     13014 =C2=B1 30%     +35.2%      17599 =C2=B1 19%  sched_debug.cfs_rq:=
/.min_vruntime.14
     10710 =C2=B1 45%    +984.7%     116183 =C2=B1133%  sched_debug.cfs_rq:=
/.min_vruntime.16
      9906 =C2=B1 33%     +51.5%      15007 =C2=B1 11%  sched_debug.cfs_rq:=
/.min_vruntime.22
    101031 =C2=B1136%     -92.0%       8119 =C2=B1 35%  sched_debug.cfs_rq:=
/.min_vruntime.9
      2535 =C2=B1 30%     +50.8%       3823 =C2=B1 28%  sched_debug.cfs_rq:=
/.min_vruntime.min
      3.25 =C2=B1 39%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq:=
/.runnable_load_avg.11
     18.25 =C2=B1103%    +543.8%     117.50 =C2=B1124%  sched_debug.cfs_rq:=
/.util_avg.1
    132.50 =C2=B1 23%     -84.2%      21.00 =C2=B1 81%  sched_debug.cfs_rq:=
/.util_avg.11
     14.00 =C2=B1 86%     -85.7%       2.00 =C2=B1117%  sched_debug.cfs_rq:=
/.util_avg.27
     39.50 =C2=B1 46%     -87.3%       5.00 =C2=B1110%  sched_debug.cfs_rq:=
/.util_avg.32
     15.00 =C2=B1107%    +175.0%      41.25 =C2=B1 41%  sched_debug.cfs_rq:=
/.util_avg.45
     68.50 =C2=B1105%     -86.5%       9.25 =C2=B1111%  sched_debug.cfs_rq:=
/.util_avg.9
    862727 =C2=B1 11%     +15.3%     994974 =C2=B1  0%  sched_debug.cpu.avg=
_idle.9
      3.25 =C2=B1 39%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[0].11
      3.25 =C2=B1 39%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu.cpu=
_load[1].11
      5367 =C2=B1156%     -95.7%     232.00 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.14
     39907 =C2=B1  5%     -32.6%      26909 =C2=B1 19%  sched_debug.cpu.cur=
r->pid.max
      5971 =C2=B1  4%     -30.0%       4180 =C2=B1 22%  sched_debug.cpu.cur=
r->pid.stddev
     75.75 =C2=B1 95%     -38.0%      47.00 =C2=B1 -2%  sched_debug.cpu.loa=
d.14
      5398 =C2=B1 20%     +75.1%       9452 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.13
      5524 =C2=B1 24%     +69.4%       9361 =C2=B1 14%  sched_debug.cpu.nr_=
load_updates.14
      4971 =C2=B1 25%    +722.6%      40893 =C2=B1127%  sched_debug.cpu.nr_=
load_updates.16
      4843 =C2=B1 23%     +91.7%       9284 =C2=B1  8%  sched_debug.cpu.nr_=
load_updates.17
      4797 =C2=B1 29%     +52.1%       7296 =C2=B1  6%  sched_debug.cpu.nr_=
load_updates.19
      5189 =C2=B1 18%     +86.4%       9673 =C2=B1 33%  sched_debug.cpu.nr_=
load_updates.21
      5483 =C2=B1 20%     +40.6%       7712 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.22
      8986 =C2=B1 17%     -30.8%       6218 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.3
      3513 =C2=B1  9%     +31.9%       4634 =C2=B1 33%  sched_debug.cpu.nr_=
load_updates.35
      3498 =C2=B1 18%     +34.8%       4714 =C2=B1 16%  sched_debug.cpu.nr_=
load_updates.39
      3579 =C2=B1 16%     +29.6%       4638 =C2=B1 15%  sched_debug.cpu.nr_=
load_updates.41
      3194 =C2=B1 24%     +41.5%       4518 =C2=B1 19%  sched_debug.cpu.nr_=
load_updates.45
      3280 =C2=B1 20%     +31.6%       4317 =C2=B1 18%  sched_debug.cpu.nr_=
load_updates.47
     20835 =C2=B1 98%     -68.9%       6475 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.9
      2724 =C2=B1 11%     +42.9%       3893 =C2=B1 24%  sched_debug.cpu.nr_=
load_updates.min
     21756 =C2=B1 28%     -45.2%      11913 =C2=B1 12%  sched_debug.cpu.nr_=
switches.0
     14276 =C2=B1  7%     -30.1%       9984 =C2=B1 24%  sched_debug.cpu.nr_=
switches.1
      7747 =C2=B1 44%    +196.7%      22985 =C2=B1 27%  sched_debug.cpu.nr_=
switches.13
      8340 =C2=B1 49%    +168.1%      22363 =C2=B1 17%  sched_debug.cpu.nr_=
switches.14
      7977 =C2=B1 47%    +111.5%      16876 =C2=B1 10%  sched_debug.cpu.nr_=
switches.15
      6997 =C2=B1 57%    +197.9%      20848 =C2=B1 23%  sched_debug.cpu.nr_=
switches.16
      6659 =C2=B1 52%    +223.0%      21508 =C2=B1 20%  sched_debug.cpu.nr_=
switches.17
      6641 =C2=B1 51%    +304.1%      26837 =C2=B1 30%  sched_debug.cpu.nr_=
switches.18
      8203 =C2=B1 53%    +101.4%      16522 =C2=B1 17%  sched_debug.cpu.nr_=
switches.20
     20877 =C2=B1 40%     -64.1%       7489 =C2=B1 48%  sched_debug.cpu.nr_=
switches.3
     21043 =C2=B1 41%     -62.7%       7843 =C2=B1 25%  sched_debug.cpu.nr_=
switches.4
     22706 =C2=B1 38%     -66.3%       7658 =C2=B1 35%  sched_debug.cpu.nr_=
switches.5
     19736 =C2=B1 13%     -71.8%       5561 =C2=B1 34%  sched_debug.cpu.nr_=
switches.8
     30402 =C2=B1 62%     -74.0%       7902 =C2=B1 44%  sched_debug.cpu.nr_=
switches.9
     -5.25 =C2=B1-20%    -142.9%       2.25 =C2=B1 65%  sched_debug.cpu.nr_=
uninterruptible.15
      1.25 =C2=B1153%    -540.0%      -5.50 =C2=B1-15%  sched_debug.cpu.nr_=
uninterruptible.2
     -3.25 =C2=B1-111%    -184.6%       2.75 =C2=B1 86%  sched_debug.cpu.nr=
_uninterruptible.23
      0.75 =C2=B1404%     -33.3%       0.50 =C2=B1100%  sched_debug.cpu.nr_=
uninterruptible.25
      1.00 =C2=B1122%    -400.0%      -3.00 =C2=B1 33%  sched_debug.cpu.nr_=
uninterruptible.35
      1.50 =C2=B1100%    +116.7%       3.25 =C2=B1 76%  sched_debug.cpu.nr_=
uninterruptible.44
      1.00 =C2=B1 70%    +250.0%       3.50 =C2=B1 47%  sched_debug.cpu.nr_=
uninterruptible.46
     -0.25 =C2=B1-655%   +1500.0%      -4.00 =C2=B1-35%  sched_debug.cpu.nr=
_uninterruptible.8
     32037 =C2=B1 52%     -73.5%       8479 =C2=B1 54%  sched_debug.cpu.sch=
ed_count.11
      6307 =C2=B1 54%    +226.7%      20606 =C2=B1 36%  sched_debug.cpu.sch=
ed_count.13
      7007 =C2=B1 54%    +118.1%      15280 =C2=B1 10%  sched_debug.cpu.sch=
ed_count.15
      5794 =C2=B1 58%    +240.8%      19750 =C2=B1 24%  sched_debug.cpu.sch=
ed_count.16
      5758 =C2=B1 60%    +249.0%      20095 =C2=B1 26%  sched_debug.cpu.sch=
ed_count.17
      5758 =C2=B1 62%    +334.9%      25046 =C2=B1 33%  sched_debug.cpu.sch=
ed_count.18
      8738 =C2=B1 59%    +271.1%      32427 =C2=B1 72%  sched_debug.cpu.sch=
ed_count.21
      6669 =C2=B1 56%    +111.1%      14075 =C2=B1 14%  sched_debug.cpu.sch=
ed_count.23
     22514 =C2=B1 20%     -71.3%       6456 =C2=B1 55%  sched_debug.cpu.sch=
ed_count.3
     19812 =C2=B1 45%     -68.7%       6200 =C2=B1 38%  sched_debug.cpu.sch=
ed_count.4
     18619 =C2=B1 13%     -74.8%       4699 =C2=B1 40%  sched_debug.cpu.sch=
ed_count.8
     39206 =C2=B1 87%     -82.1%       7009 =C2=B1 47%  sched_debug.cpu.sch=
ed_count.9
      8214 =C2=B1 39%     -59.8%       3299 =C2=B1 35%  sched_debug.cpu.sch=
ed_goidle.0
     15857 =C2=B1 52%     -75.1%       3943 =C2=B1 59%  sched_debug.cpu.sch=
ed_goidle.11
      2895 =C2=B1 57%    +250.9%      10160 =C2=B1 35%  sched_debug.cpu.sch=
ed_goidle.13
      3504 =C2=B1 55%    +186.1%      10026 =C2=B1 16%  sched_debug.cpu.sch=
ed_goidle.14
      3312 =C2=B1 57%    +126.8%       7512 =C2=B1 11%  sched_debug.cpu.sch=
ed_goidle.15
      2695 =C2=B1 62%    +261.1%       9733 =C2=B1 24%  sched_debug.cpu.sch=
ed_goidle.16
      2716 =C2=B1 62%    +265.6%       9932 =C2=B1 27%  sched_debug.cpu.sch=
ed_goidle.17
      2726 =C2=B1 64%    +354.9%      12400 =C2=B1 33%  sched_debug.cpu.sch=
ed_goidle.18
      3348 =C2=B1 66%    +131.9%       7763 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.20
      3182 =C2=B1 56%    +117.7%       6928 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.23
      9258 =C2=B1 44%     -67.2%       3039 =C2=B1 59%  sched_debug.cpu.sch=
ed_goidle.3
      9756 =C2=B1 45%     -70.0%       2925 =C2=B1 40%  sched_debug.cpu.sch=
ed_goidle.4
     10530 =C2=B1 40%     -70.2%       3135 =C2=B1 40%  sched_debug.cpu.sch=
ed_goidle.5
      9089 =C2=B1 12%     -75.9%       2188 =C2=B1 41%  sched_debug.cpu.sch=
ed_goidle.8
     14612 =C2=B1 65%     -77.3%       3324 =C2=B1 48%  sched_debug.cpu.sch=
ed_goidle.9
      5540 =C2=B1 30%     -58.9%       2275 =C2=B1 39%  sched_debug.cpu.ttw=
u_count.10
      2323 =C2=B1 52%    +237.2%       7832 =C2=B1 17%  sched_debug.cpu.ttw=
u_count.15
      2063 =C2=B1 51%    +234.4%       6900 =C2=B1 30%  sched_debug.cpu.ttw=
u_count.16
      2166 =C2=B1 64%    +170.7%       5865 =C2=B1 27%  sched_debug.cpu.ttw=
u_count.17
      5773 =C2=B1 22%     -47.6%       3023 =C2=B1 30%  sched_debug.cpu.ttw=
u_count.2
      3042 =C2=B1 31%    +118.6%       6651 =C2=B1 55%  sched_debug.cpu.ttw=
u_count.20
      2207 =C2=B1 51%    +190.0%       6401 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.21
      2033 =C2=B1 70%    +166.4%       5416 =C2=B1 24%  sched_debug.cpu.ttw=
u_count.23
      7394 =C2=B1 46%     -73.7%       1946 =C2=B1 28%  sched_debug.cpu.ttw=
u_count.3
      2153 =C2=B1 39%     -49.2%       1094 =C2=B1 74%  sched_debug.cpu.ttw=
u_count.34
      4624 =C2=B1 27%     -52.8%       2184 =C2=B1 27%  sched_debug.cpu.ttw=
u_count.5
      5181 =C2=B1 21%     -52.5%       2463 =C2=B1 62%  sched_debug.cpu.ttw=
u_count.7
      5479 =C2=B1 24%     -69.3%       1683 =C2=B1 27%  sched_debug.cpu.ttw=
u_count.8
      1486 =C2=B1 17%     -23.8%       1132 =C2=B1 12%  sched_debug.cpu.ttw=
u_local.1
      2345 =C2=B1 39%     -54.4%       1068 =C2=B1 47%  sched_debug.cpu.ttw=
u_local.10
    549.50 =C2=B1 41%    +205.5%       1678 =C2=B1 60%  sched_debug.cpu.ttw=
u_local.13
    552.50 =C2=B1 31%    +221.7%       1777 =C2=B1 49%  sched_debug.cpu.ttw=
u_local.16
    454.00 =C2=B1 57%    +314.3%       1881 =C2=B1 48%  sched_debug.cpu.ttw=
u_local.18
    617.00 =C2=B1 38%     +73.7%       1071 =C2=B1 26%  sched_debug.cpu.ttw=
u_local.19
      1650 =C2=B1 39%     -45.1%     905.50 =C2=B1 36%  sched_debug.cpu.ttw=
u_local.2
    482.50 =C2=B1 46%    +231.3%       1598 =C2=B1 32%  sched_debug.cpu.ttw=
u_local.23
    400.00 =C2=B1 11%     +35.1%     540.50 =C2=B1 27%  sched_debug.cpu.ttw=
u_local.25
      2585 =C2=B1 57%     -76.7%     602.25 =C2=B1  6%  sched_debug.cpu.ttw=
u_local.3
      1629 =C2=B1  7%     -38.0%       1010 =C2=B1 40%  sched_debug.cpu.ttw=
u_local.5
      1789 =C2=B1 39%     -62.2%     677.00 =C2=B1 40%  sched_debug.cpu.ttw=
u_local.8
      2223 =C2=B1 24%     -48.4%       1146 =C2=B1 52%  sched_debug.cpu.ttw=
u_local.9

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-5/i386-randconfig-w0-02200014/yocto-minimal-i386.cgz/1/vm-kbuild-yoct=
o-i386/boot

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:2          -50%            :2     dmesg.BUG:unable_to_handle_ke=
rnel
          1:2          -50%            :2     dmesg.EIP_is_at_perf_prepare_=
sample
          1:2          -50%            :2     dmesg.Kernel_panic-not_syncin=
g:Fatal_exception
          1:2          -50%            :2     dmesg.Oops

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-5/x86_64-randconfig-w0-02192129/quantal-core-x86_64.cgz/1/vm-vp-quant=
al-x86_64/boot

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :2           50%           1:2     dmesg.Kernel_panic-not_syncin=
g:Out_of_memory_and_no_killable_processes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-5/i386-randconfig-w0-02192054/openwrt-i386.cgz/1/vm-intel12-openwrt-i=
386/boot

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:2          -50%            :2     dmesg.Kernel_panic-not_syncin=
g:Out_of_memory_and_no_killable_processes
          1:2          -50%            :2     dmesg.Mem-Info
          1:2          -50%            :2     dmesg.invoked_oom-killer:gfp_=
mask=3D0x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-5/i386-randconfig-w0-02192022/yocto-minimal-i386.cgz/1/vm-kbuild-yoct=
o-i386/boot

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :2          100%           2:2     last_state.is_incomplete_run

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-5/i386-randconfig-w0-02191915/openwrt-i386.cgz/1/vm-lkp-wsx03-openwrt=
-i386/boot

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :2           50%           1:2     dmesg.page_allocation_failure=
:order:#,mode
           :2           50%           1:2     dmesg.warn_alloc_failed+0x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-5/i386-randconfig-w0-02191633/yocto-minimal-i386.cgz/1/vm-kbuild-yoct=
o-i386/boot

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :2          100%           2:46    dmesg.BUG:unable_to_handle_ke=
rnel
           :2          100%           2:46    dmesg.EIP_is_at_perf_prepare_=
sample
           :2          100%           2:46    dmesg.Kernel_panic-not_syncin=
g:Fatal_exception
           :2          100%           2:46    dmesg.Oops

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/rootfs/sleep/tbox_group/testcase:
  gcc-4.9/x86_64-rhel/debian-x86_64-2015-02-07.cgz/1/vm-client1-1G/boot

commit: =

  b7b269064ee1e3acbf738d122f599d1642c2d1f5
  17fcdff68f9a69f8beb7600c0803c12efed503f1

b7b269064ee1e3ac 17fcdff68f9a69f8beb7600c08 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          2:2         -100%            :2     kmsg.ACPI:No_IRQ_available_fo=
r_PCI_Interrupt_Link[LNKS].Try_pci=3Dnoacpi_or_acpi=3Doff
          2:2         -100%            :2     kmsg.ACPI:PCI_Interrupt_Link[=
LNKA]enabled_at_IRQ
          2:2         -100%            :2     kmsg.ACPI:PCI_Interrupt_Link[=
LNKC]enabled_at_IRQ
          2:2         -100%            :2     kmsg.ACPI:PCI_Interrupt_Link[=
LNKD]enabled_at_IRQ
          1:2          -50%            :2     kmsg.APIC_calibration_not_con=
sistent_with_PM-Timer:#ms_instead_of#ms
          2:2         -100%            :2     kmsg.Error:Driver'pcspkr'is_a=
lready_registered,aborting
          2:2         -100%            :2     kmsg.Measured#cycles_TSC_warp=
_between_CPUs,turning_off_TSC_clock
          2:2         -100%            :2     kmsg.TSC_synchronization[CPU#=
#->CPU##]
          2:2         -100%            :2     kmsg.acpi_PNP0A03:#:fail_to_a=
dd_MMCONFIG_information,can't_access_extended_PCI_configuration_space_under=
_this_bridge
          2:2         -100%            :2     kmsg.i6300esb:Unexpected_clos=
e,not_stopping_watchdog


lkp-hsx04: Brickland Haswell-EX
Memory: 512G

ivb43: Ivytown Ivy Bridge-EP
Memory: 64G

vm-lkp-wsx03-openwrt-i386: qemu-system-i386 -enable-kvm
Memory: 192M

vm-kbuild-yocto-i386: qemu-system-i386 -enable-kvm
Memory: 320M

vm-kbuild-1G: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
Memory: 1G

vm-kbuild-yocto-x86_64: qemu-system-x86_64 -enable-kvm -cpu SandyBridge
Memory: 320M

vm-vp-quantal-x86_64: qemu-system-x86_64 -enable-kvm
Memory: 360M

vm-intel12-openwrt-i386: qemu-system-i386 -enable-kvm
Memory: 192M

vm-intel12-1G: qemu-system-x86_64 -enable-kvm -cpu Nehalem
Memory: 1G

vm-lkp-wsx03-1G: qemu-system-x86_64 -enable-kvm -cpu host
Memory: 1G

vm-client1-1G: qemu-system-x86_64 -enable-kvm
Memory: 1G

vm-lkp-wsx03-quantal-i386: qemu-system-i386 -enable-kvm
Memory: 360M

vm-lkp-wsx03-yocto-i386: qemu-system-i386 -enable-kvm
Memory: 320M


/usr/bin/gnuplot: /usr/lib/x86_64-linux-gnu/liblua5.1.so.0: no version info=
rmation available (required by /usr/bin/gnuplot)

/usr/bin/gnuplot: /usr/lib/x86_64-linux-gnu/liblua5.1.so.0: no version info=
rmation available (required by /usr/bin/gnuplot)
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
Huang Ying

--===============0936104062613100930==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogYWltOQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0b3IK
ICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2bXN0YXQ6IAog
IG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mt
dm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFi
aW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBz
b2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAog
IGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBz
Y2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5j
ZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDog
MTdmY2RmZjY4ZjlhNjlmOGJlYjc2MDBjMDgwM2MxMmVmZWQ1MDNmMQptb2RlbDogSXZ5dG93biBJ
dnkgQnJpZGdlLUVQCm5yX2NwdTogNDgKbWVtb3J5OiA2NEcKbnJfaGRkX3BhcnRpdGlvbnM6IDAK
aGRkX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKc3dhcF9wYXJ0aXRpb25zOiAKY2F0
ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6IAphaW05OgogIHRlc3R0aW1lOiA1cwogIHRl
c3Q6IGFsbApxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGl2YjQzCnRib3hfZ3JvdXA6IGl2YjQzCmtj
b25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wMi0yMCAyMjozNzoyNS4yMjU0
MjE4ODggKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnegppZDogMWM0OTk4Yzk3NTYxNDg0Mzc3ZGZkNDU2OTU3YWEwZTM4NzhlODQzMgp1
c2VyOiBsa3AKaGVhZF9jb21taXQ6IDVjNmZlMTVhZjI0YTYxY2VkZDY1NGRmNDUwYmEyMjcwOTRl
YTQzYTMKYmFzZV9jb21taXQ6IDE4NTU4Y2FlMDI3MmY4ZmQ5NjQ3ZTY5ZDNmZWMxNTY1YTc5NDk4
NjUKYnJhbmNoOiBpbnRlcm5hbC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAyMTkyMy1pbnRlcm5h
bApyZXN1bHRfcm9vdDogIi9yZXN1bHQvYWltOS9wZXJmb3JtYW5jZS01cy1hbGwvaXZiNDMvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzE3ZmNkZmY2OGY5
YTY5ZjhiZWI3NjAwYzA4MDNjMTJlZmVkNTAzZjEvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9pdmI0My9iaXNlY3RfYWltOS1wZXJmb3JtYW5jZS01cy1hbGwtZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei14ODZfNjQtcmhlbC0xN2ZjZGZmNjhmOWE2OWY4YmViNzYwMGMwODAzYzEyZWZl
ZDUwM2YxLTIwMTYwMjIwLTc2MzkzLTFvZGpkZnotMC55YW1sIgptYXhfdXB0aW1lOiAxMjcyLjQK
aW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJv
b3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9z
Y2hlZHVsZWQvaXZiNDMvYmlzZWN0X2FpbTktcGVyZm9ybWFuY2UtNXMtYWxsLWRlYmlhbi14ODZf
NjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtMTdmY2RmZjY4ZjlhNjlmOGJlYjc2MDBjMDgw
M2MxMmVmZWQ1MDNmMS0yMDE2MDIyMC03NjM5My0xb2RqZGZ6LTAueWFtbAotIEFSQ0g9eDg2XzY0
Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1pbnRlcm5hbC1kZXZlbC9kZXZlbC1ob3Vy
bHktMjAxNjAyMTkyMy1pbnRlcm5hbAotIGNvbW1pdD0xN2ZjZGZmNjhmOWE2OWY4YmViNzYwMGMw
ODAzYzEyZWZlZDUwM2YxCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvMTdmY2RmZjY4ZjlhNjlmOGJlYjc2MDBjMDgwM2MxMmVmZWQ1MDNmMS92bWxpbnV6LTQuNS4w
LXJjNC0wMDQ0NC1nMTdmY2RmZgotIG1heF91cHRpbWU9MTI3MgotIFJFU1VMVF9ST09UPS9yZXN1
bHQvYWltOS9wZXJmb3JtYW5jZS01cy1hbGwvaXZiNDMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzE3ZmNkZmY2OGY5YTY5ZjhiZWI3NjAwYzA4MDNjMTJl
ZmVkNTAzZjEvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwx
MTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdh
eXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEg
c29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFt
ZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0
eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oi
Cm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzE3ZmNkZmY2
OGY5YTY5ZjhiZWI3NjAwYzA4MDNjMTJlZmVkNTAzZjEvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDog
Ii9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2lt
YWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9v
c2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9s
a3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy9haW05LXg4Nl82NC5j
Z3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45
LzE3ZmNkZmY2OGY5YTY5ZjhiZWI3NjAwYzA4MDNjMTJlZmVkNTAzZjEvbGludXgtaGVhZGVycy5j
Z3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00Ljkv
MTdmY2RmZjY4ZjlhNjlmOGJlYjc2MDBjMDgwM2MxMmVmZWQ1MDNmMS92bWxpbnV6LTQuNS4wLXJj
NC0wMDQ0NC1nMTdmY2RmZiIKZGVxdWV1ZV90aW1lOiAyMDE2LTAyLTIwIDIyOjQzOjA3LjczNjM3
ODg5OCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAwLjk0IDAuODIgMC40MCAy
LzQ5MCA2OTY0OQpzdGFydF90aW1lOiAnMTQ1NTk3OTQzMScKZW5kX3RpbWU6ICcxNDU1OTc5NzMx
Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDIyMC0yMjEyNDIiCg==

--===============0936104062613100930==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAg
MjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6
NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1
MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAg
MjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6
NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6NDM6
NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yMCAyMjo0Mzo1MCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDItMjAgMjI6NDM6NTAgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIw
IDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQz
OjUwIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTIwIDIyOjQzOjUwIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgo=

--===============0936104062613100930==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
BFla
--===============0936104062613100930==--

