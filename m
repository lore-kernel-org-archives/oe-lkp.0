Content-Type: multipart/mixed; boundary="===============3198462377933697612=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 9d89c257df: -51.1% fileio.request_latency_max_ms
Date: Thu, 10 Sep 2015 09:30:37 +0800
Message-ID: <87d1xrcb7m.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3198462377933697612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 9d89c257dfb9c51a532d69397f6eed75e5168c35 ("sched/fair: Rewrite runna=
ble load and utilization average tracking")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/period/nr_threads/disk/fs/size/=
filenum/rwmode/iomode:
  lkp-ws02/fileio/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/600s/100=
%/1HDD/xfs/64G/1024f/seqwr/sync

commit: =

  cd126afe838d7ea9b971cdea087fd498a7293c7f
  9d89c257dfb9c51a532d69397f6eed75e5168c35

cd126afe838d7ea9 9d89c257dfb9c51a532d69397f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1718 =C2=B1  6%     -51.1%     839.72 =C2=B1 12%  fileio.request_late=
ncy_max_ms
     41834 =C2=B1  2%      -7.9%      38525 =C2=B1  1%  fileio.time.involun=
tary_context_switches
      4381 =C2=B1 29%     -43.0%       2495 =C2=B1 14%  fileio.time.minor_p=
age_faults
     85220 =C2=B1  4%     +12.0%      95443 =C2=B1  7%  numa-vmstat.node0.n=
r_active_file
     76753 =C2=B1  3%     -10.1%      69013 =C2=B1  3%  softirqs.RCU
      4381 =C2=B1 29%     -43.0%       2495 =C2=B1 14%  time.minor_page_fau=
lts
   1660758 =C2=B1  6%     -51.7%     802819 =C2=B1 12%  latency_stats.max.x=
fs_file_buffered_aio_write.xfs_file_write_iter.__vfs_write.vfs_write.SyS_pw=
rite64.entry_SYSCALL_64_fastpath
    796.60 =C2=B1 56%   +1452.3%      12365 =C2=B1 35%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
    340573 =C2=B1  4%     +12.1%     381722 =C2=B1  6%  numa-meminfo.node0.=
Active(file)
      4125 =C2=B1  3%     -12.9%       3594 =C2=B1  4%  numa-meminfo.node0.=
KernelStack
      2544 =C2=B1  6%     +21.4%       3090 =C2=B1  5%  numa-meminfo.node1.=
KernelStack
     44.69 =C2=B1  1%     -12.3%      39.19 =C2=B1  1%  turbostat.CPU%c1
      2.28 =C2=B1 24%     -53.3%       1.06 =C2=B1 51%  turbostat.CPU%c3
     51.67 =C2=B1  1%     +12.9%      58.36 =C2=B1  2%  turbostat.CPU%c6
      9869 =C2=B1 10%     +26.0%      12435 =C2=B1  8%  cpuidle.C1E-NHM.usa=
ge
 2.298e+08 =C2=B1 16%     -48.4%  1.186e+08 =C2=B1 34%  cpuidle.C3-NHM.time
     36199 =C2=B1 13%     -20.9%      28636 =C2=B1  4%  cpuidle.C3-NHM.usage
     15973 =C2=B1 77%     -66.7%       5325 =C2=B1  8%  cpuidle.POLL.time
    641.50 =C2=B1 18%     -48.1%     333.20 =C2=B1  9%  cpuidle.POLL.usage
   4417334 =C2=B1 12%     +31.4%    5803234 =C2=B1  2%  proc-vmstat.numa_fo=
reign
      3571 =C2=B1 36%     -52.2%       1706 =C2=B1 21%  proc-vmstat.numa_hi=
nt_faults
  10573818 =C2=B1  5%     -12.9%    9214883 =C2=B1  1%  proc-vmstat.numa_hit
  10573811 =C2=B1  5%     -12.9%    9214877 =C2=B1  1%  proc-vmstat.numa_lo=
cal
   4417343 =C2=B1 12%     +31.4%    5803191 =C2=B1  2%  proc-vmstat.numa_mi=
ss
   4417350 =C2=B1 12%     +31.4%    5803197 =C2=B1  2%  proc-vmstat.numa_ot=
her
      3697 =C2=B1 34%     -49.8%       1857 =C2=B1 20%  proc-vmstat.numa_pt=
e_updates
    114.90 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
     14239 =C2=B1 27%   +3042.8%     447511 =C2=B1 42%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      5930 =C2=B1 10%     -97.0%     178.80 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    119.50 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
     16932 =C2=B1 22%   +1419.2%     257240 =C2=B1 64%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      5048 =C2=B1 14%     -96.6%     173.10 =C2=B1  5%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    141.00 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
     17165 =C2=B1 25%   +1392.0%     256100 =C2=B1 61%  sched_debug.cfs_rq[=
11]:/.min_vruntime
      4988 =C2=B1 14%     -96.5%     173.70 =C2=B1  5%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
    149.80 =C2=B1 97%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    238.60 =C2=B1 68%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
      8460 =C2=B1 26%   +2474.6%     217827 =C2=B1 49%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     -5779 =C2=B1-40%   +3874.9%    -229723 =C2=B1-37%  sched_debug.cfs_rq[=
12]:/.spread0
      4959 =C2=B1 13%     -96.5%     175.00 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
    252.30 =C2=B1 63%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
    360.70 =C2=B1 63%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
      7779 =C2=B1 21%   +2702.2%     217989 =C2=B1 50%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     -6460 =C2=B1-46%   +3453.2%    -229562 =C2=B1-36%  sched_debug.cfs_rq[=
13]:/.spread0
      4932 =C2=B1 13%     -96.4%     175.90 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    366.90 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    255.20 =C2=B1 76%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
      6625 =C2=B1 28%   +3285.6%     224309 =C2=B1 51%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     -7614 =C2=B1-33%   +2831.8%    -223244 =C2=B1-35%  sched_debug.cfs_rq[=
14]:/.spread0
      4882 =C2=B1 14%     -96.4%     176.70 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    257.60 =C2=B1 77%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
      6603 =C2=B1 30%   +3264.3%     222172 =C2=B1 49%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     -7636 =C2=B1-29%   +2851.5%    -225384 =C2=B1-37%  sched_debug.cfs_rq[=
15]:/.spread0
      4843 =C2=B1 13%     -96.4%     175.70 =C2=B1  5%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    170.80 =C2=B1121%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
      6729 =C2=B1 25%   +3209.0%     222693 =C2=B1 50%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     -7510 =C2=B1-37%   +2894.1%    -224864 =C2=B1-35%  sched_debug.cfs_rq[=
16]:/.spread0
      4844 =C2=B1 13%     -96.4%     175.10 =C2=B1  4%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
    239.40 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
    273.30 =C2=B1 84%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
      6291 =C2=B1 26%   +3362.3%     217832 =C2=B1 51%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     -7948 =C2=B1-30%   +2790.1%    -229725 =C2=B1-34%  sched_debug.cfs_rq[=
17]:/.spread0
      4844 =C2=B1 13%     -96.4%     175.20 =C2=B1  4%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    298.90 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    333.60 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
      8651 =C2=B1 23%   +1390.1%     128916 =C2=B1 82%  sched_debug.cfs_rq[=
18]:/.min_vruntime
      4830 =C2=B1 13%     -96.3%     176.80 =C2=B1  5%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
    341.10 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
    225.40 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.blocked_load_avg
      9204 =C2=B1 25%   +1277.7%     126808 =C2=B1 88%  sched_debug.cfs_rq[=
19]:/.min_vruntime
      4836 =C2=B1 13%     -96.3%     177.80 =C2=B1  4%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    234.60 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
    189.50 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
     13111 =C2=B1 27%   +3143.9%     425334 =C2=B1 43%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      4.50 =C2=B1 24%     +95.6%       8.80 =C2=B1 49%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     -1127 =C2=B1-91%   +1867.0%     -22177 =C2=B1-53%  sched_debug.cfs_rq[=
1]:/.spread0
      5904 =C2=B1 11%     -96.9%     180.10 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    208.00 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    110.60 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
      9609 =C2=B1 36%   +1176.4%     122663 =C2=B1 87%  sched_debug.cfs_rq[=
20]:/.min_vruntime
      4806 =C2=B1 13%     -96.3%     177.90 =C2=B1  4%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
    116.80 =C2=B1 76%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
    199.60 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.blocked_load_avg
      9035 =C2=B1 23%   +1386.2%     134281 =C2=B1 76%  sched_debug.cfs_rq[=
21]:/.min_vruntime
      4766 =C2=B1 15%     -96.2%     179.90 =C2=B1  4%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
    209.20 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
    237.70 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
      9709 =C2=B1 34%   +1217.6%     127936 =C2=B1 83%  sched_debug.cfs_rq[=
22]:/.min_vruntime
      4748 =C2=B1 15%     -96.2%     180.10 =C2=B1  4%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
    251.20 =C2=B1 51%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
    202.90 =C2=B1 69%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.blocked_load_avg
      9632 =C2=B1 22%   +1228.9%     128004 =C2=B1 85%  sched_debug.cfs_rq[=
23]:/.min_vruntime
      4723 =C2=B1 14%     -96.2%     180.80 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
    214.80 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
    206.70 =C2=B1103%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
     12986 =C2=B1 31%   +3185.0%     426598 =C2=B1 42%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      5893 =C2=B1 11%     -96.9%     180.40 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    219.10 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
    206.00 =C2=B1 63%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
     12917 =C2=B1 28%   +3176.7%     423273 =C2=B1 43%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     -1321 =C2=B1-77%   +1734.2%     -24241 =C2=B1-58%  sched_debug.cfs_rq[=
3]:/.spread0
      5807 =C2=B1 10%     -97.0%     176.50 =C2=B1  4%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    216.20 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
     12383 =C2=B1 28%   +3333.4%     425180 =C2=B1 42%  sched_debug.cfs_rq[=
4]:/.min_vruntime
      3.30 =C2=B1 27%    +118.2%       7.20 =C2=B1 38%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
      5640 =C2=B1  9%     -96.9%     173.50 =C2=B1  4%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    141.10 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
     12392 =C2=B1 31%   +3362.7%     429134 =C2=B1 39%  sched_debug.cfs_rq[=
5]:/.min_vruntime
      5547 =C2=B1 10%     -96.9%     172.40 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    148.50 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
    183.40 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
     17073 =C2=B1 21%   +1421.2%     259713 =C2=B1 61%  sched_debug.cfs_rq[=
6]:/.min_vruntime
      5354 =C2=B1 13%     -96.8%     173.60 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
    189.40 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    180.00 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
     17031 =C2=B1 18%   +1464.2%     266408 =C2=B1 64%  sched_debug.cfs_rq[=
7]:/.min_vruntime
      5339 =C2=B1 13%     -96.7%     174.00 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    192.00 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    156.90 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
     18753 =C2=B1 16%   +1335.9%     269287 =C2=B1 62%  sched_debug.cfs_rq[=
8]:/.min_vruntime
      5272 =C2=B1 13%     -96.7%     174.50 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    162.60 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    144.10 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     17045 =C2=B1 22%   +1396.7%     255126 =C2=B1 65%  sched_debug.cfs_rq[=
9]:/.min_vruntime
      5151 =C2=B1 13%     -96.7%     171.90 =C2=B1  5%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    147.50 =C2=B1 68%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
     14172 =C2=B1  7%     -21.7%      11092 =C2=B1 11%  sched_debug.cpu#18.=
nr_load_updates
     14109 =C2=B1  7%     -21.9%      11023 =C2=B1 11%  sched_debug.cpu#19.=
nr_load_updates
     14402 =C2=B1 10%     -24.3%      10897 =C2=B1 11%  sched_debug.cpu#20.=
nr_load_updates
     14309 =C2=B1 11%     -22.9%      11035 =C2=B1 12%  sched_debug.cpu#22.=
nr_load_updates
     14522 =C2=B1  6%     -22.8%      11210 =C2=B1 11%  sched_debug.cpu#23.=
nr_load_updates
     27218 =C2=B1  7%     -21.8%      21292 =C2=B1 16%  sched_debug.cpu#6.n=
r_load_updates
     27999 =C2=B1  8%     -25.4%      20894 =C2=B1 20%  sched_debug.cpu#8.n=
r_load_updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/blo=
cksize:
  lkp-nex04/pigz/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performan=
ce/100%/128K

commit: =

  cd126afe838d7ea9b971cdea087fd498a7293c7f
  9d89c257dfb9c51a532d69397f6eed75e5168c35

cd126afe838d7ea9 9d89c257dfb9c51a532d69397f =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

          1:4          -25%            :4     kmsg.CE:hpet_increased_min_de=
lta_ns_to#nsec
          1:4          -25%            :4     kmsg.IP-Config:Reopening_netw=
ork_devices
         %stddev     %change         %stddev
             \          |                \  =

 4.503e+08 =C2=B1  0%     -15.4%   3.81e+08 =C2=B1  0%  pigz.throughput
   1106969 =C2=B1  4%     -54.8%     499943 =C2=B1  2%  pigz.time.involunta=
ry_context_switches
      6099 =C2=B1  0%     -20.2%       4868 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
    200.45 =C2=B1  1%     +25.2%     251.02 =C2=B1  0%  pigz.time.system_ti=
me
     18113 =C2=B1  0%     -20.7%      14366 =C2=B1  0%  pigz.time.user_time
   3626003 =C2=B1  1%     +59.8%    5794073 =C2=B1  0%  pigz.time.voluntary=
_context_switches
    690063 =C2=B1  1%     -10.2%     619753 =C2=B1  1%  meminfo.Committed_AS
     32731 =C2=B1  0%     -12.2%      28739 =C2=B1  0%  meminfo.Shmem
      1362 =C2=B1 40%     -99.2%      10.75 =C2=B1185%  numa-numastat.node2=
.other_node
      2065 =C2=B1  0%    -100.2%      -4.00 =C2=B1-103%  numa-numastat.node=
3.other_node
    656.25 =C2=B1  7%     +25.0%     820.50 =C2=B1  3%  slabinfo.file_lock_=
ctx.active_objs
    656.25 =C2=B1  7%     +25.0%     820.50 =C2=B1  3%  slabinfo.file_lock_=
ctx.num_objs
   2424595 =C2=B1  2%     -17.8%    1993001 =C2=B1  5%  softirqs.RCU
    325975 =C2=B1 11%     +39.1%     453480 =C2=B1  4%  softirqs.SCHED
   9498586 =C2=B1  0%     -19.8%    7618759 =C2=B1  0%  softirqs.TIMER
     61.75 =C2=B1  0%     -17.8%      50.75 =C2=B1  2%  vmstat.procs.r
     24929 =C2=B1  2%     +65.4%      41236 =C2=B1  0%  vmstat.system.cs
     81389 =C2=B1  1%     -18.3%      66454 =C2=B1  0%  vmstat.system.in
   1106969 =C2=B1  4%     -54.8%     499943 =C2=B1  2%  time.involuntary_co=
ntext_switches
      6099 =C2=B1  0%     -20.2%       4868 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    200.45 =C2=B1  1%     +25.2%     251.02 =C2=B1  0%  time.system_time
     18113 =C2=B1  0%     -20.7%      14366 =C2=B1  0%  time.user_time
   3626003 =C2=B1  1%     +59.8%    5794073 =C2=B1  0%  time.voluntary_cont=
ext_switches
     95.23 =C2=B1  0%     -20.1%      76.11 =C2=B1  0%  turbostat.%Busy
      2192 =C2=B1  0%     -21.5%       1720 =C2=B1  0%  turbostat.Avg_MHz
      3.50 =C2=B1  3%    +309.1%      14.34 =C2=B1  0%  turbostat.CPU%c1
      1.27 =C2=B1  2%    +649.2%       9.55 =C2=B1  1%  turbostat.CPU%c3
      0.27 =C2=B1 19%     +83.3%       0.49 =C2=B1  9%  turbostat.Pkg%pc3
      8190 =C2=B1  0%     -12.3%       7182 =C2=B1  0%  proc-vmstat.nr_shmem
  44444702 =C2=B1  0%     -14.8%   37851852 =C2=B1  0%  proc-vmstat.numa_hit
  44444664 =C2=B1  0%     -14.8%   37851804 =C2=B1  0%  proc-vmstat.numa_lo=
cal
      9834 =C2=B1  0%     -14.0%       8462 =C2=B1  2%  proc-vmstat.pgactiv=
ate
  43781589 =C2=B1  0%     -14.8%   37315422 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  44506944 =C2=B1  0%     -14.8%   37919371 =C2=B1  0%  proc-vmstat.pgfree
  27281058 =C2=B1  7%     +59.2%   43431914 =C2=B1  2%  cpuidle.C1-NHM.time
    239768 =C2=B1  8%    +102.1%     484572 =C2=B1 10%  cpuidle.C1-NHM.usage
  61016222 =C2=B1  2%    +102.6%  1.236e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
    275955 =C2=B1  0%     +51.8%     419012 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
 8.448e+08 =C2=B1  2%    +430.0%  4.477e+09 =C2=B1  0%  cpuidle.C3-NHM.time
   1687320 =C2=B1  1%    +169.9%    4553973 =C2=B1  0%  cpuidle.C3-NHM.usage
    199.00 =C2=B1 24%    +111.2%     420.25 =C2=B1 29%  cpuidle.POLL.usage
      9823 =C2=B1 19%     -42.6%       5637 =C2=B1 16%  numa-vmstat.node0.n=
r_active_anon
     32970 =C2=B1  5%     -12.1%      28993 =C2=B1  0%  numa-vmstat.node0.n=
r_file_pages
      1101 =C2=B1 91%     -98.6%      15.50 =C2=B1 57%  numa-vmstat.node0.n=
r_inactive_anon
      3972 =C2=B1 46%     -99.3%      29.75 =C2=B1 50%  numa-vmstat.node0.n=
r_shmem
      1579 =C2=B1 44%     -22.9%       1217 =C2=B1 50%  numa-vmstat.node1.n=
r_mapped
    100.25 =C2=B1 33%   +1079.1%       1182 =C2=B1 77%  numa-vmstat.node3.n=
r_inactive_anon
    122.00 =C2=B1 24%    +899.0%       1218 =C2=B1 72%  numa-vmstat.node3.n=
r_shmem
     63069 =C2=B1 13%     -25.8%      46813 =C2=B1  9%  numa-meminfo.node0.=
Active
     39329 =C2=B1 19%     -42.6%      22573 =C2=B1 16%  numa-meminfo.node0.=
Active(anon)
    131900 =C2=B1  5%     -12.1%     115976 =C2=B1  0%  numa-meminfo.node0.=
FilePages
      4406 =C2=B1 91%     -98.6%      63.00 =C2=B1 56%  numa-meminfo.node0.=
Inactive(anon)
     15909 =C2=B1 46%     -99.2%     120.75 =C2=B1 48%  numa-meminfo.node0.=
Shmem
     37420 =C2=B1  9%     -13.5%      32361 =C2=B1  8%  numa-meminfo.node0.=
Slab
      6344 =C2=B1 44%     -23.2%       4872 =C2=B1 50%  numa-meminfo.node1.=
Mapped
     45746 =C2=B1 10%     +32.0%      60371 =C2=B1 19%  numa-meminfo.node2.=
Active
    308616 =C2=B1  2%     +10.4%     340788 =C2=B1  4%  numa-meminfo.node2.=
MemUsed
    402.75 =C2=B1 33%   +1074.4%       4729 =C2=B1 77%  numa-meminfo.node3.=
Inactive(anon)
    489.50 =C2=B1 24%    +896.4%       4877 =C2=B1 72%  numa-meminfo.node3.=
Shmem
   1782630 =C2=B1 14%     +49.6%    2666322 =C2=B1101%  latency_stats.avg.a=
sync_synchronize_cookie_domain.async_synchronize_full.do_init_module.load_m=
odule.SyS_finit_module.entry_SYSCALL_64_fastpath
   2517290 =C2=B1  1%     +93.7%    4876856 =C2=B1  0%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
    248370 =C2=B1  2%     +58.5%     393546 =C2=B1  1%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
   1049355 =C2=B1  0%     -28.2%     753000 =C2=B1  0%  latency_stats.hits.=
pipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastp=
ath
      1675 =C2=B1 21%    +232.5%       5570 =C2=B1 58%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
   1424055 =C2=B1  8%     +49.5%    2128305 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
    178959 =C2=B1 15%    +151.9%     450880 =C2=B1 23%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYS=
CALL_64_fastpath
   4282358 =C2=B1  2%     -10.4%    3836548 =C2=B1  1%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
 6.543e+08 =C2=B1  2%    +321.6%  2.759e+09 =C2=B1  0%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
    176935 =C2=B1 12%    +525.3%    1106420 =C2=B1  6%  latency_stats.sum.p=
ipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
 1.099e+08 =C2=B1  0%      -6.0%  1.033e+08 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
     29558 =C2=B1  2%     -20.1%      23611 =C2=B1  4%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      9020 =C2=B1 20%    +283.8%      34620 =C2=B1 76%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      3.53 =C2=B1  5%     +49.4%       5.28 =C2=B1  3%  perf-profile.cpu-cy=
cles.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.enqueue_t=
ask.activate_task
      0.39 =C2=B1 14%    +155.2%       0.98 =C2=B1 15%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.scheduler_ipi.smp_reschedule_interrupt.reschedul=
e_interrupt
      3.15 =C2=B1  3%      -9.9%       2.83 =C2=B1  6%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
     39.61 =C2=B1  5%     -56.0%      17.41 =C2=B1  2%  perf-profile.cpu-cy=
cles.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_=
apic_timer_interrupt.apic_timer_interrupt
      1.84 =C2=B1  6%     +37.8%       2.53 =C2=B1  4%  perf-profile.cpu-cy=
cles.__kernel_text_address.print_context_stack.dump_trace.save_stack_trace_=
tsk.__account_scheduler_latency
      2.15 =C2=B1  9%    +172.1%       5.85 =C2=B1  4%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs_read.vfs_read
      0.41 =C2=B1  7%    +388.6%       2.03 =C2=B1  4%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.pipe_wait.pipe_write.__vfs_write
      1.49 =C2=B1  8%    +272.9%       5.56 =C2=B1  4%  perf-profile.cpu-cy=
cles.__schedule.schedule.futex_wait_queue_me.futex_wait.do_futex
      0.45 =C2=B1 13%    +172.4%       1.23 =C2=B1  8%  perf-profile.cpu-cy=
cles.__schedule.schedule.schedule_preempt_disabled.cpu_startup_entry.start_=
secondary
      0.43 =C2=B1 15%    +158.1%       1.11 =C2=B1  7%  perf-profile.cpu-cy=
cles.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_se=
condary
     20.50 =C2=B1  3%      +9.8%      22.52 =C2=B1  1%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
      0.77 =C2=B1 28%     -41.5%       0.45 =C2=B1  8%  perf-profile.cpu-cy=
cles.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath.read
     11.51 =C2=B1  4%     +16.8%      13.46 =C2=B1  1%  perf-profile.cpu-cy=
cles.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.28 =C2=B1 11%     -31.5%       0.88 =C2=B1  9%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read
      1.34 =C2=B1 10%     -31.2%       0.92 =C2=B1  9%  perf-profile.cpu-cy=
cles.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read.sys_read
      1.73 =C2=B1  6%    +102.2%       3.50 =C2=B1  3%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_startup_entry.st=
art_secondary
      1.00 =C2=B1  5%    +149.2%       2.48 =C2=B1  3%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.wake_up_q
      1.41 =C2=B1  7%     +22.5%       1.73 =C2=B1  4%  perf-profile.cpu-cy=
cles.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read.sys_read
     47.30 =C2=B1  4%     -50.0%      23.66 =C2=B1  0%  perf-profile.cpu-cy=
cles.apic_timer_interrupt
      1.26 =C2=B1 11%     -32.5%       0.85 =C2=B1 10%  perf-profile.cpu-cy=
cles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_read=
.__vfs_read
      2.84 =C2=B1  8%    +210.1%       8.80 =C2=B1  2%  perf-profile.cpu-cy=
cles.call_cpuidle.cpu_startup_entry.start_secondary
     14.67 =C2=B1  5%     -10.7%      13.10 =C2=B1  0%  perf-profile.cpu-cy=
cles.copy_page_to_iter.pipe_read.__vfs_read.vfs_read.sys_read
     13.91 =C2=B1  5%     -11.3%      12.34 =C2=B1  0%  perf-profile.cpu-cy=
cles.copy_user_generic_string.copy_page_to_iter.pipe_read.__vfs_read.vfs_re=
ad
      6.86 =C2=B1  6%    +168.4%      18.42 =C2=B1  0%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      2.83 =C2=B1  8%    +209.6%       8.75 =C2=B1  2%  perf-profile.cpu-cy=
cles.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      2.41 =C2=B1  9%    +227.6%       7.90 =C2=B1  3%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start=
_secondary
      0.39 =C2=B1 10%    +155.1%       1.00 =C2=B1  4%  perf-profile.cpu-cy=
cles.cpuidle_select.cpu_startup_entry.start_secondary
      0.51 =C2=B1 11%    +100.5%       1.03 =C2=B1  9%  perf-profile.cpu-cy=
cles.deactivate_task.__schedule.schedule.futex_wait_queue_me.futex_wait
      1.26 =C2=B1 11%     -32.3%       0.85 =C2=B1 10%  perf-profile.cpu-cy=
cles.default_wake_function.autoremove_wake_function.__wake_up_common.__wake=
_up_sync_key.pipe_read
      0.51 =C2=B1  8%     +88.3%       0.96 =C2=B1  6%  perf-profile.cpu-cy=
cles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__schedu=
le
      0.49 =C2=B1 11%    +103.5%       1.01 =C2=B1  9%  perf-profile.cpu-cy=
cles.dequeue_task.deactivate_task.__schedule.schedule.futex_wait_queue_me
      0.61 =C2=B1  8%     +81.9%       1.10 =C2=B1  9%  perf-profile.cpu-cy=
cles.dequeue_task_fair.dequeue_task.deactivate_task.__schedule.schedule
      4.76 =C2=B1  4%    +171.6%      12.92 =C2=B1  3%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      3.18 =C2=B1  5%     +49.3%       4.75 =C2=B1  4%  perf-profile.cpu-cy=
cles.dump_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_en=
tity.enqueue_task_fair
      4.37 =C2=B1  4%     +54.2%       6.74 =C2=B1  3%  perf-profile.cpu-cy=
cles.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_ac=
tivate
      1.75 =C2=B1  6%    +103.4%       3.56 =C2=B1  3%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.sched_ttwu_pending.cpu_sta=
rtup_entry
      1.05 =C2=B1  5%    +140.4%       2.53 =C2=B1  3%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_pro=
cess
      2.25 =C2=B1  7%     +60.4%       3.61 =C2=B1  1%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.sched_tt=
wu_pending
      2.25 =C2=B1 11%     +50.1%       3.38 =C2=B1  7%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
     37.54 =C2=B1  3%     +32.3%      49.66 =C2=B1  1%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_fastpath
      0.55 =C2=B1 12%    +480.7%       3.17 =C2=B1  6%  perf-profile.cpu-cy=
cles.find_busiest_group.load_balance.pick_next_task_fair.__schedule.schedule
      0.82 =C2=B1  6%     +28.4%       1.05 =C2=B1  4%  perf-profile.cpu-cy=
cles.free_hot_cold_page.put_page.anon_pipe_buf_release.pipe_read.__vfs_read
      1.91 =C2=B1  7%    +240.9%       6.52 =C2=B1  3%  perf-profile.cpu-cy=
cles.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      1.67 =C2=B1  9%    +258.4%       6.00 =C2=B1  4%  perf-profile.cpu-cy=
cles.futex_wait_queue_me.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fas=
tpath
      1.61 =C2=B1 10%    +203.1%       4.88 =C2=B1  3%  perf-profile.cpu-cy=
cles.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      0.93 =C2=B1 27%     -44.3%       0.52 =C2=B1  5%  perf-profile.cpu-cy=
cles.hrtimer_active.task_tick_fair.scheduler_tick.update_process_times.tick=
_sched_handle
     41.69 =C2=B1  5%     -54.9%      18.79 =C2=B1  1%  perf-profile.cpu-cy=
cles.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.=
apic_timer_interrupt
      2.27 =C2=B1  8%    +236.5%       7.63 =C2=B1  2%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_=
entry
      0.40 =C2=B1 11%    +157.0%       1.02 =C2=B1 15%  perf-profile.cpu-cy=
cles.irq_exit.scheduler_ipi.smp_reschedule_interrupt.reschedule_interrupt.c=
puidle_enter
      0.70 =C2=B1 15%     +40.9%       0.98 =C2=B1 10%  perf-profile.cpu-cy=
cles.is_module_text_address.__kernel_text_address.print_context_stack.dump_=
trace.save_stack_trace_tsk
      1.55 =C2=B1  5%     -27.1%       1.13 =C2=B1 13%  perf-profile.cpu-cy=
cles.ktime_get_update_offsets_now.hrtimer_interrupt.local_apic_timer_interr=
upt.smp_apic_timer_interrupt.apic_timer_interrupt
      0.57 =C2=B1 10%    +500.0%       3.41 =C2=B1  6%  perf-profile.cpu-cy=
cles.load_balance.pick_next_task_fair.__schedule.schedule.futex_wait_queue_=
me
     41.95 =C2=B1  5%     -54.8%      18.98 =C2=B1  1%  perf-profile.cpu-cy=
cles.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interru=
pt
      2.25 =C2=B1 10%    +162.2%       5.89 =C2=B1  4%  perf-profile.cpu-cy=
cles.mutex_lock.pipe_read.__vfs_read.vfs_read.sys_read
      0.43 =C2=B1  8%    +373.8%       2.04 =C2=B1  4%  perf-profile.cpu-cy=
cles.mutex_lock.pipe_wait.pipe_write.__vfs_write.vfs_write
      2.14 =C2=B1  9%    +172.9%       5.85 =C2=B1  4%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_read.__vfs=
_read
      0.41 =C2=B1  7%    +388.0%       2.02 =C2=B1  4%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.pipe_wait.pipe_=
write
      2.01 =C2=B1  9%    +186.3%       5.75 =C2=B1  4%  perf-profile.cpu-cy=
cles.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath=
.mutex_lock.pipe_read
      0.41 =C2=B1  6%    +388.3%       1.99 =C2=B1  4%  perf-profile.cpu-cy=
cles.mutex_spin_on_owner.isra.4.mutex_optimistic_spin.__mutex_lock_slowpath=
.mutex_lock.pipe_wait
      1.33 =C2=B1  6%     -12.6%       1.17 =C2=B1  4%  perf-profile.cpu-cy=
cles.note_gp_changes.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_t=
imer_interrupt
      1.24 =C2=B1 11%     -13.8%       1.06 =C2=B1  6%  perf-profile.cpu-cy=
cles.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_ha=
ndle.tick_sched_timer
      0.68 =C2=B1 10%    +459.2%       3.80 =C2=B1  5%  perf-profile.cpu-cy=
cles.pick_next_task_fair.__schedule.schedule.futex_wait_queue_me.futex_wait
      0.91 =C2=B1 12%    +184.1%       2.59 =C2=B1  5%  perf-profile.cpu-cy=
cles.pipe_wait.pipe_write.__vfs_write.vfs_write.sys_write
     12.20 =C2=B1  4%     +15.6%      14.10 =C2=B1  2%  perf-profile.cpu-cy=
cles.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      2.87 =C2=B1  6%     +46.6%       4.21 =C2=B1  3%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
      1.15 =C2=B1  8%     +20.0%       1.38 =C2=B1  6%  perf-profile.cpu-cy=
cles.put_page.anon_pipe_buf_release.pipe_read.__vfs_read.vfs_read
      1.63 =C2=B1 14%     -28.0%       1.17 =C2=B1  5%  perf-profile.cpu-cy=
cles.rcu_check_callbacks.update_process_times.tick_sched_handle.tick_sched_=
timer.__hrtimer_run_queues
      2.13 =C2=B1  6%     -11.9%       1.88 =C2=B1  7%  perf-profile.cpu-cy=
cles.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_timer_interrupt.a=
pic_timer_interrupt
      0.88 =C2=B1 26%     -29.9%       0.61 =C2=B1 14%  perf-profile.cpu-cy=
cles.read
      0.38 =C2=B1 15%    +150.7%       0.94 =C2=B1 17%  perf-profile.cpu-cy=
cles.run_rebalance_domains.__do_softirq.irq_exit.scheduler_ipi.smp_reschedu=
le_interrupt
      3.21 =C2=B1  5%     +49.1%       4.79 =C2=B1  3%  perf-profile.cpu-cy=
cles.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueu=
e_task_fair.enqueue_task
      1.89 =C2=B1  6%    +107.1%       3.92 =C2=B1  3%  perf-profile.cpu-cy=
cles.sched_ttwu_pending.cpu_startup_entry.start_secondary
      1.55 =C2=B1  9%    +264.9%       5.64 =C2=B1  4%  perf-profile.cpu-cy=
cles.schedule.futex_wait_queue_me.futex_wait.do_futex.sys_futex
      0.53 =C2=B1 13%    +162.0%       1.40 =C2=B1  7%  perf-profile.cpu-cy=
cles.schedule.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      0.54 =C2=B1 12%    +167.6%       1.45 =C2=B1  7%  perf-profile.cpu-cy=
cles.schedule_preempt_disabled.cpu_startup_entry.start_secondary
      0.43 =C2=B1 13%    +150.9%       1.08 =C2=B1 16%  perf-profile.cpu-cy=
cles.scheduler_ipi.smp_reschedule_interrupt.reschedule_interrupt.cpuidle_en=
ter.call_cpuidle
     33.33 =C2=B1  4%     -62.2%      12.61 =C2=B1  2%  perf-profile.cpu-cy=
cles.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer=
.__hrtimer_run_queues
     46.21 =C2=B1  4%     -50.8%      22.73 =C2=B1  1%  perf-profile.cpu-cy=
cles.smp_apic_timer_interrupt.apic_timer_interrupt
      0.43 =C2=B1 13%    +151.4%       1.09 =C2=B1 15%  perf-profile.cpu-cy=
cles.smp_reschedule_interrupt.reschedule_interrupt.cpuidle_enter.call_cpuid=
le.cpu_startup_entry
      6.95 =C2=B1  6%    +168.3%      18.63 =C2=B1  1%  perf-profile.cpu-cy=
cles.start_secondary
      4.80 =C2=B1  4%    +171.3%      13.02 =C2=B1  2%  perf-profile.cpu-cy=
cles.sys_futex.entry_SYSCALL_64_fastpath
      0.85 =C2=B1 27%     -33.9%       0.56 =C2=B1 16%  perf-profile.cpu-cy=
cles.sys_read.entry_SYSCALL_64_fastpath.read
     11.65 =C2=B1  4%     +16.6%      13.59 =C2=B1  1%  perf-profile.cpu-cy=
cles.sys_write.entry_SYSCALL_64_fastpath
     28.28 =C2=B1  5%     -70.6%       8.31 =C2=B1  3%  perf-profile.cpu-cy=
cles.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.t=
ick_sched_timer
      0.45 =C2=B1 18%    +163.7%       1.20 =C2=B1  5%  perf-profile.cpu-cy=
cles.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
      0.40 =C2=B1  9%    +234.6%       1.35 =C2=B1  4%  perf-profile.cpu-cy=
cles.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      0.34 =C2=B1 20%    +169.4%       0.90 =C2=B1  8%  perf-profile.cpu-cy=
cles.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.=
cpu_startup_entry.start_secondary
     37.50 =C2=B1  4%     -58.2%      15.66 =C2=B1  1%  perf-profile.cpu-cy=
cles.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtime=
r_interrupt.local_apic_timer_interrupt
     38.13 =C2=B1  4%     -57.4%      16.23 =C2=B1  1%  perf-profile.cpu-cy=
cles.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_tim=
er_interrupt.smp_apic_timer_interrupt
      1.17 =C2=B1 11%    +242.0%       4.01 =C2=B1  3%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_process.wake_up_q.futex_wake.do_futex
      1.78 =C2=B1  6%    +103.5%       3.63 =C2=B1  3%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.84.sched_ttwu_pending.cpu_startup_entry.sta=
rt_secondary
      0.58 =C2=B1 14%    +276.2%       2.17 =C2=B1  3%  perf-profile.cpu-cy=
cles.ttwu_do_activate.constprop.84.try_to_wake_up.wake_up_process.wake_up_q=
.futex_wake
      7.01 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.update_cfs_rq_blocked_load.task_tick_fair.scheduler_tick.update_proces=
s_times.tick_sched_handle
      7.33 =C2=B1  7%     -29.4%       5.17 =C2=B1  5%  perf-profile.cpu-cy=
cles.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_times.t=
ick_sched_handle
      0.92 =C2=B1 19%     -71.1%       0.27 =C2=B1  8%  perf-profile.cpu-cy=
cles.update_curr.update_cfs_shares.task_tick_fair.scheduler_tick.update_pro=
cess_times
     37.23 =C2=B1  4%     -58.5%      15.46 =C2=B1  1%  perf-profile.cpu-cy=
cles.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_=
queues.hrtimer_interrupt
      0.50 =C2=B1 13%    +471.4%       2.84 =C2=B1  7%  perf-profile.cpu-cy=
cles.update_sd_lb_stats.find_busiest_group.load_balance.pick_next_task_fair=
.__schedule
      0.83 =C2=B1 26%     -34.3%       0.54 =C2=B1 18%  perf-profile.cpu-cy=
cles.vfs_read.sys_read.entry_SYSCALL_64_fastpath.read
     11.60 =C2=B1  3%     +16.9%      13.56 =C2=B1  1%  perf-profile.cpu-cy=
cles.vfs_write.sys_write.entry_SYSCALL_64_fastpath
      1.20 =C2=B1 10%    +237.5%       4.05 =C2=B1  3%  perf-profile.cpu-cy=
cles.wake_up_process.wake_up_q.futex_wake.do_futex.sys_futex
      1.22 =C2=B1 11%    +234.4%       4.08 =C2=B1  3%  perf-profile.cpu-cy=
cles.wake_up_q.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
    241.00 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
    146202 =C2=B1  1%     -17.6%     120427 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.exec_clock
   9268142 =C2=B1  0%     -12.5%    8109679 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     13.75 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      8850 =C2=B1 13%     -91.7%     731.00 =C2=B1  5%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    257.00 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
    766.50 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
    144759 =C2=B1  2%     -19.2%     117010 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.exec_clock
   9291268 =C2=B1  0%     -13.9%    7998511 =C2=B1  0%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      1.75 =C2=B1116%    +185.7%       5.00 =C2=B1 31%  sched_debug.cfs_rq[=
10]:/.nr_spread_over
     11.25 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
     23027 =C2=B1 82%    -583.6%    -111362 =C2=B1-39%  sched_debug.cfs_rq[=
10]:/.spread0
      8330 =C2=B1 14%     -91.3%     726.75 =C2=B1  6%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    103.75 =C2=B1141%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
    768.00 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
    142825 =C2=B1  0%     -18.1%     116979 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.exec_clock
     54.75 =C2=B1132%     -83.6%       9.00 =C2=B1 15%  sched_debug.cfs_rq[=
11]:/.load
   9294874 =C2=B1  0%     -14.3%    7964103 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.min_vruntime
     12.00 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
     26628 =C2=B1 61%    -647.5%    -145789 =C2=B1-21%  sched_debug.cfs_rq[=
11]:/.spread0
      8028 =C2=B1  9%     -90.9%     727.25 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
     20.00 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    826.00 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
    142779 =C2=B1  0%     -17.9%     117183 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.exec_clock
   9299629 =C2=B1  0%     -13.8%    8017717 =C2=B1  0%  sched_debug.cfs_rq[=
12]:/.min_vruntime
      0.67 =C2=B1 70%    +462.5%       3.75 =C2=B1 29%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
     11.50 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
     31374 =C2=B1 33%    -393.9%     -92222 =C2=B1-21%  sched_debug.cfs_rq[=
12]:/.spread0
      8021 =C2=B1  9%     -90.9%     729.75 =C2=B1  5%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     52.25 =C2=B1106%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
    779.00 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
     78.50 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
    143107 =C2=B1  0%     -18.5%     116596 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.exec_clock
   9297407 =C2=B1  0%     -14.4%    7959769 =C2=B1  0%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
     29141 =C2=B1115%    -615.4%    -150192 =C2=B1-20%  sched_debug.cfs_rq[=
13]:/.spread0
      8053 =C2=B1  9%     -90.9%     729.00 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     91.25 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    852.50 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
    207.50 =C2=B1 54%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
    142472 =C2=B1  0%     -17.7%     117191 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.exec_clock
   9291416 =C2=B1  0%     -14.0%    7990154 =C2=B1  0%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     12.75 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
     23136 =C2=B1 54%    -617.9%    -119820 =C2=B1-12%  sched_debug.cfs_rq[=
14]:/.spread0
      8042 =C2=B1  9%     -90.9%     728.75 =C2=B1  5%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    220.25 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
    854.75 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
    172.25 =C2=B1 97%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
    144198 =C2=B1  2%     -17.8%     118464 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.exec_clock
     12.25 =C2=B1 14%     -28.6%       8.75 =C2=B1 16%  sched_debug.cfs_rq[=
15]:/.load
   9302093 =C2=B1  0%     -13.4%    8052174 =C2=B1  0%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     12.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
     33804 =C2=B1 49%    -271.1%     -57827 =C2=B1-63%  sched_debug.cfs_rq[=
15]:/.spread0
      8036 =C2=B1  9%     -90.9%     729.75 =C2=B1  5%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    185.00 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    797.75 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
    264.50 =C2=B1 96%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
    142849 =C2=B1  0%     -17.4%     118043 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.exec_clock
     12.00 =C2=B1  0%     -29.2%       8.50 =C2=B1 21%  sched_debug.cfs_rq[=
16]:/.load
   9291695 =C2=B1  0%     -14.0%    7993981 =C2=B1  0%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     11.25 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
     23403 =C2=B1144%    -595.9%    -116047 =C2=B1-21%  sched_debug.cfs_rq[=
16]:/.spread0
      8020 =C2=B1  9%     -90.9%     730.50 =C2=B1  5%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
    276.25 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
    776.25 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
     97.00 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
    143644 =C2=B1  1%     -16.3%     120286 =C2=B1  2%  sched_debug.cfs_rq[=
17]:/.exec_clock
   9300813 =C2=B1  0%     -13.7%    8030306 =C2=B1  0%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     10.50 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
      7887 =C2=B1  9%     -90.7%     729.75 =C2=B1  5%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    108.00 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    701.50 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
     33.25 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.blocked_load_avg
    142336 =C2=B1  0%     -17.6%     117334 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.exec_clock
   9273364 =C2=B1  0%     -13.7%    8004348 =C2=B1  0%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     10.75 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.runnable_load_avg
      5051 =C2=B1942%   -2192.7%    -105714 =C2=B1-44%  sched_debug.cfs_rq[=
18]:/.spread0
      7881 =C2=B1  9%     -90.7%     729.75 =C2=B1  5%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     43.75 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
    751.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
    119.25 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.blocked_load_avg
    142283 =C2=B1  0%     -17.7%     117075 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.exec_clock
     19.50 =C2=B1 43%     -59.0%       8.00 =C2=B1 21%  sched_debug.cfs_rq[=
19]:/.load
   9282522 =C2=B1  0%     -13.6%    8021734 =C2=B1  0%  sched_debug.cfs_rq[=
19]:/.min_vruntime
     19.75 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
     14205 =C2=B1298%    -722.1%     -88371 =C2=B1-45%  sched_debug.cfs_rq[=
19]:/.spread0
      7806 =C2=B1  8%     -90.6%     730.25 =C2=B1  5%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    139.50 =C2=B1 97%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
    944.25 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
    222.25 =C2=B1130%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
    142722 =C2=B1  0%     -17.2%     118212 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.exec_clock
   9274410 =C2=B1  0%     -13.9%    7987777 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.min_vruntime
     12.25 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
      6237 =C2=B1327%   -2054.8%    -121938 =C2=B1-12%  sched_debug.cfs_rq[=
1]:/.spread0
      8840 =C2=B1 14%     -91.7%     730.75 =C2=B1  5%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    235.25 =C2=B1122%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    773.25 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
     59.50 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
    142279 =C2=B1  0%     -17.9%     116789 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.exec_clock
   9288045 =C2=B1  0%     -13.8%    8005011 =C2=B1  0%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     12.25 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
     19716 =C2=B1230%    -633.1%    -105106 =C2=B1-18%  sched_debug.cfs_rq[=
20]:/.spread0
      7802 =C2=B1  8%     -90.6%     730.50 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     71.75 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
    784.75 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
    113.75 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.blocked_load_avg
    142404 =C2=B1  0%     -18.0%     116781 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.exec_clock
   9283313 =C2=B1  0%     -13.9%    7989703 =C2=B1  0%  sched_debug.cfs_rq[=
21]:/.min_vruntime
     11.75 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
     14973 =C2=B1224%    -904.3%    -120428 =C2=B1-11%  sched_debug.cfs_rq[=
21]:/.spread0
      7783 =C2=B1  7%     -90.6%     730.75 =C2=B1  5%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
    126.75 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
    795.75 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.utilization_load_avg
    106.00 =C2=B1133%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
    142318 =C2=B1  0%     -18.0%     116631 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.exec_clock
   9300210 =C2=B1  0%     -14.3%    7966223 =C2=B1  0%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     12.25 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
     31863 =C2=B1 56%    -551.7%    -143923 =C2=B1-18%  sched_debug.cfs_rq[=
22]:/.spread0
      7781 =C2=B1  7%     -90.6%     729.50 =C2=B1  5%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
    118.50 =C2=B1118%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
    714.50 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.utilization_load_avg
    142177 =C2=B1  0%     -17.7%     117001 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.exec_clock
   9300779 =C2=B1  0%     -14.0%    7996541 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.min_vruntime
     12.25 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
     32432 =C2=B1116%    -450.4%    -113647 =C2=B1-23%  sched_debug.cfs_rq[=
23]:/.spread0
      7747 =C2=B1  7%     -90.6%     728.50 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
     55.50 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
    804.75 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
    156.75 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.blocked_load_avg
    142812 =C2=B1  0%     -18.0%     117111 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.exec_clock
   9281580 =C2=B1  0%     -13.8%    8000544 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     10.75 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
     13216 =C2=B1308%    -929.8%    -109675 =C2=B1-23%  sched_debug.cfs_rq[=
24]:/.spread0
      7595 =C2=B1  8%     -90.4%     727.75 =C2=B1  5%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
    167.75 =C2=B1106%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
    760.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.utilization_load_avg
    329.50 =C2=B1 68%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
    142748 =C2=B1  0%     -17.5%     117730 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.exec_clock
   9290750 =C2=B1  0%     -13.7%    8016894 =C2=B1  0%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     12.25 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
     22363 =C2=B1136%    -517.4%     -93351 =C2=B1-59%  sched_debug.cfs_rq[=
25]:/.spread0
      7582 =C2=B1  8%     -90.4%     727.00 =C2=B1  5%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
    342.00 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
    772.50 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
    112.50 =C2=B1144%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
    142945 =C2=B1  0%     -17.8%     117490 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.exec_clock
   9306522 =C2=B1  0%     -13.7%    8028890 =C2=B1  0%  sched_debug.cfs_rq[=
26]:/.min_vruntime
     13.00 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
     38129 =C2=B1 71%    -313.4%     -81372 =C2=B1-27%  sched_debug.cfs_rq[=
26]:/.spread0
      7527 =C2=B1  9%     -90.3%     727.00 =C2=B1  5%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
    125.75 =C2=B1129%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
    815.50 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
    142638 =C2=B1  0%     -17.8%     117295 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.exec_clock
   9302031 =C2=B1  0%     -13.9%    8009910 =C2=B1  0%  sched_debug.cfs_rq[=
27]:/.min_vruntime
      9.75 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
     33629 =C2=B1112%    -398.5%    -100381 =C2=B1-11%  sched_debug.cfs_rq[=
27]:/.spread0
      7523 =C2=B1  9%     -90.3%     728.00 =C2=B1  5%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
    169.75 =C2=B1101%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
    638.75 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
    185.75 =C2=B1 63%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
    142390 =C2=B1  0%     -17.6%     117298 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.exec_clock
     13.50 =C2=B1 19%     -59.3%       5.50 =C2=B1 48%  sched_debug.cfs_rq[=
28]:/.load
   9275347 =C2=B1  0%     -13.8%    7994861 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.min_vruntime
     13.25 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
      6930 =C2=B1596%   -1765.8%    -115455 =C2=B1-30%  sched_debug.cfs_rq[=
28]:/.spread0
      7514 =C2=B1  9%     -90.3%     727.50 =C2=B1  5%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
    199.50 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
    841.50 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
    142513 =C2=B1  0%     -17.2%     118000 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.exec_clock
   9281519 =C2=B1  0%     -14.0%    7981691 =C2=B1  0%  sched_debug.cfs_rq[=
29]:/.min_vruntime
      0.50 =C2=B1100%    +450.0%       2.75 =C2=B1 47%  sched_debug.cfs_rq[=
29]:/.nr_spread_over
     12.00 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
     13100 =C2=B1198%   -1082.0%    -128645 =C2=B1-16%  sched_debug.cfs_rq[=
29]:/.spread0
      7487 =C2=B1  9%     -90.3%     726.50 =C2=B1  5%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     46.25 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
    782.50 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
    158.00 =C2=B1165%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
    143564 =C2=B1  1%     -18.8%     116537 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.exec_clock
     17.75 =C2=B1 27%     -43.7%      10.00 =C2=B1 22%  sched_debug.cfs_rq[=
2]:/.load
   9275237 =C2=B1  0%     -13.9%    7983145 =C2=B1  0%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      1.50 =C2=B1100%    +166.7%       4.00 =C2=B1 39%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
     18.25 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
      7059 =C2=B1350%   -1893.2%    -126591 =C2=B1-33%  sched_debug.cfs_rq[=
2]:/.spread0
      8836 =C2=B1 14%     -91.7%     730.25 =C2=B1  5%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    178.50 =C2=B1147%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
    935.50 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
    142539 =C2=B1  0%     -17.6%     117409 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.exec_clock
     18.75 =C2=B1 43%     -48.0%       9.75 =C2=B1 15%  sched_debug.cfs_rq[=
30]:/.load
   9313600 =C2=B1  0%     -14.1%    8004085 =C2=B1  0%  sched_debug.cfs_rq[=
30]:/.min_vruntime
     24.75 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
     45171 =C2=B1 87%    -335.3%    -106270 =C2=B1-29%  sched_debug.cfs_rq[=
30]:/.spread0
      7494 =C2=B1  8%     -90.3%     725.25 =C2=B1  5%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
     97.75 =C2=B1140%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
    833.50 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
    142575 =C2=B1  0%     -17.5%     117670 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.exec_clock
     11.00 =C2=B1  9%     -31.8%       7.50 =C2=B1 14%  sched_debug.cfs_rq[=
31]:/.load
   9306608 =C2=B1  0%     -13.7%    8029377 =C2=B1  0%  sched_debug.cfs_rq[=
31]:/.min_vruntime
     11.00 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
     38143 =C2=B1127%    -312.4%     -80999 =C2=B1-42%  sched_debug.cfs_rq[=
31]:/.spread0
      7529 =C2=B1  7%     -90.4%     725.00 =C2=B1  5%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
    166.00 =C2=B1124%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
    709.75 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
    142794 =C2=B1  0%     -22.0%     111326 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.exec_clock
     12.25 =C2=B1 14%     -38.8%       7.50 =C2=B1 33%  sched_debug.cfs_rq[=
32]:/.load
   9341374 =C2=B1  0%     -18.7%    7599117 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     12.25 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.runnable_load_avg
     72900 =C2=B1 22%    -801.3%    -511277 =C2=B1 -9%  sched_debug.cfs_rq[=
32]:/.spread0
      7527 =C2=B1  7%     -90.4%     723.75 =C2=B1  5%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     60.25 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
    821.75 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.utilization_load_avg
    237.25 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.blocked_load_avg
    143019 =C2=B1  0%     -22.1%     111353 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.exec_clock
   9331135 =C2=B1  0%     -18.8%    7579701 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.min_vruntime
     13.50 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.runnable_load_avg
     62647 =C2=B1 25%    -947.1%    -530720 =C2=B1 -7%  sched_debug.cfs_rq[=
33]:/.spread0
      7449 =C2=B1  8%     -90.3%     723.25 =C2=B1  5%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
    251.50 =C2=B1110%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
    738.25 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.utilization_load_avg
    142679 =C2=B1  0%     -22.5%     110619 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.exec_clock
     12.25 =C2=B1 14%     -44.9%       6.75 =C2=B1 28%  sched_debug.cfs_rq[=
34]:/.load
   9339040 =C2=B1  0%     -19.2%    7543387 =C2=B1  0%  sched_debug.cfs_rq[=
34]:/.min_vruntime
     11.00 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
     70513 =C2=B1 32%    -904.2%    -567044 =C2=B1 -3%  sched_debug.cfs_rq[=
34]:/.spread0
      7380 =C2=B1  9%     -90.2%     722.25 =C2=B1  5%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
     65.75 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
    765.00 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
     88.00 =C2=B1 70%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.blocked_load_avg
    142971 =C2=B1  0%     -22.3%     111037 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.exec_clock
   9354562 =C2=B1  0%     -19.2%    7560593 =C2=B1  0%  sched_debug.cfs_rq[=
35]:/.min_vruntime
     14.75 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
     86029 =C2=B1 28%    -739.1%    -549848 =C2=B1 -4%  sched_debug.cfs_rq[=
35]:/.spread0
      7349 =C2=B1  9%     -90.2%     721.50 =C2=B1  5%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
    102.75 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
    814.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
    143029 =C2=B1  0%     -22.6%     110666 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.exec_clock
     12.50 =C2=B1  6%     -50.0%       6.25 =C2=B1 61%  sched_debug.cfs_rq[=
36]:/.load
   9368504 =C2=B1  0%     -19.6%    7532304 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.min_vruntime
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.runnable_load_avg
     99915 =C2=B1 26%    -678.7%    -578173 =C2=B1 -9%  sched_debug.cfs_rq[=
36]:/.spread0
      7313 =C2=B1  9%     -90.1%     721.25 =C2=B1  5%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     85.75 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
    857.50 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
    142894 =C2=B1  0%     -22.2%     111150 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.exec_clock
     14.50 =C2=B1 22%     -43.1%       8.25 =C2=B1 33%  sched_debug.cfs_rq[=
37]:/.load
   9336085 =C2=B1  0%     -19.1%    7556769 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.min_vruntime
     14.25 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
     67396 =C2=B1 32%    -921.6%    -553728 =C2=B1-13%  sched_debug.cfs_rq[=
37]:/.spread0
      7264 =C2=B1  9%     -90.1%     720.00 =C2=B1  5%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
     23.75 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
    898.25 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.utilization_load_avg
    142699 =C2=B1  0%     -22.0%     111240 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.exec_clock
   9332970 =C2=B1  0%     -18.6%    7593402 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.min_vruntime
      9.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
     64276 =C2=B1 30%    -904.5%    -517101 =C2=B1-13%  sched_debug.cfs_rq[=
38]:/.spread0
      7263 =C2=B1  9%     -90.1%     719.50 =C2=B1  5%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
     15.00 =C2=B1 27%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
    648.00 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
    142841 =C2=B1  0%     -22.2%     111096 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.exec_clock
   9346198 =C2=B1  0%     -18.9%    7580330 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.min_vruntime
     10.00 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
     77475 =C2=B1 27%    -784.3%    -530192 =C2=B1 -3%  sched_debug.cfs_rq[=
39]:/.spread0
      7248 =C2=B1 10%     -90.1%     720.00 =C2=B1  5%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     14.25 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
    660.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.utilization_load_avg
     10.75 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    142518 =C2=B1  0%     -17.6%     117364 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.exec_clock
   9284154 =C2=B1  0%     -13.3%    8050398 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     15972 =C2=B1171%    -471.6%     -59354 =C2=B1-40%  sched_debug.cfs_rq[=
3]:/.spread0
      8845 =C2=B1 14%     -91.7%     730.50 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     23.50 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
    812.00 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
    119.75 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.blocked_load_avg
    142629 =C2=B1  0%     -22.3%     110856 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.exec_clock
   9360211 =C2=B1  0%     -19.3%    7549458 =C2=B1  0%  sched_debug.cfs_rq[=
40]:/.min_vruntime
      0.50 =C2=B1100%    +350.0%       2.25 =C2=B1 48%  sched_debug.cfs_rq[=
40]:/.nr_spread_over
     11.50 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
     91475 =C2=B1 46%    -713.4%    -561092 =C2=B1 -4%  sched_debug.cfs_rq[=
40]:/.spread0
      7244 =C2=B1  9%     -90.1%     719.00 =C2=B1  5%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
    131.75 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
    759.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.utilization_load_avg
    142706 =C2=B1  0%     -22.5%     110555 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.exec_clock
   9350794 =C2=B1  0%     -19.4%    7535553 =C2=B1  0%  sched_debug.cfs_rq[=
41]:/.min_vruntime
     11.75 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
     82041 =C2=B1 23%    -800.9%    -575018 =C2=B1 -5%  sched_debug.cfs_rq[=
41]:/.spread0
      7234 =C2=B1  9%     -90.1%     719.25 =C2=B1  5%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
    222.00 =C2=B1111%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
    801.25 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.utilization_load_avg
     55.00 =C2=B1121%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.blocked_load_avg
    143255 =C2=B1  0%     -22.4%     111197 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.exec_clock
     12.75 =C2=B1 10%     -58.8%       5.25 =C2=B1 51%  sched_debug.cfs_rq[=
42]:/.load
   9360654 =C2=B1  0%     -19.0%    7584152 =C2=B1  0%  sched_debug.cfs_rq[=
42]:/.min_vruntime
     13.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
     91895 =C2=B1 22%    -672.9%    -526428 =C2=B1 -7%  sched_debug.cfs_rq[=
42]:/.spread0
      7231 =C2=B1  9%     -90.1%     718.50 =C2=B1  5%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
     68.75 =C2=B1 95%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
    770.75 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.utilization_load_avg
    142802 =C2=B1  0%     -21.9%     111507 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.exec_clock
   9370200 =C2=B1  0%     -19.3%    7563553 =C2=B1  0%  sched_debug.cfs_rq[=
43]:/.min_vruntime
     11.50 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
    101420 =C2=B1 18%    -639.4%    -547041 =C2=B1 -9%  sched_debug.cfs_rq[=
43]:/.spread0
      6848 =C2=B1 11%     -89.5%     717.75 =C2=B1  5%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     48.25 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
    780.50 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
    142788 =C2=B1  0%     -22.1%     111199 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.exec_clock
     13.50 =C2=B1 11%     -46.3%       7.25 =C2=B1 31%  sched_debug.cfs_rq[=
44]:/.load
   9354787 =C2=B1  0%     -19.1%    7568040 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.min_vruntime
     13.25 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.runnable_load_avg
     86004 =C2=B1 18%    -730.9%    -542563 =C2=B1-11%  sched_debug.cfs_rq[=
44]:/.spread0
      6839 =C2=B1 11%     -89.5%     716.50 =C2=B1  5%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
    184.00 =C2=B1 95%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
    865.50 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
    142797 =C2=B1  0%     -22.6%     110569 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.exec_clock
   9342367 =C2=B1  0%     -19.2%    7544773 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.min_vruntime
     11.75 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
     73570 =C2=B1 25%    -869.1%    -565856 =C2=B1 -9%  sched_debug.cfs_rq[=
45]:/.spread0
      6872 =C2=B1 12%     -89.6%     716.75 =C2=B1  5%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
    189.25 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
    749.75 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
    143110 =C2=B1  0%     -23.0%     110188 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.exec_clock
   9361183 =C2=B1  0%     -20.0%    7486462 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     10.75 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
     92314 =C2=B1 20%    -776.2%    -624189 =C2=B1 -6%  sched_debug.cfs_rq[=
46]:/.spread0
      6894 =C2=B1 11%     -89.6%     716.50 =C2=B1  5%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
    166.50 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
    704.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.utilization_load_avg
    143306 =C2=B1  0%     -22.9%     110557 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.exec_clock
     12.25 =C2=B1 14%     -38.8%       7.50 =C2=B1 24%  sched_debug.cfs_rq[=
47]:/.load
   9352483 =C2=B1  0%     -19.7%    7512482 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.min_vruntime
     13.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
     83611 =C2=B1 42%    -815.4%    -598182 =C2=B1 -2%  sched_debug.cfs_rq[=
47]:/.spread0
      6638 =C2=B1  5%     -89.2%     715.00 =C2=B1  5%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
     20.25 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
    756.50 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
    142786 =C2=B1  0%     -22.9%     110139 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.exec_clock
   9339198 =C2=B1  0%     -19.9%    7477884 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.min_vruntime
     10.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
     70312 =C2=B1 48%   -1000.0%    -632791 =C2=B1 -8%  sched_debug.cfs_rq[=
48]:/.spread0
      6574 =C2=B1  5%     -89.1%     714.25 =C2=B1  5%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
     70.00 =C2=B1125%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
    650.00 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
    105.75 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.blocked_load_avg
    142830 =C2=B1  0%     -22.2%     111182 =C2=B1  1%  sched_debug.cfs_rq[=
49]:/.exec_clock
     11.50 =C2=B1  7%     -32.6%       7.75 =C2=B1 38%  sched_debug.cfs_rq[=
49]:/.load
   9354782 =C2=B1  0%     -19.3%    7552603 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.min_vruntime
     11.25 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
     85881 =C2=B1 33%    -749.8%    -558089 =C2=B1-12%  sched_debug.cfs_rq[=
49]:/.spread0
      6566 =C2=B1  5%     -89.1%     713.00 =C2=B1  5%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
    117.75 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
    787.25 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.utilization_load_avg
     82.75 =C2=B1123%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
    142498 =C2=B1  0%     -17.9%     116982 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.exec_clock
   9287520 =C2=B1  0%     -13.8%    8004316 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.min_vruntime
      1.50 =C2=B1 33%    +216.7%       4.75 =C2=B1 17%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
     11.00 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
     19327 =C2=B1 41%    -645.7%    -105468 =C2=B1-32%  sched_debug.cfs_rq[=
4]:/.spread0
      8841 =C2=B1 14%     -91.7%     730.50 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     94.25 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    747.50 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
    142562 =C2=B1  0%     -22.0%     111202 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.exec_clock
   9325791 =C2=B1  0%     -19.0%    7551106 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.min_vruntime
     11.25 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.runnable_load_avg
     56883 =C2=B1 75%   -1083.7%    -559587 =C2=B1-12%  sched_debug.cfs_rq[=
50]:/.spread0
      6561 =C2=B1  5%     -89.1%     712.00 =C2=B1  5%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
    790.25 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
    142962 =C2=B1  0%     -22.5%     110764 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.exec_clock
   9362018 =C2=B1  0%     -19.6%    7523487 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.min_vruntime
     14.25 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.runnable_load_avg
     93095 =C2=B1 35%    -730.8%    -587227 =C2=B1 -4%  sched_debug.cfs_rq[=
51]:/.spread0
      6554 =C2=B1  5%     -89.1%     712.50 =C2=B1  4%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
    149.50 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
    763.50 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
    142907 =C2=B1  0%     -22.3%     111013 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.exec_clock
     11.50 =C2=B1  7%     -19.6%       9.25 =C2=B1 11%  sched_debug.cfs_rq[=
52]:/.load
   9363172 =C2=B1  0%     -19.4%    7547797 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.min_vruntime
     11.75 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
     94229 =C2=B1 49%    -697.4%    -562923 =C2=B1-10%  sched_debug.cfs_rq[=
52]:/.spread0
      6557 =C2=B1  6%     -89.1%     712.00 =C2=B1  5%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
     17.00 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
    702.75 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
    143213 =C2=B1  0%     -22.3%     111249 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.exec_clock
     12.25 =C2=B1 14%     -44.9%       6.75 =C2=B1 28%  sched_debug.cfs_rq[=
53]:/.load
   9375495 =C2=B1  0%     -19.5%    7549425 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.min_vruntime
     11.75 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.runnable_load_avg
    106540 =C2=B1 27%    -626.9%    -561315 =C2=B1 -2%  sched_debug.cfs_rq[=
53]:/.spread0
      6554 =C2=B1  5%     -89.1%     712.00 =C2=B1  5%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
    126.25 =C2=B1154%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
    794.50 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
    143063 =C2=B1  0%     -22.6%     110754 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.exec_clock
   9356995 =C2=B1  0%     -19.5%    7528673 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.min_vruntime
     11.50 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.runnable_load_avg
     88037 =C2=B1 35%    -761.2%    -582092 =C2=B1 -4%  sched_debug.cfs_rq[=
54]:/.spread0
      6600 =C2=B1  5%     -89.2%     712.25 =C2=B1  5%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
     30.75 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
    762.50 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.utilization_load_avg
    143144 =C2=B1  0%     -23.0%     110221 =C2=B1  1%  sched_debug.cfs_rq[=
55]:/.exec_clock
   9378617 =C2=B1  0%     -20.2%    7482376 =C2=B1  1%  sched_debug.cfs_rq[=
55]:/.min_vruntime
     10.25 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.runnable_load_avg
    109644 =C2=B1 27%    -673.1%    -628413 =C2=B1-12%  sched_debug.cfs_rq[=
55]:/.spread0
      6587 =C2=B1  5%     -89.2%     711.50 =C2=B1  5%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
     79.00 =C2=B1140%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
    625.75 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.utilization_load_avg
    143063 =C2=B1  0%     -22.3%     111169 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.exec_clock
   9353350 =C2=B1  0%     -19.3%    7543529 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.min_vruntime
     10.50 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
     84371 =C2=B1 25%    -772.3%    -567263 =C2=B1-10%  sched_debug.cfs_rq[=
56]:/.spread0
      6584 =C2=B1  5%     -89.2%     710.75 =C2=B1  5%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
    119.25 =C2=B1118%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
    728.00 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
     79.50 =C2=B1104%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.blocked_load_avg
    143039 =C2=B1  0%     -22.3%     111121 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.exec_clock
   9364175 =C2=B1  0%     -19.2%    7561658 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.min_vruntime
     10.25 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
     95188 =C2=B1 30%    -676.9%    -549143 =C2=B1-11%  sched_debug.cfs_rq[=
57]:/.spread0
      6629 =C2=B1  5%     -89.3%     710.75 =C2=B1  5%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
     92.75 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
    709.00 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
    100.00 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.blocked_load_avg
    142923 =C2=B1  0%     -22.5%     110732 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.exec_clock
     10.50 =C2=B1  8%     -28.6%       7.50 =C2=B1 14%  sched_debug.cfs_rq[=
58]:/.load
   9357487 =C2=B1  0%     -19.9%    7493455 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.min_vruntime
     10.00 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.runnable_load_avg
     88465 =C2=B1 11%    -797.8%    -617354 =C2=B1 -4%  sched_debug.cfs_rq[=
58]:/.spread0
      6742 =C2=B1  5%     -89.5%     710.75 =C2=B1  5%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
    111.50 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
    713.50 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
    143176 =C2=B1  0%     -22.4%     111154 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.exec_clock
     12.75 =C2=B1 10%     -39.2%       7.75 =C2=B1 26%  sched_debug.cfs_rq[=
59]:/.load
   9352387 =C2=B1  0%     -19.1%    7564285 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.min_vruntime
     13.50 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.runnable_load_avg
     83354 =C2=B1 38%    -755.7%    -546544 =C2=B1 -2%  sched_debug.cfs_rq[=
59]:/.spread0
      6437 =C2=B1  5%     -89.0%     709.75 =C2=B1  5%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
     77.75 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
    836.25 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
    146.00 =C2=B1143%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
    142354 =C2=B1  0%     -18.2%     116485 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.exec_clock
   9274120 =C2=B1  0%     -14.0%    7978693 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.min_vruntime
     11.00 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
      5922 =C2=B1237%   -2313.7%    -131096 =C2=B1-15%  sched_debug.cfs_rq[=
5]:/.spread0
      8728 =C2=B1 13%     -91.6%     729.75 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    157.50 =C2=B1133%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
    747.50 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
    142979 =C2=B1  0%     -22.0%     111467 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.exec_clock
   9345374 =C2=B1  0%     -19.0%    7568469 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.min_vruntime
     12.25 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.runnable_load_avg
     76332 =C2=B1 45%    -810.5%    -542379 =C2=B1 -3%  sched_debug.cfs_rq[=
60]:/.spread0
      6335 =C2=B1  4%     -88.8%     708.75 =C2=B1  4%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
     71.75 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
    810.00 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.utilization_load_avg
    129.25 =C2=B1 67%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.blocked_load_avg
    143041 =C2=B1  0%     -22.6%     110711 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.exec_clock
   9363168 =C2=B1  0%     -19.6%    7526106 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.min_vruntime
     11.00 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
     94115 =C2=B1 22%    -721.3%    -584768 =C2=B1 -3%  sched_debug.cfs_rq[=
61]:/.spread0
      6338 =C2=B1  4%     -88.8%     708.75 =C2=B1  4%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
    140.75 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
    758.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
    134.75 =C2=B1126%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.blocked_load_avg
    142926 =C2=B1  0%     -22.9%     110244 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.exec_clock
     12.75 =C2=B1 20%     -49.0%       6.50 =C2=B1 25%  sched_debug.cfs_rq[=
62]:/.load
   9341593 =C2=B1  0%     -19.7%    7497359 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.min_vruntime
     12.25 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.runnable_load_avg
     72531 =C2=B1 52%    -945.9%    -613524 =C2=B1 -8%  sched_debug.cfs_rq[=
62]:/.spread0
      6342 =C2=B1  4%     -88.8%     708.25 =C2=B1  4%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
    147.25 =C2=B1116%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
    820.75 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.utilization_load_avg
    143175 =C2=B1  0%     -21.9%     111760 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.exec_clock
   9367957 =C2=B1  0%     -19.3%    7560688 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.min_vruntime
      0.67 =C2=B1 70%    +612.5%       4.75 =C2=B1 65%  sched_debug.cfs_rq[=
63]:/.nr_spread_over
     14.25 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.runnable_load_avg
     98887 =C2=B1 37%    -656.4%    -550215 =C2=B1-10%  sched_debug.cfs_rq[=
63]:/.spread0
      6342 =C2=B1  4%     -88.8%     709.25 =C2=B1  5%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
    103.50 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
    807.25 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.utilization_load_avg
    136.50 =C2=B1105%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
    142436 =C2=B1  0%     -17.7%     117294 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.exec_clock
   9281207 =C2=B1  0%     -13.3%    8049382 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.min_vruntime
     12.75 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
     13002 =C2=B1191%    -564.6%     -60412 =C2=B1-37%  sched_debug.cfs_rq[=
6]:/.spread0
      8687 =C2=B1 13%     -91.6%     730.00 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
    149.50 =C2=B1 96%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    776.25 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
    142797 =C2=B1  0%     -17.9%     117286 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.exec_clock
   9323526 =C2=B1  0%     -13.8%    8032395 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     12.25 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
     55309 =C2=B1 35%    -240.0%     -77429 =C2=B1-32%  sched_debug.cfs_rq[=
7]:/.spread0
      8375 =C2=B1 14%     -91.3%     729.75 =C2=B1  5%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     37.00 =C2=B1 65%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    794.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
    287.00 =C2=B1 43%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
    144063 =C2=B1  1%     -18.5%     117457 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.exec_clock
     14.25 =C2=B1  9%     -35.1%       9.25 =C2=B1 19%  sched_debug.cfs_rq[=
8]:/.load
   9300343 =C2=B1  0%     -13.8%    8016123 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.min_vruntime
      1.00 =C2=B1100%    +575.0%       6.75 =C2=B1 28%  sched_debug.cfs_rq[=
8]:/.nr_spread_over
     13.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
     32111 =C2=B1 74%    -391.9%     -93722 =C2=B1-19%  sched_debug.cfs_rq[=
8]:/.spread0
      8367 =C2=B1 13%     -91.3%     727.50 =C2=B1  5%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    301.50 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    914.75 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
    144266 =C2=B1  1%     -18.1%     118134 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.exec_clock
   9313146 =C2=B1  0%     -14.1%    8002445 =C2=B1  0%  sched_debug.cfs_rq[=
9]:/.min_vruntime
     10.75 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
     44905 =C2=B1 67%    -339.2%    -107421 =C2=B1-30%  sched_debug.cfs_rq[=
9]:/.spread0
      8361 =C2=B1 13%     -91.3%     727.00 =C2=B1  5%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     87.00 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
    738.25 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
    525705 =C2=B1 17%     +23.6%     649635 =C2=B1  9%  sched_debug.cpu#0.a=
vg_idle
     18.00 =C2=B1 21%     -50.0%       9.00 =C2=B1 24%  sched_debug.cpu#0.c=
pu_load[0]
     16.25 =C2=B1 11%     -44.6%       9.00 =C2=B1 24%  sched_debug.cpu#0.c=
pu_load[1]
     15.75 =C2=B1  6%     -42.9%       9.00 =C2=B1 24%  sched_debug.cpu#0.c=
pu_load[2]
     15.50 =C2=B1 10%     -41.9%       9.00 =C2=B1 24%  sched_debug.cpu#0.c=
pu_load[3]
     15.00 =C2=B1 10%     -33.3%      10.00 =C2=B1 14%  sched_debug.cpu#0.c=
pu_load[4]
     88863 =C2=B1 10%     +32.9%     118069 =C2=B1  6%  sched_debug.cpu#0.n=
r_switches
     93984 =C2=B1  9%     +31.0%     123089 =C2=B1  5%  sched_debug.cpu#0.s=
ched_count
     20368 =C2=B1  8%    +147.4%      50400 =C2=B1  5%  sched_debug.cpu#0.s=
ched_goidle
     54660 =C2=B1  7%     +24.2%      67904 =C2=B1 16%  sched_debug.cpu#0.t=
twu_count
     22842 =C2=B1 13%     -50.4%      11331 =C2=B1 14%  sched_debug.cpu#0.t=
twu_local
    326769 =C2=B1 10%    +106.3%     674073 =C2=B1 11%  sched_debug.cpu#1.a=
vg_idle
     12.00 =C2=B1  5%     -29.2%       8.50 =C2=B1 24%  sched_debug.cpu#1.c=
pu_load[1]
     12.25 =C2=B1  8%     -28.6%       8.75 =C2=B1 20%  sched_debug.cpu#1.c=
pu_load[2]
     12.25 =C2=B1  3%     -28.6%       8.75 =C2=B1 20%  sched_debug.cpu#1.c=
pu_load[3]
     12.00 =C2=B1  0%     -25.0%       9.00 =C2=B1 17%  sched_debug.cpu#1.c=
pu_load[4]
     79814 =C2=B1 21%     +50.4%     120078 =C2=B1  4%  sched_debug.cpu#1.n=
r_switches
     79970 =C2=B1 21%     +50.2%     120155 =C2=B1  4%  sched_debug.cpu#1.s=
ched_count
     22999 =C2=B1 22%    +134.1%      53837 =C2=B1  3%  sched_debug.cpu#1.s=
ched_goidle
     40005 =C2=B1 18%     +47.2%      58902 =C2=B1  9%  sched_debug.cpu#1.t=
twu_count
     14965 =C2=B1 34%     -42.6%       8591 =C2=B1 18%  sched_debug.cpu#1.t=
twu_local
    445193 =C2=B1 19%     +36.0%     605346 =C2=B1 12%  sched_debug.cpu#10.=
avg_idle
     11.50 =C2=B1 13%     -28.3%       8.25 =C2=B1 13%  sched_debug.cpu#10.=
cpu_load[2]
     12.00 =C2=B1 11%     -27.1%       8.75 =C2=B1  9%  sched_debug.cpu#10.=
cpu_load[4]
    153918 =C2=B1  1%     -10.6%     137593 =C2=B1  0%  sched_debug.cpu#10.=
nr_load_updates
     63567 =C2=B1  3%     +78.6%     113523 =C2=B1 10%  sched_debug.cpu#10.=
nr_switches
     64024 =C2=B1  3%     +77.8%     113814 =C2=B1 10%  sched_debug.cpu#10.=
sched_count
     17811 =C2=B1  3%    +186.2%      50970 =C2=B1 11%  sched_debug.cpu#10.=
sched_goidle
     37807 =C2=B1  5%     +39.5%      52755 =C2=B1  2%  sched_debug.cpu#10.=
ttwu_count
     12537 =C2=B1  7%     -51.6%       6073 =C2=B1 17%  sched_debug.cpu#10.=
ttwu_local
     12.75 =C2=B1 10%     -39.2%       7.75 =C2=B1 14%  sched_debug.cpu#11.=
cpu_load[0]
     13.00 =C2=B1 13%     -38.5%       8.00 =C2=B1  8%  sched_debug.cpu#11.=
cpu_load[1]
     12.75 =C2=B1 15%     -37.3%       8.00 =C2=B1  8%  sched_debug.cpu#11.=
cpu_load[2]
     12.75 =C2=B1 15%     -37.3%       8.00 =C2=B1  8%  sched_debug.cpu#11.=
cpu_load[3]
     12.50 =C2=B1 12%     -36.0%       8.00 =C2=B1  8%  sched_debug.cpu#11.=
cpu_load[4]
    153386 =C2=B1  0%     -10.6%     137079 =C2=B1  0%  sched_debug.cpu#11.=
nr_load_updates
     60849 =C2=B1  9%     +73.4%     105492 =C2=B1  4%  sched_debug.cpu#11.=
nr_switches
     61165 =C2=B1  9%     +74.3%     106597 =C2=B1  3%  sched_debug.cpu#11.=
sched_count
     17575 =C2=B1  7%    +166.4%      46821 =C2=B1  3%  sched_debug.cpu#11.=
sched_goidle
     35722 =C2=B1 16%     +54.4%      55167 =C2=B1  5%  sched_debug.cpu#11.=
ttwu_count
     11434 =C2=B1 24%     -43.9%       6414 =C2=B1 11%  sched_debug.cpu#11.=
ttwu_local
     11.50 =C2=B1  7%     -28.3%       8.25 =C2=B1 17%  sched_debug.cpu#12.=
cpu_load[0]
     11.75 =C2=B1  3%     -27.7%       8.50 =C2=B1 13%  sched_debug.cpu#12.=
cpu_load[1]
     11.75 =C2=B1  3%     -27.7%       8.50 =C2=B1 13%  sched_debug.cpu#12.=
cpu_load[2]
     12.00 =C2=B1  0%     -27.1%       8.75 =C2=B1  9%  sched_debug.cpu#12.=
cpu_load[3]
     12.00 =C2=B1  0%     -25.0%       9.00 =C2=B1  7%  sched_debug.cpu#12.=
cpu_load[4]
    153853 =C2=B1  1%     -10.6%     137587 =C2=B1  0%  sched_debug.cpu#12.=
nr_load_updates
     63214 =C2=B1 13%     +76.7%     111693 =C2=B1  8%  sched_debug.cpu#12.=
nr_switches
     63692 =C2=B1 13%     +76.0%     112072 =C2=B1  8%  sched_debug.cpu#12.=
sched_count
     19048 =C2=B1 17%    +163.2%      50134 =C2=B1  9%  sched_debug.cpu#12.=
sched_goidle
     34334 =C2=B1  7%     +51.4%      51981 =C2=B1  3%  sched_debug.cpu#12.=
ttwu_count
     11434 =C2=B1 20%     -46.0%       6176 =C2=B1 13%  sched_debug.cpu#12.=
ttwu_local
     12.50 =C2=B1  6%     -32.0%       8.50 =C2=B1 17%  sched_debug.cpu#13.=
cpu_load[1]
     12.75 =C2=B1  6%     -31.4%       8.75 =C2=B1 16%  sched_debug.cpu#13.=
cpu_load[2]
     12.75 =C2=B1  6%     -25.5%       9.50 =C2=B1 11%  sched_debug.cpu#13.=
cpu_load[3]
     12.75 =C2=B1  6%     -23.5%       9.75 =C2=B1 13%  sched_debug.cpu#13.=
cpu_load[4]
      4487 =C2=B1  0%     -27.6%       3248 =C2=B1 16%  sched_debug.cpu#13.=
curr->pid
    152897 =C2=B1  0%     -10.4%     137051 =C2=B1  0%  sched_debug.cpu#13.=
nr_load_updates
     59926 =C2=B1 12%     +64.9%      98805 =C2=B1  2%  sched_debug.cpu#13.=
nr_switches
     60220 =C2=B1 12%     +64.7%      99184 =C2=B1  2%  sched_debug.cpu#13.=
sched_count
     17860 =C2=B1  6%    +147.4%      44193 =C2=B1  1%  sched_debug.cpu#13.=
sched_goidle
     33095 =C2=B1 13%     +73.9%      57550 =C2=B1 12%  sched_debug.cpu#13.=
ttwu_count
     10235 =C2=B1 25%     -45.7%       5561 =C2=B1 13%  sched_debug.cpu#13.=
ttwu_local
    408018 =C2=B1 16%     +30.8%     533849 =C2=B1  4%  sched_debug.cpu#14.=
avg_idle
     12.75 =C2=B1  6%     -43.1%       7.25 =C2=B1 31%  sched_debug.cpu#14.=
cpu_load[0]
     12.25 =C2=B1  3%     -36.7%       7.75 =C2=B1 24%  sched_debug.cpu#14.=
cpu_load[1]
     12.25 =C2=B1  6%     -32.7%       8.25 =C2=B1 19%  sched_debug.cpu#14.=
cpu_load[2]
     12.50 =C2=B1  8%     -34.0%       8.25 =C2=B1 13%  sched_debug.cpu#14.=
cpu_load[3]
     12.75 =C2=B1  6%     -29.4%       9.00 =C2=B1 17%  sched_debug.cpu#14.=
cpu_load[4]
    153308 =C2=B1  0%     -10.4%     137357 =C2=B1  0%  sched_debug.cpu#14.=
nr_load_updates
     63314 =C2=B1  8%     +60.0%     101311 =C2=B1  4%  sched_debug.cpu#14.=
nr_switches
     -0.50 =C2=B1-331%   +2800.0%     -14.50 =C2=B1-85%  sched_debug.cpu#14=
.nr_uninterruptible
     63763 =C2=B1  9%     +59.4%     101657 =C2=B1  4%  sched_debug.cpu#14.=
sched_count
     19804 =C2=B1  3%    +123.7%      44309 =C2=B1  3%  sched_debug.cpu#14.=
sched_goidle
     32537 =C2=B1 10%     +65.8%      53935 =C2=B1  2%  sched_debug.cpu#14.=
ttwu_count
     10611 =C2=B1 21%     -36.5%       6740 =C2=B1 11%  sched_debug.cpu#14.=
ttwu_local
     12.75 =C2=B1 16%     -35.3%       8.25 =C2=B1 10%  sched_debug.cpu#15.=
cpu_load[1]
     13.25 =C2=B1 21%     -35.8%       8.50 =C2=B1 13%  sched_debug.cpu#15.=
cpu_load[2]
     13.25 =C2=B1 20%     -35.8%       8.50 =C2=B1 13%  sched_debug.cpu#15.=
cpu_load[3]
     13.25 =C2=B1 16%     -32.1%       9.00 =C2=B1 17%  sched_debug.cpu#15.=
cpu_load[4]
     12.25 =C2=B1 14%     -28.6%       8.75 =C2=B1 16%  sched_debug.cpu#15.=
load
    153666 =C2=B1  1%     -11.0%     136744 =C2=B1  1%  sched_debug.cpu#15.=
nr_load_updates
     62409 =C2=B1  8%     +74.4%     108869 =C2=B1 10%  sched_debug.cpu#15.=
nr_switches
     63040 =C2=B1  8%     +73.4%     109309 =C2=B1  9%  sched_debug.cpu#15.=
sched_count
     18713 =C2=B1  6%    +160.5%      48758 =C2=B1 11%  sched_debug.cpu#15.=
sched_goidle
     33136 =C2=B1  7%     +59.9%      52971 =C2=B1  3%  sched_debug.cpu#15.=
ttwu_count
     10721 =C2=B1 15%     -44.4%       5958 =C2=B1 16%  sched_debug.cpu#15.=
ttwu_local
     11.75 =C2=B1 15%     -31.9%       8.00 =C2=B1  8%  sched_debug.cpu#16.=
cpu_load[0]
     12.25 =C2=B1 12%     -36.7%       7.75 =C2=B1 10%  sched_debug.cpu#16.=
cpu_load[1]
     12.75 =C2=B1  6%     -39.2%       7.75 =C2=B1 10%  sched_debug.cpu#16.=
cpu_load[2]
     12.50 =C2=B1  4%     -34.0%       8.25 =C2=B1 10%  sched_debug.cpu#16.=
cpu_load[3]
     11.75 =C2=B1  3%     -29.8%       8.25 =C2=B1 10%  sched_debug.cpu#16.=
cpu_load[4]
     12.00 =C2=B1  0%     -25.0%       9.00 =C2=B1 20%  sched_debug.cpu#16.=
load
    153118 =C2=B1  0%     -10.4%     137202 =C2=B1  0%  sched_debug.cpu#16.=
nr_load_updates
     63592 =C2=B1 13%     +60.7%     102217 =C2=B1  3%  sched_debug.cpu#16.=
nr_switches
     65040 =C2=B1 12%     +58.4%     103028 =C2=B1  3%  sched_debug.cpu#16.=
sched_count
     18945 =C2=B1  5%    +141.8%      45816 =C2=B1  2%  sched_debug.cpu#16.=
sched_goidle
     34919 =C2=B1 15%     +53.6%      53624 =C2=B1  1%  sched_debug.cpu#16.=
ttwu_count
     11724 =C2=B1 29%     -52.2%       5602 =C2=B1  7%  sched_debug.cpu#16.=
ttwu_local
    414913 =C2=B1 25%     +46.5%     607808 =C2=B1 15%  sched_debug.cpu#17.=
avg_idle
     11.25 =C2=B1 11%     -22.2%       8.75 =C2=B1  4%  sched_debug.cpu#17.=
cpu_load[1]
     11.75 =C2=B1  7%     -25.5%       8.75 =C2=B1  4%  sched_debug.cpu#17.=
cpu_load[2]
     11.75 =C2=B1  7%     -27.7%       8.50 =C2=B1  5%  sched_debug.cpu#17.=
cpu_load[3]
     12.00 =C2=B1  5%     -27.1%       8.75 =C2=B1  9%  sched_debug.cpu#17.=
cpu_load[4]
     60837 =C2=B1 16%    +108.9%     127104 =C2=B1 15%  sched_debug.cpu#17.=
nr_switches
     62380 =C2=B1 17%    +191.7%     181972 =C2=B1 43%  sched_debug.cpu#17.=
sched_count
     18698 =C2=B1  8%    +187.2%      53710 =C2=B1 10%  sched_debug.cpu#17.=
sched_goidle
     33371 =C2=B1 16%     +87.1%      62447 =C2=B1 19%  sched_debug.cpu#17.=
ttwu_count
    152430 =C2=B1  0%      -9.9%     137405 =C2=B1  0%  sched_debug.cpu#18.=
nr_load_updates
     23274 =C2=B1 35%     +98.7%      46246 =C2=B1  2%  sched_debug.cpu#18.=
sched_goidle
    468680 =C2=B1 15%     +30.3%     610687 =C2=B1 18%  sched_debug.cpu#19.=
avg_idle
     19.75 =C2=B1 59%     -54.4%       9.00 =C2=B1 17%  sched_debug.cpu#19.=
cpu_load[0]
     18.75 =C2=B1 50%     -52.0%       9.00 =C2=B1 17%  sched_debug.cpu#19.=
cpu_load[1]
     16.75 =C2=B1 35%     -46.3%       9.00 =C2=B1 13%  sched_debug.cpu#19.=
cpu_load[2]
     15.25 =C2=B1 22%     -41.0%       9.00 =C2=B1 13%  sched_debug.cpu#19.=
cpu_load[3]
     14.00 =C2=B1 15%     -33.9%       9.25 =C2=B1 14%  sched_debug.cpu#19.=
cpu_load[4]
      4383 =C2=B1 11%     -33.2%       2928 =C2=B1 32%  sched_debug.cpu#19.=
curr->pid
     19.50 =C2=B1 43%     -59.0%       8.00 =C2=B1 21%  sched_debug.cpu#19.=
load
    152502 =C2=B1  0%      -9.9%     137345 =C2=B1  0%  sched_debug.cpu#19.=
nr_load_updates
     61485 =C2=B1 15%     +64.3%     101033 =C2=B1  5%  sched_debug.cpu#19.=
nr_switches
     62919 =C2=B1 14%     +62.6%     102292 =C2=B1  4%  sched_debug.cpu#19.=
sched_count
     19915 =C2=B1 11%    +128.9%      45587 =C2=B1  6%  sched_debug.cpu#19.=
sched_goidle
      9137 =C2=B1 31%     -41.5%       5343 =C2=B1  8%  sched_debug.cpu#19.=
ttwu_local
     15.50 =C2=B1 26%     -41.9%       9.00 =C2=B1 20%  sched_debug.cpu#2.c=
pu_load[0]
     14.00 =C2=B1 17%     -33.9%       9.25 =C2=B1 15%  sched_debug.cpu#2.c=
pu_load[1]
     13.50 =C2=B1 15%     -33.3%       9.00 =C2=B1 17%  sched_debug.cpu#2.c=
pu_load[2]
     13.50 =C2=B1 19%     -31.5%       9.25 =C2=B1 15%  sched_debug.cpu#2.c=
pu_load[3]
     13.25 =C2=B1 16%     -28.3%       9.50 =C2=B1 15%  sched_debug.cpu#2.c=
pu_load[4]
      4615 =C2=B1  2%     -21.8%       3607 =C2=B1 18%  sched_debug.cpu#2.c=
urr->pid
     17.75 =C2=B1 27%     -42.3%      10.25 =C2=B1 21%  sched_debug.cpu#2.l=
oad
    152445 =C2=B1  0%      -9.3%     138301 =C2=B1  0%  sched_debug.cpu#2.n=
r_load_updates
     69394 =C2=B1 14%     +52.6%     105869 =C2=B1  1%  sched_debug.cpu#2.n=
r_switches
     69512 =C2=B1 14%     +52.4%     105932 =C2=B1  1%  sched_debug.cpu#2.s=
ched_count
     19608 =C2=B1  6%    +142.7%      47592 =C2=B1  1%  sched_debug.cpu#2.s=
ched_goidle
     37593 =C2=B1 16%     +45.7%      54766 =C2=B1  2%  sched_debug.cpu#2.t=
twu_count
     12964 =C2=B1 26%     -52.5%       6157 =C2=B1  8%  sched_debug.cpu#2.t=
twu_local
      4251 =C2=B1  9%     -29.6%       2992 =C2=B1 28%  sched_debug.cpu#20.=
curr->pid
    152819 =C2=B1  0%     -10.4%     136880 =C2=B1  0%  sched_debug.cpu#20.=
nr_load_updates
     61010 =C2=B1 12%     +92.2%     117271 =C2=B1 14%  sched_debug.cpu#20.=
nr_switches
     62458 =C2=B1 12%     +89.3%     118221 =C2=B1 13%  sched_debug.cpu#20.=
sched_count
     18330 =C2=B1  9%    +189.3%      53025 =C2=B1 13%  sched_debug.cpu#20.=
sched_goidle
     33804 =C2=B1  9%     +54.3%      52151 =C2=B1  3%  sched_debug.cpu#20.=
ttwu_count
     10767 =C2=B1 20%     -46.1%       5806 =C2=B1 16%  sched_debug.cpu#20.=
ttwu_local
     11.75 =C2=B1  3%     -25.5%       8.75 =C2=B1  4%  sched_debug.cpu#21.=
cpu_load[0]
     11.75 =C2=B1  3%     -25.5%       8.75 =C2=B1  4%  sched_debug.cpu#21.=
cpu_load[1]
     12.00 =C2=B1  0%     -27.1%       8.75 =C2=B1  4%  sched_debug.cpu#21.=
cpu_load[2]
     12.00 =C2=B1  0%     -22.9%       9.25 =C2=B1  4%  sched_debug.cpu#21.=
cpu_load[3]
     12.00 =C2=B1  0%     -22.9%       9.25 =C2=B1  4%  sched_debug.cpu#21.=
cpu_load[4]
    152955 =C2=B1  0%     -10.5%     136909 =C2=B1  0%  sched_debug.cpu#21.=
nr_load_updates
     60317 =C2=B1 14%     +78.2%     107481 =C2=B1  5%  sched_debug.cpu#21.=
nr_switches
     61773 =C2=B1 14%     +75.8%     108623 =C2=B1  4%  sched_debug.cpu#21.=
sched_count
     19105 =C2=B1  7%    +143.9%      46604 =C2=B1  4%  sched_debug.cpu#21.=
sched_goidle
     31743 =C2=B1 13%     +72.7%      54808 =C2=B1  5%  sched_debug.cpu#21.=
ttwu_count
     12.50 =C2=B1  8%     -26.0%       9.25 =C2=B1 23%  sched_debug.cpu#22.=
cpu_load[1]
     12.50 =C2=B1  8%     -26.0%       9.25 =C2=B1 23%  sched_debug.cpu#22.=
cpu_load[2]
     12.50 =C2=B1  8%     -28.0%       9.00 =C2=B1 23%  sched_debug.cpu#22.=
cpu_load[3]
     12.75 =C2=B1 10%     -25.5%       9.50 =C2=B1 18%  sched_debug.cpu#22.=
cpu_load[4]
    152533 =C2=B1  0%     -10.4%     136603 =C2=B1  0%  sched_debug.cpu#22.=
nr_load_updates
     62899 =C2=B1 18%     +53.5%      96551 =C2=B1  2%  sched_debug.cpu#22.=
nr_switches
     64064 =C2=B1 19%     +52.9%      97956 =C2=B1  2%  sched_debug.cpu#22.=
sched_count
     19867 =C2=B1 15%    +119.5%      43602 =C2=B1  2%  sched_debug.cpu#22.=
sched_goidle
     35028 =C2=B1 10%     +53.0%      53601 =C2=B1  9%  sched_debug.cpu#22.=
ttwu_count
      9839 =C2=B1 25%     -49.2%       4998 =C2=B1  7%  sched_debug.cpu#22.=
ttwu_local
     13.75 =C2=B1 10%     -29.1%       9.75 =C2=B1 19%  sched_debug.cpu#23.=
cpu_load[1]
     14.00 =C2=B1 10%     -30.4%       9.75 =C2=B1 13%  sched_debug.cpu#23.=
cpu_load[2]
     13.75 =C2=B1  7%     -29.1%       9.75 =C2=B1 13%  sched_debug.cpu#23.=
cpu_load[3]
     13.75 =C2=B1  7%     -27.3%      10.00 =C2=B1 12%  sched_debug.cpu#23.=
cpu_load[4]
    152403 =C2=B1  0%     -10.2%     136862 =C2=B1  0%  sched_debug.cpu#23.=
nr_load_updates
     59826 =C2=B1 14%    +120.5%     131932 =C2=B1 27%  sched_debug.cpu#23.=
nr_switches
     61347 =C2=B1 13%    +116.6%     132874 =C2=B1 27%  sched_debug.cpu#23.=
sched_count
     18517 =C2=B1 11%    +182.2%      52265 =C2=B1 18%  sched_debug.cpu#23.=
sched_goidle
     34184 =C2=B1 13%     +92.1%      65681 =C2=B1 30%  sched_debug.cpu#23.=
ttwu_count
    152495 =C2=B1  0%     -10.0%     137200 =C2=B1  0%  sched_debug.cpu#24.=
nr_load_updates
     63515 =C2=B1 12%     +82.8%     116134 =C2=B1 19%  sched_debug.cpu#24.=
nr_switches
     63697 =C2=B1 12%     +83.3%     116737 =C2=B1 19%  sched_debug.cpu#24.=
sched_count
     18830 =C2=B1 10%    +160.8%      49113 =C2=B1 10%  sched_debug.cpu#24.=
sched_goidle
     34813 =C2=B1 10%     +71.1%      59578 =C2=B1 16%  sched_debug.cpu#24.=
ttwu_count
    450616 =C2=B1 13%     +30.6%     588553 =C2=B1  8%  sched_debug.cpu#25.=
avg_idle
     13.25 =C2=B1 21%     -32.1%       9.00 =C2=B1 20%  sched_debug.cpu#25.=
cpu_load[2]
      3857 =C2=B1 12%     -38.2%       2385 =C2=B1 51%  sched_debug.cpu#25.=
curr->pid
    152589 =C2=B1  0%      -9.9%     137412 =C2=B1  0%  sched_debug.cpu#25.=
nr_load_updates
     68208 =C2=B1 10%     +54.8%     105605 =C2=B1  8%  sched_debug.cpu#25.=
nr_switches
     68366 =C2=B1 10%     +54.8%     105840 =C2=B1  8%  sched_debug.cpu#25.=
sched_count
     17932 =C2=B1  7%    +165.8%      47657 =C2=B1  9%  sched_debug.cpu#25.=
sched_goidle
     38433 =C2=B1 10%     +37.0%      52659 =C2=B1  5%  sched_debug.cpu#25.=
ttwu_count
     14011 =C2=B1 15%     -60.7%       5512 =C2=B1  2%  sched_debug.cpu#25.=
ttwu_local
    469723 =C2=B1 13%     +32.2%     620778 =C2=B1 12%  sched_debug.cpu#26.=
avg_idle
     15.25 =C2=B1 34%     -47.5%       8.00 =C2=B1 19%  sched_debug.cpu#26.=
cpu_load[1]
     14.75 =C2=B1 28%     -47.5%       7.75 =C2=B1 10%  sched_debug.cpu#26.=
cpu_load[2]
     15.00 =C2=B1 27%     -50.0%       7.50 =C2=B1 11%  sched_debug.cpu#26.=
cpu_load[3]
     14.50 =C2=B1 22%     -46.6%       7.75 =C2=B1 10%  sched_debug.cpu#26.=
cpu_load[4]
      4332 =C2=B1 14%     -43.0%       2468 =C2=B1 18%  sched_debug.cpu#26.=
curr->pid
    152471 =C2=B1  0%      -9.6%     137781 =C2=B1  0%  sched_debug.cpu#26.=
nr_load_updates
     60428 =C2=B1 11%     +74.1%     105233 =C2=B1 12%  sched_debug.cpu#26.=
nr_switches
     60551 =C2=B1 11%     +74.4%     105579 =C2=B1 12%  sched_debug.cpu#26.=
sched_count
     17128 =C2=B1  6%    +179.1%      47805 =C2=B1 14%  sched_debug.cpu#26.=
sched_goidle
     33040 =C2=B1 11%     +63.0%      53865 =C2=B1  6%  sched_debug.cpu#26.=
ttwu_count
     11131 =C2=B1 22%     -50.9%       5464 =C2=B1  8%  sched_debug.cpu#26.=
ttwu_local
    479519 =C2=B1 10%     +49.0%     714603 =C2=B1 14%  sched_debug.cpu#27.=
avg_idle
     11.00 =C2=B1  9%     -20.5%       8.75 =C2=B1 16%  sched_debug.cpu#27.=
cpu_load[2]
     11.00 =C2=B1  9%     -18.2%       9.00 =C2=B1 13%  sched_debug.cpu#27.=
cpu_load[3]
    152445 =C2=B1  0%      -9.9%     137357 =C2=B1  0%  sched_debug.cpu#27.=
nr_load_updates
     63465 =C2=B1  9%     +58.8%     100761 =C2=B1  4%  sched_debug.cpu#27.=
nr_switches
     63599 =C2=B1  9%     +59.1%     101211 =C2=B1  4%  sched_debug.cpu#27.=
sched_count
     18459 =C2=B1  2%    +142.1%      44691 =C2=B1  3%  sched_debug.cpu#27.=
sched_goidle
     32110 =C2=B1 11%     +65.9%      53268 =C2=B1  2%  sched_debug.cpu#27.=
ttwu_count
     10828 =C2=B1 22%     -45.0%       5958 =C2=B1 18%  sched_debug.cpu#27.=
ttwu_local
     13.75 =C2=B1 22%     -36.4%       8.75 =C2=B1 18%  sched_debug.cpu#28.=
cpu_load[0]
     13.75 =C2=B1 22%     -34.5%       9.00 =C2=B1 13%  sched_debug.cpu#28.=
cpu_load[1]
     13.50 =C2=B1 19%     -31.5%       9.25 =C2=B1  8%  sched_debug.cpu#28.=
cpu_load[2]
     12.75 =C2=B1 15%     -25.5%       9.50 =C2=B1  5%  sched_debug.cpu#28.=
cpu_load[3]
     12.25 =C2=B1 13%     -22.4%       9.50 =C2=B1  5%  sched_debug.cpu#28.=
cpu_load[4]
      4331 =C2=B1 10%     -62.0%       1643 =C2=B1 60%  sched_debug.cpu#28.=
curr->pid
     13.50 =C2=B1 19%     -59.3%       5.50 =C2=B1 48%  sched_debug.cpu#28.=
load
    152248 =C2=B1  0%      -9.8%     137345 =C2=B1  0%  sched_debug.cpu#28.=
nr_load_updates
     62477 =C2=B1 14%     +56.9%      98039 =C2=B1  4%  sched_debug.cpu#28.=
nr_switches
     62607 =C2=B1 14%     +57.4%      98560 =C2=B1  4%  sched_debug.cpu#28.=
sched_count
     17271 =C2=B1  7%    +153.3%      43755 =C2=B1  3%  sched_debug.cpu#28.=
sched_goidle
     35066 =C2=B1 14%     +51.3%      53055 =C2=B1  5%  sched_debug.cpu#28.=
ttwu_count
     12080 =C2=B1 26%     -53.7%       5591 =C2=B1 15%  sched_debug.cpu#28.=
ttwu_local
     12.00 =C2=B1 11%     -37.5%       7.50 =C2=B1 20%  sched_debug.cpu#29.=
cpu_load[0]
     11.75 =C2=B1 12%     -38.3%       7.25 =C2=B1 20%  sched_debug.cpu#29.=
cpu_load[1]
     12.00 =C2=B1 10%     -37.5%       7.50 =C2=B1 14%  sched_debug.cpu#29.=
cpu_load[2]
     12.00 =C2=B1 10%     -35.4%       7.75 =C2=B1 14%  sched_debug.cpu#29.=
cpu_load[3]
     12.25 =C2=B1  8%     -34.7%       8.00 =C2=B1  8%  sched_debug.cpu#29.=
cpu_load[4]
      4400 =C2=B1  3%     -47.3%       2317 =C2=B1 45%  sched_debug.cpu#29.=
curr->pid
     12.75 =C2=B1 10%     -43.1%       7.25 =C2=B1 24%  sched_debug.cpu#29.=
load
    152384 =C2=B1  0%     -10.8%     135929 =C2=B1  0%  sched_debug.cpu#29.=
nr_load_updates
     69011 =C2=B1  4%     +38.5%      95579 =C2=B1  2%  sched_debug.cpu#29.=
nr_switches
     69144 =C2=B1  4%     +38.9%      96033 =C2=B1  1%  sched_debug.cpu#29.=
sched_count
     18179 =C2=B1  6%    +135.5%      42810 =C2=B1  2%  sched_debug.cpu#29.=
sched_goidle
     37895 =C2=B1  5%     +38.8%      52581 =C2=B1  6%  sched_debug.cpu#29.=
ttwu_count
     13882 =C2=B1 14%     -61.3%       5374 =C2=B1  3%  sched_debug.cpu#29.=
ttwu_local
    418416 =C2=B1 14%     +56.0%     652922 =C2=B1 16%  sched_debug.cpu#3.a=
vg_idle
     14.25 =C2=B1 26%     -45.6%       7.75 =C2=B1 26%  sched_debug.cpu#3.c=
pu_load[0]
     13.50 =C2=B1 15%     -42.6%       7.75 =C2=B1 24%  sched_debug.cpu#3.c=
pu_load[1]
     13.00 =C2=B1 12%     -36.5%       8.25 =C2=B1 19%  sched_debug.cpu#3.c=
pu_load[2]
     13.00 =C2=B1  9%     -34.6%       8.50 =C2=B1 19%  sched_debug.cpu#3.c=
pu_load[3]
     12.75 =C2=B1 10%     -29.4%       9.00 =C2=B1 17%  sched_debug.cpu#3.c=
pu_load[4]
      4480 =C2=B1  0%     -29.6%       3154 =C2=B1 29%  sched_debug.cpu#3.c=
urr->pid
    153423 =C2=B1  0%      -9.4%     139034 =C2=B1  0%  sched_debug.cpu#3.n=
r_load_updates
     73555 =C2=B1 13%     +40.1%     103046 =C2=B1  4%  sched_debug.cpu#3.n=
r_switches
     73679 =C2=B1 13%     +40.0%     103131 =C2=B1  4%  sched_debug.cpu#3.s=
ched_count
     21215 =C2=B1 10%    +117.6%      46168 =C2=B1  4%  sched_debug.cpu#3.s=
ched_goidle
     38990 =C2=B1 13%     +46.1%      56955 =C2=B1  6%  sched_debug.cpu#3.t=
twu_count
     14064 =C2=B1 22%     -51.8%       6785 =C2=B1 20%  sched_debug.cpu#3.t=
twu_local
     24.75 =C2=B1 58%     -62.6%       9.25 =C2=B1  8%  sched_debug.cpu#30.=
cpu_load[0]
     22.50 =C2=B1 57%     -60.0%       9.00 =C2=B1 11%  sched_debug.cpu#30.=
cpu_load[1]
     19.50 =C2=B1 49%     -55.1%       8.75 =C2=B1 14%  sched_debug.cpu#30.=
cpu_load[2]
     17.50 =C2=B1 45%     -48.6%       9.00 =C2=B1 11%  sched_debug.cpu#30.=
cpu_load[3]
     16.75 =C2=B1 39%     -44.8%       9.25 =C2=B1  8%  sched_debug.cpu#30.=
cpu_load[4]
    152410 =C2=B1  0%     -10.0%     137123 =C2=B1  0%  sched_debug.cpu#30.=
nr_load_updates
     59021 =C2=B1  6%     +65.8%      97829 =C2=B1  3%  sched_debug.cpu#30.=
nr_switches
     59134 =C2=B1  6%     +65.8%      98034 =C2=B1  3%  sched_debug.cpu#30.=
sched_count
     16931 =C2=B1  6%    +157.8%      43642 =C2=B1  5%  sched_debug.cpu#30.=
sched_goidle
     33594 =C2=B1  7%     +54.5%      51915 =C2=B1  3%  sched_debug.cpu#30.=
ttwu_count
     10709 =C2=B1 10%     -47.5%       5626 =C2=B1 13%  sched_debug.cpu#30.=
ttwu_local
    380116 =C2=B1 26%     +76.4%     670612 =C2=B1 18%  sched_debug.cpu#31.=
avg_idle
     12.25 =C2=B1 12%     -26.5%       9.00 =C2=B1  7%  sched_debug.cpu#31.=
cpu_load[3]
     12.75 =C2=B1 10%     -25.5%       9.50 =C2=B1  5%  sched_debug.cpu#31.=
cpu_load[4]
     11.00 =C2=B1  9%     -31.8%       7.50 =C2=B1 14%  sched_debug.cpu#31.=
load
    152439 =C2=B1  0%     -10.2%     136912 =C2=B1  0%  sched_debug.cpu#31.=
nr_load_updates
     61438 =C2=B1  6%     +73.7%     106722 =C2=B1  6%  sched_debug.cpu#31.=
nr_switches
     61580 =C2=B1  6%     +73.7%     106950 =C2=B1  6%  sched_debug.cpu#31.=
sched_count
     18323 =C2=B1  8%    +163.1%      48209 =C2=B1  6%  sched_debug.cpu#31.=
sched_goidle
     32517 =C2=B1 14%     +62.4%      52809 =C2=B1  7%  sched_debug.cpu#31.=
ttwu_count
     10485 =C2=B1 26%     -47.3%       5521 =C2=B1  7%  sched_debug.cpu#31.=
ttwu_local
     12.25 =C2=B1  8%     -38.8%       7.50 =C2=B1 11%  sched_debug.cpu#32.=
cpu_load[0]
     12.25 =C2=B1  8%     -40.8%       7.25 =C2=B1  5%  sched_debug.cpu#32.=
cpu_load[1]
     12.50 =C2=B1  6%     -40.0%       7.50 =C2=B1  6%  sched_debug.cpu#32.=
cpu_load[2]
     12.75 =C2=B1  6%     -37.3%       8.00 =C2=B1  8%  sched_debug.cpu#32.=
cpu_load[3]
     13.00 =C2=B1  5%     -34.6%       8.50 =C2=B1 13%  sched_debug.cpu#32.=
cpu_load[4]
      4187 =C2=B1 12%     -40.9%       2474 =C2=B1 21%  sched_debug.cpu#32.=
curr->pid
     12.25 =C2=B1 14%     -38.8%       7.50 =C2=B1 33%  sched_debug.cpu#32.=
load
    152664 =C2=B1  0%     -13.7%     131698 =C2=B1  0%  sched_debug.cpu#32.=
nr_load_updates
     61842 =C2=B1 20%     +47.8%      91432 =C2=B1 13%  sched_debug.cpu#32.=
nr_switches
     61947 =C2=B1 20%     +47.7%      91513 =C2=B1 13%  sched_debug.cpu#32.=
sched_count
     17008 =C2=B1  8%    +138.1%      40490 =C2=B1 15%  sched_debug.cpu#32.=
sched_goidle
     12114 =C2=B1 51%     -53.5%       5632 =C2=B1  4%  sched_debug.cpu#32.=
ttwu_local
     15.50 =C2=B1 40%     -58.1%       6.50 =C2=B1 23%  sched_debug.cpu#33.=
cpu_load[0]
     15.25 =C2=B1 37%     -57.4%       6.50 =C2=B1 23%  sched_debug.cpu#33.=
cpu_load[1]
     15.00 =C2=B1 24%     -53.3%       7.00 =C2=B1 17%  sched_debug.cpu#33.=
cpu_load[2]
     14.00 =C2=B1 15%     -46.4%       7.50 =C2=B1  6%  sched_debug.cpu#33.=
cpu_load[3]
     13.25 =C2=B1  6%     -39.6%       8.00 =C2=B1 15%  sched_debug.cpu#33.=
cpu_load[4]
    152628 =C2=B1  0%     -13.4%     132190 =C2=B1  0%  sched_debug.cpu#33.=
nr_load_updates
     17203 =C2=B1 16%    +122.5%      38284 =C2=B1  7%  sched_debug.cpu#33.=
sched_goidle
     36797 =C2=B1 24%     +36.2%      50106 =C2=B1 15%  sched_debug.cpu#33.=
ttwu_count
     11.75 =C2=B1  3%     -46.8%       6.25 =C2=B1 20%  sched_debug.cpu#34.=
cpu_load[0]
     12.00 =C2=B1  5%     -45.8%       6.50 =C2=B1 17%  sched_debug.cpu#34.=
cpu_load[1]
     12.50 =C2=B1 12%     -44.0%       7.00 =C2=B1 10%  sched_debug.cpu#34.=
cpu_load[2]
     12.50 =C2=B1 12%     -40.0%       7.50 =C2=B1  6%  sched_debug.cpu#34.=
cpu_load[3]
     12.50 =C2=B1  8%     -32.0%       8.50 =C2=B1  5%  sched_debug.cpu#34.=
cpu_load[4]
      4033 =C2=B1 12%     -44.4%       2242 =C2=B1 36%  sched_debug.cpu#34.=
curr->pid
     12.25 =C2=B1 14%     -36.7%       7.75 =C2=B1 29%  sched_debug.cpu#34.=
load
    152520 =C2=B1  0%     -13.8%     131437 =C2=B1  0%  sched_debug.cpu#34.=
nr_load_updates
     57058 =C2=B1 16%     +52.0%      86717 =C2=B1  6%  sched_debug.cpu#34.=
nr_switches
     57152 =C2=B1 16%     +51.8%      86783 =C2=B1  6%  sched_debug.cpu#34.=
sched_count
     16310 =C2=B1 10%    +128.4%      37248 =C2=B1  4%  sched_debug.cpu#34.=
sched_goidle
     14.75 =C2=B1 26%     -52.5%       7.00 =C2=B1 22%  sched_debug.cpu#35.=
cpu_load[0]
     14.75 =C2=B1 25%     -50.8%       7.25 =C2=B1 17%  sched_debug.cpu#35.=
cpu_load[1]
     14.75 =C2=B1 25%     -47.5%       7.75 =C2=B1 10%  sched_debug.cpu#35.=
cpu_load[2]
     15.00 =C2=B1 23%     -43.3%       8.50 =C2=B1  5%  sched_debug.cpu#35.=
cpu_load[3]
     15.00 =C2=B1 23%     -41.7%       8.75 =C2=B1  4%  sched_debug.cpu#35.=
cpu_load[4]
      3937 =C2=B1 14%     -44.8%       2172 =C2=B1 26%  sched_debug.cpu#35.=
curr->pid
     14.50 =C2=B1 24%     -60.3%       5.75 =C2=B1 51%  sched_debug.cpu#35.=
load
    152974 =C2=B1  0%     -14.0%     131512 =C2=B1  0%  sched_debug.cpu#35.=
nr_load_updates
     58440 =C2=B1 20%     +65.1%      96477 =C2=B1 11%  sched_debug.cpu#35.=
nr_switches
     58542 =C2=B1 20%     +64.9%      96551 =C2=B1 11%  sched_debug.cpu#35.=
sched_count
     16392 =C2=B1  9%    +158.4%      42352 =C2=B1 12%  sched_debug.cpu#35.=
sched_goidle
     32350 =C2=B1 20%     +29.9%      42009 =C2=B1  1%  sched_debug.cpu#35.=
ttwu_count
     12.50 =C2=B1  6%     -38.0%       7.75 =C2=B1 14%  sched_debug.cpu#36.=
cpu_load[0]
     12.00 =C2=B1  5%     -37.5%       7.50 =C2=B1 14%  sched_debug.cpu#36.=
cpu_load[1]
     12.00 =C2=B1  5%     -33.3%       8.00 =C2=B1 12%  sched_debug.cpu#36.=
cpu_load[2]
     12.00 =C2=B1  5%     -29.2%       8.50 =C2=B1 13%  sched_debug.cpu#36.=
cpu_load[3]
     12.50 =C2=B1  6%     -32.0%       8.50 =C2=B1 13%  sched_debug.cpu#36.=
cpu_load[4]
    152727 =C2=B1  0%     -14.2%     131059 =C2=B1  0%  sched_debug.cpu#36.=
nr_load_updates
     52827 =C2=B1 21%     +78.2%      94115 =C2=B1 25%  sched_debug.cpu#36.=
nr_switches
     52932 =C2=B1 21%     +78.0%      94213 =C2=B1 25%  sched_debug.cpu#36.=
sched_count
     15083 =C2=B1  7%    +178.6%      42020 =C2=B1 29%  sched_debug.cpu#36.=
sched_goidle
     30352 =C2=B1 24%     +47.5%      44772 =C2=B1 11%  sched_debug.cpu#36.=
ttwu_count
     14.25 =C2=B1 20%     -43.9%       8.00 =C2=B1  8%  sched_debug.cpu#37.=
cpu_load[0]
     14.00 =C2=B1 17%     -42.9%       8.00 =C2=B1  8%  sched_debug.cpu#37.=
cpu_load[1]
     13.75 =C2=B1 14%     -41.8%       8.00 =C2=B1  8%  sched_debug.cpu#37.=
cpu_load[2]
     13.25 =C2=B1  9%     -37.7%       8.25 =C2=B1 13%  sched_debug.cpu#37.=
cpu_load[3]
     13.00 =C2=B1  7%     -36.5%       8.25 =C2=B1 13%  sched_debug.cpu#37.=
cpu_load[4]
      4481 =C2=B1  0%     -55.0%       2016 =C2=B1 29%  sched_debug.cpu#37.=
curr->pid
     15.25 =C2=B1 22%     -60.7%       6.00 =C2=B1 20%  sched_debug.cpu#37.=
load
    152536 =C2=B1  0%     -13.8%     131418 =C2=B1  0%  sched_debug.cpu#37.=
nr_load_updates
     52040 =C2=B1 12%     +60.9%      83756 =C2=B1  4%  sched_debug.cpu#37.=
nr_switches
      1.00 =C2=B1254%    +100.0%       2.00 =C2=B1150%  sched_debug.cpu#37.=
nr_uninterruptible
     52144 =C2=B1 12%     +60.8%      83823 =C2=B1  4%  sched_debug.cpu#37.=
sched_count
     15489 =C2=B1  3%    +131.7%      35890 =C2=B1  3%  sched_debug.cpu#37.=
sched_goidle
     29095 =C2=B1 13%     +79.2%      52125 =C2=B1 13%  sched_debug.cpu#37.=
ttwu_count
    152444 =C2=B1  0%     -13.7%     131589 =C2=B1  0%  sched_debug.cpu#38.=
nr_load_updates
     58611 =C2=B1 23%     +46.4%      85804 =C2=B1  6%  sched_debug.cpu#38.=
nr_switches
     58715 =C2=B1 23%     +46.3%      85877 =C2=B1  6%  sched_debug.cpu#38.=
sched_count
     17275 =C2=B1 13%    +115.8%      37275 =C2=B1  9%  sched_debug.cpu#38.=
sched_goidle
     30468 =C2=B1 24%     +35.9%      41403 =C2=B1  3%  sched_debug.cpu#38.=
ttwu_count
      9.75 =C2=B1 15%     -43.6%       5.50 =C2=B1 37%  sched_debug.cpu#39.=
cpu_load[1]
     10.25 =C2=B1 12%     -43.9%       5.75 =C2=B1 33%  sched_debug.cpu#39.=
cpu_load[2]
     10.75 =C2=B1  7%     -39.5%       6.50 =C2=B1 25%  sched_debug.cpu#39.=
cpu_load[3]
     11.25 =C2=B1  7%     -40.0%       6.75 =C2=B1 24%  sched_debug.cpu#39.=
cpu_load[4]
    152470 =C2=B1  0%     -13.9%     131345 =C2=B1  0%  sched_debug.cpu#39.=
nr_load_updates
     54508 =C2=B1 12%     +55.1%      84519 =C2=B1  4%  sched_debug.cpu#39.=
nr_switches
     54616 =C2=B1 12%     +54.9%      84603 =C2=B1  4%  sched_debug.cpu#39.=
sched_count
     16994 =C2=B1 12%    +114.0%      36361 =C2=B1  4%  sched_debug.cpu#39.=
sched_goidle
     27762 =C2=B1 17%     +55.8%      43265 =C2=B1  4%  sched_debug.cpu#39.=
ttwu_count
      8552 =C2=B1 21%     -27.4%       6208 =C2=B1  7%  sched_debug.cpu#39.=
ttwu_local
    408787 =C2=B1 34%     +51.7%     620045 =C2=B1 20%  sched_debug.cpu#4.a=
vg_idle
     11.75 =C2=B1  3%     -19.1%       9.50 =C2=B1 15%  sched_debug.cpu#4.c=
pu_load[0]
     12.75 =C2=B1 15%     -25.5%       9.50 =C2=B1  9%  sched_debug.cpu#4.c=
pu_load[3]
     12.75 =C2=B1 11%     -21.6%      10.00 =C2=B1  7%  sched_debug.cpu#4.c=
pu_load[4]
    153036 =C2=B1  0%      -9.9%     137811 =C2=B1  0%  sched_debug.cpu#4.n=
r_load_updates
     69806 =C2=B1 15%     +65.7%     115657 =C2=B1  7%  sched_debug.cpu#4.n=
r_switches
     -3.25 =C2=B1-25%    +138.5%      -7.75 =C2=B1-29%  sched_debug.cpu#4.n=
r_uninterruptible
     69942 =C2=B1 15%     +65.5%     115730 =C2=B1  7%  sched_debug.cpu#4.s=
ched_count
     18728 =C2=B1 11%    +172.9%      51106 =C2=B1  8%  sched_debug.cpu#4.s=
ched_goidle
     38447 =C2=B1 15%     +63.2%      62765 =C2=B1 19%  sched_debug.cpu#4.t=
twu_count
     13894 =C2=B1 22%     -47.4%       7311 =C2=B1 12%  sched_debug.cpu#4.t=
twu_local
     12.50 =C2=B1  6%     -38.0%       7.75 =C2=B1 32%  sched_debug.cpu#40.=
cpu_load[1]
     12.75 =C2=B1  6%     -35.3%       8.25 =C2=B1 26%  sched_debug.cpu#40.=
cpu_load[2]
     13.00 =C2=B1  7%     -34.6%       8.50 =C2=B1 21%  sched_debug.cpu#40.=
cpu_load[3]
     13.25 =C2=B1  6%     -35.8%       8.50 =C2=B1 21%  sched_debug.cpu#40.=
cpu_load[4]
    152268 =C2=B1  0%     -13.9%     131112 =C2=B1  0%  sched_debug.cpu#40.=
nr_load_updates
     45842 =C2=B1 13%     +77.8%      81522 =C2=B1  2%  sched_debug.cpu#40.=
nr_switches
     45958 =C2=B1 13%     +77.5%      81594 =C2=B1  2%  sched_debug.cpu#40.=
sched_count
     14994 =C2=B1 10%    +135.4%      35295 =C2=B1  1%  sched_debug.cpu#40.=
sched_goidle
     24971 =C2=B1 11%     +82.3%      45513 =C2=B1 11%  sched_debug.cpu#40.=
ttwu_count
     12.25 =C2=B1  8%     -32.7%       8.25 =C2=B1 19%  sched_debug.cpu#41.=
cpu_load[0]
     12.00 =C2=B1 10%     -31.2%       8.25 =C2=B1 19%  sched_debug.cpu#41.=
cpu_load[1]
     12.00 =C2=B1  5%     -33.3%       8.00 =C2=B1 21%  sched_debug.cpu#41.=
cpu_load[2]
     12.00 =C2=B1  5%     -31.2%       8.25 =C2=B1 19%  sched_debug.cpu#41.=
cpu_load[3]
     12.25 =C2=B1  3%     -26.5%       9.00 =C2=B1 13%  sched_debug.cpu#41.=
cpu_load[4]
    152347 =C2=B1  0%     -14.0%     130971 =C2=B1  0%  sched_debug.cpu#41.=
nr_load_updates
     50940 =C2=B1 11%     +81.9%      92679 =C2=B1 10%  sched_debug.cpu#41.=
nr_switches
     51047 =C2=B1 11%     +81.7%      92772 =C2=B1 10%  sched_debug.cpu#41.=
sched_count
     17070 =C2=B1  7%    +136.9%      40446 =C2=B1 10%  sched_debug.cpu#41.=
sched_goidle
     26890 =C2=B1 19%     +55.4%      41776 =C2=B1  2%  sched_debug.cpu#41.=
ttwu_count
    464990 =C2=B1 19%     +49.2%     693574 =C2=B1 13%  sched_debug.cpu#42.=
avg_idle
      4484 =C2=B1  0%     -61.9%       1710 =C2=B1 75%  sched_debug.cpu#42.=
curr->pid
     12.75 =C2=B1 10%     -60.8%       5.00 =C2=B1 61%  sched_debug.cpu#42.=
load
    152574 =C2=B1  0%     -13.8%     131484 =C2=B1  0%  sched_debug.cpu#42.=
nr_load_updates
     46919 =C2=B1  8%     +76.3%      82730 =C2=B1  6%  sched_debug.cpu#42.=
nr_switches
     47025 =C2=B1  8%     +76.0%      82787 =C2=B1  6%  sched_debug.cpu#42.=
sched_count
     14705 =C2=B1  5%    +138.7%      35101 =C2=B1  3%  sched_debug.cpu#42.=
sched_goidle
     26331 =C2=B1 11%     +88.0%      49509 =C2=B1 10%  sched_debug.cpu#42.=
ttwu_count
     11.50 =C2=B1 13%     -45.7%       6.25 =C2=B1 36%  sched_debug.cpu#43.=
cpu_load[0]
     11.75 =C2=B1  9%     -44.7%       6.50 =C2=B1 23%  sched_debug.cpu#43.=
cpu_load[1]
     11.75 =C2=B1  7%     -44.7%       6.50 =C2=B1 17%  sched_debug.cpu#43.=
cpu_load[2]
     12.00 =C2=B1  5%     -43.8%       6.75 =C2=B1 16%  sched_debug.cpu#43.=
cpu_load[3]
     12.75 =C2=B1 10%     -43.1%       7.25 =C2=B1 11%  sched_debug.cpu#43.=
cpu_load[4]
    152457 =C2=B1  0%     -13.8%     131462 =C2=B1  0%  sched_debug.cpu#43.=
nr_load_updates
     49091 =C2=B1 12%     +64.3%      80645 =C2=B1  4%  sched_debug.cpu#43.=
nr_switches
     49198 =C2=B1 12%     +64.1%      80715 =C2=B1  4%  sched_debug.cpu#43.=
sched_count
     16047 =C2=B1 15%    +122.8%      35750 =C2=B1  3%  sched_debug.cpu#43.=
sched_goidle
     25961 =C2=B1  9%     +54.8%      40189 =C2=B1  6%  sched_debug.cpu#43.=
ttwu_count
      7415 =C2=B1 15%     -31.3%       5095 =C2=B1 17%  sched_debug.cpu#43.=
ttwu_local
    479512 =C2=B1  6%     +56.0%     747976 =C2=B1  4%  sched_debug.cpu#44.=
avg_idle
      4479 =C2=B1  0%     -46.2%       2411 =C2=B1 34%  sched_debug.cpu#44.=
curr->pid
     13.50 =C2=B1 11%     -46.3%       7.25 =C2=B1 31%  sched_debug.cpu#44.=
load
    152365 =C2=B1  0%     -13.5%     131866 =C2=B1  0%  sched_debug.cpu#44.=
nr_load_updates
     52211 =C2=B1 15%     +65.5%      86384 =C2=B1  7%  sched_debug.cpu#44.=
nr_switches
      2.50 =C2=B1 66%     +20.0%       3.00 =C2=B1150%  sched_debug.cpu#44.=
nr_uninterruptible
     52303 =C2=B1 15%     +65.3%      86458 =C2=B1  7%  sched_debug.cpu#44.=
sched_count
     15795 =C2=B1  6%    +137.4%      37493 =C2=B1  7%  sched_debug.cpu#44.=
sched_goidle
     28694 =C2=B1 23%     +59.7%      45834 =C2=B1 16%  sched_debug.cpu#44.=
ttwu_count
    488704 =C2=B1 13%     +57.7%     770666 =C2=B1  6%  sched_debug.cpu#45.=
avg_idle
     11.25 =C2=B1 11%     -40.0%       6.75 =C2=B1 32%  sched_debug.cpu#45.=
cpu_load[0]
     11.50 =C2=B1  7%     -37.0%       7.25 =C2=B1 29%  sched_debug.cpu#45.=
cpu_load[1]
     11.75 =C2=B1  3%     -38.3%       7.25 =C2=B1 20%  sched_debug.cpu#45.=
cpu_load[2]
     12.00 =C2=B1  5%     -35.4%       7.75 =C2=B1 16%  sched_debug.cpu#45.=
cpu_load[3]
     12.25 =C2=B1  3%     -34.7%       8.00 =C2=B1 12%  sched_debug.cpu#45.=
cpu_load[4]
      4412 =C2=B1  7%     -28.6%       3148 =C2=B1 20%  sched_debug.cpu#45.=
curr->pid
    152391 =C2=B1  0%     -14.2%     130735 =C2=B1  0%  sched_debug.cpu#45.=
nr_load_updates
     53614 =C2=B1 10%     +60.1%      85841 =C2=B1 16%  sched_debug.cpu#45.=
nr_switches
     54493 =C2=B1 11%     +57.7%      85931 =C2=B1 16%  sched_debug.cpu#45.=
sched_count
     16443 =C2=B1  3%    +127.1%      37337 =C2=B1 14%  sched_debug.cpu#45.=
sched_goidle
     28638 =C2=B1 11%     +49.6%      42840 =C2=B1  9%  sched_debug.cpu#45.=
ttwu_count
      9199 =C2=B1 25%     -34.0%       6075 =C2=B1 26%  sched_debug.cpu#45.=
ttwu_local
     11.50 =C2=B1 13%     -34.8%       7.50 =C2=B1 20%  sched_debug.cpu#46.=
cpu_load[2]
     12.25 =C2=B1 12%     -34.7%       8.00 =C2=B1 15%  sched_debug.cpu#46.=
cpu_load[3]
     12.75 =C2=B1 10%     -35.3%       8.25 =C2=B1 17%  sched_debug.cpu#46.=
cpu_load[4]
      3963 =C2=B1 15%     -58.6%       1641 =C2=B1 59%  sched_debug.cpu#46.=
curr->pid
    152546 =C2=B1  0%     -14.6%     130332 =C2=B1  0%  sched_debug.cpu#46.=
nr_load_updates
     49926 =C2=B1  9%     +64.1%      81938 =C2=B1  6%  sched_debug.cpu#46.=
nr_switches
     50033 =C2=B1  9%     +63.9%      82010 =C2=B1  6%  sched_debug.cpu#46.=
sched_count
     15038 =C2=B1  9%    +137.6%      35729 =C2=B1  6%  sched_debug.cpu#46.=
sched_goidle
     28218 =C2=B1  8%     +49.3%      42139 =C2=B1  5%  sched_debug.cpu#46.=
ttwu_count
    411557 =C2=B1 31%     +82.2%     749823 =C2=B1  7%  sched_debug.cpu#47.=
avg_idle
     13.00 =C2=B1  7%     -51.9%       6.25 =C2=B1 30%  sched_debug.cpu#47.=
cpu_load[0]
     12.50 =C2=B1  8%     -46.0%       6.75 =C2=B1 21%  sched_debug.cpu#47.=
cpu_load[1]
     12.50 =C2=B1  8%     -50.0%       6.25 =C2=B1 17%  sched_debug.cpu#47.=
cpu_load[2]
     13.25 =C2=B1  8%     -47.2%       7.00 =C2=B1 17%  sched_debug.cpu#47.=
cpu_load[3]
     13.00 =C2=B1  5%     -42.3%       7.50 =C2=B1 11%  sched_debug.cpu#47.=
cpu_load[4]
      4041 =C2=B1 12%     -31.0%       2789 =C2=B1 33%  sched_debug.cpu#47.=
curr->pid
     12.75 =C2=B1 10%     -41.2%       7.50 =C2=B1 24%  sched_debug.cpu#47.=
load
    152467 =C2=B1  0%     -14.4%     130498 =C2=B1  0%  sched_debug.cpu#47.=
nr_load_updates
     57749 =C2=B1 16%     +41.0%      81398 =C2=B1  8%  sched_debug.cpu#47.=
nr_switches
     57853 =C2=B1 16%     +40.8%      81462 =C2=B1  8%  sched_debug.cpu#47.=
sched_count
     16189 =C2=B1  9%    +119.3%      35500 =C2=B1  7%  sched_debug.cpu#47.=
sched_goidle
     11.25 =C2=B1  7%     -20.0%       9.00 =C2=B1 13%  sched_debug.cpu#48.=
cpu_load[1]
     11.75 =C2=B1  7%     -23.4%       9.00 =C2=B1 13%  sched_debug.cpu#48.=
cpu_load[2]
    152324 =C2=B1  0%     -14.2%     130766 =C2=B1  0%  sched_debug.cpu#48.=
nr_load_updates
     48500 =C2=B1  9%    +196.4%     143770 =C2=B1 69%  sched_debug.cpu#48.=
nr_switches
     48619 =C2=B1  9%    +195.9%     143844 =C2=B1 69%  sched_debug.cpu#48.=
sched_count
     15094 =C2=B1  5%    +279.2%      57232 =C2=B1 62%  sched_debug.cpu#48.=
sched_goidle
     27555 =C2=B1  9%    +175.4%      75896 =C2=B1 65%  sched_debug.cpu#48.=
ttwu_count
    485418 =C2=B1 16%    +147.6%    1201830 =C2=B1 55%  sched_debug.cpu#49.=
avg_idle
     11.50 =C2=B1  7%     -37.0%       7.25 =C2=B1 41%  sched_debug.cpu#49.=
load
    152355 =C2=B1  0%     -13.7%     131435 =C2=B1  0%  sched_debug.cpu#49.=
nr_load_updates
     48154 =C2=B1 15%     +92.6%      92737 =C2=B1 15%  sched_debug.cpu#49.=
nr_switches
      0.50 =C2=B1458%   +1400.0%       7.50 =C2=B1 51%  sched_debug.cpu#49.=
nr_uninterruptible
     49076 =C2=B1 14%     +89.1%      92804 =C2=B1 15%  sched_debug.cpu#49.=
sched_count
     14940 =C2=B1  7%    +158.7%      38645 =C2=B1 11%  sched_debug.cpu#49.=
sched_goidle
     27010 =C2=B1 18%     +80.9%      48858 =C2=B1 16%  sched_debug.cpu#49.=
ttwu_count
     12.50 =C2=B1  6%     -32.0%       8.50 =C2=B1 13%  sched_debug.cpu#5.c=
pu_load[0]
     12.75 =C2=B1  3%     -31.4%       8.75 =C2=B1  9%  sched_debug.cpu#5.c=
pu_load[1]
     13.00 =C2=B1  5%     -30.8%       9.00 =C2=B1  7%  sched_debug.cpu#5.c=
pu_load[2]
     12.75 =C2=B1  6%     -29.4%       9.00 =C2=B1  7%  sched_debug.cpu#5.c=
pu_load[3]
     12.50 =C2=B1  6%     -28.0%       9.00 =C2=B1 11%  sched_debug.cpu#5.c=
pu_load[4]
    152906 =C2=B1  0%     -10.3%     137192 =C2=B1  0%  sched_debug.cpu#5.n=
r_load_updates
     68222 =C2=B1 17%     +64.3%     112084 =C2=B1  5%  sched_debug.cpu#5.n=
r_switches
     68358 =C2=B1 17%     +64.1%     112150 =C2=B1  5%  sched_debug.cpu#5.s=
ched_count
     18964 =C2=B1 11%    +164.2%      50103 =C2=B1  5%  sched_debug.cpu#5.s=
ched_goidle
     35779 =C2=B1 16%     +50.1%      53708 =C2=B1  2%  sched_debug.cpu#5.t=
twu_count
     12862 =C2=B1 32%     -50.9%       6309 =C2=B1  8%  sched_debug.cpu#5.t=
twu_local
    431849 =C2=B1 24%     +54.7%     667941 =C2=B1 13%  sched_debug.cpu#50.=
avg_idle
     12.00 =C2=B1  0%     -47.9%       6.25 =C2=B1 30%  sched_debug.cpu#50.=
cpu_load[0]
     11.75 =C2=B1  3%     -46.8%       6.25 =C2=B1 20%  sched_debug.cpu#50.=
cpu_load[1]
     11.75 =C2=B1  3%     -46.8%       6.25 =C2=B1 20%  sched_debug.cpu#50.=
cpu_load[2]
     11.75 =C2=B1  3%     -38.3%       7.25 =C2=B1 15%  sched_debug.cpu#50.=
cpu_load[3]
     12.00 =C2=B1  0%     -31.2%       8.25 =C2=B1 17%  sched_debug.cpu#50.=
cpu_load[4]
      4415 =C2=B1  2%     -49.1%       2248 =C2=B1 30%  sched_debug.cpu#50.=
curr->pid
    152256 =C2=B1  0%     -13.9%     131168 =C2=B1  0%  sched_debug.cpu#50.=
nr_load_updates
     19897 =C2=B1 47%    +104.6%      40704 =C2=B1 22%  sched_debug.cpu#50.=
sched_goidle
    453889 =C2=B1 18%     +62.7%     738549 =C2=B1 14%  sched_debug.cpu#51.=
avg_idle
     14.25 =C2=B1 17%     -29.8%      10.00 =C2=B1 10%  sched_debug.cpu#51.=
cpu_load[4]
    152537 =C2=B1  0%     -14.3%     130796 =C2=B1  0%  sched_debug.cpu#51.=
nr_load_updates
     20076 =C2=B1 42%     +80.5%      36237 =C2=B1  4%  sched_debug.cpu#51.=
sched_goidle
     28601 =C2=B1 20%     +44.9%      41442 =C2=B1  5%  sched_debug.cpu#51.=
ttwu_count
    508308 =C2=B1 15%    +108.7%    1060656 =C2=B1 55%  sched_debug.cpu#52.=
avg_idle
     11.50 =C2=B1 14%     -19.6%       9.25 =C2=B1 11%  sched_debug.cpu#52.=
load
    152393 =C2=B1  0%     -14.0%     131044 =C2=B1  0%  sched_debug.cpu#52.=
nr_load_updates
     46675 =C2=B1 13%     +75.8%      82033 =C2=B1  5%  sched_debug.cpu#52.=
nr_switches
     47502 =C2=B1 15%     +72.8%      82097 =C2=B1  5%  sched_debug.cpu#52.=
sched_count
     14482 =C2=B1  8%    +142.2%      35076 =C2=B1  6%  sched_debug.cpu#52.=
sched_goidle
     26709 =C2=B1 11%    +106.1%      55055 =C2=B1 14%  sched_debug.cpu#52.=
ttwu_count
    474631 =C2=B1 25%     +61.3%     765620 =C2=B1 15%  sched_debug.cpu#53.=
avg_idle
     12.00 =C2=B1  5%     -31.2%       8.25 =C2=B1 10%  sched_debug.cpu#53.=
cpu_load[1]
     12.00 =C2=B1  5%     -31.2%       8.25 =C2=B1 10%  sched_debug.cpu#53.=
cpu_load[2]
     12.75 =C2=B1 10%     -33.3%       8.50 =C2=B1 13%  sched_debug.cpu#53.=
cpu_load[3]
     13.00 =C2=B1 13%     -32.7%       8.75 =C2=B1  9%  sched_debug.cpu#53.=
cpu_load[4]
      4032 =C2=B1 12%     -25.1%       3020 =C2=B1 28%  sched_debug.cpu#53.=
curr->pid
     12.25 =C2=B1 14%     -44.9%       6.75 =C2=B1 28%  sched_debug.cpu#53.=
load
    152590 =C2=B1  0%     -14.3%     130834 =C2=B1  0%  sched_debug.cpu#53.=
nr_load_updates
     48837 =C2=B1 17%     +82.1%      88916 =C2=B1 10%  sched_debug.cpu#53.=
nr_switches
     49676 =C2=B1 15%     +79.2%      89011 =C2=B1 10%  sched_debug.cpu#53.=
sched_count
     15246 =C2=B1  9%    +158.6%      39426 =C2=B1 12%  sched_debug.cpu#53.=
sched_goidle
     26805 =C2=B1 17%     +56.3%      41884 =C2=B1  5%  sched_debug.cpu#53.=
ttwu_count
    476548 =C2=B1 19%     +58.6%     755779 =C2=B1 11%  sched_debug.cpu#54.=
avg_idle
     12.25 =C2=B1  8%     -32.7%       8.25 =C2=B1 13%  sched_debug.cpu#54.=
cpu_load[0]
    152437 =C2=B1  0%     -14.2%     130729 =C2=B1  0%  sched_debug.cpu#54.=
nr_load_updates
     51866 =C2=B1 14%     +60.0%      83008 =C2=B1 10%  sched_debug.cpu#54.=
nr_switches
     51968 =C2=B1 14%     +59.9%      83091 =C2=B1 10%  sched_debug.cpu#54.=
sched_count
     17044 =C2=B1 22%    +115.7%      36762 =C2=B1 11%  sched_debug.cpu#54.=
sched_goidle
     27151 =C2=B1 12%     +55.5%      42217 =C2=B1  6%  sched_debug.cpu#54.=
ttwu_count
      7686 =C2=B1 14%     -32.6%       5178 =C2=B1 12%  sched_debug.cpu#54.=
ttwu_local
    420730 =C2=B1 26%    +397.9%    2094817 =C2=B1115%  sched_debug.cpu#55.=
avg_idle
      9.75 =C2=B1 19%     -30.8%       6.75 =C2=B1 28%  sched_debug.cpu#55.=
cpu_load[0]
     10.25 =C2=B1 14%     -34.1%       6.75 =C2=B1 28%  sched_debug.cpu#55.=
cpu_load[1]
     10.50 =C2=B1 10%     -33.3%       7.00 =C2=B1 26%  sched_debug.cpu#55.=
cpu_load[2]
     11.00 =C2=B1 11%     -34.1%       7.25 =C2=B1 17%  sched_debug.cpu#55.=
cpu_load[3]
     11.50 =C2=B1 13%     -34.8%       7.50 =C2=B1 14%  sched_debug.cpu#55.=
cpu_load[4]
      3967 =C2=B1 11%     -38.4%       2442 =C2=B1 28%  sched_debug.cpu#55.=
curr->pid
    152503 =C2=B1  0%     -14.7%     130146 =C2=B1  0%  sched_debug.cpu#55.=
nr_load_updates
     46633 =C2=B1  3%     +87.3%      87362 =C2=B1  9%  sched_debug.cpu#55.=
nr_switches
     46730 =C2=B1  3%     +87.1%      87444 =C2=B1  9%  sched_debug.cpu#55.=
sched_count
     16125 =C2=B1 12%    +136.2%      38091 =C2=B1 12%  sched_debug.cpu#55.=
sched_goidle
     24087 =C2=B1  8%     +99.7%      48106 =C2=B1 23%  sched_debug.cpu#55.=
ttwu_count
    152417 =C2=B1  0%     -13.7%     131558 =C2=B1  0%  sched_debug.cpu#56.=
nr_load_updates
     47786 =C2=B1  9%    +139.4%     114416 =C2=B1 52%  sched_debug.cpu#56.=
nr_switches
     47878 =C2=B1  9%    +139.1%     114484 =C2=B1 52%  sched_debug.cpu#56.=
sched_count
     14640 =C2=B1  8%    +235.2%      49080 =C2=B1 49%  sched_debug.cpu#56.=
sched_goidle
     28063 =C2=B1 16%    +106.4%      57921 =C2=B1 51%  sched_debug.cpu#56.=
ttwu_count
    467149 =C2=B1 12%     +35.1%     630997 =C2=B1  9%  sched_debug.cpu#57.=
avg_idle
     11.00 =C2=B1 11%     -38.6%       6.75 =C2=B1  6%  sched_debug.cpu#57.=
cpu_load[3]
     11.25 =C2=B1  7%     -35.6%       7.25 =C2=B1  5%  sched_debug.cpu#57.=
cpu_load[4]
    152371 =C2=B1  0%     -13.5%     131807 =C2=B1  0%  sched_debug.cpu#57.=
nr_load_updates
     50340 =C2=B1  5%     +73.7%      87424 =C2=B1  7%  sched_debug.cpu#57.=
nr_switches
     50441 =C2=B1  5%     +73.5%      87503 =C2=B1  7%  sched_debug.cpu#57.=
sched_count
     15367 =C2=B1 11%    +150.9%      38563 =C2=B1  8%  sched_debug.cpu#57.=
sched_goidle
     27479 =C2=B1  7%     +74.1%      47853 =C2=B1  9%  sched_debug.cpu#57.=
ttwu_count
      8188 =C2=B1 15%     -26.5%       6016 =C2=B1 13%  sched_debug.cpu#57.=
ttwu_local
    441364 =C2=B1 13%     +68.4%     743409 =C2=B1 13%  sched_debug.cpu#58.=
avg_idle
     10.00 =C2=B1 12%     -32.5%       6.75 =C2=B1  6%  sched_debug.cpu#58.=
cpu_load[0]
     10.50 =C2=B1 10%     -31.0%       7.25 =C2=B1 11%  sched_debug.cpu#58.=
cpu_load[1]
     11.00 =C2=B1  6%     -31.8%       7.50 =C2=B1 14%  sched_debug.cpu#58.=
cpu_load[2]
     10.75 =C2=B1  7%     -25.6%       8.00 =C2=B1 15%  sched_debug.cpu#58.=
cpu_load[3]
     11.25 =C2=B1  3%     -26.7%       8.25 =C2=B1 17%  sched_debug.cpu#58.=
cpu_load[4]
     11.00 =C2=B1  9%     -27.3%       8.00 =C2=B1 15%  sched_debug.cpu#58.=
load
    152290 =C2=B1  0%     -14.1%     130745 =C2=B1  0%  sched_debug.cpu#58.=
nr_load_updates
     60871 =C2=B1 22%     +41.3%      86037 =C2=B1 10%  sched_debug.cpu#58.=
nr_switches
     60978 =C2=B1 22%     +41.2%      86130 =C2=B1 10%  sched_debug.cpu#58.=
sched_count
     16904 =C2=B1  9%    +125.3%      38083 =C2=B1 11%  sched_debug.cpu#58.=
sched_goidle
     13293 =C2=B1 63%     -59.9%       5336 =C2=B1  9%  sched_debug.cpu#58.=
ttwu_local
    456856 =C2=B1 10%     +53.3%     700214 =C2=B1  8%  sched_debug.cpu#59.=
avg_idle
     13.00 =C2=B1 13%     -44.2%       7.25 =C2=B1 24%  sched_debug.cpu#59.=
cpu_load[0]
     11.75 =C2=B1  9%     -42.6%       6.75 =C2=B1 21%  sched_debug.cpu#59.=
cpu_load[1]
     11.00 =C2=B1  9%     -36.4%       7.00 =C2=B1 20%  sched_debug.cpu#59.=
cpu_load[2]
     10.75 =C2=B1 12%     -34.9%       7.00 =C2=B1 10%  sched_debug.cpu#59.=
cpu_load[3]
     11.25 =C2=B1  7%     -35.6%       7.25 =C2=B1 11%  sched_debug.cpu#59.=
cpu_load[4]
      3802 =C2=B1 18%     -30.7%       2635 =C2=B1 41%  sched_debug.cpu#59.=
curr->pid
     12.00 =C2=B1  0%     -39.6%       7.25 =C2=B1 17%  sched_debug.cpu#59.=
load
    152355 =C2=B1  0%     -13.9%     131211 =C2=B1  0%  sched_debug.cpu#59.=
nr_load_updates
     49560 =C2=B1 15%     +61.1%      79823 =C2=B1  4%  sched_debug.cpu#59.=
nr_switches
     49669 =C2=B1 15%     +60.9%      79894 =C2=B1  4%  sched_debug.cpu#59.=
sched_count
     15386 =C2=B1 12%    +128.2%      35117 =C2=B1  2%  sched_debug.cpu#59.=
sched_goidle
     27155 =C2=B1 11%     +44.8%      39326 =C2=B1  4%  sched_debug.cpu#59.=
ttwu_count
      7858 =C2=B1 29%     -33.0%       5266 =C2=B1 20%  sched_debug.cpu#59.=
ttwu_local
    152898 =C2=B1  0%      -9.5%     138412 =C2=B1  0%  sched_debug.cpu#6.n=
r_load_updates
     69940 =C2=B1 23%     +46.3%     102305 =C2=B1  4%  sched_debug.cpu#6.n=
r_switches
     70074 =C2=B1 23%     +46.1%     102384 =C2=B1  4%  sched_debug.cpu#6.s=
ched_count
     18755 =C2=B1 10%    +144.9%      45935 =C2=B1  4%  sched_debug.cpu#6.s=
ched_goidle
     39222 =C2=B1 21%     +42.5%      55911 =C2=B1  8%  sched_debug.cpu#6.t=
twu_count
     13835 =C2=B1 42%     -55.7%       6135 =C2=B1 14%  sched_debug.cpu#6.t=
twu_local
    474335 =C2=B1  8%     +43.0%     678328 =C2=B1 11%  sched_debug.cpu#60.=
avg_idle
     12.00 =C2=B1  5%     -33.3%       8.00 =C2=B1 21%  sched_debug.cpu#60.=
cpu_load[2]
     12.00 =C2=B1  5%     -31.2%       8.25 =C2=B1 13%  sched_debug.cpu#60.=
cpu_load[3]
     12.00 =C2=B1  0%     -25.0%       9.00 =C2=B1 13%  sched_debug.cpu#60.=
cpu_load[4]
      4182 =C2=B1 12%     -44.1%       2337 =C2=B1 35%  sched_debug.cpu#60.=
curr->pid
    152283 =C2=B1  0%     -13.7%     131374 =C2=B1  0%  sched_debug.cpu#60.=
nr_load_updates
     50669 =C2=B1 16%     +63.8%      83013 =C2=B1  9%  sched_debug.cpu#60.=
nr_switches
     50762 =C2=B1 16%     +63.7%      83108 =C2=B1  9%  sched_debug.cpu#60.=
sched_count
     14463 =C2=B1  8%    +152.6%      36541 =C2=B1 10%  sched_debug.cpu#60.=
sched_goidle
     27733 =C2=B1 12%     +44.4%      40052 =C2=B1  2%  sched_debug.cpu#60.=
ttwu_count
      9283 =C2=B1 28%     -40.9%       5487 =C2=B1  3%  sched_debug.cpu#60.=
ttwu_local
     11.75 =C2=B1  3%     -36.2%       7.50 =C2=B1 35%  sched_debug.cpu#61.=
cpu_load[0]
     12.00 =C2=B1  0%     -39.6%       7.25 =C2=B1 36%  sched_debug.cpu#61.=
cpu_load[1]
     12.00 =C2=B1  0%     -41.7%       7.00 =C2=B1 34%  sched_debug.cpu#61.=
cpu_load[2]
     12.00 =C2=B1  0%     -39.6%       7.25 =C2=B1 28%  sched_debug.cpu#61.=
cpu_load[3]
     12.00 =C2=B1  0%     -39.6%       7.25 =C2=B1 28%  sched_debug.cpu#61.=
cpu_load[4]
    152378 =C2=B1  0%     -14.3%     130547 =C2=B1  0%  sched_debug.cpu#61.=
nr_load_updates
     55569 =C2=B1 15%     +49.7%      83166 =C2=B1  3%  sched_debug.cpu#61.=
nr_switches
     55678 =C2=B1 15%     +49.5%      83243 =C2=B1  3%  sched_debug.cpu#61.=
sched_count
     16460 =C2=B1  8%    +118.6%      35985 =C2=B1  6%  sched_debug.cpu#61.=
sched_goidle
     30921 =C2=B1 23%     +48.3%      45864 =C2=B1 14%  sched_debug.cpu#61.=
ttwu_count
    492355 =C2=B1 14%    +515.0%    3027770 =C2=B1132%  sched_debug.cpu#62.=
avg_idle
     12.25 =C2=B1 23%     -42.9%       7.00 =C2=B1 41%  sched_debug.cpu#62.=
cpu_load[0]
     11.50 =C2=B1 14%     -39.1%       7.00 =C2=B1 36%  sched_debug.cpu#62.=
cpu_load[1]
     12.00 =C2=B1 13%     -39.6%       7.25 =C2=B1 31%  sched_debug.cpu#62.=
cpu_load[2]
     12.25 =C2=B1 14%     -38.8%       7.50 =C2=B1 27%  sched_debug.cpu#62.=
cpu_load[3]
     12.75 =C2=B1 11%     -39.2%       7.75 =C2=B1 24%  sched_debug.cpu#62.=
cpu_load[4]
     12.75 =C2=B1 20%     -49.0%       6.50 =C2=B1 25%  sched_debug.cpu#62.=
load
    152167 =C2=B1  0%     -14.4%     130273 =C2=B1  0%  sched_debug.cpu#62.=
nr_load_updates
     50428 =C2=B1 13%     +68.2%      84798 =C2=B1  5%  sched_debug.cpu#62.=
nr_switches
     50546 =C2=B1 13%     +67.9%      84877 =C2=B1  5%  sched_debug.cpu#62.=
sched_count
     14929 =C2=B1  6%    +148.2%      37058 =C2=B1  6%  sched_debug.cpu#62.=
sched_goidle
     27575 =C2=B1  7%     +53.0%      42185 =C2=B1  4%  sched_debug.cpu#62.=
ttwu_count
     12.50 =C2=B1 17%     -48.0%       6.50 =C2=B1 44%  sched_debug.cpu#63.=
cpu_load[0]
     12.00 =C2=B1 17%     -45.8%       6.50 =C2=B1 44%  sched_debug.cpu#63.=
cpu_load[1]
     11.75 =C2=B1 13%     -42.6%       6.75 =C2=B1 30%  sched_debug.cpu#63.=
cpu_load[2]
     11.50 =C2=B1 13%     -32.6%       7.75 =C2=B1 24%  sched_debug.cpu#63.=
cpu_load[3]
     11.75 =C2=B1 15%     -31.9%       8.00 =C2=B1 23%  sched_debug.cpu#63.=
cpu_load[4]
    152320 =C2=B1  0%     -13.7%     131377 =C2=B1  0%  sched_debug.cpu#63.=
nr_load_updates
     48333 =C2=B1 10%     +76.0%      85082 =C2=B1  8%  sched_debug.cpu#63.=
nr_switches
     48448 =C2=B1 10%     +80.0%      87231 =C2=B1  6%  sched_debug.cpu#63.=
sched_count
     15808 =C2=B1  9%    +140.1%      37952 =C2=B1 10%  sched_debug.cpu#63.=
sched_goidle
     24411 =C2=B1 12%     +94.9%      47576 =C2=B1  7%  sched_debug.cpu#63.=
ttwu_count
    446664 =C2=B1 11%     +36.5%     609605 =C2=B1 21%  sched_debug.cpu#7.a=
vg_idle
    153027 =C2=B1  0%     -10.0%     137717 =C2=B1  0%  sched_debug.cpu#7.n=
r_load_updates
     67261 =C2=B1 27%     +48.4%      99807 =C2=B1  5%  sched_debug.cpu#7.n=
r_switches
     67400 =C2=B1 27%     +48.2%      99867 =C2=B1  5%  sched_debug.cpu#7.s=
ched_count
     19544 =C2=B1 18%    +124.8%      43945 =C2=B1  4%  sched_debug.cpu#7.s=
ched_goidle
     37487 =C2=B1 22%     +44.8%      54293 =C2=B1  5%  sched_debug.cpu#7.t=
twu_count
    527681 =C2=B1 13%     +29.1%     681378 =C2=B1 11%  sched_debug.cpu#8.a=
vg_idle
     13.50 =C2=B1  6%     -37.0%       8.50 =C2=B1 19%  sched_debug.cpu#8.c=
pu_load[0]
     14.00 =C2=B1 10%     -39.3%       8.50 =C2=B1 19%  sched_debug.cpu#8.c=
pu_load[1]
     13.75 =C2=B1 10%     -40.0%       8.25 =C2=B1 21%  sched_debug.cpu#8.c=
pu_load[2]
     13.25 =C2=B1 11%     -37.7%       8.25 =C2=B1 21%  sched_debug.cpu#8.c=
pu_load[3]
     14.25 =C2=B1  9%     -35.1%       9.25 =C2=B1 19%  sched_debug.cpu#8.l=
oad
    176387 =C2=B1 20%     -22.0%     137608 =C2=B1  0%  sched_debug.cpu#8.n=
r_load_updates
     33926 =C2=B1105%     -82.3%       5992 =C2=B1 26%  sched_debug.cpu#8.t=
twu_local
     13.50 =C2=B1 33%     -38.9%       8.25 =C2=B1 13%  sched_debug.cpu#9.c=
pu_load[0]
     12.50 =C2=B1 22%     -34.0%       8.25 =C2=B1 19%  sched_debug.cpu#9.c=
pu_load[1]
     12.25 =C2=B1 17%     -32.7%       8.25 =C2=B1 19%  sched_debug.cpu#9.c=
pu_load[2]
     11.75 =C2=B1 13%     -31.9%       8.00 =C2=B1 15%  sched_debug.cpu#9.c=
pu_load[3]
      3880 =C2=B1 15%     -24.7%       2922 =C2=B1 30%  sched_debug.cpu#9.c=
urr->pid
    154373 =C2=B1  1%     -10.4%     138275 =C2=B1  1%  sched_debug.cpu#9.n=
r_load_updates
     63585 =C2=B1 11%     +60.1%     101812 =C2=B1  3%  sched_debug.cpu#9.n=
r_switches
     -1.00 =C2=B1-331%    +800.0%      -9.00 =C2=B1-45%  sched_debug.cpu#9.=
nr_uninterruptible
     63974 =C2=B1 11%     +59.5%     102061 =C2=B1  3%  sched_debug.cpu#9.s=
ched_count
     18344 =C2=B1 13%    +147.0%      45319 =C2=B1  3%  sched_debug.cpu#9.s=
ched_goidle
     38737 =C2=B1 14%     +48.5%      57531 =C2=B1  9%  sched_debug.cpu#9.t=
twu_count
     12311 =C2=B1 20%     -52.3%       5875 =C2=B1 10%  sched_debug.cpu#9.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/nr_threads/blo=
cksize:
  lkp-nex04/pigz/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performan=
ce/100%/512K

commit: =

  cd126afe838d7ea9b971cdea087fd498a7293c7f
  9d89c257dfb9c51a532d69397f6eed75e5168c35

cd126afe838d7ea9 9d89c257dfb9c51a532d69397f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    784089 =C2=B1  3%     +29.7%    1016704 =C2=B1  3%  pigz.time.involunta=
ry_context_switches
    162987 =C2=B1  0%      +1.7%     165752 =C2=B1  0%  pigz.time.maximum_r=
esident_set_size
      6330 =C2=B1  0%      -1.3%       6249 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
     18800 =C2=B1  0%      -1.3%      18550 =C2=B1  0%  pigz.time.user_time
    808615 =C2=B1  0%     +38.7%    1121561 =C2=B1  0%  pigz.time.voluntary=
_context_switches
     49545 =C2=B1  1%     +10.9%      54951 =C2=B1  4%  meminfo.AnonHugePag=
es
    707318 =C2=B1  3%     -13.4%     612203 =C2=B1  3%  meminfo.Committed_AS
      1548 =C2=B1 57%     -99.8%       2.50 =C2=B1500%  numa-numastat.node2=
.other_node
      2067 =C2=B1  0%     -99.4%      12.25 =C2=B1 77%  numa-numastat.node3=
.other_node
    644.50 =C2=B1 39%     +91.1%       1231 =C2=B1 20%  slabinfo.blkdev_req=
uests.active_objs
    644.50 =C2=B1 39%     +91.1%       1231 =C2=B1 20%  slabinfo.blkdev_req=
uests.num_objs
    784089 =C2=B1  3%     +29.7%    1016704 =C2=B1  3%  time.involuntary_co=
ntext_switches
    808615 =C2=B1  0%     +38.7%    1121561 =C2=B1  0%  time.voluntary_cont=
ext_switches
      9033 =C2=B1  2%     +28.0%      11565 =C2=B1  2%  vmstat.system.cs
     97792 =C2=B1  1%      +3.7%     101386 =C2=B1  0%  vmstat.system.in
     74318 =C2=B1 12%     +95.5%     145288 =C2=B1 21%  cpuidle.C1-NHM.usage
 2.396e+08 =C2=B1  4%     +99.5%  4.779e+08 =C2=B1  4%  cpuidle.C3-NHM.time
    128454 =C2=B1  5%     +99.2%     255901 =C2=B1  6%  cpuidle.C3-NHM.usage
    820.75 =C2=B1  9%     +36.4%       1119 =C2=B1  2%  proc-vmstat.numa_hu=
ge_pte_updates
    201751 =C2=B1  4%     +25.1%     252444 =C2=B1  1%  proc-vmstat.numa_pa=
ges_migrated
   1700192 =C2=B1  8%     +16.6%    1982501 =C2=B1  2%  proc-vmstat.numa_pt=
e_updates
    201751 =C2=B1  4%     +25.1%     252444 =C2=B1  1%  proc-vmstat.pgmigra=
te_success
     98.73 =C2=B1  0%      -1.2%      97.51 =C2=B1  0%  turbostat.%Busy
      2338 =C2=B1  0%      -1.2%       2310 =C2=B1  0%  turbostat.Avg_MHz
      0.84 =C2=B1  6%    +107.7%       1.74 =C2=B1  4%  turbostat.CPU%c1
      0.43 =C2=B1  2%     +74.4%       0.75 =C2=B1  4%  turbostat.CPU%c3
      0.24 =C2=B1 11%     +31.6%       0.31 =C2=B1  7%  turbostat.Pkg%pc3
      6514 =C2=B1 53%     -94.6%     354.50 =C2=B1109%  numa-meminfo.node0.=
Inactive(anon)
      7730 =C2=B1 31%     -54.7%       3499 =C2=B1  0%  numa-meminfo.node0.=
Mapped
      1058 =C2=B1 21%     -36.9%     667.75 =C2=B1 16%  numa-meminfo.node0.=
PageTables
      6585 =C2=B1 52%     -93.5%     428.25 =C2=B1107%  numa-meminfo.node0.=
Shmem
     13805 =C2=B1  8%     -18.8%      11204 =C2=B1  9%  numa-meminfo.node1.=
SReclaimable
     10728 =C2=B1 19%     +39.7%      14989 =C2=B1 10%  numa-meminfo.node2.=
AnonHugePages
     11213 =C2=B1 11%     +16.1%      13017 =C2=B1  3%  numa-meminfo.node3.=
AnonHugePages
     12038 =C2=B1 12%     +27.8%      15387 =C2=B1  6%  numa-meminfo.node3.=
SReclaimable
      1628 =C2=B1 53%     -94.6%      88.50 =C2=B1109%  numa-vmstat.node0.n=
r_inactive_anon
      1929 =C2=B1 31%     -54.7%     873.75 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    264.50 =C2=B1 21%     -37.1%     166.50 =C2=B1 16%  numa-vmstat.node0.n=
r_page_table_pages
      1646 =C2=B1 53%     -93.5%     106.75 =C2=B1107%  numa-vmstat.node0.n=
r_shmem
   4386045 =C2=B1  7%     +79.0%    7849244 =C2=B1 42%  numa-vmstat.node0.n=
uma_hit
   4349817 =C2=B1  7%     +79.8%    7820904 =C2=B1 42%  numa-vmstat.node0.n=
uma_local
      3450 =C2=B1  8%     -18.8%       2801 =C2=B1  9%  numa-vmstat.node1.n=
r_slab_reclaimable
     27286 =C2=B1  6%    +126.9%      61922 =C2=B1  0%  numa-vmstat.node1.n=
uma_other
      3009 =C2=B1 12%     +27.8%       3846 =C2=B1  6%  numa-vmstat.node3.n=
r_slab_reclaimable
   2905906 =C2=B1 74%     -48.8%    1487580 =C2=B1 15%  latency_stats.avg.a=
sync_synchronize_cookie_domain.async_synchronize_full.do_init_module.load_m=
odule.SyS_finit_module.entry_SYSCALL_64_fastpath
    417747 =C2=B1  0%     +74.9%     730731 =C2=B1  1%  latency_stats.hits.=
futex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
      6222 =C2=B1 85%     -63.4%       2279 =C2=B1 14%  latency_stats.max.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ioctl_internal_command.sc=
si_set_medium_removal.scsi_set_medium_removal.sr_lock_door.[sr_mod].cdrom_r=
elease.[cdrom].sr_block_release.[sr_mod].__blkdev_put.blkdev_put.blkdev_clo=
se
      1803 =C2=B1  8%    +581.7%      12291 =C2=B1  3%  latency_stats.max.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
      1274 =C2=B1 30%    +471.2%       7277 =C2=B1 66%  latency_stats.max.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
     24430 =C2=B1 63%     -50.2%      12176 =C2=B1 11%  latency_stats.max.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      7546 =C2=B1 78%     -50.8%       3711 =C2=B1  9%  latency_stats.sum.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ioctl_internal_command.sc=
si_set_medium_removal.scsi_set_medium_removal.sr_lock_door.[sr_mod].cdrom_r=
elease.[cdrom].sr_block_release.[sr_mod].__blkdev_put.blkdev_put.blkdev_clo=
se
   1975829 =C2=B1 19%    +166.0%    5256163 =C2=B1 10%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
     57022 =C2=B1 12%    +166.2%     151779 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault.copy_pa=
ge_to_iter.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
     28328 =C2=B1 20%    +403.7%     142699 =C2=B1 28%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
    152359 =C2=B1 11%    +347.8%     682197 =C2=B1 17%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYS=
CALL_64_fastpath
      7008 =C2=B1  8%    +130.9%      16184 =C2=B1 25%  latency_stats.sum.c=
all_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
 2.821e+08 =C2=B1  0%     +13.8%   3.21e+08 =C2=B1  0%  latency_stats.sum.f=
utex_wait_queue_me.futex_wait.do_futex.SyS_futex.entry_SYSCALL_64_fastpath
  20179144 =C2=B1  2%     -24.6%   15216129 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
  59685844 =C2=B1  1%     +25.8%   75095874 =C2=B1  1%  latency_stats.sum.p=
ipe_wait.pipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpa=
th
     29903 =C2=B1  4%     -18.9%      24242 =C2=B1  4%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     30836 =C2=B1 16%     +88.3%      58066 =C2=B1 12%  latency_stats.sum.w=
ait_on_page_bit.do_huge_pmd_numa_page.handle_mm_fault.__do_page_fault.do_pa=
ge_fault.page_fault
      4.36 =C2=B1  3%      -8.7%       3.98 =C2=B1  2%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.pipe_write.__vfs_write.vfs_=
write
      0.41 =C2=B1 30%    +217.1%       1.30 =C2=B1 14%  perf-profile.cpu-cy=
cles.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_process.wake_up_q
     30.20 =C2=B1  2%      -9.5%      27.33 =C2=B1  2%  perf-profile.cpu-cy=
cles.apic_timer_interrupt
      0.13 =C2=B1 90%    +501.9%       0.78 =C2=B1 36%  perf-profile.cpu-cy=
cles.call_cpuidle.cpu_startup_entry.start_secondary
      0.18 =C2=B1 83%    +745.8%       1.52 =C2=B1 35%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      0.13 =C2=B1 90%    +500.0%       0.78 =C2=B1 36%  perf-profile.cpu-cy=
cles.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      1.73 =C2=B1 10%     +88.3%       3.26 =C2=B1  6%  perf-profile.cpu-cy=
cles.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      0.53 =C2=B1 28%    +162.9%       1.38 =C2=B1 11%  perf-profile.cpu-cy=
cles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.wake_up_pro=
cess
      2.05 =C2=B1 19%     +28.2%       2.63 =C2=B1  4%  perf-profile.cpu-cy=
cles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_w=
ake_up
      0.95 =C2=B1 16%     +31.9%       1.25 =C2=B1  6%  perf-profile.cpu-cy=
cles.futex_requeue.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      0.45 =C2=B1  7%    +111.1%       0.95 =C2=B1 13%  perf-profile.cpu-cy=
cles.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      0.39 =C2=B1  8%    +118.1%       0.84 =C2=B1 16%  perf-profile.cpu-cy=
cles.futex_wait_queue_me.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fas=
tpath
      0.41 =C2=B1 19%     +95.7%       0.80 =C2=B1 21%  perf-profile.cpu-cy=
cles.pipe_wait.pipe_write.__vfs_write.vfs_write.sys_write
      0.87 =C2=B1  9%     -88.8%       0.10 =C2=B1 23%  perf-profile.cpu-cy=
cles.reschedule_interrupt
     29.27 =C2=B1  2%      -9.4%      26.53 =C2=B1  2%  perf-profile.cpu-cy=
cles.smp_apic_timer_interrupt.apic_timer_interrupt
      0.18 =C2=B1 83%    +752.8%       1.54 =C2=B1 35%  perf-profile.cpu-cy=
cles.start_secondary
      1.75 =C2=B1  9%     +87.3%       3.28 =C2=B1  6%  perf-profile.cpu-cy=
cles.sys_futex.entry_SYSCALL_64_fastpath
      8.85 =C2=B1  6%     -20.8%       7.01 =C2=B1  5%  perf-profile.cpu-cy=
cles.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.t=
ick_sched_timer
      0.86 =C2=B1 25%    +105.2%       1.76 =C2=B1 19%  perf-profile.cpu-cy=
cles.trigger_load_balance.scheduler_tick.update_process_times.tick_sched_ha=
ndle.tick_sched_timer
      0.71 =C2=B1 17%     +47.9%       1.06 =C2=B1  9%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_process.wake_up_q.futex_requeue.do_futex
      1.19 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cpu-cy=
cles.update_cfs_rq_blocked_load.task_tick_fair.scheduler_tick.update_proces=
s_times.tick_sched_handle
      3.32 =C2=B1  5%     +30.7%       4.34 =C2=B1  6%  perf-profile.cpu-cy=
cles.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_times.t=
ick_sched_handle
      0.73 =C2=B1 16%     +47.3%       1.08 =C2=B1  8%  perf-profile.cpu-cy=
cles.wake_up_process.wake_up_q.futex_requeue.do_futex.sys_futex
      0.73 =C2=B1 16%     +46.9%       1.08 =C2=B1  8%  perf-profile.cpu-cy=
cles.wake_up_q.futex_requeue.do_futex.sys_futex.entry_SYSCALL_64_fastpath
    284.25 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
      9467 =C2=B1  5%     -90.8%     873.00 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    297.25 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
    866.75 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
      8885 =C2=B1  5%     -90.2%     868.75 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    202.25 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
    844.50 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
      8884 =C2=B1  5%     -90.2%     868.75 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
    283.75 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    859.25 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
    270.75 =C2=B1101%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
     14.50 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
      8890 =C2=B1  5%     -90.2%     867.50 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
    285.75 =C2=B1 96%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
    842.75 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
      8808 =C2=B1  5%     -90.1%     868.25 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    191.75 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    855.25 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
    116.50 =C2=B1 97%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.blocked_load_avg
     13.75 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
      8792 =C2=B1  6%     -90.1%     868.00 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    130.50 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
    892.50 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
    145.50 =C2=B1 63%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
     13.00 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
    -48288 =C2=B1-213%    -270.0%      82079 =C2=B1 53%  sched_debug.cfs_rq=
[15]:/.spread0
      8784 =C2=B1  6%     -90.1%     868.50 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    158.75 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    877.50 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
    109.00 =C2=B1 89%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
     13.25 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
      8786 =C2=B1  6%     -90.1%     868.50 =C2=B1  1%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
    122.25 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
    868.50 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
    197.50 =C2=B1168%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
      8788 =C2=B1  6%     -90.1%     868.75 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    210.50 =C2=B1157%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    830.75 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.runnable_load_avg
      8781 =C2=B1  6%     -90.1%     869.75 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
     82.75 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
    864.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
      1.00 =C2=B1 70%    +525.0%       6.25 =C2=B1 61%  sched_debug.cfs_rq[=
19]:/.nr_spread_over
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
      8706 =C2=B1  5%     -90.0%     869.75 =C2=B1  1%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
     59.25 =C2=B1115%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
    851.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
      1.50 =C2=B1 33%    +266.7%       5.50 =C2=B1 39%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
     13.75 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
      9457 =C2=B1  5%     -90.8%     872.75 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    125.00 =C2=B1119%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    839.50 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
     13.50 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
      8480 =C2=B1  3%     -89.7%     869.75 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
     83.00 =C2=B1105%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
    869.25 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
      8052 =C2=B1 10%     -89.2%     869.50 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
    183.25 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
    849.50 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.utilization_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
      8036 =C2=B1  9%     -89.2%     868.25 =C2=B1  1%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     84.00 =C2=B1 95%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
    884.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.utilization_load_avg
     13.50 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
      8033 =C2=B1  9%     -89.2%     868.50 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
    107.75 =C2=B1144%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
    833.25 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
     13.00 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
      8031 =C2=B1  9%     -89.2%     868.25 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
    149.25 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
    872.75 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.utilization_load_avg
     14.00 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
      8103 =C2=B1  9%     -89.3%     869.00 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
     31.75 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
    891.25 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
      8101 =C2=B1  9%     -89.3%     868.50 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
     68.25 =C2=B1127%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
    844.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
      8093 =C2=B1  9%     -89.3%     868.75 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
     79.75 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
    896.75 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
    176.25 =C2=B1117%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
     22.25 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
      8076 =C2=B1  9%     -89.2%     868.50 =C2=B1  1%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
    198.75 =C2=B1109%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
      1016 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
     16.75 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
      8063 =C2=B1  9%     -89.2%     867.00 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
     66.00 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
    907.75 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
    124.25 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
      9452 =C2=B1  5%     -90.8%     871.50 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
    136.50 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
    848.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
      8005 =C2=B1  9%     -89.2%     866.50 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
     99.00 =C2=B1 85%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
    856.50 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
     62.00 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
     17.25 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
      8051 =C2=B1  7%     -89.2%     866.75 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
     79.75 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
    885.75 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
     11.25 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.runnable_load_avg
      8046 =C2=B1  7%     -89.2%     866.50 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     59.50 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
    809.00 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.utilization_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.runnable_load_avg
      8053 =C2=B1  6%     -89.2%     867.25 =C2=B1  1%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
    118.75 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
    850.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.utilization_load_avg
    110.00 =C2=B1102%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.blocked_load_avg
     12.25 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
    139941 =C2=B1 20%     +34.4%     188052 =C2=B1 13%  sched_debug.cfs_rq[=
34]:/.spread0
      7768 =C2=B1  8%     -88.8%     866.75 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
    124.00 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
    851.50 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
      7768 =C2=B1  8%     -88.8%     866.50 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
     57.25 =C2=B1122%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
    861.25 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
     20.25 =C2=B1 65%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.blocked_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.runnable_load_avg
      7746 =C2=B1  8%     -88.8%     867.00 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     33.25 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
    839.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
     45.75 =C2=B1 98%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.blocked_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
      7806 =C2=B1  7%     -88.9%     866.50 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
     59.00 =C2=B1 75%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
    863.25 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.utilization_load_avg
     12.25 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
      7757 =C2=B1  6%     -88.8%     866.75 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
    219.50 =C2=B1123%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
    789.00 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
      7746 =C2=B1  6%     -88.8%     866.50 =C2=B1  0%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
    187.00 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
    835.00 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.utilization_load_avg
     67.00 =C2=B1121%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
      9441 =C2=B1  5%     -90.8%     871.25 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     79.25 =C2=B1102%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
    845.00 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
      7724 =C2=B1  7%     -88.8%     866.25 =C2=B1  1%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
     90.50 =C2=B1140%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
    853.50 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.utilization_load_avg
    107.25 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.blocked_load_avg
     11.50 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
      7720 =C2=B1  7%     -88.8%     866.25 =C2=B1  1%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
    119.00 =C2=B1102%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
    777.50 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.utilization_load_avg
    121.75 =C2=B1161%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.blocked_load_avg
     13.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
      7714 =C2=B1  7%     -88.8%     866.50 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
    135.25 =C2=B1145%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
    851.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.utilization_load_avg
     15.50 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
      7744 =C2=B1  6%     -88.8%     865.75 =C2=B1  1%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
    383.00 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
    892.25 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
     14.00 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.runnable_load_avg
      7732 =C2=B1  6%     -88.8%     865.75 =C2=B1  0%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
     76.00 =C2=B1133%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
    883.75 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
    200.00 =C2=B1 37%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.blocked_load_avg
     12.25 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
      7775 =C2=B1  7%     -88.9%     865.00 =C2=B1  0%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
    213.00 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
    829.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
      1.00 =C2=B1141%    +500.0%       6.00 =C2=B1117%  sched_debug.cfs_rq[=
46]:/.nr_spread_over
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
      7707 =C2=B1  6%     -88.8%     865.00 =C2=B1  0%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
     96.50 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
    844.50 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.utilization_load_avg
     87.25 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.blocked_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
      7638 =C2=B1  7%     -88.7%     865.00 =C2=B1  0%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
    100.25 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
    836.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
      7611 =C2=B1  7%     -88.6%     865.25 =C2=B1  0%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
     81.75 =C2=B1126%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
    825.75 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
      7580 =C2=B1  8%     -88.6%     865.00 =C2=B1  0%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
    135.50 =C2=B1 92%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
    856.50 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.utilization_load_avg
    172.50 =C2=B1 90%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
      2.00 =C2=B1108%    +150.0%       5.00 =C2=B1 31%  sched_debug.cfs_rq[=
4]:/.nr_spread_over
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
      9343 =C2=B1  6%     -90.7%     871.00 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    187.25 =C2=B1 84%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    841.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
      0.75 =C2=B1173%    +600.0%       5.25 =C2=B1 87%  sched_debug.cfs_rq[=
50]:/.nr_spread_over
     15.50 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.runnable_load_avg
      7582 =C2=B1  8%     -88.6%     865.25 =C2=B1  0%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
    152.00 =C2=B1 80%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
    853.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
    166.75 =C2=B1 41%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.blocked_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.runnable_load_avg
      7570 =C2=B1  8%     -88.6%     865.25 =C2=B1  0%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
    179.25 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
    851.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
      1.00 =C2=B1  0%    +175.0%       2.75 =C2=B1 15%  sched_debug.cfs_rq[=
52]:/.nr_spread_over
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
    146704 =C2=B1 39%     +45.5%     213494 =C2=B1 17%  sched_debug.cfs_rq[=
52]:/.spread0
      7515 =C2=B1  8%     -88.5%     865.50 =C2=B1  0%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
    115.75 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
    839.00 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.runnable_load_avg
    146103 =C2=B1 31%     +40.8%     205736 =C2=B1 13%  sched_debug.cfs_rq[=
53]:/.spread0
      6951 =C2=B1 11%     -87.6%     865.00 =C2=B1  0%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
     26.00 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
    871.75 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.runnable_load_avg
      6946 =C2=B1 11%     -87.5%     865.00 =C2=B1  0%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
     56.25 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
    850.25 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.utilization_load_avg
      0.33 =C2=B1141%   +2525.0%       8.75 =C2=B1 85%  sched_debug.cfs_rq[=
55]:/.nr_spread_over
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.runnable_load_avg
      6937 =C2=B1 11%     -87.5%     865.00 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
     65.25 =C2=B1 98%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
    798.75 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.utilization_load_avg
      0.00 =C2=B1  0%      +Inf%      13.25 =C2=B1103%  sched_debug.cfs_rq[=
56]:/.nr_spread_over
     13.25 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
      6931 =C2=B1 11%     -87.5%     865.50 =C2=B1  0%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
     35.50 =C2=B1111%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
    912.50 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
      6922 =C2=B1 11%     -87.5%     865.75 =C2=B1  0%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
     98.00 =C2=B1151%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
    836.00 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.runnable_load_avg
      6895 =C2=B1 11%     -87.4%     865.50 =C2=B1  0%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
     60.00 =C2=B1125%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
    857.50 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.runnable_load_avg
      6882 =C2=B1 11%     -87.4%     866.25 =C2=B1  0%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
     66.00 =C2=B1128%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
    849.50 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
     26.50 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
      0.75 =C2=B1173%   +1333.3%      10.75 =C2=B1 33%  sched_debug.cfs_rq[=
5]:/.nr_spread_over
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
      9341 =C2=B1  5%     -90.7%     870.25 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     39.50 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
    840.50 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
     18.00 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.runnable_load_avg
      6845 =C2=B1 11%     -87.3%     866.25 =C2=B1  0%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
    156.25 =C2=B1 63%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
    893.25 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.utilization_load_avg
     12.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
      6875 =C2=B1 11%     -87.4%     866.00 =C2=B1  0%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
    108.50 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
    840.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
     10.75 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.runnable_load_avg
    124369 =C2=B1 32%     +55.6%     193540 =C2=B1 12%  sched_debug.cfs_rq[=
62]:/.spread0
      6872 =C2=B1 11%     -87.4%     866.50 =C2=B1  0%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
     78.00 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
    760.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.utilization_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.runnable_load_avg
      6895 =C2=B1 10%     -87.4%     866.75 =C2=B1  0%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
    155.00 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
    822.75 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.utilization_load_avg
     12.75 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
      9336 =C2=B1  5%     -90.7%     870.00 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
    128.75 =C2=B1144%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    826.25 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
      3.50 =C2=B1 14%    +114.3%       7.50 =C2=B1 40%  sched_debug.cfs_rq[=
7]:/.nr_spread_over
     15.75 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
      9374 =C2=B1  5%     -90.7%     868.00 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    266.00 =C2=B1154%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    901.75 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
    157.25 =C2=B1 30%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
     13.25 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
      9345 =C2=B1  5%     -90.7%     868.25 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    174.00 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    883.75 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
    218.00 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     55.50 =C2=B1132%     -81.1%      10.50 =C2=B1 15%  sched_debug.cfs_rq[=
9]:/.load
     12.50 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
      9100 =C2=B1  7%     -90.5%     868.50 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    231.00 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
    861.25 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
     27930 =C2=B1 18%     +99.8%      55800 =C2=B1 21%  sched_debug.cpu#0.n=
r_switches
     33768 =C2=B1 14%     +83.5%      61966 =C2=B1 18%  sched_debug.cpu#0.s=
ched_count
      2638 =C2=B1 16%     +77.0%       4668 =C2=B1 14%  sched_debug.cpu#0.s=
ched_goidle
     17864 =C2=B1 12%     +69.7%      30320 =C2=B1 19%  sched_debug.cpu#0.t=
twu_count
      9652 =C2=B1 18%    +159.3%      25028 =C2=B1 23%  sched_debug.cpu#0.t=
twu_local
     18144 =C2=B1  9%     +91.1%      34682 =C2=B1 28%  sched_debug.cpu#1.n=
r_switches
     -5.25 =C2=B1-52%    +133.3%     -12.25 =C2=B1-32%  sched_debug.cpu#1.n=
r_uninterruptible
     19203 =C2=B1  7%     +88.6%      36215 =C2=B1 25%  sched_debug.cpu#1.s=
ched_count
      9960 =C2=B1 18%     +85.4%      18466 =C2=B1 24%  sched_debug.cpu#1.t=
twu_count
      4476 =C2=B1 17%    +211.3%      13937 =C2=B1 36%  sched_debug.cpu#1.t=
twu_local
    879100 =C2=B1  9%     -18.1%     719959 =C2=B1  9%  sched_debug.cpu#11.=
avg_idle
     14.25 =C2=B1 20%     -19.3%      11.50 =C2=B1  7%  sched_debug.cpu#12.=
cpu_load[0]
     13.50 =C2=B1 12%     -14.8%      11.50 =C2=B1  7%  sched_debug.cpu#12.=
cpu_load[1]
     13.25 =C2=B1  6%     -13.2%      11.50 =C2=B1  7%  sched_debug.cpu#12.=
cpu_load[2]
     13.50 =C2=B1  3%     -14.8%      11.50 =C2=B1  7%  sched_debug.cpu#12.=
cpu_load[3]
     13.75 =C2=B1 10%     -16.4%      11.50 =C2=B1  7%  sched_debug.cpu#12.=
cpu_load[4]
      1363 =C2=B1 35%    +431.3%       7245 =C2=B1 54%  sched_debug.cpu#12.=
sched_goidle
     13.00 =C2=B1  9%     -13.5%      11.25 =C2=B1  3%  sched_debug.cpu#13.=
cpu_load[1]
     13.25 =C2=B1  8%     -15.1%      11.25 =C2=B1  3%  sched_debug.cpu#13.=
cpu_load[2]
      1396 =C2=B1 30%    +151.0%       3503 =C2=B1 35%  sched_debug.cpu#13.=
sched_goidle
      1324 =C2=B1 32%     +92.7%       2551 =C2=B1 29%  sched_debug.cpu#15.=
sched_goidle
     20505 =C2=B1 21%     +77.0%      36289 =C2=B1 21%  sched_debug.cpu#18.=
nr_switches
     20947 =C2=B1 22%     +74.7%      36595 =C2=B1 21%  sched_debug.cpu#18.=
sched_count
      1404 =C2=B1 67%    +607.7%       9940 =C2=B1 38%  sched_debug.cpu#18.=
sched_goidle
     12.00 =C2=B1  0%     +12.5%      13.50 =C2=B1  3%  sched_debug.cpu#19.=
cpu_load[0]
      9028 =C2=B1 28%     +73.2%      15640 =C2=B1 29%  sched_debug.cpu#19.=
ttwu_count
      4933 =C2=B1 48%    +133.1%      11498 =C2=B1 27%  sched_debug.cpu#19.=
ttwu_local
     12.00 =C2=B1  0%     +22.9%      14.75 =C2=B1  5%  sched_debug.cpu#2.l=
oad
      9092 =C2=B1 12%     +70.1%      15469 =C2=B1 18%  sched_debug.cpu#2.t=
twu_count
      4432 =C2=B1 25%    +155.7%      11332 =C2=B1 19%  sched_debug.cpu#2.t=
twu_local
     17399 =C2=B1 39%    +101.1%      34997 =C2=B1 30%  sched_debug.cpu#20.=
nr_switches
     17897 =C2=B1 36%     +97.1%      35277 =C2=B1 29%  sched_debug.cpu#20.=
sched_count
      1317 =C2=B1 65%    +186.7%       3777 =C2=B1 40%  sched_debug.cpu#20.=
sched_goidle
      9084 =C2=B1 43%    +116.3%      19650 =C2=B1 19%  sched_debug.cpu#20.=
ttwu_count
      4953 =C2=B1 69%    +182.5%      13994 =C2=B1 42%  sched_debug.cpu#20.=
ttwu_local
      1284 =C2=B1 30%     +70.5%       2188 =C2=B1 13%  sched_debug.cpu#21.=
sched_goidle
    896.25 =C2=B1 22%    +324.9%       3808 =C2=B1 54%  sched_debug.cpu#22.=
sched_goidle
      1072 =C2=B1 33%    +114.7%       2301 =C2=B1 22%  sched_debug.cpu#23.=
sched_goidle
      1243 =C2=B1 18%    +240.6%       4234 =C2=B1 35%  sched_debug.cpu#24.=
sched_goidle
    754195 =C2=B1 10%     +14.2%     861492 =C2=B1  9%  sched_debug.cpu#26.=
avg_idle
      1483 =C2=B1 46%    +159.9%       3856 =C2=B1 64%  sched_debug.cpu#26.=
sched_goidle
      8803 =C2=B1 10%     +78.4%      15703 =C2=B1 60%  sched_debug.cpu#27.=
ttwu_count
      4593 =C2=B1 18%    +104.0%       9369 =C2=B1 36%  sched_debug.cpu#27.=
ttwu_local
      1038 =C2=B1  5%    +433.6%       5541 =C2=B1 73%  sched_debug.cpu#28.=
sched_goidle
    763254 =C2=B1  8%     +15.5%     881858 =C2=B1  7%  sched_debug.cpu#3.a=
vg_idle
     19723 =C2=B1 28%     +77.1%      34923 =C2=B1  8%  sched_debug.cpu#3.n=
r_switches
     -1.75 =C2=B1-173%    +614.3%     -12.50 =C2=B1-45%  sched_debug.cpu#3.=
nr_uninterruptible
     20477 =C2=B1 26%     +73.4%      35506 =C2=B1  8%  sched_debug.cpu#3.s=
ched_count
      1498 =C2=B1 39%    +135.1%       3523 =C2=B1 23%  sched_debug.cpu#3.s=
ched_goidle
     10902 =C2=B1 30%     +61.3%      17581 =C2=B1  3%  sched_debug.cpu#3.t=
twu_count
      5624 =C2=B1 54%    +137.7%      13372 =C2=B1  7%  sched_debug.cpu#3.t=
twu_local
     15726 =C2=B1 25%    +145.3%      38576 =C2=B1 58%  sched_debug.cpu#30.=
nr_switches
     16866 =C2=B1 20%    +134.3%      39523 =C2=B1 58%  sched_debug.cpu#30.=
sched_count
      1212 =C2=B1 22%    +173.1%       3311 =C2=B1 42%  sched_debug.cpu#30.=
sched_goidle
      9232 =C2=B1 21%    +112.5%      19620 =C2=B1 61%  sched_debug.cpu#30.=
ttwu_count
      4916 =C2=B1 33%    +220.0%      15734 =C2=B1 66%  sched_debug.cpu#30.=
ttwu_local
      1150 =C2=B1 16%    +140.8%       2771 =C2=B1 20%  sched_debug.cpu#31.=
sched_goidle
      4.25 =C2=B1 38%    -235.3%      -5.75 =C2=B1-121%  sched_debug.cpu#32=
.nr_uninterruptible
      5476 =C2=B1 32%    +119.7%      12031 =C2=B1 46%  sched_debug.cpu#32.=
ttwu_local
     15.25 =C2=B1 26%     -26.2%      11.25 =C2=B1  3%  sched_debug.cpu#33.=
cpu_load[0]
     14.75 =C2=B1 25%     -23.7%      11.25 =C2=B1  3%  sched_debug.cpu#33.=
cpu_load[1]
     14.75 =C2=B1 25%     -23.7%      11.25 =C2=B1  3%  sched_debug.cpu#33.=
cpu_load[2]
     14.50 =C2=B1 22%     -22.4%      11.25 =C2=B1  3%  sched_debug.cpu#33.=
cpu_load[3]
     14.50 =C2=B1 22%     -22.4%      11.25 =C2=B1  3%  sched_debug.cpu#33.=
cpu_load[4]
      5968 =C2=B1 45%     +72.8%      10312 =C2=B1 31%  sched_debug.cpu#34.=
ttwu_local
     13.75 =C2=B1 12%     -18.2%      11.25 =C2=B1  3%  sched_debug.cpu#35.=
cpu_load[3]
     12727 =C2=B1 31%     +82.1%      23173 =C2=B1 22%  sched_debug.cpu#37.=
nr_switches
     12780 =C2=B1 31%     +82.1%      23270 =C2=B1 22%  sched_debug.cpu#37.=
sched_count
      6649 =C2=B1 16%     +90.0%      12633 =C2=B1 22%  sched_debug.cpu#37.=
ttwu_count
      3159 =C2=B1 29%    +209.4%       9774 =C2=B1 23%  sched_debug.cpu#37.=
ttwu_local
     10908 =C2=B1 19%     +91.8%      20917 =C2=B1 14%  sched_debug.cpu#38.=
nr_switches
     10960 =C2=B1 19%     +92.0%      21041 =C2=B1 14%  sched_debug.cpu#38.=
sched_count
      6208 =C2=B1  9%     +88.0%      11671 =C2=B1  5%  sched_debug.cpu#38.=
ttwu_count
      2746 =C2=B1 16%    +200.4%       8251 =C2=B1 13%  sched_debug.cpu#38.=
ttwu_local
      0.50 =C2=B1500%   +1900.0%      10.00 =C2=B1 46%  sched_debug.cpu#39.=
nr_uninterruptible
    856.25 =C2=B1 10%    +121.2%       1893 =C2=B1 19%  sched_debug.cpu#39.=
sched_goidle
      4723 =C2=B1 77%    +113.8%      10100 =C2=B1 25%  sched_debug.cpu#39.=
ttwu_local
     16217 =C2=B1  8%     +71.9%      27872 =C2=B1  7%  sched_debug.cpu#4.n=
r_switches
     16351 =C2=B1  8%    +402.5%      82166 =C2=B1110%  sched_debug.cpu#4.s=
ched_count
      1622 =C2=B1 28%    +133.0%       3780 =C2=B1 31%  sched_debug.cpu#4.s=
ched_goidle
      8710 =C2=B1 13%     +60.4%      13973 =C2=B1 14%  sched_debug.cpu#4.t=
twu_count
      4218 =C2=B1 19%    +158.0%      10883 =C2=B1 18%  sched_debug.cpu#4.t=
twu_local
     13135 =C2=B1 24%    +103.1%      26683 =C2=B1 36%  sched_debug.cpu#40.=
nr_switches
     13188 =C2=B1 24%    +103.3%      26814 =C2=B1 36%  sched_debug.cpu#40.=
sched_count
    898.00 =C2=B1 37%    +335.0%       3906 =C2=B1104%  sched_debug.cpu#40.=
sched_goidle
      7796 =C2=B1 22%     +77.7%      13858 =C2=B1 37%  sched_debug.cpu#40.=
ttwu_count
      4189 =C2=B1 38%    +123.3%       9355 =C2=B1 29%  sched_debug.cpu#40.=
ttwu_local
    928.25 =C2=B1 43%    +315.9%       3860 =C2=B1 84%  sched_debug.cpu#41.=
sched_goidle
     13.00 =C2=B1  7%     -11.5%      11.50 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[0]
     13.00 =C2=B1  7%     -11.5%      11.50 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[1]
     13.00 =C2=B1  7%     -11.5%      11.50 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[2]
     13.00 =C2=B1  7%     -11.5%      11.50 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[3]
     13.00 =C2=B1  7%     -11.5%      11.50 =C2=B1  7%  sched_debug.cpu#42.=
cpu_load[4]
     13848 =C2=B1 11%     +41.7%      19619 =C2=B1  8%  sched_debug.cpu#42.=
nr_switches
      1.00 =C2=B1216%    +350.0%       4.50 =C2=B1 11%  sched_debug.cpu#42.=
nr_uninterruptible
     13908 =C2=B1 11%     +42.0%      19744 =C2=B1  8%  sched_debug.cpu#42.=
sched_count
      7179 =C2=B1 12%     +75.3%      12583 =C2=B1 26%  sched_debug.cpu#42.=
ttwu_count
      3466 =C2=B1 21%    +137.5%       8233 =C2=B1 11%  sched_debug.cpu#42.=
ttwu_local
     18.25 =C2=B1 34%     -37.0%      11.50 =C2=B1  7%  sched_debug.cpu#43.=
cpu_load[1]
     18.00 =C2=B1 33%     -36.1%      11.50 =C2=B1  7%  sched_debug.cpu#43.=
cpu_load[2]
     16.75 =C2=B1 28%     -31.3%      11.50 =C2=B1  7%  sched_debug.cpu#43.=
cpu_load[3]
     15.00 =C2=B1 20%     -23.3%      11.50 =C2=B1  7%  sched_debug.cpu#43.=
cpu_load[4]
      4636 =C2=B1 25%    +110.9%       9777 =C2=B1 36%  sched_debug.cpu#43.=
ttwu_local
     14.00 =C2=B1 17%     -19.6%      11.25 =C2=B1  3%  sched_debug.cpu#44.=
cpu_load[0]
     14.00 =C2=B1 17%     -19.6%      11.25 =C2=B1  3%  sched_debug.cpu#44.=
cpu_load[1]
     13.75 =C2=B1 14%     -18.2%      11.25 =C2=B1  3%  sched_debug.cpu#44.=
cpu_load[2]
     13.75 =C2=B1 14%     -18.2%      11.25 =C2=B1  3%  sched_debug.cpu#44.=
cpu_load[3]
     13.50 =C2=B1 12%     -16.7%      11.25 =C2=B1  3%  sched_debug.cpu#44.=
cpu_load[4]
    762.00 =C2=B1 20%    +106.2%       1571 =C2=B1 10%  sched_debug.cpu#44.=
sched_goidle
      9568 =C2=B1 27%     +45.4%      13910 =C2=B1 40%  sched_debug.cpu#44.=
ttwu_count
    800.75 =C2=B1 24%     +87.2%       1498 =C2=B1  6%  sched_debug.cpu#45.=
sched_goidle
    730.75 =C2=B1 46%    +183.7%       2073 =C2=B1 40%  sched_debug.cpu#46.=
sched_goidle
    832.00 =C2=B1 37%     +90.9%       1588 =C2=B1 15%  sched_debug.cpu#47.=
sched_goidle
      4750 =C2=B1 33%     +85.1%       8792 =C2=B1 25%  sched_debug.cpu#48.=
ttwu_local
    631.00 =C2=B1 21%    +351.7%       2850 =C2=B1 86%  sched_debug.cpu#49.=
sched_goidle
      3372 =C2=B1 41%    +109.5%       7064 =C2=B1  2%  sched_debug.cpu#49.=
ttwu_local
      1519 =C2=B1 25%    +112.0%       3221 =C2=B1 36%  sched_debug.cpu#5.s=
ched_goidle
      4776 =C2=B1 60%    +121.6%      10587 =C2=B1 21%  sched_debug.cpu#5.t=
twu_local
     13591 =C2=B1 32%     +71.4%      23293 =C2=B1 25%  sched_debug.cpu#51.=
nr_switches
     13650 =C2=B1 32%     +71.6%      23419 =C2=B1 25%  sched_debug.cpu#51.=
sched_count
      6506 =C2=B1 16%     +55.5%      10115 =C2=B1 12%  sched_debug.cpu#51.=
ttwu_count
      2954 =C2=B1 33%    +164.2%       7803 =C2=B1 17%  sched_debug.cpu#51.=
ttwu_local
    776.50 =C2=B1 24%    +250.8%       2724 =C2=B1 80%  sched_debug.cpu#52.=
sched_goidle
      6386 =C2=B1 12%     +42.0%       9069 =C2=B1  3%  sched_debug.cpu#53.=
ttwu_count
      3006 =C2=B1 23%    +124.9%       6762 =C2=B1  4%  sched_debug.cpu#53.=
ttwu_local
    680.75 =C2=B1 14%    +106.3%       1404 =C2=B1  4%  sched_debug.cpu#55.=
sched_goidle
     13.25 =C2=B1  9%     -17.0%      11.00 =C2=B1  0%  sched_debug.cpu#56.=
cpu_load[0]
     13.25 =C2=B1  9%     -17.0%      11.00 =C2=B1  0%  sched_debug.cpu#56.=
cpu_load[1]
     12.75 =C2=B1  6%     -13.7%      11.00 =C2=B1  0%  sched_debug.cpu#56.=
cpu_load[2]
     12.75 =C2=B1  6%     -13.7%      11.00 =C2=B1  0%  sched_debug.cpu#56.=
cpu_load[3]
      1.50 =C2=B1137%    +483.3%       8.75 =C2=B1 62%  sched_debug.cpu#56.=
nr_uninterruptible
     14336 =C2=B1 12%    +283.8%      55024 =C2=B1 67%  sched_debug.cpu#57.=
nr_switches
     14394 =C2=B1 12%    +283.0%      55136 =C2=B1 66%  sched_debug.cpu#57.=
sched_count
    999.75 =C2=B1 52%   +1348.4%      14480 =C2=B1 94%  sched_debug.cpu#57.=
sched_goidle
      9116 =C2=B1  9%    +263.6%      33144 =C2=B1 51%  sched_debug.cpu#57.=
ttwu_count
      4309 =C2=B1 12%    +502.2%      25947 =C2=B1 71%  sched_debug.cpu#57.=
ttwu_local
      2.00 =C2=B1 70%    +187.5%       5.75 =C2=B1 31%  sched_debug.cpu#58.=
nr_uninterruptible
    865.75 =C2=B1 33%    +116.2%       1871 =C2=B1 35%  sched_debug.cpu#58.=
sched_goidle
     11726 =C2=B1 10%    +193.4%      34400 =C2=B1 50%  sched_debug.cpu#59.=
nr_switches
     11795 =C2=B1 10%    +192.6%      34514 =C2=B1 50%  sched_debug.cpu#59.=
sched_count
    687.00 =C2=B1 23%    +654.3%       5181 =C2=B1120%  sched_debug.cpu#59.=
sched_goidle
      6678 =C2=B1 13%    +146.4%      16456 =C2=B1 40%  sched_debug.cpu#59.=
ttwu_count
      3125 =C2=B1 22%    +290.9%      12219 =C2=B1 36%  sched_debug.cpu#59.=
ttwu_local
      1268 =C2=B1 14%    +141.2%       3060 =C2=B1 53%  sched_debug.cpu#6.s=
ched_goidle
     14491 =C2=B1  8%     +87.3%      27139 =C2=B1 46%  sched_debug.cpu#60.=
nr_switches
     14550 =C2=B1  8%     +92.5%      28010 =C2=B1 44%  sched_debug.cpu#60.=
sched_count
      4483 =C2=B1 32%    +164.9%      11875 =C2=B1 50%  sched_debug.cpu#60.=
ttwu_local
     11918 =C2=B1  9%    +106.7%      24632 =C2=B1 31%  sched_debug.cpu#61.=
nr_switches
     11983 =C2=B1  9%    +106.4%      24734 =C2=B1 30%  sched_debug.cpu#61.=
sched_count
    718.25 =C2=B1 23%    +495.6%       4277 =C2=B1 79%  sched_debug.cpu#61.=
sched_goidle
      6236 =C2=B1 11%     +63.5%      10193 =C2=B1 10%  sched_debug.cpu#61.=
ttwu_count
      2772 =C2=B1 20%    +185.7%       7921 =C2=B1 12%  sched_debug.cpu#61.=
ttwu_local
      2.50 =C2=B1 34%    +170.0%       6.75 =C2=B1 48%  sched_debug.cpu#62.=
nr_uninterruptible
    723.75 =C2=B1 28%    +209.8%       2242 =C2=B1 70%  sched_debug.cpu#62.=
sched_goidle
      4401 =C2=B1 33%    +103.0%       8932 =C2=B1 11%  sched_debug.cpu#62.=
ttwu_local
    776124 =C2=B1 10%     +15.9%     899771 =C2=B1  5%  sched_debug.cpu#63.=
avg_idle
      2.25 =C2=B1 65%    +177.8%       6.25 =C2=B1 70%  sched_debug.cpu#63.=
nr_uninterruptible
     18241 =C2=B1 22%     +68.8%      30785 =C2=B1 26%  sched_debug.cpu#7.n=
r_switches
     18904 =C2=B1 26%     +67.0%      31571 =C2=B1 25%  sched_debug.cpu#7.s=
ched_count
      1360 =C2=B1 18%    +162.5%       3571 =C2=B1 49%  sched_debug.cpu#7.s=
ched_goidle
      9892 =C2=B1 25%     +56.6%      15490 =C2=B1 22%  sched_debug.cpu#7.t=
twu_count
      5812 =C2=B1 44%    +103.6%      11832 =C2=B1 33%  sched_debug.cpu#7.t=
twu_local
    724009 =C2=B1  6%     +23.9%     897255 =C2=B1  3%  sched_debug.cpu#8.a=
vg_idle
     55.50 =C2=B1132%     -81.1%      10.50 =C2=B1 15%  sched_debug.cpu#9.l=
oad

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  nhm-white/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/shel=
l8

commit: =

  cd126afe838d7ea9b971cdea087fd498a7293c7f
  9d89c257dfb9c51a532d69397f6eed75e5168c35

cd126afe838d7ea9 9d89c257dfb9c51a532d69397f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     10302 =C2=B1  0%     -13.5%       8914 =C2=B1  0%  unixbench.score
   5955533 =C2=B1  2%     -61.3%    2303969 =C2=B1  3%  unixbench.time.invo=
luntary_context_switches
 2.095e+08 =C2=B1  0%     -20.7%  1.662e+08 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    578.70 =C2=B1  2%     -29.2%     409.90 =C2=B1  1%  unixbench.time.perc=
ent_of_cpu_this_job_got
      1355 =C2=B1  0%     -28.0%     976.42 =C2=B1  0%  unixbench.time.syst=
em_time
    854.50 =C2=B1  0%     -31.8%     582.93 =C2=B1  0%  unixbench.time.user=
_time
   6507138 =C2=B1  0%     -22.7%    5030094 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    122633 =C2=B1  1%     -10.3%     109946 =C2=B1  1%  meminfo.Committed_AS
    934.33 =C2=B1  7%     +73.6%       1621 =C2=B1  4%  uptime.idle
     62413 =C2=B1  3%     -29.8%      43813 =C2=B1  4%  vmstat.system.cs
     19202 =C2=B1  5%     -24.3%      14534 =C2=B1  6%  vmstat.system.in
    781745 =C2=B1  0%     -32.9%     524570 =C2=B1  0%  softirqs.RCU
    469088 =C2=B1  0%     -41.4%     274726 =C2=B1  0%  softirqs.SCHED
   1133209 =C2=B1  0%     -27.6%     819920 =C2=B1  0%  softirqs.TIMER
     74.54 =C2=B1  2%     -29.2%      52.81 =C2=B1  1%  turbostat.%Busy
      2177 =C2=B1  2%     -29.1%       1542 =C2=B1  1%  turbostat.Avg_MHz
     14.13 =C2=B1  2%     +57.8%      22.30 =C2=B1  1%  turbostat.CPU%c1
      6.13 =C2=B1  1%    +198.7%      18.30 =C2=B1  1%  turbostat.CPU%c3
   5955533 =C2=B1  2%     -61.3%    2303969 =C2=B1  3%  time.involuntary_co=
ntext_switches
 2.095e+08 =C2=B1  0%     -20.7%  1.662e+08 =C2=B1  0%  time.minor_page_fau=
lts
    578.70 =C2=B1  2%     -29.2%     409.90 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
      1355 =C2=B1  0%     -28.0%     976.42 =C2=B1  0%  time.system_time
    854.50 =C2=B1  0%     -31.8%     582.93 =C2=B1  0%  time.user_time
   6507138 =C2=B1  0%     -22.7%    5030094 =C2=B1  0%  time.voluntary_cont=
ext_switches
  45073436 =C2=B1  1%     -41.8%   26229746 =C2=B1  3%  cpuidle.C1-NHM.time
  70337212 =C2=B1  0%     -80.7%   13583628 =C2=B1  2%  cpuidle.C1E-NHM.time
    453832 =C2=B1  1%     -84.6%      69757 =C2=B1  0%  cpuidle.C1E-NHM.usa=
ge
 4.916e+08 =C2=B1  0%     +71.1%  8.408e+08 =C2=B1  0%  cpuidle.C3-NHM.time
   2284788 =C2=B1  0%     -14.3%    1959002 =C2=B1  0%  cpuidle.C3-NHM.usage
 1.821e+08 =C2=B1 46%    +210.2%  5.648e+08 =C2=B1  7%  cpuidle.C6-NHM.time
     69749 =C2=B1  5%    +550.8%     453952 =C2=B1  0%  cpuidle.C6-NHM.usage
     30100 =C2=B1  9%     -35.8%      19310 =C2=B1 15%  cpuidle.POLL.usage
 1.782e+08 =C2=B1  0%     -20.6%  1.415e+08 =C2=B1  0%  proc-vmstat.numa_hit
 1.782e+08 =C2=B1  0%     -20.6%  1.415e+08 =C2=B1  0%  proc-vmstat.numa_lo=
cal
    756372 =C2=B1  0%     -20.6%     600444 =C2=B1  0%  proc-vmstat.pgactiv=
ate
  95559609 =C2=B1  0%     -20.5%   75996792 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
  94529168 =C2=B1  0%     -20.6%   75034219 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 2.097e+08 =C2=B1  0%     -20.6%  1.664e+08 =C2=B1  0%  proc-vmstat.pgfault
 1.901e+08 =C2=B1  0%     -20.5%   1.51e+08 =C2=B1  0%  proc-vmstat.pgfree
      8401 =C2=B1  1%     -21.0%       6638 =C2=B1  1%  proc-vmstat.thp_fau=
lt_alloc
      9624 =C2=B1  8%     -53.9%       4441 =C2=B1  2%  latency_stats.hits.=
call_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_=
64_fastpath
     12325 =C2=B1  4%     -65.7%       4225 =C2=B1  4%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.=
flush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS=
_execve.return_from_execve
   1581376 =C2=B1  0%     -19.5%    1273582 =C2=B1  0%  latency_stats.hits.=
do_wait.SyS_wait4.entry_SYSCALL_64_fastpath
   2212436 =C2=B1  0%     -29.0%    1570869 =C2=B1  0%  latency_stats.hits.=
pipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    149566 =C2=B1  0%     -36.9%      94312 =C2=B1  0%  latency_stats.hits.=
sigsuspend.SyS_rt_sigsuspend.entry_SYSCALL_64_fastpath
     19012 =C2=B1  2%     -46.3%      10214 =C2=B1  1%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     13195 =C2=B1  3%     -47.0%       6996 =C2=B1  3%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clea=
r_user.padzero.load_elf_binary
   1678783 =C2=B1  6%     -84.9%     253974 =C2=B1 16%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process._do_fork.SyS_clone.entry_SYSCALL_6=
4_fastpath
  14069357 =C2=B1  8%     -83.7%    2298659 =C2=B1 25%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execveat_common.SyS_=
execve.return_from_execve
    140800 =C2=B1 17%     -86.1%      19546 =C2=B1 64%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.load_script.search_bina=
ry_handler.do_execveat_common.SyS_execve
    394027 =C2=B1  8%     -78.1%      86159 =C2=B1 25%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry=
_SYSCALL_64_fastpath
     47717 =C2=B1 33%     -85.9%       6726 =C2=B1122%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.elf_map.load_elf_binary.search_binary_handler.do_execveat_c=
ommon.SyS_execve.return_from_execve
    192443 =C2=B1 13%     -82.9%      32909 =C2=B1 25%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.mmap_region.do=
_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
     42976 =C2=B1 47%     -92.5%       3221 =C2=B1 51%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.vm_munmap.elf_=
map.load_elf_binary.search_binary_handler.do_execveat_common.SyS_execve.ret=
urn_from_execve
   2038536 =C2=B1  5%     -87.2%     260228 =C2=B1 27%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.entry_SYSCALL_64_fastpath
   1492623 =C2=B1  8%     -81.6%     275212 =C2=B1 32%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.entry_SYSCALL_64_fastpath
   1480956 =C2=B1  9%     -79.8%     299632 =C2=B1 24%  latency_stats.sum.d=
o_unlinkat.SyS_unlinkat.entry_SYSCALL_64_fastpath
 1.755e+09 =C2=B1  0%     -27.7%  1.269e+09 =C2=B1  0%  latency_stats.sum.d=
o_wait.SyS_wait4.entry_SYSCALL_64_fastpath
   6472281 =C2=B1  9%     -74.1%    1676969 =C2=B1 24%  latency_stats.sum.p=
ath_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
 1.264e+09 =C2=B1  0%     -34.1%  8.331e+08 =C2=B1  0%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
    173961 =C2=B1  6%     -86.9%      22867 =C2=B1 23%  latency_stats.sum.p=
ipe_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
 2.108e+08 =C2=B1  0%     -25.1%  1.579e+08 =C2=B1  0%  latency_stats.sum.s=
igsuspend.SyS_rt_sigsuspend.entry_SYSCALL_64_fastpath
     56528 =C2=B1  2%     -36.9%      35674 =C2=B1  1%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     37433 =C2=B1  3%     -36.9%      23625 =C2=B1  2%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clear=
_user.padzero.load_elf_binary
   6707408 =C2=B1 10%     -82.0%    1210257 =C2=B1 39%  latency_stats.sum.w=
alk_component.path_lookupat.filename_lookup.user_path_at_empty.SyS_access.e=
ntry_SYSCALL_64_fastpath
     29001 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
    118105 =C2=B1  5%     -27.6%      85517 =C2=B1  3%  sched_debug.cfs_rq[=
0]:/.exec_clock
   1684875 =C2=B1  5%     -38.7%    1032590 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     99.30 =C2=B1 21%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
    241258 =C2=B1  3%     -99.7%     650.00 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     29202 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
      1939 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     30413 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
    117061 =C2=B1  4%     -28.1%      84218 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.exec_clock
   1707460 =C2=B1  4%     -41.5%     999572 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      5.20 =C2=B1 39%    +138.5%      12.40 =C2=B1 20%  sched_debug.cfs_rq[=
1]:/.nr_spread_over
    101.80 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
    240429 =C2=B1  3%     -99.7%     650.70 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
     30615 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
      2052 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
     29002 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.blocked_load_avg
    116040 =C2=B1  4%     -26.9%      84858 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.exec_clock
   1695135 =C2=B1  4%     -39.7%    1022558 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    109.40 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    240427 =C2=B1  3%     -99.7%     651.90 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     29190 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
      2344 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
     31125 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
    115064 =C2=B1  5%     -27.1%      83915 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.exec_clock
   1681269 =C2=B1  6%     -39.5%    1016699 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.min_vruntime
     88.00 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    240175 =C2=B1  3%     -99.7%     653.10 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
     31293 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
      1670 =C2=B1 52%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
     29324 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
    116474 =C2=B1  4%     -37.8%      72400 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.exec_clock
   1686235 =C2=B1  4%     -67.4%     550135 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     86.20 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
      1332 =C2=B14263%  -36297.8%    -482470 =C2=B1 -6%  sched_debug.cfs_rq=
[4]:/.spread0
    239903 =C2=B1  3%     -99.7%     654.40 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     29490 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      2091 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
     29687 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
    115814 =C2=B1  3%     -37.9%      71965 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.exec_clock
   1695083 =C2=B1  4%     -68.0%     542169 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    105.60 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
     10177 =C2=B1612%   -4918.9%    -490438 =C2=B1 -5%  sched_debug.cfs_rq[=
5]:/.spread0
    239182 =C2=B1  3%     -99.7%     654.40 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
     29848 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
      2134 =C2=B1 46%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
     29457 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
    114721 =C2=B1  3%     -36.9%      72352 =C2=B1  0%  sched_debug.cfs_rq[=
6]:/.exec_clock
   1678277 =C2=B1  4%     -67.8%     540714 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    100.40 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
     -6632 =C2=B1-1113%   +7316.4%    -491903 =C2=B1 -5%  sched_debug.cfs_r=
q[6]:/.spread0
    238971 =C2=B1  3%     -99.7%     654.00 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
     29570 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      2289 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
     30366 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
    114743 =C2=B1  4%     -36.9%      72394 =C2=B1  0%  sched_debug.cfs_rq[=
7]:/.exec_clock
   1680695 =C2=B1  5%     -68.0%     538391 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
     88.90 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
     -4217 =C2=B1-1774%  +11618.1%    -494233 =C2=B1 -5%  sched_debug.cfs_r=
q[7]:/.spread0
    238301 =C2=B1  3%     -99.7%     654.00 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     30501 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
      2197 =C2=B1 51%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
     94.00 =C2=B1 22%     -46.6%      50.20 =C2=B1 19%  sched_debug.cpu#0.c=
pu_load[0]
    100.20 =C2=B1 19%     -52.6%      47.50 =C2=B1 17%  sched_debug.cpu#0.c=
pu_load[1]
    100.10 =C2=B1 15%     -54.1%      45.90 =C2=B1 16%  sched_debug.cpu#0.c=
pu_load[2]
     97.80 =C2=B1 11%     -53.5%      45.50 =C2=B1 15%  sched_debug.cpu#0.c=
pu_load[3]
     96.30 =C2=B1  8%     -51.1%      47.10 =C2=B1 11%  sched_debug.cpu#0.c=
pu_load[4]
    169950 =C2=B1  2%      -9.0%     154689 =C2=B1  2%  sched_debug.cpu#0.n=
r_load_updates
     94.90 =C2=B1 25%     -40.4%      56.60 =C2=B1 20%  sched_debug.cpu#1.c=
pu_load[0]
     99.40 =C2=B1 18%     -48.9%      50.80 =C2=B1 19%  sched_debug.cpu#1.c=
pu_load[1]
    103.40 =C2=B1 13%     -53.4%      48.20 =C2=B1 13%  sched_debug.cpu#1.c=
pu_load[2]
    102.80 =C2=B1  9%     -52.3%      49.00 =C2=B1  9%  sched_debug.cpu#1.c=
pu_load[3]
    100.50 =C2=B1  5%     -49.8%      50.50 =C2=B1  7%  sched_debug.cpu#1.c=
pu_load[4]
    168272 =C2=B1  2%     -10.2%     151061 =C2=B1  0%  sched_debug.cpu#1.n=
r_load_updates
     90.00 =C2=B1 21%     -41.2%      52.90 =C2=B1 28%  sched_debug.cpu#2.c=
pu_load[0]
     95.20 =C2=B1 18%     -50.7%      46.90 =C2=B1 20%  sched_debug.cpu#2.c=
pu_load[1]
     97.70 =C2=B1 13%     -53.6%      45.30 =C2=B1 16%  sched_debug.cpu#2.c=
pu_load[2]
     98.70 =C2=B1  9%     -54.0%      45.40 =C2=B1 13%  sched_debug.cpu#2.c=
pu_load[3]
     97.80 =C2=B1  7%     -52.9%      46.10 =C2=B1 10%  sched_debug.cpu#2.c=
pu_load[4]
     11420 =C2=B1 23%     -50.7%       5631 =C2=B1 68%  sched_debug.cpu#2.c=
urr->pid
    168956 =C2=B1  2%     -11.3%     149893 =C2=B1  0%  sched_debug.cpu#2.n=
r_load_updates
    363049 =C2=B1  9%     +29.9%     471436 =C2=B1 19%  sched_debug.cpu#3.a=
vg_idle
    131.70 =C2=B1 39%     -55.6%      58.50 =C2=B1 21%  sched_debug.cpu#3.c=
pu_load[0]
    119.70 =C2=B1 24%     -55.4%      53.40 =C2=B1 19%  sched_debug.cpu#3.c=
pu_load[1]
    112.00 =C2=B1 14%     -54.5%      51.00 =C2=B1 16%  sched_debug.cpu#3.c=
pu_load[2]
    107.40 =C2=B1  7%     -53.7%      49.70 =C2=B1 12%  sched_debug.cpu#3.c=
pu_load[3]
    103.50 =C2=B1  4%     -52.2%      49.50 =C2=B1 10%  sched_debug.cpu#3.c=
pu_load[4]
    168022 =C2=B1  2%     -10.2%     150822 =C2=B1  1%  sched_debug.cpu#3.n=
r_load_updates
    377067 =C2=B1 15%     +59.0%     599434 =C2=B1 17%  sched_debug.cpu#4.a=
vg_idle
     94.30 =C2=B1 20%     -43.2%      53.60 =C2=B1 28%  sched_debug.cpu#4.c=
pu_load[0]
     92.00 =C2=B1 13%     -44.5%      51.10 =C2=B1 17%  sched_debug.cpu#4.c=
pu_load[1]
     92.60 =C2=B1 10%     -47.6%      48.50 =C2=B1 12%  sched_debug.cpu#4.c=
pu_load[2]
     93.40 =C2=B1  8%     -49.1%      47.50 =C2=B1  9%  sched_debug.cpu#4.c=
pu_load[3]
     93.60 =C2=B1  7%     -49.8%      47.00 =C2=B1  9%  sched_debug.cpu#4.c=
pu_load[4]
    165980 =C2=B1  2%     -29.0%     117920 =C2=B1  1%  sched_debug.cpu#4.n=
r_load_updates
    985189 =C2=B1  8%     -49.3%     499002 =C2=B1 22%  sched_debug.cpu#4.n=
r_switches
    985798 =C2=B1  8%     -49.4%     499213 =C2=B1 22%  sched_debug.cpu#4.s=
ched_count
    412531 =C2=B1 10%     -42.0%     239183 =C2=B1 24%  sched_debug.cpu#4.t=
twu_count
    395511 =C2=B1  9%     +62.2%     641346 =C2=B1  8%  sched_debug.cpu#5.a=
vg_idle
     95.80 =C2=B1 18%     -38.7%      58.70 =C2=B1 15%  sched_debug.cpu#5.c=
pu_load[1]
     94.70 =C2=B1 10%     -42.4%      54.50 =C2=B1 13%  sched_debug.cpu#5.c=
pu_load[2]
     91.70 =C2=B1  9%     -44.4%      51.00 =C2=B1 12%  sched_debug.cpu#5.c=
pu_load[3]
     89.70 =C2=B1  9%     -45.4%      49.00 =C2=B1 11%  sched_debug.cpu#5.c=
pu_load[4]
    166338 =C2=B1  2%     -27.0%     121426 =C2=B1  4%  sched_debug.cpu#5.n=
r_load_updates
    159.10 =C2=B1 21%    +109.1%     332.60 =C2=B1 26%  sched_debug.cpu#5.n=
r_uninterruptible
    454556 =C2=B1 15%     +58.3%     719743 =C2=B1 13%  sched_debug.cpu#6.a=
vg_idle
    105.10 =C2=B1 23%     -43.5%      59.40 =C2=B1 27%  sched_debug.cpu#6.c=
pu_load[1]
    105.50 =C2=B1 17%     -48.0%      54.90 =C2=B1 21%  sched_debug.cpu#6.c=
pu_load[2]
    102.70 =C2=B1 13%     -49.8%      51.60 =C2=B1 15%  sched_debug.cpu#6.c=
pu_load[3]
     98.80 =C2=B1  9%     -48.7%      50.70 =C2=B1 13%  sched_debug.cpu#6.c=
pu_load[4]
    167184 =C2=B1  2%     -28.7%     119223 =C2=B1  2%  sched_debug.cpu#6.n=
r_load_updates
    182.60 =C2=B1 33%     +52.7%     278.80 =C2=B1 14%  sched_debug.cpu#6.n=
r_uninterruptible
    410998 =C2=B1 17%     +57.2%     646093 =C2=B1 12%  sched_debug.cpu#7.a=
vg_idle
     97.00 =C2=B1 35%     -44.1%      54.20 =C2=B1 21%  sched_debug.cpu#7.c=
pu_load[0]
    103.20 =C2=B1 27%     -50.8%      50.80 =C2=B1 18%  sched_debug.cpu#7.c=
pu_load[1]
    100.00 =C2=B1 22%     -50.7%      49.30 =C2=B1 14%  sched_debug.cpu#7.c=
pu_load[2]
     97.20 =C2=B1 16%     -50.4%      48.20 =C2=B1 12%  sched_debug.cpu#7.c=
pu_load[3]
     95.40 =C2=B1 11%     -49.9%      47.80 =C2=B1 12%  sched_debug.cpu#7.c=
pu_load[4]
    167383 =C2=B1  2%     -27.4%     121501 =C2=B1  3%  sched_debug.cpu#7.n=
r_load_updates
    158.30 =C2=B1 40%     +92.1%     304.10 =C2=B1 21%  sched_debug.cpu#7.n=
r_uninterruptible

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  lkp-sbx04/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/=
performance/sched_yield

commit: =

  cd126afe838d7ea9b971cdea087fd498a7293c7f
  9d89c257dfb9c51a532d69397f6eed75e5168c35

cd126afe838d7ea9 9d89c257dfb9c51a532d69397f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5708111 =C2=B1  0%      +5.7%    6033388 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   5689577 =C2=B1  0%      +6.2%    6045150 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    336805 =C2=B1 14%   +6264.8%   21436998 =C2=B1  2%  will-it-scale.time.=
involuntary_context_switches
    406.78 =C2=B1  0%      +6.2%     432.20 =C2=B1  0%  will-it-scale.time.=
user_time
    269531 =C2=B1 11%     +46.6%     395170 =C2=B1  3%  cpuidle.C1-SNB.usage
     25299 =C2=B1  5%     -30.8%      17509 =C2=B1  4%  latency_stats.sum.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.path_openat.do_=
filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
     20735 =C2=B1 16%     -31.8%      14146 =C2=B1 19%  proc-vmstat.pgalloc=
_dma32
   1107556 =C2=B1  4%     -14.3%     949023 =C2=B1  5%  softirqs.RCU
    336805 =C2=B1 14%   +6264.8%   21436998 =C2=B1  2%  time.involuntary_co=
ntext_switches
      4980 =C2=B1  4%   +2408.4%     124923 =C2=B1  2%  vmstat.system.cs
     83657 =C2=B1 17%     -32.8%      56252 =C2=B1 25%  numa-numastat.node0=
.local_node
     83696 =C2=B1 17%     -32.7%      56303 =C2=B1 25%  numa-numastat.node0=
.numa_hit
    243104 =C2=B1  2%     +39.9%     340158 =C2=B1 13%  numa-meminfo.node0.=
MemUsed
    926.00 =C2=B1 16%     +33.3%       1234 =C2=B1  7%  numa-meminfo.node0.=
PageTables
      7018 =C2=B1 22%     -40.5%       4178 =C2=B1 21%  numa-meminfo.node1.=
AnonPages
    347547 =C2=B1  1%     -36.1%     221978 =C2=B1  1%  numa-meminfo.node1.=
MemUsed
      1.11 =C2=B1  0%     -53.3%       0.52 =C2=B1  2%  perf-profile.cpu-cy=
cles.check_cfs_rq_runtime.__schedule.schedule.sys_sched_yield.entry_SYSCALL=
_64_fastpath
      0.84 =C2=B1  3%     +25.3%       1.05 =C2=B1  1%  perf-profile.cpu-cy=
cles.clear_buddies.pick_next_entity.pick_next_task_fair.__schedule.schedule
     10.55 =C2=B1  0%     -22.6%       8.17 =C2=B1  1%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_after_swapgs
      0.53 =C2=B1  3%     +79.6%       0.95 =C2=B1  4%  perf-profile.cpu-cy=
cles.pick_next_entity.__schedule.schedule.sys_sched_yield.entry_SYSCALL_64_=
fastpath
      5.63 =C2=B1  1%      +9.9%       6.19 =C2=B1  1%  perf-profile.cpu-cy=
cles.update_rq_clock.part.75.__schedule.schedule.sys_sched_yield.entry_SYSC=
ALL_64_fastpath
    231.50 =C2=B1 16%     +33.3%     308.50 =C2=B1  7%  numa-vmstat.node0.n=
r_page_table_pages
      1754 =C2=B1 22%     -40.5%       1044 =C2=B1 21%  numa-vmstat.node1.n=
r_anon_pages
    226283 =C2=B1  4%     -34.6%     147943 =C2=B1  4%  numa-vmstat.node1.n=
uma_hit
    215797 =C2=B1  5%     -50.3%     107282 =C2=B1  6%  numa-vmstat.node1.n=
uma_local
     10486 =C2=B1 15%    +287.7%      40660 =C2=B1  5%  numa-vmstat.node1.n=
uma_other
    153943 =C2=B1  4%     +45.1%     223373 =C2=B1 11%  numa-vmstat.node2.n=
uma_local
     41681 =C2=B1  4%     -74.1%      10811 =C2=B1 16%  numa-vmstat.node2.n=
uma_other
     85814 =C2=B1  3%     +19.7%     102711 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.exec_clock
   1830805 =C2=B1  3%     +28.1%    2345538 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     18.00 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
     12499 =C2=B1  9%     -92.7%     910.00 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
     66.75 =C2=B1107%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
    581.25 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
     16.25 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
   -206248 =C2=B1-32%    +216.7%    -653203 =C2=B1-14%  sched_debug.cfs_rq[=
10]:/.spread0
     12306 =C2=B1  8%     -92.7%     902.25 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    375.50 =C2=B1164%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
    536.00 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
    129.75 =C2=B1 95%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
     15.50 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
   -245004 =C2=B1-52%    +162.0%    -641880 =C2=B1-14%  sched_debug.cfs_rq[=
11]:/.spread0
     12294 =C2=B1  8%     -92.7%     901.50 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
    145.75 =C2=B1 84%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    538.50 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
     75.00 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
      3.25 =C2=B1 39%     -69.2%       1.00 =C2=B1 70%  sched_debug.cfs_rq[=
12]:/.nr_spread_over
     14.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
   -189686 =C2=B1-41%    +241.3%    -647423 =C2=B1-14%  sched_debug.cfs_rq[=
12]:/.spread0
     12287 =C2=B1  8%     -92.7%     901.50 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
     90.50 =C2=B1 76%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
     68.50 =C2=B1168%     -99.3%       0.50 =C2=B1173%  sched_debug.cfs_rq[=
13]:/.nr_spread_over
     18.50 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
   -208180 =C2=B1-33%    +173.0%    -568326 =C2=B1-16%  sched_debug.cfs_rq[=
13]:/.spread0
     12274 =C2=B1  8%     -92.7%     901.75 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
     90.50 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    591.75 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
     15.50 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
   -204086 =C2=B1-35%    +214.3%    -641401 =C2=B1-14%  sched_debug.cfs_rq[=
14]:/.spread0
     12265 =C2=B1  8%     -92.7%     901.00 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    143.50 =C2=B1121%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
    553.75 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
    112.00 =C2=B1 87%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.blocked_load_avg
     15.75 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
   -207598 =C2=B1-33%    +208.1%    -639601 =C2=B1-15%  sched_debug.cfs_rq[=
15]:/.spread0
     12145 =C2=B1  9%     -92.6%     900.50 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
    128.25 =C2=B1 75%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    553.75 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
      2.75 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
   -744573 =C2=B1 -9%     +61.6%   -1203410 =C2=B1 -8%  sched_debug.cfs_rq[=
16]:/.spread0
     12105 =C2=B1  9%     -92.6%     899.25 =C2=B1  1%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
     26.00 =C2=B1124%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
    207.75 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
    155.00 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
     28325 =C2=B1  0%     +25.1%      35435 =C2=B1 11%  sched_debug.cfs_rq[=
17]:/.exec_clock
   1085134 =C2=B1  0%     +19.1%    1292713 =C2=B1  9%  sched_debug.cfs_rq[=
17]:/.min_vruntime
      2.75 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
   -745757 =C2=B1 -9%     +41.2%   -1052932 =C2=B1-13%  sched_debug.cfs_rq[=
17]:/.spread0
     11988 =C2=B1  9%     -92.5%     899.25 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    158.50 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    212.75 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
     11.50 =C2=B1143%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.runnable_load_avg
   -743959 =C2=B1 -8%     +61.8%   -1203838 =C2=B1 -7%  sched_debug.cfs_rq[=
18]:/.spread0
     11812 =C2=B1 10%     -92.4%     899.00 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
    693.50 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
    293.50 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
      9.00 =C2=B1 84%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
   -747950 =C2=B1 -9%     +50.9%   -1128474 =C2=B1 -9%  sched_debug.cfs_rq[=
19]:/.spread0
     11738 =C2=B1  9%     -92.3%     903.50 =C2=B1  2%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
    229.00 =C2=B1 65%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
    284.50 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
    390.75 =C2=B1152%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
     16.50 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
    -84304 =C2=B1-74%    +508.0%    -512562 =C2=B1-16%  sched_debug.cfs_rq[=
1]:/.spread0
     12422 =C2=B1  9%     -92.7%     909.50 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    407.75 =C2=B1145%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    509.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
    169.75 =C2=B1 36%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
      2.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
   -747515 =C2=B1 -8%     +66.8%   -1247221 =C2=B1-12%  sched_debug.cfs_rq[=
20]:/.spread0
     11776 =C2=B1 10%     -92.3%     903.00 =C2=B1  2%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
    172.75 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
    169.25 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
    309.50 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.blocked_load_avg
      3.50 =C2=B1 74%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
   -748659 =C2=B1 -9%     +60.0%   -1197541 =C2=B1 -7%  sched_debug.cfs_rq[=
21]:/.spread0
     11772 =C2=B1 10%     -92.3%     902.50 =C2=B1  2%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
    313.50 =C2=B1 28%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
    210.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.utilization_load_avg
    196.00 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.blocked_load_avg
      3.00 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
   -747278 =C2=B1 -9%     +61.5%   -1206948 =C2=B1 -8%  sched_debug.cfs_rq[=
22]:/.spread0
     11739 =C2=B1 10%     -92.3%     902.50 =C2=B1  2%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
    199.50 =C2=B1 49%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
    212.25 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.utilization_load_avg
      2.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
   -745167 =C2=B1 -9%     +61.5%   -1203354 =C2=B1 -8%  sched_debug.cfs_rq[=
23]:/.spread0
     11729 =C2=B1 10%     -92.3%     902.50 =C2=B1  2%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
    162.00 =C2=B1148%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
    169.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
      7.50 =C2=B1127%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
  -1016962 =C2=B1 -7%     +46.3%   -1487393 =C2=B1 -6%  sched_debug.cfs_rq[=
24]:/.spread0
     11711 =C2=B1 10%     -92.3%     902.00 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
    544.25 =C2=B1123%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
    249.25 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.utilization_load_avg
    384.75 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
    810996 =C2=B1  0%     +16.1%     941324 =C2=B1 11%  sched_debug.cfs_rq[=
25]:/.min_vruntime
      2.50 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
  -1019931 =C2=B1 -7%     +37.7%   -1404391 =C2=B1-10%  sched_debug.cfs_rq[=
25]:/.spread0
     11707 =C2=B1 10%     -92.3%     901.25 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
    394.50 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
    171.75 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
    373.50 =C2=B1 77%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.blocked_load_avg
      3.00 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
  -1136764 =C2=B1 -8%     +30.4%   -1482336 =C2=B1 -6%  sched_debug.cfs_rq[=
26]:/.spread0
     11709 =C2=B1 10%     -92.3%     901.50 =C2=B1  2%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
    385.00 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
    210.75 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
    244.25 =C2=B1 51%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.blocked_load_avg
      6.00 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
  -1140126 =C2=B1 -8%     +30.2%   -1484238 =C2=B1 -7%  sched_debug.cfs_rq[=
27]:/.spread0
     11737 =C2=B1 10%     -92.3%     901.25 =C2=B1  2%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
    251.00 =C2=B1 50%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
    279.00 =C2=B1 42%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
      9.25 =C2=B1117%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
  -1015180 =C2=B1 -6%     +45.6%   -1478408 =C2=B1 -6%  sched_debug.cfs_rq[=
28]:/.spread0
     11651 =C2=B1  9%     -92.3%     901.50 =C2=B1  2%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
    361.00 =C2=B1157%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
    336.50 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
    426.50 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.blocked_load_avg
      6.00 =C2=B1 88%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
  -1017497 =C2=B1 -7%     +38.2%   -1405820 =C2=B1 -7%  sched_debug.cfs_rq[=
29]:/.spread0
     11117 =C2=B1  7%     -91.9%     901.50 =C2=B1  2%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
    432.75 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
    249.75 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
     17.25 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    -85950 =C2=B1-76%    +496.6%    -512790 =C2=B1-18%  sched_debug.cfs_rq[=
2]:/.spread0
     12409 =C2=B1  9%     -92.7%     909.25 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     34.75 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
    538.00 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
    140.25 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.blocked_load_avg
      3.00 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
  -1138799 =C2=B1-11%     +30.1%   -1482037 =C2=B1 -7%  sched_debug.cfs_rq[=
30]:/.spread0
     11103 =C2=B1  7%     -91.9%     900.50 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
    143.50 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
    184.75 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
    216.50 =C2=B1 65%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
    751671 =C2=B1 13%     +46.2%    1098875 =C2=B1 22%  sched_debug.cfs_rq[=
31]:/.min_vruntime
      2.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
     11142 =C2=B1  7%     -91.9%     900.50 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
    219.00 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
    169.25 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
     86537 =C2=B1  2%     -19.1%      69997 =C2=B1  4%  sched_debug.cfs_rq[=
32]:/.exec_clock
     29.00 =C2=B1  0%     -10.3%      26.00 =C2=B1  0%  sched_debug.cfs_rq[=
32]:/.load
     29.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.runnable_load_avg
    130503 =C2=B1124%    -388.6%    -376630 =C2=B1-42%  sched_debug.cfs_rq[=
32]:/.spread0
     11126 =C2=B1  7%     -91.9%     899.75 =C2=B1  2%  sched_debug.cfs_rq[=
32]:/.tg_load_avg
     47.00 =C2=B1 53%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
32]:/.utilization_load_avg
     28.75 =C2=B1  1%      -9.6%      26.00 =C2=B1  0%  sched_debug.cfs_rq[=
33]:/.load
     29.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.runnable_load_avg
    -14840 =C2=B1-435%   +2823.7%    -433893 =C2=B1-21%  sched_debug.cfs_rq=
[33]:/.spread0
     11126 =C2=B1  7%     -91.9%     898.50 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.tg_load_avg
     31.00 =C2=B1 11%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
33]:/.utilization_load_avg
     53.00 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.blocked_load_avg
     29.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.runnable_load_avg
    -14609 =C2=B1-433%   +2871.9%    -434183 =C2=B1-21%  sched_debug.cfs_rq=
[34]:/.spread0
     11126 =C2=B1  7%     -91.9%     898.00 =C2=B1  2%  sched_debug.cfs_rq[=
34]:/.tg_load_avg
     82.00 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
34]:/.utilization_load_avg
     29.00 =C2=B1  0%      -9.5%      26.25 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.load
     29.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
    -12876 =C2=B1-486%   +3265.2%    -433318 =C2=B1-23%  sched_debug.cfs_rq=
[35]:/.spread0
     10776 =C2=B1 10%     -91.7%     896.75 =C2=B1  2%  sched_debug.cfs_rq[=
35]:/.tg_load_avg
    370.00 =C2=B1105%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
35]:/.utilization_load_avg
     28.75 =C2=B1  1%      -9.6%      26.00 =C2=B1  0%  sched_debug.cfs_rq[=
36]:/.load
     28.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.runnable_load_avg
    -14450 =C2=B1-432%   +2855.8%    -427128 =C2=B1-26%  sched_debug.cfs_rq=
[36]:/.spread0
     10756 =C2=B1 11%     -91.7%     896.75 =C2=B1  2%  sched_debug.cfs_rq[=
36]:/.tg_load_avg
     29.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
36]:/.utilization_load_avg
    536.00 =C2=B1119%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.blocked_load_avg
     28.75 =C2=B1  1%      -9.6%      26.00 =C2=B1  0%  sched_debug.cfs_rq[=
37]:/.load
     28.75 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.runnable_load_avg
    -13017 =C2=B1-496%   +3174.1%    -426193 =C2=B1-21%  sched_debug.cfs_rq=
[37]:/.spread0
     10701 =C2=B1 11%     -91.6%     896.50 =C2=B1  2%  sched_debug.cfs_rq[=
37]:/.tg_load_avg
    565.00 =C2=B1113%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
37]:/.utilization_load_avg
     28.75 =C2=B1  1%      -9.6%      26.00 =C2=B1  0%  sched_debug.cfs_rq[=
38]:/.load
     29.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.runnable_load_avg
    -11185 =C2=B1-589%   +3716.0%    -426841 =C2=B1-23%  sched_debug.cfs_rq=
[38]:/.spread0
     10694 =C2=B1 11%     -91.6%     896.75 =C2=B1  2%  sched_debug.cfs_rq[=
38]:/.tg_load_avg
     99.50 =C2=B1 86%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
38]:/.utilization_load_avg
     29.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.runnable_load_avg
    -12986 =C2=B1-480%   +3281.6%    -439171 =C2=B1-20%  sched_debug.cfs_rq=
[39]:/.spread0
     10658 =C2=B1 10%     -91.6%     896.50 =C2=B1  2%  sched_debug.cfs_rq[=
39]:/.tg_load_avg
     29.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
39]:/.utilization_load_avg
     14.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    -84817 =C2=B1-81%    +498.6%    -507739 =C2=B1-18%  sched_debug.cfs_rq[=
3]:/.spread0
     12389 =C2=B1  9%     -92.7%     908.50 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    235.50 =C2=B1134%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
    510.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.runnable_load_avg
   -157092 =C2=B1-43%    +327.3%    -671293 =C2=B1 -8%  sched_debug.cfs_rq[=
40]:/.spread0
     10652 =C2=B1 10%     -91.6%     896.75 =C2=B1  2%  sched_debug.cfs_rq[=
40]:/.tg_load_avg
     44.00 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
40]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.runnable_load_avg
   -104059 =C2=B1-145%    +480.4%    -603925 =C2=B1-15%  sched_debug.cfs_rq=
[41]:/.spread0
     10641 =C2=B1 10%     -91.6%     896.75 =C2=B1  2%  sched_debug.cfs_rq[=
41]:/.tg_load_avg
     93.00 =C2=B1154%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
41]:/.utilization_load_avg
     12.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
   -156978 =C2=B1-42%    +280.2%    -596885 =C2=B1-16%  sched_debug.cfs_rq[=
42]:/.spread0
     10622 =C2=B1 10%     -91.6%     896.75 =C2=B1  2%  sched_debug.cfs_rq[=
42]:/.tg_load_avg
     54.25 =C2=B1130%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.tg_load_contrib
    557.25 =C2=B1 14%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
42]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.runnable_load_avg
   -114415 =C2=B1-44%    +422.4%    -597691 =C2=B1-14%  sched_debug.cfs_rq[=
43]:/.spread0
     10652 =C2=B1 10%     -91.6%     896.00 =C2=B1  2%  sched_debug.cfs_rq[=
43]:/.tg_load_avg
     95.50 =C2=B1155%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
43]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.runnable_load_avg
   -175648 =C2=B1-42%    +247.9%    -611036 =C2=B1-15%  sched_debug.cfs_rq[=
44]:/.spread0
     10625 =C2=B1 10%     -91.6%     896.25 =C2=B1  2%  sched_debug.cfs_rq[=
44]:/.tg_load_avg
     25.50 =C2=B1105%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
44]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.runnable_load_avg
   -156387 =C2=B1-39%    +326.9%    -667546 =C2=B1-27%  sched_debug.cfs_rq[=
45]:/.spread0
     10619 =C2=B1 10%     -91.6%     896.00 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.tg_load_avg
    112.25 =C2=B1150%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
45]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.runnable_load_avg
   -153475 =C2=B1-43%    +293.4%    -603751 =C2=B1-16%  sched_debug.cfs_rq[=
46]:/.spread0
     10617 =C2=B1 10%     -91.6%     896.50 =C2=B1  2%  sched_debug.cfs_rq[=
46]:/.tg_load_avg
    134.25 =C2=B1100%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
46]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.runnable_load_avg
   -156749 =C2=B1-44%    +283.9%    -601738 =C2=B1-15%  sched_debug.cfs_rq[=
47]:/.spread0
     10285 =C2=B1 11%     -91.3%     896.50 =C2=B1  2%  sched_debug.cfs_rq[=
47]:/.tg_load_avg
    127.00 =C2=B1105%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
47]:/.utilization_load_avg
    167.25 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.blocked_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.runnable_load_avg
   -576818 =C2=B1-11%     +81.6%   -1047689 =C2=B1 -9%  sched_debug.cfs_rq[=
48]:/.spread0
     10283 =C2=B1 11%     -91.3%     897.00 =C2=B1  2%  sched_debug.cfs_rq[=
48]:/.tg_load_avg
    178.00 =C2=B1 75%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
48]:/.utilization_load_avg
     14.75 =C2=B1 55%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.runnable_load_avg
   -581542 =C2=B1-11%    +104.3%   -1188157 =C2=B1-16%  sched_debug.cfs_rq[=
49]:/.spread0
     10300 =C2=B1 12%     -91.3%     896.75 =C2=B1  2%  sched_debug.cfs_rq[=
49]:/.tg_load_avg
    175.00 =C2=B1107%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.tg_load_contrib
    553.75 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
49]:/.utilization_load_avg
     68.50 =C2=B1147%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
     15.00 =C2=B1  4%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
    -82735 =C2=B1-87%    +500.3%    -496628 =C2=B1-21%  sched_debug.cfs_rq[=
4]:/.spread0
     12408 =C2=B1  8%     -92.7%     908.50 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     85.25 =C2=B1120%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    510.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
     13.00 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.runnable_load_avg
   -575687 =C2=B1-11%     +82.6%   -1050933 =C2=B1 -8%  sched_debug.cfs_rq[=
50]:/.spread0
     10269 =C2=B1 12%     -91.3%     896.50 =C2=B1  2%  sched_debug.cfs_rq[=
50]:/.tg_load_avg
    288.25 =C2=B1132%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.tg_load_contrib
    553.75 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
50]:/.utilization_load_avg
     17.25 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.runnable_load_avg
   -579761 =C2=B1-11%     +93.6%   -1122454 =C2=B1-17%  sched_debug.cfs_rq[=
51]:/.spread0
     10192 =C2=B1 12%     -91.2%     896.25 =C2=B1  2%  sched_debug.cfs_rq[=
51]:/.tg_load_avg
    142.25 =C2=B1 99%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.tg_load_contrib
    591.50 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
51]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.runnable_load_avg
   -580210 =C2=B1-12%     +72.8%   -1002518 =C2=B1 -9%  sched_debug.cfs_rq[=
52]:/.spread0
     10040 =C2=B1 12%     -91.1%     896.00 =C2=B1  2%  sched_debug.cfs_rq[=
52]:/.tg_load_avg
     14.00 =C2=B1 45%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
52]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.runnable_load_avg
   -580412 =C2=B1-12%     +81.1%   -1051338 =C2=B1 -9%  sched_debug.cfs_rq[=
53]:/.spread0
     10023 =C2=B1 13%     -91.1%     896.00 =C2=B1  2%  sched_debug.cfs_rq[=
53]:/.tg_load_avg
     35.50 =C2=B1 51%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
53]:/.utilization_load_avg
     81.00 =C2=B1131%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.blocked_load_avg
     12.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.runnable_load_avg
   -578566 =C2=B1-11%     +81.1%   -1047756 =C2=B1 -8%  sched_debug.cfs_rq[=
54]:/.spread0
     10023 =C2=B1 13%     -91.1%     895.25 =C2=B1  2%  sched_debug.cfs_rq[=
54]:/.tg_load_avg
     94.00 =C2=B1112%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
    553.75 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
54]:/.utilization_load_avg
      1.00 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
55]:/.nr_spread_over
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.runnable_load_avg
   -581335 =C2=B1-11%     +80.1%   -1046743 =C2=B1 -9%  sched_debug.cfs_rq[=
55]:/.spread0
     10017 =C2=B1 12%     -91.1%     895.50 =C2=B1  2%  sched_debug.cfs_rq[=
55]:/.tg_load_avg
     73.00 =C2=B1119%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
55]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.runnable_load_avg
   -848914 =C2=B1 -7%     +56.0%   -1323921 =C2=B1 -7%  sched_debug.cfs_rq[=
56]:/.spread0
     10018 =C2=B1 12%     -91.1%     895.75 =C2=B1  2%  sched_debug.cfs_rq[=
56]:/.tg_load_avg
     24.75 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
56]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.runnable_load_avg
   -847879 =C2=B1 -7%     +64.7%   -1396622 =C2=B1-10%  sched_debug.cfs_rq[=
57]:/.spread0
      9884 =C2=B1 14%     -90.9%     896.00 =C2=B1  2%  sched_debug.cfs_rq[=
57]:/.tg_load_avg
     88.00 =C2=B1147%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
57]:/.utilization_load_avg
     12.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.runnable_load_avg
   -731871 =C2=B1-23%     +81.6%   -1328762 =C2=B1 -7%  sched_debug.cfs_rq[=
58]:/.spread0
      9825 =C2=B1 15%     -90.9%     896.25 =C2=B1  2%  sched_debug.cfs_rq[=
58]:/.tg_load_avg
     73.75 =C2=B1109%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.tg_load_contrib
    553.50 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
58]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.runnable_load_avg
   -728341 =C2=B1-23%     +82.8%   -1331505 =C2=B1 -6%  sched_debug.cfs_rq[=
59]:/.spread0
      9815 =C2=B1 15%     -90.9%     896.00 =C2=B1  2%  sched_debug.cfs_rq[=
59]:/.tg_load_avg
    111.75 =C2=B1 95%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
59]:/.utilization_load_avg
     14.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
    -82937 =C2=B1-87%    +499.9%    -497576 =C2=B1-16%  sched_debug.cfs_rq[=
5]:/.spread0
     12400 =C2=B1  8%     -92.7%     906.75 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    418.75 =C2=B1143%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
    510.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
     12.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.runnable_load_avg
   -848283 =C2=B1 -7%     +56.8%   -1330397 =C2=B1 -6%  sched_debug.cfs_rq[=
60]:/.spread0
      9819 =C2=B1 15%     -90.9%     896.00 =C2=B1  2%  sched_debug.cfs_rq[=
60]:/.tg_load_avg
    370.25 =C2=B1166%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.tg_load_contrib
    553.75 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
60]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.runnable_load_avg
   -846882 =C2=B1 -7%     +65.3%   -1399867 =C2=B1-12%  sched_debug.cfs_rq[=
61]:/.spread0
      9780 =C2=B1 14%     -90.8%     896.50 =C2=B1  2%  sched_debug.cfs_rq[=
61]:/.tg_load_avg
    163.75 =C2=B1 95%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
61]:/.utilization_load_avg
     24557 =C2=B1 15%     -15.5%      20750 =C2=B1  1%  sched_debug.cfs_rq[=
62]:/.exec_clock
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.runnable_load_avg
   -727151 =C2=B1-20%     +83.2%   -1331922 =C2=B1 -7%  sched_debug.cfs_rq[=
62]:/.spread0
      9620 =C2=B1 12%     -90.7%     894.75 =C2=B1  1%  sched_debug.cfs_rq[=
62]:/.tg_load_avg
     57.50 =C2=B1 93%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.tg_load_contrib
    510.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
62]:/.utilization_load_avg
     10.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.runnable_load_avg
   -788019 =C2=B1-21%     +98.7%   -1566171 =C2=B1-21%  sched_debug.cfs_rq[=
63]:/.spread0
      9167 =C2=B1  6%     -90.2%     894.75 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.tg_load_avg
    112.75 =C2=B1 94%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.tg_load_contrib
    510.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
63]:/.utilization_load_avg
     14.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
    -88350 =C2=B1-73%    +465.6%    -499705 =C2=B1-20%  sched_debug.cfs_rq[=
6]:/.spread0
     12404 =C2=B1  8%     -92.7%     905.75 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
    142.50 =C2=B1110%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    511.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
     14.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
    -83262 =C2=B1-83%    +506.8%    -505195 =C2=B1-18%  sched_debug.cfs_rq[=
7]:/.spread0
     12371 =C2=B1  8%     -92.7%     905.75 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
     32.50 =C2=B1 61%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    510.75 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
     20.75 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
   -205068 =C2=B1-33%    +180.0%    -574232 =C2=B1-35%  sched_debug.cfs_rq[=
8]:/.spread0
     12344 =C2=B1  8%     -92.7%     905.25 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    237.50 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    591.00 =C2=B1 13%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
     39.75 =C2=B1136%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     14.75 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
   -261261 =C2=B1-18%    +146.0%    -642786 =C2=B1-14%  sched_debug.cfs_rq[=
9]:/.spread0
     12318 =C2=B1  8%     -92.7%     903.00 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
     55.00 =C2=B1 98%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
    510.25 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
     88249 =C2=B1  2%     +16.1%     102482 =C2=B1  2%  sched_debug.cpu#0.n=
r_load_updates
     18754 =C2=B1 19%    +507.4%     113906 =C2=B1  9%  sched_debug.cpu#0.n=
r_switches
  4.62e+08 =C2=B1  2%     +33.2%  6.155e+08 =C2=B1  3%  sched_debug.cpu#0.s=
ched_count
      6540 =C2=B1 26%     -41.1%       3849 =C2=B1  6%  sched_debug.cpu#0.s=
ched_goidle
  4.62e+08 =C2=B1  2%     +33.2%  6.154e+08 =C2=B1  3%  sched_debug.cpu#0.y=
ld_count
      5294 =C2=B1 23%   +2000.5%     111210 =C2=B1 24%  sched_debug.cpu#1.n=
r_switches
     11890 =C2=B1 75%   +1091.2%     141641 =C2=B1 21%  sched_debug.cpu#10.=
nr_switches
      8323 =C2=B1 40%   +1568.7%     138892 =C2=B1 13%  sched_debug.cpu#11.=
nr_switches
     14386 =C2=B1 70%    +867.4%     139166 =C2=B1 15%  sched_debug.cpu#12.=
nr_switches
      5131 =C2=B1 45%   +2177.6%     116879 =C2=B1 27%  sched_debug.cpu#13.=
nr_switches
     20970 =C2=B1 73%    +483.9%     122442 =C2=B1 15%  sched_debug.cpu#14.=
nr_switches
      2651 =C2=B1 38%     -44.0%       1484 =C2=B1  9%  sched_debug.cpu#14.=
ttwu_count
      9637 =C2=B1 54%    +837.7%      90375 =C2=B1 33%  sched_debug.cpu#15.=
nr_switches
      4322 =C2=B1 54%     -66.8%       1434 =C2=B1  9%  sched_debug.cpu#15.=
sched_goidle
     14653 =C2=B1 93%    +470.6%      83608 =C2=B1 12%  sched_debug.cpu#16.=
nr_switches
      4342 =C2=B1  8%   +1391.6%      64767 =C2=B1 16%  sched_debug.cpu#17.=
nr_switches
 1.553e+08 =C2=B1  0%     +29.7%  2.015e+08 =C2=B1 17%  sched_debug.cpu#17.=
sched_count
      1898 =C2=B1  8%    +199.9%       5694 =C2=B1 91%  sched_debug.cpu#17.=
sched_goidle
 1.553e+08 =C2=B1  0%     +29.7%  2.015e+08 =C2=B1 17%  sched_debug.cpu#17.=
yld_count
      1989 =C2=B1 17%     +35.4%       2694 =C2=B1 41%  sched_debug.cpu#18.=
curr->pid
     57307 =C2=B1  4%      -7.5%      53012 =C2=B1  6%  sched_debug.cpu#18.=
nr_load_updates
     13418 =C2=B1111%    +657.1%     101597 =C2=B1 18%  sched_debug.cpu#18.=
nr_switches
      7.75 =C2=B1 69%     -71.0%       2.25 =C2=B1 19%  sched_debug.cpu#19.=
cpu_load[1]
      5.75 =C2=B1 51%     -60.9%       2.25 =C2=B1 19%  sched_debug.cpu#19.=
cpu_load[2]
      4.25 =C2=B1 30%     -47.1%       2.25 =C2=B1 19%  sched_debug.cpu#19.=
cpu_load[3]
     30538 =C2=B1 79%    +179.5%      85350 =C2=B1 14%  sched_debug.cpu#19.=
nr_switches
      6195 =C2=B1 69%   +1593.3%     104905 =C2=B1 39%  sched_debug.cpu#2.n=
r_switches
    786.00 =C2=B1 33%     -35.8%     504.25 =C2=B1 50%  sched_debug.cpu#2.t=
twu_local
      1781 =C2=B1  0%     +56.6%       2789 =C2=B1 39%  sched_debug.cpu#20.=
curr->pid
     18240 =C2=B1 79%    +441.3%      98739 =C2=B1 21%  sched_debug.cpu#20.=
nr_switches
     57321 =C2=B1  3%      -6.3%      53721 =C2=B1  3%  sched_debug.cpu#21.=
nr_load_updates
     27124 =C2=B1 86%    +197.7%      80757 =C2=B1 34%  sched_debug.cpu#21.=
nr_switches
     57208 =C2=B1  3%      -6.5%      53497 =C2=B1  3%  sched_debug.cpu#22.=
nr_load_updates
      7192 =C2=B1 83%    +816.5%      65922 =C2=B1 33%  sched_debug.cpu#22.=
nr_switches
    527.00 =C2=B1 14%    +336.9%       2302 =C2=B1 84%  sched_debug.cpu#22.=
ttwu_local
     57237 =C2=B1  3%      -6.7%      53410 =C2=B1  4%  sched_debug.cpu#23.=
nr_load_updates
     10058 =C2=B1 94%    +565.8%      66970 =C2=B1 14%  sched_debug.cpu#23.=
nr_switches
     46353 =C2=B1  4%      -9.3%      42048 =C2=B1  4%  sched_debug.cpu#24.=
nr_load_updates
     10113 =C2=B1 59%    +654.6%      76311 =C2=B1 16%  sched_debug.cpu#24.=
nr_switches
      4729 =C2=B1 62%    +176.1%      13057 =C2=B1 56%  sched_debug.cpu#24.=
sched_goidle
     22940 =C2=B1104%    +230.1%      75718 =C2=B1 39%  sched_debug.cpu#25.=
nr_switches
      8734 =C2=B1 23%    +999.0%      95998 =C2=B1 14%  sched_debug.cpu#26.=
nr_switches
      3814 =C2=B1 27%    +333.1%      16523 =C2=B1 25%  sched_debug.cpu#26.=
sched_goidle
     17041 =C2=B1104%    +567.7%     113788 =C2=B1 15%  sched_debug.cpu#27.=
nr_switches
     49804 =C2=B1  4%     -11.2%      44240 =C2=B1  3%  sched_debug.cpu#28.=
nr_load_updates
     16055 =C2=B1 63%    +489.0%      94570 =C2=B1 25%  sched_debug.cpu#28.=
nr_switches
      7782 =C2=B1 65%    +126.3%      17608 =C2=B1 25%  sched_debug.cpu#28.=
sched_goidle
      9238 =C2=B1 38%   +1301.0%     129431 =C2=B1 41%  sched_debug.cpu#29.=
nr_switches
     -0.50 =C2=B1-830%   +1300.0%      -7.00 =C2=B1-39%  sched_debug.cpu#29=
.nr_uninterruptible
      3935 =C2=B1 48%    +620.9%      28368 =C2=B1 55%  sched_debug.cpu#29.=
sched_goidle
      2546 =C2=B1 48%   +4318.1%     112506 =C2=B1 20%  sched_debug.cpu#3.n=
r_switches
      1883 =C2=B1 24%     -36.9%       1188 =C2=B1 35%  sched_debug.cpu#3.t=
twu_count
      8219 =C2=B1 53%    +703.6%      66051 =C2=B1 46%  sched_debug.cpu#30.=
nr_switches
      3716 =C2=B1 52%    +302.9%      14975 =C2=B1 75%  sched_debug.cpu#30.=
sched_goidle
      1783 =C2=B1  0%     +57.0%       2801 =C2=B1 39%  sched_debug.cpu#31.=
curr->pid
     12310 =C2=B1 81%    +586.5%      84511 =C2=B1 27%  sched_debug.cpu#31.=
nr_switches
  76840028 =C2=B1 25%     +67.2%  1.285e+08 =C2=B1 30%  sched_debug.cpu#31.=
sched_count
      5861 =C2=B1 85%    +203.1%      17762 =C2=B1 43%  sched_debug.cpu#31.=
sched_goidle
  76827333 =C2=B1 25%     +67.1%  1.284e+08 =C2=B1 30%  sched_debug.cpu#31.=
yld_count
     29.00 =C2=B1  0%     -10.3%      26.00 =C2=B1  0%  sched_debug.cpu#32.=
load
    102316 =C2=B1  3%     -18.0%      83884 =C2=B1  5%  sched_debug.cpu#32.=
nr_load_updates
      1966 =C2=B1 19%   +6428.8%     128373 =C2=B1 20%  sched_debug.cpu#32.=
nr_switches
     -0.67 =C2=B1-187%    -362.5%       1.75 =C2=B1 47%  sched_debug.cpu#32=
.nr_uninterruptible
 5.068e+08 =C2=B1  2%     -19.2%  4.093e+08 =C2=B1  5%  sched_debug.cpu#32.=
sched_count
 5.068e+08 =C2=B1  2%     -19.2%  4.093e+08 =C2=B1  5%  sched_debug.cpu#32.=
yld_count
     28.75 =C2=B1  1%      -9.6%      26.00 =C2=B1  0%  sched_debug.cpu#33.=
load
      2781 =C2=B1 58%   +5326.8%     150945 =C2=B1 23%  sched_debug.cpu#33.=
nr_switches
      1708 =C2=B1 15%   +7992.5%     138220 =C2=B1 21%  sched_debug.cpu#34.=
nr_switches
      1070 =C2=B1 34%  +11628.3%     125522 =C2=B1 27%  sched_debug.cpu#35.=
nr_switches
     30.00 =C2=B1  0%      -9.2%      27.25 =C2=B1  1%  sched_debug.cpu#36.=
cpu_load[4]
     28.75 =C2=B1  1%      -9.6%      26.00 =C2=B1  0%  sched_debug.cpu#36.=
load
    620.00 =C2=B1 12%  +20006.2%     124658 =C2=B1 20%  sched_debug.cpu#36.=
nr_switches
    272.25 =C2=B1 10%    +303.4%       1098 =C2=B1 77%  sched_debug.cpu#36.=
ttwu_count
     28.75 =C2=B1  1%      -9.6%      26.00 =C2=B1  0%  sched_debug.cpu#37.=
load
      1390 =C2=B1 53%   +8618.8%     121191 =C2=B1  9%  sched_debug.cpu#37.=
nr_switches
    460.50 =C2=B1 70%     -55.7%     204.00 =C2=B1 20%  sched_debug.cpu#37.=
sched_goidle
     28.75 =C2=B1  1%      -9.6%      26.00 =C2=B1  0%  sched_debug.cpu#38.=
load
    939.00 =C2=B1 52%  +14611.6%     138141 =C2=B1 22%  sched_debug.cpu#38.=
nr_switches
      4.75 =C2=B1 52%     -84.2%       0.75 =C2=B1197%  sched_debug.cpu#38.=
nr_uninterruptible
      1831 =C2=B1 51%   +5997.2%     111685 =C2=B1 19%  sched_debug.cpu#39.=
nr_switches
     -1.25 =C2=B1-103%    -220.0%       1.50 =C2=B1100%  sched_debug.cpu#39=
.nr_uninterruptible
    843.25 =C2=B1 56%     -74.6%     214.25 =C2=B1  5%  sched_debug.cpu#39.=
sched_goidle
      3115 =C2=B1 42%   +3314.2%     106369 =C2=B1 14%  sched_debug.cpu#4.n=
r_switches
    337.25 =C2=B1 38%    +227.7%       1105 =C2=B1 90%  sched_debug.cpu#4.t=
twu_local
      1643 =C2=B1 43%   +8617.4%     143248 =C2=B1 12%  sched_debug.cpu#40.=
nr_switches
      2000 =C2=B1 43%   +5851.1%     119037 =C2=B1 24%  sched_debug.cpu#41.=
nr_switches
      5076 =C2=B1 81%   +2562.9%     135169 =C2=B1 16%  sched_debug.cpu#42.=
nr_switches
      2370 =C2=B1 87%     -82.0%     426.25 =C2=B1 11%  sched_debug.cpu#42.=
sched_goidle
      6527 =C2=B1 69%   +1421.5%      99317 =C2=B1 37%  sched_debug.cpu#43.=
nr_switches
      2843 =C2=B1 86%     -79.8%     575.50 =C2=B1 54%  sched_debug.cpu#43.=
sched_goidle
      1653 =C2=B1 55%   +6432.2%     107993 =C2=B1 12%  sched_debug.cpu#44.=
nr_switches
      2.00 =C2=B1 70%    +162.5%       5.25 =C2=B1 15%  sched_debug.cpu#44.=
nr_uninterruptible
      8625 =C2=B1148%   +1154.9%     108242 =C2=B1 19%  sched_debug.cpu#45.=
nr_switches
      7321 =C2=B1 56%   +1366.7%     107377 =C2=B1 35%  sched_debug.cpu#46.=
nr_switches
      1863 =C2=B1 35%   +5834.3%     110571 =C2=B1 17%  sched_debug.cpu#47.=
nr_switches
      2480 =C2=B1 57%     -70.9%     721.50 =C2=B1 27%  sched_debug.cpu#47.=
ttwu_count
      4400 =C2=B1 85%   +1942.5%      89871 =C2=B1 16%  sched_debug.cpu#48.=
nr_switches
     58586 =C2=B1  3%     -11.0%      52141 =C2=B1  9%  sched_debug.cpu#49.=
nr_load_updates
      2131 =C2=B1 24%   +4102.2%      89559 =C2=B1 14%  sched_debug.cpu#49.=
nr_switches
      1413 =C2=B1 55%    +854.3%      13486 =C2=B1100%  sched_debug.cpu#49.=
ttwu_count
      2782 =C2=B1 61%   +3760.6%     107430 =C2=B1 13%  sched_debug.cpu#5.n=
r_switches
     18271 =C2=B1 84%    +430.8%      96978 =C2=B1 19%  sched_debug.cpu#50.=
nr_switches
      0.50 =C2=B1591%   +1000.0%       5.50 =C2=B1 27%  sched_debug.cpu#50.=
nr_uninterruptible
     24050 =C2=B1118%    +356.2%     109711 =C2=B1 12%  sched_debug.cpu#51.=
nr_switches
      1769 =C2=B1 23%   +4215.4%      76361 =C2=B1 17%  sched_debug.cpu#52.=
nr_switches
     -0.50 =C2=B1-360%    -950.0%       4.25 =C2=B1 42%  sched_debug.cpu#52=
.nr_uninterruptible
      3961 =C2=B1 53%   +2517.6%     103697 =C2=B1 46%  sched_debug.cpu#53.=
nr_switches
      1200 =C2=B1 37%    +790.8%      10692 =C2=B1 79%  sched_debug.cpu#53.=
ttwu_count
      5867 =C2=B1119%   +1616.4%     100709 =C2=B1 38%  sched_debug.cpu#54.=
nr_switches
    686.75 =C2=B1 16%     +69.4%       1163 =C2=B1 25%  sched_debug.cpu#54.=
ttwu_count
    381.00 =C2=B1  6%     +34.2%     511.25 =C2=B1 12%  sched_debug.cpu#54.=
ttwu_local
      3237 =C2=B1 86%   +3016.3%     100883 =C2=B1 42%  sched_debug.cpu#55.=
nr_switches
     -1.00 =C2=B1-122%    -475.0%       3.75 =C2=B1 34%  sched_debug.cpu#55=
.nr_uninterruptible
     24411 =C2=B1157%    +305.2%      98905 =C2=B1 27%  sched_debug.cpu#56.=
nr_switches
      1.50 =C2=B1100%    +350.0%       6.75 =C2=B1 42%  sched_debug.cpu#56.=
nr_uninterruptible
     50797 =C2=B1  4%     -16.3%      42535 =C2=B1 16%  sched_debug.cpu#57.=
nr_load_updates
     10759 =C2=B1 49%    +754.4%      91934 =C2=B1 34%  sched_debug.cpu#57.=
nr_switches
      5389 =C2=B1 62%    +217.7%      17123 =C2=B1 21%  sched_debug.cpu#57.=
ttwu_count
     53452 =C2=B1  8%     -10.0%      48099 =C2=B1  3%  sched_debug.cpu#58.=
nr_load_updates
      9178 =C2=B1 57%    +872.7%      89276 =C2=B1 31%  sched_debug.cpu#58.=
nr_switches
     53368 =C2=B1  9%     -10.6%      47718 =C2=B1  3%  sched_debug.cpu#59.=
nr_load_updates
      9248 =C2=B1101%   +1030.9%     104593 =C2=B1 18%  sched_debug.cpu#59.=
nr_switches
      1421 =C2=B1 15%   +6792.4%      97975 =C2=B1 14%  sched_debug.cpu#6.n=
r_switches
     50609 =C2=B1  4%      -4.9%      48113 =C2=B1  4%  sched_debug.cpu#60.=
nr_load_updates
     15188 =C2=B1150%    +662.1%     115754 =C2=B1 49%  sched_debug.cpu#60.=
nr_switches
     50688 =C2=B1  3%     -15.2%      42964 =C2=B1  9%  sched_debug.cpu#61.=
nr_load_updates
     34970 =C2=B1 61%    +159.9%      90900 =C2=B1 21%  sched_debug.cpu#61.=
nr_switches
     -1.00 =C2=B1-187%    -725.0%       6.25 =C2=B1 63%  sched_debug.cpu#61=
.nr_uninterruptible
     53356 =C2=B1  6%      -9.7%      48173 =C2=B1  3%  sched_debug.cpu#62.=
nr_load_updates
     25233 =C2=B1 96%    +325.4%     107350 =C2=B1 15%  sched_debug.cpu#62.=
nr_switches
      1056 =C2=B1 41%   +1919.9%      21340 =C2=B1 41%  sched_debug.cpu#62.=
ttwu_count
     51989 =C2=B1  7%     -14.4%      44496 =C2=B1 12%  sched_debug.cpu#63.=
nr_load_updates
      2148 =C2=B1 18%   +5141.2%     112594 =C2=B1 34%  sched_debug.cpu#63.=
nr_switches
      2896 =C2=B1 86%   +3063.9%      91642 =C2=B1 28%  sched_debug.cpu#7.n=
r_switches
     -0.25 =C2=B1-1034%   +4200.0%     -10.75 =C2=B1-53%  sched_debug.cpu#7=
.nr_uninterruptible
      7107 =C2=B1 23%   +1626.1%     122685 =C2=B1 20%  sched_debug.cpu#8.n=
r_switches
      2639 =C2=B1 24%     -37.4%       1653 =C2=B1  8%  sched_debug.cpu#8.t=
twu_count
      1209 =C2=B1 37%     -48.2%     625.75 =C2=B1 11%  sched_debug.cpu#8.t=
twu_local
      8613 =C2=B1 67%   +1153.2%     107948 =C2=B1 16%  sched_debug.cpu#9.n=
r_switches
      1243 =C2=B1 41%     -58.2%     520.25 =C2=B1  5%  sched_debug.cpu#9.t=
twu_local

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/test:
  lkp-sb03/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/s=
ched_yield

commit: =

  cd126afe838d7ea9b971cdea087fd498a7293c7f
  9d89c257dfb9c51a532d69397f6eed75e5168c35

cd126afe838d7ea9 9d89c257dfb9c51a532d69397f =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5918104 =C2=B1  0%      +6.0%    6276105 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   5899066 =C2=B1  0%      +6.5%    6280920 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    168745 =C2=B1 52%   +5881.4%   10093294 =C2=B1  7%  will-it-scale.time.=
involuntary_context_switches
    238.43 =C2=B1  0%      +6.0%     252.86 =C2=B1  0%  will-it-scale.time.=
user_time
    111280 =C2=B1  1%     +10.1%     122544 =C2=B1  5%  meminfo.DirectMap4k
     19364 =C2=B1  4%     -38.8%      11843 =C2=B1 27%  proc-vmstat.pgalloc=
_dma32
    168745 =C2=B1 52%   +5881.4%   10093294 =C2=B1  7%  time.involuntary_co=
ntext_switches
      3850 =C2=B1  5%   +1531.1%      62811 =C2=B1  5%  vmstat.system.cs
  20304620 =C2=B1 18%     -31.6%   13885769 =C2=B1  9%  cpuidle.C1-SNB.time
    217927 =C2=B1  8%     +33.5%     290992 =C2=B1  4%  cpuidle.C1-SNB.usage
     60397 =C2=B1  4%      -9.0%      54965 =C2=B1  3%  numa-meminfo.node0.=
Active
      1749 =C2=B1 14%     -24.2%       1325 =C2=B1  8%  numa-meminfo.node0.=
PageTables
    151191 =C2=B1  4%     -41.3%      88812 =C2=B1 30%  numa-numastat.node0=
.local_node
    151200 =C2=B1  4%     -41.2%      88848 =C2=B1 30%  numa-numastat.node0=
.numa_hit
    449148 =C2=B1  1%     +13.5%     509946 =C2=B1  5%  numa-numastat.node1=
.local_node
    449164 =C2=B1  1%     +13.5%     509949 =C2=B1  5%  numa-numastat.node1=
.numa_hit
      1880 =C2=B1  4%      -9.9%       1693 =C2=B1  2%  slabinfo.kmalloc-20=
48.active_objs
      1972 =C2=B1  4%      -9.8%       1779 =C2=B1  2%  slabinfo.kmalloc-20=
48.num_objs
     10387 =C2=B1  9%     +11.9%      11619 =C2=B1  5%  slabinfo.kmalloc-25=
6.active_objs
     11174 =C2=B1  7%     +10.5%      12342 =C2=B1  5%  slabinfo.kmalloc-25=
6.num_objs
    437.00 =C2=B1 14%     -24.3%     331.00 =C2=B1  8%  numa-vmstat.node0.n=
r_page_table_pages
    205228 =C2=B1  2%     -19.3%     165594 =C2=B1  4%  numa-vmstat.node0.n=
uma_hit
    140482 =C2=B1  2%     +14.6%     161043 =C2=B1  5%  numa-vmstat.node0.n=
uma_local
     64745 =C2=B1  2%     -93.0%       4549 =C2=B1  2%  numa-vmstat.node0.n=
uma_other
     15516 =C2=B1  9%    +386.9%      75556 =C2=B1  0%  numa-vmstat.node1.n=
uma_other
      6.67 =C2=B1  1%      +8.8%       7.26 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock_irq.__schedule.schedule.sys_sched_yield.entry_SYSCALL_6=
4_fastpath
      1.14 =C2=B1  3%     -49.3%       0.58 =C2=B1  4%  perf-profile.cpu-cy=
cles.check_cfs_rq_runtime.__schedule.schedule.sys_sched_yield.entry_SYSCALL=
_64_fastpath
      0.80 =C2=B1  2%     +24.8%       0.99 =C2=B1  3%  perf-profile.cpu-cy=
cles.clear_buddies.pick_next_entity.pick_next_task_fair.__schedule.schedule
     10.63 =C2=B1  1%     -22.7%       8.22 =C2=B1  1%  perf-profile.cpu-cy=
cles.entry_SYSCALL_64_after_swapgs
      0.51 =C2=B1  2%     +89.8%       0.97 =C2=B1  2%  perf-profile.cpu-cy=
cles.pick_next_entity.__schedule.schedule.sys_sched_yield.entry_SYSCALL_64_=
fastpath
      5.62 =C2=B1  2%     -16.2%       4.71 =C2=B1  4%  perf-profile.cpu-cy=
cles.pick_next_entity.pick_next_task_fair.__schedule.schedule.sys_sched_yie=
ld
      3.67 =C2=B1  1%     +16.2%       4.27 =C2=B1  2%  perf-profile.cpu-cy=
cles.update_min_vruntime.update_curr.pick_next_task_fair.__schedule.schedule
      5.62 =C2=B1  1%     +10.4%       6.20 =C2=B1  1%  perf-profile.cpu-cy=
cles.update_rq_clock.part.75.__schedule.schedule.sys_sched_yield.entry_SYSC=
ALL_64_fastpath
   1221860 =C2=B1  6%     +16.8%    1426739 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     71.00 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
     10183 =C2=B1 15%     -92.8%     736.50 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
    112.50 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
    798.50 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
0]:/.utilization_load_avg
    293.75 =C2=B1118%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.blocked_load_avg
    627745 =C2=B1 17%     +32.0%     828638 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.min_vruntime
     20.00 =C2=B1 25%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.runnable_load_avg
      9373 =C2=B1 10%     -92.2%     735.25 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
    314.00 =C2=B1111%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.tg_load_contrib
    515.75 =C2=B1 16%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
10]:/.utilization_load_avg
    152.00 =C2=B1 91%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
     19.25 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.runnable_load_avg
      9324 =C2=B1 11%     -92.1%     735.25 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
    172.50 =C2=B1 79%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.tg_load_contrib
    468.00 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
11]:/.utilization_load_avg
    114.25 =C2=B1158%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.blocked_load_avg
    735561 =C2=B1  0%     +17.5%     864489 =C2=B1 12%  sched_debug.cfs_rq[=
12]:/.min_vruntime
     21.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.runnable_load_avg
      9323 =C2=B1 11%     -92.1%     735.75 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
    136.00 =C2=B1132%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.tg_load_contrib
    514.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
12]:/.utilization_load_avg
    368.50 =C2=B1 62%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.blocked_load_avg
    683120 =C2=B1 13%     +46.1%     998285 =C2=B1 11%  sched_debug.cfs_rq[=
13]:/.min_vruntime
     29.25 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
      8846 =C2=B1 19%     -91.7%     735.50 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
    398.50 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    578.25 =C2=B1 18%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
13]:/.utilization_load_avg
      2.00 =C2=B1-50%     +50.0%       3.00 =C2=B1 40%  sched_debug.cfs_rq[=
14]:/.nr_spread_over
     21.75 =C2=B1  5%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.runnable_load_avg
      8818 =C2=B1 18%     -91.6%     736.50 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
    356.25 =C2=B1 95%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.tg_load_contrib
    514.00 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
14]:/.utilization_load_avg
    738074 =C2=B1  0%     +18.2%     872069 =C2=B1 13%  sched_debug.cfs_rq[=
15]:/.min_vruntime
     43.25 =C2=B1 89%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
      8804 =C2=B1 18%     -91.6%     736.75 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
     83.50 =C2=B1 71%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.tg_load_contrib
    596.00 =C2=B1 24%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
15]:/.utilization_load_avg
    295.25 =C2=B1143%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.blocked_load_avg
     23.25 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
      8785 =C2=B1 18%     -91.6%     737.25 =C2=B1  1%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
    318.50 =C2=B1133%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
    461.75 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
16]:/.utilization_load_avg
     14.75 =C2=B1 44%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.runnable_load_avg
    -38481 =C2=B1-211%    +370.5%    -181040 =C2=B1-30%  sched_debug.cfs_rq=
[17]:/.spread0
      8797 =C2=B1 18%     -91.6%     737.50 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
    339.25 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
    383.50 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
17]:/.utilization_load_avg
     11.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.runnable_load_avg
      8795 =C2=B1 18%     -91.6%     737.75 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
    313.00 =C2=B1 81%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.tg_load_contrib
    341.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
18]:/.utilization_load_avg
     11.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
    -37915 =C2=B1-216%    +383.0%    -183130 =C2=B1-31%  sched_debug.cfs_rq=
[19]:/.spread0
      8795 =C2=B1 18%     -91.6%     738.50 =C2=B1  1%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
     14.25 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.tg_load_contrib
    341.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
19]:/.utilization_load_avg
     41.00 =C2=B1  6%     -18.9%      33.25 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.load
     41.00 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
     10166 =C2=B1 15%     -92.8%     737.00 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
    323.25 =C2=B1 95%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
    749.75 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
1]:/.utilization_load_avg
     11.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.runnable_load_avg
    -38455 =C2=B1-215%    +375.5%    -182856 =C2=B1-31%  sched_debug.cfs_rq=
[20]:/.spread0
      8793 =C2=B1 18%     -91.6%     739.00 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
    319.50 =C2=B1142%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
    340.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
20]:/.utilization_load_avg
     12.75 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.runnable_load_avg
    -39108 =C2=B1-209%    +365.4%    -181992 =C2=B1-31%  sched_debug.cfs_rq=
[21]:/.spread0
      8780 =C2=B1 18%     -91.6%     740.00 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
    189.25 =C2=B1108%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.tg_load_contrib
    383.50 =C2=B1 19%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
21]:/.utilization_load_avg
     11.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.runnable_load_avg
    -37918 =C2=B1-218%    +378.5%    -181424 =C2=B1-31%  sched_debug.cfs_rq=
[22]:/.spread0
      8768 =C2=B1 18%     -91.6%     740.50 =C2=B1  1%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
     73.75 =C2=B1142%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.tg_load_contrib
    341.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
22]:/.utilization_load_avg
      2.75 =C2=B1 30%     -63.6%       1.00 =C2=B1  0%  sched_debug.cfs_rq[=
23]:/.nr_spread_over
     11.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
    -37967 =C2=B1-213%    +374.2%    -180059 =C2=B1-29%  sched_debug.cfs_rq=
[23]:/.spread0
      8767 =C2=B1 18%     -91.6%     740.50 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
    299.25 =C2=B1 82%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.tg_load_contrib
    341.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
23]:/.utilization_load_avg
    253.75 =C2=B1 54%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.blocked_load_avg
     50836 =C2=B1 13%     -36.2%      32433 =C2=B1 13%  sched_debug.cfs_rq[=
24]:/.exec_clock
     38.00 =C2=B1 77%     -89.5%       4.00 =C2=B1  0%  sched_debug.cfs_rq[=
24]:/.load
   1128937 =C2=B1 10%     -32.2%     765512 =C2=B1 15%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     38.00 =C2=B1 77%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
    -92969 =C2=B1-156%    +611.4%    -661339 =C2=B1-21%  sched_debug.cfs_rq=
[24]:/.spread0
      8766 =C2=B1 18%     -91.6%     740.75 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
    292.25 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
    542.25 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
24]:/.utilization_load_avg
    467.50 =C2=B1 73%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
      8.50 =C2=B1 42%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
   -372903 =C2=B1-19%     +60.4%    -598203 =C2=B1 -8%  sched_debug.cfs_rq[=
25]:/.spread0
      8766 =C2=B1 18%     -91.5%     741.25 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
    478.00 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
    253.25 =C2=B1 32%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
25]:/.utilization_load_avg
     28.00 =C2=B1111%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.runnable_load_avg
   -312848 =C2=B1-11%     +90.7%    -596490 =C2=B1-10%  sched_debug.cfs_rq[=
26]:/.spread0
      8732 =C2=B1 18%     -91.5%     742.00 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
    180.75 =C2=B1106%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.tg_load_contrib
    340.75 =C2=B1 35%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
26]:/.utilization_load_avg
    363.25 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.blocked_load_avg
      6.50 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.runnable_load_avg
   -373341 =C2=B1-19%     +60.3%    -598424 =C2=B1 -9%  sched_debug.cfs_rq[=
27]:/.spread0
      8684 =C2=B1 19%     -91.5%     742.00 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
    370.00 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.tg_load_contrib
    212.75 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
27]:/.utilization_load_avg
    269.25 =C2=B1 57%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
      6.50 =C2=B1 39%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
   -426684 =C2=B1-18%     +56.0%    -665620 =C2=B1-12%  sched_debug.cfs_rq[=
28]:/.spread0
      8587 =C2=B1 19%     -91.4%     742.50 =C2=B1  1%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
    276.25 =C2=B1 56%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.tg_load_contrib
    212.50 =C2=B1 34%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
28]:/.utilization_load_avg
    524.00 =C2=B1 67%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.blocked_load_avg
     37568 =C2=B1 10%     -38.0%      23277 =C2=B1 28%  sched_debug.cfs_rq[=
29]:/.exec_clock
     23.00 =C2=B1120%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.runnable_load_avg
   -370173 =C2=B1-20%    +115.7%    -798402 =C2=B1-17%  sched_debug.cfs_rq[=
29]:/.spread0
      8586 =C2=B1 19%     -91.4%     742.50 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
    553.00 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.tg_load_contrib
    254.00 =C2=B1 33%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
29]:/.utilization_load_avg
     45.25 =C2=B1 26%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.runnable_load_avg
    -64405 =C2=B1-128%    +301.3%    -258489 =C2=B1-41%  sched_debug.cfs_rq=
[2]:/.spread0
     10161 =C2=B1 15%     -92.8%     734.75 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     47.75 =C2=B1 22%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
2]:/.utilization_load_avg
    359.25 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.blocked_load_avg
      0.25 =C2=B1173%  +29000.0%      72.75 =C2=B1170%  sched_debug.cfs_rq[=
30]:/.nr_spread_over
      8.75 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.runnable_load_avg
   -425422 =C2=B1-19%     +57.4%    -669771 =C2=B1-17%  sched_debug.cfs_rq[=
30]:/.spread0
      8579 =C2=B1 19%     -91.3%     742.50 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
    372.00 =C2=B1 64%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.tg_load_contrib
    237.25 =C2=B1 29%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
30]:/.utilization_load_avg
    207.50 =C2=B1 83%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.blocked_load_avg
     11.25 =C2=B1 59%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
   -426184 =C2=B1-19%     +58.3%    -674811 =C2=B1-23%  sched_debug.cfs_rq[=
31]:/.spread0
      8579 =C2=B1 19%     -91.3%     742.75 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
    219.00 =C2=B1 78%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.tg_load_contrib
    297.50 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
31]:/.utilization_load_avg
    255.50 =C2=B1141%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.blocked_load_avg
     47.00 =C2=B1 30%     -28.2%      33.75 =C2=B1  5%  sched_debug.cfs_rq[=
3]:/.load
     38.50 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
    -66180 =C2=B1-121%    +210.1%    -205226 =C2=B1-28%  sched_debug.cfs_rq=
[3]:/.spread0
     10005 =C2=B1 14%     -92.7%     735.00 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
    295.00 =C2=B1122%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
3]:/.utilization_load_avg
    465.75 =C2=B1132%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.blocked_load_avg
     40.25 =C2=B1  6%     -15.5%      34.00 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.load
     41.75 =C2=B1 12%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.runnable_load_avg
    -65585 =C2=B1-124%    +211.2%    -204114 =C2=B1-26%  sched_debug.cfs_rq=
[4]:/.spread0
      9971 =C2=B1 13%     -92.6%     734.75 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
    524.00 =C2=B1123%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
    720.25 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
4]:/.utilization_load_avg
     38.50 =C2=B1  1%     -11.7%      34.00 =C2=B1  5%  sched_debug.cfs_rq[=
5]:/.load
     38.50 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.runnable_load_avg
    -65214 =C2=B1-123%    +216.7%    -206527 =C2=B1-27%  sched_debug.cfs_rq=
[5]:/.spread0
      9967 =C2=B1 13%     -92.6%     734.00 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
    220.75 =C2=B1103%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
5]:/.utilization_load_avg
    268.00 =C2=B1 44%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
     42.50 =C2=B1  9%     -20.0%      34.00 =C2=B1  5%  sched_debug.cfs_rq[=
6]:/.load
     44.75 =C2=B1 17%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.runnable_load_avg
    -63586 =C2=B1-127%    +227.4%    -208198 =C2=B1-25%  sched_debug.cfs_rq=
[6]:/.spread0
      9838 =C2=B1 12%     -92.5%     734.25 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
    315.25 =C2=B1 40%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
    724.50 =C2=B1 10%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
6]:/.utilization_load_avg
    197.50 =C2=B1 72%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.blocked_load_avg
     38.50 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
    -63725 =C2=B1-126%    +227.7%    -208846 =C2=B1-25%  sched_debug.cfs_rq=
[7]:/.spread0
      9435 =C2=B1  9%     -92.2%     734.50 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
    236.25 =C2=B1 60%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.tg_load_contrib
    682.00 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
7]:/.utilization_load_avg
    556.25 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.blocked_load_avg
     16820 =C2=B1 44%    +107.2%      34854 =C2=B1 13%  sched_debug.cfs_rq[=
8]:/.exec_clock
    403953 =C2=B1 28%    +112.1%     856760 =C2=B1 13%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     17.25 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.runnable_load_avg
   -817924 =C2=B1-17%     -30.3%    -570012 =C2=B1-19%  sched_debug.cfs_rq[=
8]:/.spread0
      9402 =C2=B1 10%     -92.2%     735.00 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
    581.25 =C2=B1 58%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.tg_load_contrib
    297.50 =C2=B1 47%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
8]:/.utilization_load_avg
    163.75 =C2=B1114%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.blocked_load_avg
     23.75 =C2=B1 38%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.runnable_load_avg
      9373 =C2=B1 10%     -92.2%     735.50 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
    188.50 =C2=B1103%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.tg_load_contrib
    511.25 =C2=B1 23%    -100.0%       0.00 =C2=B1 -1%  sched_debug.cfs_rq[=
9]:/.utilization_load_avg
     20707 =C2=B1 16%    +659.8%     157335 =C2=B1  8%  sched_debug.cpu#0.n=
r_switches
    -35.50 =C2=B1-15%     -71.1%     -10.25 =C2=B1-18%  sched_debug.cpu#0.n=
r_uninterruptible
     15138 =C2=B1 14%     -36.6%       9600 =C2=B1 14%  sched_debug.cpu#0.t=
twu_count
      8080 =C2=B1 15%     -35.8%       5185 =C2=B1 17%  sched_debug.cpu#0.t=
twu_local
     41.00 =C2=B1  6%     -18.9%      33.25 =C2=B1  4%  sched_debug.cpu#1.l=
oad
     11075 =C2=B1 40%   +1233.1%     147639 =C2=B1 14%  sched_debug.cpu#1.n=
r_switches
      1519 =C2=B1 35%    +111.8%       3217 =C2=B1 20%  sched_debug.cpu#1.t=
twu_local
     21843 =C2=B1 10%    +380.9%     105035 =C2=B1 30%  sched_debug.cpu#10.=
nr_switches
     17444 =C2=B1 39%    +478.4%     100896 =C2=B1 39%  sched_debug.cpu#11.=
nr_switches
      7093 =C2=B1 34%    +222.8%      22897 =C2=B1 48%  sched_debug.cpu#11.=
sched_goidle
     10924 =C2=B1 29%     -42.3%       6304 =C2=B1 30%  sched_debug.cpu#11.=
ttwu_count
      2721 =C2=B1 54%     -55.8%       1202 =C2=B1 15%  sched_debug.cpu#11.=
ttwu_local
     20845 =C2=B1 58%    +429.6%     110387 =C2=B1 14%  sched_debug.cpu#12.=
nr_switches
     20551 =C2=B1 78%    +377.9%      98209 =C2=B1 16%  sched_debug.cpu#13.=
nr_switches
 1.709e+08 =C2=B1 14%     +63.3%   2.79e+08 =C2=B1 16%  sched_debug.cpu#13.=
sched_count
 1.709e+08 =C2=B1 14%     +63.3%   2.79e+08 =C2=B1 16%  sched_debug.cpu#13.=
yld_count
     14138 =C2=B1 51%    +723.2%     116387 =C2=B1 27%  sched_debug.cpu#14.=
nr_switches
      5965 =C2=B1 48%    +235.8%      20035 =C2=B1 52%  sched_debug.cpu#14.=
sched_goidle
     30369 =C2=B1 36%    +297.0%     120579 =C2=B1 17%  sched_debug.cpu#15.=
nr_switches
 1.848e+08 =C2=B1  0%     +18.1%  2.182e+08 =C2=B1 13%  sched_debug.cpu#15.=
sched_count
 1.847e+08 =C2=B1  0%     +18.1%  2.182e+08 =C2=B1 13%  sched_debug.cpu#15.=
yld_count
     11750 =C2=B1 99%    +918.2%     119643 =C2=B1 12%  sched_debug.cpu#16.=
nr_switches
    632.00 =C2=B1 24%    +389.4%       3093 =C2=B1 57%  sched_debug.cpu#16.=
ttwu_count
      1866 =C2=B1 20%   +5364.1%     101987 =C2=B1 22%  sched_debug.cpu#17.=
nr_switches
      2182 =C2=B1 30%   +4770.4%     106285 =C2=B1 31%  sched_debug.cpu#18.=
nr_switches
      7.25 =C2=B1 48%     -86.2%       1.00 =C2=B1187%  sched_debug.cpu#18.=
nr_uninterruptible
      1393 =C2=B1 38%   +9361.6%     131846 =C2=B1 26%  sched_debug.cpu#19.=
nr_switches
     14156 =C2=B1 50%    +995.3%     155058 =C2=B1 26%  sched_debug.cpu#2.n=
r_switches
      8.25 =C2=B1129%    -139.4%      -3.25 =C2=B1-13%  sched_debug.cpu#2.n=
r_uninterruptible
      1010 =C2=B1 60%    +288.5%       3926 =C2=B1 43%  sched_debug.cpu#2.t=
twu_local
      2894 =C2=B1 57%   +3781.7%     112354 =C2=B1 18%  sched_debug.cpu#20.=
nr_switches
      4090 =C2=B1 62%     -77.1%     938.25 =C2=B1 40%  sched_debug.cpu#20.=
ttwu_count
      1155 =C2=B1 21%   +8883.1%     103799 =C2=B1 20%  sched_debug.cpu#21.=
nr_switches
      5355 =C2=B1119%   +1992.9%     112077 =C2=B1 10%  sched_debug.cpu#22.=
nr_switches
      2469 =C2=B1130%     -85.1%     368.25 =C2=B1 17%  sched_debug.cpu#22.=
sched_goidle
      1270 =C2=B1 21%   +9048.4%     116185 =C2=B1 22%  sched_debug.cpu#23.=
nr_switches
     38.00 =C2=B1 77%     -87.5%       4.75 =C2=B1  9%  sched_debug.cpu#24.=
cpu_load[0]
     35.75 =C2=B1 71%     -86.7%       4.75 =C2=B1  9%  sched_debug.cpu#24.=
cpu_load[1]
     30.25 =C2=B1 54%     -84.3%       4.75 =C2=B1  9%  sched_debug.cpu#24.=
cpu_load[2]
     25.00 =C2=B1 34%     -81.0%       4.75 =C2=B1  9%  sched_debug.cpu#24.=
cpu_load[3]
     21.25 =C2=B1 18%     -77.6%       4.75 =C2=B1  9%  sched_debug.cpu#24.=
cpu_load[4]
      3269 =C2=B1  3%     -58.3%       1364 =C2=B1  0%  sched_debug.cpu#24.=
curr->pid
     38.00 =C2=B1 77%     -89.5%       4.00 =C2=B1  0%  sched_debug.cpu#24.=
load
     67811 =C2=B1  7%     -26.4%      49932 =C2=B1  7%  sched_debug.cpu#24.=
nr_load_updates
     15512 =C2=B1 63%    +468.3%      88155 =C2=B1 31%  sched_debug.cpu#24.=
nr_switches
 3.078e+08 =C2=B1 15%     -35.9%  1.974e+08 =C2=B1 15%  sched_debug.cpu#24.=
sched_count
      4517 =C2=B1 81%    +556.0%      29633 =C2=B1 50%  sched_debug.cpu#24.=
ttwu_count
 3.077e+08 =C2=B1 15%     -35.9%  1.974e+08 =C2=B1 15%  sched_debug.cpu#24.=
yld_count
     12713 =C2=B1 49%    +839.5%     119445 =C2=B1 18%  sched_debug.cpu#25.=
nr_switches
     15.75 =C2=B1 62%     -71.4%       4.50 =C2=B1 11%  sched_debug.cpu#26.=
cpu_load[3]
     13.00 =C2=B1 36%     -65.4%       4.50 =C2=B1 11%  sched_debug.cpu#26.=
cpu_load[4]
      2254 =C2=B1 25%     -39.5%       1364 =C2=B1  0%  sched_debug.cpu#26.=
curr->pid
     28410 =C2=B1 86%    +340.2%     125070 =C2=B1 24%  sched_debug.cpu#26.=
nr_switches
      6718 =C2=B1127%    +190.0%      19485 =C2=B1 38%  sched_debug.cpu#26.=
ttwu_count
    745.00 =C2=B1 20%    +121.7%       1652 =C2=B1 79%  sched_debug.cpu#26.=
ttwu_local
     12040 =C2=B1108%    +900.8%     120493 =C2=B1 20%  sched_debug.cpu#27.=
nr_switches
     31001 =C2=B1 64%    +317.5%     129434 =C2=B1 22%  sched_debug.cpu#28.=
nr_switches
    898.50 =C2=B1 38%     +80.7%       1623 =C2=B1 48%  sched_debug.cpu#28.=
ttwu_local
     57069 =C2=B1  6%     -19.8%      45756 =C2=B1 13%  sched_debug.cpu#29.=
nr_load_updates
     24453 =C2=B1115%    +463.2%     137718 =C2=B1 30%  sched_debug.cpu#29.=
nr_switches
     47.00 =C2=B1 30%     -28.2%      33.75 =C2=B1  5%  sched_debug.cpu#3.l=
oad
      7889 =C2=B1 58%   +1483.0%     124881 =C2=B1 12%  sched_debug.cpu#3.n=
r_switches
      4.50 =C2=B1139%    -211.1%      -5.00 =C2=B1-87%  sched_debug.cpu#3.n=
r_uninterruptible
      1277 =C2=B1 35%     +91.9%       2450 =C2=B1 44%  sched_debug.cpu#30.=
curr->pid
     32731 =C2=B1129%    +223.9%     106003 =C2=B1 19%  sched_debug.cpu#30.=
nr_switches
     25725 =C2=B1 70%    +225.9%      83833 =C2=B1 48%  sched_debug.cpu#31.=
nr_switches
      1572 =C2=B1 44%     -47.0%     832.50 =C2=B1 13%  sched_debug.cpu#31.=
ttwu_local
     40.25 =C2=B1  6%     -15.5%      34.00 =C2=B1  5%  sched_debug.cpu#4.l=
oad
      4828 =C2=B1 47%   +2727.1%     136494 =C2=B1 10%  sched_debug.cpu#4.n=
r_switches
      2029 =C2=B1 46%     +40.2%       2845 =C2=B1 35%  sched_debug.cpu#4.s=
ched_goidle
     38.50 =C2=B1  1%     -11.7%      34.00 =C2=B1  5%  sched_debug.cpu#5.l=
oad
     10980 =C2=B1 75%    +977.2%     118281 =C2=B1 18%  sched_debug.cpu#5.n=
r_switches
     42.50 =C2=B1  9%     -20.0%      34.00 =C2=B1  5%  sched_debug.cpu#6.l=
oad
     10443 =C2=B1 79%   +1188.7%     134577 =C2=B1 12%  sched_debug.cpu#6.n=
r_switches
    361.50 =C2=B1 22%    +217.6%       1148 =C2=B1 55%  sched_debug.cpu#6.t=
twu_local
      8331 =C2=B1114%    +884.6%      82031 =C2=B1 62%  sched_debug.cpu#7.n=
r_switches
     11.50 =C2=B1 48%     +82.6%      21.00 =C2=B1  0%  sched_debug.cpu#8.c=
pu_load[4]
      1765 =C2=B1 36%     +94.4%       3431 =C2=B1  5%  sched_debug.cpu#8.c=
urr->pid
     34675 =C2=B1 18%     +41.4%      49019 =C2=B1 10%  sched_debug.cpu#8.n=
r_load_updates
     20973 =C2=B1 59%    +406.6%     106247 =C2=B1 17%  sched_debug.cpu#8.n=
r_switches
  80164706 =C2=B1 59%    +166.7%  2.138e+08 =C2=B1 14%  sched_debug.cpu#8.s=
ched_count
  80142860 =C2=B1 59%    +166.7%  2.138e+08 =C2=B1 14%  sched_debug.cpu#8.y=
ld_count
     22815 =C2=B1 47%    +509.3%     139005 =C2=B1 26%  sched_debug.cpu#9.n=
r_switches


lkp-ws02: Westmere-EP
Memory: 16G

lkp-nex04: Nehalem-EX
Memory: 256G

nhm-white: Nehalem
Memory: 6G

lkp-sbx04: Sandy Bridge-EX
Memory: 64G

lkp-sb03: Sandy Bridge-EP
Memory: 64G




                                last_state.booting

    1 ++-------------------------------------------------------------------=
-*
      |                                                                    =
.|
      |                                                                  ..=
 |
  0.8 ++                                                                .  =
 |
      |                                                                .   =
 |
      |                                                               .    =
 |
  0.6 ++                                                             .     =
 |
      |                                                            ..      =
 |
  0.4 ++                                                          .        =
 |
      |                                                          .         =
 |
      |                                                         .          =
 |
  0.2 ++                                                       .           =
 |
      |                                                      ..            =
 |
      |                                                     .              =
 |
    0 *+----------------*----------------*-----------------*---------------=
-+


                           last_state.is_incomplete_run

    1 ++-------------------------------------------------------------------=
-*
      |                                                                    =
.|
      |                                                                  ..=
 |
  0.8 ++                                                                .  =
 |
      |                                                                .   =
 |
      |                                                               .    =
 |
  0.6 ++                                                             .     =
 |
      |                                                            ..      =
 |
  0.4 ++                                                          .        =
 |
      |                                                          .         =
 |
      |                                                         .          =
 |
  0.2 ++                                                       .           =
 |
      |                                                      ..            =
 |
      |                                                     .              =
 |
    0 *+----------------*----------------*-----------------*---------------=
-+




  1.4e+09 ++---------------------------------------------------------------=
-+
          ****  ********.*********.********.********.**                    =
 |
  1.2e+09 ++ :  :                                                          =
 |
          |  :  :                                                          =
 |
    1e+09 ++ :  :                                                          =
 |
          OOOOO:OOOOOOOO OOOOOOOOO OOOOOOOO OOOOOOOO OOOOOOO               =
 |
    8e+08 ++ : :                                                  OOOOO OOO=
OO
          |  : :                                            OO OOO         =
 |
    6e+08 ++  ::                                                           =
 |
          |   ::                                                           =
 |
    4e+08 ++  ::                                                           =
 |
          |   :                                                            =
 |
    2e+08 ++  :                                                            =
 |
          |   :                                                            =
 |
        0 ++--*------------------------------------------------------------=
-+




  2.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          * *   *    *  .* **  *           .**   ***                       =
 |
    2e+06 +* *  ::*** **  *  ** **.***   **   ***   + *                    =
 |
          |  :  :*                    ***            *                     =
 |
          |  :  :                                                          =
 |
  1.5e+06 ++ : :                                                           =
 |
          |  : :                                                           =
 |
    1e+06 ++ : :                                                           =
 |
          |   ::                                                           =
 |
          O   O:   O O O     OOO   O OOOO O  O OO O  OOOOO O               =
 |
   500000 +OOO::OOO O O  OOOO   OO  O       O O  O O      O                =
 |
          |   :                          O                        O   O  O =
 |
          |   :                                             OO OOO OOO  O O=
OO
        0 ++--*------------------------------------------------------------=
-+




  1.6e+07 ++---------*----------------------*------*-----------------------=
-+
          |*         :    ***  *     **    :: *  * :+                      =
 |
  1.4e+07 *+**  **  * :*.*   * :**. * :    : ::: :*  **                    =
 |
  1.2e+07 ++ :  : * : ::      *    *   :* *  * **                          =
 |
          |  :  :  *  *                * *                                 =
 |
    1e+07 ++ :  :                                                          =
 |
          |  : :                                                           =
 |
    8e+06 ++ : :                                                           =
 |
          |   ::                                                           =
 |
    6e+06 ++  ::                                                           =
 |
    4e+06 ++  ::                   O                   O                   =
 |
          OOOO::OO OOOOO   OOO OO    O OOOO OOOOOOOO OO O OO          O   O=
 |
    2e+06 ++  O   O      OO   O  O  O O                  O     OO OOO   OO =
OO
          |   :                                             OO   O   O     =
 |
        0 ++--*------------------------------------------------------------=
-+


         latency_stats.sum.do_unlinkat.SyS_unlinkat.entry_SYSCALL_64_fastpa=
th

  1.8e+06 ++---------------------------------------------------------------=
-+
          |     *   ***              *   *      **   *                     =
 |
  1.6e+06 ++    :  *  :   *      *.  : ** :.* * ::  +:                     =
 |
  1.4e+06 ****  ::*    :  ::* * *  *: ::  *  * *  :*  :                    =
 |
          |  :  :*     *.* * * *    * :           *   *                    =
 |
  1.2e+06 ++ : :                      *                                    =
 |
    1e+06 ++ : :                                                           =
 |
          |  : :                                                           =
 |
   800000 ++ : :                                                           =
 |
   600000 ++  ::  O            O       O                                   =
 |
          O OO::O  O OOO O O       O OO  OO OO O OO  O OOOOOO              =
 |
   400000 +O  O  O        O  OO OO  O   O     O O  O  O      O  OOO  OO   O=
 |
   200000 ++  :     O       O                                      OO   OO =
OO
          |   :                                                O           =
 |
        0 ++--*------------------------------------------------------------=
-+


                                    softirqs.RCU

  800000 ****--*******-*******-*-*****-********-******---------------------=
-+
         |  :  :                *                                          =
 |
  700000 OOOO OOOOOOOO OOOOOOO OOOOOOO OOOOOOOO OOOOOOO OOOO               =
 |
         |  :  :                                                           =
 |
  600000 ++  : :                                                           =
 |
  500000 ++  : :                                                  OOOOOO OO=
OO
         |   : :                                                           =
 |
  400000 ++  : :                                            OOO OO         =
 |
         |   ::                                                            =
 |
  300000 ++  ::                                                            =
 |
  200000 ++  ::                                                            =
 |
         |    :                                                            =
 |
  100000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 ++---*------------------------------------------------------------=
-+


                                turbostat.CPU%c1

  25 ++--------------------------------------------------------------------=
-+
     |                                                     OO OOOOO OOO O O=
O|
     |                                                                 O   =
 O
  20 ++                                                                    =
 |
     OOO OOO O OOOOO OOOOO O OOO OOOOO OOOO OOOOO OOOOO OOO                =
 |
     |      O               O                                              =
 |
  15 +**.* ***.*****. *** .*** *.*****.****.*****.* *                      =
 |
     |:  : :         *   *    *                    *                       =
 |
  10 *+  : :                                                               =
 |
     |   : :                                                               =
 |
     |    ::                                                               =
 |
   5 ++   :                                                                =
 |
     |    :                                                                =
 |
     |    :                                                                =
 |
   0 ++---*----------------------------------------------------------------=
-+


                                   unixbench.score

  12000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  10000 OOOO OOOOOO.OOOOOOO.OOOOOO.OOOOOOO.OOOOOOO.OOOOOO OO               =
 |
        |  :  :                                                            =
 |
        |  :  :                                                   OOOOOO OO=
OO
   8000 ++  : :                                                            =
 |
        |   : :                                             OOOOO          =
 |
   6000 ++  : :                                                            =
 |
        |   : :                                                            =
 |
   4000 ++  ::                                                             =
 |
        |   ::                                                             =
 |
        |    :                                                             =
 |
   2000 ++   :                                                             =
 |
        |    :                                                             =
 |
      0 ++---*-------------------------------------------------------------=
-+


                             unixbench.time.user_time

  900 ++-------------------------------------------------------------------=
-+
      OOO.OOOOOO.OOOOO.OOOOO.OOOOOO.OOOOO.OOOOO.OOOOOO OOOO                =
 |
  800 ++  : :                                                              =
 |
  700 ++  : :                                                              =
 |
      |   : :                                                              =
 |
  600 ++  : :                                                    O OOOOOO O=
OO
  500 ++  : :                                                              =
 |
      |   : :                                              O OOOO          =
 |
  400 ++   :                                                               =
 |
  300 ++   :                                                               =
 |
      |    :                                                               =
 |
  200 ++   :                                                               =
 |
  100 ++   :                                                               =
 |
      |    :                                                               =
 |
    0 ++---*---------------------------------------------------------------=
-+


                            unixbench.time.system_time

  1400 ***-*-*-**-******-*-*-----*--**-******-******-*---------------------=
-+
       OOO OOOOOO OOOOOO OOOOOO.OOOOOO OOOOOO OOOOOO OOOOOO                =
 |
  1200 ++  : :                                                             =
 |
       |   : :                                                             =
 |
  1000 ++  : :                                                   O OOOOOO O=
OO
       |   : :                                                             =
 |
   800 ++  : :                                               O             =
 |
       |    ::                                              O OOO          =
 |
   600 ++   :                                                              =
 |
       |    :                                                              =
 |
   400 ++   :                                                              =
 |
       |    :                                                              =
 |
   200 ++   :                                                              =
 |
       |    :                                                              =
 |
     0 ++---*--------------------------------------------------------------=
-+


                           unixbench.time.minor_page_faults

  2.5e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          ****  ********.*********.********.********.**                    =
 |
    2e+08 OOOOO OOOOOOOO OOOOOOOOO OOOOOOOO OOOOOOOO OOOOOOO               =
 |
          |  :  :                                                          =
 |
          |  :  :                                                 OOOOO OOO=
OO
  1.5e+08 ++ : :                                                           =
 |
          |  : :                                            OO OOO         =
 |
    1e+08 ++  ::                                                           =
 |
          |   ::                                                           =
 |
          |   ::                                                           =
 |
    5e+07 ++  ::                                                           =
 |
          |   :                                                            =
 |
          |   :                                                            =
 |
        0 ++--*------------------------------------------------------------=
-+


                         sched_debug.cfs_rq[0]:/.tg_load_avg

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++     **    .*        * * *    *  *  .*   *                      =
 |
         |***  *  ****  :*****.* * * *. * ** **  *** *                     =
 |
         |: :  :        *              *                                   =
 |
  200000 *+ :  :                                                           =
 |
         |   : :                                                           =
 |
  150000 ++  : :                                                           =
 |
         |   : :                                                           =
 |
  100000 ++  ::                                                            =
 |
         |   ::                                                            =
 |
         |   ::                                                            =
 |
   50000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 OOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OO=
OO


                         sched_debug.cfs_rq[1]:/.tg_load_avg

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++     **    .*        * * *    *  *  .*   *                      =
 |
         |***  *  ****  :*****.* * * *. * * :**  *** *                     =
 |
         |: :  :        *              *   *                               =
 |
  200000 *+ :  :                                                           =
 |
         |   : :                                                           =
 |
  150000 ++  : :                                                           =
 |
         |   : :                                                           =
 |
  100000 ++  ::                                                            =
 |
         |   ::                                                            =
 |
         |   ::                                                            =
 |
   50000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 OOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OO=
OO


                         sched_debug.cfs_rq[2]:/.tg_load_avg

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++     **    .*        * * *    *  *       *                      =
 |
         |***  *  ****  :*****.* * * *. * * :**.**** *                     =
 |
         |: :  :        *              *   *                               =
 |
  200000 *+ :  :                                                           =
 |
         |   : :                                                           =
 |
  150000 ++  : :                                                           =
 |
         |   : :                                                           =
 |
  100000 ++  ::                                                            =
 |
         |   ::                                                            =
 |
         |   ::                                                            =
 |
   50000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 OOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OO=
OO


                         sched_debug.cfs_rq[3]:/.tg_load_avg

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++     **    .*        * * *    *  *       *                      =
 |
         |***  *  ****  :*****.* * * *. * * :**.**** *                     =
 |
         |: :  :        *              *   *                               =
 |
  200000 *+ :  :                                                           =
 |
         |   : :                                                           =
 |
  150000 ++  : :                                                           =
 |
         |   : :                                                           =
 |
  100000 ++  ::                                                            =
 |
         |   ::                                                            =
 |
         |   ::                                                            =
 |
   50000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 OOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OO=
OO


                         sched_debug.cfs_rq[4]:/.tg_load_avg

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++     **              *   *    *  *       *                      =
 |
         |***  *  ****.* *****.* *** *. * * :**.**** *                     =
 |
         |: :  :        *              *   *                               =
 |
  200000 *+ :  :                                                           =
 |
         |   : :                                                           =
 |
  150000 ++  : :                                                           =
 |
         |   : :                                                           =
 |
  100000 ++  ::                                                            =
 |
         |   ::                                                            =
 |
         |   ::                                                            =
 |
   50000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 OOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OO=
OO


                         sched_debug.cfs_rq[5]:/.tg_load_avg

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++      *                  *    *          *                      =
 |
         |***  ** ****.* *****.***** *. * * ***.**** *                     =
 |
         |: :  :        *              *   *                               =
 |
  200000 *+ :  :                                                           =
 |
         |   : :                                                           =
 |
  150000 ++  : :                                                           =
 |
         |   : :                                                           =
 |
  100000 ++  ::                                                            =
 |
         |   ::                                                            =
 |
         |   ::                                                            =
 |
   50000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 OOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OO=
OO


                         sched_debug.cfs_rq[6]:/.tg_load_avg

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++      *                  *    *          *                      =
 |
         |***  ** ****.* *****.***** *. * * ***.**** *                     =
 |
         |: :  :        *              *   *                               =
 |
  200000 *+ :  :                                                           =
 |
         |   : :                                                           =
 |
  150000 ++  : :                                                           =
 |
         |   : :                                                           =
 |
  100000 ++  ::                                                            =
 |
         |   ::                                                            =
 |
         |   ::                                                            =
 |
   50000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 OOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OO=
OO


                         sched_debug.cfs_rq[7]:/.tg_load_avg

  300000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  250000 ++      *                  *    *  *       *                      =
 |
         |***  ** ****.* *****.***** *. * * :**.**** *                     =
 |
         |: :  :        *              *   *                               =
 |
  200000 *+ :  :                                                           =
 |
         |   : :                                                           =
 |
  150000 ++  : :                                                           =
 |
         |   : :                                                           =
 |
  100000 ++  ::                                                            =
 |
         |   ::                                                            =
 |
         |   ::                                                            =
 |
   50000 ++   :                                                            =
 |
         |    :                                                            =
 |
       0 OOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OOOOOOO-OOOOOOO-OOOOOOOO-OO=
OO


                      kmsg.do_IRQ:#No_irq_handler_for_vector

    1 ++---------------------------------O---------------------------------=
-O
      |                                                                    =
 |
      |                                                                    =
 |
  0.8 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  0.6 ++                                                                   =
 |
      |                                                                    =
 |
  0.4 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
  0.2 ++                                                                   =
 |
      |                                                                    =
 |
      |                                                                    =
 |
    0 O+----O-----O-----O----O-----O-----------O-----O-----O----O-----O----=
-+


                      sched_debug.cfs_rq[0]:/.blocked_load_avg

  40000 ++-----------------------------------------------------------------=
-+
        |                    *                                             =
 |
  35000 ++                  ::    *                       .*               =
 |
  30000 ++ *.     *.*.      : :  + :       *. *.*.      .* :  *   **. .*   =
 |
        | *  *   *    *.**.*  : *  :      +  *    *.*  *    :+ + +   *  + *=
.*
  25000 ++   :   :             ::   *.**.*           :+     *   *        * =
 |
        *    :   :             *                     *                     =
 |
  20000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                       sched_debug.cfs_rq[0]:/.tg_load_contrib

  40000 ++-----------------------------------------------------------------=
-+
        |                    *                                             =
 |
  35000 ++                  ::    *                       .*               =
 |
  30000 ++ *.     *.*.      : :  + :       *. *.*.*.    .* :  *   **.*.*   =
 |
        | *  *   *    *.**.*  : *  :      +  *      *  *    :+ + +      + *=
.*
  25000 ++   :   :             ::   *.**.*           :+     *   *        * =
 |
        *    :   :             *                     *                     =
 |
  20000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                      sched_debug.cfs_rq[1]:/.blocked_load_avg

  35000 ++---------------------------------------------------------*------*=
-+
        |                  *      *.*        **.*.       *.*  *    :+     :=
 *
  30000 ++**.      .*.*.* : +    +   +   *. +     *.*   :  : : + .*  *. .* =
 |
        |+   *   **      ::  *.**     * +  *         :  :   ::  *      *   =
 |
  25000 *+   :   :       *             *             *.*    *              =
 |
        |    :   :                                                         =
 |
  20000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                       sched_debug.cfs_rq[1]:/.tg_load_contrib

  40000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  35000 ++                                                         *.     *=
.*
  30000 ++*          .*.   *.    .*.*.       **.*.       *.*  *.   : *.   :=
 |
        |+ *.*   **.*   * +  *.**     * .*. +     *.*   +   :+  *.*    *.* =
 |
  25000 *+   :   :       *             *   *         *.*    *              =
 |
        |    :   :                                                         =
 |
  20000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                      sched_debug.cfs_rq[2]:/.blocked_load_avg

  40000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  35000 ++       **.                     *        *           *.           =
 |
  30000 ++ *     :  *.*.**.*.*       .* + +   *  : +    .*.* :  *    *.   *=
.|
        *.* +    :            +    .*  *   *.* + :  *  *    ::   +  +  *.* =
 *
  25000 ++   *   :             **.*             *    :+     *     **       =
 |
        |    :  :                                    *                     =
 |
  20000 ++   :  :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                       sched_debug.cfs_rq[2]:/.tg_load_contrib

  40000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  35000 ++       **.                     *        *           *.           =
 |
  30000 ++ *     :  *.*.**.*.*       .* + +   *. + +    .*.* :  *    *.   *=
.|
        *.* +    :            +    .*  *   *.*  *   *  *    ::   +  +  *.* =
 *
  25000 ++   *   :             **.*                  :+     *     **       =
 |
        |    :  :                                    *                     =
 |
  20000 ++   :  :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                      sched_debug.cfs_rq[3]:/.blocked_load_avg

  35000 ++-----------------------------------------------------------------=
-+
        |    *        *.*    *           *.*. *. .*.*  *.   *   *. *   *.  =
.*
  30000 ++  +:   **. +   *  : + *.*.*.* +    *  *    :+  *. :+ +  * + +  **=
 |
        |.** :   :  *     + :  *       *             *     *  *      *     =
 |
  25000 *+   :   :         *                                               =
 |
        |     :  :                                                         =
 |
  20000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |      ::                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                       sched_debug.cfs_rq[3]:/.tg_load_contrib

  35000 ++------------*-*--------------------------------------------------=
-+
        |    *       :   :   *           *.*. *. .*.* .*.   *   *.**   *.  =
.*
  30000 ++* +:   **. :   *  : + *.*.*.* +    *  *    *   *. :+ +    + +  **=
 |
        |+ * :   :  *     + :  *       *                   *  *      *     =
 |
  25000 *+   :   :         *                                               =
 |
        |     :  :                                                         =
 |
  20000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |      ::                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                      sched_debug.cfs_rq[4]:/.blocked_load_avg

  35000 ++--------*------------------------*-------------------------------=
-+
        |         :+       *.    .*.      +  *     .**        *. .*       *=
 |
  30000 ++**.*    : *.    :  *. *   *.**.*   :    *   + .*.  +  *  :    .* =
+|
        *    :   :    *.* :    *              :  +     *   **      *.*.*   =
 *
  25000 ++   :   *       *                    *.*                          =
 |
        |     :  :                                                         =
 |
  20000 ++    :  :                                                         =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |      ::                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                       sched_debug.cfs_rq[4]:/.tg_load_contrib

  35000 ++--------*------------------------*-------------------------------=
-+
        |         :+       *.    .*.      +  *     .**        *. .*       *=
 |
  30000 ++**.*    : *.    :  *. *   *.**.*   :    *   + .*.  +  *  :    .* =
+|
        *    :   :    *.* :    *              :  +     *   **      *.*.*   =
 *
  25000 ++   :   *       *                    *.*                          =
 |
        |     :  :                                                         =
 |
  20000 ++    :  :                                                         =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |      ::                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                      sched_debug.cfs_rq[5]:/.blocked_load_avg

  35000 ++-----------------------------------------------------------------=
-+
        |   .*           *.            *      *. .*.    .*.**   *. *   *   =
 |
  30000 ++** :   * .*. .*  *.    .*.*. :+ .*. : *   **.*     + +  * + + : *=
.*
        |+   :   :*   *      *.**     *  *   *                *      *  : :=
 |
  25000 *+   :   :                                                       * =
 |
        |     :  :                                                         =
 |
  20000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |      ::                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                       sched_debug.cfs_rq[5]:/.tg_load_contrib

  35000 ++-----------------------------------------------------------------=
-+
        | * .*      *    *.            *      *. .*.*   .*.**   *. *   *   =
 |
  30000 ++ * :   * + + .*  *.    .*.*. :+ .*. : *    *.*     + +  * + + : *=
.*
        |:   :   :*   *      *.**     *  *   *                *      *  : :=
 |
  25000 *+   :   :                                                       * =
 |
        |     :  :                                                         =
 |
  20000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |      ::                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                      sched_debug.cfs_rq[6]:/.blocked_load_avg

  40000 ++-----------------------------------------------------------------=
-+
        |                                       *          *               =
 |
  35000 ++         .*                          + :        +:               =
 |
  30000 ++        *  :    .*.*   .*.       *.**  :    .*.*  : *.*. *.*. .* =
 |
        *. *.     :  :   *    + *   *.**. +       *. *      :+    *    *  *=
.*
  25000 ++*  *   :    *.*      *         *          *       *              =
 |
        |    :   *                                                         =
 |
  20000 ++   :   :                                                         =
 |
        |     :  :                                                         =
 |
  15000 ++    : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
   5000 ++     ::                                                          =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                       sched_debug.cfs_rq[6]:/.tg_load_contrib

  40000 ++-----------------------------------------------------------------=
-+
        |                                       *          *               =
 |
  35000 ++         .*                          + :        +:               =
 |
  30000 ++        *  :    .*.*  *.*.   *. .*.**  :    .*.*  : *.*. *.*. .* =
 |
        *. *.     :  :   *    + :   *.*  *        *. *      :+    *    *  *=
.*
  25000 ++*  *   *    *.*      *                    *       *              =
 |
        |    :   :                                                         =
 |
  20000 ++   :   :                                                         =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                      sched_debug.cfs_rq[7]:/.blocked_load_avg

  35000 ++-----------------------------------------------------------------=
-+
        |          .*.*. *.      .*. .**.    *                         *. *=
.*
  30000 ++ *.*   **     *  *. .**   *    *. + *.*.*.* .*.*   .*.*.**. +  * =
 |
        | *  :   :           *             *         *    : *        *     =
 |
  25000 ++   :   :                                        : :              =
 |
        |:    :  :                                         *               =
 |
  20000 *+    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |      ::                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
-+


                       sched_debug.cfs_rq[7]:/.tg_load_contrib

  35000 ++-----------------------------------------------------------------=
-+
        |          .*.*. *.      .*. .**.    * .*.                     *. *=
.*
  30000 ++ *.*   **     *  *. .**   *    *. + *   *.* .*.*   .*.*.**. +  * =
 |
        | *  :   :           *             *         *    : *        *     =
 |
  25000 ++   :   :                                        : :              =
 |
        |:    :  :                                         *               =
 |
  20000 *+    : :                                                          =
 |
        |     : :                                                          =
 |
  15000 ++    : :                                                          =
 |
        |     : :                                                          =
 |
  10000 ++    : :                                                          =
 |
        |      ::                                                          =
 |
   5000 ++     :                                                           =
 |
        |      :                                                           =
 |
      0 ++-----*-----------------------------------------------------------=
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

--===============3198462377933697612==
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
CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDljZmNjNjU4ZGE5NjkzZjY1ZTcy
MjRlODMyOWU0MGFkYTJmM2M2OTkKbW9kZWw6IE5laGFsZW0KbWVtb3J5OiA2RwpoZGRfcGFydGl0
aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtSGl0YWNoaV9IRFQ3MjEwNTBTTEEzNjBfU1RIM0Q3
TUUwWUVNNVktcGFydDUKICAvZGV2L2Rpc2svYnktaWQvYXRhLUhpdGFjaGlfSERUNzIxMDUwU0xB
MzYwX1NUSDNEN01FMFlFTTVZLXBhcnQ2IC9kZXYvZGlzay9ieS1pZC9hdGEtSGl0YWNoaV9IRFQ3
MjEwNTBTTEEzNjBfU1RIM0Q3TUUwWUVNNVktcGFydDcKICAvZGV2L2Rpc2svYnktaWQvYXRhLUhp
dGFjaGlfSERUNzIxMDUwU0xBMzYwX1NUSDNEN01FMFlFTTVZLXBhcnQ4Igpzd2FwX3BhcnRpdGlv
bnM6IApyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1IaXRhY2hpX0hEVDcy
MTA1MFNMQTM2MF9TVEgzRDdNRTBZRU01WS1wYXJ0MiIKbmV0Y29uc29sZV9wb3J0OiA2NjQ3CmNh
dGVnb3J5OiBiZW5jaG1hcmsKdW5peGJlbmNoOgogIHRlc3Q6IHNoZWxsOApxdWV1ZTogY3ljbGlj
CnRlc3Rib3g6IG5obS13aGl0ZQp0Ym94X2dyb3VwOiBuaG0td2hpdGUKa2NvbmZpZzogeDg2XzY0
LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTA5LTA2IDE5OjI4OjI3LjEyNTg0NTkwMCArMDg6MDAK
aWQ6IDk5NTAxMjE1ODQwN2FiYmEyYTFhY2MzNjY5NGZlYzMzOTkyYTYzMDQKdXNlcjogd2ZnCmNv
bXBpbGVyOiBnY2MtNC45CmhlYWRfY29tbWl0OiA5Y2ZjYzY1OGRhOTY5M2Y2NWU3MjI0ZTgzMjll
NDBhZGEyZjNjNjk5CmJhc2VfY29tbWl0OiBiZjU5ZTY2MjNhM2E5MmEyYmY0MjhmMmQ2NTkyYzgx
YWFlNjMxN2UxCmJyYW5jaDogbGludXMvbWFzdGVyCmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0
LXJoZWwvZ2NjLTQuOS85Y2ZjYzY1OGRhOTY5M2Y2NWU3MjI0ZTgzMjllNDBhZGEyZjNjNjk5L3Zt
bGludXotNC4yLjAtMDk2MjgtZzljZmNjNjUiCnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvdW5peGJlbmNoL3NoZWxsOC9uaG0td2hpdGUv
ZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzljZmNjNjU4
ZGE5NjkzZjY1ZTcyMjRlODMyOWU0MGFkYTJmM2M2OTkvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVk
dWxlZC9uaG0td2hpdGUvY3ljbGljX3VuaXhiZW5jaC1zaGVsbDgteDg2XzY0LXJoZWwtQ1lDTElD
X0hFQUQtOWNmY2M2NThkYTk2OTNmNjVlNzIyNGU4MzI5ZTQwYWRhMmYzYzY5OS0yMDE1MDkwNi0x
MDIwNy0xdnFmMDZsLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTA5LTA2IDIxOjU2OjEzLjAz
NTM1ODE3MCArMDg6MDAKbnJfY3B1OiAiJChucHJvYykiCm1heF91cHRpbWU6IDM1NDMuODM5OTk5
OTk5OTk5Nwppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPXdmZwotIGpv
Yj0vbGtwL3NjaGVkdWxlZC9uaG0td2hpdGUvY3ljbGljX3VuaXhiZW5jaC1zaGVsbDgteDg2XzY0
LXJoZWwtQ1lDTElDX0hFQUQtOWNmY2M2NThkYTk2OTNmNjVlNzIyNGU4MzI5ZTQwYWRhMmYzYzY5
OS0yMDE1MDkwNi0xMDIwNy0xdnFmMDZsLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14
ODZfNjQtcmhlbAotIGJyYW5jaD1saW51cy9tYXN0ZXIKLSBjb21taXQ9OWNmY2M2NThkYTk2OTNm
NjVlNzIyNGU4MzI5ZTQwYWRhMmYzYzY5OQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45LzljZmNjNjU4ZGE5NjkzZjY1ZTcyMjRlODMyOWU0MGFkYTJmM2M2OTkvdm1s
aW51ei00LjIuMC0wOTYyOC1nOWNmY2M2NQotIG1heF91cHRpbWU9MzU0MwotIFJFU1VMVF9ST09U
PS9yZXN1bHQvdW5peGJlbmNoL3NoZWxsOC9uaG0td2hpdGUvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzljZmNjNjU4ZGE5NjkzZjY1ZTcyMjRlODMyOWU0
MGFkYTJmM2M2OTkvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlT
MCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9h
bHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9
LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRf
cmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xl
PXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC93ZmcvbGtwLXg4Nl82NC5j
Z3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzljZmNj
NjU4ZGE5NjkzZjY1ZTcyMjRlODMyOWU0MGFkYTJmM2M2OTkvbW9kdWxlcy5jZ3oiCmJtX2luaXRy
ZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9v
c2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6
LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6
LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy91bml4YmVuY2gu
Y2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDMxLjE3IDE2LjcwIDYuODQgMS8xNTcg
MzI2OTMKc3RhcnRfdGltZTogJzE0NDE1NDc4MTcnCmVuZF90aW1lOiAnMTQ0MTU0ODE5NScKdmVy
c2lvbjogIi9sa3Avd2ZnLy5zcmMtMjAxNTA5MDEtMTU0NDExIgo=

--===============3198462377933697612==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

Li9SdW4gc2hlbGw4Cg==

--===============3198462377933697612==--

