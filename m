Content-Type: multipart/mixed; boundary="===============8541904010477528580=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [xfs] fbcc025613: -5.6% fsmark.files_per_sec
Date: Fri, 19 Feb 2016 10:52:08 +0800
Message-ID: <87vb5lqunb.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8541904010477528580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit fbcc025613590d7b1d15521555dcc6393a148a6b ("xfs: Introduce writeback =
context for writepages")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/md/nr_threads=
/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/performance/8BRD_12G/4M/xfs/1x/x86_64-rhel/RAID0/1t/debian-x86_64=
-2015-02-07.cgz/fsyncBeforeClose/lkp-hsx02/60G/fsmark

commit: =

  150d5be09ce49a9bed6feb7b7dc4e5ae188778ec
  fbcc025613590d7b1d15521555dcc6393a148a6b

150d5be09ce49a9b fbcc025613590d7b1d15521555 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     36122 =C2=B1  0%     -57.4%      15404 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     95.30 =C2=B1  0%      +1.8%      97.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     25339 =C2=B1 32%   +5756.0%    1483901 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
    881.80 =C2=B1 45%  +14258.5%     126613 =C2=B1 10%  latency_stats.hits.=
wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_=
write_and_wait_range.xfs_file_fsync.vfs_fsync_range.do_fsync.SyS_fsync.entr=
y_SYSCALL_64_fastpath
      3548 =C2=B1 48%  +11967.4%     428200 =C2=B1  7%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.xfs_file_fsync.vfs_fsync_range.do_fsync.SyS_fsync.entry=
_SYSCALL_64_fastpath
     36122 =C2=B1  0%     -57.4%      15404 =C2=B1  0%  time.involuntary_co=
ntext_switches
     25339 =C2=B1 32%   +5756.0%    1483901 =C2=B1  1%  time.voluntary_cont=
ext_switches
      0.75 =C2=B1  0%      +6.3%       0.80 =C2=B1  0%  turbostat.%Busy
     22.00 =C2=B1  0%      +4.5%      23.00 =C2=B1  0%  turbostat.Avg_MHz
      4991 =C2=B1  4%    +709.3%      40394 =C2=B1  3%  vmstat.system.cs
      1578 =C2=B1  1%      +5.4%       1663 =C2=B1  0%  vmstat.system.in
      2856 =C2=B1 10%     -33.7%       1894 =C2=B1 10%  slabinfo.file_lock_=
cache.active_objs
      2856 =C2=B1 10%     -33.7%       1894 =C2=B1 10%  slabinfo.file_lock_=
cache.num_objs
     10424 =C2=B1 15%     -65.8%       3561 =C2=B1 35%  slabinfo.scsi_data_=
buffer.active_objs
     10424 =C2=B1 15%     -65.8%       3561 =C2=B1 35%  slabinfo.scsi_data_=
buffer.num_objs
      3978 =C2=B1 15%     -65.4%       1375 =C2=B1 37%  slabinfo.xfs_da_sta=
te.active_objs
      3978 =C2=B1 15%     -65.4%       1375 =C2=B1 37%  slabinfo.xfs_da_sta=
te.num_objs
      2452 =C2=B1 15%     -65.8%     837.70 =C2=B1 35%  slabinfo.xfs_efd_it=
em.active_objs
      2452 =C2=B1 15%     -65.8%     837.70 =C2=B1 35%  slabinfo.xfs_efd_it=
em.num_objs
     10181 =C2=B1  3%     -17.4%       8414 =C2=B1  3%  slabinfo.xfs_ili.ac=
tive_objs
     10181 =C2=B1  3%     -17.4%       8414 =C2=B1  3%  slabinfo.xfs_ili.nu=
m_objs
      2819 =C2=B1 13%     -62.6%       1054 =C2=B1 32%  slabinfo.xfs_log_ti=
cket.active_objs
      2819 =C2=B1 13%     -62.6%       1054 =C2=B1 32%  slabinfo.xfs_log_ti=
cket.num_objs
      4369 =C2=B1 14%     -64.3%       1559 =C2=B1 33%  slabinfo.xfs_trans.=
active_objs
      4369 =C2=B1 14%     -64.3%       1559 =C2=B1 33%  slabinfo.xfs_trans.=
num_objs
    154727 =C2=B1 25%     +56.9%     242693 =C2=B1  9%  sched_debug.cpu.avg=
_idle.stddev
      3668 =C2=B1  4%     +43.9%       5278 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.103
      3752 =C2=B1  3%     +44.3%       5414 =C2=B1 31%  sched_debug.cpu.nr_=
load_updates.104
      3721 =C2=B1  3%     +45.8%       5425 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.105
      3734 =C2=B1  2%     +39.5%       5210 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.106
      3738 =C2=B1  5%     +38.4%       5175 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.107
      3719 =C2=B1  3%     +39.0%       5169 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.108
      3653 =C2=B1  3%     +40.9%       5148 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.109
      5678 =C2=B1 14%     +19.2%       6768 =C2=B1 21%  sched_debug.cpu.nr_=
load_updates.11
      3664 =C2=B1  2%     +40.0%       5131 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.110
      3607 =C2=B1  4%     +43.5%       5178 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.111
      3647 =C2=B1  2%     +41.7%       5169 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.112
      3699 =C2=B1  4%     +40.9%       5212 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.113
      3595 =C2=B1  3%     +41.3%       5080 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.114
      3545 =C2=B1  5%     +42.7%       5058 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.115
      3654 =C2=B1  3%     +39.3%       5090 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.117
      3627 =C2=B1  4%     +39.4%       5058 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.118
      3612 =C2=B1  4%     +42.1%       5135 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.119
      3583 =C2=B1  4%     +40.3%       5028 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.120
      3594 =C2=B1  2%     +42.2%       5109 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.121
      3553 =C2=B1  4%     +43.0%       5082 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.122
      3622 =C2=B1  4%     +38.1%       5002 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.123
      3551 =C2=B1  3%     +31.3%       4664 =C2=B1 22%  sched_debug.cpu.nr_=
load_updates.124
      3552 =C2=B1  3%     +41.3%       5018 =C2=B1 30%  sched_debug.cpu.nr_=
load_updates.125
      3512 =C2=B1  8%     +44.3%       5066 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.126
      3489 =C2=B1  6%     +42.9%       4987 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.127
      3483 =C2=B1  6%     +42.6%       4966 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.128
      3612 =C2=B1  5%     +38.6%       5007 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.129
      3484 =C2=B1  7%     +43.7%       5007 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.130
      3507 =C2=B1  3%     +42.2%       4986 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.131
      3483 =C2=B1  3%     +44.4%       5029 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.132
      3551 =C2=B1  4%     +40.3%       4984 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.134
      3519 =C2=B1  3%     +38.5%       4876 =C2=B1 30%  sched_debug.cpu.nr_=
load_updates.135
      3456 =C2=B1  3%     +43.5%       4960 =C2=B1 30%  sched_debug.cpu.nr_=
load_updates.136
      3462 =C2=B1  4%     +42.3%       4925 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.137
      3469 =C2=B1  5%     +43.5%       4980 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.138
      3435 =C2=B1  5%     +43.6%       4933 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.139
      3535 =C2=B1  4%     +37.8%       4873 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.140
      3470 =C2=B1  5%     +41.4%       4906 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.141
      3461 =C2=B1  5%     +40.9%       4876 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.142
      3508 =C2=B1  6%     +41.4%       4960 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.143
      5052 =C2=B1 11%     +32.9%       6714 =C2=B1 21%  sched_debug.cpu.nr_=
load_updates.39
      4872 =C2=B1 13%     +29.7%       6321 =C2=B1 20%  sched_debug.cpu.nr_=
load_updates.54
      5037 =C2=B1 14%     +28.5%       6472 =C2=B1 20%  sched_debug.cpu.nr_=
load_updates.56
      5937 =C2=B1 12%     +22.0%       7244 =C2=B1 20%  sched_debug.cpu.nr_=
load_updates.6
      4966 =C2=B1 18%     +29.9%       6451 =C2=B1 19%  sched_debug.cpu.nr_=
load_updates.63
      4972 =C2=B1 17%     +29.4%       6436 =C2=B1 19%  sched_debug.cpu.nr_=
load_updates.64
      4892 =C2=B1 15%     +30.3%       6373 =C2=B1 20%  sched_debug.cpu.nr_=
load_updates.65
      4764 =C2=B1 20%     +35.5%       6453 =C2=B1 18%  sched_debug.cpu.nr_=
load_updates.66
      4818 =C2=B1 14%     +31.0%       6313 =C2=B1 19%  sched_debug.cpu.nr_=
load_updates.67
      4764 =C2=B1 14%     +35.1%       6438 =C2=B1 26%  sched_debug.cpu.nr_=
load_updates.68
      4773 =C2=B1 15%     +32.0%       6302 =C2=B1 20%  sched_debug.cpu.nr_=
load_updates.69
      4634 =C2=B1 15%     +35.5%       6280 =C2=B1 20%  sched_debug.cpu.nr_=
load_updates.70
      4684 =C2=B1 14%     +33.6%       6258 =C2=B1 21%  sched_debug.cpu.nr_=
load_updates.71
      3912 =C2=B1  6%     +39.5%       5459 =C2=B1 25%  sched_debug.cpu.nr_=
load_updates.72
      4007 =C2=B1  4%     +37.3%       5502 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.73
      3937 =C2=B1  3%     +33.3%       5246 =C2=B1 22%  sched_debug.cpu.nr_=
load_updates.74
      3935 =C2=B1  4%     +37.8%       5425 =C2=B1 25%  sched_debug.cpu.nr_=
load_updates.75
      3868 =C2=B1  4%     +39.1%       5382 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.76
      3928 =C2=B1  3%     +38.3%       5432 =C2=B1 26%  sched_debug.cpu.nr_=
load_updates.77
      3846 =C2=B1  4%     +37.7%       5295 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.78
      3966 =C2=B1  3%     +34.4%       5330 =C2=B1 26%  sched_debug.cpu.nr_=
load_updates.79
      5758 =C2=B1 15%     +21.9%       7017 =C2=B1 19%  sched_debug.cpu.nr_=
load_updates.8
      3942 =C2=B1  5%     +36.4%       5377 =C2=B1 26%  sched_debug.cpu.nr_=
load_updates.81
      3921 =C2=B1  3%     +37.1%       5376 =C2=B1 26%  sched_debug.cpu.nr_=
load_updates.82
      3884 =C2=B1  3%     +38.0%       5359 =C2=B1 26%  sched_debug.cpu.nr_=
load_updates.83
      3886 =C2=B1  5%     +37.5%       5342 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.84
      3826 =C2=B1  5%     +37.5%       5259 =C2=B1 24%  sched_debug.cpu.nr_=
load_updates.85
      3909 =C2=B1  2%     +35.6%       5299 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.86
      3783 =C2=B1  3%     +40.8%       5328 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.88
      5676 =C2=B1 15%     +21.8%       6915 =C2=B1 20%  sched_debug.cpu.nr_=
load_updates.9
      3773 =C2=B1  3%     +40.6%       5303 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.92
      3775 =C2=B1  2%     +39.3%       5258 =C2=B1 28%  sched_debug.cpu.nr_=
load_updates.93
      3817 =C2=B1  5%     +39.5%       5323 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.94
      3798 =C2=B1  4%     +40.0%       5318 =C2=B1 29%  sched_debug.cpu.nr_=
load_updates.95
      3776 =C2=B1  3%     +39.6%       5271 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.96
      3752 =C2=B1  4%     +38.9%       5211 =C2=B1 27%  sched_debug.cpu.nr_=
load_updates.97
      4501 =C2=B1  2%     +31.5%       5920 =C2=B1 24%  sched_debug.cpu.nr_=
load_updates.avg
      1642 =C2=B1  4%    +552.3%      10714 =C2=B1  3%  sched_debug.cpu.nr_=
switches.avg
     12081 =C2=B1 14%    +726.7%      99874 =C2=B1 12%  sched_debug.cpu.nr_=
switches.max
      2088 =C2=B1 11%   +1143.5%      25972 =C2=B1  6%  sched_debug.cpu.nr_=
switches.stddev
    671.69 =C2=B1  4%    +679.1%       5233 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.avg
      4936 =C2=B1 18%    +877.5%      48256 =C2=B1 12%  sched_debug.cpu.sch=
ed_goidle.max
    816.17 =C2=B1 12%   +1457.0%      12707 =C2=B1  6%  sched_debug.cpu.sch=
ed_goidle.stddev
    838.29 =C2=B1  4%    +543.4%       5393 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.avg
      9306 =C2=B1  9%    +461.0%      52212 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.max
      1333 =C2=B1  8%    +899.5%      13325 =C2=B1  6%  sched_debug.cpu.ttw=
u_count.stddev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_threads/ro=
otfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/performance/1BRD_48G/4M/xfs/1x/x86_64-rhel/1t/debian-x86_64-2015-=
02-07.cgz/fsyncBeforeClose/lkp-hsx04/40G/fsmark

commit: =

  150d5be09ce49a9bed6feb7b7dc4e5ae188778ec
  fbcc025613590d7b1d15521555dcc6393a148a6b

150d5be09ce49a9b fbcc025613590d7b1d15521555 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    296253 =C2=B1  0%      +7.3%     317785 =C2=B1  0%  fsmark.app_overhead
    260.88 =C2=B1  0%      -5.6%     246.35 =C2=B1  0%  fsmark.files_per_sec
     28610 =C2=B1  0%     -64.0%      10291 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
     94.50 =C2=B1  0%      +2.6%      97.00 =C2=B1  0%  fsmark.time.percent=
_of_cpu_this_job_got
     13641 =C2=B1 20%   +5289.6%     735225 =C2=B1  1%  fsmark.time.volunta=
ry_context_switches
    393.50 =C2=B1  3%     -27.8%     284.00 =C2=B1 14%  proc-vmstat.nr_writ=
eback
    179855 =C2=B1 88%     -99.3%       1304 =C2=B1 12%  proc-vmstat.pgalloc=
_dma32
     28610 =C2=B1  0%     -64.0%      10291 =C2=B1  0%  time.involuntary_co=
ntext_switches
     13641 =C2=B1 20%   +5289.6%     735225 =C2=B1  1%  time.voluntary_cont=
ext_switches
   1010090 =C2=B1  1%      -5.1%     958337 =C2=B1  0%  vmstat.io.bo
      5530 =C2=B1  2%    +578.6%      37527 =C2=B1  0%  vmstat.system.cs
   1283915 =C2=B1  0%     +95.7%    2512835 =C2=B1 81%  latency_stats.avg.a=
sync_synchronize_cookie_domain.async_synchronize_full.do_init_module.load_m=
odule.SyS_finit_module.entry_SYSCALL_64_fastpath
    356.00 =C2=B1 57%  +20640.0%      73834 =C2=B1 17%  latency_stats.hits.=
wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_=
write_and_wait_range.xfs_file_fsync.vfs_fsync_range.do_fsync.SyS_fsync.entr=
y_SYSCALL_64_fastpath
      1679 =C2=B1 63%  +14400.8%     243468 =C2=B1  1%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.xfs_file_fsync.vfs_fsync_range.do_fsync.SyS_fsync.entry=
_SYSCALL_64_fastpath
  10257570 =C2=B1 97%     -99.6%      36846 =C2=B1  5%  numa-numastat.node0=
.local_node
  10257571 =C2=B1 97%     -99.6%      36847 =C2=B1  5%  numa-numastat.node0=
.numa_hit
   5159497 =C2=B1166%     -99.3%      34470 =C2=B1  5%  numa-numastat.node3=
.local_node
   5159497 =C2=B1166%     -99.3%      34470 =C2=B1  5%  numa-numastat.node3=
.numa_hit
      0.97 =C2=B1 13%    +289.7%       3.80 =C2=B1  5%  turbostat.%Busy
     31.25 =C2=B1 14%    +255.2%     111.00 =C2=B1  5%  turbostat.Avg_MHz
      3221 =C2=B1  0%      -9.3%       2923 =C2=B1  0%  turbostat.Bzy_MHz
      2.30 =C2=B1 61%    +252.2%       8.11 =C2=B1 43%  turbostat.CPU%c1
    193.92 =C2=B1  1%      +9.2%     211.83 =C2=B1  1%  turbostat.PkgWatt
    898.00 =C2=B1 35%     +68.3%       1511 =C2=B1 12%  cpuidle.C1-HSW.usage
  27387698 =C2=B1168%    +439.5%  1.477e+08 =C2=B1 94%  cpuidle.C1E-HSW.time
    147.25 =C2=B1 38%   +1074.2%       1729 =C2=B1 23%  cpuidle.C3-HSW.usage
     67775 =C2=B1  4%     +14.8%      77808 =C2=B1  3%  cpuidle.C6-HSW.usage
  12851618 =C2=B1 57%   +1331.2%  1.839e+08 =C2=B1  6%  cpuidle.POLL.time
      6455 =C2=B1  3%    +891.3%      63993 =C2=B1 18%  cpuidle.POLL.usage
      2581 =C2=B1  6%     -47.0%       1367 =C2=B1 14%  slabinfo.file_lock_=
cache.active_objs
      2581 =C2=B1  6%     -47.0%       1367 =C2=B1 14%  slabinfo.file_lock_=
cache.num_objs
      9911 =C2=B1 12%     -64.0%       3572 =C2=B1 33%  slabinfo.scsi_data_=
buffer.active_objs
      9911 =C2=B1 12%     -64.0%       3572 =C2=B1 33%  slabinfo.scsi_data_=
buffer.num_objs
      3834 =C2=B1 14%     -64.6%       1359 =C2=B1 36%  slabinfo.xfs_da_sta=
te.active_objs
      3834 =C2=B1 14%     -64.6%       1359 =C2=B1 36%  slabinfo.xfs_da_sta=
te.num_objs
      2332 =C2=B1 12%     -64.0%     840.25 =C2=B1 33%  slabinfo.xfs_efd_it=
em.active_objs
      2332 =C2=B1 12%     -64.0%     840.25 =C2=B1 33%  slabinfo.xfs_efd_it=
em.num_objs
      7323 =C2=B1  3%     -25.7%       5443 =C2=B1  4%  slabinfo.xfs_ili.ac=
tive_objs
      7323 =C2=B1  3%     -25.7%       5443 =C2=B1  4%  slabinfo.xfs_ili.nu=
m_objs
      6149 =C2=B1  1%     -15.0%       5225 =C2=B1  1%  slabinfo.xfs_inode.=
active_objs
      6149 =C2=B1  1%     -15.0%       5225 =C2=B1  1%  slabinfo.xfs_inode.=
num_objs
      2817 =C2=B1 11%     -64.7%     995.50 =C2=B1 29%  slabinfo.xfs_log_ti=
cket.active_objs
      2817 =C2=B1 11%     -64.7%     995.50 =C2=B1 29%  slabinfo.xfs_log_ti=
cket.num_objs
      4189 =C2=B1 11%     -63.6%       1523 =C2=B1 30%  slabinfo.xfs_trans.=
active_objs
      4189 =C2=B1 11%     -63.6%       1523 =C2=B1 30%  slabinfo.xfs_trans.=
num_objs
   2431648 =C2=B1 95%    -100.0%      66.25 =C2=B1 57%  numa-vmstat.node0.n=
r_dirtied
   2461928 =C2=B1 93%     -98.8%      29788 =C2=B1  0%  numa-vmstat.node0.n=
r_file_pages
    671.50 =C2=B1126%     -87.1%      86.75 =C2=B1 14%  numa-vmstat.node0.n=
r_inactive_anon
   2455143 =C2=B1 94%     -99.0%      23476 =C2=B1  1%  numa-vmstat.node0.n=
r_inactive_file
    690.75 =C2=B1122%     -84.8%     105.25 =C2=B1 13%  numa-vmstat.node0.n=
r_shmem
     78482 =C2=B1 90%     -94.9%       4022 =C2=B1 14%  numa-vmstat.node0.n=
r_slab_reclaimable
     12214 =C2=B1  7%     -11.5%      10804 =C2=B1  2%  numa-vmstat.node0.n=
r_slab_unreclaimable
   2431323 =C2=B1 95%    -100.0%      60.25 =C2=B1 57%  numa-vmstat.node0.n=
r_written
   5105548 =C2=B1 91%     -96.3%     188791 =C2=B1  7%  numa-vmstat.node0.n=
uma_hit
   5072639 =C2=B1 92%     -96.9%     155667 =C2=B1  8%  numa-vmstat.node0.n=
uma_local
      1506 =C2=B1 49%     -49.5%     761.50 =C2=B1  1%  numa-vmstat.node1.n=
r_mapped
    665.00 =C2=B1130%    +154.7%       1693 =C2=B1 49%  numa-vmstat.node2.n=
r_shmem
   1190411 =C2=B1166%    -100.0%       1.00 =C2=B1100%  numa-vmstat.node3.n=
r_dirtied
   1220156 =C2=B1161%     -97.5%      30211 =C2=B1  2%  numa-vmstat.node3.n=
r_file_pages
   1213900 =C2=B1162%     -98.1%      23410 =C2=B1  0%  numa-vmstat.node3.n=
r_inactive_file
     40402 =C2=B1149%     -91.3%       3503 =C2=B1 13%  numa-vmstat.node3.n=
r_slab_reclaimable
   1190259 =C2=B1166%    -100.0%       0.50 =C2=B1100%  numa-vmstat.node3.n=
r_written
   9848197 =C2=B1 93%     -98.8%     119153 =C2=B1  0%  numa-meminfo.node0.=
FilePages
   9823758 =C2=B1 94%     -99.0%      94254 =C2=B1  0%  numa-meminfo.node0.=
Inactive
      2686 =C2=B1126%     -87.0%     348.50 =C2=B1 14%  numa-meminfo.node0.=
Inactive(anon)
   9821071 =C2=B1 94%     -99.0%      93906 =C2=B1  1%  numa-meminfo.node0.=
Inactive(file)
  20295204 =C2=B1 92%     -97.1%     584915 =C2=B1  9%  numa-meminfo.node0.=
MemUsed
    313945 =C2=B1 90%     -94.9%      16093 =C2=B1 14%  numa-meminfo.node0.=
SReclaimable
     48861 =C2=B1  7%     -11.5%      43225 =C2=B1  2%  numa-meminfo.node0.=
SUnreclaim
      2765 =C2=B1122%     -84.7%     422.25 =C2=B1 13%  numa-meminfo.node0.=
Shmem
    362807 =C2=B1 78%     -83.7%      59318 =C2=B1  4%  numa-meminfo.node0.=
Slab
      6028 =C2=B1 49%     -49.5%       3045 =C2=B1  1%  numa-meminfo.node1.=
Mapped
      2660 =C2=B1130%    +154.7%       6776 =C2=B1 49%  numa-meminfo.node2.=
Shmem
   4881563 =C2=B1161%     -97.5%     120847 =C2=B1  2%  numa-meminfo.node3.=
FilePages
   4856947 =C2=B1162%     -98.0%      95995 =C2=B1  4%  numa-meminfo.node3.=
Inactive
   4856548 =C2=B1162%     -98.1%      93643 =C2=B1  0%  numa-meminfo.node3.=
Inactive(file)
  10148394 =C2=B1158%     -95.3%     475091 =C2=B1  3%  numa-meminfo.node3.=
MemUsed
    669.25 =C2=B1  4%     +22.5%     819.50 =C2=B1 13%  numa-meminfo.node3.=
PageTables
    161638 =C2=B1149%     -91.3%      14017 =C2=B1 13%  numa-meminfo.node3.=
SReclaimable
    204385 =C2=B1117%     -73.0%      55109 =C2=B1  4%  numa-meminfo.node3.=
Slab
      2473 =C2=B1 82%     -87.6%     305.96 =C2=B1122%  sched_debug.cfs_rq:=
/.exec_clock.102
    321.21 =C2=B1 65%     -74.9%      80.77 =C2=B1 61%  sched_debug.cfs_rq:=
/.exec_clock.103
    327.77 =C2=B1 55%     -53.0%     154.12 =C2=B1 35%  sched_debug.cfs_rq:=
/.exec_clock.106
    329.30 =C2=B1 59%     -67.4%     107.49 =C2=B1 41%  sched_debug.cfs_rq:=
/.exec_clock.109
    299.92 =C2=B1 44%     -68.7%      93.76 =C2=B1 62%  sched_debug.cfs_rq:=
/.exec_clock.120
    304.61 =C2=B1 61%     -64.5%     108.23 =C2=B1 51%  sched_debug.cfs_rq:=
/.exec_clock.123
    317.37 =C2=B1 49%     -57.8%     133.97 =C2=B1 52%  sched_debug.cfs_rq:=
/.exec_clock.124
    346.76 =C2=B1 24%     -48.7%     177.98 =C2=B1 28%  sched_debug.cfs_rq:=
/.exec_clock.13
    270.01 =C2=B1 25%     -46.2%     145.32 =C2=B1 42%  sched_debug.cfs_rq:=
/.exec_clock.131
    317.15 =C2=B1 35%     -61.8%     121.14 =C2=B1 43%  sched_debug.cfs_rq:=
/.exec_clock.141
    515.18 =C2=B1 35%     -62.2%     194.89 =C2=B1 45%  sched_debug.cfs_rq:=
/.exec_clock.19
      1740 =C2=B1117%     -88.5%     200.72 =C2=B1 18%  sched_debug.cfs_rq:=
/.exec_clock.22
    442.34 =C2=B1 39%     -43.0%     252.26 =C2=B1 26%  sched_debug.cfs_rq:=
/.exec_clock.25
    335.97 =C2=B1 11%     -35.5%     216.59 =C2=B1 36%  sched_debug.cfs_rq:=
/.exec_clock.3
    478.25 =C2=B1 42%     -48.9%     244.26 =C2=B1 39%  sched_debug.cfs_rq:=
/.exec_clock.40
    369.23 =C2=B1 31%     -35.8%     237.02 =C2=B1 34%  sched_debug.cfs_rq:=
/.exec_clock.41
    465.87 =C2=B1 47%     -55.3%     208.45 =C2=B1 23%  sched_debug.cfs_rq:=
/.exec_clock.43
    381.79 =C2=B1 38%     -53.6%     177.20 =C2=B1 25%  sched_debug.cfs_rq:=
/.exec_clock.50
    347.70 =C2=B1 16%     -51.2%     169.70 =C2=B1 32%  sched_debug.cfs_rq:=
/.exec_clock.71
    284.55 =C2=B1 41%     -66.0%      96.64 =C2=B1 89%  sched_debug.cfs_rq:=
/.exec_clock.74
    368.83 =C2=B1 55%     -70.5%     108.91 =C2=B1 61%  sched_debug.cfs_rq:=
/.exec_clock.79
      1299 =C2=B1135%     -95.2%      61.80 =C2=B1 30%  sched_debug.cfs_rq:=
/.exec_clock.92
     13.00 =C2=B1136%    +501.9%      78.25 =C2=B1 65%  sched_debug.cfs_rq:=
/.load_avg.140
      1.33 =C2=B1 93%  +17168.8%     230.25 =C2=B1167%  sched_debug.cfs_rq:=
/.load_avg.25
      2.00 =C2=B1 61%   +2912.5%      60.25 =C2=B1 88%  sched_debug.cfs_rq:=
/.load_avg.39
      2.00 =C2=B1 70%   +1550.0%      33.00 =C2=B1134%  sched_debug.cfs_rq:=
/.load_avg.41
     91.75 =C2=B1112%     -75.5%      22.50 =C2=B1163%  sched_debug.cfs_rq:=
/.load_avg.55
      3.75 =C2=B1 51%   +5740.0%     219.00 =C2=B1 89%  sched_debug.cfs_rq:=
/.load_avg.60
      1.25 =C2=B1 34%  +18240.0%     229.25 =C2=B1146%  sched_debug.cfs_rq:=
/.load_avg.7
     53.75 =C2=B1 75%     -98.6%       0.75 =C2=B1 57%  sched_debug.cfs_rq:=
/.load_avg.98
     50.61 =C2=B1 17%     -24.6%      38.15 =C2=B1 15%  sched_debug.cfs_rq:=
/.load_avg.avg
     42372 =C2=B1 29%     -52.5%      20110 =C2=B1  4%  sched_debug.cfs_rq:=
/.min_vruntime.0
     24964 =C2=B1 33%     -49.5%      12599 =C2=B1 52%  sched_debug.cfs_rq:=
/.min_vruntime.10
     28449 =C2=B1 61%     -77.0%       6548 =C2=B1 53%  sched_debug.cfs_rq:=
/.min_vruntime.102
     25429 =C2=B1 68%     -78.1%       5579 =C2=B1 97%  sched_debug.cfs_rq:=
/.min_vruntime.103
     22244 =C2=B1 32%     -61.8%       8497 =C2=B1 77%  sched_debug.cfs_rq:=
/.min_vruntime.108
     24582 =C2=B1 65%     -72.6%       6733 =C2=B1 65%  sched_debug.cfs_rq:=
/.min_vruntime.109
     23957 =C2=B1 73%     -71.4%       6853 =C2=B1 83%  sched_debug.cfs_rq:=
/.min_vruntime.110
     23019 =C2=B1 66%     -64.7%       8134 =C2=B1 52%  sched_debug.cfs_rq:=
/.min_vruntime.118
     24409 =C2=B1 62%     -63.1%       9018 =C2=B1 39%  sched_debug.cfs_rq:=
/.min_vruntime.119
     20859 =C2=B1 33%     -56.4%       9085 =C2=B1 60%  sched_debug.cfs_rq:=
/.min_vruntime.12
     22914 =C2=B1 53%     -80.8%       4408 =C2=B1132%  sched_debug.cfs_rq:=
/.min_vruntime.120
     24011 =C2=B1 64%     -67.6%       7783 =C2=B1 66%  sched_debug.cfs_rq:=
/.min_vruntime.122
     25835 =C2=B1 56%     -72.5%       7102 =C2=B1 53%  sched_debug.cfs_rq:=
/.min_vruntime.125
     22529 =C2=B1 35%     -61.7%       8628 =C2=B1 45%  sched_debug.cfs_rq:=
/.min_vruntime.13
     22852 =C2=B1 48%     -69.8%       6908 =C2=B1 55%  sched_debug.cfs_rq:=
/.min_vruntime.141
     24299 =C2=B1 46%     -57.3%      10375 =C2=B1 46%  sched_debug.cfs_rq:=
/.min_vruntime.17
     32100 =C2=B1 43%     -66.6%      10732 =C2=B1 47%  sched_debug.cfs_rq:=
/.min_vruntime.19
     29947 =C2=B1 59%     -59.7%      12061 =C2=B1 42%  sched_debug.cfs_rq:=
/.min_vruntime.22
     21889 =C2=B1 57%     -51.5%      10609 =C2=B1 27%  sched_debug.cfs_rq:=
/.min_vruntime.25
     19883 =C2=B1 18%     -61.4%       7677 =C2=B1 80%  sched_debug.cfs_rq:=
/.min_vruntime.3
     30560 =C2=B1 66%     -70.7%       8942 =C2=B1 66%  sched_debug.cfs_rq:=
/.min_vruntime.34
     23910 =C2=B1 38%     -63.1%       8818 =C2=B1 52%  sched_debug.cfs_rq:=
/.min_vruntime.4
     24186 =C2=B1 45%     -59.2%       9879 =C2=B1 35%  sched_debug.cfs_rq:=
/.min_vruntime.41
     30645 =C2=B1 61%     -66.1%      10385 =C2=B1 50%  sched_debug.cfs_rq:=
/.min_vruntime.43
     26137 =C2=B1 59%     -57.6%      11071 =C2=B1 42%  sched_debug.cfs_rq:=
/.min_vruntime.50
     24390 =C2=B1 66%     -71.2%       7013 =C2=B1 41%  sched_debug.cfs_rq:=
/.min_vruntime.58
     24634 =C2=B1 41%     -59.0%      10091 =C2=B1 40%  sched_debug.cfs_rq:=
/.min_vruntime.61
     27874 =C2=B1 54%     -61.7%      10665 =C2=B1 52%  sched_debug.cfs_rq:=
/.min_vruntime.65
     23946 =C2=B1 75%     -60.4%       9478 =C2=B1 36%  sched_debug.cfs_rq:=
/.min_vruntime.66
     21961 =C2=B1 49%     -50.8%      10800 =C2=B1 38%  sched_debug.cfs_rq:=
/.min_vruntime.70
     21587 =C2=B1 34%     -72.6%       5924 =C2=B1 43%  sched_debug.cfs_rq:=
/.min_vruntime.71
     23441 =C2=B1 74%     -63.4%       8574 =C2=B1 58%  sched_debug.cfs_rq:=
/.min_vruntime.73
     17619 =C2=B1 53%     -74.4%       4505 =C2=B1122%  sched_debug.cfs_rq:=
/.min_vruntime.74
     25305 =C2=B1 59%     -75.4%       6232 =C2=B1 84%  sched_debug.cfs_rq:=
/.min_vruntime.79
     11691 =C2=B1  3%     -54.6%       5307 =C2=B1 78%  sched_debug.cfs_rq:=
/.min_vruntime.82
     21995 =C2=B1 49%     -83.0%       3735 =C2=B1 67%  sched_debug.cfs_rq:=
/.min_vruntime.92
     16851 =C2=B1 11%     -59.4%       6849 =C2=B1 72%  sched_debug.cfs_rq:=
/.min_vruntime.95
     21138 =C2=B1 51%     -51.7%      10211 =C2=B1 36%  sched_debug.cfs_rq:=
/.min_vruntime.avg
      0.05 =C2=B1 17%     -46.2%       0.02 =C2=B1 31%  sched_debug.cfs_rq:=
/.nr_running.avg
      0.21 =C2=B1  8%     -26.6%       0.15 =C2=B1 16%  sched_debug.cfs_rq:=
/.nr_running.stddev
      1.65 =C2=B1 40%     -59.2%       0.68 =C2=B1 20%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    101.50 =C2=B1 96%     -78.8%      21.50 =C2=B1 28%  sched_debug.cfs_rq:=
/.runnable_load_avg.max
      9.14 =C2=B1 85%     -71.8%       2.57 =C2=B1 21%  sched_debug.cfs_rq:=
/.runnable_load_avg.stddev
    -25583 =C2=B1-20%     -63.9%      -9234 =C2=B1-45%  sched_debug.cfs_rq:=
/.spread0.1
    -18990 =C2=B1-29%     -49.9%      -9510 =C2=B1-52%  sched_debug.cfs_rq:=
/.spread0.100
    -32882 =C2=B1-53%     -67.3%     -10737 =C2=B1-42%  sched_debug.cfs_rq:=
/.spread0.104
    -18188 =C2=B1-31%     -44.1%     -10169 =C2=B1-38%  sched_debug.cfs_rq:=
/.spread0.105
    -31547 =C2=B1-55%     -66.3%     -10623 =C2=B1-34%  sched_debug.cfs_rq:=
/.spread0.107
    -27581 =C2=B1-43%     -62.4%     -10384 =C2=B1-34%  sched_debug.cfs_rq:=
/.spread0.11
    -22027 =C2=B1-16%     -39.5%     -13324 =C2=B1-37%  sched_debug.cfs_rq:=
/.spread0.111
    -18752 =C2=B1-25%     -60.0%      -7508 =C2=B1-55%  sched_debug.cfs_rq:=
/.spread0.112
    -35576 =C2=B1-48%     -72.7%      -9707 =C2=B1-36%  sched_debug.cfs_rq:=
/.spread0.113
    -32611 =C2=B1-53%     -71.2%      -9377 =C2=B1-48%  sched_debug.cfs_rq:=
/.spread0.114
    -23140 =C2=B1-38%     -53.5%     -10766 =C2=B1-55%  sched_debug.cfs_rq:=
/.spread0.115
    -36650 =C2=B1-44%     -65.7%     -12585 =C2=B1-38%  sched_debug.cfs_rq:=
/.spread0.116
    -17970 =C2=B1-25%     -38.3%     -11093 =C2=B1-24%  sched_debug.cfs_rq:=
/.spread0.119
    -18769 =C2=B1-30%     -43.2%     -10669 =C2=B1-44%  sched_debug.cfs_rq:=
/.spread0.121
    -18368 =C2=B1-21%     -32.9%     -12328 =C2=B1-39%  sched_debug.cfs_rq:=
/.spread0.122
    -30913 =C2=B1-61%     -63.3%     -11341 =C2=B1-53%  sched_debug.cfs_rq:=
/.spread0.126
    -21803 =C2=B1-26%     -48.0%     -11333 =C2=B1-36%  sched_debug.cfs_rq:=
/.spread0.127
    -21165 =C2=B1-24%     -67.7%      -6840 =C2=B1-85%  sched_debug.cfs_rq:=
/.spread0.128
    -26241 =C2=B1-26%     -41.2%     -15428 =C2=B1-18%  sched_debug.cfs_rq:=
/.spread0.129
    -32533 =C2=B1-55%     -62.2%     -12312 =C2=B1-38%  sched_debug.cfs_rq:=
/.spread0.130
    -24553 =C2=B1-32%     -60.5%      -9708 =C2=B1-43%  sched_debug.cfs_rq:=
/.spread0.131
    -18241 =C2=B1-22%     -48.1%      -9475 =C2=B1-58%  sched_debug.cfs_rq:=
/.spread0.132
    -23675 =C2=B1-43%     -69.3%      -7265 =C2=B1-75%  sched_debug.cfs_rq:=
/.spread0.133
    -31623 =C2=B1-58%     -57.5%     -13450 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.134
    -18208 =C2=B1-26%     -41.8%     -10590 =C2=B1-48%  sched_debug.cfs_rq:=
/.spread0.135
    -19697 =C2=B1-30%     -45.2%     -10793 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.136
    -23217 =C2=B1-39%     -60.6%      -9144 =C2=B1-46%  sched_debug.cfs_rq:=
/.spread0.137
    -22219 =C2=B1-20%     -44.0%     -12439 =C2=B1-20%  sched_debug.cfs_rq:=
/.spread0.138
    -29239 =C2=B1-61%     -66.0%      -9946 =C2=B1-59%  sched_debug.cfs_rq:=
/.spread0.139
    -28928 =C2=B1-28%     -70.5%      -8519 =C2=B1-48%  sched_debug.cfs_rq:=
/.spread0.14
    -18983 =C2=B1-14%     -59.1%      -7765 =C2=B1-64%  sched_debug.cfs_rq:=
/.spread0.140
    -19527 =C2=B1 -7%     -32.4%     -13204 =C2=B1-26%  sched_debug.cfs_rq:=
/.spread0.141
    -18157 =C2=B1-27%     -49.8%      -9109 =C2=B1-36%  sched_debug.cfs_rq:=
/.spread0.142
    -23564 =C2=B1-34%     -53.2%     -11036 =C2=B1-56%  sched_debug.cfs_rq:=
/.spread0.143
    -23378 =C2=B1-22%     -67.8%      -7528 =C2=B1-65%  sched_debug.cfs_rq:=
/.spread0.15
    -18714 =C2=B1-36%     -62.8%      -6960 =C2=B1-45%  sched_debug.cfs_rq:=
/.spread0.16
    -18073 =C2=B1 -8%     -46.1%      -9735 =C2=B1-39%  sched_debug.cfs_rq:=
/.spread0.17
    -25957 =C2=B1-34%     -72.3%      -7199 =C2=B1-77%  sched_debug.cfs_rq:=
/.spread0.2
    -27734 =C2=B1-48%     -74.4%      -7107 =C2=B1-77%  sched_debug.cfs_rq:=
/.spread0.20
    -21427 =C2=B1 -9%     -63.3%      -7863 =C2=B1-88%  sched_debug.cfs_rq:=
/.spread0.21
    -18151 =C2=B1-47%     -80.5%      -3539 =C2=B1-246%  sched_debug.cfs_rq=
:/.spread0.23
    -20749 =C2=B1-12%     -67.5%      -6752 =C2=B1-52%  sched_debug.cfs_rq:=
/.spread0.24
    -20483 =C2=B1-13%     -53.6%      -9500 =C2=B1-27%  sched_debug.cfs_rq:=
/.spread0.25
    -22052 =C2=B1-15%     -75.0%      -5518 =C2=B1-67%  sched_debug.cfs_rq:=
/.spread0.26
    -19597 =C2=B1-17%     -59.5%      -7929 =C2=B1-51%  sched_debug.cfs_rq:=
/.spread0.28
    -15827 =C2=B1-46%     -73.5%      -4189 =C2=B1-54%  sched_debug.cfs_rq:=
/.spread0.30
    -20549 =C2=B1-39%     -72.5%      -5651 =C2=B1-73%  sched_debug.cfs_rq:=
/.spread0.31
    -16967 =C2=B1-28%     -62.7%      -6336 =C2=B1-66%  sched_debug.cfs_rq:=
/.spread0.32
    -17327 =C2=B1 -7%     -61.1%      -6744 =C2=B1-89%  sched_debug.cfs_rq:=
/.spread0.33
    -20174 =C2=B1-15%     -58.2%      -8435 =C2=B1-41%  sched_debug.cfs_rq:=
/.spread0.36
    -28004 =C2=B1-73%     -72.6%      -7665 =C2=B1-51%  sched_debug.cfs_rq:=
/.spread0.37
    -18462 =C2=B1-21%     -38.8%     -11292 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.4
    -19841 =C2=B1-29%     -50.0%      -9922 =C2=B1-38%  sched_debug.cfs_rq:=
/.spread0.40
    -18190 =C2=B1 -7%     -43.8%     -10231 =C2=B1-28%  sched_debug.cfs_rq:=
/.spread0.41
    -20178 =C2=B1-14%     -59.4%      -8185 =C2=B1-57%  sched_debug.cfs_rq:=
/.spread0.45
    -18888 =C2=B1-11%     -55.4%      -8416 =C2=B1-44%  sched_debug.cfs_rq:=
/.spread0.46
    -21537 =C2=B1-21%     -57.4%      -9175 =C2=B1-70%  sched_debug.cfs_rq:=
/.spread0.47
    -16341 =C2=B1-14%     -93.0%      -1142 =C2=B1-867%  sched_debug.cfs_rq=
:/.spread0.48
    -18314 =C2=B1 -7%     -61.1%      -7120 =C2=B1-62%  sched_debug.cfs_rq:=
/.spread0.5
    -16238 =C2=B1-23%     -44.3%      -9040 =C2=B1-41%  sched_debug.cfs_rq:=
/.spread0.50
    -27605 =C2=B1-56%     -71.0%      -8018 =C2=B1-53%  sched_debug.cfs_rq:=
/.spread0.51
    -26365 =C2=B1-42%     -70.5%      -7781 =C2=B1-53%  sched_debug.cfs_rq:=
/.spread0.52
    -25178 =C2=B1-19%     -70.7%      -7377 =C2=B1-65%  sched_debug.cfs_rq:=
/.spread0.53
    -17872 =C2=B1-23%     -68.5%      -5635 =C2=B1-86%  sched_debug.cfs_rq:=
/.spread0.55
    -16539 =C2=B1-23%     -38.3%     -10208 =C2=B1-40%  sched_debug.cfs_rq:=
/.spread0.6
    -20649 =C2=B1-23%     -56.1%      -9069 =C2=B1-55%  sched_debug.cfs_rq:=
/.spread0.60
    -17745 =C2=B1-24%     -43.5%     -10019 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.61
    -18436 =C2=B1-32%     -71.1%      -5332 =C2=B1-144%  sched_debug.cfs_rq=
:/.spread0.62
    -20372 =C2=B1-20%     -65.8%      -6960 =C2=B1-77%  sched_debug.cfs_rq:=
/.spread0.63
    -16717 =C2=B1-17%     -61.0%      -6520 =C2=B1-79%  sched_debug.cfs_rq:=
/.spread0.64
    -19957 =C2=B1-37%     -54.3%      -9119 =C2=B1-45%  sched_debug.cfs_rq:=
/.spread0.68
    -21056 =C2=B1-11%     -63.2%      -7756 =C2=B1-90%  sched_debug.cfs_rq:=
/.spread0.69
    -30470 =C2=B1-48%     -79.6%      -6229 =C2=B1-75%  sched_debug.cfs_rq:=
/.spread0.7
    -20418 =C2=B1-14%     -54.4%      -9310 =C2=B1-42%  sched_debug.cfs_rq:=
/.spread0.70
    -20792 =C2=B1-24%     -31.8%     -14187 =C2=B1-15%  sched_debug.cfs_rq:=
/.spread0.71
    -24760 =C2=B1-19%     -37.0%     -15605 =C2=B1-30%  sched_debug.cfs_rq:=
/.spread0.74
    -25495 =C2=B1-21%     -36.9%     -16078 =C2=B1-15%  sched_debug.cfs_rq:=
/.spread0.75
    -25503 =C2=B1-16%     -56.2%     -11178 =C2=B1-24%  sched_debug.cfs_rq:=
/.spread0.76
    -32196 =C2=B1-52%     -59.9%     -12917 =C2=B1-52%  sched_debug.cfs_rq:=
/.spread0.77
    -29920 =C2=B1-29%     -59.7%     -12070 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.8
    -30688 =C2=B1-41%     -51.8%     -14805 =C2=B1-30%  sched_debug.cfs_rq:=
/.spread0.82
    -20513 =C2=B1-22%     -43.8%     -11518 =C2=B1-31%  sched_debug.cfs_rq:=
/.spread0.87
    -27216 =C2=B1-26%     -60.3%     -10800 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.88
    -26359 =C2=B1-63%    -107.2%       1904 =C2=B1875%  sched_debug.cfs_rq:=
/.spread0.9
    -30731 =C2=B1-56%     -51.6%     -14887 =C2=B1-21%  sched_debug.cfs_rq:=
/.spread0.90
    -33391 =C2=B1-47%     -58.6%     -13809 =C2=B1-10%  sched_debug.cfs_rq:=
/.spread0.91
    -20385 =C2=B1 -8%     -19.7%     -16376 =C2=B1-18%  sched_debug.cfs_rq:=
/.spread0.92
    -26920 =C2=B1-62%     -74.0%      -7005 =C2=B1-33%  sched_debug.cfs_rq:=
/.spread0.93
    -34217 =C2=B1-54%     -59.2%     -13959 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.94
    -25528 =C2=B1-52%     -48.0%     -13262 =C2=B1-31%  sched_debug.cfs_rq:=
/.spread0.95
    -25938 =C2=B1-23%     -66.5%      -8680 =C2=B1-55%  sched_debug.cfs_rq:=
/.spread0.98
    -21239 =C2=B1 -9%     -53.4%      -9900 =C2=B1-30%  sched_debug.cfs_rq:=
/.spread0.avg
    -41851 =C2=B1-30%     -52.1%     -20048 =C2=B1 -4%  sched_debug.cfs_rq:=
/.spread0.min
    104.25 =C2=B1 18%     -69.5%      31.75 =C2=B1 65%  sched_debug.cfs_rq:=
/.util_avg.113
     13.33 =C2=B1136%    +509.4%      81.25 =C2=B1 58%  sched_debug.cfs_rq:=
/.util_avg.140
    223.25 =C2=B1141%     -91.5%      19.00 =C2=B1 30%  sched_debug.cfs_rq:=
/.util_avg.45
    224.25 =C2=B1 54%     -78.4%      48.50 =C2=B1 51%  sched_debug.cfs_rq:=
/.util_avg.54
    120.00 =C2=B1 71%     -78.8%      25.50 =C2=B1116%  sched_debug.cfs_rq:=
/.util_avg.55
      7.25 =C2=B1102%   +2924.1%     219.25 =C2=B1 92%  sched_debug.cfs_rq:=
/.util_avg.60
     58.50 =C2=B1100%     -94.4%       3.25 =C2=B1173%  sched_debug.cfs_rq:=
/.util_avg.79
     65.25 =C2=B1 44%     -78.9%      13.75 =C2=B1116%  sched_debug.cfs_rq:=
/.util_avg.98
    994.50 =C2=B1  2%     -15.1%     844.00 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.max
    550561 =C2=B1 35%     +57.8%     868662 =C2=B1 26%  sched_debug.cpu.avg=
_idle.92
      6.12 =C2=B1 29%     -28.4%       4.38 =C2=B1  8%  sched_debug.cpu.clo=
ck.stddev
      6.12 =C2=B1 29%     -28.4%       4.38 =C2=B1  8%  sched_debug.cpu.clo=
ck_task.stddev
      3.32 =C2=B1 85%     -64.5%       1.18 =C2=B1 32%  sched_debug.cpu.loa=
d.avg
     27.19 =C2=B1123%     -74.7%       6.89 =C2=B1 15%  sched_debug.cpu.loa=
d.stddev
      0.00 =C2=B1 15%     -36.2%       0.00 =C2=B1 33%  sched_debug.cpu.nex=
t_balance.stddev
      0.04 =C2=B1 16%     -33.3%       0.03 =C2=B1 35%  sched_debug.cpu.nr_=
running.avg
      0.20 =C2=B1  8%     -18.9%       0.16 =C2=B1 18%  sched_debug.cpu.nr_=
running.stddev
    363.50 =C2=B1 37%     -35.1%     235.75 =C2=B1 19%  sched_debug.cpu.nr_=
switches.108
    666.00 =C2=B1 18%     -36.8%     421.00 =C2=B1 24%  sched_debug.cpu.nr_=
switches.11
    246.25 =C2=B1 16%     +67.7%     413.00 =C2=B1 19%  sched_debug.cpu.nr_=
switches.119
      1400 =C2=B1102%     -74.0%     364.75 =C2=B1  6%  sched_debug.cpu.nr_=
switches.21
    864.00 =C2=B1 15%     -42.4%     498.00 =C2=B1 20%  sched_debug.cpu.nr_=
switches.5
    652.50 =C2=B1  4%     -36.8%     412.25 =C2=B1 23%  sched_debug.cpu.nr_=
switches.57
    740.50 =C2=B1 75%     -66.3%     249.25 =C2=B1 30%  sched_debug.cpu.nr_=
switches.75
    637.75 =C2=B1 64%     -64.7%     225.25 =C2=B1 20%  sched_debug.cpu.nr_=
switches.92
    -16.00 =C2=B1-158%    -104.2%       0.67 =C2=B1187%  sched_debug.cpu.nr=
_uninterruptible.14
     -1.67 =C2=B1-149%    -160.0%       1.00 =C2=B1122%  sched_debug.cpu.nr=
_uninterruptible.17
     -6.75 =C2=B1-46%     -81.5%      -1.25 =C2=B1-34%  sched_debug.cpu.nr_=
uninterruptible.18
      1.50 =C2=B1191%    -200.0%      -1.50 =C2=B1-74%  sched_debug.cpu.nr_=
uninterruptible.26
      0.67 =C2=B1187%    -587.5%      -3.25 =C2=B1-59%  sched_debug.cpu.nr_=
uninterruptible.57
     -0.25 =C2=B1-173%    +800.0%      -2.25 =C2=B1-72%  sched_debug.cpu.nr=
_uninterruptible.58
      0.75 =C2=B1317%    -600.0%      -3.75 =C2=B1-39%  sched_debug.cpu.nr_=
uninterruptible.67
     -1.67 =C2=B1-28%    -160.0%       1.00 =C2=B1 81%  sched_debug.cpu.nr_=
uninterruptible.68
     -1.25 =C2=B1-34%     -80.0%      -0.25 =C2=B1-331%  sched_debug.cpu.nr=
_uninterruptible.69
      5.00 =C2=B1 28%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu.nr_=
uninterruptible.79
      1.75 =C2=B1 47%    -100.0%       0.00 =C2=B1  0%  sched_debug.cpu.nr_=
uninterruptible.90
    365.75 =C2=B1 37%     -35.3%     236.50 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.108
    672.25 =C2=B1 18%     -26.4%     494.50 =C2=B1 25%  sched_debug.cpu.sch=
ed_count.11
    248.00 =C2=B1 16%     +67.1%     414.50 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.119
      1497 =C2=B1 94%     -75.4%     368.25 =C2=B1  6%  sched_debug.cpu.sch=
ed_count.21
    954.00 =C2=B1 36%     -36.9%     602.25 =C2=B1 25%  sched_debug.cpu.sch=
ed_count.45
    538.75 =C2=B1 16%    +100.9%       1082 =C2=B1 59%  sched_debug.cpu.sch=
ed_count.47
    871.25 =C2=B1 15%     -42.4%     501.50 =C2=B1 20%  sched_debug.cpu.sch=
ed_count.5
      1057 =C2=B1 55%     -60.8%     414.75 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.57
    742.00 =C2=B1 75%     -66.3%     250.00 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.75
    639.25 =C2=B1 64%     -64.6%     226.25 =C2=B1 20%  sched_debug.cpu.sch=
ed_count.92
    170.25 =C2=B1 36%     -36.4%     108.25 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.108
    316.75 =C2=B1 16%     -36.5%     201.00 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.11
    114.75 =C2=B1 16%     +66.0%     190.50 =C2=B1 18%  sched_debug.cpu.sch=
ed_goidle.119
     87.00 =C2=B1 18%     +33.0%     115.75 =C2=B1 23%  sched_debug.cpu.sch=
ed_goidle.126
    370.75 =C2=B1 50%     -53.5%     172.25 =C2=B1  4%  sched_debug.cpu.sch=
ed_goidle.21
    246.50 =C2=B1 16%     +98.0%     488.00 =C2=B1 68%  sched_debug.cpu.sch=
ed_goidle.47
    420.50 =C2=B1 14%     -43.5%     237.50 =C2=B1 20%  sched_debug.cpu.sch=
ed_goidle.5
    270.25 =C2=B1 25%     -33.4%     180.00 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.55
    304.50 =C2=B1  6%     -35.6%     196.25 =C2=B1 24%  sched_debug.cpu.sch=
ed_goidle.57
    361.75 =C2=B1 76%     -68.1%     115.50 =C2=B1 29%  sched_debug.cpu.sch=
ed_goidle.75
     40.25 =C2=B1 26%    +614.3%     287.50 =C2=B1118%  sched_debug.cpu.ttw=
u_count.119
     41.50 =C2=B1 58%    +197.0%     123.25 =C2=B1 89%  sched_debug.cpu.ttw=
u_count.133
    917.25 =C2=B1 69%     -83.7%     149.50 =C2=B1 78%  sched_debug.cpu.ttw=
u_count.22
    187.50 =C2=B1 82%    +545.7%       1210 =C2=B1 78%  sched_debug.cpu.ttw=
u_count.36
    178.75 =C2=B1 27%    +228.0%     586.25 =C2=B1 91%  sched_debug.cpu.ttw=
u_count.44
    133.75 =C2=B1 56%    +212.5%     418.00 =C2=B1 74%  sched_debug.cpu.ttw=
u_count.47
    107.25 =C2=B1 29%    +434.3%     573.00 =C2=B1 58%  sched_debug.cpu.ttw=
u_count.48
     25.25 =C2=B1 19%     +36.6%      34.50 =C2=B1 16%  sched_debug.cpu.ttw=
u_count.88
     25.25 =C2=B1 30%     -42.6%      14.50 =C2=B1 14%  sched_debug.cpu.ttw=
u_local.110
     19.50 =C2=B1 20%     +43.6%      28.00 =C2=B1 23%  sched_debug.cpu.ttw=
u_local.117
    377.00 =C2=B1139%     -92.7%      27.50 =C2=B1 10%  sched_debug.cpu.ttw=
u_local.21
     30.00 =C2=B1 46%    +104.2%      61.25 =C2=B1 44%  sched_debug.cpu.ttw=
u_local.36
    151.25 =C2=B1 39%     -71.6%      43.00 =C2=B1 21%  sched_debug.cpu.ttw=
u_local.45
     40.25 =C2=B1 43%     +87.0%      75.25 =C2=B1 27%  sched_debug.cpu.ttw=
u_local.48
      0.00 =C2=B1 23%     -61.7%       0.00 =C2=B1106%  sched_debug.rt_rq:/=
.rt_time.stddev


lkp-hsx02: Brickland Haswell-EX
Memory: 128G

lkp-hsx04: Brickland Haswell-EX
Memory: 512G


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

--===============8541904010477528580==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3RhdDog
CiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJv
Yy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNs
YWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAog
IHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDog
CiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAog
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1h
bmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0
OiBmYmNjMDI1NjEzNTkwZDdiMWQxNTUyMTU1NWRjYzYzOTNhMTQ4YTZiCm1vZGVsOiBCcmlja2xh
bmQgSGFzd2VsbC1FWApucl9jcHU6IDEyMAptZW1vcnk6IDUxMkcKaGRkX3BhcnRpdGlvbnM6IApz
d2FwX3BhcnRpdGlvbnM6IApwbWV0ZXJfc2VydmVyOiBsa3Atc3QwMQpwbWV0ZXJfZGV2aWNlOiB5
b2tvZ2F3YS13dDMxMApjYXRlZ29yeTogYmVuY2htYXJrCml0ZXJhdGlvbnM6IDF4Cm5yX3RocmVh
ZHM6IDF0CmRpc2s6IDFCUkRfNDhHCm5lZWRfbWVtb3J5OiA1MEcKZnM6IHhmcwpmczI6IApmc21h
cms6CiAgZmlsZXNpemU6IDRNCiAgdGVzdF9zaXplOiA0MEcKICBzeW5jX21ldGhvZDogZnN5bmNC
ZWZvcmVDbG9zZQpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1oc3gwNAp0Ym94X2dyb3VwOiBs
a3AtaHN4MDQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAyLTE3IDIx
OjQ4OjE0Ljc2MDM4MDU3MyArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiAyMDMwYzcyNzI5NmE5MGVmMDczZDM0YmYzMzgxNjMx
NDJhOTRlYmI0CnVzZXI6IGxrcApoZWFkX2NvbW1pdDogZjdkMzE3NTNjNGQ3MGMxMmUyOTBkZTIw
MmJlOTBkZjA3ZjdmNmRlZQpiYXNlX2NvbW1pdDogMTg1NThjYWUwMjcyZjhmZDk2NDdlNjlkM2Zl
YzE1NjVhNzk0OTg2NQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDIxNzA5
CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMXQtMUJSRF80OEct
eGZzLTRNLTQwRy1mc3luY0JlZm9yZUNsb3NlL2xrcC1oc3gwNC9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvZmJjYzAyNTYxMzU5MGQ3YjFkMTU1MjE1NTVk
Y2M2MzkzYTE0OGE2Yi8xIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1oc3gwNC9iaXNl
Y3RfZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTF0LTFCUkRfNDhHLXhmcy00TS00MEctZnN5bmNCZWZv
cmVDbG9zZS1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWZiY2MwMjU2
MTM1OTBkN2IxZDE1NTIxNTU1ZGNjNjM5M2ExNDhhNmItMjAxNjAyMTctNTE2ODMtOWlsam9uLTEu
eWFtbCIKbWF4X3VwdGltZTogNzc3LjQ4CmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFt
MAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1oc3gwNC9iaXNlY3RfZnNtYXJr
LXBlcmZvcm1hbmNlLTF4LTF0LTFCUkRfNDhHLXhmcy00TS00MEctZnN5bmNCZWZvcmVDbG9zZS1k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWZiY2MwMjU2MTM1OTBkN2Ix
ZDE1NTIxNTU1ZGNjNjM5M2ExNDhhNmItMjAxNjAyMTctNTE2ODMtOWlsam9uLTEueWFtbAotIEFS
Q0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZl
bC1ob3VybHktMjAxNjAyMTcwOQotIGNvbW1pdD1mYmNjMDI1NjEzNTkwZDdiMWQxNTUyMTU1NWRj
YzYzOTNhMTQ4YTZiCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00Ljkv
ZmJjYzAyNTYxMzU5MGQ3YjFkMTU1MjE1NTVkY2M2MzkzYTE0OGE2Yi92bWxpbnV6LTQuNS4wLXJj
Mi0wMDAwMy1nZmJjYzAyNQotIG1heF91cHRpbWU9Nzc3Ci0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9m
c21hcmsvcGVyZm9ybWFuY2UtMXgtMXQtMUJSRF80OEcteGZzLTRNLTQwRy1mc3luY0JlZm9yZUNs
b3NlL2xrcC1oc3gwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2dj
Yy00LjkvZmJjYzAyNTYxMzU5MGQ3YjFkMTU1MjE1NTVkY2M2MzkzYTE0OGE2Yi8xCi0gTEtQX1NF
UlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19s
ZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRl
LnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEg
bm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRp
c2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3
CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIv
cGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZmJjYzAyNTYxMzU5MGQ3YjFkMTU1MjE1NTVk
Y2M2MzkzYTE0OGE2Yi9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJv
c3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzLmNn
eiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMyLmNneiwvbGtw
L2JlbmNobWFya3MvZnNtYXJrLmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtnL2xpbnV4
L3g4Nl82NC1yaGVsL2djYy00LjkvZmJjYzAyNTYxMzU5MGQ3YjFkMTU1MjE1NTVkY2M2MzkzYTE0
OGE2Yi9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS9mYmNjMDI1NjEzNTkwZDdiMWQxNTUyMTU1NWRjYzYzOTNhMTQ4
YTZiL3ZtbGludXotNC41LjAtcmMyLTAwMDAzLWdmYmNjMDI1IgpkZXF1ZXVlX3RpbWU6IDIwMTYt
MDItMTcgMjI6MDk6MDIuNTcyNTExODE0ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRh
dmc6IDAuNzkgMC4yNyAwLjEwIDIvMTMyMCAzOTI3CnN0YXJ0X3RpbWU6ICcxNDU1NzE4MjA0Jwpl
bmRfdGltZTogJzE0NTU3MTgyNDYnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMjE3LTE4
MzkyNiIK

--===============8541904010477528580==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAxL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
Mi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTIvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
Mi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
Mi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
Mi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyNi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMxL2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0x
NyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNDIvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0x
NyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAy
MjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTgv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE5L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4
OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0
IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMy9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0x
NyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMxL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzMi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAy
MjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM0L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzNS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjow
ODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzOC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODox
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTQwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTQ2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcg
MjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ5
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjow
ODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTEvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODox
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTQvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTcvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTYxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Mi9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcg
MjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY0
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6
MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY3L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6
MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTczL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzgvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3
IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1ODEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6
MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6
MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1ODcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTE3IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU5Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTk0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3
IDIyOjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDItMTcgMjI6MDg6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTE3IDIy
OjA4OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5OC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0xNyAyMjowODoxNCBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDItMTcgMjI6MDg6MTUgbWtmcyAtdCB4ZnMgL2Rldi9yYW0wCjIwMTYtMDItMTcg
MjI6MDg6MTUgbW91bnQgLXQgeGZzIC1vIG5vYmFycmllcixpbm9kZTY0IC9kZXYvcmFtMCAvZnMv
cmFtMAoyMDE2LTAyLTE3IDIyOjA4OjE2IC4vZnNfbWFyayAtZCAvZnMvcmFtMC8xIC1uIDEwMjQw
IC1MIDEgLVMgMSAtcyA0MTk0MzA0Cg==

--===============8541904010477528580==--

