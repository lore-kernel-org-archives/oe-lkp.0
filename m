Content-Type: multipart/mixed; boundary="===============6828385305931651436=="
MIME-Version: 1.0
From: Carel Si <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 32678f1513: aim7.jobs-per-min -5.6% regression
Date: Sat, 07 May 2022 19:09:46 +0800
Message-ID: <20220507110941.GA10880@linux.intel.com>
In-Reply-To: <20220506212924.GJ1098723@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============6828385305931651436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sat, May 07, 2022 at 07:29:24AM +1000, Dave Chinner wrote:
> On Fri, May 06, 2022 at 05:22:50PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -5.6% regression of aim7.jobs-per-min due to commit:
> > =

> > =

> > commit: 32678f151338b9a321e9e27139a63c81f353acb7 ("[PATCH 1/4] xfs: det=
ect self referencing btree sibling pointers")
> > url: https://github.com/intel-lab-lkp/linux/commits/Dave-Chinner/xfs-fi=
x-random-format-verification-issues/20220502-162206
> > base: https://git.kernel.org/cgit/fs/xfs/xfs-linux.git for-next
> > patch link: https://lore.kernel.org/linux-xfs/20220502082018.1076561-2-=
david(a)fromorbit.com
> =

> Well, that answers the concern I had about the impact of =

> changing the way endian conversions were done in that patch.
> =

> > a44a027a8b2a20fe 32678f151338b9a321e9e27139a =

> > ---------------- --------------------------- =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >     464232            -5.6%     438315        aim7.jobs-per-min
> ....
> >       0.13 =C2=B1  5%      +0.2        0.33 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__xfs_btree_check_sblock
> ....
> >       0.11 =C2=B1  4%      +0.2        0.30 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.__xfs_btree_check_sblock
> =

> Because there is it, right at the bottom of the profile.
> =

> Can you try the patch below and see if that fixes the issue?

We tested below patch, it didn't fix the issue, still has -6.4% regression =
[1] =

comparing to a44a027a8b ("Merge tag 'large-extent-counters-v9' of =

https://github.com/chandanr/linux into xfs-5.19-for-next"). =


Dmesg file is attached.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/te=
stcase/ucode:
  gcc-11/performance/4BRD_12G/xfs/x86_64-rhel-8.3/3000/RAID0/debian-10.4-x8=
6_64-20200603.cgz/lkp-csl-2sp9/disk_wrt/aim7/0x500320a

commit: =

  a44a027a8b ("Merge tag 'large-extent-counters-v9' of https://github.com/c=
handanr/linux into xfs-5.19-for-next")
  32678f1513 ("xfs: detect self referencing btree sibling pointers")
  92a8f471fa ("fixup-for-32678f1513")

a44a027a8b2a20fe 32678f151338b9a321e9e27139a 92a8f471fa024e1a303b0595fb9 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    464232            -5.6%     438315            -6.4%     434563        a=
im7.jobs-per-min
...
      0.13 =C2=B1  5%      +0.2        0.33 =C2=B1  6%      +0.2        0.3=
2 =C2=B1  2%  perf-profile.children.cycles-pp.__xfs_btree_check_sblock
...
      0.11 =C2=B1  4%      +0.2        0.30 =C2=B1  5%      +0.2        0.2=
9        perf-profile.self.cycles-pp.__xfs_btree_check_sblock

[1]

a44a027a8b2a20fe 32678f151338b9a321e9e27139a 92a8f471fa024e1a303b0595fb9 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    464232            -5.6%     438315            -6.4%     434563        a=
im7.jobs-per-min
    702.64            +2.9%     723.04            +3.9%     730.36        a=
im7.time.system_time
     20.61            -3.7%      19.84            -2.9%      20.00        i=
ostat.cpu.system
     10.13 =C2=B1111%     -13.0%       8.81 =C2=B1 97%      -1.0%      10.0=
3 =C2=B1 74%  perf-stat.i.MPKI
 8.246e+09            -3.9%  7.924e+09            -4.1%  7.907e+09        p=
erf-stat.i.branch-instructions
      1.44 =C2=B1 64%      -0.1        1.34 =C2=B1 54%      +0.1        1.5=
2 =C2=B1 46%  perf-stat.i.branch-miss-rate%
  34854794 =C2=B1  5%      -4.2%   33387833 =C2=B1  3%      -1.9%   3420978=
7 =C2=B1  3%  perf-stat.i.branch-misses
     23.30 =C2=B1  3%      +1.6       24.86 =C2=B1  8%      +0.1       23.3=
6 =C2=B1  4%  perf-stat.i.cache-miss-rate%
  23053543 =C2=B1  2%      -6.0%   21668177            -4.9%   21931373 =C2=
=B1  3%  perf-stat.i.cache-misses
  86799897 =C2=B1  8%      -6.0%   81632955 =C2=B1  8%      -2.2%   8487462=
9 =C2=B1  8%  perf-stat.i.cache-references
     46885            -4.6%      44714            -5.4%      44356        p=
erf-stat.i.context-switches
      1.99 =C2=B1 24%      -2.2%       1.95 =C2=B1 17%      -0.5%       1.9=
8 =C2=B1 18%  perf-stat.i.cpi
     88032            -0.0%      88025            -0.0%      88021        p=
erf-stat.i.cpu-clock
 5.425e+10            -2.6%  5.285e+10            -2.1%  5.311e+10 =C2=B1  =
2%  perf-stat.i.cpu-cycles
      1424            -8.9%       1296            -9.1%       1294        p=
erf-stat.i.cpu-migrations
      3054 =C2=B1 17%     -12.8%       2664 =C2=B1 12%      -5.5%       288=
6 =C2=B1 13%  perf-stat.i.cycles-between-cache-misses
      0.08 =C2=B1133%      +0.0        0.10 =C2=B1 83%      +0.0        0.0=
9 =C2=B1 91%  perf-stat.i.dTLB-load-miss-rate%
   1644013 =C2=B1101%     -39.1%    1001092 =C2=B1 20%     -40.4%     97902=
1 =C2=B1 21%  perf-stat.i.dTLB-load-misses
 1.175e+10            -4.1%  1.127e+10            -4.7%   1.12e+10        p=
erf-stat.i.dTLB-loads
      0.02 =C2=B1119%      +0.0        0.03 =C2=B1 75%      +0.0        0.0=
2 =C2=B1 84%  perf-stat.i.dTLB-store-miss-rate%
    120834 =C2=B1 26%      +2.8%     124168 =C2=B1 20%      +1.9%     12316=
9 =C2=B1 21%  perf-stat.i.dTLB-store-misses
 5.701e+09            -5.3%  5.396e+09            -6.0%  5.356e+09        p=
erf-stat.i.dTLB-stores
     72.95 =C2=B1  4%      -0.5       72.49 =C2=B1  3%      -0.2       72.7=
1 =C2=B1  2%  perf-stat.i.iTLB-load-miss-rate%
  17300716           -12.4%   15151342           -10.8%   15425181 =C2=B1  =
3%  perf-stat.i.iTLB-load-misses
   4184079 =C2=B1  4%      -2.7%    4071696 =C2=B1  3%      -7.2%    388273=
3        perf-stat.i.iTLB-loads
 4.151e+10            -3.8%  3.994e+10            -4.0%  3.986e+10        p=
erf-stat.i.instructions
      2341 =C2=B1  5%     +10.1%       2578            +9.7%       2567 =C2=
=B1  2%  perf-stat.i.instructions-per-iTLB-miss
      0.68 =C2=B1  4%      +0.3%       0.68 =C2=B1  2%      -0.0%       0.6=
8 =C2=B1  4%  perf-stat.i.ipc
     37.92 =C2=B1 40%     +21.1%      45.90 =C2=B1 29%     +25.1%      47.4=
3 =C2=B1 43%  perf-stat.i.major-faults
      0.62            -2.6%       0.60            -2.1%       0.60 =C2=B1  =
2%  perf-stat.i.metric.GHz
    311.41 =C2=B1 42%      -2.6%     303.44 =C2=B1 32%      -1.7%     306.2=
1 =C2=B1 27%  perf-stat.i.metric.K/sec
    292.90            -4.3%     280.20            -4.8%     278.81        p=
erf-stat.i.metric.M/sec
      7947 =C2=B1  2%      -3.4%       7677 =C2=B1  2%      -2.4%       775=
8 =C2=B1  3%  perf-stat.i.minor-faults
     69.35 =C2=B1  3%      +0.3       69.68 =C2=B1  2%      +1.3       70.6=
4        perf-stat.i.node-load-miss-rate%
   4245573 =C2=B1  3%      -4.9%    4035543 =C2=B1  2%      -4.7%    404398=
5 =C2=B1  2%  perf-stat.i.node-load-misses
   1997742 =C2=B1  2%      -6.2%    1874006            -7.5%    1847909    =
    perf-stat.i.node-loads
     44.58 =C2=B1  4%      +0.7       45.29 =C2=B1  5%      -0.0       44.5=
8 =C2=B1  5%  perf-stat.i.node-store-miss-rate%
   2317846 =C2=B1  3%      -4.7%    2208172 =C2=B1  2%      -5.6%    218812=
8 =C2=B1  3%  perf-stat.i.node-store-misses
   3534663            -5.9%    3326105            -6.3%    3312606        p=
erf-stat.i.node-stores
      7985 =C2=B1  2%      -3.3%       7723 =C2=B1  2%      -2.2%       780=
6 =C2=B1  3%  perf-stat.i.page-faults
     88032            -0.0%      88025            -0.0%      88021        p=
erf-stat.i.task-clock
      2.09 =C2=B1  7%      -2.2%       2.04 =C2=B1  8%      +1.8%       2.1=
3 =C2=B1  8%  perf-stat.overall.MPKI
      0.42 =C2=B1  5%      -0.0        0.42 =C2=B1  3%      +0.0        0.4=
3 =C2=B1  3%  perf-stat.overall.branch-miss-rate%
     26.70 =C2=B1  6%      +0.0       26.70 =C2=B1  7%      -0.7       26.0=
1 =C2=B1  7%  perf-stat.overall.cache-miss-rate%
      1.31            +1.3%       1.32            +2.0%       1.33        p=
erf-stat.overall.cpi
      2354 =C2=B1  2%      +3.6%       2440 =C2=B1  2%      +2.9%       242=
3 =C2=B1  2%  perf-stat.overall.cycles-between-cache-misses
      0.01 =C2=B1101%      -0.0        0.01 =C2=B1 20%      -0.0        0.0=
1 =C2=B1 21%  perf-stat.overall.dTLB-load-miss-rate%
      0.00 =C2=B1 25%      +0.0        0.00 =C2=B1 20%      +0.0        0.0=
0 =C2=B1 21%  perf-stat.overall.dTLB-store-miss-rate%
     80.54            -1.7       78.83            -0.7       79.88        p=
erf-stat.overall.iTLB-load-miss-rate%
      2400            +9.8%       2636            +7.8%       2586 =C2=B1  =
3%  perf-stat.overall.instructions-per-iTLB-miss
      0.77            -1.3%       0.76            -1.9%       0.75        p=
erf-stat.overall.ipc
     67.98            +0.3       68.28            +0.6       68.63        p=
erf-stat.overall.node-load-miss-rate%
     39.59 =C2=B1  2%      +0.3       39.90            +0.2       39.76    =
    perf-stat.overall.node-store-miss-rate%
  8.05e+09            -3.7%  7.749e+09            -4.0%  7.729e+09        p=
erf-stat.ps.branch-instructions
  33999070 =C2=B1  5%      -4.1%   32614324 =C2=B1  3%      -1.7%   3341490=
2 =C2=B1  3%  perf-stat.ps.branch-misses
  22503328 =C2=B1  2%      -5.9%   21186670            -4.8%   21434254 =C2=
=B1  2%  perf-stat.ps.cache-misses
  84713531 =C2=B1  7%      -5.8%   79798101 =C2=B1  8%      -2.1%   8293544=
4 =C2=B1  8%  perf-stat.ps.cache-references
     45772            -4.5%      43725            -5.3%      43356        p=
erf-stat.ps.context-switches
     85806            +0.2%      85944            +0.2%      85955        p=
erf-stat.ps.cpu-clock
 5.296e+10            -2.4%  5.168e+10            -2.0%  5.191e+10 =C2=B1  =
2%  perf-stat.ps.cpu-cycles
      1390            -8.8%       1267            -9.0%       1264        p=
erf-stat.ps.cpu-migrations
   1603543 =C2=B1101%     -39.0%     977805 =C2=B1 20%     -40.4%     95622=
3 =C2=B1 21%  perf-stat.ps.dTLB-load-misses
 1.147e+10            -4.0%  1.102e+10            -4.6%  1.094e+10        p=
erf-stat.ps.dTLB-loads
    117801 =C2=B1 26%      +2.9%     121212 =C2=B1 19%      +2.1%     12024=
8 =C2=B1 21%  perf-stat.ps.dTLB-store-misses
 5.565e+09            -5.2%  5.277e+09            -5.9%  5.236e+09        p=
erf-stat.ps.dTLB-stores
  16890063           -12.3%   14816058           -10.7%   15077842 =C2=B1  =
3%  perf-stat.ps.iTLB-load-misses
   4083261 =C2=B1  4%      -2.5%    3980087 =C2=B1  3%      -7.1%    379431=
7        perf-stat.ps.iTLB-loads
 4.053e+10            -3.6%  3.905e+10            -3.9%  3.896e+10        p=
erf-stat.ps.instructions
     36.83 =C2=B1 40%     +21.4%      44.70 =C2=B1 29%     +25.1%      46.0=
7 =C2=B1 42%  perf-stat.ps.major-faults
      7724 =C2=B1  2%      -3.2%       7476 =C2=B1  2%      -2.2%       755=
1 =C2=B1  3%  perf-stat.ps.minor-faults
   4144187 =C2=B1  3%      -4.8%    3946230 =C2=B1  2%      -4.6%    395238=
4 =C2=B1  2%  perf-stat.ps.node-load-misses
   1950358 =C2=B1  2%      -6.0%    1832583            -7.4%    1806333    =
    perf-stat.ps.node-loads
   2262554 =C2=B1  3%      -4.6%    2159317 =C2=B1  2%      -5.5%    213859=
8 =C2=B1  3%  perf-stat.ps.node-store-misses
   3450878            -5.7%    3252498            -6.2%    3237962        p=
erf-stat.ps.node-stores
      7761 =C2=B1  2%      -3.1%       7521 =C2=B1  2%      -2.1%       759=
7 =C2=B1  3%  perf-stat.ps.page-faults
     85806            +0.2%      85944            +0.2%      85955        p=
erf-stat.ps.task-clock
 1.625e+12            +2.8%   1.67e+12            +3.0%  1.673e+12        p=
erf-stat.total.instructions
     29.46 =C2=B1  3%      -1.1       28.33 =C2=B1  3%      -1.2       28.2=
5 =C2=B1  2%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.write
     28.94 =C2=B1  3%      -1.1       27.84 =C2=B1  3%      -1.2       27.7=
6 =C2=B1  2%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.write
     27.28 =C2=B1  3%      -1.0       26.25 =C2=B1  3%      -1.1       26.2=
0 =C2=B1  2%  perf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksy=
s_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     26.46 =C2=B1  3%      -1.0       25.46 =C2=B1  3%      -1.0       25.4=
2 =C2=B1  2%  perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.new_=
sync_write.vfs_write.ksys_write.do_syscall_64
     23.17 =C2=B1  3%      -0.8       22.36 =C2=B1  3%      -0.9       22.3=
0 =C2=B1  2%  perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xf=
s_file_buffered_write.new_sync_write.vfs_write.ksys_write
     18.02 =C2=B1  3%      -0.6       17.41 =C2=B1  3%      -0.6       17.3=
7 =C2=B1  2%  perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_=
buffered_write.xfs_file_buffered_write.new_sync_write.vfs_write
     22.03 =C2=B1 12%      -0.4       21.60 =C2=B1 10%      -0.6       21.4=
6 =C2=B1  9%  perf-profile.calltrace.cycles-pp.mwait_idle_with_hints.intel_=
idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
     22.14 =C2=B1 12%      -0.3       21.79 =C2=B1  9%      -0.6       21.5=
1 =C2=B1  9%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_sta=
te.cpuidle_enter.cpuidle_idle_call.do_idle
      9.93 =C2=B1  3%      -0.3        9.61 =C2=B1  2%      -0.3        9.6=
0 =C2=B1  2%  perf-profile.calltrace.cycles-pp.iomap_write_begin.iomap_writ=
e_iter.iomap_file_buffered_write.xfs_file_buffered_write.new_sync_write
     23.55 =C2=B1 12%      -0.3       23.23 =C2=B1  8%      -0.6       22.9=
4 =C2=B1  9%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_veri=
fy
     22.88 =C2=B1 12%      -0.3       22.62 =C2=B1  9%      -0.6       22.3=
1 =C2=B1  9%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_=
enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     22.93 =C2=B1 12%      -0.3       22.68 =C2=B1  9%      -0.6       22.3=
6 =C2=B1  9%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_c=
all.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
     23.08 =C2=B1 12%      -0.2       22.84 =C2=B1  8%      -0.6       22.5=
2 =C2=B1  9%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cp=
u_startup_entry.secondary_startup_64_no_verify
     23.21 =C2=B1 12%      -0.2       22.98 =C2=B1  8%      -0.6       22.6=
5 =C2=B1  9%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.secondary_=
startup_64_no_verify
     23.20 =C2=B1 12%      -0.2       22.98 =C2=B1  8%      -0.6       22.6=
5 =C2=B1  9%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.se=
condary_startup_64_no_verify
      4.49 =C2=B1  2%      -0.2        4.31 =C2=B1  3%      -0.2        4.2=
9 =C2=B1  3%  perf-profile.calltrace.cycles-pp.iomap_iter.iomap_file_buffer=
ed_write.xfs_file_buffered_write.new_sync_write.vfs_write
      5.22 =C2=B1  2%      -0.2        5.05 =C2=B1  3%      -0.2        5.0=
1 =C2=B1  2%  perf-profile.calltrace.cycles-pp.__filemap_get_folio.iomap_wr=
ite_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      0.17 =C2=B1141%      -0.2        0.00            -0.2        0.00    =
    perf-profile.calltrace.cycles-pp.xfs_break_layouts.xfs_file_write_check=
s.xfs_file_buffered_write.new_sync_write.vfs_write
      3.36            -0.1        3.22 =C2=B1  3%      -0.2        3.18 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_l=
oop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      3.38            -0.1        3.24 =C2=B1  3%      -0.2        3.20 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.__close
      3.35 =C2=B1  2%      -0.1        3.21 =C2=B1  3%      -0.2        3.1=
8 =C2=B1  2%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to=
_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      3.37            -0.1        3.23 =C2=B1  3%      -0.2        3.20 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__=
close
      3.37            -0.1        3.23 =C2=B1  3%      -0.2        3.20 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.__close
      3.34            -0.1        3.20 =C2=B1  3%      -0.2        3.16 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.dput.__fput.task_work_run.exit_to=
_user_mode_loop.exit_to_user_mode_prepare
      3.36            -0.1        3.22 =C2=B1  3%      -0.2        3.19 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.__close
      3.36            -0.1        3.22 =C2=B1  3%      -0.2        3.19 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      3.36            -0.1        3.22 =C2=B1  3%      -0.2        3.19 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_us=
er_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
      3.33 =C2=B1  2%      -0.1        3.19 =C2=B1  3%      -0.2        3.1=
6 =C2=B1  2%  perf-profile.calltrace.cycles-pp.dentry_kill.dput.__fput.task=
_work_run.exit_to_user_mode_loop
      3.32            -0.1        3.19 =C2=B1  3%      -0.2        3.15 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.__dentry_kill.dentry_kill.dput.__=
fput.task_work_run
      3.29 =C2=B1  2%      -0.1        3.16 =C2=B1  3%      -0.2        3.1=
2 =C2=B1  2%  perf-profile.calltrace.cycles-pp.evict.__dentry_kill.dentry_k=
ill.dput.__fput
      3.27 =C2=B1  2%      -0.1        3.14 =C2=B1  3%      -0.2        3.1=
0 =C2=B1  2%  perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.e=
vict.__dentry_kill.dentry_kill.dput
      2.96 =C2=B1  2%      -0.1        2.84 =C2=B1  3%      -0.1        2.8=
2 =C2=B1  4%  perf-profile.calltrace.cycles-pp.xfs_buffered_write_iomap_beg=
in.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write.new_sync_wr=
ite
      4.28 =C2=B1  3%      -0.1        4.16 =C2=B1  2%      -0.1        4.1=
8 =C2=B1  2%  perf-profile.calltrace.cycles-pp.__iomap_write_begin.iomap_wr=
ite_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      1.75 =C2=B1  6%      -0.1        1.64 =C2=B1  2%      -0.1        1.6=
3        perf-profile.calltrace.cycles-pp.xfs_file_write_checks.xfs_file_bu=
ffered_write.new_sync_write.vfs_write.ksys_write
      1.08 =C2=B1 25%      -0.1        0.96 =C2=B1 21%      -0.2        0.8=
7 =C2=B1  5%  perf-profile.calltrace.cycles-pp.__entry_text_start.write
      3.94 =C2=B1  3%      -0.1        3.84 =C2=B1  3%      -0.1        3.8=
3 =C2=B1  2%  perf-profile.calltrace.cycles-pp.iomap_write_end.iomap_write_=
iter.iomap_file_buffered_write.xfs_file_buffered_write.new_sync_write
      0.67 =C2=B1 12%      -0.1        0.57 =C2=B1  4%      -0.1        0.5=
9 =C2=B1  5%  perf-profile.calltrace.cycles-pp.file_update_time.xfs_file_wr=
ite_checks.xfs_file_buffered_write.new_sync_write.vfs_write
      2.63 =C2=B1  3%      -0.1        2.54 =C2=B1  3%      -0.1        2.5=
3 =C2=B1  2%  perf-profile.calltrace.cycles-pp.filemap_add_folio.__filemap_=
get_folio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write
      1.69 =C2=B1  3%      -0.1        1.62 =C2=B1  3%      -0.1        1.6=
3 =C2=B1  2%  perf-profile.calltrace.cycles-pp.filemap_dirty_folio.iomap_wr=
ite_end.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      1.33            -0.1        1.26 =C2=B1  3%      -0.1        1.24 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.__pagevec_release.truncate_inode_=
pages_range.evict.__dentry_kill.dentry_kill
      1.29            -0.1        1.22 =C2=B1  3%      -0.1        1.20 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.release_pages.__pagevec_release.t=
runcate_inode_pages_range.evict.__dentry_kill
      1.93 =C2=B1  3%      -0.1        1.86 =C2=B1  3%      -0.1        1.8=
5 =C2=B1  2%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.i=
omap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.new_sync_=
write
      1.21 =C2=B1  4%      -0.1        1.15 =C2=B1  4%      -0.1        1.1=
5        perf-profile.calltrace.cycles-pp.zero_user_segments.__iomap_write_=
begin.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write
      1.00 =C2=B1  2%      -0.1        0.94 =C2=B1  3%      -0.1        0.9=
4 =C2=B1  3%  perf-profile.calltrace.cycles-pp.folio_alloc.__filemap_get_fo=
lio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write
      1.14 =C2=B1  4%      -0.1        1.09 =C2=B1  4%      -0.0        1.1=
0 =C2=B1  2%  perf-profile.calltrace.cycles-pp.memset_erms.zero_user_segmen=
ts.__iomap_write_begin.iomap_write_begin.iomap_write_iter
      1.50 =C2=B1  3%      -0.1        1.44 =C2=B1  3%      -0.1        1.4=
2 =C2=B1  2%  perf-profile.calltrace.cycles-pp.copyin.copy_page_from_iter_a=
tomic.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      0.89 =C2=B1  4%      -0.1        0.84 =C2=B1  4%      -0.1        0.8=
3 =C2=B1  5%  perf-profile.calltrace.cycles-pp.__pagevec_lru_add.folio_add_=
lru.filemap_add_folio.__filemap_get_folio.iomap_write_begin
      1.03 =C2=B1  2%      -0.1        0.98 =C2=B1  4%      -0.0        0.9=
9 =C2=B1  3%  perf-profile.calltrace.cycles-pp.__folio_mark_dirty.filemap_d=
irty_folio.iomap_write_end.iomap_write_iter.iomap_file_buffered_write
      1.36 =C2=B1  3%      -0.1        1.31 =C2=B1  3%      -0.1        1.3=
0 =C2=B1  2%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_stri=
ng.copyin.copy_page_from_iter_atomic.iomap_write_iter.iomap_file_buffered_w=
rite
      0.98 =C2=B1  3%      -0.1        0.92 =C2=B1  3%      -0.1        0.9=
2 =C2=B1  4%  perf-profile.calltrace.cycles-pp.folio_add_lru.filemap_add_fo=
lio.__filemap_get_folio.iomap_write_begin.iomap_write_iter
      1.61 =C2=B1  3%      -0.0        1.57 =C2=B1  2%      -0.1        1.5=
6        perf-profile.calltrace.cycles-pp.__filemap_add_folio.filemap_add_f=
olio.__filemap_get_folio.iomap_write_begin.iomap_write_iter
      0.83 =C2=B1  3%      -0.0        0.79 =C2=B1  4%      -0.1        0.7=
8 =C2=B1  2%  perf-profile.calltrace.cycles-pp.__alloc_pages.folio_alloc.__=
filemap_get_folio.iomap_write_begin.iomap_write_iter
      0.74 =C2=B1  2%      -0.0        0.70 =C2=B1  2%      -0.0        0.7=
1 =C2=B1  4%  perf-profile.calltrace.cycles-pp.truncate_cleanup_folio.trunc=
ate_inode_pages_range.evict.__dentry_kill.dentry_kill
      0.69 =C2=B1  2%      -0.0        0.66 =C2=B1  4%      -0.0        0.6=
6 =C2=B1  2%  perf-profile.calltrace.cycles-pp.folio_account_dirtied.__foli=
o_mark_dirty.filemap_dirty_folio.iomap_write_end.iomap_write_iter
      0.58 =C2=B1  4%      -0.0        0.55 =C2=B1  4%      -0.1        0.4=
6 =C2=B1 44%  perf-profile.calltrace.cycles-pp.__pagevec_lru_add_fn.__pagev=
ec_lru_add.folio_add_lru.filemap_add_folio.__filemap_get_folio
      0.62 =C2=B1  3%      -0.0        0.60            -0.0        0.60 =C2=
=B1  4%  perf-profile.calltrace.cycles-pp.__folio_cancel_dirty.truncate_cle=
anup_folio.truncate_inode_pages_range.evict.__dentry_kill
      0.65 =C2=B1  4%      -0.0        0.62 =C2=B1  3%      -0.0        0.6=
3 =C2=B1  3%  perf-profile.calltrace.cycles-pp.__mem_cgroup_charge.__filema=
p_add_folio.filemap_add_folio.__filemap_get_folio.iomap_write_begin
      0.80 =C2=B1  3%      -0.0        0.78 =C2=B1  4%      -0.0        0.7=
8 =C2=B1  3%  perf-profile.calltrace.cycles-pp.xfs_ilock.xfs_buffered_write=
_iomap_begin.iomap_iter.iomap_file_buffered_write.xfs_file_buffered_write
      0.77 =C2=B1  2%      -0.0        0.75 =C2=B1  3%      -0.0        0.7=
4 =C2=B1  3%  perf-profile.calltrace.cycles-pp.delete_from_page_cache_batch=
.truncate_inode_pages_range.evict.__dentry_kill.dentry_kill
      0.54 =C2=B1  5%      -0.0        0.53 =C2=B1  4%      -0.2        0.3=
6 =C2=B1 70%  perf-profile.calltrace.cycles-pp.apparmor_file_permission.sec=
urity_file_permission.vfs_write.ksys_write.do_syscall_64
      0.59 =C2=B1  3%      -0.0        0.58 =C2=B1  3%      -0.0        0.5=
6 =C2=B1  2%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__all=
oc_pages.folio_alloc.__filemap_get_folio.iomap_write_begin
      0.67 =C2=B1  2%      -0.0        0.66 =C2=B1  4%      -0.0        0.6=
5 =C2=B1  4%  perf-profile.calltrace.cycles-pp.down_write.xfs_ilock.xfs_buf=
fered_write_iomap_begin.iomap_iter.iomap_file_buffered_write
      0.64 =C2=B1  4%      -0.0        0.63 =C2=B1  2%      -0.0        0.6=
2 =C2=B1  3%  perf-profile.calltrace.cycles-pp.xfs_ilock.xfs_file_buffered_=
write.new_sync_write.vfs_write.ksys_write
      0.62 =C2=B1  5%      -0.0        0.60 =C2=B1  4%      -0.0        0.6=
0 =C2=B1  4%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs=
_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.82 =C2=B1  2%      -0.0        0.81 =C2=B1  5%      -0.0        0.8=
1 =C2=B1  3%  perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.i=
omap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.new_sync_=
write
      0.44 =C2=B1 44%      -0.0        0.43 =C2=B1 44%      -0.1        0.3=
5 =C2=B1 70%  perf-profile.calltrace.cycles-pp.down_write.xfs_ilock.xfs_fil=
e_buffered_write.new_sync_write.vfs_write
      0.68 =C2=B1  3%      -0.0        0.68 =C2=B1  6%      -0.0        0.6=
8 =C2=B1  4%  perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_i=
ov_iter_readable.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffer=
ed_write
      0.81 =C2=B1  4%      +0.0        0.82 =C2=B1  3%      -0.0        0.8=
1 =C2=B1  3%  perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_op=
timistic_spin.rwsem_down_write_slowpath.do_unlinkat.__x64_sys_unlink
      0.74 =C2=B1  4%      +0.0        0.76            +0.0        0.75 =C2=
=B1  3%  perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_optimis=
tic_spin.rwsem_down_write_slowpath.open_last_lookups.path_openat
      0.68 =C2=B1  2%      +0.0        0.71 =C2=B1  9%      -0.0        0.6=
5 =C2=B1  2%  perf-profile.calltrace.cycles-pp.xfs_remove.xfs_vn_unlink.vfs=
_unlink.do_unlinkat.__x64_sys_unlink
      0.70            +0.0        0.72 =C2=B1  9%      -0.0        0.66 =C2=
=B1  2%  perf-profile.calltrace.cycles-pp.vfs_unlink.do_unlinkat.__x64_sys_=
unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.68 =C2=B1  2%      +0.0        0.71 =C2=B1  9%      -0.0        0.6=
5 =C2=B1  2%  perf-profile.calltrace.cycles-pp.xfs_vn_unlink.vfs_unlink.do_=
unlinkat.__x64_sys_unlink.do_syscall_64
      0.63 =C2=B1  5%      +0.1        0.70 =C2=B1 12%      +0.0        0.6=
8 =C2=B1  5%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.=
asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_i=
dle_call
      0.68 =C2=B1  5%      +0.1        0.76 =C2=B1 12%      +0.1        0.7=
3 =C2=B1  4%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interr=
upt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.53 =C2=B1  3%      +0.1        0.64 =C2=B1  4%      +0.1        0.6=
4 =C2=B1  4%  perf-profile.calltrace.cycles-pp.xfs_ifree.xfs_inactive_ifree=
.xfs_inactive.xfs_inodegc_worker.process_one_work
      0.88 =C2=B1  3%      +0.1        1.00 =C2=B1  3%      +0.1        0.9=
9 =C2=B1  4%  perf-profile.calltrace.cycles-pp.xfs_inactive_ifree.xfs_inact=
ive.xfs_inodegc_worker.process_one_work.worker_thread
      0.95 =C2=B1  3%      +0.1        1.08 =C2=B1  3%      +0.1        1.0=
5 =C2=B1  4%  perf-profile.calltrace.cycles-pp.xfs_inactive.xfs_inodegc_wor=
ker.process_one_work.worker_thread.kthread
      0.96 =C2=B1  3%      +0.1        1.09 =C2=B1  3%      +0.1        1.0=
6 =C2=B1  4%  perf-profile.calltrace.cycles-pp.xfs_inodegc_worker.process_o=
ne_work.worker_thread.kthread.ret_from_fork
      0.98 =C2=B1  3%      +0.1        1.11 =C2=B1  3%      +0.1        1.0=
9 =C2=B1  4%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thre=
ad.kthread.ret_from_fork
      0.99 =C2=B1  3%      +0.1        1.12 =C2=B1  3%      +0.1        1.0=
9 =C2=B1  3%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_fr=
om_fork
      0.99 =C2=B1  3%      +0.1        1.13 =C2=B1  3%      +0.1        1.1=
0 =C2=B1  3%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
      0.99 =C2=B1  3%      +0.1        1.13 =C2=B1  3%      +0.1        1.1=
0 =C2=B1  3%  perf-profile.calltrace.cycles-pp.ret_from_fork
      1.11 =C2=B1  3%      +0.2        1.26 =C2=B1  6%      +0.1        1.1=
9        perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.pat=
h_openat.do_filp_open.do_sys_openat2
      0.95 =C2=B1  4%      +0.2        1.10 =C2=B1  6%      +0.1        1.0=
4        perf-profile.calltrace.cycles-pp.xfs_create.xfs_generic_create.loo=
kup_open.open_last_lookups.path_openat
      0.96 =C2=B1  4%      +0.2        1.12 =C2=B1  6%      +0.1        1.0=
5        perf-profile.calltrace.cycles-pp.xfs_generic_create.lookup_open.op=
en_last_lookups.path_openat.do_filp_open
      0.00            +0.3        0.26 =C2=B1100%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.xfs_check_agi_freecount.xfs_dialloc_ag=
.xfs_dialloc.xfs_create.xfs_generic_create
      0.00            +0.3        0.32 =C2=B1223%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.mwait_=
idle_with_hints.intel_idle.cpuidle_enter_state.cpuidle_enter
      0.00            +0.5        0.47 =C2=B1 45%      +0.5        0.53 =C2=
=B1  3%  perf-profile.calltrace.cycles-pp.xfs_dialloc_ag.xfs_dialloc.xfs_cr=
eate.xfs_generic_create.lookup_open
      0.08 =C2=B1223%      +0.5        0.61 =C2=B1  8%      +0.5        0.5=
8 =C2=B1  2%  perf-profile.calltrace.cycles-pp.xfs_dialloc.xfs_create.xfs_g=
eneric_create.lookup_open.open_last_lookups
      0.00            +0.5        0.55 =C2=B1  4%      +0.6        0.55 =C2=
=B1  4%  perf-profile.calltrace.cycles-pp.xfs_difree.xfs_ifree.xfs_inactive=
_ifree.xfs_inactive.xfs_inodegc_worker
     17.48 =C2=B1  4%      +0.6       18.12 =C2=B1  3%      +1.0       18.4=
8 =C2=B1  3%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_sp=
in.rwsem_down_write_slowpath.do_unlinkat.__x64_sys_unlink
     18.32 =C2=B1  4%      +0.6       18.95 =C2=B1  3%      +1.0       19.3=
1 =C2=B1  3%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_=
down_write_slowpath.do_unlinkat.__x64_sys_unlink.do_syscall_64
     17.80 =C2=B1  5%      +0.7       18.46 =C2=B1  3%      +0.9       18.7=
5 =C2=B1  3%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_sp=
in.rwsem_down_write_slowpath.open_last_lookups.path_openat
     18.58 =C2=B1  4%      +0.7       19.24 =C2=B1  2%      +1.0       19.5=
7 =C2=B1  3%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.do=
_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.56 =C2=B1  5%      +0.7       19.24 =C2=B1  2%      +1.0       19.5=
2 =C2=B1  3%  perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_=
down_write_slowpath.open_last_lookups.path_openat.do_filp_open
     19.36 =C2=B1  4%      +0.7       20.06 =C2=B1  2%      +1.0       20.3=
2 =C2=B1  3%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink=
.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
     19.37 =C2=B1  4%      +0.7       20.07 =C2=B1  2%      +1.0       20.3=
3 =C2=B1  3%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_=
64.entry_SYSCALL_64_after_hwframe.unlink
     19.38 =C2=B1  4%      +0.7       20.08 =C2=B1  2%      +1.0       20.3=
4 =C2=B1  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me.unlink
     19.38 =C2=B1  4%      +0.7       20.08 =C2=B1  2%      +1.0       20.3=
4 =C2=B1  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.unlink
     19.40 =C2=B1  4%      +0.7       20.10 =C2=B1  2%      +1.0       20.3=
6 =C2=B1  3%  perf-profile.calltrace.cycles-pp.unlink
     18.82 =C2=B1  5%      +0.7       19.53 =C2=B1  2%      +1.0       19.7=
8 =C2=B1  3%  perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.op=
en_last_lookups.path_openat.do_filp_open.do_sys_openat2
     20.10 =C2=B1  4%      +0.9       20.96 =C2=B1  3%      +1.0       21.1=
3 =C2=B1  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwfra=
me.creat64
     20.09 =C2=B1  4%      +0.9       20.95 =C2=B1  3%      +1.0       21.1=
2 =C2=B1  3%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_cre=
at.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
     20.09 =C2=B1  4%      +0.9       20.95 =C2=B1  3%      +1.0       21.1=
2 =C2=B1  3%  perf-profile.calltrace.cycles-pp.__x64_sys_creat.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe.creat64
     20.07 =C2=B1  4%      +0.9       20.93 =C2=B1  3%      +1.0       21.1=
0 =C2=B1  3%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.=
__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.00 =C2=B1  4%      +0.9       20.86 =C2=B1  3%      +1.0       21.0=
4 =C2=B1  3%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_opena=
t.do_filp_open.do_sys_openat2.__x64_sys_creat
     20.06 =C2=B1  4%      +0.9       20.92 =C2=B1  3%      +1.0       21.1=
0 =C2=B1  3%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_=
sys_openat2.__x64_sys_creat.do_syscall_64
     20.10 =C2=B1  4%      +0.9       20.96 =C2=B1  3%      +1.0       21.1=
3 =C2=B1  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.creat64
     20.11 =C2=B1  4%      +0.9       20.98 =C2=B1  3%      +1.0       21.1=
5 =C2=B1  3%  perf-profile.calltrace.cycles-pp.creat64
     32.16 =C2=B1  3%      -1.2       30.92 =C2=B1  2%      -1.3       30.8=
6 =C2=B1  2%  perf-profile.children.cycles-pp.write
     29.48 =C2=B1  3%      -1.1       28.34 =C2=B1  3%      -1.2       28.2=
6 =C2=B1  2%  perf-profile.children.cycles-pp.ksys_write
     28.97 =C2=B1  3%      -1.1       27.86 =C2=B1  3%      -1.2       27.7=
9 =C2=B1  2%  perf-profile.children.cycles-pp.vfs_write
     27.30 =C2=B1  3%      -1.0       26.26 =C2=B1  3%      -1.1       26.2=
3 =C2=B1  2%  perf-profile.children.cycles-pp.new_sync_write
     26.50 =C2=B1  3%      -1.0       25.51 =C2=B1  3%      -1.0       25.4=
6 =C2=B1  2%  perf-profile.children.cycles-pp.xfs_file_buffered_write
     23.21 =C2=B1  3%      -0.8       22.39 =C2=B1  3%      -0.9       22.3=
3 =C2=B1  2%  perf-profile.children.cycles-pp.iomap_file_buffered_write
     18.05 =C2=B1  3%      -0.6       17.45 =C2=B1  3%      -0.6       17.4=
1 =C2=B1  2%  perf-profile.children.cycles-pp.iomap_write_iter
     22.46 =C2=B1 12%      -0.4       22.03 =C2=B1  9%      -0.7       21.7=
7 =C2=B1  9%  perf-profile.children.cycles-pp.intel_idle
     22.45 =C2=B1 12%      -0.4       22.02 =C2=B1  9%      -0.7       21.7=
7 =C2=B1  9%  perf-profile.children.cycles-pp.mwait_idle_with_hints
     23.27 =C2=B1 12%      -0.3       22.92 =C2=B1  9%      -0.6       22.6=
4 =C2=B1  9%  perf-profile.children.cycles-pp.cpuidle_enter_state
     23.27 =C2=B1 12%      -0.3       22.93 =C2=B1  9%      -0.6       22.6=
5 =C2=B1  9%  perf-profile.children.cycles-pp.cpuidle_enter
      9.95 =C2=B1  3%      -0.3        9.63 =C2=B1  2%      -0.3        9.6=
1 =C2=B1  2%  perf-profile.children.cycles-pp.iomap_write_begin
     23.55 =C2=B1 12%      -0.3       23.23 =C2=B1  8%      -0.6       22.9=
4 =C2=B1  9%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     23.55 =C2=B1 12%      -0.3       23.23 =C2=B1  8%      -0.6       22.9=
4 =C2=B1  9%  perf-profile.children.cycles-pp.cpu_startup_entry
     23.55 =C2=B1 12%      -0.3       23.23 =C2=B1  8%      -0.6       22.9=
4 =C2=B1  9%  perf-profile.children.cycles-pp.do_idle
     23.41 =C2=B1 12%      -0.3       23.09 =C2=B1  8%      -0.6       22.8=
1 =C2=B1  9%  perf-profile.children.cycles-pp.cpuidle_idle_call
      5.30 =C2=B1  3%      -0.2        5.11 =C2=B1  2%      -0.2        5.0=
8 =C2=B1  2%  perf-profile.children.cycles-pp.__filemap_get_folio
      4.52 =C2=B1  2%      -0.2        4.34 =C2=B1  3%      -0.2        4.3=
2 =C2=B1  3%  perf-profile.children.cycles-pp.iomap_iter
      3.38            -0.1        3.24 =C2=B1  3%      -0.2        3.20 =C2=
=B1  2%  perf-profile.children.cycles-pp.__close
      3.56            -0.1        3.42 =C2=B1  3%      -0.2        3.38 =C2=
=B1  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      3.36            -0.1        3.22 =C2=B1  3%      -0.2        3.18 =C2=
=B1  2%  perf-profile.children.cycles-pp.task_work_run
      3.35 =C2=B1  2%      -0.1        3.21 =C2=B1  3%      -0.2        3.1=
8 =C2=B1  2%  perf-profile.children.cycles-pp.__fput
      3.36            -0.1        3.22 =C2=B1  3%      -0.2        3.19 =C2=
=B1  2%  perf-profile.children.cycles-pp.dput
      3.33 =C2=B1  2%      -0.1        3.19 =C2=B1  3%      -0.2        3.1=
6 =C2=B1  2%  perf-profile.children.cycles-pp.dentry_kill
      3.36            -0.1        3.22 =C2=B1  3%      -0.2        3.19 =C2=
=B1  2%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      3.46            -0.1        3.32 =C2=B1  3%      -0.2        3.29 =C2=
=B1  2%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      3.32            -0.1        3.19 =C2=B1  3%      -0.2        3.15 =C2=
=B1  2%  perf-profile.children.cycles-pp.__dentry_kill
      3.29 =C2=B1  2%      -0.1        3.16 =C2=B1  3%      -0.2        3.1=
2 =C2=B1  2%  perf-profile.children.cycles-pp.evict
      3.27            -0.1        3.14 =C2=B1  3%      -0.2        3.10 =C2=
=B1  2%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      4.31 =C2=B1  3%      -0.1        4.18 =C2=B1  2%      -0.1        4.2=
0 =C2=B1  2%  perf-profile.children.cycles-pp.__iomap_write_begin
      3.02 =C2=B1  2%      -0.1        2.90 =C2=B1  3%      -0.1        2.8=
8 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_buffered_write_iomap_begin
      1.79 =C2=B1  6%      -0.1        1.66 =C2=B1  3%      -0.1        1.6=
6        perf-profile.children.cycles-pp.xfs_file_write_checks
      3.96 =C2=B1  3%      -0.1        3.85 =C2=B1  3%      -0.1        3.8=
5 =C2=B1  2%  perf-profile.children.cycles-pp.iomap_write_end
      0.68 =C2=B1 12%      -0.1        0.58 =C2=B1  4%      -0.1        0.6=
0 =C2=B1  5%  perf-profile.children.cycles-pp.file_update_time
      2.64 =C2=B1  3%      -0.1        2.55 =C2=B1  2%      -0.1        2.5=
3 =C2=B1  2%  perf-profile.children.cycles-pp.filemap_add_folio
      0.34 =C2=B1 23%      -0.1        0.25 =C2=B1 23%      -0.0        0.2=
9 =C2=B1 26%  perf-profile.children.cycles-pp.start_kernel
      1.71 =C2=B1  3%      -0.1        1.63 =C2=B1  4%      -0.1        1.6=
5 =C2=B1  2%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.39 =C2=B1  9%      -0.1        0.31 =C2=B1  5%      -0.1        0.3=
1 =C2=B1  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowp=
ath
      1.33            -0.1        1.26 =C2=B1  3%      -0.1        1.24 =C2=
=B1  2%  perf-profile.children.cycles-pp.__pagevec_release
      1.94 =C2=B1  3%      -0.1        1.87 =C2=B1  3%      -0.1        1.8=
6 =C2=B1  2%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      1.38            -0.1        1.32 =C2=B1  3%      -0.1        1.30 =C2=
=B1  2%  perf-profile.children.cycles-pp.release_pages
      0.26 =C2=B1 31%      -0.1        0.20 =C2=B1  7%      -0.1        0.2=
1 =C2=B1 19%  perf-profile.children.cycles-pp.xfs_vn_update_time
      0.59 =C2=B1  3%      -0.1        0.53 =C2=B1  3%      -0.1        0.5=
2 =C2=B1  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.51 =C2=B1  3%      -0.1        1.45 =C2=B1  3%      -0.1        1.4=
4 =C2=B1  2%  perf-profile.children.cycles-pp.copyin
      1.21 =C2=B1  4%      -0.1        1.15 =C2=B1  4%      -0.1        1.1=
6        perf-profile.children.cycles-pp.zero_user_segments
      1.16 =C2=B1  4%      -0.1        1.11 =C2=B1  4%      -0.0        1.1=
2 =C2=B1  2%  perf-profile.children.cycles-pp.memset_erms
      1.00 =C2=B1  2%      -0.1        0.95 =C2=B1  3%      -0.1        0.9=
4 =C2=B1  3%  perf-profile.children.cycles-pp.folio_alloc
      0.91 =C2=B1  4%      -0.1        0.86 =C2=B1  3%      -0.1        0.8=
6 =C2=B1  5%  perf-profile.children.cycles-pp.__pagevec_lru_add
      1.04 =C2=B1  2%      -0.0        0.98 =C2=B1  4%      -0.0        1.0=
0 =C2=B1  2%  perf-profile.children.cycles-pp.__folio_mark_dirty
      1.45 =C2=B1  3%      -0.0        1.40 =C2=B1  3%      -0.1        1.3=
8 =C2=B1  2%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      0.98 =C2=B1  3%      -0.0        0.93 =C2=B1  3%      -0.1        0.9=
2 =C2=B1  4%  perf-profile.children.cycles-pp.folio_add_lru
      0.36 =C2=B1  5%      -0.0        0.31 =C2=B1  4%      -0.1        0.3=
0 =C2=B1  6%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      0.47 =C2=B1  7%      -0.0        0.43 =C2=B1  8%      -0.0        0.4=
2 =C2=B1  7%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimit=
ed
      1.64 =C2=B1  3%      -0.0        1.59 =C2=B1  2%      -0.1        1.5=
8        perf-profile.children.cycles-pp.__filemap_add_folio
      0.84 =C2=B1  2%      -0.0        0.80 =C2=B1  4%      -0.1        0.7=
9 =C2=B1  2%  perf-profile.children.cycles-pp.__alloc_pages
      0.82 =C2=B1  3%      -0.0        0.78 =C2=B1  2%      -0.0        0.7=
9 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_iunlock
      0.27 =C2=B1 14%      -0.0        0.23 =C2=B1  7%      -0.0        0.2=
4 =C2=B1  9%  perf-profile.children.cycles-pp._raw_spin_lock
      0.05 =C2=B1 45%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.__x64_sys_write
      1.47 =C2=B1  2%      -0.0        1.44 =C2=B1  3%      -0.0        1.4=
3 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_ilock
      0.74 =C2=B1  2%      -0.0        0.71 =C2=B1  2%      -0.0        0.7=
1 =C2=B1  4%  perf-profile.children.cycles-pp.truncate_cleanup_folio
      0.70 =C2=B1  2%      -0.0        0.67 =C2=B1  5%      -0.0        0.6=
8 =C2=B1  2%  perf-profile.children.cycles-pp.folio_account_dirtied
      0.46 =C2=B1  5%      -0.0        0.43 =C2=B1  4%      -0.0        0.4=
3 =C2=B1  4%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.60 =C2=B1  4%      -0.0        0.56 =C2=B1  4%      -0.0        0.5=
7 =C2=B1  5%  perf-profile.children.cycles-pp.__pagevec_lru_add_fn
      0.38 =C2=B1  4%      -0.0        0.36 =C2=B1  3%      -0.0        0.3=
6 =C2=B1  3%  perf-profile.children.cycles-pp.__might_sleep
      0.91 =C2=B1  4%      -0.0        0.88 =C2=B1  3%      -0.0        0.8=
8 =C2=B1  4%  perf-profile.children.cycles-pp.__entry_text_start
      0.36 =C2=B1  6%      -0.0        0.33 =C2=B1  3%      -0.0        0.3=
3 =C2=B1  5%  perf-profile.children.cycles-pp.__fdget_pos
      0.28 =C2=B1  7%      -0.0        0.25 =C2=B1  3%      -0.0        0.2=
6 =C2=B1  7%  perf-profile.children.cycles-pp.__fget_light
      0.51 =C2=B1  3%      -0.0        0.48 =C2=B1  5%      -0.0        0.4=
9 =C2=B1  3%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.63 =C2=B1  3%      -0.0        0.60 =C2=B1  2%      -0.0        0.6=
1 =C2=B1  4%  perf-profile.children.cycles-pp.__folio_cancel_dirty
      0.59 =C2=B1  3%      -0.0        0.56 =C2=B1  3%      -0.0        0.5=
8 =C2=B1  3%  perf-profile.children.cycles-pp.up_write
      0.02 =C2=B1 99%      -0.0        0.00            -0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.__x64_sys_times
      0.03 =C2=B1 70%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.propagate_protected_usage
      1.11 =C2=B1  7%      -0.0        1.08 =C2=B1  4%      -0.1        1.0=
4 =C2=B1  3%  perf-profile.children.cycles-pp.__xfs_trans_commit
      0.50 =C2=B1  4%      -0.0        0.48 =C2=B1  3%      -0.0        0.4=
7 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_break_layouts
      1.28 =C2=B1  2%      -0.0        1.26 =C2=B1  2%      -0.0        1.2=
5 =C2=B1  4%  perf-profile.children.cycles-pp.down_write
      0.46 =C2=B1  3%      -0.0        0.44 =C2=B1  3%      -0.0        0.4=
4 =C2=B1  5%  perf-profile.children.cycles-pp.folio_account_cleaned
      0.42 =C2=B1  3%      -0.0        0.40 =C2=B1  3%      -0.0        0.4=
0 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_buffered_write_iomap_end
      0.34 =C2=B1  3%      -0.0        0.32 =C2=B1  5%      -0.0        0.3=
1 =C2=B1  6%  perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      0.43 =C2=B1  3%      -0.0        0.41 =C2=B1  5%      -0.0        0.4=
0        perf-profile.children.cycles-pp.xfs_file_write_iter
      0.30 =C2=B1  4%      -0.0        0.28 =C2=B1  2%      -0.0        0.2=
8 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_break_leased_layouts
      0.78 =C2=B1  5%      -0.0        0.76 =C2=B1  2%      -0.0        0.7=
6 =C2=B1  4%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.65 =C2=B1  4%      -0.0        0.63 =C2=B1  3%      -0.0        0.6=
3 =C2=B1  2%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.79            -0.0        0.77 =C2=B1  4%      -0.0        0.78 =C2=
=B1  3%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      1.08 =C2=B1  6%      -0.0        1.06 =C2=B1  4%      -0.1        1.0=
1 =C2=B1  3%  perf-profile.children.cycles-pp.xlog_cil_commit
      0.77 =C2=B1  2%      -0.0        0.75 =C2=B1  3%      -0.0        0.7=
5 =C2=B1  3%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
      0.41 =C2=B1  6%      -0.0        0.39 =C2=B1  5%      -0.0        0.4=
0 =C2=B1  5%  perf-profile.children.cycles-pp.__cond_resched
      0.60 =C2=B1  3%      -0.0        0.58 =C2=B1  4%      -0.0        0.5=
7        perf-profile.children.cycles-pp.get_page_from_freelist
      0.09 =C2=B1 13%      -0.0        0.08 =C2=B1  9%      -0.0        0.0=
8 =C2=B1  7%  perf-profile.children.cycles-pp.xfs_get_extsz_hint
      0.61 =C2=B1  3%      -0.0        0.59 =C2=B1  2%      -0.0        0.5=
8 =C2=B1  2%  perf-profile.children.cycles-pp.xas_store
      0.56 =C2=B1  5%      -0.0        0.54 =C2=B1  4%      -0.0        0.5=
4 =C2=B1  5%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.63 =C2=B1  5%      -0.0        0.61 =C2=B1  4%      -0.0        0.6=
1 =C2=B1  5%  perf-profile.children.cycles-pp.security_file_permission
      0.12 =C2=B1  6%      -0.0        0.11 =C2=B1 10%      -0.0        0.1=
1 =C2=B1  8%  perf-profile.children.cycles-pp.disk_wrt
      0.10 =C2=B1  7%      -0.0        0.09 =C2=B1  7%      -0.0        0.0=
9 =C2=B1  9%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.45 =C2=B1  2%      -0.0        0.43 =C2=B1  4%      -0.0        0.4=
3 =C2=B1  5%  perf-profile.children.cycles-pp.charge_memcg
      0.24 =C2=B1  3%      -0.0        0.23 =C2=B1  3%      -0.0        0.2=
3 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_bmbt_to_iomap
      0.40 =C2=B1  3%      -0.0        0.38 =C2=B1  5%      -0.0        0.3=
7 =C2=B1  4%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      0.30 =C2=B1  8%      -0.0        0.28 =C2=B1  6%      +0.0        0.3=
0 =C2=B1  6%  perf-profile.children.cycles-pp.xfs_errortag_test
      0.05 =C2=B1  8%      -0.0        0.04 =C2=B1 72%      -0.0        0.0=
4 =C2=B1 45%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.15 =C2=B1  7%      -0.0        0.14 =C2=B1  8%      -0.0        0.1=
4 =C2=B1  7%  perf-profile.children.cycles-pp.folio_memcg_lock
      0.84 =C2=B1  3%      -0.0        0.83 =C2=B1  5%      -0.0        0.8=
3 =C2=B1  3%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.02 =C2=B1144%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.children.cycles-pp.xfs_log_ticket_ungrant
      0.28 =C2=B1  4%      -0.0        0.27 =C2=B1  6%      -0.0        0.2=
6 =C2=B1  5%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.12 =C2=B1  6%      -0.0        0.10 =C2=B1  4%      -0.0        0.1=
1 =C2=B1 10%  perf-profile.children.cycles-pp.aa_file_perm
      0.73 =C2=B1  6%      -0.0        0.72 =C2=B1  4%      -0.0        0.7=
0 =C2=B1  3%  perf-profile.children.cycles-pp.xlog_cil_insert_items
      0.34 =C2=B1  3%      -0.0        0.33 =C2=B1  4%      -0.0        0.3=
2 =C2=B1  4%  perf-profile.children.cycles-pp.find_lock_entries
      0.07 =C2=B1  6%      -0.0        0.06 =C2=B1 11%      -0.0        0.0=
7 =C2=B1  7%  perf-profile.children.cycles-pp.filemap_free_folio
      0.05 =C2=B1  8%      -0.0        0.04 =C2=B1 45%      -0.0        0.0=
5 =C2=B1 46%  perf-profile.children.cycles-pp.schedule_idle
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.xlog_grant_add_space
      0.21 =C2=B1  4%      -0.0        0.20 =C2=B1  5%      -0.0        0.2=
0 =C2=B1  3%  perf-profile.children.cycles-pp.current_time
      0.05            -0.0        0.04 =C2=B1 44%      -0.0        0.03 =C2=
=B1 70%  perf-profile.children.cycles-pp.xfs_buf_item_size
      0.12 =C2=B1  3%      -0.0        0.12 =C2=B1  4%      -0.0        0.1=
2 =C2=B1  8%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.xfs_buf_item_size_segment
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.xfs_buf_rele
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.children.cycles-pp.xfs_trans_alloc_dir
      0.01 =C2=B1223%      -0.0        0.00            +0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.xfs_inode_to_log_dinode
      0.18 =C2=B1 10%      -0.0        0.17 =C2=B1 10%      -0.0        0.1=
7 =C2=B1  4%  perf-profile.children.cycles-pp.inode_to_bdi
      0.13 =C2=B1  6%      -0.0        0.12 =C2=B1  6%      -0.0        0.1=
2 =C2=B1  6%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.05 =C2=B1 46%      -0.0        0.04 =C2=B1 44%      -0.0        0.0=
4 =C2=B1 45%  perf-profile.children.cycles-pp.fprintf
      0.08            -0.0        0.07 =C2=B1  5%      -0.0        0.08 =C2=
=B1  9%  perf-profile.children.cycles-pp.PageHeadHuge
      0.10 =C2=B1  8%      -0.0        0.09 =C2=B1  7%      -0.0        0.0=
9 =C2=B1  6%  perf-profile.children.cycles-pp.__list_add_valid
      0.66 =C2=B1  3%      -0.0        0.65 =C2=B1  3%      -0.0        0.6=
4 =C2=B1  2%  perf-profile.children.cycles-pp.xas_load
      0.30 =C2=B1  3%      -0.0        0.30 =C2=B1  6%      -0.0        0.2=
9 =C2=B1  3%  perf-profile.children.cycles-pp.uncharge_batch
      0.23 =C2=B1  5%      -0.0        0.22 =C2=B1  3%      -0.0        0.2=
2 =C2=B1  6%  perf-profile.children.cycles-pp.free_unref_page_list
      0.71 =C2=B1  3%      -0.0        0.70 =C2=B1  5%      -0.0        0.7=
0 =C2=B1  4%  perf-profile.children.cycles-pp.fault_in_readable
      0.38 =C2=B1  2%      -0.0        0.37 =C2=B1  7%      -0.0        0.3=
8 =C2=B1  4%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.33 =C2=B1  3%      -0.0        0.32 =C2=B1  7%      +0.0        0.3=
3 =C2=B1  5%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.15 =C2=B1  6%      -0.0        0.14 =C2=B1  6%      -0.0        0.1=
4 =C2=B1  9%  perf-profile.children.cycles-pp.alloc_pages
      0.20 =C2=B1  4%      -0.0        0.19 =C2=B1  8%      -0.0        0.1=
9 =C2=B1  5%  perf-profile.children.cycles-pp.node_dirty_ok
      0.08 =C2=B1 10%      -0.0        0.08 =C2=B1 10%      -0.0        0.0=
8 =C2=B1  6%  perf-profile.children.cycles-pp.mem_cgroup_update_lru_size
      0.09 =C2=B1  8%      -0.0        0.08 =C2=B1  7%      +0.0        0.0=
9        perf-profile.children.cycles-pp.xa_get_order
      0.05 =C2=B1 50%      -0.0        0.04 =C2=B1 72%      +0.0        0.0=
5 =C2=B1 47%  perf-profile.children.cycles-pp.memcg_slab_free_hook
      0.26 =C2=B1  2%      -0.0        0.25 =C2=B1  4%      -0.0        0.2=
5 =C2=B1  5%  perf-profile.children.cycles-pp.try_charge_memcg
      0.10 =C2=B1  5%      -0.0        0.09 =C2=B1 10%      -0.0        0.0=
9 =C2=B1  4%  perf-profile.children.cycles-pp.mem_cgroup_charge_statistics
      0.07 =C2=B1 16%      -0.0        0.06 =C2=B1  7%      +0.0        0.0=
7 =C2=B1  8%  perf-profile.children.cycles-pp.mem_cgroup_track_foreign_dirt=
y_slowpath
      0.94 =C2=B1  3%      -0.0        0.94 =C2=B1  2%      -0.0        0.9=
1 =C2=B1  3%  perf-profile.children.cycles-pp.__might_resched
      0.30 =C2=B1  3%      -0.0        0.30 =C2=B1  2%      -0.0        0.2=
8 =C2=B1  3%  perf-profile.children.cycles-pp.rmqueue
      0.15 =C2=B1  4%      -0.0        0.15 =C2=B1  5%      -0.0        0.1=
4 =C2=B1  8%  perf-profile.children.cycles-pp.__xa_set_mark
      0.08 =C2=B1  8%      -0.0        0.08 =C2=B1 12%      -0.0        0.0=
8 =C2=B1  8%  perf-profile.children.cycles-pp.iomap_adjust_read_range
      0.27 =C2=B1  4%      -0.0        0.27 =C2=B1  5%      -0.0        0.2=
7 =C2=B1  2%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.15 =C2=B1  3%      -0.0        0.14 =C2=B1  6%      -0.0        0.1=
5 =C2=B1  6%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.17 =C2=B1  9%      -0.0        0.16 =C2=B1  4%      +0.0        0.1=
7 =C2=B1  9%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      0.09 =C2=B1 15%      -0.0        0.09 =C2=B1 12%      -0.0        0.0=
9 =C2=B1 12%  perf-profile.children.cycles-pp.rcu_do_batch
      0.06 =C2=B1 13%      -0.0        0.05 =C2=B1  8%      -0.0        0.0=
4 =C2=B1 45%  perf-profile.children.cycles-pp.xfs_mod_freecounter
      0.08 =C2=B1  4%      -0.0        0.08 =C2=B1  8%      -0.0        0.0=
7 =C2=B1 12%  perf-profile.children.cycles-pp.xas_find
      0.08 =C2=B1 12%      -0.0        0.08 =C2=B1 14%      -0.0        0.0=
7 =C2=B1 14%  perf-profile.children.cycles-pp.xfs_buf_lock
      0.22 =C2=B1  3%      -0.0        0.22 =C2=B1  4%      -0.0        0.2=
2 =C2=B1  5%  perf-profile.children.cycles-pp.filemap_unaccount_folio
      0.12 =C2=B1  6%      -0.0        0.11 =C2=B1  6%      -0.0        0.1=
1 =C2=B1  9%  perf-profile.children.cycles-pp.xfs_ialloc_read_agi
      0.08 =C2=B1 12%      -0.0        0.08 =C2=B1  9%      -0.0        0.0=
8 =C2=B1 12%  perf-profile.children.cycles-pp.xfs_log_reserve
      0.09 =C2=B1 12%      -0.0        0.08 =C2=B1  8%      -0.0        0.0=
8 =C2=B1 11%  perf-profile.children.cycles-pp.xfs_trans_reserve
      0.07 =C2=B1  7%      -0.0        0.06 =C2=B1  7%      -0.0        0.0=
6 =C2=B1 11%  perf-profile.children.cycles-pp.folio_mapping
      0.15 =C2=B1  4%      -0.0        0.15 =C2=B1  4%      -0.0        0.1=
4 =C2=B1  8%  perf-profile.children.cycles-pp.xfs_iread_extents
      0.08 =C2=B1 14%      -0.0        0.08 =C2=B1 16%      -0.0        0.0=
7 =C2=B1 15%  perf-profile.children.cycles-pp.down
      0.07 =C2=B1 10%      -0.0        0.07 =C2=B1  7%      -0.0        0.0=
7 =C2=B1  7%  perf-profile.children.cycles-pp.xfs_iunlink_update_inode
      0.06 =C2=B1 14%      -0.0        0.06 =C2=B1  9%      -0.0        0.0=
6 =C2=B1  9%  perf-profile.children.cycles-pp.xfs_bmap_add_extent_hole_delay
      0.06 =C2=B1  9%      -0.0        0.06 =C2=B1  6%      -0.0        0.0=
6 =C2=B1  6%  perf-profile.children.cycles-pp.iomap_iter_done
      0.06 =C2=B1 13%      -0.0        0.06 =C2=B1 11%      +0.0        0.0=
6 =C2=B1 11%  perf-profile.children.cycles-pp.times
      0.12            -0.0        0.12 =C2=B1 11%      -0.0        0.11 =C2=
=B1  7%  perf-profile.children.cycles-pp.xlog_cil_alloc_shadow_bufs
      0.08 =C2=B1 10%      -0.0        0.07 =C2=B1 12%      -0.0        0.0=
7 =C2=B1 14%  perf-profile.children.cycles-pp.__down_common
      0.11 =C2=B1  8%      -0.0        0.11 =C2=B1  9%      -0.0        0.1=
1 =C2=B1  3%  perf-profile.children.cycles-pp.xas_clear_mark
      0.12 =C2=B1  4%      -0.0        0.11 =C2=B1  4%      -0.0        0.1=
1 =C2=B1  7%  perf-profile.children.cycles-pp.xfs_bmapi_reserve_delalloc
      0.11 =C2=B1  9%      -0.0        0.11 =C2=B1  8%      -0.0        0.1=
0 =C2=B1  9%  perf-profile.children.cycles-pp.xfs_trans_alloc
      0.10 =C2=B1  3%      -0.0        0.10 =C2=B1 10%      -0.0        0.0=
9        perf-profile.children.cycles-pp.xfs_lookup
      0.10 =C2=B1  7%      -0.0        0.10 =C2=B1 11%      -0.0        0.0=
9        perf-profile.children.cycles-pp.xfs_dir_lookup
      0.04 =C2=B1 45%      +0.0        0.04 =C2=B1 45%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.vfprintf
      0.02 =C2=B1 99%      +0.0        0.02 =C2=B1 99%      -0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.xas_set_mark
      0.10 =C2=B1  7%      +0.0        0.10 =C2=B1 10%      -0.0        0.1=
0 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_vn_lookup
      0.08 =C2=B1  6%      +0.0        0.08 =C2=B1 12%      -0.0        0.0=
7        perf-profile.children.cycles-pp.xfs_dir2_node_lookup
      0.18 =C2=B1  6%      +0.0        0.18 =C2=B1  6%      -0.0        0.1=
7 =C2=B1  5%  perf-profile.children.cycles-pp.rcu_all_qs
      0.07 =C2=B1 11%      +0.0        0.07 =C2=B1 11%      -0.0        0.0=
6 =C2=B1  7%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.06 =C2=B1 11%      +0.0        0.06 =C2=B1 11%      -0.0        0.0=
6 =C2=B1 13%  perf-profile.children.cycles-pp.node_page_state
      0.06 =C2=B1  6%      +0.0        0.06 =C2=B1 17%      +0.0        0.0=
6 =C2=B1  6%  perf-profile.children.cycles-pp.rebalance_domains
      0.05 =C2=B1 46%      +0.0        0.05 =C2=B1 46%      +0.0        0.0=
5 =C2=B1 53%  perf-profile.children.cycles-pp.xfs_next_bit
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.free_pcp_prepare
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.serial8250_console_write
      0.02 =C2=B1 99%      +0.0        0.02 =C2=B1 99%      +0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.balance_dirty_pages
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.uart_console_write
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.xfs_dir3_data_read
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.xfs_verify_agino
      0.08 =C2=B1 13%      +0.0        0.08 =C2=B1 11%      +0.0        0.0=
9 =C2=B1 12%  perf-profile.children.cycles-pp.kmem_cache_free
      0.02 =C2=B1 99%      +0.0        0.02 =C2=B1 99%      +0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.xfs_iextents_copy
      0.09 =C2=B1  6%      +0.0        0.09 =C2=B1 14%      +0.0        0.0=
9 =C2=B1 10%  perf-profile.children.cycles-pp.xfs_btree_lookup_get_block
      0.08 =C2=B1  6%      +0.0        0.08 =C2=B1 14%      +0.0        0.0=
8 =C2=B1 12%  perf-profile.children.cycles-pp.xfs_btree_read_buf_block
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.irq_work_run
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.irq_work_single
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp._printk
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.vprintk_emit
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.console_unlock
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.call_console_drivers
      0.00            +0.0        0.00            +0.0        0.01 =C2=B122=
3%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.0        0.00            +0.0        0.01 =C2=B122=
3%  perf-profile.children.cycles-pp.policy_node
      0.01 =C2=B1223%      +0.0        0.01 =C2=B1223%      +0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.16 =C2=B1  4%      +0.0        0.16 =C2=B1 10%      -0.0        0.1=
5 =C2=B1  9%  perf-profile.children.cycles-pp.xfs_read_agi
      0.10 =C2=B1  4%      +0.0        0.10 =C2=B1  6%      -0.0        0.0=
9 =C2=B1  9%  perf-profile.children.cycles-pp.free_unref_page_commit
      0.07 =C2=B1  6%      +0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 10%  perf-profile.children.cycles-pp.folio_memcg_unlock
      0.29 =C2=B1  7%      +0.0        0.30 =C2=B1  3%      -0.0        0.2=
9 =C2=B1  3%  perf-profile.children.cycles-pp.generic_write_checks
      0.10 =C2=B1 10%      +0.0        0.10 =C2=B1  7%      +0.0        0.1=
0 =C2=B1 14%  perf-profile.children.cycles-pp.xfs_inode_item_format
      0.09 =C2=B1  7%      +0.0        0.09 =C2=B1 14%      -0.0        0.0=
9 =C2=B1  4%  perf-profile.children.cycles-pp.rwsem_wake
      0.08 =C2=B1  4%      +0.0        0.08 =C2=B1  7%      -0.0        0.0=
8 =C2=B1  6%  perf-profile.children.cycles-pp.uncharge_folio
      0.06 =C2=B1 11%      +0.0        0.07 =C2=B1 11%      -0.0        0.0=
6 =C2=B1 11%  perf-profile.children.cycles-pp.schedule_timeout
      0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  8%      -0.0        0.1=
1 =C2=B1  5%  perf-profile.children.cycles-pp.iomap_page_create
      0.07 =C2=B1  9%      +0.0        0.07 =C2=B1 15%      -0.0        0.0=
7 =C2=B1 10%  perf-profile.children.cycles-pp.wake_up_q
      0.12 =C2=B1 12%      +0.0        0.12 =C2=B1 11%      +0.0        0.1=
2 =C2=B1 12%  perf-profile.children.cycles-pp.rcu_core
      0.06 =C2=B1  9%      +0.0        0.06 =C2=B1  8%      +0.0        0.0=
6 =C2=B1  9%  perf-profile.children.cycles-pp.iov_iter_init
      0.10 =C2=B1  5%      +0.0        0.10 =C2=B1  4%      +0.0        0.1=
0 =C2=B1  7%  perf-profile.children.cycles-pp.xas_create
      0.06 =C2=B1  9%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 45%  perf-profile.children.cycles-pp.xfs_imap_to_bp
      0.06 =C2=B1  6%      +0.0        0.06 =C2=B1  9%      +0.0        0.0=
6 =C2=B1  6%  perf-profile.children.cycles-pp.xfs_buf_item_init
      0.03 =C2=B1 70%      +0.0        0.04 =C2=B1 71%      +0.0        0.0=
4 =C2=B1 44%  perf-profile.children.cycles-pp.rw_verify_area
      0.28 =C2=B1  5%      +0.0        0.29 =C2=B1  8%      -0.0        0.2=
7 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_buf_read_map
      0.06 =C2=B1 13%      +0.0        0.06 =C2=B1 11%      -0.0        0.0=
4 =C2=B1 45%  perf-profile.children.cycles-pp.xfs_isilocked
      0.08            +0.0        0.08 =C2=B1  8%      -0.0        0.08 =C2=
=B1  8%  perf-profile.children.cycles-pp.xfs_iunlink_remove
      0.14 =C2=B1  9%      +0.0        0.14 =C2=B1  8%      +0.0        0.1=
4 =C2=B1  6%  perf-profile.children.cycles-pp.xfs_btree_lookup
      0.05            +0.0        0.05 =C2=B1  8%      +0.0        0.05 =C2=
=B1  8%  perf-profile.children.cycles-pp.xas_alloc
      0.10 =C2=B1  6%      +0.0        0.10 =C2=B1  9%      +0.0        0.1=
1 =C2=B1  6%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1 13%      -0.0        0.0=
4 =C2=B1 45%  perf-profile.children.cycles-pp.xfs_init_new_inode
      0.06 =C2=B1  6%      +0.0        0.06 =C2=B1  7%      -0.0        0.0=
6 =C2=B1  9%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
      0.11 =C2=B1  6%      +0.0        0.11 =C2=B1 12%      -0.0        0.1=
0 =C2=B1  6%  perf-profile.children.cycles-pp.xfs_iunlink
      0.12 =C2=B1  8%      +0.0        0.12 =C2=B1  9%      -0.0        0.1=
1 =C2=B1  6%  perf-profile.children.cycles-pp.try_to_wake_up
      0.08 =C2=B1  8%      +0.0        0.08 =C2=B1  8%      -0.0        0.0=
8 =C2=B1  8%  perf-profile.children.cycles-pp.xas_find_conflict
      0.10 =C2=B1  6%      +0.0        0.10 =C2=B1 13%      +0.0        0.1=
0 =C2=B1 10%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1  9%      +0.0        0.0=
7 =C2=B1 17%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.09 =C2=B1  8%      +0.0        0.09 =C2=B1 15%      +0.0        0.0=
9 =C2=B1 12%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.06            +0.0        0.06 =C2=B1  7%      +0.0        0.06 =C2=
=B1  6%  perf-profile.children.cycles-pp.kmem_cache_alloc
      0.15 =C2=B1 11%      +0.0        0.15 =C2=B1  4%      +0.0        0.1=
5 =C2=B1  7%  perf-profile.children.cycles-pp.generic_write_check_limits
      0.26 =C2=B1  4%      +0.0        0.27 =C2=B1  9%      -0.0        0.2=
6 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_buf_get_map
      0.18 =C2=B1  2%      +0.0        0.18 =C2=B1  9%      -0.0        0.1=
7 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_da_read_buf
      0.14 =C2=B1  7%      +0.0        0.14 =C2=B1  7%      -0.0        0.1=
4 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_dir_createname
      0.07 =C2=B1  9%      +0.0        0.08 =C2=B1  9%      -0.0        0.0=
7        perf-profile.children.cycles-pp.xfs_dir2_leafn_remove
      0.07 =C2=B1  7%      +0.0        0.07 =C2=B1  9%      -0.0        0.0=
6 =C2=B1  7%  perf-profile.children.cycles-pp.up
      0.13 =C2=B1 10%      +0.0        0.14 =C2=B1  4%      +0.0        0.1=
3 =C2=B1  5%  perf-profile.children.cycles-pp.file_modified
      0.10 =C2=B1 10%      +0.0        0.10 =C2=B1  4%      +0.0        0.1=
0 =C2=B1  6%  perf-profile.children.cycles-pp.file_remove_privs
      0.42 =C2=B1  2%      +0.0        0.42 =C2=B1  7%      -0.0        0.4=
0 =C2=B1  2%  perf-profile.children.cycles-pp.xfs_trans_read_buf_map
      0.24 =C2=B1  5%      +0.0        0.25 =C2=B1  9%      -0.0        0.2=
4 =C2=B1  5%  perf-profile.children.cycles-pp.xfs_buf_find
      0.11 =C2=B1  3%      +0.0        0.12 =C2=B1  7%      -0.0        0.1=
1 =C2=B1  7%  perf-profile.children.cycles-pp._xfs_trans_bjoin
      0.08 =C2=B1  9%      +0.0        0.08 =C2=B1 11%      +0.0        0.0=
8 =C2=B1  7%  perf-profile.children.cycles-pp.xfs_dir2_node_addname_int
      0.06 =C2=B1  9%      +0.0        0.06 =C2=B1 11%      +0.0        0.0=
6 =C2=B1 13%  perf-profile.children.cycles-pp.xlog_prepare_iovec
      0.10 =C2=B1  6%      +0.0        0.10 =C2=B1 16%      +0.0        0.1=
0 =C2=B1 11%  perf-profile.children.cycles-pp.find_busiest_group
      0.24 =C2=B1  5%      +0.0        0.24 =C2=B1  5%      -0.0        0.2=
4 =C2=B1  4%  perf-profile.children.cycles-pp.xas_start
      0.13 =C2=B1  8%      +0.0        0.14 =C2=B1  7%      -0.0        0.1=
3 =C2=B1  5%  perf-profile.children.cycles-pp.xfs_dir2_node_addname
      0.12 =C2=B1 10%      +0.0        0.12 =C2=B1  7%      +0.0        0.1=
2 =C2=B1  4%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.32 =C2=B1  2%      +0.0        0.33 =C2=B1  5%      +0.0        0.3=
2 =C2=B1  3%  perf-profile.children.cycles-pp.folio_unlock
      0.02 =C2=B1 99%      +0.0        0.03 =C2=B1 70%      +0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.xfs_inode_item_format_data_fo=
rk
      0.07            +0.0        0.08 =C2=B1  8%      -0.0        0.07 =C2=
=B1  7%  perf-profile.children.cycles-pp.xfs_buf_unlock
      0.08 =C2=B1  6%      +0.0        0.08 =C2=B1  5%      -0.0        0.0=
7 =C2=B1  6%  perf-profile.children.cycles-pp.xfs_buf_item_release
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%      -0.0        0.0=
0        perf-profile.children.cycles-pp.xfs_verify_dir_ino
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.ttwu_do_activate
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.enqueue_task_fair
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.xfs_dabuf_map
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.calc_global_load_tick
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.xfs_iget
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.dequeue_entity
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.children.cycles-pp.xfs_defer_trans_roll
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
2 =C2=B1141%  perf-profile.children.cycles-pp.irq_work_run_list
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1 99%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1 99%      +0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.generic_file_write_iter
      0.10 =C2=B1 12%      +0.0        0.11 =C2=B1 11%      +0.0        0.1=
0 =C2=B1  5%  perf-profile.children.cycles-pp.newidle_balance
      0.10 =C2=B1 16%      +0.0        0.11 =C2=B1  8%      +0.0        0.1=
0 =C2=B1 10%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.12 =C2=B1  5%      +0.0        0.13 =C2=B1 13%      +0.0        0.1=
2 =C2=B1  7%  perf-profile.children.cycles-pp.load_balance
      0.27 =C2=B1  8%      +0.0        0.28 =C2=B1 11%      +0.0        0.2=
8 =C2=B1  3%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.09 =C2=B1  4%      +0.0        0.10 =C2=B1 10%      -0.0        0.0=
8 =C2=B1  8%  perf-profile.children.cycles-pp.xfs_dir2_leafn_lookup_for_ent=
ry
      0.07 =C2=B1  8%      +0.0        0.08 =C2=B1  7%      -0.0        0.0=
6 =C2=B1  7%  perf-profile.children.cycles-pp.xfs_inactive_truncate
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1142%      -0.0        0.0=
0        perf-profile.children.cycles-pp.tick_sched_do_timer
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 45%      -0.0        0.0=
3 =C2=B1 70%  perf-profile.children.cycles-pp.xfs_perag_get
      0.05 =C2=B1  7%      +0.0        0.06 =C2=B1 14%      +0.0        0.0=
6 =C2=B1  6%  perf-profile.children.cycles-pp.__rhashtable_lookup
      0.19 =C2=B1  8%      +0.0        0.20 =C2=B1  8%      -0.0        0.1=
8 =C2=B1  7%  perf-profile.children.cycles-pp.schedule
      0.24 =C2=B1  7%      +0.0        0.25 =C2=B1  9%      +0.0        0.2=
4 =C2=B1  6%  perf-profile.children.cycles-pp.__schedule
      0.10 =C2=B1 13%      +0.0        0.11 =C2=B1 29%      +0.0        0.1=
0 =C2=B1 11%  perf-profile.children.cycles-pp.update_load_avg
      0.06 =C2=B1 11%      +0.0        0.07 =C2=B1 34%      +0.0        0.0=
6 =C2=B1  9%  perf-profile.children.cycles-pp.update_cfs_group
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1102%      +0.0        0.0=
3 =C2=B1 70%  perf-profile.children.cycles-pp.flush_smp_call_function_from_=
idle
      0.04 =C2=B1 71%      +0.0        0.05 =C2=B1  7%      +0.0        0.0=
4 =C2=B1 44%  perf-profile.children.cycles-pp.workingset_update_node
      0.22 =C2=B1 10%      +0.0        0.24 =C2=B1 11%      +0.0        0.2=
3 =C2=B1 11%  perf-profile.children.cycles-pp.ktime_get
      0.09 =C2=B1  4%      +0.0        0.11 =C2=B1 11%      +0.0        0.0=
9 =C2=B1  7%  perf-profile.children.cycles-pp.xfs_dir3_data_check
      0.20 =C2=B1  8%      +0.0        0.22 =C2=B1 13%      -0.0        0.2=
0 =C2=B1 12%  perf-profile.children.cycles-pp.clockevents_program_event
      0.24 =C2=B1  6%      +0.0        0.26 =C2=B1 11%      +0.0        0.2=
5 =C2=B1  2%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.22            +0.0        0.24 =C2=B1 11%      -0.0        0.21 =C2=
=B1  5%  perf-profile.children.cycles-pp.xfs_dir_removename
      0.30 =C2=B1  5%      +0.0        0.32 =C2=B1  4%      +0.0        0.3=
0 =C2=B1  5%  perf-profile.children.cycles-pp.memcpy_erms
      0.09            +0.0        0.11 =C2=B1 11%      +0.0        0.09 =C2=
=B1  7%  perf-profile.children.cycles-pp.__xfs_dir3_data_check
      0.00            +0.0        0.02 =C2=B1141%      +0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.0        0.02 =C2=B1141%      +0.0        0.01 =C2=
=B1223%  perf-profile.children.cycles-pp.slab_pre_alloc_hook
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%      +0.0        0.0=
3 =C2=B1 70%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.00            +0.0        0.02 =C2=B1141%      +0.0        0.02 =C2=
=B1141%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%      +0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.memcg_check_events
      0.22            +0.0        0.24 =C2=B1 10%      -0.0        0.21 =C2=
=B1  3%  perf-profile.children.cycles-pp.xfs_da3_node_lookup_int
      0.21 =C2=B1  2%      +0.0        0.23 =C2=B1 10%      -0.0        0.2=
0 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_dir2_node_removename
      0.02 =C2=B1141%      +0.0        0.04 =C2=B1 71%      +0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.0        0.02 =C2=B1144%      +0.0        0.04 =C2=
=B1 44%  perf-profile.children.cycles-pp.update_rq_clock
      0.03 =C2=B1 70%      +0.0        0.05 =C2=B1  8%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.11 =C2=B1  6%      +0.0        0.13 =C2=B1 11%      +0.0        0.1=
2 =C2=B1  7%  perf-profile.children.cycles-pp.menu_select
      0.03 =C2=B1101%      +0.0        0.05 =C2=B1 50%      +0.0        0.0=
5 =C2=B1 54%  perf-profile.children.cycles-pp.xfs_inobt_irec_to_allocmask
      0.10 =C2=B1  3%      +0.0        0.12 =C2=B1 10%      +0.0        0.1=
2 =C2=B1  9%  perf-profile.children.cycles-pp.xfs_difree_finobt
      0.41 =C2=B1  4%      +0.0        0.44 =C2=B1  3%      -0.0        0.4=
1 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_buf_item_format_segment
      0.42 =C2=B1  3%      +0.0        0.44 =C2=B1  3%      -0.0        0.4=
1 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_buf_item_format
      0.14 =C2=B1 11%      +0.0        0.16 =C2=B1 40%      +0.0        0.1=
5 =C2=B1 10%  perf-profile.children.cycles-pp.task_tick_fair
      0.68 =C2=B1  2%      +0.0        0.71 =C2=B1  9%      -0.0        0.6=
5 =C2=B1  2%  perf-profile.children.cycles-pp.xfs_remove
      0.70            +0.0        0.72 =C2=B1  9%      -0.0        0.66 =C2=
=B1  2%  perf-profile.children.cycles-pp.vfs_unlink
      0.68 =C2=B1  2%      +0.0        0.71 =C2=B1  9%      -0.0        0.6=
5 =C2=B1  2%  perf-profile.children.cycles-pp.xfs_vn_unlink
      0.57 =C2=B1  3%      +0.0        0.60 =C2=B1  4%      +0.0        0.5=
7 =C2=B1  4%  perf-profile.children.cycles-pp.xlog_cil_insert_format_items
      0.02 =C2=B1141%      +0.0        0.06 =C2=B1  9%      -0.0        0.0=
1 =C2=B1223%  perf-profile.children.cycles-pp.xfs_itruncate_extents_flags
      0.24 =C2=B1  8%      +0.0        0.28 =C2=B1 25%      +0.0        0.2=
5 =C2=B1  7%  perf-profile.children.cycles-pp.scheduler_tick
      0.01 =C2=B1223%      +0.0        0.05 =C2=B1  7%      +0.0        0.0=
4 =C2=B1 44%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +0.0        0.04 =C2=B1 45%      +0.0        0.04 =C2=
=B1 44%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.32 =C2=B1  7%      +0.0        0.37 =C2=B1 22%      +0.0        0.3=
4 =C2=B1  8%  perf-profile.children.cycles-pp.update_process_times
      0.33 =C2=B1  7%      +0.0        0.38 =C2=B1 22%      +0.0        0.3=
5 =C2=B1  8%  perf-profile.children.cycles-pp.tick_sched_handle
      0.38 =C2=B1  6%      +0.1        0.44 =C2=B1 21%      +0.0        0.4=
0 =C2=B1  8%  perf-profile.children.cycles-pp.tick_sched_timer
      0.46 =C2=B1  5%      +0.1        0.53 =C2=B1 18%      +0.0        0.4=
8 =C2=B1  7%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.90 =C2=B1  3%      +0.1        1.98 =C2=B1  4%      +0.0        1.9=
2 =C2=B1  2%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.74 =C2=B1  6%      +0.1        0.83 =C2=B1 15%      +0.0        0.7=
6 =C2=B1  7%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.73 =C2=B1  6%      +0.1        0.82 =C2=B1 15%      +0.0        0.7=
5 =C2=B1  6%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.28 =C2=B1  5%      +0.1        0.37 =C2=B1  4%      +0.1        0.3=
6 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_difree_inobt
      0.19 =C2=B1  3%      +0.1        0.29 =C2=B1  7%      +0.1        0.2=
9 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_btree_get_rec
      0.44 =C2=B1  4%      +0.1        0.55 =C2=B1  4%      +0.1        0.5=
5 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_difree
      0.20 =C2=B1  9%      +0.1        0.30 =C2=B1  7%      +0.1        0.2=
9 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_btree_increment
      1.10 =C2=B1  6%      +0.1        1.21 =C2=B1 12%      +0.0        1.1=
4 =C2=B1  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.53 =C2=B1  3%      +0.1        0.64 =C2=B1  4%      +0.1        0.6=
4 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_ifree
      0.88 =C2=B1  3%      +0.1        1.00 =C2=B1  3%      +0.1        0.9=
9 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_inactive_ifree
      0.38 =C2=B1  4%      +0.1        0.50 =C2=B1  6%      +0.1        0.5=
0 =C2=B1  6%  perf-profile.children.cycles-pp.xfs_inobt_get_rec
      0.95 =C2=B1  3%      +0.1        1.08 =C2=B1  3%      +0.1        1.0=
5 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_inactive
      0.96 =C2=B1  3%      +0.1        1.09 =C2=B1  3%      +0.1        1.0=
6 =C2=B1  4%  perf-profile.children.cycles-pp.xfs_inodegc_worker
      0.42 =C2=B1  3%      +0.1        0.55 =C2=B1  7%      +0.1        0.5=
3 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_dialloc_ag
      0.98 =C2=B1  3%      +0.1        1.11 =C2=B1  3%      +0.1        1.0=
9 =C2=B1  4%  perf-profile.children.cycles-pp.process_one_work
      0.48 =C2=B1  3%      +0.1        0.61 =C2=B1  8%      +0.1        0.5=
8 =C2=B1  2%  perf-profile.children.cycles-pp.xfs_dialloc
      0.99 =C2=B1  3%      +0.1        1.12 =C2=B1  3%      +0.1        1.0=
9 =C2=B1  3%  perf-profile.children.cycles-pp.worker_thread
      0.99 =C2=B1  3%      +0.1        1.13 =C2=B1  3%      +0.1        1.1=
0 =C2=B1  3%  perf-profile.children.cycles-pp.kthread
      0.99 =C2=B1  3%      +0.1        1.14 =C2=B1  3%      +0.1        1.1=
0 =C2=B1  3%  perf-profile.children.cycles-pp.ret_from_fork
      1.11 =C2=B1  3%      +0.2        1.26 =C2=B1  6%      +0.1        1.1=
9        perf-profile.children.cycles-pp.lookup_open
      0.95 =C2=B1  4%      +0.2        1.10 =C2=B1  6%      +0.1        1.0=
4        perf-profile.children.cycles-pp.xfs_create
      0.96 =C2=B1  4%      +0.2        1.12 =C2=B1  6%      +0.1        1.0=
5        perf-profile.children.cycles-pp.xfs_generic_create
      0.13 =C2=B1  5%      +0.2        0.33 =C2=B1  6%      +0.2        0.3=
2 =C2=B1  2%  perf-profile.children.cycles-pp.__xfs_btree_check_sblock
      1.30 =C2=B1  7%      +0.2        1.51 =C2=B1 21%      -0.0        1.2=
8 =C2=B1  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interru=
pt
      0.22 =C2=B1  6%      +0.2        0.43 =C2=B1  6%      +0.2        0.4=
2        perf-profile.children.cycles-pp.xfs_btree_check_sblock
      0.68 =C2=B1  4%      +0.2        0.91 =C2=B1  5%      +0.2        0.9=
0 =C2=B1  3%  perf-profile.children.cycles-pp.xfs_check_agi_freecount
     72.85 =C2=B1  3%      +0.3       73.10 =C2=B1  2%      +0.6       73.4=
3 =C2=B1  2%  perf-profile.children.cycles-pp.do_syscall_64
     73.11 =C2=B1  3%      +0.3       73.36 =C2=B1  2%      +0.6       73.6=
9 =C2=B1  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     19.36 =C2=B1  4%      +0.7       20.06 =C2=B1  2%      +1.0       20.3=
2 =C2=B1  3%  perf-profile.children.cycles-pp.do_unlinkat
     19.37 =C2=B1  4%      +0.7       20.07 =C2=B1  2%      +1.0       20.3=
3 =C2=B1  3%  perf-profile.children.cycles-pp.__x64_sys_unlink
     19.41 =C2=B1  4%      +0.7       20.11 =C2=B1  2%      +1.0       20.3=
6 =C2=B1  3%  perf-profile.children.cycles-pp.unlink
     20.09 =C2=B1  4%      +0.9       20.95 =C2=B1  3%      +1.0       21.1=
2 =C2=B1  3%  perf-profile.children.cycles-pp.__x64_sys_creat
     20.10 =C2=B1  4%      +0.9       20.96 =C2=B1  3%      +1.0       21.1=
3 =C2=B1  3%  perf-profile.children.cycles-pp.do_sys_openat2
     20.12 =C2=B1  4%      +0.9       20.98 =C2=B1  3%      +1.0       21.1=
6 =C2=B1  3%  perf-profile.children.cycles-pp.creat64
     20.00 =C2=B1  4%      +0.9       20.87 =C2=B1  3%      +1.0       21.0=
4 =C2=B1  3%  perf-profile.children.cycles-pp.open_last_lookups
     20.07 =C2=B1  4%      +0.9       20.94 =C2=B1  3%      +1.0       21.1=
1 =C2=B1  3%  perf-profile.children.cycles-pp.do_filp_open
     20.07 =C2=B1  4%      +0.9       20.93 =C2=B1  3%      +1.0       21.1=
1 =C2=B1  3%  perf-profile.children.cycles-pp.path_openat
     35.30 =C2=B1  4%      +1.3       36.59 =C2=B1  3%      +1.9       37.2=
4 =C2=B1  3%  perf-profile.children.cycles-pp.osq_lock
     36.88 =C2=B1  4%      +1.3       38.19 =C2=B1  2%      +1.9       38.8=
3 =C2=B1  3%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
     37.40 =C2=B1  4%      +1.4       38.77 =C2=B1  2%      +2.0       39.3=
5 =C2=B1  3%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
     22.44 =C2=B1 12%      -0.4       22.00 =C2=B1  9%      -0.7       21.7=
5 =C2=B1  9%  perf-profile.self.cycles-pp.mwait_idle_with_hints
      0.39 =C2=B1  9%      -0.1        0.31 =C2=B1  4%      -0.1        0.3=
1 =C2=B1  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      2.89 =C2=B1  2%      -0.1        2.82 =C2=B1  3%      -0.0        2.8=
5 =C2=B1  3%  perf-profile.self.cycles-pp.__iomap_write_begin
      1.15 =C2=B1  4%      -0.1        1.10 =C2=B1  4%      -0.0        1.1=
0 =C2=B1  2%  perf-profile.self.cycles-pp.memset_erms
      0.72 =C2=B1  4%      -0.0        0.68 =C2=B1  5%      -0.1        0.6=
5 =C2=B1  3%  perf-profile.self.cycles-pp.vfs_write
      1.43 =C2=B1  3%      -0.0        1.39 =C2=B1  3%      -0.1        1.3=
7 =C2=B1  2%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.36 =C2=B1  7%      -0.0        0.32 =C2=B1  9%      -0.0        0.3=
2 =C2=B1  8%  perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited
      1.99 =C2=B1  5%      -0.0        1.95 =C2=B1  4%      -0.1        1.9=
3 =C2=B1  2%  perf-profile.self.cycles-pp.iomap_write_end
      0.52 =C2=B1  5%      -0.0        0.49 =C2=B1  2%      -0.0        0.4=
8 =C2=B1  3%  perf-profile.self.cycles-pp.iomap_write_iter
      0.66 =C2=B1  2%      -0.0        0.62 =C2=B1  2%      -0.0        0.6=
3 =C2=B1  2%  perf-profile.self.cycles-pp.iomap_file_buffered_write
      0.92 =C2=B1  4%      -0.0        0.89 =C2=B1  4%      -0.0        0.9=
1 =C2=B1  3%  perf-profile.self.cycles-pp.__filemap_get_folio
      0.43 =C2=B1  4%      -0.0        0.40 =C2=B1  3%      -0.0        0.4=
1 =C2=B1  6%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      1.03 =C2=B1  4%      -0.0        1.00 =C2=B1  4%      -0.0        0.9=
8 =C2=B1  4%  perf-profile.self.cycles-pp.iomap_iter
      0.56 =C2=B1  3%      -0.0        0.54 =C2=B1  3%      -0.0        0.5=
5 =C2=B1  3%  perf-profile.self.cycles-pp.up_write
      0.27 =C2=B1  8%      -0.0        0.24 =C2=B1  4%      -0.0        0.2=
5 =C2=B1  6%  perf-profile.self.cycles-pp.__fget_light
      0.21 =C2=B1  4%      -0.0        0.19 =C2=B1  5%      -0.0        0.1=
9 =C2=B1  3%  perf-profile.self.cycles-pp.file_update_time
      0.67 =C2=B1  4%      -0.0        0.64 =C2=B1  4%      -0.0        0.6=
3 =C2=B1  4%  perf-profile.self.cycles-pp.write
      0.47 =C2=B1  5%      -0.0        0.44 =C2=B1  4%      -0.0        0.4=
6 =C2=B1  3%  perf-profile.self.cycles-pp.xfs_file_buffered_write
      0.32 =C2=B1  3%      -0.0        0.30 =C2=B1  3%      -0.0        0.3=
0 =C2=B1  3%  perf-profile.self.cycles-pp.__might_sleep
      0.37 =C2=B1  5%      -0.0        0.35 =C2=B1  5%      -0.0        0.3=
4 =C2=B1  3%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.30 =C2=B1  4%      -0.0        0.28            -0.0        0.27 =C2=
=B1  4%  perf-profile.self.cycles-pp.xfs_break_leased_layouts
      0.42 =C2=B1  5%      -0.0        0.40 =C2=B1  4%      -0.0        0.4=
1 =C2=B1  6%  perf-profile.self.cycles-pp.__entry_text_start
      0.77 =C2=B1  5%      -0.0        0.75 =C2=B1  2%      -0.0        0.7=
5 =C2=B1  4%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.32 =C2=B1  3%      -0.0        0.30 =C2=B1  5%      -0.0        0.3=
0 =C2=B1  5%  perf-profile.self.cycles-pp.xfs_iext_lookup_extent
      0.27 =C2=B1  9%      -0.0        0.25 =C2=B1  5%      -0.0        0.2=
7 =C2=B1  5%  perf-profile.self.cycles-pp.xfs_errortag_test
      0.28 =C2=B1  3%      -0.0        0.26 =C2=B1  4%      -0.0        0.2=
8 =C2=B1  4%  perf-profile.self.cycles-pp.new_sync_write
      0.14 =C2=B1  6%      -0.0        0.12 =C2=B1  4%      -0.0        0.1=
3 =C2=B1  8%  perf-profile.self.cycles-pp.__alloc_pages
      0.42 =C2=B1  3%      -0.0        0.40 =C2=B1  5%      -0.0        0.4=
0 =C2=B1  2%  perf-profile.self.cycles-pp.xfs_file_write_iter
      0.30 =C2=B1  4%      -0.0        0.29 =C2=B1  2%      -0.0        0.2=
8 =C2=B1  3%  perf-profile.self.cycles-pp.xas_store
      0.25 =C2=B1  6%      -0.0        0.23 =C2=B1  3%      -0.0        0.2=
2 =C2=B1  4%  perf-profile.self.cycles-pp.xfs_iunlock
      0.21 =C2=B1  5%      -0.0        0.19 =C2=B1  6%      -0.0        0.1=
9 =C2=B1  3%  perf-profile.self.cycles-pp.xfs_ilock
      0.02 =C2=B1 99%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.self.cycles-pp.vfprintf
      0.38 =C2=B1  5%      -0.0        0.36 =C2=B1  5%      -0.0        0.3=
6 =C2=B1  3%  perf-profile.self.cycles-pp.filemap_dirty_folio
      0.43 =C2=B1  6%      -0.0        0.41 =C2=B1  4%      -0.0        0.4=
1 =C2=B1  3%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.21 =C2=B1  5%      -0.0        0.20 =C2=B1  8%      -0.0        0.2=
0 =C2=B1  8%  perf-profile.self.cycles-pp.__cond_resched
      0.04 =C2=B1 44%      -0.0        0.03 =C2=B1100%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.self.cycles-pp.__pagevec_lru_add
      0.21 =C2=B1  7%      -0.0        0.19 =C2=B1  2%      -0.0        0.1=
9 =C2=B1  7%  perf-profile.self.cycles-pp.__mod_lruvec_page_state
      0.24 =C2=B1  3%      -0.0        0.22 =C2=B1  5%      -0.0        0.2=
3 =C2=B1  4%  perf-profile.self.cycles-pp.xfs_bmbt_to_iomap
      0.27 =C2=B1  4%      -0.0        0.26 =C2=B1  4%      -0.0        0.2=
6 =C2=B1  5%  perf-profile.self.cycles-pp.xfs_buffered_write_iomap_end
      0.08 =C2=B1 13%      -0.0        0.07 =C2=B1 13%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.self.cycles-pp.xfs_get_extsz_hint
      0.78 =C2=B1  3%      -0.0        0.77 =C2=B1  4%      -0.0        0.7=
6 =C2=B1  4%  perf-profile.self.cycles-pp.xfs_buffered_write_iomap_begin
      0.06 =C2=B1  9%      -0.0        0.04 =C2=B1 45%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.self.cycles-pp.zero_user_segments
      0.30 =C2=B1  4%      -0.0        0.29 =C2=B1  3%      -0.0        0.2=
9 =C2=B1  5%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.93 =C2=B1  3%      -0.0        0.92 =C2=B1  3%      -0.0        0.9=
0 =C2=B1  3%  perf-profile.self.cycles-pp.__might_resched
      0.09 =C2=B1  7%      -0.0        0.08 =C2=B1  5%      -0.0        0.0=
8 =C2=B1 10%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.10 =C2=B1 10%      -0.0        0.08 =C2=B1  5%      -0.0        0.0=
8 =C2=B1  5%  perf-profile.self.cycles-pp.__list_add_valid
      0.36 =C2=B1  4%      -0.0        0.35 =C2=B1  4%      -0.0        0.3=
5 =C2=B1  4%  perf-profile.self.cycles-pp.iomap_write_begin
      0.07 =C2=B1  6%      -0.0        0.06 =C2=B1 11%      -0.0        0.0=
7 =C2=B1  7%  perf-profile.self.cycles-pp.filemap_free_folio
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.xfs_log_ticket_ungrant
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.01 =C2=
=B1223%  perf-profile.self.cycles-pp.xlog_grant_add_space
      0.12 =C2=B1  4%      -0.0        0.10 =C2=B1  4%      -0.0        0.1=
0 =C2=B1  4%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.09 =C2=B1  8%      -0.0        0.08 =C2=B1  6%      -0.0        0.0=
8 =C2=B1  8%  perf-profile.self.cycles-pp.truncate_cleanup_folio
      0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  7%      -0.0        0.1=
0 =C2=B1 10%  perf-profile.self.cycles-pp.aa_file_perm
      0.15 =C2=B1 13%      -0.0        0.14 =C2=B1 11%      -0.0        0.1=
4 =C2=B1  4%  perf-profile.self.cycles-pp.inode_to_bdi
      0.12 =C2=B1  3%      -0.0        0.12 =C2=B1  4%      -0.0        0.1=
2 =C2=B1  8%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.02 =C2=B1 99%      -0.0        0.02 =C2=B1141%      -0.0        0.0=
2 =C2=B1141%  perf-profile.self.cycles-pp.xfs_isilocked
      0.02 =C2=B1141%      -0.0        0.01 =C2=B1223%      -0.0        0.0=
0        perf-profile.self.cycles-pp.propagate_protected_usage
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.free_pcp_prepare
      0.01 =C2=B1223%      -0.0        0.00            -0.0        0.00    =
    perf-profile.self.cycles-pp.__x64_sys_write
      0.01 =C2=B1223%      -0.0        0.00            +0.0        0.01 =C2=
=B1223%  perf-profile.self.cycles-pp.xfs_verify_agino
      0.01 =C2=B1223%      -0.0        0.00            +0.0        0.01 =C2=
=B1223%  perf-profile.self.cycles-pp.xfs_btree_get_rec
      0.17 =C2=B1  5%      -0.0        0.16 =C2=B1  7%      -0.0        0.1=
6 =C2=B1  7%  perf-profile.self.cycles-pp._raw_spin_lock
      0.03 =C2=B1 70%      -0.0        0.02 =C2=B1 99%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.self.cycles-pp.iomap_iter_done
      0.69 =C2=B1  3%      -0.0        0.68 =C2=B1  6%      -0.0        0.6=
8 =C2=B1  3%  perf-profile.self.cycles-pp.fault_in_readable
      0.32 =C2=B1  4%      -0.0        0.31 =C2=B1  7%      +0.0        0.3=
2 =C2=B1  4%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.14 =C2=B1  4%      -0.0        0.14 =C2=B1  7%      -0.0        0.1=
3 =C2=B1  3%  perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      0.11 =C2=B1  4%      -0.0        0.10 =C2=B1  5%      -0.0        0.1=
0 =C2=B1 10%  perf-profile.self.cycles-pp.do_syscall_64
      0.07 =C2=B1  5%      -0.0        0.06 =C2=B1  6%      -0.0        0.0=
6 =C2=B1 11%  perf-profile.self.cycles-pp.PageHeadHuge
      0.06 =C2=B1 14%      -0.0        0.06 =C2=B1 11%      -0.0        0.0=
6 =C2=B1  7%  perf-profile.self.cycles-pp.charge_memcg
      0.13 =C2=B1  6%      -0.0        0.12 =C2=B1  7%      +0.0        0.1=
3 =C2=B1  8%  perf-profile.self.cycles-pp.folio_memcg_lock
      0.44 =C2=B1  4%      -0.0        0.44 =C2=B1  4%      -0.0        0.4=
2 =C2=B1  2%  perf-profile.self.cycles-pp.xas_load
      0.16 =C2=B1  8%      -0.0        0.15 =C2=B1  4%      -0.0        0.1=
4 =C2=B1  9%  perf-profile.self.cycles-pp.ksys_write
      0.44 =C2=B1  5%      -0.0        0.44 =C2=B1  4%      -0.0        0.4=
3 =C2=B1  6%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.15 =C2=B1  6%      -0.0        0.14 =C2=B1  5%      -0.0        0.1=
4 =C2=B1  5%  perf-profile.self.cycles-pp.current_time
      0.27 =C2=B1  3%      -0.0        0.27 =C2=B1  4%      -0.0        0.2=
6 =C2=B1  4%  perf-profile.self.cycles-pp.find_lock_entries
      0.25 =C2=B1  4%      -0.0        0.24 =C2=B1  6%      -0.0        0.2=
4 =C2=B1  4%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.08 =C2=B1  8%      -0.0        0.07 =C2=B1 10%      -0.0        0.0=
7 =C2=B1  8%  perf-profile.self.cycles-pp.mem_cgroup_charge_statistics
      0.12 =C2=B1  6%      -0.0        0.12 =C2=B1  6%      -0.0        0.1=
1 =C2=B1  9%  perf-profile.self.cycles-pp.__folio_cancel_dirty
      0.08 =C2=B1  4%      -0.0        0.07 =C2=B1 10%      -0.0        0.0=
7 =C2=B1  5%  perf-profile.self.cycles-pp.__mod_lruvec_state
      0.08 =C2=B1 10%      -0.0        0.08 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 10%  perf-profile.self.cycles-pp.disk_wrt
      0.14 =C2=B1  6%      -0.0        0.14 =C2=B1  7%      -0.0        0.1=
4 =C2=B1  2%  perf-profile.self.cycles-pp.node_dirty_ok
      0.14 =C2=B1  3%      -0.0        0.13 =C2=B1  6%      -0.0        0.1=
3 =C2=B1  9%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.09 =C2=B1  5%      -0.0        0.08 =C2=B1  8%      +0.0        0.0=
9 =C2=B1  7%  perf-profile.self.cycles-pp.free_unref_page_list
      0.09 =C2=B1  7%      -0.0        0.09 =C2=B1  4%      +0.0        0.1=
0 =C2=B1  8%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.12 =C2=B1  3%      -0.0        0.12 =C2=B1 13%      -0.0        0.1=
2 =C2=B1  7%  perf-profile.self.cycles-pp.folio_account_dirtied
      0.10 =C2=B1  6%      -0.0        0.09 =C2=B1 10%      -0.0        0.1=
0 =C2=B1  4%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.08 =C2=B1 12%      -0.0        0.07 =C2=B1 11%      +0.0        0.0=
8 =C2=B1  6%  perf-profile.self.cycles-pp.mem_cgroup_update_lru_size
      0.31 =C2=B1  3%      -0.0        0.31 =C2=B1  3%      -0.0        0.3=
0 =C2=B1  4%  perf-profile.self.cycles-pp.release_pages
      0.06 =C2=B1 11%      -0.0        0.06            -0.0        0.06 =C2=
=B1  9%  perf-profile.self.cycles-pp.folio_mapping
      0.11 =C2=B1  9%      -0.0        0.10 =C2=B1  7%      -0.0        0.1=
0 =C2=B1  4%  perf-profile.self.cycles-pp.xas_clear_mark
      0.11 =C2=B1  8%      -0.0        0.10 =C2=B1  4%      -0.0        0.1=
0 =C2=B1  8%  perf-profile.self.cycles-pp.try_charge_memcg
      0.13 =C2=B1  5%      -0.0        0.12 =C2=B1  6%      -0.0        0.1=
2 =C2=B1  7%  perf-profile.self.cycles-pp.folio_account_cleaned
      0.06 =C2=B1 19%      -0.0        0.06 =C2=B1  9%      -0.0        0.0=
6 =C2=B1 14%  perf-profile.self.cycles-pp.mem_cgroup_track_foreign_dirty_sl=
owpath
      0.06            -0.0        0.06 =C2=B1 13%      -0.0        0.06 =C2=
=B1  9%  perf-profile.self.cycles-pp.xas_find
      0.07 =C2=B1  5%      -0.0        0.07 =C2=B1  5%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.self.cycles-pp.security_file_permission
      0.19 =C2=B1  2%      -0.0        0.18 =C2=B1  6%      -0.0        0.1=
8 =C2=B1  5%  perf-profile.self.cycles-pp.xfs_file_write_checks
      0.16 =C2=B1 11%      -0.0        0.16 =C2=B1  5%      +0.0        0.1=
6 =C2=B1  8%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      0.61 =C2=B1  3%      -0.0        0.60            -0.0        0.60 =C2=
=B1  2%  perf-profile.self.cycles-pp.down_write
      0.32 =C2=B1  3%      -0.0        0.31 =C2=B1  5%      -0.0        0.3=
0 =C2=B1  7%  perf-profile.self.cycles-pp.__pagevec_lru_add_fn
      0.27 =C2=B1  3%      -0.0        0.26 =C2=B1  4%      -0.0        0.2=
6 =C2=B1  3%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.07 =C2=B1  6%      -0.0        0.07 =C2=B1 14%      +0.0        0.0=
7 =C2=B1  6%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.08 =C2=B1  8%      -0.0        0.08 =C2=B1  5%      +0.0        0.0=
9 =C2=B1  8%  perf-profile.self.cycles-pp.delete_from_page_cache_batch
      0.04 =C2=B1 72%      -0.0        0.04 =C2=B1 71%      +0.0        0.0=
5 =C2=B1 50%  perf-profile.self.cycles-pp.xfs_next_bit
      0.12 =C2=B1  6%      -0.0        0.12 =C2=B1  4%      -0.0        0.1=
0 =C2=B1  7%  perf-profile.self.cycles-pp.rmqueue
      0.08 =C2=B1 10%      -0.0        0.08 =C2=B1  8%      -0.0        0.0=
8 =C2=B1  6%  perf-profile.self.cycles-pp.iomap_adjust_read_range
      0.08            -0.0        0.08 =C2=B1 11%      +0.0        0.08    =
    perf-profile.self.cycles-pp.__fdget_pos
      0.14 =C2=B1  6%      -0.0        0.14 =C2=B1  7%      -0.0        0.1=
4 =C2=B1  5%  perf-profile.self.cycles-pp.xfs_break_layouts
      0.08 =C2=B1 14%      -0.0        0.07 =C2=B1  6%      +0.0        0.0=
8 =C2=B1  8%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.23 =C2=B1  6%      -0.0        0.23 =C2=B1  2%      -0.0        0.2=
2 =C2=B1  4%  perf-profile.self.cycles-pp.__filemap_add_folio
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 71%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.self.cycles-pp.xfs_btree_check_sblock
      0.15 =C2=B1  8%      +0.0        0.15 =C2=B1  8%      -0.0        0.1=
4 =C2=B1  5%  perf-profile.self.cycles-pp.generic_write_checks
      0.08 =C2=B1  6%      +0.0        0.08 =C2=B1  9%      -0.0        0.0=
7        perf-profile.self.cycles-pp.uncharge_folio
      0.09 =C2=B1  5%      +0.0        0.09 =C2=B1  7%      -0.0        0.0=
9 =C2=B1  9%  perf-profile.self.cycles-pp.alloc_pages
      0.07 =C2=B1  5%      +0.0        0.07 =C2=B1  9%      -0.0        0.0=
7 =C2=B1 10%  perf-profile.self.cycles-pp.folio_memcg_unlock
      0.07 =C2=B1 10%      +0.0        0.07 =C2=B1 10%      -0.0        0.0=
7 =C2=B1  7%  perf-profile.self.cycles-pp.xfs_btree_increment
      0.14 =C2=B1 11%      +0.0        0.14 =C2=B1  3%      +0.0        0.1=
4 =C2=B1  7%  perf-profile.self.cycles-pp.generic_write_check_limits
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%      +0.0        0.0=
2 =C2=B1141%  perf-profile.self.cycles-pp.xas_set_mark
      0.07 =C2=B1 11%      +0.0        0.07 =C2=B1 11%      +0.0        0.0=
7 =C2=B1 19%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.25 =C2=B1  4%      +0.0        0.25 =C2=B1  4%      +0.0        0.2=
6 =C2=B1  5%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.0        0.00            +0.0        0.01 =C2=B122=
3%  perf-profile.self.cycles-pp.filemap_unaccount_folio
      0.00            +0.0        0.00            +0.0        0.01 =C2=B122=
3%  perf-profile.self.cycles-pp.xas_create
      0.10 =C2=B1  3%      +0.0        0.10 =C2=B1  9%      -0.0        0.1=
0 =C2=B1  6%  perf-profile.self.cycles-pp.iomap_page_create
      0.05 =C2=B1  7%      +0.0        0.05 =C2=B1  8%      -0.0        0.0=
4 =C2=B1 45%  perf-profile.self.cycles-pp._xfs_trans_bjoin
      0.06 =C2=B1  6%      +0.0        0.06 =C2=B1  9%      -0.0        0.0=
6 =C2=B1  8%  perf-profile.self.cycles-pp.xfs_buf_item_init
      0.05 =C2=B1 46%      +0.0        0.05 =C2=B1  7%      +0.0        0.0=
5 =C2=B1  8%  perf-profile.self.cycles-pp.copyin
      0.13 =C2=B1  6%      +0.0        0.13 =C2=B1  5%      -0.0        0.1=
3 =C2=B1  5%  perf-profile.self.cycles-pp.rcu_all_qs
      0.08 =C2=B1  5%      +0.0        0.08 =C2=B1 11%      +0.0        0.0=
8 =C2=B1 11%  perf-profile.self.cycles-pp.folio_add_lru
      0.14 =C2=B1  6%      +0.0        0.15 =C2=B1  6%      -0.0        0.1=
3 =C2=B1  9%  perf-profile.self.cycles-pp.xfs_iread_extents
      0.06 =C2=B1  7%      +0.0        0.07 =C2=B1 11%      -0.0        0.0=
6 =C2=B1 11%  perf-profile.self.cycles-pp.xlog_cil_alloc_shadow_bufs
      0.21 =C2=B1  7%      +0.0        0.22 =C2=B1  5%      -0.0        0.2=
1 =C2=B1  3%  perf-profile.self.cycles-pp.xas_start
      0.06 =C2=B1  7%      +0.0        0.07 =C2=B1 16%      +0.0        0.0=
6 =C2=B1 14%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.05 =C2=B1 45%      +0.0        0.05            -0.0        0.04 =C2=
=B1 71%  perf-profile.self.cycles-pp.node_page_state
      0.09 =C2=B1 15%      +0.0        0.10 =C2=B1 11%      +0.0        0.1=
0 =C2=B1 13%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 44%      -0.0        0.0=
3 =C2=B1 70%  perf-profile.self.cycles-pp.workingset_update_node
      0.05 =C2=B1 46%      +0.0        0.05 =C2=B1  8%      +0.0        0.0=
5 =C2=B1  7%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.07 =C2=B1  5%      +0.0        0.07 =C2=B1  6%      -0.0        0.0=
7 =C2=B1 11%  perf-profile.self.cycles-pp.free_unref_page_commit
      0.06 =C2=B1  9%      +0.0        0.06 =C2=B1  7%      +0.0        0.0=
6 =C2=B1  9%  perf-profile.self.cycles-pp.xas_find_conflict
      0.10 =C2=B1  4%      +0.0        0.11 =C2=B1  8%      +0.0        0.1=
1 =C2=B1  6%  perf-profile.self.cycles-pp.xfs_inobt_get_rec
      0.05            +0.0        0.06 =C2=B1 13%      +0.0        0.06 =C2=
=B1 13%  perf-profile.self.cycles-pp.xlog_cil_insert_format_items
      0.31 =C2=B1  2%      +0.0        0.32 =C2=B1  5%      +0.0        0.3=
2 =C2=B1  3%  perf-profile.self.cycles-pp.folio_unlock
      0.05 =C2=B1  7%      +0.0        0.06 =C2=B1  9%      +0.0        0.0=
6 =C2=B1 13%  perf-profile.self.cycles-pp.xlog_prepare_iovec
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.self.cycles-pp.calc_global_load_tick
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.00    =
    perf-profile.self.cycles-pp.tick_sched_do_timer
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1 99%      +0.0        0.0=
2 =C2=B1141%  perf-profile.self.cycles-pp.iov_iter_init
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1 99%      +0.0        0.0=
2 =C2=B1141%  perf-profile.self.cycles-pp.xfs_buf_find
      0.09 =C2=B1 15%      +0.0        0.10 =C2=B1  8%      +0.0        0.1=
0 =C2=B1  5%  perf-profile.self.cycles-pp.file_remove_privs
      0.05            +0.0        0.06 =C2=B1 13%      +0.0        0.06 =C2=
=B1  8%  perf-profile.self.cycles-pp.__rhashtable_lookup
      0.07 =C2=B1 10%      +0.0        0.08 =C2=B1 20%      +0.0        0.0=
9 =C2=B1 10%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.02 =C2=B1 99%      +0.0        0.04 =C2=B1 71%      +0.0        0.0=
2 =C2=B1 99%  perf-profile.self.cycles-pp.rw_verify_area
      0.05 =C2=B1  7%      +0.0        0.06 =C2=B1 14%      -0.0        0.0=
4 =C2=B1 71%  perf-profile.self.cycles-pp.__xfs_dir3_data_check
      0.20 =C2=B1 10%      +0.0        0.22 =C2=B1 11%      +0.0        0.2=
0 =C2=B1 12%  perf-profile.self.cycles-pp.ktime_get
      0.06 =C2=B1 11%      +0.0        0.07 =C2=B1 34%      +0.0        0.0=
6 =C2=B1  9%  perf-profile.self.cycles-pp.update_cfs_group
      0.04 =C2=B1 44%      +0.0        0.05 =C2=B1  8%      -0.0        0.0=
3 =C2=B1100%  perf-profile.self.cycles-pp.xfs_buf_item_format_segment
      0.07 =C2=B1 10%      +0.0        0.09 =C2=B1 10%      +0.0        0.0=
8 =C2=B1  8%  perf-profile.self.cycles-pp.menu_select
      0.30 =C2=B1  5%      +0.0        0.31 =C2=B1  3%      -0.0        0.2=
9 =C2=B1  5%  perf-profile.self.cycles-pp.memcpy_erms
      0.06 =C2=B1 45%      +0.0        0.07 =C2=B1 37%      +0.0        0.0=
7 =C2=B1  7%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.0        0.02 =C2=B1141%      +0.0        0.00    =
    perf-profile.self.cycles-pp.xfs_verify_dir_ino
      0.00            +0.0        0.02 =C2=B1141%      +0.0        0.00    =
    perf-profile.self.cycles-pp.native_sched_clock
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%      +0.0        0.0=
3 =C2=B1 70%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.01 =C2=B1223%      +0.0        0.02 =C2=B1 99%      -0.0        0.0=
0        perf-profile.self.cycles-pp.xfs_perag_get
      0.03 =C2=B1 70%      +0.0        0.05 =C2=B1  8%      -0.0        0.0=
2 =C2=B1 99%  perf-profile.self.cycles-pp.lapic_next_deadline
      1.89 =C2=B1  3%      +0.1        1.96 =C2=B1  4%      +0.0        1.9=
0 =C2=B1  2%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.11 =C2=B1  4%      +0.2        0.30 =C2=B1  5%      +0.2        0.2=
9        perf-profile.self.cycles-pp.__xfs_btree_check_sblock
     35.08 =C2=B1  4%      +1.3       36.33 =C2=B1  2%      +1.9       37.0=
1 =C2=B1  3%  perf-profile.self.cycles-pp.osq_lock
> =

> Cheers,
> =

> Dave.
> -- =

> Dave Chinner
> david(a)fromorbit.com
> =

> =

> xfs: avoid unnecessary runtime sibling pointer endian conversions
> =

> From: Dave Chinner <dchinner@redhat.com>
> =

> Commit dc04db2aa7c9 has caused a small aim7 regression, showing a
> small increase in CPU usage in __xfs_btree_check_sblock() as a
> result of the extra checking.
> =

> This is likely due to the endian conversion of the sibling poitners
> being unconditional instead of relying on the compiler to endian
> convert the NULL pointer at compile time and avoiding the runtime
> conversion for this common case.
> =

> Rework the checks so that endian conversion of the sibling pointers
> is only done if they are not null as the original code did.
> =

> Fixes: dc04db2aa7c9 ("xfs: detect self referencing btree sibling pointers=
")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Dave Chinner <dchinner@redhat.com>
> ---
>  fs/xfs/libxfs/xfs_btree.c | 37 +++++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)
> =

> diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
> index 2aa300f7461f..4d673e943317 100644
> --- a/fs/xfs/libxfs/xfs_btree.c
> +++ b/fs/xfs/libxfs/xfs_btree.c
> @@ -51,16 +51,25 @@ xfs_btree_magic(
>  	return magic;
>  }
>  =

> +/*
> + * These sibling pointer checks are optimised for null sibling pointers.=
 This
> + * happens a lot, and we don't need to byte swap at runtime if the sibli=
ng
> + * pointer is NULL.
> + */
>  static xfs_failaddr_t
>  xfs_btree_check_lblock_siblings(
>  	struct xfs_mount	*mp,
>  	struct xfs_btree_cur	*cur,
>  	int			level,
>  	xfs_fsblock_t		fsb,
> -	xfs_fsblock_t		sibling)
> +	__be64			dsibling)
>  {
> -	if (sibling =3D=3D NULLFSBLOCK)
> +	xfs_fsblock_t		sibling;
> +
> +	if (dsibling =3D=3D cpu_to_be64(NULLFSBLOCK))
>  		return NULL;
> +
> +	sibling =3D be64_to_cpu(dsibling);
>  	if (sibling =3D=3D fsb)
>  		return __this_address;
>  	if (level >=3D 0) {
> @@ -81,10 +90,14 @@ xfs_btree_check_sblock_siblings(
>  	int			level,
>  	xfs_agnumber_t		agno,
>  	xfs_agblock_t		agbno,
> -	xfs_agblock_t		sibling)
> +	__be32			dsibling)
>  {
> -	if (sibling =3D=3D NULLAGBLOCK)
> +	xfs_agblock_t		sibling;
> +
> +	if (dsibling =3D=3D cpu_to_be32(NULLAGBLOCK))
>  		return NULL;
> +
> +	sibling =3D be32_to_cpu(dsibling);
>  	if (sibling =3D=3D agbno)
>  		return __this_address;
>  	if (level >=3D 0) {
> @@ -136,10 +149,10 @@ __xfs_btree_check_lblock(
>  		fsb =3D XFS_DADDR_TO_FSB(mp, xfs_buf_daddr(bp));
>  =

>  	fa =3D xfs_btree_check_lblock_siblings(mp, cur, level, fsb,
> -			be64_to_cpu(block->bb_u.l.bb_leftsib));
> +			block->bb_u.l.bb_leftsib);
>  	if (!fa)
>  		fa =3D xfs_btree_check_lblock_siblings(mp, cur, level, fsb,
> -				be64_to_cpu(block->bb_u.l.bb_rightsib));
> +				block->bb_u.l.bb_rightsib);
>  	return fa;
>  }
>  =

> @@ -204,10 +217,10 @@ __xfs_btree_check_sblock(
>  	}
>  =

>  	fa =3D xfs_btree_check_sblock_siblings(mp, cur, level, agno, agbno,
> -			be32_to_cpu(block->bb_u.s.bb_leftsib));
> +			block->bb_u.s.bb_leftsib);
>  	if (!fa)
>  		fa =3D xfs_btree_check_sblock_siblings(mp, cur, level, agno,
> -				 agbno, be32_to_cpu(block->bb_u.s.bb_rightsib));
> +				 agbno, block->bb_u.s.bb_rightsib);
>  	return fa;
>  }
>  =

