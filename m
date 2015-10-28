Content-Type: multipart/mixed; boundary="===============8144988203974606613=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 1746babbb1: +2.3% unixbench.score
Date: Wed, 28 Oct 2015 13:46:54 +0800
Message-ID: <87d1vzpmsx.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8144988203974606613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 1746babbb15594ba2d8d8196589bbbc2b5ff51c9 ("sched/fair: Have task_mov=
e_group_fair() also detach entity load from the old runqueue")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lituya/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perform=
ance/shell8

commit: =

  50a2a3b246149d041065a67ccb3e98145f780a2f
  1746babbb15594ba2d8d8196589bbbc2b5ff51c9

50a2a3b246149d04 1746babbb15594ba2d8d819658 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     25166 =C2=B1  0%      +2.3%      25756 =C2=B1  0%  unixbench.score
   9026404 =C2=B1  0%      +3.9%    9376242 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
 4.683e+08 =C2=B1  0%      +1.8%  4.765e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    949.00 =C2=B1  0%      +3.0%     977.25 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
      2286 =C2=B1  0%      +2.8%       2349 =C2=B1  0%  unixbench.time.syst=
em_time
      1305 =C2=B1  0%      +3.3%       1348 =C2=B1  0%  unixbench.time.user=
_time
     31346 =C2=B1  8%     -10.7%      27987 =C2=B1  1%  cpuidle.POLL.time
      2679 =C2=B1  8%    +179.4%       7486 =C2=B1 40%  latency_stats.max.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.sync_inodes_sb.sy=
nc_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fastpath
    107334 =C2=B1 22%    +251.7%     377450 =C2=B1 37%  latency_stats.sum.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.vfs_fstatat.=
SYSC_newstat.SyS_newstat.entry_SYSCALL_64_fastpath
    979.25 =C2=B1  1%     +17.5%       1150 =C2=B1  2%  slabinfo.files_cach=
e.active_objs
    979.25 =C2=B1  1%     +17.5%       1150 =C2=B1  2%  slabinfo.files_cach=
e.num_objs
     33.25 =C2=B1  1%     +14.3%      38.00 =C2=B1  0%  vmstat.procs.r
     25287 =C2=B1  0%      +5.2%      26600 =C2=B1  0%  vmstat.system.in
     61.09 =C2=B1  0%      +2.9%      62.85 =C2=B1  0%  turbostat.%Busy
      2011 =C2=B1  0%      +2.9%       2069 =C2=B1  0%  turbostat.Avg_MHz
      2.58 =C2=B1  2%     -10.4%       2.32 =C2=B1  4%  turbostat.CPU%c3
      1.16 =C2=B1 28%     +30.9%       1.52 =C2=B1  0%  turbostat.RAMWatt
   1363139 =C2=B1  2%    +390.2%    6682436 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    508.25 =C2=B1 35%     -30.8%     351.50 =C2=B1  8%  sched_debug.cfs_rq[=
0]:/.tg_load_avg_contrib
   1483779 =C2=B1  3%    +248.1%    5164998 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.min_vruntime
    120613 =C2=B1 52%   -1358.2%   -1517619 =C2=B1-26%  sched_debug.cfs_rq[=
10]:/.spread0
   1481440 =C2=B1  3%    +243.7%    5092246 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.min_vruntime
    118271 =C2=B1 54%   -1444.7%   -1590395 =C2=B1-26%  sched_debug.cfs_rq[=
11]:/.spread0
   1455329 =C2=B1  0%    +252.8%    5133998 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     92159 =C2=B1 30%   -1780.4%   -1548645 =C2=B1-27%  sched_debug.cfs_rq[=
12]:/.spread0
    536.00 =C2=B1 18%     -24.9%     402.50 =C2=B1 18%  sched_debug.cfs_rq[=
13]:/.load_avg
   1451734 =C2=B1  0%    +254.5%    5146739 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     88561 =C2=B1 34%   -1834.3%   -1535905 =C2=B1-24%  sched_debug.cfs_rq[=
13]:/.spread0
    326.25 =C2=B1 21%     +73.2%     565.00 =C2=B1 20%  sched_debug.cfs_rq[=
14]:/.load_avg
   1479346 =C2=B1  3%    +246.9%    5132386 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     47.67 =C2=B1141%    +472.7%     273.00 =C2=B1 42%  sched_debug.cfs_rq[=
14]:/.removed_load_avg
     46.00 =C2=B1141%    +467.9%     261.25 =C2=B1 47%  sched_debug.cfs_rq[=
14]:/.removed_util_avg
    116171 =C2=B1 55%   -1434.5%   -1550271 =C2=B1-25%  sched_debug.cfs_rq[=
14]:/.spread0
    777.75 =C2=B1  9%     +35.8%       1056 =C2=B1 14%  sched_debug.cfs_rq[=
14]:/.util_avg
   1451847 =C2=B1  0%    +252.2%    5113656 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     88669 =C2=B1 29%   -1869.5%   -1569030 =C2=B1-28%  sched_debug.cfs_rq[=
15]:/.spread0
   1346003 =C2=B1  0%    +413.1%    6906332 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    347.50 =C2=B1  3%     -10.0%     312.75 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg_load_avg_contrib
   1362040 =C2=B1  2%    +408.4%    6924492 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.min_vruntime
   1363305 =C2=B1  2%    +394.7%    6744667 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      1.50 =C2=B1100%    +400.0%       7.50 =C2=B1 22%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
   1346931 =C2=B1  0%    +398.4%    6712511 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.min_vruntime
   1345064 =C2=B1  0%    +416.2%    6942624 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     36.00 =C2=B1  9%     -36.1%      23.00 =C2=B1 21%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
    -18089 =C2=B1-155%   -1537.8%     260083 =C2=B1142%  sched_debug.cfs_rq=
[5]:/.spread0
   1362865 =C2=B1  2%    +405.4%    6887733 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.min_vruntime
   1343531 =C2=B1  0%    +397.9%    6689576 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     45.75 =C2=B1 22%     -51.9%      22.00 =C2=B1 50%  sched_debug.cfs_rq[=
8]:/.load
   1479661 =C2=B1  3%    +246.4%    5125934 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.min_vruntime
    116500 =C2=B1 18%   -1436.2%   -1556673 =C2=B1-22%  sched_debug.cfs_rq[=
8]:/.spread0
     37.50 =C2=B1 28%     -50.7%      18.50 =C2=B1 60%  sched_debug.cfs_rq[=
9]:/.load
   1453951 =C2=B1  0%    +254.7%    5156506 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     90788 =C2=B1 30%   -1780.9%   -1526106 =C2=B1-25%  sched_debug.cfs_rq[=
9]:/.spread0
    258966 =C2=B1 12%     +33.3%     345105 =C2=B1 12%  sched_debug.cpu#12.=
avg_idle
      0.25 =C2=B1173%    +800.0%       2.25 =C2=B1 57%  sched_debug.cpu#14.=
nr_running
    216317 =C2=B1 17%     +28.8%     278519 =C2=B1 11%  sched_debug.cpu#4.a=
vg_idle
   -210.00 =C2=B1 -3%     +15.5%    -242.50 =C2=B1 -8%  sched_debug.cpu#5.n=
r_uninterruptible
    182159 =C2=B1 15%     +54.5%     281450 =C2=B1 12%  sched_debug.cpu#6.a=
vg_idle
     40.25 =C2=B1 33%     -32.3%      27.25 =C2=B1 23%  sched_debug.cpu#7.c=
pu_load[2]
     41.50 =C2=B1 17%     -67.5%      13.50 =C2=B1 64%  sched_debug.cpu#9.l=
oad

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white2/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/she=
ll8

commit: =

  50a2a3b246149d041065a67ccb3e98145f780a2f
  1746babbb15594ba2d8d8196589bbbc2b5ff51c9

50a2a3b246149d04 1746babbb15594ba2d8d819658 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1319 =C2=B1  0%      +1.4%       1337 =C2=B1  0%  unixbench.time.syst=
em_time
    856.00 =C2=B1  0%      +1.3%     867.52 =C2=B1  0%  unixbench.time.user=
_time
  31791175 =C2=B1141%     -34.2%   20924107 =C2=B1 51%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
      4.97 =C2=B1  4%      -9.7%       4.48 =C2=B1  5%  turbostat.CPU%c3
   1739900 =C2=B1  3%     +23.5%    2148246 =C2=B1  7%  cpuidle.C1-NHM.usage
     26162 =C2=B1  4%     +33.4%      34904 =C2=B1  7%  cpuidle.POLL.usage
    882905 =C2=B1  7%    +514.3%    5423689 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    878971 =C2=B1  6%    +539.3%    5618859 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     -3940 =C2=B1-545%   -5052.2%     195127 =C2=B1120%  sched_debug.cfs_rq=
[1]:/.spread0
     95.00 =C2=B1  8%     -43.2%      54.00 =C2=B1 42%  sched_debug.cfs_rq[=
2]:/.load
    878054 =C2=B1  6%    +507.4%    5333052 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    878105 =C2=B1  5%    +524.5%    5483875 =C2=B1  6%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    883009 =C2=B1  7%    +423.6%    4623117 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     87.47 =C2=B14504%  -9.2e+05%    -800722 =C2=B1-23%  sched_debug.cfs_rq=
[4]:/.spread0
    880682 =C2=B1  7%    +432.6%    4690114 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      6.75 =C2=B1 16%     +85.2%      12.50 =C2=B1 25%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
     -2242 =C2=B1-737%  +32626.7%    -733759 =C2=B1-40%  sched_debug.cfs_rq=
[5]:/.spread0
    883065 =C2=B1  7%    +416.0%    4556427 =C2=B1  7%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    138.28 =C2=B114053%  -6.3e+05%    -867453 =C2=B1-44%  sched_debug.cfs_r=
q[6]:/.spread0
    884890 =C2=B1  5%    +419.8%    4599371 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      7.50 =C2=B1 35%     +60.0%      12.00 =C2=B1 30%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
      1960 =C2=B1821%  -42164.6%    -824542 =C2=B1-45%  sched_debug.cfs_rq[=
7]:/.spread0
   -186.50 =C2=B1-16%     -40.6%    -110.75 =C2=B1-13%  sched_debug.cpu#0.n=
r_uninterruptible
     91.00 =C2=B1 23%     -38.7%      55.75 =C2=B1 28%  sched_debug.cpu#2.l=
oad
    400614 =C2=B1  7%     -30.4%     278901 =C2=B1 27%  sched_debug.cpu#6.a=
vg_idle
    323918 =C2=B1 45%     +96.5%     636444 =C2=B1 64%  sched_debug.cpu#6.s=
ched_goidle
      0.41 =C2=B1 69%   +3122.5%      13.28 =C2=B1163%  sched_debug.rt_rq[0=
]:/.rt_time

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/shel=
l8

commit: =

  50a2a3b246149d041065a67ccb3e98145f780a2f
  1746babbb15594ba2d8d8196589bbbc2b5ff51c9

50a2a3b246149d04 1746babbb15594ba2d8d819658 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    563.50 =C2=B1  3%      +3.3%     582.25 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
      1318 =C2=B1  0%      +1.5%       1338 =C2=B1  0%  unixbench.time.syst=
em_time
    854.73 =C2=B1  0%      +1.3%     866.10 =C2=B1  0%  unixbench.time.user=
_time
   6687472 =C2=B1  0%      -1.3%    6602598 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
      5085 =C2=B1  2%    +143.2%      12369 =C2=B1 58%  latency_stats.max.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
   1878596 =C2=B1  4%     +13.2%    2127099 =C2=B1  6%  cpuidle.C1-NHM.usage
    191783 =C2=B1  4%     +38.6%     265815 =C2=B1 18%  cpuidle.POLL.time
     24853 =C2=B1  2%     +42.7%      35470 =C2=B1  8%  cpuidle.POLL.usage
     72.67 =C2=B1  3%      +3.5%      75.22 =C2=B1  0%  turbostat.%Busy
      2123 =C2=B1  3%      +3.5%       2197 =C2=B1  0%  turbostat.Avg_MHz
      5.22 =C2=B1  3%      -8.9%       4.75 =C2=B1  0%  turbostat.CPU%c3
    441.00 =C2=B1 16%     -23.0%     339.75 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.load_avg
    908244 =C2=B1  5%    +503.6%    5481834 =C2=B1  6%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     10.75 =C2=B1 13%     +53.5%      16.50 =C2=B1 20%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
    910039 =C2=B1  5%    +512.9%    5577184 =C2=B1  3%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    915823 =C2=B1  4%    +523.4%    5709506 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    544.25 =C2=B1 10%     -24.3%     412.00 =C2=B1 14%  sched_debug.cfs_rq[=
3]:/.load_avg
    911018 =C2=B1  5%    +495.7%    5427014 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.min_vruntime
      8.00 =C2=B1 34%     +46.9%      11.75 =C2=B1 11%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
    193.00 =C2=B1 31%     -65.3%      67.00 =C2=B1100%  sched_debug.cfs_rq[=
3]:/.removed_load_avg
    190.25 =C2=B1 29%     -64.8%      67.00 =C2=B1100%  sched_debug.cfs_rq[=
3]:/.removed_util_avg
      1111 =C2=B1  7%     -10.0%       1000 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.util_avg
    912227 =C2=B1  5%    +415.3%    4700282 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
      3970 =C2=B1 50%  -19783.8%    -781587 =C2=B1-36%  sched_debug.cfs_rq[=
4]:/.spread0
    917396 =C2=B1  5%    +410.3%    4681186 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      9137 =C2=B1125%   -8862.6%    -800697 =C2=B1-52%  sched_debug.cfs_rq[=
5]:/.spread0
    923564 =C2=B1  4%    +417.5%    4779073 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     15304 =C2=B1 75%   -4692.4%    -702818 =C2=B1-46%  sched_debug.cfs_rq[=
6]:/.spread0
    916876 =C2=B1  5%    +405.9%    4638348 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      8613 =C2=B1 95%   -9893.4%    -843599 =C2=B1-48%  sched_debug.cfs_rq[=
7]:/.spread0
     91.00 =C2=B1 13%    +123.9%     203.75 =C2=B1 51%  sched_debug.cpu#0.l=
oad
   -194.75 =C2=B1-18%     -47.5%    -102.25 =C2=B1-49%  sched_debug.cpu#0.n=
r_uninterruptible
     85.50 =C2=B1 17%     +94.2%     166.00 =C2=B1 31%  sched_debug.cpu#1.l=
oad
      1.00 =C2=B1122%    +200.0%       3.00 =C2=B1 33%  sched_debug.cpu#1.n=
r_running
   -152.50 =C2=B1-19%     -43.1%     -86.75 =C2=B1-39%  sched_debug.cpu#1.n=
r_uninterruptible
     13309 =C2=B1 24%     -42.6%       7642 =C2=B1 34%  sched_debug.cpu#2.c=
urr->pid
   2535607 =C2=B1 57%     -58.2%    1061081 =C2=B1  0%  sched_debug.cpu#2.n=
r_switches
   -174.50 =C2=B1-29%     -63.2%     -64.25 =C2=B1-29%  sched_debug.cpu#2.n=
r_uninterruptible
   2536010 =C2=B1 57%     -58.1%    1061543 =C2=B1  0%  sched_debug.cpu#2.s=
ched_count
    601197 =C2=B1 44%     -49.3%     304897 =C2=B1  0%  sched_debug.cpu#2.s=
ched_goidle
    203.75 =C2=B1  4%     -70.2%      60.75 =C2=B1 26%  sched_debug.cpu#4.n=
r_uninterruptible
     77.25 =C2=B1  5%     -16.8%      64.25 =C2=B1  9%  sched_debug.cpu#5.c=
pu_load[2]
     79.00 =C2=B1  6%     -19.0%      64.00 =C2=B1  7%  sched_debug.cpu#5.c=
pu_load[3]
     78.25 =C2=B1  7%     -16.0%      65.75 =C2=B1  6%  sched_debug.cpu#5.c=
pu_load[4]
     85.50 =C2=B1 12%     -28.1%      61.50 =C2=B1  9%  sched_debug.cpu#7.c=
pu_load[1]
     83.25 =C2=B1 10%     -26.1%      61.50 =C2=B1 13%  sched_debug.cpu#7.c=
pu_load[2]
     78.25 =C2=B1  7%     -20.8%      62.00 =C2=B1 12%  sched_debug.cpu#7.c=
pu_load[3]
     75.75 =C2=B1  4%     -15.2%      64.25 =C2=B1  7%  sched_debug.cpu#7.c=
pu_load[4]
   1390226 =C2=B1 60%     +56.0%    2168907 =C2=B1 57%  sched_debug.cpu#7.n=
r_switches
   1390620 =C2=B1 60%     +56.0%    2169299 =C2=B1 57%  sched_debug.cpu#7.s=
ched_count
    370003 =C2=B1 57%     +59.8%     591403 =C2=B1 56%  sched_debug.cpu#7.s=
ched_goidle
    614114 =C2=B1 68%     +62.3%     996936 =C2=B1 63%  sched_debug.cpu#7.t=
twu_count
    431156 =C2=B1 97%     +87.5%     808605 =C2=B1 78%  sched_debug.cpu#7.t=
twu_local
      6.61 =C2=B1157%     -99.9%       0.01 =C2=B1 83%  sched_debug.rt_rq[6=
]:/.rt_time

lituya: Grantley Haswell
Memory: 16G

nhm-white2: Nehalem
Memory: 4G

nhm-white: Nehalem
Memory: 6G


                            unixbench.time.system_time

  1400 ++------------------------------------------------------------------=
-+
       O  O O  O O    O  O O  O    O    O  O O  O                          =
 |
  1380 ++           O            O    O                                    =
 |
  1360 ++                                                                  =
 |
       |                                                                   =
 |
  1340 ++                                               O O  O O  O      O =
 |
       |                                          O  O              O  O   =
 |
  1320 ++                                                           *..*.*.=
.*
       |                                                            :      =
 |
  1300 ++                                                          :       =
 |
  1280 ++                                                          :       =
 |
       *..*.*..*.*..*.*..*.*..*..                              *..*        =
 |
  1260 ++                        *.*..*.*..*.  .*.            +            =
 |
       |                                     *.   *..*..*.*..*             =
 |
  1240 ++------------------------------------------------------------------=
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

--===============8144988203974606613==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiAKZGVmYXVsdC13YXRjaGRvZ3M6
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IGU0ODE2ZWY2MzMyN2FlN2NkYmUw
M2ZlNGZkMDVjMmY3NTAxYmUwNGYKbW9kZWw6IE5laGFsZW0KbWVtb3J5OiA0Rwpucl9jcHU6IDgK
aGRkX3BhcnRpdGlvbnM6IApzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKbmV0
Y29uc29sZV9wb3J0OiA2NjcxCmNhdGVnb3J5OiBiZW5jaG1hcmsKdW5peGJlbmNoOgogIHRlc3Q6
IHNoZWxsOApxdWV1ZTogY3ljbGljCnRlc3Rib3g6IG5obS13aGl0ZTIKdGJveF9ncm91cDogbmht
LXdoaXRlMgprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMTAtMjQgMDc6
MTY6MzIuNDM0ODkwMDk5ICswODowMAppZDogMzJlYmIyMzMxYjdmYjg5ZmVkN2FkMDRiOTI0Nzk2
NjY4MWI5ZGIxOAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6IGU0ODE2
ZWY2MzMyN2FlN2NkYmUwM2ZlNGZkMDVjMmY3NTAxYmUwNGYKYmFzZV9jb21taXQ6IDczNzkwNDdk
NTU4NTE4N2QxMjg4NDg2ZDQ2Mjc4NzMxNzBkMDAwNWEKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZl
bC1ob3VybHktMjAxNTEwMjQwMwprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvZTQ4MTZlZjYzMzI3YWU3Y2RiZTAzZmU0ZmQwNWMyZjc1MDFiZTA0Zi92bWxpbnV6LTQuMy4w
LXJjNi12aXJ0aW8tZ3B1LTA5ODIzLWdlNDgxNmVmIgpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3VuaXhiZW5jaC9zaGVsbDgvbmhtLXdo
aXRlMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvZTQ4
MTZlZjYzMzI3YWU3Y2RiZTAzZmU0ZmQwNWMyZjc1MDFiZTA0Zi8wIgpqb2JfZmlsZTogIi9sa3Av
c2NoZWR1bGVkL25obS13aGl0ZTIvY3ljbGljX3VuaXhiZW5jaC1zaGVsbDgteDg2XzY0LXJoZWwt
Q1lDTElDX0hFQUQtZTQ4MTZlZjYzMzI3YWU3Y2RiZTAzZmU0ZmQwNWMyZjc1MDFiZTA0Zi0yMDE1
MTAyNC01NTIyMi03N2MyOHctMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMTAtMjQgMDg6MTY6
MTAuMzQ3MjYzOTM5ICswODowMAptYXhfdXB0aW1lOiAxNDA2LjI0MDAwMDAwMDAwMDIKaW5pdHJk
OiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2Fk
ZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVs
ZWQvbmhtLXdoaXRlMi9jeWNsaWNfdW5peGJlbmNoLXNoZWxsOC14ODZfNjQtcmhlbC1DWUNMSUNf
SEVBRC1lNDgxNmVmNjMzMjdhZTdjZGJlMDNmZTRmZDA1YzJmNzUwMWJlMDRmLTIwMTUxMDI0LTU1
MjIyLTc3YzI4dy0wLnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBi
cmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTUxMDI0MDMKLSBjb21taXQ9ZTQ4MTZl
ZjYzMzI3YWU3Y2RiZTAzZmU0ZmQwNWMyZjc1MDFiZTA0ZgotIEJPT1RfSU1BR0U9L3BrZy9saW51
eC94ODZfNjQtcmhlbC9nY2MtNC45L2U0ODE2ZWY2MzMyN2FlN2NkYmUwM2ZlNGZkMDVjMmY3NTAx
YmUwNGYvdm1saW51ei00LjMuMC1yYzYtdmlydGlvLWdwdS0wOTgyMy1nZTQ4MTZlZgotIG1heF91
cHRpbWU9MTQwNgotIFJFU1VMVF9ST09UPS9yZXN1bHQvdW5peGJlbmNoL3NoZWxsOC9uaG0td2hp
dGUyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9lNDgx
NmVmNjMzMjdhZTdjZGJlMDNmZTRmZDA1YzJmNzUwMWJlMDRmLzAKLSBMS1BfU0VSVkVSPWlubgot
IHwyLQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgog
IGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9z
dGFsbF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hk
b2c9cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29u
c29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRy
ZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS9lNDgxNmVmNjMzMjdhZTdjZGJlMDNmZTRmZDA1YzJmNzUwMWJl
MDRmL21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwv
bGtwL2JlbmNobWFya3MvdW5peGJlbmNoLmNneiIKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZn
OiA0Mi42NyAyMS44NiA4Ljk4IDEvMTUwIDIwMzY0CnN0YXJ0X3RpbWU6ICcxNDQ1NjQ1Nzk1Jwpl
bmRfdGltZTogJzE0NDU2NDYxNzMnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUxMDIzLTE5
MDUwNSIK

--===============8144988203974606613==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9SdW4gc2hlbGw4Cg==

--===============8144988203974606613==--

