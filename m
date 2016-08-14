Content-Type: multipart/mixed; boundary="===============3240673272628672253=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 22:50:53 +0800
Message-ID: <20160814145053.GA17428@wfg-t540p.sh.intel.com>
In-Reply-To: <20160813225128.GA6416@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3240673272628672253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Sun, Aug 14, 2016 at 06:51:28AM +0800, Fengguang Wu wrote:
>Hi Christoph,
>
>On Sun, Aug 14, 2016 at 12:15:08AM +0200, Christoph Hellwig wrote:
>>Hi Fengguang,
>>
>>feel free to try this git tree:
>>
>>   git://git.infradead.org/users/hch/vfs.git iomap-fixes
>
>I just queued some test jobs for it.
>
>% queue -q vip -t ivb44 -b hch-vfs/iomap-fixes aim7-fs-1brd.yaml fs=3Dxfs =
-r3 -k fe9c2c81ed073878768785a985295cbacc349e42 -k ca2edab2e1d8f30dda874b7f=
717c2d4664991e9b -k 99091700659f4df965e138b38b4fa26a29b7eade
>
>That job file can be found here:
>
>        https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/tre=
e/jobs/aim7-fs-1brd.yaml
>
>It specifies a matrix of the below atom tests:
>
>        wfg /c/lkp-tests% split-job jobs/aim7-fs-1brd.yaml -s 'fs: xfs'
>
>        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_src-3=
000-performance.yaml
>        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_rr-30=
00-performance.yaml
>        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_rw-30=
00-performance.yaml
>        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_cp-30=
00-performance.yaml
>        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_wrt-3=
000-performance.yaml
>        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-sync_disk_=
rw-600-performance.yaml
>        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-creat-clo-=
1500-performance.yaml
>        jobs/aim7-fs-1brd.yaml =3D> ./aim7-fs-1brd-1BRD_48G-xfs-disk_rd-90=
00-performance.yaml