> @@ -4523,10 +4536,10 @@ xfs_btree_lblock_verify(
>  	/* sibling pointer verification */
>  	fsb =3D XFS_DADDR_TO_FSB(mp, xfs_buf_daddr(bp));
>  	fa =3D xfs_btree_check_lblock_siblings(mp, NULL, -1, fsb,
> -			be64_to_cpu(block->bb_u.l.bb_leftsib));
> +			block->bb_u.l.bb_leftsib);
>  	if (!fa)
>  		fa =3D xfs_btree_check_lblock_siblings(mp, NULL, -1, fsb,
> -				be64_to_cpu(block->bb_u.l.bb_rightsib));
> +				block->bb_u.l.bb_rightsib);
>  	return fa;
>  }
>  =

> @@ -4580,10 +4593,10 @@ xfs_btree_sblock_verify(
>  	agno =3D xfs_daddr_to_agno(mp, xfs_buf_daddr(bp));
>  	agbno =3D xfs_daddr_to_agbno(mp, xfs_buf_daddr(bp));
>  	fa =3D xfs_btree_check_sblock_siblings(mp, NULL, -1, agno, agbno,
> -			be32_to_cpu(block->bb_u.s.bb_leftsib));
> +			block->bb_u.s.bb_leftsib);
>  	if (!fa)
>  		fa =3D xfs_btree_check_sblock_siblings(mp, NULL, -1, agno, agbno,
> -				be32_to_cpu(block->bb_u.s.bb_rightsib));
> +				block->bb_u.s.bb_rightsib);
>  	return fa;
>  }
>  =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============6828385305931651436==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
QbHEZ/sCAAAAAARZWg==
--===============6828385305931651436==--