I got some results now. The several finished aim7 tests have some
performance regressions for commit fe9c2c81 ("xfs: rewrite and
optimize the delalloc write path") comparing to its parent commit
ca2edab2e and their base mainline commit 990917006 ("Merge tag
'nfs-for-4.8-2' of git://git.linux-nfs.org/projects/trondmy/linux-nfs").

wfg(a)inn ~% compare -g aim7 -ai 99091700659f4df965e138b38b4fa26a29b7eade c=
a2edab2e1d8f30dda874b7f717c2d4664991e9b fe9c2c81ed073878768785a985295cbacc3=
49e42
tests: 4
    60      perf-index  fe9c2c81ed073878768785a985295cbacc349e42
    97     power-index  fe9c2c81ed073878768785a985295cbacc349e42

99091700659f4df9  ca2edab2e1d8f30dda874b7f71  fe9c2c81ed073878768785a985  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    270459                      272267 =C2=B1  3%       -48%     139834 =C2=
=B1  3%  aim7/1BRD_48G-xfs-disk_cp-3000-performance/ivb44
    473257                      468546               5%     497512        a=
im7/1BRD_48G-xfs-disk_rd-9000-performance/ivb44
    360578             -18%     296589             -60%     144974        a=
im7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44
    358701              -6%     335712             -40%     216057        G=
EO-MEAN aim7.jobs-per-min

99091700659f4df9  ca2edab2e1d8f30dda874b7f71  fe9c2c81ed073878768785a985
----------------  --------------------------  --------------------------
     48.48                       48.15              36%      65.85        a=
im7/1BRD_48G-xfs-disk_cp-3000-performance/ivb44
     89.50                       89.76                       88.75        a=
im7/1BRD_48G-xfs-disk_rd-9000-performance/ivb44
     35.78              23%      43.93              76%      63.09        a=
im7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44
     53.75               7%      57.48              33%      71.71        G=
EO-MEAN turbostat.%Busy

99091700659f4df9  ca2edab2e1d8f30dda874b7f71  fe9c2c81ed073878768785a985
----------------  --------------------------  --------------------------
      1439                        1431              36%       1964        a=
im7/1BRD_48G-xfs-disk_cp-3000-performance/ivb44
      2671                        2674                        2650        a=
im7/1BRD_48G-xfs-disk_rd-9000-performance/ivb44
      1057              23%       1303              78%       1883        a=
im7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44
      1595               7%       1708              34%       2139        G=
EO-MEAN turbostat.Avg_MHz

99091700659f4df9  ca2edab2e1d8f30dda874b7f71  fe9c2c81ed073878768785a985
----------------  --------------------------  --------------------------
       167                         167               6%        177        a=
im7/1BRD_48G-xfs-disk_cp-3000-performance/ivb44
       175                         175                         176        a=
im7/1BRD_48G-xfs-disk_rd-9000-performance/ivb44
       150               8%        162              19%        178        a=
im7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44
       164                         168               8%        177        G=
EO-MEAN turbostat.PkgWatt

99091700659f4df9  ca2edab2e1d8f30dda874b7f71  fe9c2c81ed073878768785a985
----------------  --------------------------  --------------------------
     10.27                       10.43             -14%       8.79        a=
im7/1BRD_48G-xfs-disk_cp-3000-performance/ivb44
      6.85                        6.66                        6.88        a=
im7/1BRD_48G-xfs-disk_rd-9000-performance/ivb44
      9.96              14%      11.36              -7%       9.23        a=
im7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44
      8.88               4%       9.24              -7%       8.23        G=
EO-MEAN turbostat.RAMWatt

Here are the detailed numbers for each test case. The perf-profile and
latency_stats numbers are sorted by absolute change in each sub-category
now. perf-profile numbers > 5 are all shown.

It may be more pleasant to view the long trace.call.funcs lines with
vim ":set nowrap" option.

aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44

99091700659f4df9  ca2edab2e1d8f30dda874b7f71  fe9c2c81ed073878768785a985  =

----------------  --------------------------  --------------------------  =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    360578             -18%     294351             -60%     144974        a=
im7.jobs-per-min
     12835             458%      71658             480%      74445        a=
im7.time.involuntary_context_switches
       755              50%       1136             373%       3570        a=
im7.time.system_time
    155970                      152810              73%     269438        a=
im7.time.minor_page_faults
     50.15              22%      61.39             148%     124.39        a=
im7.time.elapsed_time
     50.15              22%      61.39             148%     124.39        a=
im7.time.elapsed_time.max
    438660                      428601              -7%     407807        a=
im7.time.voluntary_context_switches
      2452                        2480               5%       2584        a=
im7.time.maximum_resident_set_size
     34293 =C2=B1  4%        70%      58129 =C2=B1 19%       213%     10748=
3        interrupts.CAL:Function_call_interrupts
     79.70 =C2=B1  6%        16%      92.63 =C2=B1  6%        89%     150.3=
3        uptime.boot
      2890 =C2=B1  8%         6%       3077 =C2=B1  8%        15%       332=
9        uptime.idle
    150186 =C2=B1  9%        41%     212090             122%     333727    =
    softirqs.RCU
    161166               9%     176318              16%     186527        s=
oftirqs.SCHED
    648051              33%     864346             222%    2089349        s=
oftirqs.TIMER
     50.15              22%      61.39             148%     124.39        t=
ime.elapsed_time
     50.15              22%      61.39             148%     124.39        t=
ime.elapsed_time.max
     12835             458%      71658             480%      74445        t=
ime.involuntary_context_switches
    155970                      152810              73%     269438        t=
ime.minor_page_faults
      1563              21%       1898              85%       2895        t=
ime.percent_of_cpu_this_job_got
       755              50%       1136             373%       3570        t=
ime.system_time
   4564660 =C2=B1  4%        68%    7651587              79%    8159302    =
    numa-numastat.node0.numa_foreign
   3929898              81%    7129718              46%    5733813        n=
uma-numastat.node0.numa_miss
         0                           2 =C2=B1 20%                     2    =
    numa-numastat.node1.other_node
   4569811 =C2=B1  4%        68%    7654689              79%    8163206    =
    numa-numastat.node1.numa_miss
   3935075              81%    7132850              46%    5737410        n=
uma-numastat.node1.numa_foreign
  34767917               4%   36214694              11%   38627727        n=
uma-numastat.node1.numa_hit
  34767917               4%   36214691              11%   38627725        n=
uma-numastat.node1.local_node
     12377 =C2=B1 18%      3615%     459790            2848%     364868    =
    vmstat.io.bo
       119              -8%        110 =C2=B1  4%       -16%        101    =
    vmstat.memory.buff
  18826454             -16%   15748045             -37%   11882562        v=
mstat.memory.free
        16              25%         20             106%         33        v=
mstat.procs.r
     19407             469%     110509             520%     120350        v=
mstat.system.cs
     48215              10%      52977               3%      49819        v=
mstat.system.in
    142459             -11%     126667             -23%     109481        c=
puidle.C1-IVT.usage
  29494441 =C2=B1  3%       -18%   24206809             -36%   18889149    =
    cpuidle.C1-IVT.time
   5736732              28%    7315830             525%   35868316        c=
puidle.C1E-IVT.time
     51148               9%      55743              98%     101021        c=
puidle.C1E-IVT.usage
  18347890              27%   23243942              21%   22154105        c=
puidle.C3-IVT.time
     96127               9%     104487             -29%      68552        c=
puidle.C3-IVT.usage
 1.525e+09               6%  1.617e+09              41%  2.147e+09        c=
puidle.C6-IVT.time
   1805218              11%    1998052              33%    2397285        c=
puidle.C6-IVT.usage
       286 =C2=B1 11%        14%        328 =C2=B1  7%       389%       140=
2        cpuidle.POLL.usage
   1013526 =C2=B1 41%        98%    2003264 =C2=B1 20%       272%    377467=
5        cpuidle.POLL.time
     35.78              24%      44.22              76%      63.09        t=
urbostat.%Busy
      1057              24%       1312              78%       1883        t=
urbostat.Avg_MHz
     34.80              -3%      33.63             -22%      27.18        t=
urbostat.CPU%c1
      0.34              -5%       0.33             -77%       0.08        t=
urbostat.CPU%c3
     29.07             -25%      21.82             -67%       9.65        t=
urbostat.CPU%c6
       118              11%        130              23%        145        t=
urbostat.CorWatt
      9.39 =C2=B1 13%       -19%       7.61 =C2=B1  6%       -61%       3.6=
7        turbostat.Pkg%pc2
      3.04 =C2=B1 33%       -49%       1.55 =C2=B1 14%       -76%       0.7=
2        turbostat.Pkg%pc6
       150               9%        164              19%        178        t=
urbostat.PkgWatt
      9.96              14%      11.34              -7%       9.23        t=
urbostat.RAMWatt
     18232 =C2=B1  8%        -8%      16747 =C2=B1 10%        11%      2026=
7        meminfo.AnonHugePages
     80723                       78330             -24%      61572        m=
eminfo.CmaFree
   4690642 =C2=B1 10%       -15%    3981312             -15%    3983392    =
    meminfo.DirectMap2M
   1060897             -21%     834807             -22%     828755        m=
eminfo.Dirty
   2362330              26%    2983603              44%    3391287        m=
eminfo.Inactive
   2353250              26%    2974520              44%    3382139        m=
eminfo.Inactive(file)
  19388991             -18%   15966408             -38%   12038822        m=
eminfo.MemFree
   1186231               4%    1236627              13%    1341728        m=
eminfo.SReclaimable
    179570               3%     185696              14%     204382        m=
eminfo.SUnreclaim
   1365802               4%    1422323              13%    1546111        m=
eminfo.Slab
    318863              10%     352026              16%     368386        m=
eminfo.Unevictable
      0.00                        0.00                        9.15        p=
erf-profile.cycles-pp.xfs_file_iomap_begin_delay.isra.9.xfs_file_iomap_begi=
n.iomap_apply.iomap_file_buffered_write.xfs_file_buffered_aio_write
      0.00                        0.00                        8.90        p=
erf-profile.cycles-pp.xfs_inode_set_eofblocks_tag.xfs_file_iomap_begin_dela=
y.isra.9.xfs_file_iomap_begin.iomap_apply.iomap_file_buffered_write
      0.00                        0.00                        8.61        p=
erf-profile.cycles-pp._raw_spin_lock.xfs_inode_set_eofblocks_tag.xfs_file_i=
omap_begin_delay.isra.9.xfs_file_iomap_begin.iomap_apply
      0.00                        0.00                        8.50        p=
erf-profile.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.xfs_i=
node_set_eofblocks_tag.xfs_file_iomap_begin_delay.isra.9.xfs_file_iomap_beg=
in
      6.05             -11%       5.42 =C2=B1  4%       -15%       5.14    =
    perf-profile.cycles-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp=
_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter
      6.54             -11%       5.80 =C2=B1  4%       -16%       5.51    =
    perf-profile.cycles-pp.local_apic_timer_interrupt.smp_apic_timer_interr=
upt.apic_timer_interrupt.cpuidle_enter.call_cpuidle
     16.78              -9%      15.34 =C2=B1  9%       -11%      14.90    =
    perf-profile.cycles-pp.apic_timer_interrupt.cpuidle_enter.call_cpuidle.=
cpu_startup_entry.start_secondary
     16.51 =C2=B1  3%        -9%      14.99 =C2=B1  9%       -12%      14.4=
9        perf-profile.cycles-pp.smp_apic_timer_interrupt.apic_timer_interru=
pt.cpuidle_enter.call_cpuidle.cpu_startup_entry
      0.23 =C2=B1 23%        20%       0.28 =C2=B1 12%      3683%       8.7=
0        perf-profile.func.cycles-pp.native_queued_spin_lock_slowpath
 4.369e+11 =C2=B1  4%        20%  5.239e+11              97%  8.601e+11    =
    perf-stat.branch-instructions
      0.38               5%       0.40             -27%       0.28        p=
erf-stat.branch-miss-rate
 1.678e+09 =C2=B1  3%        26%  2.117e+09              44%  2.413e+09    =
    perf-stat.branch-misses
     42.30              -7%      39.31              -5%      40.38        p=
erf-stat.cache-miss-rate
 6.874e+09 =C2=B1  4%        19%   8.21e+09              51%  1.041e+10    =
    perf-stat.cache-misses
 1.625e+10 =C2=B1  3%        29%  2.089e+10              59%  2.578e+10    =
    perf-stat.cache-references
   1017846             588%    7005227            1401%   15273586        p=
erf-stat.context-switches
 2.757e+12 =C2=B1  4%        48%  4.092e+12             318%  1.151e+13    =
    perf-stat.cpu-cycles
    177918              15%     204776              35%     241051        p=
erf-stat.cpu-migrations
      0.37 =C2=B1 14%        60%       0.60 =C2=B1  3%        45%       0.5=
4        perf-stat.dTLB-load-miss-rate
 2.413e+09 =C2=B1 14%        97%  4.757e+09 =C2=B1  4%       149%  6.001e+0=
9        perf-stat.dTLB-load-misses
 6.438e+11              23%  7.893e+11              71%  1.103e+12        p=
erf-stat.dTLB-loads
      0.06 =C2=B1 38%       100%       0.11 =C2=B1  6%       207%       0.1=
7        perf-stat.dTLB-store-miss-rate
 2.656e+08 =C2=B1 34%       123%   5.91e+08 =C2=B1  7%       203%  8.038e+0=
8        perf-stat.dTLB-store-misses
     45.99 =C2=B1  5%         8%      49.56 =C2=B1 11%        14%      52.6=
1        perf-stat.iTLB-load-miss-rate
  45151945                    45832755              72%   77697494        p=
erf-stat.iTLB-load-misses
  53205262 =C2=B1  7%       -10%   47792612 =C2=B1 21%        32%   6999775=
1        perf-stat.iTLB-loads
 2.457e+12 =C2=B1  4%        16%  2.851e+12              66%  4.084e+12    =
    perf-stat.instructions
      0.89             -22%       0.70             -60%       0.35        p=
erf-stat.ipc
    286640               8%     310690              99%     571225        p=
erf-stat.minor-faults
     29.16               7%      31.25               8%      31.42        p=
erf-stat.node-load-miss-rate
  4.86e+08 =C2=B1  3%       123%  1.084e+09             250%    1.7e+09    =
    perf-stat.node-load-misses
  1.18e+09             102%  2.385e+09             214%  3.711e+09        p=
erf-stat.node-loads
     21.51              30%      27.95              62%      34.86        p=
erf-stat.node-store-miss-rate
 1.262e+09              58%  1.989e+09             177%  3.499e+09        p=
erf-stat.node-store-misses
 4.606e+09              11%  5.126e+09              42%  6.539e+09        p=
erf-stat.node-stores
    286617               8%     310730              99%     571253        p=
erf-stat.page-faults
   1166432              23%    1429828              42%    1653754        n=
uma-meminfo.node0.Inactive(file)
   1175123              22%    1434274              41%    1662351        n=
uma-meminfo.node0.Inactive
    513534             -23%     394773             -24%     392567        n=
uma-meminfo.node0.Dirty
   9717968             -17%    8082393             -37%    6159862        n=
uma-meminfo.node0.MemFree
    159470              11%     176717              16%     184229        n=
uma-meminfo.node0.Unevictable
  23148226               7%   24783802              15%   26706333        n=
uma-meminfo.node0.MemUsed
    103531 =C2=B1 32%       -10%      93669 =C2=B1 40%        40%     14446=
9        numa-meminfo.node0.SUnreclaim
   1187035              30%    1549075              46%    1727751        n=
uma-meminfo.node1.Inactive
   1186646              30%    1544438              46%    1727201        n=
uma-meminfo.node1.Inactive(file)
  21000905               3%   21647702              13%   23741428        n=
uma-meminfo.node1.Active(file)
  21083707               3%   21748741              13%   23822391        n=
uma-meminfo.node1.Active
    547021             -20%     438525             -21%     433706        n=
uma-meminfo.node1.Dirty
   9663240             -19%    7870896             -39%    5869977        n=
uma-meminfo.node1.MemFree
    561241              12%     625903              21%     679671        n=
uma-meminfo.node1.SReclaimable
    637259 =C2=B1  4%        13%     717863 =C2=B1  5%        16%     73948=
2        numa-meminfo.node1.Slab
  23329350               8%   25121687              16%   27122606        n=
uma-meminfo.node1.MemUsed
    159394              10%     175315              16%     184159        n=
uma-meminfo.node1.Unevictable
    521615              33%     695562             267%    1916159        l=
atency_stats.avg.call_rwsem_down_write_failed.do_unlinkat.SyS_unlink.entry_=
SYSCALL_64_fastpath
    500644              33%     667614             261%    1805608        l=
atency_stats.avg.call_rwsem_down_write_failed.path_openat.do_filp_open.do_s=
ys_open.SyS_creat.entry_SYSCALL_64_fastpath
      8932 =C2=B1 46%       -70%       2717 =C2=B1  4%       -95%        46=
4        latency_stats.avg.wait_on_page_bit.truncate_inode_pages_range.trun=
cate_inode_pages_final.evict.iput.dentry_unlink_inode.__dentry_kill.dput.__=
fput.____fput.task_work_run.exit_to_usermode_loop
         0                           0                       73327        l=
atency_stats.hits.wait_on_page_bit.__migration_entry_wait.migration_entry_w=
ait.do_swap_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
        43 =C2=B1 37%      7923%       3503 =C2=B1  4%     31792%      1392=
6        latency_stats.hits.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map=
.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agf.xfs_alloc_read_agf.xf=
s_alloc_fix_freelist.xfs_free_extent_fix_freelist.xfs_free_extent.xfs_trans=
_free_extent
   1422573              30%    1852368 =C2=B1  5%       228%    4672496    =
    latency_stats.max.call_rwsem_down_write_failed.path_openat.do_filp_open=
.do_sys_open.SyS_creat.entry_SYSCALL_64_fastpath
   1423130              30%    1851873 =C2=B1  5%       228%    4661765    =
    latency_stats.max.call_rwsem_down_write_failed.do_unlinkat.SyS_unlink.e=
ntry_SYSCALL_64_fastpath
       627 =C2=B1 66%      3788%      24404 =C2=B1 17%      6254%      3988=
3        latency_stats.max.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.=
xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs=
_alloc_fix_freelist.xfs_free_extent_fix_freelist.xfs_free_extent.xfs_trans_=
free_extent
      3922 =C2=B1 18%        56%       6134 =C2=B1 29%       634%      2878=
6        latency_stats.max.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.=
xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xf=
s_dialloc.xfs_ialloc.xfs_dir_ialloc.xfs_create
         0                           0                       16665        l=
atency_stats.max.wait_on_page_bit.__migration_entry_wait.migration_entry_wa=
it.do_swap_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
  5.15e+10              25%  6.454e+10             220%  1.649e+11        l=
atency_stats.sum.call_rwsem_down_write_failed.do_unlinkat.SyS_unlink.entry_=
SYSCALL_64_fastpath
         0                           0                   1.385e+08        l=
atency_stats.sum.wait_on_page_bit.__migration_entry_wait.migration_entry_wa=
it.do_swap_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
  11666476              45%   16905624             755%   99756088        l=
atency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_re=
ad_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink_remove.xfs_ifree.xfs=
_inactive_ifree.xfs_inactive.xfs_fs_destroy_inode
      2216 =C2=B1 69%     80030%    1775681 =C2=B1  4%     3e+06%   6752115=
4        latency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.=
xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs=
_alloc_fix_freelist.xfs_free_extent_fix_freelist.xfs_free_extent.xfs_trans_=
free_extent
   1601815              28%    2053992             288%    6213577        l=
atency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_re=
ad_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc.=
xfs_ialloc.xfs_dir_ialloc.xfs_create
   1774397              20%    2120576             244%    6099374        l=
atency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_re=
ad_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink.xfs_droplink.xfs_rem=
ove.xfs_vn_unlink.vfs_unlink
       628 =C2=B1141%       125%       1416 =C2=B1  5%     4e+05%    267703=
6        latency_stats.sum.xfs_iget.xfs_ialloc.xfs_dir_ialloc.xfs_create.xf=
s_generic_create.xfs_vn_mknod.xfs_vn_create.path_openat.do_filp_open.do_sys=
_open.SyS_creat.entry_SYSCALL_64_fastpath
      6087 =C2=B1 92%      1277%      83839 =C2=B1  3%     11105%     68206=
3        latency_stats.sum.call_rwsem_down_read_failed.xfs_log_commit_cil._=
_xfs_trans_commit.xfs_trans_commit.xfs_vn_update_time.file_update_time.xfs_=
file_aio_write_checks.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs=
_write.vfs_write.SyS_write
         0                           0                      116108        l=
atency_stats.sum.xlog_grant_head_wait.xlog_grant_head_check.xfs_log_reserve=
.xfs_trans_reserve.xfs_trans_alloc.xfs_vn_update_time.file_update_time.xfs_=
file_aio_write_checks.xfs_file_buffered_aio_write.xfs_file_write_iter.__vfs=
_write.vfs_write
      1212 =C2=B1 59%      1842%      23546 =C2=B1  7%      4861%      6014=
9        latency_stats.sum.call_rwsem_down_read_failed.xfs_log_commit_cil._=
_xfs_trans_commit.xfs_trans_commit.xfs_vn_update_time.touch_atime.generic_f=
ile_read_iter.xfs_file_buffered_aio_read.xfs_file_read_iter.__vfs_read.vfs_=
read.SyS_read
      1624 =C2=B1 22%      1356%      23637 =C2=B1  3%      1596%      2754=
5        latency_stats.sum.call_rwsem_down_read_failed.xfs_log_commit_cil._=
_xfs_trans_commit.__xfs_trans_roll.xfs_trans_roll.xfs_itruncate_extents.xfs=
_free_eofblocks.xfs_release.xfs_file_release.__fput.____fput.task_work_run
      2068 =C2=B1 27%       834%      19319 =C2=B1 23%      1125%      2533=
4        latency_stats.sum.call_rwsem_down_read_failed.xfs_log_commit_cil._=
_xfs_trans_commit.__xfs_trans_roll.xfs_trans_roll.xfs_itruncate_extents.xfs=
_inactive_truncate.xfs_inactive.xfs_fs_destroy_inode.destroy_inode.evict.ip=
ut
         0                           0                       22155        l=
atency_stats.sum.xlog_grant_head_wait.xlog_grant_head_check.xfs_log_reserve=
.xfs_trans_reserve.xfs_trans_alloc.xfs_inactive_truncate.xfs_inactive.xfs_f=
s_destroy_inode.destroy_inode.evict.iput.dentry_unlink_inode
        39 =C2=B1 71%     41280%      16414 =C2=B1 14%     51951%      2064=
7        latency_stats.sum.call_rwsem_down_read_failed.xfs_log_commit_cil._=
_xfs_trans_commit.__xfs_trans_roll.xfs_trans_roll.xfs_defer_trans_roll.xfs_=
defer_finish.xfs_itruncate_extents.xfs_inactive_truncate.xfs_inactive.xfs_f=
s_destroy_inode.destroy_inode
         0                           0                       15600        l=
atency_stats.sum.xlog_grant_head_wait.xlog_grant_head_check.xfs_log_reserve=
.xfs_trans_reserve.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive.xfs_fs_d=
estroy_inode.destroy_inode.evict.iput.dentry_unlink_inode
        10 =C2=B1141%      6795%        689 =C2=B1 70%     1e+05%      1063=
7        latency_stats.sum.call_rwsem_down_read_failed.xfs_log_commit_cil._=
_xfs_trans_commit.xfs_trans_commit.xfs_inactive_ifree.xfs_inactive.xfs_fs_d=
estroy_inode.destroy_inode.evict.iput.dentry_unlink_inode.__dentry_kill
        99 =C2=B1112%        86%        185 =C2=B1 80%      9978%      1001=
1        latency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.=
xfs_buf_read_map.xfs_trans_read_buf_map.xfs_imap_to_bp.xfs_iunlink_remove.x=
fs_ifree.xfs_inactive_ifree.xfs_inactive.xfs_fs_destroy_inode
     18232 =C2=B1134%       -16%      15260 =C2=B1 54%       -40%      1097=
5        latency_stats.sum.xfs_lock_two_inodes.xfs_remove.xfs_vn_unlink.vfs=
_unlink.do_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
       647 =C2=B1  3%       -97%         21 =C2=B1 19%        34%        86=
8        proc-vmstat.kswapd_high_wmark_hit_quickly
      1091             -97%         36 =C2=B1  9%        29%       1411    =
    proc-vmstat.kswapd_low_wmark_hit_quickly
    265066             -21%     208142             -22%     206344        p=
roc-vmstat.nr_dirty
     20118                       19574             -23%      15432        p=
roc-vmstat.nr_free_cma
   4844108             -18%    3988031             -38%    3008251        p=
roc-vmstat.nr_free_pages
    588262              26%     743537              44%     845765        p=
roc-vmstat.nr_inactive_file
        50 =C2=B1 25%       192%        148 =C2=B1 15%       103%        10=
3        proc-vmstat.nr_pages_scanned
    296623               4%     309201              13%     335474        p=
roc-vmstat.nr_slab_reclaimable
     44880               3%      46405              14%      51078        p=
roc-vmstat.nr_slab_unreclaimable
     79716              10%      88008              16%      92097        p=
roc-vmstat.nr_unevictable
       167 =C2=B1  9%     9e+06%   14513434           2e+06%    3569348    =
    proc-vmstat.nr_vmscan_immediate_reclaim
    162380 =C2=B1 18%      4392%    7294622            7024%   11567602    =
    proc-vmstat.nr_written
    588257              26%     743537              44%     845784        p=
roc-vmstat.nr_zone_inactive_file
     79716              10%      88008              16%      92097        p=
roc-vmstat.nr_zone_unevictable
    265092             -21%     208154             -22%     206388        p=
roc-vmstat.nr_zone_write_pending
   8507451 =C2=B1  3%        74%   14784261              64%   13918067    =
    proc-vmstat.numa_foreign
        10 =C2=B1  4%                    10 =C2=B1  4%     6e+05%      5785=
5        proc-vmstat.numa_hint_faults
   8507451 =C2=B1  3%        74%   14784187              64%   13918067    =
    proc-vmstat.numa_miss
        72                          72           3e+05%     213175        p=
roc-vmstat.numa_pte_updates
      1740             -97%         59 =C2=B1 12%        33%       2306    =
    proc-vmstat.pageoutrun
   5322372            1068%   62167111            1024%   59824114        p=
roc-vmstat.pgactivate
   2816355              27%    3575784              14%    3203214        p=
roc-vmstat.pgalloc_dma32
  74392338              11%   82333943              14%   84954110        p=
roc-vmstat.pgalloc_normal
  60958397             -18%   49976330             -26%   45055885        p=
roc-vmstat.pgdeactivate
    302790               9%     329088              94%     586116        p=
roc-vmstat.pgfault
  61061205              14%   69758545              18%   72000453        p=
roc-vmstat.pgfree
    655652 =C2=B1 18%      4352%   29190304            6967%   46338056    =
    proc-vmstat.pgpgout
  60965725             -18%   49983704             -26%   45063375        p=
roc-vmstat.pgrefill
         2 =C2=B1 17%     4e+07%     985929 =C2=B1  8%     7e+07%    195262=
9        proc-vmstat.pgrotated
     82046 =C2=B1 36%     50634%   41625211            5397%    4510385    =
    proc-vmstat.pgscan_direct
  60128369             -37%   38068394              10%   66306637        p=
roc-vmstat.pgscan_kswapd
      2030 =C2=B1 46%     1e+06%   27038054 =C2=B1  3%     78642%    159873=
3        proc-vmstat.pgsteal_direct
         0                     2414551 =C2=B1  3%               3694833    =
    proc-vmstat.workingset_activate
         0                     2414551 =C2=B1  3%               3694833    =
    proc-vmstat.workingset_refault
        26 =C2=B1 39%     1e+07%    2657286           3e+06%     658792    =
    numa-vmstat.node0.nr_vmscan_immediate_reclaim
     40449 =C2=B1 22%      3135%    1308601 =C2=B1  4%      4723%    195067=
0        numa-vmstat.node0.nr_written
    291648              22%     357059              42%     413612        n=
uma-vmstat.node0.nr_zone_inactive_file
    291655              22%     357053              42%     413596        n=
uma-vmstat.node0.nr_inactive_file
   1542314 =C2=B1  5%        77%    2731911              98%    3056411    =
    numa-vmstat.node0.numa_foreign
   1366073 =C2=B1  4%       103%    2766780 =C2=B1  3%        68%    229311=
7        numa-vmstat.node0.numa_miss
    128634             -23%      99104             -24%      98062        n=
uma-vmstat.node0.nr_dirty
    128663             -23%      99130             -24%      98051        n=
uma-vmstat.node0.nr_zone_write_pending
   2424918             -16%    2033425             -37%    1537826        n=
uma-vmstat.node0.nr_free_pages
  14037168              10%   15473174              20%   16883787        n=
uma-vmstat.node0.numa_local
  14037172              10%   15473174              20%   16883790        n=
uma-vmstat.node0.numa_hit
     39867              10%      44022              16%      46058        n=
uma-vmstat.node0.nr_zone_unevictable
     39867              10%      44022              16%      46058        n=
uma-vmstat.node0.nr_unevictable
     25871 =C2=B1 32%        -9%      23414 =C2=B1 40%        40%      3609=
4        numa-vmstat.node0.nr_slab_unreclaimable
  14851187               6%   15749527              11%   16497187        n=
uma-vmstat.node0.nr_dirtied
         0                     1225299 =C2=B1  4%               2008478    =
    numa-vmstat.node1.workingset_refault
         0                     1225299 =C2=B1  4%               2008478    =
    numa-vmstat.node1.workingset_activate
        23 =C2=B1 35%     1e+07%    2974198 =C2=B1  3%     3e+06%     68300=
2        numa-vmstat.node1.nr_vmscan_immediate_reclaim
     40769 =C2=B1 26%      3264%    1371611 =C2=B1  3%      5569%    231137=
4        numa-vmstat.node1.nr_written
        25 =C2=B1  8%       216%         81 =C2=B1  3%       356%        11=
7        numa-vmstat.node1.nr_pages_scanned
    296681              30%     385708              45%     431591        n=
uma-vmstat.node1.nr_zone_inactive_file
    296681              30%     385709              45%     431591        n=
uma-vmstat.node1.nr_inactive_file
   5252547                     5401234              13%    5936151        n=
uma-vmstat.node1.nr_zone_active_file
   5252547                     5401238              13%    5936151        n=
uma-vmstat.node1.nr_active_file
    136060             -19%     110021             -21%     107114        n=
uma-vmstat.node1.nr_zone_write_pending
    136060             -19%     110019             -21%     107107        n=
uma-vmstat.node1.nr_dirty
   1520682 =C2=B1  3%        76%    2681012              98%    3008493    =
    numa-vmstat.node1.numa_miss
   2413468             -18%    1980184             -39%    1466738        n=
uma-vmstat.node1.nr_free_pages
   1344474 =C2=B1  3%       102%    2715690 =C2=B1  4%        67%    224515=
9        numa-vmstat.node1.numa_foreign
     20160                       19698             -22%      15673        n=
uma-vmstat.node1.nr_free_cma
  14350439              12%   16005551              27%   18257157        n=
uma-vmstat.node1.numa_local
  14350440              12%   16005552              27%   18257158        n=
uma-vmstat.node1.numa_hit
  15381788               9%   16829619              21%   18645441        n=
uma-vmstat.node1.nr_dirtied
    140354              11%     156202              21%     169950        n=
uma-vmstat.node1.nr_slab_reclaimable
     39848              10%      43676              16%      46041        n=
uma-vmstat.node1.nr_zone_unevictable
     39848              10%      43676              16%      46041        n=
uma-vmstat.node1.nr_unevictable
       377 =C2=B1  9%                   370 =C2=B1  5%        24%        46=
8        slabinfo.bdev_cache.active_objs
       377 =C2=B1  9%                   370 =C2=B1  5%        24%        46=
8        slabinfo.bdev_cache.num_objs
       389 =C2=B1 13%       604%       2737 =C2=B1 23%      3371%      1350=
1        slabinfo.bio-1.active_objs
       389 =C2=B1 13%       612%       2770 =C2=B1 24%      3441%      1377=
4        slabinfo.bio-1.num_objs
         7 =C2=B1 17%      1039%         83 =C2=B1 24%      3623%        27=
3        slabinfo.bio-1.active_slabs
         7 =C2=B1 17%      1039%         83 =C2=B1 24%      3623%        27=
3        slabinfo.bio-1.num_slabs
       978 =C2=B1  4%        10%       1075              17%       1144    =
    slabinfo.blkdev_requests.active_objs
       978 =C2=B1  4%        10%       1075              17%       1144    =
    slabinfo.blkdev_requests.num_objs
  10942119               3%   11286505              13%   12389701        s=
labinfo.buffer_head.num_objs
    280566               3%     289397              13%     317684        s=
labinfo.buffer_head.active_slabs
    280566               3%     289397              13%     317684        s=
labinfo.buffer_head.num_slabs
  10941627                    10693692              11%   12140372        s=
labinfo.buffer_head.active_objs
      7436 =C2=B1  3%                  7558              20%       8922    =
    slabinfo.cred_jar.active_objs
      7436 =C2=B1  3%                  7558              20%       8922    =
    slabinfo.cred_jar.num_objs
      4734              85%       8767 =C2=B1  8%        60%       7554    =
    slabinfo.kmalloc-128.num_objs
      4734              78%       8418 =C2=B1  8%        45%       6848    =
    slabinfo.kmalloc-128.active_objs
     17074             -11%      15121             -10%      15379        s=
labinfo.kmalloc-256.num_objs
      3105               4%       3216              14%       3527        s=
labinfo.kmalloc-4096.num_objs
      3061               4%       3170              12%       3419        s=
labinfo.kmalloc-4096.active_objs
     13131 =C2=B1  3%        17%      15379              12%      14714    =
    slabinfo.kmalloc-512.num_objs
      1623 =C2=B1  3%                  1664 =C2=B1  3%        16%       188=
9        slabinfo.mnt_cache.active_objs
      1623 =C2=B1  3%                  1664 =C2=B1  3%        16%       188=
9        slabinfo.mnt_cache.num_objs
      2670               6%       2821              19%       3178        s=
labinfo.nsproxy.active_objs
      2670               6%       2821              19%       3178        s=
labinfo.nsproxy.num_objs
      2532               5%       2656              17%       2959        s=
labinfo.posix_timers_cache.active_objs
      2532               5%       2656              17%       2959        s=
labinfo.posix_timers_cache.num_objs
     20689              87%      38595 =C2=B1 13%        47%      30452    =
    slabinfo.radix_tree_node.active_objs
       399              83%        730 =C2=B1 13%        47%        587    =
    slabinfo.radix_tree_node.active_slabs
       399              83%        730 =C2=B1 13%        47%        587    =
    slabinfo.radix_tree_node.num_slabs
     22379              83%      40931 =C2=B1 13%        47%      32872    =
    slabinfo.radix_tree_node.num_objs
      4688                        4706              22%       5712        s=
labinfo.sigqueue.active_objs
      4688                        4706              22%       5712        s=
labinfo.sigqueue.num_objs
       979 =C2=B1  4%         7%       1046 =C2=B1  3%       -15%        83=
3        slabinfo.task_group.active_objs
       979 =C2=B1  4%         7%       1046 =C2=B1  3%       -15%        83=
3        slabinfo.task_group.num_objs
      1344               5%       1410              17%       1570        s=
labinfo.xfs_btree_cur.active_objs
      1344               5%       1410              17%       1570        s=
labinfo.xfs_btree_cur.num_objs
      2500               5%       2632              18%       2946        s=
labinfo.xfs_da_state.active_objs
      2500               5%       2632              18%       2946        s=
labinfo.xfs_da_state.num_objs
      1299             279%       4917 =C2=B1 17%       134%       3035    =
    slabinfo.xfs_efd_item.num_objs
      1299             278%       4911 =C2=B1 17%       126%       2940    =
    slabinfo.xfs_efd_item.active_objs
      1904 =C2=B1  3%         4%       1982              42%       2703    =
    slabinfo.xfs_inode.num_objs
      1904 =C2=B1  3%         4%       1982              39%       2644    =
    slabinfo.xfs_inode.active_objs
      1659             113%       3538 =C2=B1 27%      1360%      24227    =
    slabinfo.xfs_log_ticket.active_objs
      1659             116%       3588 =C2=B1 27%      1369%      24383    =
    slabinfo.xfs_log_ticket.num_objs
        37             169%         99 =C2=B1 29%      1405%        557    =
    slabinfo.xfs_log_ticket.active_slabs
        37             169%         99 =C2=B1 29%      1405%        557    =
    slabinfo.xfs_log_ticket.num_slabs
      2615              84%       4821 =C2=B1 28%      1549%      43132    =
    slabinfo.xfs_trans.active_objs
      2615              86%       4860 =C2=B1 28%      1551%      43171    =
    slabinfo.xfs_trans.num_objs
        37             162%         97 =C2=B1 30%      1614%        634    =
    slabinfo.xfs_trans.active_slabs
        37             162%         97 =C2=B1 30%      1614%        634    =
    slabinfo.xfs_trans.num_slabs
      3255 =C2=B1 12%      9210%     303094           38966%    1271810    =
    sched_debug.cfs_rq:/.min_vruntime.avg
      8273 =C2=B1 10%       382%      39836 =C2=B1 17%       309%      3380=
6        sched_debug.cfs_rq:/.load.avg
       716 =C2=B1 34%     28783%     206899           1e+05%    1034000    =
    sched_debug.cfs_rq:/.min_vruntime.min
      1830 =C2=B1  5%      4365%      81731           10579%     195502    =
    sched_debug.cfs_rq:/.min_vruntime.stddev
      1845 =C2=B1  4%      4330%      81754           10503%     195683    =
    sched_debug.cfs_rq:/.spread0.stddev
     73578 =C2=B1 34%      1043%     841209 =C2=B1 34%       452%     40584=
8        sched_debug.cfs_rq:/.load.max
     12.67 =C2=B1 35%      3999%     519.25            1979%     263.33    =
    sched_debug.cfs_rq:/.runnable_load_avg.max
      2.34 =C2=B1 33%      4268%     102.01            1854%      45.63    =
    sched_debug.cfs_rq:/.runnable_load_avg.stddev
     10284 =C2=B1 12%      4107%     432665 =C2=B1  7%     15350%    158897=
3        sched_debug.cfs_rq:/.min_vruntime.max
      1.05 =C2=B1 20%      2335%      25.54            1631%      18.15    =
    sched_debug.cfs_rq:/.runnable_load_avg.avg
     44.06 =C2=B1 28%       254%     155.90 =C2=B1 16%       310%     180.4=
9        sched_debug.cfs_rq:/.util_avg.stddev
     15448 =C2=B1 19%       831%     143829 =C2=B1 22%       422%      8058=
5        sched_debug.cfs_rq:/.load.stddev
       597 =C2=B1 13%       -39%        367 =C2=B1 17%       -49%        30=
3        sched_debug.cfs_rq:/.util_avg.min
      1464 =C2=B1 23%       -55%        664 =C2=B1 30%       -63%        54=
6        sched_debug.cfs_rq:/.load_avg.min
      1830 =C2=B1  3%       -50%        911 =C2=B1  5%       -65%        64=
2        sched_debug.cfs_rq:/.load_avg.avg
      0.30 =C2=B1 13%        22%       0.36 =C2=B1 11%        86%       0.5=
6        sched_debug.cfs_rq:/.nr_running.avg
      2302 =C2=B1 11%       -31%       1589             -50%       1157    =
    sched_debug.cfs_rq:/.load_avg.max
       819 =C2=B1  3%        36%       1116              15%        940    =
    sched_debug.cfs_rq:/.util_avg.max
       728             -14%        630              -9%        664        s=
ched_debug.cfs_rq:/.util_avg.avg
     73578 =C2=B1 34%      1043%     841209 =C2=B1 34%       452%     40584=
8        sched_debug.cpu.load.max
      1.81 =C2=B1 11%        77%       3.22             395%       8.98    =
    sched_debug.cpu.clock.stddev
      1.81 =C2=B1 11%        77%       3.22             395%       8.98    =
    sched_debug.cpu.clock_task.stddev
      8278 =C2=B1 10%       379%      39671 =C2=B1 18%       305%      3351=
7        sched_debug.cpu.load.avg
      3600             385%      17452            1023%      40419        s=
ched_debug.cpu.nr_load_updates.min
      5446             305%      22069             754%      46492        s=
ched_debug.cpu.nr_load_updates.avg
      8627 =C2=B1  5%       217%      27314             517%      53222    =
    sched_debug.cpu.nr_load_updates.max
      6221 =C2=B1  3%      2137%     139191            3486%     223092    =
    sched_debug.cpu.nr_switches.max
     15.67 =C2=B1 40%      3187%     515.00            1579%     263.00    =
    sched_debug.cpu.cpu_load[0].max
      2.55 =C2=B1 33%      3886%     101.45            1697%      45.73    =
    sched_debug.cpu.cpu_load[0].stddev
     15452 =C2=B1 19%       831%     143937 =C2=B1 22%       421%      8043=
1        sched_debug.cpu.load.stddev
      1144             236%       3839             329%       4911        s=
ched_debug.cpu.nr_load_updates.stddev
     23.67 =C2=B1 41%       709%     191.50 =C2=B1  6%       637%     174.3=
3        sched_debug.cpu.nr_uninterruptible.max
       978            7241%      71831 =C2=B1  3%     13746%     135493    =
    sched_debug.cpu.nr_switches.avg
      0.96 =C2=B1 19%      2503%      24.95            1720%      17.44    =
    sched_debug.cpu.cpu_load[0].avg
       957 =C2=B1  4%      3406%      33568            3626%      35679    =
    sched_debug.cpu.nr_switches.stddev
     29644 =C2=B1 16%       107%      61350 =C2=B1  8%       190%      8611=
1        sched_debug.cpu.clock.max
     29644 =C2=B1 16%       107%      61350 =C2=B1  8%       190%      8611=
1        sched_debug.cpu.clock_task.max
     29640 =C2=B1 16%       107%      61344 =C2=B1  8%       190%      8609=
6        sched_debug.cpu.clock.avg
     29640 =C2=B1 16%       107%      61344 =C2=B1  8%       190%      8609=
6        sched_debug.cpu.clock_task.avg
     29635 =C2=B1 16%       107%      61338 =C2=B1  8%       190%      8607=
9        sched_debug.cpu.clock.min
     29635 =C2=B1 16%       107%      61338 =C2=B1  8%       190%      8607=
9        sched_debug.cpu.clock_task.min
       335 =C2=B1  4%      7948%      27014           22596%      76183    =
    sched_debug.cpu.nr_switches.min
      1.62 =C2=B1 32%      1784%      30.61 =C2=B1  3%      1100%      19.5=
1        sched_debug.cpu.cpu_load[4].avg
      5.46 =C2=B1 15%      2325%     132.40            1031%      61.73    =
    sched_debug.cpu.nr_uninterruptible.stddev
       424 =C2=B1 11%       106%        875 =C2=B1 13%       263%       154=
1        sched_debug.cpu.curr->pid.avg
      1400             166%       3721             264%       5100        s=
ched_debug.cpu.curr->pid.max
       610 =C2=B1  3%       108%       1269             126%       1380    =
    sched_debug.cpu.curr->pid.stddev
      0.43 =C2=B1 15%         4%       0.45 =C2=B1 16%        48%       0.6=
4        sched_debug.cpu.nr_running.avg
    253789 =C2=B1 13%        -5%     241499 =C2=B1  3%       -22%     19838=
3        sched_debug.cpu.avg_idle.stddev
     29638 =C2=B1 16%       107%      61339 =C2=B1  8%       190%      8607=
9        sched_debug.cpu_clk
     28529 =C2=B1 17%       111%      60238 =C2=B1  8%       198%      8495=
7        sched_debug.ktime
      0.17             -74%       0.04 =C2=B1  8%       -83%       0.03    =
    sched_debug.rt_rq:/.rt_time.avg
      0.85 =C2=B1  3%       -74%       0.22 =C2=B1  8%       -83%       0.1=
4        sched_debug.rt_rq:/.rt_time.stddev
      5.14 =C2=B1 10%       -75%       1.28 =C2=B1  6%       -83%       0.8=
8        sched_debug.rt_rq:/.rt_time.max
     29638 =C2=B1 16%       107%      61339 =C2=B1  8%       190%      8607=
9        sched_debug.sched_clk

aim7/1BRD_48G-xfs-disk_rd-9000-performance/ivb44

99091700659f4df9  ca2edab2e1d8f30dda874b7f71  fe9c2c81ed073878768785a985  =

----------------  --------------------------  --------------------------  =

    473257                      468546               5%     497512        a=
im7.jobs-per-min
    613996              11%     681283              -7%     571701        a=
im7.time.involuntary_context_switches
      4914                        4977              -6%       4634        a=
im7.time.system_time
    114.83                      115.98              -5%     109.23        a=
im7.time.elapsed_time
    114.83                      115.98              -5%     109.23        a=
im7.time.elapsed_time.max
     60711 =C2=B1  8%        20%      73007              -9%      55449    =
    aim7.time.voluntary_context_switches
      2509              -6%       2360              -4%       2416        a=
im7.time.maximum_resident_set_size
    362268              19%     430263              -8%     332046        s=
oftirqs.RCU
       352 =C2=B1  7%       -32%        238             -35%        230    =
    vmstat.procs.r
         5 =C2=B1 16%        80%          9             -40%          3    =
    vmstat.procs.b
      9584               7%      10255             -10%       8585        v=
mstat.system.cs
     20442 =C2=B1  5%        38%      28201             -40%      12270    =
    cpuidle.C1-IVT.usage
      3.95              -3%       3.81               9%       4.29        t=
urbostat.CPU%c1
      0.81 =C2=B1 14%        44%       1.17              28%       1.04    =
    turbostat.Pkg%pc6
     19711 =C2=B1  5%        -7%      18413             -17%      16384    =
    meminfo.AnonHugePages
   3974485                     3977216              27%    5046310        m=
eminfo.DirectMap2M
    139742 =C2=B1  4%                137012             -17%     116493    =
    meminfo.DirectMap4k
    244933 =C2=B1  4%        -7%     228626              15%     280670    =
    meminfo.PageTables
     12.47 =C2=B1 39%        84%      22.89              64%      20.46    =
    perf-profile.func.cycles-pp.poll_idle
     57.44 =C2=B1  6%       -10%      51.55             -13%      50.13    =
    perf-profile.func.cycles-pp.intel_idle
      0.20               3%       0.20              -5%       0.19        p=
erf-stat.branch-miss-rate
 5.356e+08               4%  5.552e+08              -6%  5.046e+08        p=
erf-stat.branch-misses
   1113549               7%    1187535             -15%     951607        p=
erf-stat.context-switches
  1.48e+13                   1.491e+13              -6%  1.397e+13        p=
erf-stat.cpu-cycles
    101697 =C2=B1  3%         9%     111167              -3%      98319    =
    perf-stat.cpu-migrations
      0.69 =C2=B1 20%       -17%       0.57             139%       1.65    =
    perf-stat.dTLB-load-miss-rate
 3.264e+09 =C2=B1 19%       -17%  2.712e+09             148%  8.084e+09    =
    perf-stat.dTLB-load-misses
 4.695e+11                   4.718e+11                   4.818e+11        p=
erf-stat.dTLB-loads
 3.276e+11 =C2=B1  3%             3.303e+11               8%  3.528e+11    =
    perf-stat.dTLB-stores
     56.47 =C2=B1 19%        41%      79.48             -58%      23.96    =
    perf-stat.iTLB-load-miss-rate
  48864487 =C2=B1  4%         7%   52183944             -12%   43166037    =
    perf-stat.iTLB-load-misses
  40455495 =C2=B1 41%       -67%   13468883             239%   1.37e+08    =
    perf-stat.iTLB-loads
     29278 =C2=B1  4%        -6%      27480              12%      32844    =
    perf-stat.instructions-per-iTLB-miss
      0.10                        0.10               5%       0.10        p=
erf-stat.ipc
     47.16                       46.36                       46.51        p=
erf-stat.node-store-miss-rate
      6568 =C2=B1 44%       -59%       2721             -71%       1916    =
    numa-meminfo.node0.Shmem
    194395               7%     207086              15%     224164        n=
uma-meminfo.node0.Active
     10218 =C2=B1 24%       -37%       6471             -36%       6494    =
    numa-meminfo.node0.Mapped
      7496 =C2=B1 34%       -97%        204              37%      10278    =
    numa-meminfo.node0.AnonHugePages
    178888               6%     188799              16%     208213        n=
uma-meminfo.node0.AnonPages
    179468               6%     191062              17%     209704        n=
uma-meminfo.node0.Active(anon)
    256890             -15%     219489             -15%     219503        n=
uma-meminfo.node1.Active
     12213 =C2=B1 24%        49%      18208             -50%       6105    =
    numa-meminfo.node1.AnonHugePages
     45080 =C2=B1 23%       -33%      30138              87%      84468    =
    numa-meminfo.node1.PageTables
    241623             -15%     204604             -16%     203913        n=
uma-meminfo.node1.Active(anon)
    240637             -15%     204491             -15%     203847        n=
uma-meminfo.node1.AnonPages
  23782392 =C2=B1139%       673%  1.838e+08            -100%          0    =
    latency_stats.sum.wait_on_page_bit.__migration_entry_wait.migration_ent=
ry_wait.do_swap_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fau=
lt
     61157 =C2=B1  4%        -6%      57187              14%      69751    =
    proc-vmstat.nr_page_table_pages
      1641 =C2=B1 44%       -59%        679             -71%        478    =
    numa-vmstat.node0.nr_shmem
      2655 =C2=B1 23%       -35%       1715             -35%       1726    =
    numa-vmstat.node0.nr_mapped
     44867               5%      47231              16%      52261        n=
uma-vmstat.node0.nr_anon_pages
     45014               6%      47793              17%      52636        n=
uma-vmstat.node0.nr_zone_active_anon
     45014               6%      47793              17%      52636        n=
uma-vmstat.node0.nr_active_anon
     11300 =C2=B1 23%       -33%       7542              88%      21209    =
    numa-vmstat.node1.nr_page_table_pages
     60581             -16%      51156             -15%      51193        n=
uma-vmstat.node1.nr_zone_active_anon
     60581             -16%      51156             -15%      51193        n=
uma-vmstat.node1.nr_active_anon
     60328             -15%      51127             -15%      51174        n=
uma-vmstat.node1.nr_anon_pages
     13671                       13608              11%      15190        s=
labinfo.cred_jar.active_objs
     13707                       13608              11%      15231        s=
labinfo.cred_jar.num_objs
     24109                       24386             -11%      21574        s=
labinfo.kmalloc-16.active_objs
     24109                       24386             -11%      21574        s=
labinfo.kmalloc-16.num_objs
     13709 =C2=B1  6%                 13391             -15%      11600    =
    slabinfo.kmalloc-512.active_objs
     13808 =C2=B1  6%                 13454             -16%      11657    =
    slabinfo.kmalloc-512.num_objs
   1456658               4%    1511260              15%    1675984        s=
ched_debug.cfs_rq:/.min_vruntime.min
    441613 =C2=B1  3%       -28%     316751             -76%     105734    =
    sched_debug.cfs_rq:/.min_vruntime.stddev
    443999 =C2=B1  3%       -28%     318033             -76%     106909    =
    sched_debug.cfs_rq:/.spread0.stddev
   2657974                     2625551             -19%    2158111        s=
ched_debug.cfs_rq:/.min_vruntime.max
      0.22 =C2=B1 23%        96%       0.43             109%       0.46    =
    sched_debug.cfs_rq:/.nr_spread_over.stddev
      1.50             100%       3.00             133%       3.50        s=
ched_debug.cfs_rq:/.nr_spread_over.max
    111.95 =C2=B1 26%        15%     128.92             128%     254.81    =
    sched_debug.cfs_rq:/.exec_clock.stddev
       802               3%        829             -16%        671        s=
ched_debug.cfs_rq:/.load_avg.min
       874                         879             -11%        780        s=
ched_debug.cfs_rq:/.load_avg.avg
      1256 =C2=B1 17%       -20%       1011             -24%        957    =
    sched_debug.cfs_rq:/.load_avg.max
      1.33 =C2=B1 35%      -100%       0.00             200%       4.00    =
    sched_debug.cpu.cpu_load[4].min
      4.56 =C2=B1  6%       -11%       4.07             -27%       3.33    =
    sched_debug.cpu.cpu_load[4].stddev
      4.76 =C2=B1  3%       -13%       4.14             -30%       3.35    =
    sched_debug.cpu.cpu_load[3].stddev
     25.17 =C2=B1 12%       -26%      18.50             -21%      20.00    =
    sched_debug.cpu.cpu_load[3].max
     25.67 =C2=B1  9%       -32%      17.50             -24%      19.50    =
    sched_debug.cpu.cpu_load[0].max
      4.67 =C2=B1  3%       -17%       3.90             -22%       3.62    =
    sched_debug.cpu.cpu_load[0].stddev
      4.88             -15%       4.14             -31%       3.39        s=
ched_debug.cpu.cpu_load[2].stddev
     26.17 =C2=B1 10%       -29%      18.50             -25%      19.50    =
    sched_debug.cpu.cpu_load[2].max
      7265               4%       7556             -12%       6419        s=
ched_debug.cpu.nr_switches.avg
      9.41 =C2=B1 10%                  9.67              21%      11.38    =
    sched_debug.cpu.cpu_load[1].avg
      9.03 =C2=B1 12%         3%       9.32              23%      11.09    =
    sched_debug.cpu.cpu_load[0].avg
      4140 =C2=B1  4%       -11%       3698             -11%       3703    =
    sched_debug.cpu.nr_switches.stddev
      9.41 =C2=B1 10%         3%       9.71              22%      11.49    =
    sched_debug.cpu.cpu_load[3].avg
      4690                        4821              -9%       4257        s=
ched_debug.cpu.nr_switches.min
      9.39 =C2=B1  9%         3%       9.69              23%      11.52    =
    sched_debug.cpu.cpu_load[4].avg
      9.43 =C2=B1 10%                  9.71              21%      11.44    =
    sched_debug.cpu.cpu_load[2].avg
     57.92 =C2=B1 18%        -4%      55.55             -23%      44.50    =
    sched_debug.cpu.nr_uninterruptible.stddev
      3002 =C2=B1  3%        10%       3288              31%       3919    =
    sched_debug.cpu.curr->pid.avg
      6666                        6652             -10%       6025        s=
ched_debug.cpu.curr->pid.max
      1379                        1361             -19%       1118        s=
ched_debug.cpu.ttwu_local.avg
      1849 =C2=B1  3%       -12%       1628             -18%       1517    =
    sched_debug.cpu.ttwu_local.stddev
      1679 =C2=B1  8%         4%       1738             -15%       1423    =
    sched_debug.cpu.curr->pid.stddev
      1.58 =C2=B1 33%       -11%       1.41              65%       2.60    =
    sched_debug.cpu.nr_running.avg
      1767               6%       1880             -16%       1489        s=
ched_debug.cpu.ttwu_count.avg
       506 =C2=B1  6%       -15%        430             -17%        419    =
    sched_debug.cpu.ttwu_count.min
      7139               8%       7745             -11%       6355        s=
ched_debug.cpu.sched_count.avg
      4355               6%       4625             -11%       3884        s=
ched_debug.cpu.sched_count.min
      4.91 =C2=B1  3%       -16%       4.13             -28%       3.52    =
    sched_debug.cpu.cpu_load[1].stddev
     26.67 =C2=B1  9%       -29%      19.00             -27%      19.50    =
    sched_debug.cpu.cpu_load[1].max
       209 =C2=B1  8%        19%        247             -15%        178    =
    sched_debug.cpu.sched_goidle.avg
      5.67 =C2=B1 27%       -12%       5.00              50%       8.50    =
    sched_debug.cpu.nr_running.max
     36072 =C2=B1  7%        70%      61152              17%      42236    =
    sched_debug.cpu.sched_count.max
      2008              -8%       1847             -18%       1645        s=
ched_debug.cpu.ttwu_count.stddev
      0.07 =C2=B1 19%       -20%       0.06             186%       0.21    =
    sched_debug.rt_rq:/.rt_time.avg
      0.36 =C2=B1 17%       -23%       0.28             142%       0.88    =
    sched_debug.rt_rq:/.rt_time.stddev
      2.33 =C2=B1 15%       -27%       1.70              87%       4.35    =
    sched_debug.rt_rq:/.rt_time.max

aim7/1BRD_48G-xfs-disk_cp-3000-performance/ivb44

99091700659f4df9  ca2edab2e1d8f30dda874b7f71  fe9c2c81ed073878768785a985  =

----------------  --------------------------  --------------------------  =

    270459                      272267 =C2=B1  3%       -48%     139834 =C2=
=B1  3%  aim7.jobs-per-min
     21229 =C2=B1  5%                 20896 =C2=B1  3%       449%     11651=
6 =C2=B1  6%  aim7.time.involuntary_context_switches
      1461 =C2=B1  5%                  1454 =C2=B1  5%       174%       399=
8 =C2=B1  3%  aim7.time.system_time
    155368                      153149             149%     386164        a=
im7.time.minor_page_faults
     66.84                       66.41 =C2=B1  3%        93%     129.07 =C2=
=B1  3%  aim7.time.elapsed_time
     66.84                       66.41 =C2=B1  3%        93%     129.07 =C2=
=B1  3%  aim7.time.elapsed_time.max
    328369               3%     339077              96%     644393        a=
im7.time.voluntary_context_switches
     49489 =C2=B1 11%        -8%      45459              39%      68941 =C2=
=B1  4%  interrupts.CAL:Function_call_interrupts
     96.62 =C2=B1  7%                 97.09              61%     155.12    =
    uptime.boot
    186640 =C2=B1 10%                186707             127%     424522 =C2=
=B1  4%  softirqs.RCU
    146596                      147043              37%     201373        s=
oftirqs.SCHED
   1005660 =C2=B1  3%                991053 =C2=B1  4%       118%    219651=
3        softirqs.TIMER
     66.84                       66.41 =C2=B1  3%        93%     129.07 =C2=
=B1  3%  time.elapsed_time
     66.84                       66.41 =C2=B1  3%        93%     129.07 =C2=
=B1  3%  time.elapsed_time.max
     21229 =C2=B1  5%                 20896 =C2=B1  3%       449%     11651=
6 =C2=B1  6%  time.involuntary_context_switches
    155368                      153149             149%     386164        t=
ime.minor_page_faults
      2212                        2215              41%       3112        t=
ime.percent_of_cpu_this_job_got
      1461 =C2=B1  5%                  1454 =C2=B1  5%       174%       399=
8 =C2=B1  3%  time.system_time
    328369               3%     339077              96%     644393        t=
ime.voluntary_context_switches
   1197810 =C2=B1 16%       -67%     393936 =C2=B1 40%       -56%     53066=
8 =C2=B1 43%  numa-numastat.node0.numa_miss
   1196269 =C2=B1 16%       -68%     387751 =C2=B1 40%       -55%     53301=
3 =C2=B1 42%  numa-numastat.node1.numa_foreign
       112             159%        292 =C2=B1  4%       146%        277    =
    vmstat.memory.buff
  16422228                    16461619             -28%   11832310        v=
mstat.memory.free
        22              -3%         22              87%         42 =C2=B1  =
3%  vmstat.procs.r
     48853                       48768                       50273        v=
mstat.system.in
    125202               8%     135626              51%     189515 =C2=B1  =
4%  cpuidle.C1-IVT.usage
  28088338 =C2=B1  3%        11%   31082173              17%   32997314 =C2=
=B1  5%  cpuidle.C1-IVT.time
   3471814              27%    4422338 =C2=B1 15%      2877%  1.034e+08 =C2=
=B1  3%  cpuidle.C1E-IVT.time
     33353               8%      36128             703%     267725        c=
puidle.C1E-IVT.usage
  11371800               9%   12381174             244%   39113028        c=
puidle.C3-IVT.time
     64048               5%      67490              62%     103940        c=
puidle.C3-IVT.usage
 1.637e+09                   1.631e+09              20%  1.959e+09        c=
puidle.C6-IVT.time
   1861259               4%    1931551              19%    2223599        c=
puidle.C6-IVT.usage
       230 =C2=B1  9%        42%        326            1631%       3986    =
    cpuidle.POLL.usage
   1724995 =C2=B1 41%        54%    2656939 =C2=B1 10%       112%    366279=
1        cpuidle.POLL.time
     48.48                       48.15              36%      65.85        t=
urbostat.%Busy
      1439                        1431              36%       1964        t=
urbostat.Avg_MHz
     33.28                       33.45             -25%      24.85        t=
urbostat.CPU%c1
     18.09 =C2=B1  3%                 18.24 =C2=B1  4%       -49%       9.1=
6        turbostat.CPU%c6
       134                         133               8%        144        t=
urbostat.CorWatt
      5.39 =C2=B1 17%         4%       5.63 =C2=B1  8%       -34%       3.5=
4        turbostat.Pkg%pc2
      2.97 =C2=B1 44%       -17%       2.48 =C2=B1 32%       -70%       0.9=
1 =C2=B1 22%  turbostat.Pkg%pc6
       167                         167               6%        177        t=
urbostat.PkgWatt
     10.27                       10.43             -14%       8.79        t=
urbostat.RAMWatt
  44376005            -100%     205734            -100%     214640        m=
eminfo.Active
  44199835            -100%      30412            -100%      30241        m=
eminfo.Active(file)
    103029 =C2=B1  3%        27%     130507 =C2=B1  6%        29%     13311=
4 =C2=B1  8%  meminfo.CmaFree
    124701 =C2=B1  4%                123685 =C2=B1 14%        16%     14418=
0 =C2=B1  3%  meminfo.DirectMap4k
      7886 =C2=B1  4%                  7993 =C2=B1  5%       144%      1923=
1 =C2=B1  7%  meminfo.Dirty
   2472446            1791%   46747572            1976%   51320420        m=
eminfo.Inactive
   2463353            1797%   46738477            1983%   51311261        m=
eminfo.Inactive(file)
  16631615                    16664565             -28%   11936074        m=
eminfo.MemFree
 4.125e+11              -5%  3.927e+11             103%   8.36e+11        p=
erf-stat.branch-instructions
      0.41             -20%       0.33             -43%       0.23        p=
erf-stat.branch-miss-rate
 1.671e+09             -23%   1.28e+09              16%  1.946e+09        p=
erf-stat.branch-misses
 7.138e+09              -3%  6.917e+09              23%  8.746e+09        p=
erf-stat.cache-misses
 2.036e+10              -4%  1.956e+10              22%  2.476e+10        p=
erf-stat.cache-references
    821470               4%     851532              88%    1548125 =C2=B1  =
3%  perf-stat.context-switches
  4.93e+12 =C2=B1  3%        -4%  4.755e+12 =C2=B1  4%       154%   1.25e+1=
3        perf-stat.cpu-cycles
    125073               4%     129993             167%     333599        p=
erf-stat.cpu-migrations
 3.595e+09 =C2=B1 16%       -19%  2.895e+09 =C2=B1 17%        39%  4.987e+0=
9 =C2=B1 10%  perf-stat.dTLB-load-misses
 6.411e+11                   6.339e+11 =C2=B1  3%        57%  1.004e+12    =
    perf-stat.dTLB-loads
      0.06 =C2=B1  3%       -42%       0.04              87%       0.12 =C2=
=B1  3%  perf-stat.dTLB-store-miss-rate
 2.738e+08             -39%  1.675e+08              64%  4.502e+08 =C2=B1  =
5%  perf-stat.dTLB-store-misses
 4.321e+11               5%  4.552e+11             -12%   3.81e+11 =C2=B1  =
8%  perf-stat.dTLB-stores
 2.343e+12              -5%  2.229e+12              67%  3.918e+12        p=
erf-stat.instructions
     46162 =C2=B1 41%                 46733 =C2=B1  3%        55%      7150=
0        perf-stat.instructions-per-iTLB-miss
      0.48 =C2=B1  4%                  0.47 =C2=B1  5%       -34%       0.3=
1        perf-stat.ipc
    325877                      322934             115%     699924        p=
erf-stat.minor-faults
     42.88               3%      44.33                       43.65        p=
erf-stat.node-load-miss-rate
 9.499e+08                   9.578e+08              66%  1.581e+09        p=
erf-stat.node-load-misses
 1.266e+09              -5%  1.203e+09              61%   2.04e+09        p=
erf-stat.node-loads
     39.17                       40.00               8%      42.12        p=
erf-stat.node-store-miss-rate
 3.198e+09               4%  3.318e+09              36%  4.344e+09        p=
erf-stat.node-store-misses
 4.966e+09                   4.977e+09              20%  5.968e+09        p=
erf-stat.node-stores
    325852                      322963             115%     699918        p=
erf-stat.page-faults
  21719324            -100%      15215 =C2=B1  3%      -100%      14631    =
    numa-meminfo.node0.Active(file)
   1221037            1806%   23278263            1969%   25269114        n=
uma-meminfo.node0.Inactive(file)
   1223564            1803%   23286857            1965%   25269597        n=
uma-meminfo.node0.Inactive
  21811771            -100%     102448            -100%     104424        n=
uma-meminfo.node0.Active
      2971 =C2=B1 13%        -8%       2734 =C2=B1  3%       157%       762=
6 =C2=B1  4%  numa-meminfo.node0.Dirty
   8476780                     8356206             -27%    6162743        n=
uma-meminfo.node0.MemFree
    617361                      611434              11%     687829        n=
uma-meminfo.node0.SReclaimable
   1249068            1779%   23471025            1985%   26046948        n=
uma-meminfo.node1.Inactive
   1242501            1789%   23470523            1996%   26038272        n=
uma-meminfo.node1.Inactive(file)
  22500867            -100%      15202 =C2=B1  4%      -100%      15613    =
    numa-meminfo.node1.Active(file)
  22584509            -100%     103192 =C2=B1  6%      -100%     109976    =
    numa-meminfo.node1.Active
      4814 =C2=B1 13%                  4957 =C2=B1  5%       135%      1133=
5        numa-meminfo.node1.Dirty
   8132889                     8297084 =C2=B1  3%       -29%    5777419 =C2=
=B1  3%  numa-meminfo.node1.MemFree
     83641 =C2=B1  7%         5%      87990 =C2=B1  7%        13%      9436=
3        numa-meminfo.node1.Active(anon)
     82877 =C2=B1  7%         4%      86528 =C2=B1  6%        13%      9362=
0        numa-meminfo.node1.AnonPages
         0                           0                      842360 =C2=B110=
0%  latency_stats.avg.call_rwsem_down_write_failed.do_unlinkat.SyS_unlink.d=
o_syscall_64.return_from_SYSCALL_64
       113 =C2=B1173%       232%        376 =C2=B1100%     2e+05%     20326=
9 =C2=B1  4%  latency_stats.hits.wait_on_page_bit.__migration_entry_wait.mi=
gration_entry_wait.do_swap_page.handle_mm_fault.__do_page_fault.do_page_fau=
lt.page_fault
      5245 =C2=B1 14%                  5325 =C2=B1  3%       535%      3328=
6 =C2=B1 23%  latency_stats.max.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get=
_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_a=
gi.xfs_dialloc.xfs_ialloc.xfs_dir_ialloc.xfs_create
      1133 =C2=B1173%       113%       2416 =C2=B1100%      1351%      1643=
4        latency_stats.max.wait_on_page_bit.__migration_entry_wait.migratio=
n_entry_wait.do_swap_page.handle_mm_fault.__do_page_fault.do_page_fault.pag=
e_fault
         0                           0                      842360 =C2=B110=
0%  latency_stats.max.call_rwsem_down_write_failed.do_unlinkat.SyS_unlink.d=
o_syscall_64.return_from_SYSCALL_64
      7813 =C2=B1 13%       -33%       5197 =C2=B1  9%       403%      3930=
5 =C2=B1 18%  latency_stats.max.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get=
_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink_remov=
e.xfs_ifree.xfs_inactive_ifree.xfs_inactive.xfs_fs_destroy_inode
      5271 =C2=B1 13%        -3%       5091 =C2=B1  5%       288%      2046=
7        latency_stats.max.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.=
xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink.xfs_dropli=
nk.xfs_remove.xfs_vn_unlink.vfs_unlink
     10369 =C2=B1 17%       -41%       6086 =C2=B1 21%       -96%        38=
5 =C2=B1100%  latency_stats.max.wait_on_page_bit.truncate_inode_pages_range=
.truncate_inode_pages_final.evict.iput.dentry_unlink_inode.__dentry_kill.dp=
ut.__fput.____fput.task_work_run.exit_to_usermode_loop
     94417 =C2=B1173%       556%     619712 =C2=B1100%     3e+05%  3.061e+0=
8 =C2=B1  5%  latency_stats.sum.wait_on_page_bit.__migration_entry_wait.mig=
ration_entry_wait.do_swap_page.handle_mm_fault.__do_page_fault.do_page_faul=
t.page_fault
  22126648 =C2=B1  4%              22776886            1311%  3.123e+08 =C2=
=B1  7%  latency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.=
xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink_remove.xfs=
_ifree.xfs_inactive_ifree.xfs_inactive.xfs_fs_destroy_inode
      2536 =C2=B1117%       -98%         48 =C2=B1 43%      2059%      5476=
5 =C2=B1100%  latency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get=
_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agf.xfs_alloc_read_ag=
f.xfs_alloc_fix_freelist.xfs_free_extent_fix_freelist.xfs_free_extent.xfs_t=
rans_free_extent
   1702264 =C2=B1  3%         5%    1790192             509%   10359205 =C2=
=B1  6%  latency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.=
xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xf=
s_dialloc.xfs_ialloc.xfs_dir_ialloc.xfs_create
   1180839 =C2=B1  3%         5%    1238547             453%    6527115 =C2=
=B1  5%  latency_stats.sum.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.=
xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink.xfs_dropli=
nk.xfs_remove.xfs_vn_unlink.vfs_unlink
       467 =C2=B1173%       680%       3644 =C2=B1  4%     7e+05%    319640=
7 =C2=B1  3%  latency_stats.sum.xfs_iget.xfs_ialloc.xfs_dir_ialloc.xfs_crea=
te.xfs_generic_create.xfs_vn_mknod.xfs_vn_create.path_openat.do_filp_open.d=
o_sys_open.SyS_creat.entry_SYSCALL_64_fastpath
         0                           0                      842360 =C2=B110=
0%  latency_stats.sum.call_rwsem_down_write_failed.do_unlinkat.SyS_unlink.d=
o_syscall_64.return_from_SYSCALL_64
    159018 =C2=B1 43%       -49%      81514 =C2=B1 19%       -99%        99=
9 =C2=B1100%  latency_stats.sum.wait_on_page_bit.truncate_inode_pages_range=
.truncate_inode_pages_final.evict.iput.dentry_unlink_inode.__dentry_kill.dp=
ut.__fput.____fput.task_work_run.exit_to_usermode_loop
      1084 =C2=B1  5%        21%       1313 =C2=B1  3%        86%       201=
8        proc-vmstat.kswapd_high_wmark_hit_quickly
      1817 =C2=B1  3%        38%       2511 =C2=B1  3%       175%       498=
9        proc-vmstat.kswapd_low_wmark_hit_quickly
  11055004            -100%       7603            -100%       7559        p=
roc-vmstat.nr_active_file
      1993                        2013 =C2=B1  4%       128%       4553 =C2=
=B1  5%  proc-vmstat.nr_dirty
     25746 =C2=B1  3%        26%      32494 =C2=B1  6%        29%      3331=
9 =C2=B1  8%  proc-vmstat.nr_free_cma
   4152484                     4162399             -28%    2984494        p=
roc-vmstat.nr_free_pages
    615907            1798%   11688190            1983%   12827366        p=
roc-vmstat.nr_inactive_file
  11055042            -100%       7603            -100%       7559        p=
roc-vmstat.nr_zone_active_file
    615904            1798%   11688234            1983%   12827434        p=
roc-vmstat.nr_zone_inactive_file
      2016 =C2=B1  3%                  2025 =C2=B1  4%       127%       458=
2 =C2=B1  4%  proc-vmstat.nr_zone_write_pending
      2912 =C2=B1  3%        32%       3834 =C2=B1  3%       141%       700=
9        proc-vmstat.pageoutrun
   5380414            -100%       2502 =C2=B1  3%      -100%       2602 =C2=
=B1  3%  proc-vmstat.pgactivate
  61925072            -100%          0            -100%          0        p=
roc-vmstat.pgdeactivate
    348105                      343315             108%     723517        p=
roc-vmstat.pgfault
  61932469            -100%          0            -100%          0        p=
roc-vmstat.pgrefill
   5432311            -100%       3802 =C2=B1  3%      -100%       3657    =
    numa-vmstat.node0.nr_zone_active_file
   5432276            -100%       3802 =C2=B1  3%      -100%       3657    =
    numa-vmstat.node0.nr_active_file
    305236            1802%    5806215            1969%    6314975        n=
uma-vmstat.node0.nr_zone_inactive_file
    305239            1802%    5806170            1969%    6314910        n=
uma-vmstat.node0.nr_inactive_file
       748 =C2=B1  7%       -20%        597 =C2=B1 10%       114%       160=
2        numa-vmstat.node0.nr_dirty
       775 =C2=B1  7%       -21%        610 =C2=B1 12%       112%       164=
2        numa-vmstat.node0.nr_zone_write_pending
   2116796                     2102494 =C2=B1  3%       -27%    1543100    =
    numa-vmstat.node0.nr_free_pages
    154392                      152538              11%     171898        n=
uma-vmstat.node0.nr_slab_reclaimable
    310642            1784%    5853811            1995%    6507801        n=
uma-vmstat.node1.nr_zone_inactive_file
    310642            1784%    5853814            1995%    6507801        n=
uma-vmstat.node1.nr_inactive_file
   5627293            -100%       3799 =C2=B1  4%      -100%       3903    =
    numa-vmstat.node1.nr_zone_active_file
   5627293            -100%       3799 =C2=B1  4%      -100%       3903    =
    numa-vmstat.node1.nr_active_file
      1206 =C2=B1 16%        14%       1373             129%       2758 =C2=
=B1 10%  numa-vmstat.node1.nr_zone_write_pending
      1205 =C2=B1 16%        14%       1373             129%       2757 =C2=
=B1 10%  numa-vmstat.node1.nr_dirty
   2031121                     2088592 =C2=B1  3%       -29%    1446172 =C2=
=B1  3%  numa-vmstat.node1.nr_free_pages
     25743 =C2=B1  3%        27%      32608 =C2=B1  7%        30%      3341=
5 =C2=B1  8%  numa-vmstat.node1.nr_free_cma
     20877 =C2=B1  7%         6%      22077 =C2=B1  6%        13%      2362=
0        numa-vmstat.node1.nr_zone_active_anon
     20877 =C2=B1  7%         6%      22077 =C2=B1  6%        13%      2362=
0        numa-vmstat.node1.nr_active_anon
     20684 =C2=B1  7%         5%      21709 =C2=B1  6%        13%      2343=
1        numa-vmstat.node1.nr_anon_pages
      4687                        4704              11%       5205 =C2=B1  =
3%  slabinfo.kmalloc-128.num_objs
      4687                        4704              11%       5205 =C2=B1  =
3%  slabinfo.kmalloc-128.active_objs
      1401             -19%       1142               8%       1516 =C2=B1  =
6%  slabinfo.xfs_efd_item.num_objs
      1401             -19%       1142               8%       1516 =C2=B1  =
6%  slabinfo.xfs_efd_item.active_objs
      1725 =C2=B1  5%        -8%       1589             -12%       1518    =
    slabinfo.xfs_inode.num_objs
      1725 =C2=B1  5%        -8%       1589             -12%       1518    =
    slabinfo.xfs_inode.active_objs
    382810 =C2=B1  4%                383813 =C2=B1  3%       301%    153537=
8        sched_debug.cfs_rq:/.min_vruntime.avg
    249011 =C2=B1  6%                245840 =C2=B1  3%       420%    129470=
4        sched_debug.cfs_rq:/.min_vruntime.min
    105216                      106278              79%     188096        s=
ched_debug.cfs_rq:/.min_vruntime.stddev
    105260                      106358              79%     188314        s=
ched_debug.cfs_rq:/.spread0.stddev
      9414 =C2=B1  4%                  9361 =C2=B1  4%       230%      3109=
2        sched_debug.cfs_rq:/.exec_clock.min
    541056 =C2=B1  9%                540188 =C2=B1  3%       236%    182003=
0        sched_debug.cfs_rq:/.min_vruntime.max
    150.87 =C2=B1 11%       -21%     119.80 =C2=B1 10%        34%     202.7=
3 =C2=B1  7%  sched_debug.cfs_rq:/.util_avg.stddev
     13783                       13656             170%      37192        s=
ched_debug.cfs_rq:/.exec_clock.avg
     17625                       17508             141%      42564        s=
ched_debug.cfs_rq:/.exec_clock.max
   3410.74 =C2=B1  3%               3458.30              38%    4706.14    =
    sched_debug.cfs_rq:/.exec_clock.stddev
       732 =C2=B1 11%        11%        809 =C2=B1  3%       -34%        48=
0 =C2=B1  7%  sched_debug.cfs_rq:/.load_avg.min
       844 =C2=B1  8%         7%        901             -33%        569 =C2=
=B1  4%  sched_debug.cfs_rq:/.load_avg.avg
      0.41 =C2=B1  7%        11%       0.46 =C2=B1 11%        21%       0.5=
0 =C2=B1  5%  sched_debug.cfs_rq:/.nr_running.avg
      1339 =C2=B1  5%                  1338             -32%        909    =
    sched_debug.cfs_rq:/.load_avg.max
      0.53 =C2=B1  4%        -4%       0.51              32%       0.70    =
    sched_debug.cfs_rq:/.nr_spread_over.avg
      0.50                        0.50              33%       0.67        s=
ched_debug.cfs_rq:/.nr_spread_over.min
    355.00 =C2=B1 26%       -67%     118.75 =C2=B1  4%       -82%      64.8=
3 =C2=B1 20%  sched_debug.cpu.cpu_load[4].max
     18042                       17697             135%      42380        s=
ched_debug.cpu.nr_load_updates.min
     51.83 =C2=B1 22%       -66%      17.44             -78%      11.18 =C2=
=B1  5%  sched_debug.cpu.cpu_load[4].stddev
     22708                       22546             111%      47986        s=
ched_debug.cpu.nr_load_updates.avg
     29633 =C2=B1  7%        -7%      27554              83%      54243    =
    sched_debug.cpu.nr_load_updates.max
     48.83 =C2=B1 29%       -65%      16.91 =C2=B1 29%       -73%      13.3=
4 =C2=B1 13%  sched_debug.cpu.cpu_load[3].stddev
    329.25 =C2=B1 34%       -65%     113.75 =C2=B1 30%       -76%      79.6=
7 =C2=B1 28%  sched_debug.cpu.cpu_load[3].max
     17106              14%      19541 =C2=B1 19%        34%      22978 =C2=
=B1  6%  sched_debug.cpu.nr_switches.max
      1168 =C2=B1  4%        -3%       1131 =C2=B1  4%       144%       284=
6 =C2=B1 21%  sched_debug.cpu.ttwu_local.max
      3826 =C2=B1  3%                  3766              17%       4487    =
    sched_debug.cpu.nr_load_updates.stddev
     19.73 =C2=B1 12%        -4%      18.86 =C2=B1 14%        59%      31.4=
2 =C2=B1  8%  sched_debug.cpu.nr_uninterruptible.avg
    149.75 =C2=B1  8%                150.00 =C2=B1 11%        42%     212.5=
0        sched_debug.cpu.nr_uninterruptible.max
     98147 =C2=B1 34%                 97985 =C2=B1 42%        59%     15608=
5 =C2=B1  8%  sched_debug.cpu.avg_idle.min
      8554 =C2=B1  3%         4%       8896 =C2=B1  5%        62%      1382=
2        sched_debug.cpu.nr_switches.avg
      2582 =C2=B1  3%        11%       2857 =C2=B1 11%        19%       308=
3 =C2=B1  3%  sched_debug.cpu.nr_switches.stddev
     60029 =C2=B1  9%                 60817 =C2=B1  7%        44%      8620=
5        sched_debug.cpu.clock.max
     60029 =C2=B1  9%                 60817 =C2=B1  7%        44%      8620=
5        sched_debug.cpu.clock_task.max
     60020 =C2=B1  9%                 60807 =C2=B1  7%        44%      8618=
8        sched_debug.cpu.clock.avg
     60020 =C2=B1  9%                 60807 =C2=B1  7%        44%      8618=
8        sched_debug.cpu.clock_task.avg
     60008 =C2=B1  9%                 60793 =C2=B1  7%        44%      8616=
9        sched_debug.cpu.clock.min
     60008 =C2=B1  9%                 60793 =C2=B1  7%        44%      8616=
9        sched_debug.cpu.clock_task.min
     18.36 =C2=B1  7%       -37%      11.60 =C2=B1  5%       -33%      12.2=
1        sched_debug.cpu.cpu_load[3].avg
      5577 =C2=B1  6%         3%       5772 =C2=B1  6%        81%      1012=
1        sched_debug.cpu.nr_switches.min
     19.14 =C2=B1  3%       -36%      12.24             -36%      12.33    =
    sched_debug.cpu.cpu_load[4].avg
     17.21 =C2=B1 14%       -31%      11.90 =C2=B1 18%       -27%      12.5=
6 =C2=B1  6%  sched_debug.cpu.cpu_load[2].avg
     83.49 =C2=B1  7%         5%      87.64 =C2=B1  3%        17%      97.5=
6 =C2=B1  4%  sched_debug.cpu.nr_uninterruptible.stddev
      3729                        3735              18%       4409 =C2=B1 1=
3%  sched_debug.cpu.curr->pid.max
       374 =C2=B1  9%        -4%        360 =C2=B1  9%       157%        96=
2        sched_debug.cpu.ttwu_local.min
       665                         671             122%       1479        s=
ched_debug.cpu.ttwu_local.avg
       196 =C2=B1  7%         5%        207 =C2=B1  8%        88%        36=
9 =C2=B1 14%  sched_debug.cpu.ttwu_local.stddev
      1196 =C2=B1  4%         5%       1261 =C2=B1  6%        11%       133=
3 =C2=B1 10%  sched_debug.cpu.curr->pid.stddev
      0.45 =C2=B1  7%        17%       0.53 =C2=B1 16%        29%       0.5=
8 =C2=B1 16%  sched_debug.cpu.nr_running.avg
      6738 =C2=B1 16%         8%       7296 =C2=B1 20%        52%      1023=
6        sched_debug.cpu.ttwu_count.max
      3952 =C2=B1  4%         5%       4150 =C2=B1  5%        75%       691=
7        sched_debug.cpu.ttwu_count.avg
       913              22%       1117 =C2=B1 18%        42%       1302 =C2=
=B1  3%  sched_debug.cpu.sched_goidle.stddev
      2546 =C2=B1  4%         4%       2653 =C2=B1  7%        89%       481=
6        sched_debug.cpu.ttwu_count.min
      5301 =C2=B1  6%        36%       7190 =C2=B1 33%        61%       851=
3 =C2=B1  8%  sched_debug.cpu.sched_goidle.max
      4683 =C2=B1 16%        14%       5355 =C2=B1 25%        52%       712=
5        sched_debug.cpu.sched_count.stddev
      8262 =C2=B1  3%         6%       8746 =C2=B1  7%        68%      1391=
2        sched_debug.cpu.sched_count.avg
      5139 =C2=B1  5%         4%       5362 =C2=B1  6%        90%       977=
3        sched_debug.cpu.sched_count.min
      2088 =C2=B1  6%         7%       2229 =C2=B1  5%        55%       324=
2        sched_debug.cpu.sched_goidle.min
      3258 =C2=B1  4%         6%       3445 =C2=B1  6%        44%       470=
6        sched_debug.cpu.sched_goidle.avg
     37088 =C2=B1 17%        12%      41540 =C2=B1 23%        60%      5944=
7        sched_debug.cpu.sched_count.max
      1007 =C2=B1  7%        13%       1139 =C2=B1 14%        38%       138=
6 =C2=B1  3%  sched_debug.cpu.ttwu_count.stddev
    262591 =C2=B1  4%        -3%     253748 =C2=B1  4%       -11%     23297=
4        sched_debug.cpu.avg_idle.stddev
     60009 =C2=B1  9%                 60795 =C2=B1  7%        44%      8616=
9        sched_debug.cpu_clk
     58763 =C2=B1  9%                 59673 =C2=B1  7%        45%      8506=
8        sched_debug.ktime
     60009 =C2=B1  9%                 60795 =C2=B1  7%        44%      8616=
9        sched_debug.sched_clk

aim7/1BRD_48G-xfs-creat-clo-1500-performance/ivb44

99091700659f4df9  fe9c2c81ed073878768785a985  =

----------------  --------------------------  =

     69789               5%      73162        aim7.jobs-per-min
     81603              -7%      75897 =C2=B1  5%  aim7.time.involuntary_co=
ntext_switches
      3825              -6%       3583        aim7.time.system_time
    129.08              -5%     123.16        aim7.time.elapsed_time
    129.08              -5%     123.16        aim7.time.elapsed_time.max
      2536              -4%       2424        aim7.time.maximum_resident_se=
t_size
      3145             131%       7253 =C2=B1 20%  numa-numastat.node1.numa=
_miss
      3145             131%       7253 =C2=B1 20%  numa-numastat.node1.numa=
_foreign
      7059               4%       7362        vmstat.system.cs
   7481848              40%   10487336 =C2=B1  8%  cpuidle.C1-IVT.time
   1491314              75%    2607219 =C2=B1 10%  cpuidle.POLL.time
        67              10%         73 =C2=B1  4%  turbostat.CoreTmp
        66              12%         73 =C2=B1  4%  turbostat.PkgTmp
   5025792             -21%    3973802        meminfo.DirectMap2M
     49098              12%      54859        meminfo.PageTables
      3.94              97%       7.76 =C2=B1 18%  perf-profile.cycles-pp.p=
oll_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry
     11.88             -24%       8.99 =C2=B1 14%  perf-profile.cycles-pp.a=
pic_timer_interrupt.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_seco=
ndary
     11.63             -25%       8.78 =C2=B1 13%  perf-profile.cycles-pp.s=
mp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter.call_cpuidle.cpu=
_startup_entry
 8.412e+11              -7%   7.83e+11        perf-stat.branch-instructions
      0.30                        0.29        perf-stat.branch-miss-rate
 2.495e+09              -8%  2.292e+09        perf-stat.branch-misses
 4.277e+09              -6%  4.003e+09        perf-stat.cache-misses
 1.396e+10              -5%  1.327e+10        perf-stat.cache-references
 1.224e+13              -8%   1.12e+13        perf-stat.cpu-cycles
      0.58             -57%       0.25 =C2=B1 16%  perf-stat.dTLB-load-miss=
-rate
 5.407e+09             -60%  2.175e+09 =C2=B1 18%  perf-stat.dTLB-load-miss=
es
 9.243e+11              -6%  8.708e+11        perf-stat.dTLB-loads
      0.17             -58%       0.07 =C2=B1  4%  perf-stat.dTLB-store-mis=
s-rate
 4.368e+08             -50%  2.177e+08 =C2=B1  3%  perf-stat.dTLB-store-mis=
ses
 2.549e+11              19%  3.041e+11        perf-stat.dTLB-stores
 3.737e+12              -6%  3.498e+12        perf-stat.instructions
      0.31                        0.31        perf-stat.ipc
    439716                      426816        perf-stat.minor-faults
 2.164e+09              -7%  2.012e+09        perf-stat.node-load-misses
 2.417e+09              -7%  2.259e+09        perf-stat.node-loads
  1.24e+09              -3%  1.198e+09        perf-stat.node-store-misses
 1.556e+09              -4%  1.501e+09        perf-stat.node-stores
    439435                      426823        perf-stat.page-faults
     51452              14%      58403 =C2=B1  8%  numa-meminfo.node0.Activ=
e(anon)
     10472             -36%       6692 =C2=B1 45%  numa-meminfo.node1.Shmem
      7665              74%      13316        numa-meminfo.node1.PageTables
      6724             144%      16416 =C2=B1 43%  latency_stats.avg.perf_e=
vent_alloc.SYSC_perf_event_open.SyS_perf_event_open.entry_SYSCALL_64_fastpa=
th
      6724             144%      16416 =C2=B1 43%  latency_stats.max.perf_e=
vent_alloc.SYSC_perf_event_open.SyS_perf_event_open.entry_SYSCALL_64_fastpa=
th
      6724             144%      16416 =C2=B1 43%  latency_stats.sum.perf_e=
vent_alloc.SYSC_perf_event_open.SyS_perf_event_open.entry_SYSCALL_64_fastpa=
th
     12237              12%      13693        proc-vmstat.nr_page_table_pag=
es
     12824              14%      14578 =C2=B1  8%  numa-vmstat.node0.nr_zon=
e_active_anon
     12824              14%      14578 =C2=B1  8%  numa-vmstat.node0.nr_act=
ive_anon
      2618             -36%       1672 =C2=B1 45%  numa-vmstat.node1.nr_shm=
em
     17453              24%      21726 =C2=B1  6%  numa-vmstat.node1.numa_m=
iss
      1909              74%       3323        numa-vmstat.node1.nr_page_tab=
le_pages
     17453              24%      21726 =C2=B1  6%  numa-vmstat.node1.numa_f=
oreign
       922              24%       1143 =C2=B1  6%  slabinfo.blkdev_requests=
.active_objs
       922              24%       1143 =C2=B1  6%  slabinfo.blkdev_requests=
.num_objs
       569              21%        686 =C2=B1 11%  slabinfo.file_lock_cache=
.active_objs
       569              21%        686 =C2=B1 11%  slabinfo.file_lock_cache=
.num_objs
      9.07              16%      10.56 =C2=B1  9%  sched_debug.cfs_rq:/.run=
nable_load_avg.avg
     18406             -14%      15835 =C2=B1 10%  sched_debug.cfs_rq:/.loa=
d.stddev
      0.67             150%       1.67 =C2=B1 43%  sched_debug.cfs_rq:/.nr_=
spread_over.max
       581             -11%        517 =C2=B1  4%  sched_debug.cfs_rq:/.loa=
d_avg.min
       659             -10%        596 =C2=B1  4%  sched_debug.cfs_rq:/.loa=
d_avg.avg
       784             -12%        692 =C2=B1  4%  sched_debug.cfs_rq:/.loa=
d_avg.max
     18086             -12%      15845 =C2=B1  9%  sched_debug.cpu.load.std=
dev
     18.72             -17%      15.49 =C2=B1  8%  sched_debug.cpu.nr_unint=
erruptible.avg
     69.33              42%      98.67 =C2=B1  7%  sched_debug.cpu.nr_unint=
erruptible.max
    317829             -12%     280218 =C2=B1  4%  sched_debug.cpu.avg_idle=
.min
      9.80              18%      11.54 =C2=B1 10%  sched_debug.cpu.cpu_load=
[1].avg
      8.91              15%      10.28 =C2=B1  9%  sched_debug.cpu.cpu_load=
[0].avg
      9.53              22%      11.64 =C2=B1 10%  sched_debug.cpu.cpu_load=
[3].avg
      7083              11%       7853        sched_debug.cpu.nr_switches.m=
in
      9.73              22%      11.90 =C2=B1  7%  sched_debug.cpu.cpu_load=
[4].avg
      9.68              20%      11.59 =C2=B1 11%  sched_debug.cpu.cpu_load=
[2].avg
     24.59              49%      36.53 =C2=B1 17%  sched_debug.cpu.nr_unint=
erruptible.stddev
      1176              12%       1319 =C2=B1  4%  sched_debug.cpu.curr->pi=
d.avg
       373              35%        502 =C2=B1  6%  sched_debug.cpu.ttwu_loc=
al.min
      3644              13%       4120 =C2=B1  3%  sched_debug.cpu.ttwu_cou=
nt.min
      4855              13%       5463 =C2=B1  6%  sched_debug.cpu.sched_go=
idle.max
      7019              10%       7745        sched_debug.cpu.sched_count.m=
in
      2305              10%       2529 =C2=B1  3%  sched_debug.cpu.sched_go=
idle.min
      0.00             -19%       0.00 =C2=B1  7%  sched_debug.cpu.next_bal=
ance.stddev
      0.68             -17%       0.57 =C2=B1 11%  sched_debug.cpu.nr_runni=
ng.stddev
      0.05              27%       0.06 =C2=B1 14%  sched_debug.rt_rq:/.rt_n=
r_running.stddev

Thanks,
Fengguang

--===============3240673272628672253==--

