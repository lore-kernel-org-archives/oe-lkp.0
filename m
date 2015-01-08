Content-Type: multipart/mixed; boundary="===============2587458788511098903=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm] c8c06efa8b5: -7.6% unixbench.score
Date: Thu, 08 Jan 2015 10:27:44 +0800
Message-ID: <1420684064.6201.86.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2587458788511098903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit c8c06efa8b552608493b7066c234cfa82c47fcea ("mm: convert i_mmap_mutex =
to rwsem")


testbox/testcase/testparams: lituya/unixbench/performance-execl

83cde9e8ba95d180  c8c06efa8b552608493b7066c2  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    721721 =C2=B1  1%    +303.6%    2913110 =C2=B1  3%  unixbench.time.volu=
ntary_context_switches
     11767 =C2=B1  0%      -7.6%      10867 =C2=B1  1%  unixbench.score
 2.323e+08 =C2=B1  0%      -7.2%  2.157e+08 =C2=B1  1%  unixbench.time.mino=
r_page_faults
       207 =C2=B1  0%      -7.0%        192 =C2=B1  1%  unixbench.time.user=
_time
   4923450 =C2=B1  0%      -5.7%    4641672 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
       584 =C2=B1  0%      -5.2%        554 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
       948 =C2=B1  0%      -4.9%        902 =C2=B1  0%  unixbench.time.syst=
em_time
         0 =C2=B1  0%      +Inf%     672942 =C2=B1  2%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixu=
p.SyS_mprotect.system_call_fastpath
         0 =C2=B1  0%      +Inf%     703126 =C2=B1  6%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.=
flush_old_exec.load_elf_binary.search_binary_handler.do_execve_common.SyS_e=
xecve.stub_execve
         0 =C2=B1  0%      +Inf%     317363 =C2=B1  7%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgo=
ff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%     173298 =C2=B1  8%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.mmap_region.d=
o_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%      50444 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.vm_munmap.loa=
d_elf_binary.search_binary_handler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%     104157 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgo=
ff.vm_mmap.load_elf_binary.search_binary_handler.do_execve_common.SyS_execv=
e.stub_execve
         0 =C2=B1  0%      +Inf%      51342 =C2=B1  1%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_=
munmap.vm_munmap.load_elf_binary.search_binary_handler.do_execve_common.SyS=
_execve.stub_execve
         0 =C2=B1  0%      +Inf%       1474 =C2=B1  7%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_=
munmap.vm_munmap.SyS_munmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%     311514 =C2=B1  8%  latency_stats.hits.=
call_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_=
munmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syst=
em_call_fastpath
         0 =C2=B1  0%      +Inf%        194 =C2=B1 10%  latency_stats.hits.=
call_rwsem_down_write_failed.copy_process.do_fork.SyS_clone.stub_clone
     40292 =C2=B1  2%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
unlink_file_vma.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binar=
y.search_binary_handler.do_execve_common.SyS_execve.stub_execve
     19886 =C2=B1  3%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
unlink_file_vma.free_pgtables.unmap_region.do_munmap.mmap_region.do_mmap_pg=
off.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
     18370 =C2=B1  3%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.sy=
stem_call_fastpath
      5863 =C2=B1  5%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
unlink_file_vma.free_pgtables.unmap_region.do_munmap.vm_munmap.load_elf_bin=
ary.search_binary_handler.do_execve_common.SyS_execve.stub_execve
      9374 =C2=B1  4%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.vm_mmap.load_elf_binary.se=
arch_binary_handler.do_execve_common.SyS_execve.stub_execve
     39987 =C2=B1  2%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
vma_adjust.__split_vma.split_vma.mprotect_fixup.SyS_mprotect.system_call_fa=
stpath
     11332 =C2=B1  3%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
vma_adjust.__split_vma.do_munmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.Sy=
S_mmap_pgoff.SyS_mmap.system_call_fastpath
      5540 =C2=B1  6%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
vma_adjust.__split_vma.do_munmap.vm_munmap.load_elf_binary.search_binary_ha=
ndler.do_execve_common.SyS_execve.stub_execve
         9 =C2=B1 39%    -100.0%          0 =C2=B1  0%  latency_stats.hits.=
copy_process.do_fork.SyS_clone.stub_clone
       490 =C2=B1  5%    +301.2%       1967 =C2=B1 12%  sched_debug.cpu#10.=
nr_uninterruptible
       498 =C2=B1  4%    +297.0%       1978 =C2=B1 10%  sched_debug.cpu#13.=
nr_uninterruptible
       528 =C2=B1 11%    +284.4%       2032 =C2=B1  9%  sched_debug.cpu#8.n=
r_uninterruptible
       510 =C2=B1  5%    +278.0%       1930 =C2=B1  8%  sched_debug.cpu#12.=
nr_uninterruptible
       502 =C2=B1  3%    +279.9%       1910 =C2=B1  8%  sched_debug.cpu#15.=
nr_uninterruptible
       488 =C2=B1  4%    +297.4%       1942 =C2=B1  7%  sched_debug.cpu#11.=
nr_uninterruptible
        61 =C2=B1 17%     -51.0%         30 =C2=B1 42%  sched_debug.cpu#4.c=
pu_load[0]
       537 =C2=B1 14%    +267.6%       1977 =C2=B1  8%  sched_debug.cpu#9.n=
r_uninterruptible
       549 =C2=B1 14%    +256.2%       1958 =C2=B1 11%  sched_debug.cpu#14.=
nr_uninterruptible
    721721 =C2=B1  1%    +303.6%    2913110 =C2=B1  3%  time.voluntary_cont=
ext_switches
        32 =C2=B1 23%     +41.4%         45 =C2=B1 15%  sched_debug.cpu#0.c=
pu_load[1]
    138118 =C2=B1 15%     +22.8%     169551 =C2=B1 10%  sched_debug.cpu#7.s=
ched_goidle
    110150 =C2=B1 13%     +35.9%     149694 =C2=B1 10%  sched_debug.cpu#11.=
sched_goidle
    125451 =C2=B1 12%     +34.5%     168781 =C2=B1  9%  sched_debug.cpu#11.=
ttwu_count
        30 =C2=B1 15%     +29.3%         39 =C2=B1 15%  sched_debug.cpu#12.=
cpu_load[3]
    126828 =C2=B1  3%     +29.1%     163741 =C2=B1  4%  sched_debug.cpu#6.s=
ched_goidle
    160802 =C2=B1 12%     +21.5%     195384 =C2=B1  8%  sched_debug.cpu#7.t=
twu_count
    123454 =C2=B1  4%     +30.5%     161069 =C2=B1  4%  sched_debug.cpu#14.=
ttwu_count
    148649 =C2=B1  2%     +32.6%     197144 =C2=B1  4%  sched_debug.cpu#2.t=
twu_count
    114238 =C2=B1  6%     +31.1%     149740 =C2=B1  6%  sched_debug.cpu#8.s=
ched_goidle
    128654 =C2=B1  5%     +27.1%     163499 =C2=B1  7%  sched_debug.cpu#15.=
ttwu_count
        38 =C2=B1  7%     -16.1%         32 =C2=B1  6%  sched_debug.cpu#2.c=
pu_load[3]
    378291 =C2=B1 11%     +16.3%     440023 =C2=B1  7%  sched_debug.cpu#7.s=
ched_count
    378057 =C2=B1 11%     +16.0%     438383 =C2=B1  7%  sched_debug.cpu#7.n=
r_switches
    159246 =C2=B1  6%     +20.6%     192115 =C2=B1  7%  sched_debug.cpu#4.t=
twu_count
        39 =C2=B1 11%     -17.6%         32 =C2=B1 10%  sched_debug.cpu#4.c=
pu_load[3]
    355445 =C2=B1  2%     +20.5%     428445 =C2=B1  3%  sched_debug.cpu#6.s=
ched_count
    321621 =C2=B1  9%     +23.6%     397380 =C2=B1  7%  sched_debug.cpu#11.=
sched_count
    355193 =C2=B1  2%     +20.1%     426758 =C2=B1  3%  sched_debug.cpu#6.n=
r_switches
    321376 =C2=B1  9%     +23.2%     396022 =C2=B1  7%  sched_debug.cpu#11.=
nr_switches
    152398 =C2=B1  3%     +28.3%     195489 =C2=B1 10%  sched_debug.cpu#3.t=
twu_count
    125919 =C2=B1  3%     +34.8%     169795 =C2=B1  4%  sched_debug.cpu#2.s=
ched_goidle
    330747 =C2=B1  4%     +20.2%     397424 =C2=B1  4%  sched_debug.cpu#8.s=
ched_count
        36 =C2=B1  5%     -13.1%         31 =C2=B1  6%  sched_debug.cpu#2.c=
pu_load[4]
    330460 =C2=B1  4%     +19.9%     396085 =C2=B1  4%  sched_debug.cpu#8.n=
r_switches
        31 =C2=B1 11%     +14.4%         35 =C2=B1  6%  sched_debug.cpu#8.c=
pu_load[3]
    159635 =C2=B1  4%     +20.6%     192490 =C2=B1 10%  sched_debug.cpu#1.t=
twu_count
    155809 =C2=B1  5%     +16.3%     181259 =C2=B1  5%  sched_debug.cpu#5.t=
twu_count
    133028 =C2=B1  6%     +17.2%     155920 =C2=B1  5%  sched_debug.cpu#5.s=
ched_goidle
    354261 =C2=B1  2%     +24.5%     440990 =C2=B1  3%  sched_debug.cpu#2.s=
ched_count
      1399 =C2=B1 16%     +24.6%       1744 =C2=B1  4%  sched_debug.cpu#12.=
curr->pid
    354028 =C2=B1  2%     +24.1%     439371 =C2=B1  3%  sched_debug.cpu#2.n=
r_switches
    165045 =C2=B1  9%     +14.2%     188419 =C2=B1  3%  sched_debug.cpu#0.t=
twu_count
    129864 =C2=B1  4%     +30.1%     168934 =C2=B1 12%  sched_debug.cpu#3.s=
ched_goidle
    361169 =C2=B1  2%     +21.1%     437280 =C2=B1  9%  sched_debug.cpu#3.n=
r_switches
    361390 =C2=B1  2%     +21.4%     438886 =C2=B1  9%  sched_debug.cpu#3.s=
ched_count
    113836 =C2=B1  5%     +26.8%     144302 =C2=B1  8%  sched_debug.cpu#15.=
sched_goidle
    223075 =C2=B1  4%     +34.9%     300833 =C2=B1  8%  cpuidle.C3-HSW.usage
    109472 =C2=B1  5%     +29.5%     141802 =C2=B1  4%  sched_debug.cpu#14.=
sched_goidle
    320251 =C2=B1  3%     +19.3%     382084 =C2=B1  3%  sched_debug.cpu#14.=
sched_count
    328264 =C2=B1  4%     +17.5%     385651 =C2=B1  6%  sched_debug.cpu#15.=
nr_switches
    319985 =C2=B1  3%     +19.0%     380734 =C2=B1  3%  sched_debug.cpu#14.=
nr_switches
        32 =C2=B1 16%     +41.9%         45 =C2=B1 20%  sched_debug.cpu#12.=
cpu_load[2]
        37 =C2=B1  6%     -12.8%         32 =C2=B1  6%  sched_debug.cpu#1.c=
pu_load[4]
    328504 =C2=B1  4%     +17.8%     386960 =C2=B1  6%  sched_debug.cpu#15.=
sched_count
        37 =C2=B1 35%     +83.2%         68 =C2=B1 20%  sched_debug.cpu#12.=
cpu_load[0]
    129752 =C2=B1  6%     +30.6%     169483 =C2=B1  6%  sched_debug.cpu#8.t=
twu_count
    282972 =C2=B1  0%     -15.8%     238308 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    284112 =C2=B1  0%     -16.0%     238794 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.min_vruntime
    282666 =C2=B1  0%     -16.2%     236884 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.min_vruntime
    285118 =C2=B1  0%     -15.3%     241361 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.min_vruntime
    285813 =C2=B1  0%     -15.5%     241598 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.min_vruntime
    286458 =C2=B1  1%     -15.5%     242012 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.min_vruntime
       891 =C2=B1 33%     +71.6%       1530 =C2=B1  9%  sched_debug.cpu#15.=
curr->pid
    283618 =C2=B1  0%     -15.9%     238477 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.min_vruntime
    286794 =C2=B1  0%     -15.4%     242695 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.min_vruntime
    282507 =C2=B1  0%     -15.9%     237672 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.min_vruntime
    283428 =C2=B1  0%     -16.2%     237542 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.min_vruntime
    284953 =C2=B1  0%     -16.6%     237517 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.min_vruntime
   1270469 =C2=B1  1%     +24.5%    1581318 =C2=B1  3%  cpuidle.C6-HSW.usage
    282363 =C2=B1  1%     -16.2%     236514 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.min_vruntime
    286105 =C2=B1  0%     -15.9%     240483 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.min_vruntime
    136240 =C2=B1  7%     +21.8%     165966 =C2=B1  8%  sched_debug.cpu#4.s=
ched_goidle
    137467 =C2=B1  5%     +21.6%     167200 =C2=B1 12%  sched_debug.cpu#1.s=
ched_goidle
    285463 =C2=B1  0%     -15.6%     241015 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.min_vruntime
    287745 =C2=B1  0%     -15.6%     242855 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.min_vruntime
    148602 =C2=B1  3%     +27.3%     189130 =C2=B1  3%  sched_debug.cpu#6.t=
twu_count
    377362 =C2=B1  4%     +15.4%     435571 =C2=B1  9%  sched_debug.cpu#1.s=
ched_count
    284598 =C2=B1  0%     -15.2%     241230 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.min_vruntime
    377157 =C2=B1  4%     +15.1%     433927 =C2=B1  9%  sched_debug.cpu#1.n=
r_switches
    374585 =C2=B1  5%     +15.0%     430900 =C2=B1  6%  sched_debug.cpu#4.n=
r_switches
    374823 =C2=B1  5%     +15.4%     432576 =C2=B1  6%  sched_debug.cpu#4.s=
ched_count
   2069241 =C2=B1  0%     +75.3%    3628295 =C2=B1  0%  cpuidle.C1-HSW.usage
        41 =C2=B1 47%    +122.3%         92 =C2=B1 31%  sched_debug.cfs_rq[=
3]:/.load
 1.475e+08 =C2=B1  2%     +46.1%  2.155e+08 =C2=B1  1%  cpuidle.C1-HSW.time
      2000 =C2=B1 27%     -36.0%       1279 =C2=B1 17%  sched_debug.cpu#4.c=
urr->pid
        91 =C2=B1 23%     -51.1%         44 =C2=B1 26%  sched_debug.cpu#4.l=
oad
  20440136 =C2=B1  3%     +13.5%   23206516 =C2=B1 10%  cpuidle.C3-HSW.time
        42 =C2=B1 46%     +82.8%         77 =C2=B1 20%  sched_debug.cpu#3.l=
oad
    334868 =C2=B1  0%     -40.1%     200692 =C2=B1  5%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do_=
cow_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clear_us=
er.padzero.load_elf_binary
    195507 =C2=B1  0%     -40.0%     117305 =C2=B1  8%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do_=
cow_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
       541 =C2=B1  1%     +24.4%        672 =C2=B1  1%  cpuidle.POLL.usage
    124903 =C2=B1  8%     -22.8%      96485 =C2=B1  7%  sched_debug.cpu#10.=
ttwu_local
       840 =C2=B1  5%     -26.7%        616 =C2=B1  4%  latency_stats.hits.=
wait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do_=
read_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
    127712 =C2=B1 11%     -10.3%     114520 =C2=B1  6%  sched_debug.cpu#9.t=
twu_local
    620351 =C2=B1  3%     -14.2%     532554 =C2=B1  5%  sched_debug.cpu#3.a=
vg_idle
    607039 =C2=B1  4%     -12.6%     530814 =C2=B1  3%  sched_debug.cpu#6.a=
vg_idle
    669680 =C2=B1  2%     -11.6%     591883 =C2=B1  5%  sched_debug.cpu#15.=
avg_idle
      9349 =C2=B1  1%      +9.2%      10211 =C2=B1  3%  slabinfo.vm_area_st=
ruct.active_objs
      9411 =C2=B1  1%      +8.7%      10227 =C2=B1  3%  slabinfo.vm_area_st=
ruct.num_objs
         0 =C2=B1  0%      +Inf%         51 =C2=B1  9%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execve_common.SyS_ex=
ecve.stub_execve
       932 =C2=B1 10%    -100.0%          0 =C2=B1  0%  latency_stats.max.u=
nlink_file_vma.free_pgtables.unmap_region.do_munmap.mmap_region.do_mmap_pgo=
ff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
    146109 =C2=B1  5%    -100.0%          0 =C2=B1  0%  latency_stats.sum.v=
ma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.sys=
tem_call_fastpath
    341728 =C2=B1  1%    -100.0%          0 =C2=B1  0%  latency_stats.sum.u=
nlink_file_vma.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binary=
.search_binary_handler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%      10487 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process.do_fork.SyS_clone.stub_clone
         0 =C2=B1  0%      +Inf%         54 =C2=B1 19%  latency_stats.avg.c=
all_rwsem_down_write_failed.copy_process.do_fork.SyS_clone.stub_clone
         7 =C2=B1  6%    -100.0%          0 =C2=B1  0%  latency_stats.avg.v=
ma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.sys=
tem_call_fastpath
         0 =C2=B1  0%      +Inf%        573 =C2=B1 10%  latency_stats.max.c=
all_rwsem_down_write_failed.copy_process.do_fork.SyS_clone.stub_clone
         2 =C2=B1 15%    -100.0%          0 =C2=B1  0%  latency_stats.max.u=
nlink_file_vma.free_pgtables.unmap_region.do_munmap.vm_munmap.SyS_munmap.sy=
stem_call_fastpath
         8 =C2=B1  0%    -100.0%          0 =C2=B1  0%  latency_stats.avg.u=
nlink_file_vma.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binary=
.search_binary_handler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%          1 =C2=B1 33%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.SyS_munmap.system_call_fastpath
         1 =C2=B1 24%    -100.0%          0 =C2=B1  0%  latency_stats.avg.u=
nlink_file_vma.free_pgtables.unmap_region.do_munmap.vm_munmap.SyS_munmap.sy=
stem_call_fastpath
         0 =C2=B1  0%      +Inf%       3059 =C2=B1 20%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.SyS_munmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%       2178 =C2=B1 11%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.load_elf_binary.search_binary_handler.do_execve_common.SyS_=
execve.stub_execve
         0 =C2=B1  0%      +Inf%         14 =C2=B1  3%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.load_elf_binary.search_binary_handler.do_execve_common.SyS_=
execve.stub_execve
       878 =C2=B1 10%    -100.0%          0 =C2=B1  0%  latency_stats.max.u=
nlink_file_vma.free_pgtables.exit_mmap.mmput.flush_old_exec.load_elf_binary=
.search_binary_handler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%       1915 =C2=B1  8%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.vm_mmap.load_elf_binary.search_binary_handler.do_execve_common.SyS_execve=
.stub_execve
         0 =C2=B1  0%      +Inf%         12 =C2=B1  5%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.vm_mmap.load_elf_binary.search_binary_handler.do_execve_common.SyS_execve=
.stub_execve
         0 =C2=B1  0%      +Inf%    1327137 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.vm_mmap.load_elf_binary.search_binary_handler.do_execve_common.SyS_execve=
.stub_execve
       518 =C2=B1 11%    -100.0%          0 =C2=B1  0%  latency_stats.max.v=
ma_adjust.__split_vma.do_munmap.vm_munmap.load_elf_binary.search_binary_han=
dler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%       1944 =C2=B1 16%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.vm_munmap.load=
_elf_binary.search_binary_handler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%         10 =C2=B1  8%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.vm_munmap.load=
_elf_binary.search_binary_handler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%     548178 =C2=B1  5%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.vm_munmap.load=
_elf_binary.search_binary_handler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%       2247 =C2=B1 10%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.mmap_region.do=
_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
         2 =C2=B1  0%    -100.0%          0 =C2=B1  0%  latency_stats.avg.v=
ma_adjust.__split_vma.do_munmap.vm_munmap.load_elf_binary.search_binary_han=
dler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%         61 =C2=B1  5%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.mmap_region.do=
_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%   10731426 =C2=B1 14%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.do_munmap.mmap_region.do=
_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
     13994 =C2=B1  7%    -100.0%          0 =C2=B1  0%  latency_stats.sum.v=
ma_adjust.__split_vma.do_munmap.vm_munmap.load_elf_binary.search_binary_han=
dler.do_execve_common.SyS_execve.stub_execve
       966 =C2=B1  8%    -100.0%          0 =C2=B1  0%  latency_stats.max.v=
ma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.sys=
tem_call_fastpath
       867 =C2=B1 19%    -100.0%          0 =C2=B1  0%  latency_stats.max.v=
ma_adjust.__split_vma.do_munmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS=
_mmap_pgoff.SyS_mmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%       2175 =C2=B1  4%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%         62 =C2=B1  5%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%   19888298 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgof=
f.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
     15115 =C2=B1  6%    -100.0%          0 =C2=B1  0%  latency_stats.sum.u=
nlink_file_vma.free_pgtables.unmap_region.do_munmap.vm_munmap.load_elf_bina=
ry.search_binary_handler.do_execve_common.SyS_execve.stub_execve
         2 =C2=B1  0%    -100.0%          0 =C2=B1  0%  latency_stats.avg.u=
nlink_file_vma.free_pgtables.unmap_region.do_munmap.vm_munmap.load_elf_bina=
ry.search_binary_handler.do_execve_common.SyS_execve.stub_execve
       536 =C2=B1 16%    -100.0%          0 =C2=B1  0%  latency_stats.max.u=
nlink_file_vma.free_pgtables.unmap_region.do_munmap.vm_munmap.load_elf_bina=
ry.search_binary_handler.do_execve_common.SyS_execve.stub_execve
    118730 =C2=B1  3%    -100.0%          0 =C2=B1  0%  latency_stats.sum.u=
nlink_file_vma.free_pgtables.unmap_region.do_munmap.mmap_region.do_mmap_pgo=
ff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%       2269 =C2=B1  2%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execve_common.SyS_ex=
ecve.stub_execve
         0 =C2=B1  0%      +Inf%     771346 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.vm_munmap.load_elf_binary.search_binary_handler.do_execve_common.SyS_=
execve.stub_execve
         0 =C2=B1  0%      +Inf%   37036112 =C2=B1 15%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.exit_mmap.mmput.f=
lush_old_exec.load_elf_binary.search_binary_handler.do_execve_common.SyS_ex=
ecve.stub_execve
         0 =C2=B1  0%      +Inf%       2316 =C2=B1  5%  latency_stats.max.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.system_call_fastpath
         0 =C2=B1  0%      +Inf%         54 =C2=B1 10%  latency_stats.avg.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.system_call_fastpath
         0 =C2=B1  0%      +Inf%   36764596 =C2=B1 13%  latency_stats.sum.c=
all_rwsem_down_write_failed.vma_adjust.__split_vma.split_vma.mprotect_fixup=
.SyS_mprotect.system_call_fastpath
         5 =C2=B1  0%    -100.0%          0 =C2=B1  0%  latency_stats.avg.v=
ma_adjust.__split_vma.do_munmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS=
_mmap_pgoff.SyS_mmap.system_call_fastpath
     36701 =C2=B1  2%    -100.0%          0 =C2=B1  0%  latency_stats.sum.v=
ma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.vm_mmap.load_elf_binary.sea=
rch_binary_handler.do_execve_common.SyS_execve.stub_execve
     63412 =C2=B1  3%    -100.0%          0 =C2=B1  0%  latency_stats.sum.v=
ma_adjust.__split_vma.do_munmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS=
_mmap_pgoff.SyS_mmap.system_call_fastpath
         0 =C2=B1  0%      +Inf%         60 =C2=B1  5%  latency_stats.avg.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syste=
m_call_fastpath
         0 =C2=B1  0%      +Inf%   19176722 =C2=B1 14%  latency_stats.sum.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syste=
m_call_fastpath
         5 =C2=B1  9%    -100.0%          0 =C2=B1  0%  latency_stats.avg.u=
nlink_file_vma.free_pgtables.unmap_region.do_munmap.mmap_region.do_mmap_pgo=
ff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.system_call_fastpath
       929 =C2=B1 15%    -100.0%          0 =C2=B1  0%  latency_stats.max.v=
ma_adjust.__split_vma.split_vma.mprotect_fixup.SyS_mprotect.system_call_fas=
tpath
         6 =C2=B1  6%    -100.0%          0 =C2=B1  0%  latency_stats.avg.v=
ma_adjust.__split_vma.split_vma.mprotect_fixup.SyS_mprotect.system_call_fas=
tpath
    283534 =C2=B1  1%    -100.0%          0 =C2=B1  0%  latency_stats.sum.v=
ma_adjust.__split_vma.split_vma.mprotect_fixup.SyS_mprotect.system_call_fas=
tpath
       676 =C2=B1  6%    -100.0%          0 =C2=B1  0%  latency_stats.max.v=
ma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.vm_mmap.load_elf_binary.sea=
rch_binary_handler.do_execve_common.SyS_execve.stub_execve
         3 =C2=B1 11%    -100.0%          0 =C2=B1  0%  latency_stats.avg.v=
ma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.vm_mmap.load_elf_binary.sea=
rch_binary_handler.do_execve_common.SyS_execve.stub_execve
         0 =C2=B1  0%      +Inf%       2156 =C2=B1  4%  latency_stats.max.c=
all_rwsem_down_write_failed.unlink_file_vma.free_pgtables.unmap_region.do_m=
unmap.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.SyS_mmap_pgoff.SyS_mmap.syste=
m_call_fastpath
     38.04 =C2=B1  0%      -5.4%      35.98 =C2=B1  0%  turbostat.%c0
        26 =C2=B1 31%     -50.5%         13 =C2=B1  3%  latency_stats.avg.k=
thread_stop.smpboot_destroy_threads.smpboot_unregister_percpu_thread.proc_d=
owatchdog.proc_sys_call_handler.proc_sys_write.vfs_write.SyS_write.system_c=
all_fastpath
       168 =C2=B1 30%     -43.3%         95 =C2=B1  0%  latency_stats.max.k=
thread_stop.smpboot_destroy_threads.smpboot_unregister_percpu_thread.proc_d=
owatchdog.proc_sys_call_handler.proc_sys_write.vfs_write.SyS_write.system_c=
all_fastpath
       408 =C2=B1 32%     -48.9%        208 =C2=B1  2%  latency_stats.sum.k=
thread_stop.smpboot_destroy_threads.smpboot_unregister_percpu_thread.proc_d=
owatchdog.proc_sys_call_handler.proc_sys_write.vfs_write.SyS_write.system_c=
all_fastpath
         2 =C2=B1  0%     -50.0%          1 =C2=B1  0%  latency_stats.avg.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do_r=
ead_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
    567580 =C2=B1  0%     -49.5%     286885 =C2=B1  5%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do_c=
ow_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.clear_use=
r.padzero.load_elf_binary
     85194 =C2=B1  0%     +20.5%     102669 =C2=B1  0%  vmstat.system.cs
    336221 =C2=B1  1%     -46.7%     179256 =C2=B1  9%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do_c=
ow_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
      1729 =C2=B1  6%     -36.7%       1094 =C2=B1  3%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.do_r=
ead_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
        20 =C2=B1  4%     -34.1%         13 =C2=B1 23%  latency_stats.max.s=
top_one_cpu.sched_exec.do_execve_common.SyS_execve.stub_execve
     71302 =C2=B1 11%     -25.9%      52817 =C2=B1  7%  latency_stats.sum.p=
ath_lookupat.filename_lookup.user_path_at_empty.user_path_at.SyS_access.sys=
tem_call_fastpath
     57.77 =C2=B1  0%      -1.2%      57.06 =C2=B1  0%  turbostat.Pkg_W
       206 =C2=B1  6%     +19.0%        245 =C2=B1  6%  latency_stats.sum.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
      1756 =C2=B1  5%     +10.5%       1940 =C2=B1  5%  latency_stats.max.p=
ipe_wait.wait_for_partner.fifo_open.do_dentry_open.vfs_open.do_last.path_op=
enat.do_filp_open.do_sys_open.SyS_open.system_call_fastpath
      2148 =C2=B1  4%      -6.4%       2010 =C2=B1  5%  latency_stats.avg.w=
ait_woken.inotify_read.vfs_read.SyS_read.system_call_fastpath
     10744 =C2=B1  4%      -6.5%      10050 =C2=B1  5%  latency_stats.sum.w=
ait_woken.inotify_read.vfs_read.SyS_read.system_call_fastpath
       109 =C2=B1  1%      +8.0%        117 =C2=B1  2%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
       403 =C2=B1  3%      -7.4%        373 =C2=B1  3%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.rpc_call_sync.n=
fs3_rpc_wrapper.nfs3_proc_setattr.nfs3_proc_create.nfs_create.vfs_create.do=
_last.path_openat
    137032 =C2=B1  1%      +6.5%     145948 =C2=B1  2%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
       141 =C2=B1  0%      +6.6%        150 =C2=B1  2%  latency_stats.avg.p=
ipe_wait.pipe_read.new_sync_read.vfs_read.SyS_read.system_call_fastpath
      4898 =C2=B1  2%      -6.0%       4604 =C2=B1  4%  latency_stats.max.w=
ait_woken.n_tty_read.tty_read.vfs_read.SyS_read.system_call_fastpath
      5797 =C2=B1  2%      -7.0%       5393 =C2=B1  1%  latency_stats.sum.s=
top_one_cpu.sched_exec.do_execve_common.SyS_execve.stub_execve
      4650 =C2=B1  0%      -3.3%       4497 =C2=B1  1%  latency_stats.max.w=
ait_woken.inotify_read.vfs_read.SyS_read.system_call_fastpath


testbox/testcase/testparams: ivb43/vm-scalability/performance-300s-mmap-xre=
ad-seq-mt

83cde9e8ba95d180  c8c06efa8b552608493b7066c2  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

        17 =C2=B1 48%     -80.0%          3 =C2=B1 14%  sched_debug.cpu#35.=
cpu_load[2]
      1.20 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt.mutex_optimistic_spin.__mutex_lock_slowpath
      1.34 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.mutex_optimistic_s=
pin.__mutex_lock_slowpath.mutex_lock
    441348 =C2=B1 47%     -76.0%     105848 =C2=B1 15%  sched_debug.cpu#29.=
nr_switches
    441662 =C2=B1 47%     -75.8%     107048 =C2=B1 14%  sched_debug.cpu#29.=
sched_count
    219946 =C2=B1 47%     -76.1%      52633 =C2=B1 15%  sched_debug.cpu#29.=
sched_goidle
      0.99 =C2=B1 13%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__mutex_unlock_slowpath.mutex_unlock.rmap_walk.try_to_unmap.shrink_pag=
e_list
      0.99 =C2=B1 13%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.mutex_unlock.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_l=
ist
      1.89 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.call_function_interrupt.mutex_optimistic_spin.__mutex_lock_slowpath.mu=
tex_lock.rmap_walk
     27.22 =C2=B1 38%     -79.5%       5.59 =C2=B1  1%  perf-profile.cpu-cy=
cles.page_referenced.shrink_page_list.shrink_inactive_list.shrink_lruvec.sh=
rink_zone
     27.14 =C2=B1 39%     -79.6%       5.53 =C2=B1  1%  perf-profile.cpu-cy=
cles.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_list.shrink=
_lruvec
      5.75 =C2=B1 49%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.rmap_walk.try_t=
o_unmap
      5.87 =C2=B1 48%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.rmap_walk.try_to_unmap.shrink_page_li=
st
      5.91 =C2=B1 47%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.mutex_lock.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_list
      0.00 =C2=B1  0%      +Inf%       4.16 =C2=B1  2%  perf-profile.cpu-cy=
cles.call_rwsem_down_write_failed.rmap_walk.page_referenced.shrink_page_lis=
t.shrink_inactive_list
      0.00 =C2=B1  0%      +Inf%       4.15 =C2=B1  2%  perf-profile.cpu-cy=
cles.rwsem_down_write_failed.call_rwsem_down_write_failed.rmap_walk.page_re=
ferenced.shrink_page_list
      4.94 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.mutex_spin_on_owner.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_=
lock.rmap_walk
      0.00 =C2=B1  0%      +Inf%       3.18 =C2=B1  2%  perf-profile.cpu-cy=
cles.rwsem_spin_on_owner.rwsem_down_write_failed.call_rwsem_down_write_fail=
ed.rmap_walk.page_referenced
     26.20 =C2=B1 40%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.mutex_optimistic_spin.__mutex_lock_slowpath.mutex_lock.rmap_walk.page_=
referenced
     26.80 =C2=B1 39%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.__mutex_lock_slowpath.mutex_lock.rmap_walk.page_referenced.shrink_page=
_list
     26.88 =C2=B1 39%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.mutex_lock.rmap_walk.page_referenced.shrink_page_list.shrink_inactive_=
list
      0.00 =C2=B1  0%      +Inf%       1.49 =C2=B1  0%  perf-profile.cpu-cy=
cles.call_rwsem_wake.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactiv=
e_list
      0.00 =C2=B1  0%      +Inf%       1.49 =C2=B1  0%  perf-profile.cpu-cy=
cles.rwsem_wake.call_rwsem_wake.rmap_walk.try_to_unmap.shrink_page_list
      0.00 =C2=B1  0%      +Inf%       1.39 =C2=B1  1%  perf-profile.cpu-cy=
cles.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.rmap_walk
      0.00 =C2=B1  0%      +Inf%       1.28 =C2=B1  0%  perf-profile.cpu-cy=
cles.__rwsem_do_wake.rwsem_wake.call_rwsem_wake.rmap_walk.try_to_unmap
      0.00 =C2=B1  0%      +Inf%       1.22 =C2=B1  0%  perf-profile.cpu-cy=
cles.try_to_wake_up.wake_up_process.__rwsem_do_wake.rwsem_wake.call_rwsem_w=
ake
      0.00 =C2=B1  0%      +Inf%       1.17 =C2=B1  2%  perf-profile.cpu-cy=
cles.call_rwsem_down_write_failed.rmap_walk.try_to_unmap.shrink_page_list.s=
hrink_inactive_list
      0.00 =C2=B1  0%      +Inf%       1.16 =C2=B1  2%  perf-profile.cpu-cy=
cles.rwsem_down_write_failed.call_rwsem_down_write_failed.rmap_walk.try_to_=
unmap.shrink_page_list
      0.00 =C2=B1  0%      +Inf%       1.03 =C2=B1  1%  perf-profile.cpu-cy=
cles.call_rwsem_wake.rmap_walk.page_referenced.shrink_page_list.shrink_inac=
tive_list
      0.00 =C2=B1  0%      +Inf%       1.03 =C2=B1  0%  perf-profile.cpu-cy=
cles.rwsem_wake.call_rwsem_wake.rmap_walk.page_referenced.shrink_page_list
        32 =C2=B1 10%     -96.2%          1 =C2=B1 34%  sched_debug.cfs_rq[=
17]:/.nr_spread_over
        42 =C2=B1  0%     -84.5%          6 =C2=B1 41%  sched_debug.cpu#31.=
load
        44 =C2=B1  4%     -85.2%          6 =C2=B1 41%  sched_debug.cfs_rq[=
31]:/.load
    534530 =C2=B1 21%     -79.3%     110651 =C2=B1 35%  sched_debug.cpu#32.=
nr_switches
    535267 =C2=B1 20%     -79.1%     111666 =C2=B1 35%  sched_debug.cpu#32.=
sched_count
    266369 =C2=B1 20%     -79.4%      54763 =C2=B1 36%  sched_debug.cpu#32.=
sched_goidle
 116443.25 =C2=B1 37%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.max_vruntime
 116443.25 =C2=B1 37%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
11]:/.MIN_vruntime
        18 =C2=B1 44%     -72.2%          5 =C2=B1 14%  sched_debug.cpu#35.=
cpu_load[0]
        18 =C2=B1 44%     -76.4%          4 =C2=B1 25%  sched_debug.cpu#35.=
cpu_load[1]
      1.02 =C2=B1 29%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt.mutex_optimistic_spin
 141571.82 =C2=B1 19%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.MIN_vruntime
 141571.82 =C2=B1 19%    -100.0%       0.00 =C2=B1  0%  sched_debug.cfs_rq[=
0]:/.max_vruntime
        17 =C2=B1 48%     -75.7%          4 =C2=B1 34%  sched_debug.cfs_rq[=
35]:/.runnable_load_avg
       823 =C2=B1 43%     -72.0%        230 =C2=B1 14%  sched_debug.cpu#35.=
ttwu_local
       961 =C2=B1 38%     -63.8%        347 =C2=B1 38%  sched_debug.cpu#43.=
ttwu_local
    135338 =C2=B1 38%     -59.8%      54354 =C2=B1 43%  sched_debug.cpu#27.=
ttwu_count
        20 =C2=B1 20%     -77.5%          4 =C2=B1 36%  sched_debug.cpu#46.=
cpu_load[0]
         3 =C2=B1 14%     -64.3%          1 =C2=B1 34%  sched_debug.cfs_rq[=
33]:/.nr_spread_over
      4944 =C2=B1 15%     -69.0%       1533 =C2=B1  8%  sched_debug.cpu#19.=
ttwu_local
    244794 =C2=B1 46%     -64.2%      87628 =C2=B1 17%  sched_debug.cpu#45.=
nr_switches
    121511 =C2=B1 46%     -64.2%      43527 =C2=B1 17%  sched_debug.cpu#45.=
sched_goidle
    248225 =C2=B1 47%     -64.0%      89438 =C2=B1 17%  sched_debug.cpu#45.=
sched_count
      2.06 =C2=B1 25%     -65.1%       0.72 =C2=B1  3%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd=
_shrink_zone
      2.07 =C2=B1 25%     -64.9%       0.73 =C2=B1  3%  perf-profile.cpu-cy=
cles.shrink_zone.kswapd_shrink_zone.kswapd.kthread.ret_from_fork
      2.07 =C2=B1 25%     -64.9%       0.73 =C2=B1  3%  perf-profile.cpu-cy=
cles.kswapd_shrink_zone.kswapd.kthread.ret_from_fork
      2.07 =C2=B1 25%     -64.9%       0.73 =C2=B1  3%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.kswapd_shrink_zone.kswapd.kthread
      2.07 =C2=B1 25%     -64.9%       0.73 =C2=B1  3%  perf-profile.cpu-cy=
cles.kswapd.kthread.ret_from_fork
      2.07 =C2=B1 25%     -64.9%       0.73 =C2=B1  3%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.kswapd_shrink_zone.kswa=
pd
         9 =C2=B1 47%     -63.2%          3 =C2=B1 24%  sched_debug.cpu#45.=
cpu_load[4]
     38.51 =C2=B1 31%     -60.4%      15.25 =C2=B1  0%  perf-profile.cpu-cy=
cles.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrink_zone.shrink=
_zones
     38.58 =C2=B1 31%     -60.2%      15.35 =C2=B1  0%  perf-profile.cpu-cy=
cles.shrink_inactive_list.shrink_lruvec.shrink_zone.shrink_zones.do_try_to_=
free_pages
     38.59 =C2=B1 31%     -60.2%      15.36 =C2=B1  0%  perf-profile.cpu-cy=
cles.shrink_lruvec.shrink_zone.shrink_zones.do_try_to_free_pages.try_to_fre=
e_pages
     38.59 =C2=B1 31%     -60.2%      15.37 =C2=B1  0%  perf-profile.cpu-cy=
cles.shrink_zone.shrink_zones.do_try_to_free_pages.try_to_free_pages.__allo=
c_pages_nodemask
     38.05 =C2=B1 30%     -60.1%      15.17 =C2=B1  0%  perf-profile.cpu-cy=
cles.shrink_zones.do_try_to_free_pages.try_to_free_pages.__alloc_pages_node=
mask.alloc_pages_current
     36.81 =C2=B1 31%     -60.0%      14.74 =C2=B1  1%  perf-profile.cpu-cy=
cles.do_try_to_free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pa=
ges_current.__page_cache_alloc
     36.81 =C2=B1 31%     -60.0%      14.74 =C2=B1  1%  perf-profile.cpu-cy=
cles.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__page_ca=
che_alloc.__do_page_cache_readahead
     25.59 =C2=B1 30%     -60.5%      10.10 =C2=B1  3%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.ondemand_readahead
     25.61 =C2=B1 30%     -60.5%      10.12 =C2=B1  3%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.ondem=
and_readahead.page_cache_async_readahead
     25.61 =C2=B1 30%     -60.4%      10.13 =C2=B1  3%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.ondemand_readahead.page_c=
ache_async_readahead.filemap_fault
       646 =C2=B1 31%     -56.3%        282 =C2=B1 20%  sched_debug.cpu#24.=
ttwu_local
    110062 =C2=B1 35%     -58.0%      46222 =C2=B1 26%  sched_debug.cpu#41.=
sched_goidle
      2.17 =C2=B1 23%     -61.4%       0.83 =C2=B1  2%  perf-profile.cpu-cy=
cles.ret_from_fork
      2.17 =C2=B1 23%     -61.4%       0.83 =C2=B1  2%  perf-profile.cpu-cy=
cles.kthread.ret_from_fork
    221912 =C2=B1 35%     -57.9%      93448 =C2=B1 26%  sched_debug.cpu#41.=
nr_switches
    235539 =C2=B1 28%     -59.6%      95119 =C2=B1 25%  sched_debug.cpu#41.=
sched_count
    113095 =C2=B1 48%     -55.7%      50108 =C2=B1 19%  sched_debug.cpu#25.=
ttwu_count
       689 =C2=B1 25%     -62.8%        256 =C2=B1 12%  sched_debug.cpu#29.=
ttwu_local
    101269 =C2=B1 36%     -57.0%      43518 =C2=B1 16%  sched_debug.cpu#42.=
sched_goidle
    203648 =C2=B1 36%     -57.0%      87618 =C2=B1 15%  sched_debug.cpu#42.=
nr_switches
    205852 =C2=B1 35%     -56.8%      88943 =C2=B1 15%  sched_debug.cpu#42.=
sched_count
    270505 =C2=B1 43%     -57.0%     116240 =C2=B1 14%  sched_debug.cpu#33.=
sched_count
         6 =C2=B1 38%     -42.3%          3 =C2=B1 34%  sched_debug.cpu#44.=
cpu_load[4]
       140 =C2=B1 45%     -56.6%         61 =C2=B1 43%  sched_debug.cfs_rq[=
13]:/.tg_load_contrib
    177724 =C2=B1  9%    +217.1%     563500 =C2=B1  2%  sched_debug.cpu#2.s=
ched_goidle
    132568 =C2=B1 42%     -56.8%      57335 =C2=B1 14%  sched_debug.cpu#33.=
sched_goidle
    266176 =C2=B1 42%     -56.8%     115093 =C2=B1 14%  sched_debug.cpu#33.=
nr_switches
    361283 =C2=B1  9%    +219.0%    1152534 =C2=B1  1%  sched_debug.cpu#2.s=
ched_count
    358987 =C2=B1  9%    +214.5%    1129044 =C2=B1  3%  sched_debug.cpu#2.n=
r_switches
    357519 =C2=B1 43%     -56.8%     154299 =C2=B1 24%  sched_debug.cpu#22.=
avg_idle
     11.50 =C2=B1 31%     -56.1%       5.05 =C2=B1  9%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_pag=
e_cache_readahead.filemap_fault
     11.50 =C2=B1 31%     -56.0%       5.06 =C2=B1  9%  perf-profile.cpu-cy=
cles.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.filem=
ap_fault.__do_fault
     11.50 =C2=B1 31%     -56.1%       5.05 =C2=B1  9%  perf-profile.cpu-cy=
cles.__page_cache_alloc.__do_page_cache_readahead.filemap_fault.__do_fault.=
do_read_fault
     11.52 =C2=B1 31%     -56.0%       5.07 =C2=B1  9%  perf-profile.cpu-cy=
cles.__do_page_cache_readahead.filemap_fault.__do_fault.do_read_fault.handl=
e_mm_fault
       158 =C2=B1 17%     -64.5%         56 =C2=B1 30%  sched_debug.cfs_rq[=
17]:/.blocked_load_avg
       916 =C2=B1 16%     -63.9%        330 =C2=B1 20%  sched_debug.cpu#44.=
ttwu_local
    140398 =C2=B1 14%     -62.8%      52291 =C2=B1 13%  sched_debug.cpu#44.=
sched_goidle
    282255 =C2=B1 14%     -62.7%     105251 =C2=B1 13%  sched_debug.cpu#44.=
nr_switches
    283232 =C2=B1 13%     -61.3%     109484 =C2=B1 10%  sched_debug.cpu#44.=
sched_count
       722 =C2=B1 30%     -53.2%        337 =C2=B1 16%  sched_debug.cpu#38.=
ttwu_local
      4035 =C2=B1 47%     -36.9%       2548 =C2=B1 31%  meminfo.AnonHugePag=
es
    104439 =C2=B1 13%     -60.3%      41412 =C2=B1 17%  sched_debug.cpu#35.=
ttwu_count
     40.27 =C2=B1 27%     -54.5%      18.31 =C2=B1  0%  perf-profile.cpu-cy=
cles.handle_mm_fault.__do_page_fault.do_page_fault.page_fault.do_unit
     39.04 =C2=B1 28%     -54.5%      17.78 =C2=B1  0%  perf-profile.cpu-cy=
cles.__do_fault.do_read_fault.handle_mm_fault.__do_page_fault.do_page_fault
     39.04 =C2=B1 28%     -54.5%      17.78 =C2=B1  0%  perf-profile.cpu-cy=
cles.filemap_fault.__do_fault.do_read_fault.handle_mm_fault.__do_page_fault
     40.29 =C2=B1 27%     -54.5%      18.34 =C2=B1  0%  perf-profile.cpu-cy=
cles.__do_page_fault.do_page_fault.page_fault.do_unit
     40.30 =C2=B1 27%     -54.5%      18.34 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_page_fault.page_fault.do_unit
    144634 =C2=B1 29%     -61.9%      55063 =C2=B1 25%  sched_debug.cpu#34.=
sched_goidle
     40.31 =C2=B1 27%     -54.4%      18.37 =C2=B1  0%  perf-profile.cpu-cy=
cles.page_fault.do_unit
    290308 =C2=B1 29%     -61.9%     110535 =C2=B1 25%  sched_debug.cpu#34.=
nr_switches
       678 =C2=B1 36%     -49.6%        341 =C2=B1 31%  sched_debug.cpu#42.=
ttwu_local
    291037 =C2=B1 29%     -61.7%     111505 =C2=B1 25%  sched_debug.cpu#34.=
sched_count
     39.17 =C2=B1 28%     -54.2%      17.96 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_read_fault.isra.58.handle_mm_fault.__do_page_fault.do_page_fault.pa=
ge_fault
    127105 =C2=B1 42%     -56.0%      55930 =C2=B1 28%  sched_debug.cpu#34.=
ttwu_count
       571 =C2=B1 37%     -50.8%        281 =C2=B1 22%  sched_debug.cpu#31.=
ttwu_local
         8 =C2=B1 29%     -50.0%          4 =C2=B1 42%  sched_debug.cpu#24.=
cpu_load[4]
     27.52 =C2=B1 27%     -53.8%      12.71 =C2=B1  2%  perf-profile.cpu-cy=
cles.page_cache_async_readahead.filemap_fault.__do_fault.do_read_fault.hand=
le_mm_fault
     27.52 =C2=B1 27%     -53.8%      12.70 =C2=B1  2%  perf-profile.cpu-cy=
cles.ondemand_readahead.page_cache_async_readahead.filemap_fault.__do_fault=
.do_read_fault
     27.51 =C2=B1 27%     -53.8%      12.70 =C2=B1  2%  perf-profile.cpu-cy=
cles.__do_page_cache_readahead.ondemand_readahead.page_cache_async_readahea=
d.filemap_fault.__do_fault
    198359 =C2=B1 18%    +216.5%     627757 =C2=B1  2%  sched_debug.cpu#3.s=
ched_goidle
    399579 =C2=B1 18%    +214.7%    1257445 =C2=B1  2%  sched_debug.cpu#3.n=
r_switches
     37058 =C2=B1 24%     -48.5%      19099 =C2=B1 37%  proc-vmstat.pgactiv=
ate
    252555 =C2=B1 24%     -45.8%     136964 =C2=B1 45%  sched_debug.cpu#8.a=
vg_idle
       785 =C2=B1 18%     -59.5%        318 =C2=B1 28%  sched_debug.cpu#30.=
ttwu_local
      3604 =C2=B1 19%     -55.9%       1587 =C2=B1  7%  sched_debug.cpu#17.=
ttwu_local
        13 =C2=B1 23%     -63.5%          4 =C2=B1 40%  sched_debug.cpu#46.=
cpu_load[1]
    411392 =C2=B1 19%    +218.1%    1308463 =C2=B1  6%  sched_debug.cpu#3.s=
ched_count
     11248 =C2=B1 44%     -46.7%       5996 =C2=B1  8%  sched_debug.cfs_rq[=
29]:/.avg->runnable_avg_sum
        38 =C2=B1 18%     -53.9%         17 =C2=B1 19%  sched_debug.cpu#16.=
cpu_load[3]
       243 =C2=B1 44%     -46.6%        130 =C2=B1  8%  sched_debug.cfs_rq[=
29]:/.tg_runnable_contrib
    124035 =C2=B1 22%     -56.1%      54473 =C2=B1 31%  sched_debug.cpu#32.=
ttwu_count
    120002 =C2=B1 28%     -54.7%      54347 =C2=B1 10%  sched_debug.cpu#26.=
ttwu_count
        41 =C2=B1 19%     -53.0%         19 =C2=B1 26%  sched_debug.cfs_rq[=
1]:/.runnable_load_avg
        21 =C2=B1 16%    +151.2%         54 =C2=B1 29%  sched_debug.cpu#7.l=
oad
      8200 =C2=B1 41%    +207.2%      25186 =C2=B1 18%  cpuidle.C3-IVT.usage
       179 =C2=B1 13%     -57.9%         75 =C2=B1 30%  sched_debug.cfs_rq[=
17]:/.tg_load_contrib
       266 =C2=B1 25%     -52.1%        127 =C2=B1 11%  sched_debug.cfs_rq[=
27]:/.tg_runnable_contrib
     12234 =C2=B1 25%     -52.0%       5868 =C2=B1 11%  sched_debug.cfs_rq[=
27]:/.avg->runnable_avg_sum
        36 =C2=B1 19%     -52.1%         17 =C2=B1 21%  sched_debug.cpu#16.=
cpu_load[4]
        57 =C2=B1 35%     -53.5%         26 =C2=B1 23%  sched_debug.cpu#1.l=
oad
       911 =C2=B1 41%     -45.6%        495 =C2=B1 24%  sched_debug.cpu#29.=
curr->pid
       192 =C2=B1 19%     -62.8%         71 =C2=B1 42%  sched_debug.cfs_rq[=
34]:/.blocked_load_avg
    100556 =C2=B1 29%     -53.5%      46739 =C2=B1 32%  sched_debug.cpu#46.=
sched_goidle
    202682 =C2=B1 29%     -53.4%      94439 =C2=B1 32%  sched_debug.cpu#46.=
nr_switches
    203033 =C2=B1 29%     -51.1%      99370 =C2=B1 30%  sched_debug.cpu#46.=
sched_count
    112925 =C2=B1  6%     -58.7%      46633 =C2=B1 33%  sched_debug.cpu#30.=
ttwu_count
       197 =C2=B1 17%     -60.8%         77 =C2=B1 40%  sched_debug.cfs_rq[=
34]:/.tg_load_contrib
        57 =C2=B1 35%     -37.3%         35 =C2=B1 26%  sched_debug.cfs_rq[=
1]:/.load
       488 =C2=B1  5%     -56.1%        214 =C2=B1 12%  sched_debug.cpu#34.=
ttwu_local
        42 =C2=B1 19%     -49.4%         21 =C2=B1 18%  sched_debug.cpu#3.c=
pu_load[4]
    108113 =C2=B1 28%     -50.1%      53902 =C2=B1 19%  sched_debug.cpu#28.=
ttwu_count
     83738 =C2=B1 36%     -24.2%      63466 =C2=B1 46%  sched_debug.cpu#47.=
sched_goidle
        20 =C2=B1 25%    +136.2%         47 =C2=B1 36%  sched_debug.cfs_rq[=
21]:/.load
    395212 =C2=B1  1%     -59.5%     159962 =C2=B1 16%  sched_debug.cpu#21.=
avg_idle
        34 =C2=B1 33%     -36.2%         22 =C2=B1 34%  sched_debug.cpu#15.=
cpu_load[4]
    113163 =C2=B1 11%     -53.6%      52505 =C2=B1 12%  sched_debug.cpu#29.=
ttwu_count
    169129 =C2=B1 36%     -24.1%     128298 =C2=B1 45%  sched_debug.cpu#47.=
nr_switches
    169646 =C2=B1 36%     -23.5%     129736 =C2=B1 45%  sched_debug.cpu#47.=
sched_count
        33 =C2=B1 34%     -39.6%         20 =C2=B1 12%  sched_debug.cpu#15.=
cpu_load[0]
     11699 =C2=B1 13%     -45.7%       6354 =C2=B1 20%  sched_debug.cfs_rq[=
28]:/.avg->runnable_avg_sum
        43 =C2=B1  9%     -48.8%         22 =C2=B1 26%  sched_debug.cpu#1.c=
pu_load[1]
       470 =C2=B1 12%     -52.7%        222 =C2=B1  8%  sched_debug.cpu#33.=
ttwu_local
      3739 =C2=B1 23%     -39.4%       2265 =C2=B1 38%  sched_debug.cpu#13.=
ttwu_local
       254 =C2=B1 13%     -45.6%        138 =C2=B1 19%  sched_debug.cfs_rq[=
28]:/.tg_runnable_contrib
        44 =C2=B1 11%     -50.0%         22 =C2=B1 21%  sched_debug.cpu#1.c=
pu_load[0]
      3607 =C2=B1 14%     -48.6%       1854 =C2=B1 17%  sched_debug.cpu#23.=
ttwu_local
    394541 =C2=B1  1%     -51.8%     190213 =C2=B1 29%  sched_debug.cpu#18.=
avg_idle
    232039 =C2=B1 49%    +206.2%     710604 =C2=B1 10%  sched_debug.cpu#32.=
avg_idle
        33 =C2=B1 31%     -37.3%         21 =C2=B1 19%  sched_debug.cpu#15.=
cpu_load[1]
         9 =C2=B1 15%     -50.0%          4 =C2=B1 45%  sched_debug.cpu#24.=
cpu_load[3]
        42 =C2=B1  9%     -53.0%         19 =C2=B1 21%  sched_debug.cpu#16.=
cpu_load[0]
        34 =C2=B1 33%     -35.5%         22 =C2=B1 31%  sched_debug.cpu#15.=
cpu_load[3]
        39 =C2=B1 16%     -53.8%         18 =C2=B1 18%  sched_debug.cpu#16.=
cpu_load[2]
        41 =C2=B1 12%     -53.0%         19 =C2=B1 21%  sched_debug.cpu#16.=
cpu_load[1]
    325127 =C2=B1 11%     -50.1%     162114 =C2=B1 13%  sched_debug.cpu#19.=
avg_idle
        41 =C2=B1 17%     -47.6%         21 =C2=B1 11%  sched_debug.cpu#3.c=
pu_load[3]
       210 =C2=B1 26%     -39.8%        126 =C2=B1  9%  sched_debug.cfs_rq[=
30]:/.tg_runnable_contrib
      9654 =C2=B1 26%     -39.5%       5844 =C2=B1  9%  sched_debug.cfs_rq[=
30]:/.avg->runnable_avg_sum
        42 =C2=B1  7%     -48.2%         21 =C2=B1 26%  sched_debug.cpu#1.c=
pu_load[2]
        34 =C2=B1 32%     -35.3%         22 =C2=B1 27%  sched_debug.cpu#15.=
cpu_load[2]
    264389 =C2=B1 32%     -42.1%     153208 =C2=B1 30%  sched_debug.cpu#17.=
avg_idle
        32 =C2=B1 31%     -38.3%         19 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.runnable_load_avg
        41 =C2=B1  7%     -54.3%         18 =C2=B1 24%  sched_debug.cfs_rq[=
16]:/.runnable_load_avg
       225 =C2=B1 17%     -44.1%        126 =C2=B1  8%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
    348597 =C2=B1  0%    +103.0%     707663 =C2=B1  5%  sched_debug.cpu#34.=
avg_idle
    449999 =C2=B1 22%    +147.2%    1112495 =C2=B1  5%  sched_debug.cpu#14.=
sched_count
     77241 =C2=B1 24%     -41.3%      45332 =C2=B1  4%  numa-meminfo.node1.=
Active(anon)
    458252 =C2=B1 14%    +134.4%    1074159 =C2=B1  3%  sched_debug.cpu#15.=
nr_switches
    143667 =C2=B1  8%     -47.3%      75686 =C2=B1 34%  sched_debug.cpu#36.=
nr_switches
    198599 =C2=B1 12%     -40.4%     118410 =C2=B1 26%  sched_debug.cpu#24.=
sched_count
     10367 =C2=B1 17%     -44.1%       5797 =C2=B1  8%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
    226163 =C2=B1 15%    +136.4%     534622 =C2=B1  3%  sched_debug.cpu#15.=
sched_goidle
     71145 =C2=B1  8%     -47.8%      37141 =C2=B1 34%  sched_debug.cpu#36.=
sched_goidle
     18829 =C2=B1 25%     -40.4%      11220 =C2=B1  4%  numa-vmstat.node1.n=
r_active_anon
        65 =C2=B1 10%     -48.5%         33 =C2=B1 18%  sched_debug.cfs_rq[=
16]:/.load
    145293 =C2=B1  7%     -46.4%      77894 =C2=B1 33%  sched_debug.cpu#36.=
sched_count
     97284 =C2=B1  2%     -49.6%      49014 =C2=B1 24%  sched_debug.cpu#25.=
sched_goidle
    195675 =C2=B1  2%     -49.6%      98683 =C2=B1 24%  sched_debug.cpu#25.=
nr_switches
    550098 =C2=B1  9%    +121.5%    1218282 =C2=B1  1%  cpuidle.C6-IVT.usage
       199 =C2=B1 27%     -37.4%        124 =C2=B1  6%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
    195734 =C2=B1  2%     -48.6%     100523 =C2=B1 25%  sched_debug.cpu#25.=
sched_count
    307889 =C2=B1 24%     -43.3%     174487 =C2=B1 18%  sched_debug.cpu#20.=
avg_idle
    216214 =C2=B1 21%    +140.6%     520172 =C2=B1  2%  sched_debug.cpu#14.=
sched_goidle
         5 =C2=B1 20%     -40.0%          3 =C2=B1 23%  sched_debug.cpu#36.=
cpu_load[4]
        40 =C2=B1  3%     -46.3%         21 =C2=B1 26%  sched_debug.cpu#1.c=
pu_load[3]
        10 =C2=B1 20%     -42.5%          5 =C2=B1 25%  sched_debug.cfs_rq[=
42]:/.load
         5 =C2=B1  9%     -40.9%          3 =C2=B1 33%  sched_debug.cpu#36.=
cpu_load[3]
      0.02 =C2=B1  0%    +125.0%       0.04 =C2=B1 45%  turbostat.%c3
    436214 =C2=B1 21%    +139.0%    1042659 =C2=B1  2%  sched_debug.cpu#14.=
nr_switches
      9142 =C2=B1 27%     -37.1%       5751 =C2=B1  6%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
       250 =C2=B1 10%     -46.2%        134 =C2=B1 11%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
       185 =C2=B1 25%     -36.0%        118 =C2=B1  9%  sched_debug.cfs_rq[=
36]:/.tg_runnable_contrib
        68 =C2=B1  6%     -45.3%         37 =C2=B1 11%  sched_debug.cpu#16.=
load
     11467 =C2=B1 10%     -46.1%       6181 =C2=B1 11%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
      8527 =C2=B1 25%     -36.1%       5451 =C2=B1  9%  sched_debug.cfs_rq[=
36]:/.avg->runnable_avg_sum
      2757 =C2=B1 16%     -39.8%       1658 =C2=B1  5%  sched_debug.cpu#15.=
curr->pid
      3100 =C2=B1 17%     -28.6%       2212 =C2=B1 32%  sched_debug.cpu#18.=
ttwu_local
        24 =C2=B1  2%    +141.8%         59 =C2=B1 44%  sched_debug.cpu#18.=
load
        39 =C2=B1 18%     -44.3%         22 =C2=B1 11%  sched_debug.cpu#3.c=
pu_load[2]
     10432 =C2=B1  8%     -42.1%       6036 =C2=B1  9%  sched_debug.cfs_rq[=
38]:/.avg->runnable_avg_sum
       227 =C2=B1  7%     -42.4%        130 =C2=B1  9%  sched_debug.cfs_rq[=
38]:/.tg_runnable_contrib
     93977 =C2=B1  8%     -39.9%      56508 =C2=B1 30%  sched_debug.cpu#24.=
sched_goidle
    189361 =C2=B1  8%     -40.0%     113550 =C2=B1 30%  sched_debug.cpu#24.=
nr_switches
      2759 =C2=B1  8%     -47.3%       1454 =C2=B1 19%  sched_debug.cpu#1.c=
urr->pid
        37 =C2=B1 17%     -41.3%         22 =C2=B1 14%  sched_debug.cpu#3.c=
pu_load[1]
        35 =C2=B1 18%     -38.0%         22 =C2=B1 21%  sched_debug.cpu#3.c=
pu_load[0]
        39 =C2=B1  1%     -45.6%         21 =C2=B1 30%  sched_debug.cpu#1.c=
pu_load[4]
      1186 =C2=B1 23%     -31.6%        811 =C2=B1 30%  sched_debug.cpu#47.=
curr->pid
    354895 =C2=B1 13%    +105.7%     730183 =C2=B1  8%  sched_debug.cpu#35.=
avg_idle
     10495 =C2=B1 27%     -39.9%       6305 =C2=B1 14%  sched_debug.cfs_rq[=
24]:/.avg->runnable_avg_sum
     87380 =C2=B1 17%     -37.4%      54692 =C2=B1 10%  sched_debug.cpu#33.=
ttwu_count
       228 =C2=B1 27%     -39.8%        137 =C2=B1 14%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
       208 =C2=B1 24%     -38.4%        128 =C2=B1  9%  sched_debug.cfs_rq[=
34]:/.tg_runnable_contrib
       819 =C2=B1 24%     -39.3%        497 =C2=B1 21%  sched_debug.cpu#41.=
ttwu_local
       944 =C2=B1  5%     -43.2%        536 =C2=B1  7%  cpuidle.POLL.usage
      9573 =C2=B1 24%     -38.2%       5920 =C2=B1  9%  sched_debug.cfs_rq[=
34]:/.avg->runnable_avg_sum
        90 =C2=B1  4%     -35.1%         58 =C2=B1 35%  sched_debug.cfs_rq[=
11]:/.blocked_load_avg
    378417 =C2=B1  8%     +94.6%     736481 =C2=B1  9%  sched_debug.cpu#33.=
avg_idle
        20 =C2=B1 25%    +128.8%         45 =C2=B1 24%  sched_debug.cfs_rq[=
7]:/.load
     61938 =C2=B1 12%     -39.4%      37530 =C2=B1  5%  sched_debug.cfs_rq[=
32]:/.exec_clock
    521095 =C2=B1 24%    +117.9%    1135582 =C2=B1  6%  sched_debug.cpu#15.=
sched_count
         9 =C2=B1 15%     -52.6%          4 =C2=B1 36%  sched_debug.cpu#46.=
cpu_load[2]
    100874 =C2=B1 20%     -34.5%      66025 =C2=B1  1%  meminfo.Active(anon)
    292119 =C2=B1 28%     -43.7%     164431 =C2=B1 27%  sched_debug.cpu#13.=
avg_idle
    113098 =C2=B1  4%     -50.5%      56017 =C2=B1 22%  sched_debug.cpu#31.=
ttwu_count
    333765 =C2=B1  0%     +81.9%     607170 =C2=B1  1%  sched_debug.cpu#20.=
ttwu_count
     29688 =C2=B1 15%     -36.9%      18721 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.avg->runnable_avg_sum
     57876 =C2=B1 17%     -35.5%      37332 =C2=B1  6%  sched_debug.cfs_rq[=
27]:/.exec_clock
       647 =C2=B1 15%     -36.9%        408 =C2=B1  7%  sched_debug.cfs_rq[=
15]:/.tg_runnable_contrib
     33982 =C2=B1  9%     -39.3%      20638 =C2=B1  9%  sched_debug.cfs_rq[=
3]:/.avg->runnable_avg_sum
      1211 =C2=B1 25%     -40.3%        723 =C2=B1 21%  sched_debug.cpu#42.=
curr->pid
       742 =C2=B1  9%     -39.3%        450 =C2=B1  9%  sched_debug.cfs_rq[=
3]:/.tg_runnable_contrib
       674 =C2=B1 21%     -39.0%        411 =C2=B1 11%  sched_debug.cpu#39.=
ttwu_local
     24927 =C2=B1 20%     -33.6%      16551 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
         8 =C2=B1  5%     -41.2%          5 =C2=B1 24%  sched_debug.cfs_rq[=
28]:/.load
         8 =C2=B1 12%     -37.5%          5 =C2=B1 42%  sched_debug.cpu#42.=
cpu_load[0]
         8 =C2=B1  5%     -41.2%          5 =C2=B1 24%  sched_debug.cpu#28.=
load
         8 =C2=B1 12%     -37.5%          5 =C2=B1 42%  sched_debug.cfs_rq[=
42]:/.runnable_load_avg
       769 =C2=B1 26%     -38.0%        476 =C2=B1 18%  sched_debug.cpu#40.=
ttwu_local
     59399 =C2=B1 13%     -37.5%      37105 =C2=B1  2%  sched_debug.cfs_rq[=
29]:/.exec_clock
       593 =C2=B1 19%     -38.4%        365 =C2=B1 25%  sched_debug.cpu#45.=
ttwu_local
     73311 =C2=B1 25%     -34.4%      48092 =C2=B1 11%  sched_debug.cpu#37.=
sched_goidle
     58720 =C2=B1 15%     -36.9%      37068 =C2=B1  4%  sched_debug.cfs_rq[=
28]:/.exec_clock
     58563 =C2=B1 13%     -37.3%      36691 =C2=B1  4%  sched_debug.cfs_rq[=
30]:/.exec_clock
   3205188 =C2=B1 12%     -35.1%    2079297 =C2=B1 27%  cpuidle.C1E-IVT.time
    147981 =C2=B1 25%     -34.2%      97422 =C2=B1 11%  sched_debug.cpu#37.=
nr_switches
     58567 =C2=B1 13%     -36.4%      37225 =C2=B1  4%  sched_debug.cfs_rq[=
34]:/.exec_clock
       223 =C2=B1  1%     -46.0%        120 =C2=B1  9%  sched_debug.cfs_rq[=
35]:/.tg_runnable_contrib
     58949 =C2=B1  9%     -37.0%      37126 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.exec_clock
         6 =C2=B1  7%     -38.5%          4 =C2=B1 35%  sched_debug.cpu#46.=
cpu_load[4]
        20 =C2=B1 17%    +119.5%         45 =C2=B1 24%  sched_debug.cfs_rq[=
18]:/.load
    148106 =C2=B1 25%     -33.6%      98405 =C2=B1 11%  sched_debug.cpu#37.=
sched_count
    101872 =C2=B1 21%     -34.0%      67261 =C2=B1  6%  numa-meminfo.node1.=
Shmem
     10276 =C2=B1  1%     -46.0%       5553 =C2=B1  9%  sched_debug.cfs_rq[=
35]:/.avg->runnable_avg_sum
       852 =C2=B1  5%     -33.3%        568 =C2=B1 30%  sched_debug.cpu#27.=
curr->pid
     56228 =C2=B1 14%     -33.9%      37144 =C2=B1  2%  sched_debug.cfs_rq[=
25]:/.exec_clock
      8322 =C2=B1 15%     -34.2%       5477 =C2=B1  8%  sched_debug.cfs_rq[=
43]:/.avg->runnable_avg_sum
       180 =C2=B1 15%     -33.9%        119 =C2=B1  8%  sched_debug.cfs_rq[=
43]:/.tg_runnable_contrib
      3142 =C2=B1  5%     -35.1%       2041 =C2=B1 13%  sched_debug.cpu#20.=
ttwu_local
     79503 =C2=B1 13%     -36.2%      50683 =C2=B1 24%  sched_debug.cpu#41.=
ttwu_count
     11075 =C2=B1 13%     -34.2%       7290 =C2=B1 23%  sched_debug.cfs_rq[=
32]:/.avg->runnable_avg_sum
    107991 =C2=B1 18%     -31.5%      73987 =C2=B1  0%  meminfo.Shmem
       241 =C2=B1 13%     -34.5%        158 =C2=B1 23%  sched_debug.cfs_rq[=
32]:/.tg_runnable_contrib
    243694 =C2=B1 17%     -34.0%     160859 =C2=B1 21%  sched_debug.cpu#16.=
avg_idle
     24984 =C2=B1 21%     -33.1%      16716 =C2=B1  6%  numa-vmstat.node1.n=
r_shmem
        34 =C2=B1 14%     -37.5%         21 =C2=B1 17%  sched_debug.cfs_rq[=
3]:/.runnable_load_avg
     26661 =C2=B1 17%     -30.5%      18541 =C2=B1  1%  proc-vmstat.nr_shmem
    263599 =C2=B1  4%     -32.6%     177657 =C2=B1 18%  sched_debug.cpu#1.a=
vg_idle
       176 =C2=B1 19%     -29.8%        123 =C2=B1  3%  sched_debug.cfs_rq[=
44]:/.tg_runnable_contrib
     56734 =C2=B1 11%     -34.4%      37240 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.exec_clock
     54635 =C2=B1 13%     -33.1%      36526 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.exec_clock
        46 =C2=B1 36%    +129.9%        105 =C2=B1  8%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
      8104 =C2=B1 19%     -29.7%       5697 =C2=B1  3%  sched_debug.cfs_rq[=
44]:/.avg->runnable_avg_sum
         9 =C2=B1 11%     -38.9%          5 =C2=B1 45%  sched_debug.cpu#34.=
cpu_load[0]
         9 =C2=B1 11%     -41.7%          5 =C2=B1 41%  sched_debug.cpu#42.=
cpu_load[1]
        10 =C2=B1  0%     -47.5%          5 =C2=B1 36%  sched_debug.cfs_rq[=
31]:/.runnable_load_avg
         4 =C2=B1 11%     -38.9%          2 =C2=B1 30%  sched_debug.cpu#42.=
cpu_load[4]
    393940 =C2=B1  1%     -35.9%     252557 =C2=B1 15%  sched_debug.cpu#0.a=
vg_idle
     55119 =C2=B1  8%     -34.2%      36278 =C2=B1  3%  sched_debug.cfs_rq[=
35]:/.exec_clock
       204 =C2=B1  0%     -40.2%        122 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.tg_runnable_contrib
       878 =C2=B1 11%     -30.9%        607 =C2=B1 18%  sched_debug.cpu#46.=
curr->pid
      9421 =C2=B1  0%     -40.5%       5602 =C2=B1  3%  sched_debug.cfs_rq[=
45]:/.avg->runnable_avg_sum
     71278 =C2=B1 19%     -34.3%      46823 =C2=B1 14%  sched_debug.cpu#45.=
ttwu_count
       706 =C2=B1  2%     -37.3%        443 =C2=B1 16%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
       640 =C2=B1 21%     -27.5%        464 =C2=B1 11%  sched_debug.cfs_rq[=
9]:/.tg_runnable_contrib
     32384 =C2=B1  2%     -37.2%      20347 =C2=B1 16%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
     29418 =C2=B1 21%     -27.6%      21302 =C2=B1 11%  sched_debug.cfs_rq[=
9]:/.avg->runnable_avg_sum
    115950 =C2=B1  7%     -32.3%      78456 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.exec_clock
        12 =C2=B1  4%     +50.0%         18 =C2=B1 16%  sched_debug.cfs_rq[=
19]:/.runnable_load_avg
    337262 =C2=B1 38%    +115.2%     725624 =C2=B1  5%  sched_debug.cpu#30.=
avg_idle
       509 =C2=B1 14%     -37.4%        318 =C2=B1 40%  sched_debug.cpu#25.=
ttwu_local
    415228 =C2=B1  3%     +60.6%     666835 =C2=B1 10%  sched_debug.cpu#24.=
avg_idle
    122127 =C2=B1  8%     -33.8%      80901 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.exec_clock
         7 =C2=B1  6%     -46.7%          4 =C2=B1 39%  sched_debug.cpu#31.=
cpu_load[4]
         7 =C2=B1  6%     -40.0%          4 =C2=B1 24%  sched_debug.cpu#42.=
cpu_load[2]
         7 =C2=B1 14%     -32.1%          4 =C2=B1 31%  sched_debug.cpu#47.=
cpu_load[3]
         8 =C2=B1  0%     -46.9%          4 =C2=B1 34%  sched_debug.cpu#46.=
cpu_load[3]
         7 =C2=B1  6%     -40.0%          4 =C2=B1 40%  sched_debug.cfs_rq[=
28]:/.runnable_load_avg
      2828 =C2=B1  5%     -33.2%       1890 =C2=B1 18%  sched_debug.cpu#16.=
ttwu_local
       973 =C2=B1  2%     -38.1%        602 =C2=B1 30%  sched_debug.cpu#38.=
curr->pid
     12.72 =C2=B1 16%     -26.7%       9.33 =C2=B1  0%  perf-profile.cpu-cy=
cles.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lruvec.shrin=
k_zone
    120434 =C2=B1 16%     -28.4%      86248 =C2=B1  3%  numa-meminfo.node1.=
Active
    115868 =C2=B1  7%     -32.1%      78675 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.exec_clock
      2730 =C2=B1  1%     -35.4%       1764 =C2=B1  5%  sched_debug.cpu#3.c=
urr->pid
     12.49 =C2=B1 16%     -25.8%       9.27 =C2=B1  0%  perf-profile.cpu-cy=
cles.rmap_walk.try_to_unmap.shrink_page_list.shrink_inactive_list.shrink_lr=
uvec
     76589 =C2=B1 20%     -29.7%      53841 =C2=B1 13%  sched_debug.cpu#37.=
ttwu_count
         9 =C2=B1 15%     -42.1%          5 =C2=B1 48%  sched_debug.cpu#31.=
cpu_load[2]
    124110 =C2=B1  4%     -33.1%      82971 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.exec_clock
     75681 =C2=B1 15%     -37.4%      47341 =C2=B1 22%  sched_debug.cpu#43.=
ttwu_count
   2937556 =C2=B1 14%     -26.6%    2157455 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.min_vruntime
    351956 =C2=B1 41%    +113.5%     751528 =C2=B1  3%  sched_debug.cpu#29.=
avg_idle
      2893 =C2=B1 10%     -31.3%       1988 =C2=B1 11%  sched_debug.cpu#2.c=
urr->pid
    333679 =C2=B1  9%     +64.6%     549118 =C2=B1  3%  sched_debug.cpu#8.t=
twu_count
        16 =C2=B1 33%     +95.5%         32 =C2=B1  8%  sched_debug.cpu#7.c=
pu_load[0]
     55033 =C2=B1  6%     -32.1%      37382 =C2=B1  3%  sched_debug.cfs_rq[=
33]:/.exec_clock
   2912268 =C2=B1 14%     -24.9%    2186689 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.min_vruntime
    103839 =C2=B1 17%     -23.2%      79742 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.exec_clock
    221835 =C2=B1  3%     -36.6%     140546 =C2=B1 14%  sched_debug.cpu#5.a=
vg_idle
        39 =C2=B1 18%     -24.7%         29 =C2=B1  9%  sched_debug.cfs_rq[=
15]:/.load
     49071 =C2=B1  9%     -26.8%      35934 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.exec_clock
   2709012 =C2=B1 16%     -22.3%    2104190 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.min_vruntime
         6 =C2=B1  0%     -45.8%          3 =C2=B1 25%  sched_debug.cpu#42.=
cpu_load[3]
         8 =C2=B1 12%     -40.6%          4 =C2=B1 40%  sched_debug.cpu#31.=
cpu_load[3]
        11 =C2=B1  4%     -47.8%          6 =C2=B1 40%  sched_debug.cpu#38.=
cpu_load[0]
         8 =C2=B1 12%     -50.0%          4 =C2=B1 50%  sched_debug.cpu#27.=
cpu_load[4]
    386952 =C2=B1 23%     +83.0%     708259 =C2=B1  2%  sched_debug.cpu#26.=
avg_idle
      7326 =C2=B1  9%     -23.5%       5608 =C2=B1  9%  sched_debug.cfs_rq[=
42]:/.avg->runnable_avg_sum
   3191103 =C2=B1  2%     -31.4%    2188471 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     82086 =C2=B1  6%     -33.0%      54958 =C2=B1  8%  sched_debug.cpu#44.=
ttwu_count
   2890142 =C2=B1 13%     -24.9%    2171243 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.min_vruntime
      2457 =C2=B1 18%     -29.9%       1723 =C2=B1 19%  sched_debug.cpu#9.c=
urr->pid
   2727512 =C2=B1 14%     -23.3%    2091338 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.min_vruntime
       159 =C2=B1  9%     -23.3%        122 =C2=B1  9%  sched_debug.cfs_rq[=
42]:/.tg_runnable_contrib
      2462 =C2=B1 13%     -27.1%       1795 =C2=B1 10%  sched_debug.cpu#16.=
curr->pid
   2701103 =C2=B1 15%     -22.1%    2102936 =C2=B1  2%  sched_debug.cfs_rq[=
22]:/.min_vruntime
   3034169 =C2=B1 10%     -25.7%    2254798 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.min_vruntime
   3155734 =C2=B1  1%     -31.3%    2168304 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.min_vruntime
   2281498 =C2=B1 10%     -26.4%    1680208 =C2=B1  2%  sched_debug.cfs_rq[=
32]:/.min_vruntime
   3057557 =C2=B1  6%     -27.7%    2209313 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.min_vruntime
   2254079 =C2=B1  9%     -25.8%    1671750 =C2=B1  2%  sched_debug.cfs_rq[=
28]:/.min_vruntime
     92291 =C2=B1 18%     -19.2%      74589 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.exec_clock
   3063883 =C2=B1  1%     -30.1%    2142059 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.min_vruntime
     50151 =C2=B1  6%     -26.7%      36747 =C2=B1  3%  sched_debug.cfs_rq[=
39]:/.exec_clock
     35769 =C2=B1  8%     -29.9%      25064 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
   3068829 =C2=B1  1%     -30.9%    2120576 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.min_vruntime
       781 =C2=B1  8%     -30.0%        547 =C2=B1  6%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
   2256242 =C2=B1  9%     -25.7%    1675498 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.min_vruntime
     50205 =C2=B1  6%     -26.9%      36707 =C2=B1  3%  sched_debug.cfs_rq[=
37]:/.exec_clock
   3250759 =C2=B1  5%     -27.5%    2358220 =C2=B1  0%  softirqs.TIMER
   2244501 =C2=B1 10%     -25.3%    1676302 =C2=B1  2%  sched_debug.cfs_rq[=
27]:/.min_vruntime
   2232461 =C2=B1  9%     -25.1%    1671122 =C2=B1  2%  sched_debug.cfs_rq[=
30]:/.min_vruntime
    412796 =C2=B1 25%     +75.6%     724762 =C2=B1 10%  sched_debug.cpu#25.=
avg_idle
    101241 =C2=B1 15%     -20.2%      80832 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.exec_clock
   2880339 =C2=B1 10%     -22.6%    2228081 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.min_vruntime
  3.77e+09 =C2=B1 12%     +62.4%  6.121e+09 =C2=B1  1%  cpuidle.C6-IVT.time
     31003 =C2=B1 16%     -29.6%      21815 =C2=B1 16%  sched_debug.cfs_rq[=
14]:/.avg->runnable_avg_sum
       676 =C2=B1 16%     -29.5%        476 =C2=B1 16%  sched_debug.cfs_rq[=
14]:/.tg_runnable_contrib
   2240325 =C2=B1  7%     -25.3%    1672621 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.min_vruntime
   2228382 =C2=B1  9%     -24.7%    1677834 =C2=B1  2%  sched_debug.cfs_rq[=
34]:/.min_vruntime
    236748 =C2=B1  3%     -34.0%     156159 =C2=B1 12%  sched_debug.cpu#4.a=
vg_idle
   2888090 =C2=B1  7%     -25.1%    2163595 =C2=B1  2%  sched_debug.cfs_rq[=
13]:/.min_vruntime
         9 =C2=B1  5%     -36.8%          6 =C2=B1 20%  sched_debug.cpu#38.=
cpu_load[2]
        19 =C2=B1  2%     -30.8%         13 =C2=B1  3%  vmstat.procs.r
   2206299 =C2=B1  9%     -24.0%    1676888 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     48946 =C2=B1  4%     -26.4%      36012 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.exec_clock
   2169012 =C2=B1  9%     -23.0%    1670950 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.min_vruntime
    267987 =C2=B1  3%     -39.6%     161758 =C2=B1 25%  sched_debug.cpu#7.a=
vg_idle
   2220319 =C2=B1  7%     -24.5%    1675674 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.min_vruntime
      1614 =C2=B1  6%     -28.2%       1160 =C2=B1 10%  sched_debug.cpu#9.t=
twu_local
     49240 =C2=B1  4%     -26.6%      36165 =C2=B1  4%  sched_debug.cfs_rq[=
43]:/.exec_clock
      2351 =C2=B1 13%     -21.0%       1857 =C2=B1 14%  sched_debug.cpu#14.=
curr->pid
   2148224 =C2=B1  8%     -22.8%    1659387 =C2=B1  2%  sched_debug.cfs_rq[=
35]:/.min_vruntime
     50310 =C2=B1  6%     -22.7%      38883 =C2=B1  5%  sched_debug.cfs_rq[=
47]:/.exec_clock
     50877 =C2=B1  4%     -25.5%      37897 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.exec_clock
   2185406 =C2=B1  7%     -23.1%    1681305 =C2=B1  2%  sched_debug.cfs_rq[=
33]:/.min_vruntime
     48668 =C2=B1  5%     -25.3%      36375 =C2=B1  3%  sched_debug.cfs_rq[=
45]:/.exec_clock
   2735251 =C2=B1  8%     -21.3%    2151871 =C2=B1  0%  sched_debug.cfs_rq[=
8]:/.min_vruntime
       892 =C2=B1  1%     -30.4%        621 =C2=B1  9%  sched_debug.cpu#28.=
curr->pid
     18745 =C2=B1  4%     -24.6%      14130 =C2=B1  2%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
     18738 =C2=B1  4%     -24.6%      14127 =C2=B1  2%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
     18727 =C2=B1  4%     -24.6%      14123 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
     18732 =C2=B1  4%     -24.6%      14125 =C2=B1  2%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
     18722 =C2=B1  4%     -24.6%      14120 =C2=B1  2%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
     25479 =C2=B1  3%     -27.5%      18484 =C2=B1 14%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
     49186 =C2=B1  8%     -24.7%      37045 =C2=B1  4%  sched_debug.cfs_rq[=
46]:/.exec_clock
        10 =C2=B1  4%     -42.9%          6 =C2=B1 45%  sched_debug.cpu#38.=
cpu_load[1]
       556 =C2=B1  3%     -27.4%        404 =C2=B1 14%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib
    184300 =C2=B1 10%     -19.5%     148390 =C2=B1  1%  meminfo.Active
   2906500 =C2=B1  2%     -25.4%    2167333 =C2=B1  0%  sched_debug.cfs_rq[=
4]:/.min_vruntime
     18732 =C2=B1  4%     -24.6%      14125 =C2=B1  2%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
     18734 =C2=B1  4%     -24.6%      14131 =C2=B1  2%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
     18722 =C2=B1  4%     -24.6%      14114 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
     48754 =C2=B1  3%     -25.8%      36196 =C2=B1  3%  sched_debug.cfs_rq[=
41]:/.exec_clock
      2342 =C2=B1  3%     -29.4%       1654 =C2=B1 13%  sched_debug.cpu#14.=
ttwu_local
     86444 =C2=B1  8%     -20.5%      68719 =C2=B1  2%  sched_debug.cpu#28.=
nr_load_updates
   2117189 =C2=B1  6%     -21.0%    1672016 =C2=B1  2%  sched_debug.cfs_rq[=
37]:/.min_vruntime
     89642 =C2=B1  6%     -20.9%      70889 =C2=B1  2%  sched_debug.cpu#32.=
nr_load_updates
     18719 =C2=B1  4%     -24.4%      14155 =C2=B1  2%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
     18719 =C2=B1  4%     -24.4%      14158 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
     18746 =C2=B1  4%     -24.3%      14194 =C2=B1  2%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
     18705 =C2=B1  4%     -24.4%      14147 =C2=B1  2%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
     18711 =C2=B1  4%     -24.4%      14151 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
     18747 =C2=B1  4%     -24.3%      14200 =C2=B1  2%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
     18750 =C2=B1  4%     -24.2%      14209 =C2=B1  2%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
     18757 =C2=B1  4%     -24.2%      14220 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
     18763 =C2=B1  4%     -24.2%      14223 =C2=B1  2%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
   2566671 =C2=B1 10%     -18.9%    2081331 =C2=B1  2%  sched_debug.cfs_rq[=
20]:/.min_vruntime
     18753 =C2=B1  4%     -24.2%      14220 =C2=B1  2%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
    113665 =C2=B1  2%     -24.8%      85481 =C2=B1  0%  sched_debug.cfs_rq[=
1]:/.exec_clock
     18680 =C2=B1  5%     -23.6%      14275 =C2=B1  3%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
        17 =C2=B1 31%     +75.7%         30 =C2=B1  7%  sched_debug.cpu#7.c=
pu_load[1]
     18766 =C2=B1  4%     -24.1%      14241 =C2=B1  2%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
     18767 =C2=B1  4%     -24.2%      14228 =C2=B1  2%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
     18665 =C2=B1  5%     -23.8%      14231 =C2=B1  2%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
     18674 =C2=B1  5%     -23.8%      14235 =C2=B1  2%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
     18674 =C2=B1  5%     -23.5%      14280 =C2=B1  3%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
    104108 =C2=B1  6%     -22.1%      81073 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.exec_clock
      1481 =C2=B1 13%     -19.1%       1198 =C2=B1  7%  sched_debug.cpu#10.=
ttwu_local
     18677 =C2=B1  5%     -23.8%      14223 =C2=B1  3%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
     18677 =C2=B1  5%     -23.8%      14223 =C2=B1  3%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
     18680 =C2=B1  5%     -23.8%      14228 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
    675646 =C2=B1 28%     +71.2%    1156997 =C2=B1  2%  sched_debug.cpu#1.s=
ched_count
     18627 =C2=B1  5%     -23.6%      14228 =C2=B1  3%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
     18631 =C2=B1  5%     -23.2%      14308 =C2=B1  3%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
     18627 =C2=B1  5%     -23.6%      14230 =C2=B1  3%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
     18628 =C2=B1  5%     -23.6%      14231 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
       165 =C2=B1  2%     -25.1%        124 =C2=B1  8%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
     18636 =C2=B1  5%     -23.2%      14310 =C2=B1  3%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
      7637 =C2=B1  2%     -25.5%       5692 =C2=B1  8%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
     18621 =C2=B1  5%     -23.2%      14310 =C2=B1  3%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
    117808 =C2=B1  7%     -20.2%      93969 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.exec_clock
     28849 =C2=B1 12%     -19.8%      23134 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
     18603 =C2=B1  4%     -23.1%      14313 =C2=B1  3%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
     18736 =C2=B1  4%     -22.6%      14498 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
     18730 =C2=B1  4%     -22.6%      14494 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
     18722 =C2=B1  4%     -22.6%      14491 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
     18736 =C2=B1  4%     -22.6%      14501 =C2=B1  1%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
     18734 =C2=B1  4%     -22.6%      14499 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
     18603 =C2=B1  4%     -22.1%      14485 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
    103545 =C2=B1  5%     -21.5%      81273 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.exec_clock
     47941 =C2=B1  2%     -24.4%      36242 =C2=B1  2%  sched_debug.cfs_rq[=
42]:/.exec_clock
   2070791 =C2=B1  6%     -19.1%    1675576 =C2=B1  2%  sched_debug.cfs_rq[=
47]:/.min_vruntime
       629 =C2=B1 12%     -19.6%        505 =C2=B1  6%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
    331579 =C2=B1 27%     +70.3%     564606 =C2=B1  2%  sched_debug.cpu#1.s=
ched_goidle
   2132511 =C2=B1  5%     -20.7%    1691609 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.min_vruntime
   2072109 =C2=B1  7%     -19.8%    1662238 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.min_vruntime
    667043 =C2=B1 27%     +69.7%    1132176 =C2=B1  2%  sched_debug.cpu#1.n=
r_switches
        15 =C2=B1 46%     +95.0%         29 =C2=B1 10%  sched_debug.cfs_rq[=
7]:/.runnable_load_avg
     18629 =C2=B1  3%     -22.2%      14489 =C2=B1  1%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
     18628 =C2=B1  3%     -22.2%      14487 =C2=B1  1%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
     18631 =C2=B1  3%     -22.2%      14492 =C2=B1  1%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
     18630 =C2=B1  3%     -22.2%      14490 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
   2075199 =C2=B1  7%     -19.2%    1675770 =C2=B1  2%  sched_debug.cfs_rq[=
46]:/.min_vruntime
     18632 =C2=B1  3%     -22.2%      14496 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
      2313 =C2=B1  3%     -24.9%       1737 =C2=B1 13%  sched_debug.cpu#4.c=
urr->pid
     18625 =C2=B1  3%     -22.2%      14497 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
     18627 =C2=B1  3%     -22.2%      14501 =C2=B1  1%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
     18627 =C2=B1  3%     -22.1%      14503 =C2=B1  1%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
     87154 =C2=B1  8%     -19.7%      70009 =C2=B1  2%  sched_debug.cpu#30.=
nr_load_updates
   2066890 =C2=B1  5%     -19.4%    1665872 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.min_vruntime
        22 =C2=B1 11%     -13.3%         19 =C2=B1 13%  sched_debug.cpu#20.=
cpu_load[2]
        33 =C2=B1  6%     +35.6%         44 =C2=B1 12%  sched_debug.cpu#0.l=
oad
   2070604 =C2=B1  6%     -19.2%    1673355 =C2=B1  2%  sched_debug.cfs_rq[=
45]:/.min_vruntime
    365951 =C2=B1 33%     +72.9%     632720 =C2=B1  3%  sched_debug.cpu#18.=
ttwu_count
     87470 =C2=B1  7%     -19.3%      70583 =C2=B1  1%  sched_debug.cpu#29.=
nr_load_updates
   2780140 =C2=B1  2%     -21.6%    2178979 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.min_vruntime
   2113140 =C2=B1  5%     -20.9%    1671691 =C2=B1  1%  sched_debug.cfs_rq[=
39]:/.min_vruntime
       495 =C2=B1  2%     -22.0%        386 =C2=B1  3%  numa-vmstat.node0.n=
r_isolated_file
     87282 =C2=B1  5%     -19.9%      69905 =C2=B1  2%  sched_debug.cpu#31.=
nr_load_updates
   2776275 =C2=B1  2%     -21.6%    2177359 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.min_vruntime
   2797293 =C2=B1  0%     -22.4%    2171180 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.min_vruntime
   2067716 =C2=B1  4%     -19.8%    1659081 =C2=B1  2%  sched_debug.cfs_rq[=
41]:/.min_vruntime
       183 =C2=B1  4%     -21.3%        144 =C2=B1 11%  sched_debug.cfs_rq[=
46]:/.tg_runnable_contrib
      8446 =C2=B1  4%     -21.6%       6624 =C2=B1 11%  sched_debug.cfs_rq[=
46]:/.avg->runnable_avg_sum
   2068500 =C2=B1  4%     -19.5%    1665943 =C2=B1  2%  sched_debug.cfs_rq[=
43]:/.min_vruntime
   2064957 =C2=B1  4%     -19.1%    1669565 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.min_vruntime
     84917 =C2=B1  9%     -16.7%      70727 =C2=B1  3%  sched_debug.cpu#27.=
nr_load_updates
     49411 =C2=B1  1%     -22.9%      38114 =C2=B1  4%  sched_debug.cfs_rq[=
40]:/.exec_clock
   2097900 =C2=B1  4%     -19.4%    1690936 =C2=B1  2%  sched_debug.cfs_rq[=
40]:/.min_vruntime
      3.13 =C2=B1 12%     +46.1%       4.57 =C2=B1  1%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
    102310 =C2=B1 10%     -14.3%      87646 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.exec_clock
      3.15 =C2=B1 12%     +46.0%       4.59 =C2=B1  1%  perf-profile.cpu-cy=
cles.start_secondary
       625 =C2=B1  1%     -23.5%        478 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.tg_runnable_contrib
      1.34 =C2=B1 12%     +45.0%       1.95 =C2=B1  3%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.start_secondary
      5393 =C2=B1  4%     -17.7%       4439 =C2=B1 12%  numa-vmstat.node0.n=
r_anon_pages
     21562 =C2=B1  4%     -17.5%      17782 =C2=B1 12%  numa-meminfo.node0.=
AnonPages
   2670003 =C2=B1  1%     -21.2%    2104927 =C2=B1  2%  sched_debug.cfs_rq[=
16]:/.min_vruntime
     28696 =C2=B1  1%     -23.6%      21938 =C2=B1  4%  sched_debug.cfs_rq[=
5]:/.avg->runnable_avg_sum
     86063 =C2=B1  5%     -18.8%      69919 =C2=B1  3%  sched_debug.cpu#34.=
nr_load_updates
       676 =C2=B1  2%     -28.5%        483 =C2=B1 20%  sched_debug.cpu#46.=
ttwu_local
      0.98 =C2=B1 15%     +46.9%       1.44 =C2=B1  0%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
      0.92 =C2=B1 15%     +46.4%       1.34 =C2=B1  1%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_s=
econdary
        18 =C2=B1 18%     +48.6%         27 =C2=B1  5%  sched_debug.cfs_rq[=
20]:/.load
   2616968 =C2=B1  2%     -19.7%    2100626 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.min_vruntime
     88866 =C2=B1  6%     -15.5%      75092 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.exec_clock
      5.32 =C2=B1 23%     +56.5%       8.34 =C2=B1  2%  turbostat.%c6
     83944 =C2=B1  6%     -17.1%      69586 =C2=B1  1%  sched_debug.cpu#25.=
nr_load_updates
     96567 =C2=B1  7%     -16.2%      80964 =C2=B1  2%  sched_debug.cfs_rq[=
6]:/.exec_clock
      2337 =C2=B1  4%     -17.8%       1922 =C2=B1 12%  sched_debug.cpu#8.c=
urr->pid
       644 =C2=B1  2%     -18.4%        526 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
       173 =C2=B1 10%     -19.0%        140 =C2=B1 10%  sched_debug.cfs_rq[=
40]:/.tg_runnable_contrib
        17 =C2=B1  8%     +37.1%         24 =C2=B1 12%  sched_debug.cpu#21.=
cpu_load[4]
        18 =C2=B1  5%     +29.2%         23 =C2=B1 13%  sched_debug.cpu#21.=
cpu_load[3]
     29479 =C2=B1  2%     -18.3%      24085 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
      2312 =C2=B1  4%     -27.3%       1680 =C2=B1 16%  sched_debug.cpu#17.=
curr->pid
      7988 =C2=B1 10%     -19.0%       6468 =C2=B1 10%  sched_debug.cfs_rq[=
40]:/.avg->runnable_avg_sum
        30 =C2=B1  1%     +36.9%         41 =C2=B1 27%  sched_debug.cpu#5.l=
oad
    442320 =C2=B1 20%     +50.1%     663933 =C2=B1  3%  sched_debug.cpu#4.s=
ched_goidle
        18 =C2=B1 29%     +58.1%         29 =C2=B1  2%  sched_debug.cpu#7.c=
pu_load[3]
        18 =C2=B1 33%     +63.9%         29 =C2=B1  3%  sched_debug.cpu#7.c=
pu_load[2]
    431501 =C2=B1 36%     +65.8%     715220 =C2=B1  9%  sched_debug.cpu#27.=
avg_idle
     83829 =C2=B1  5%     -15.7%      70681 =C2=B1  1%  sched_debug.cpu#26.=
nr_load_updates
    889245 =C2=B1 20%     +49.7%    1331482 =C2=B1  4%  sched_debug.cpu#4.n=
r_switches
   3472067 =C2=B1  5%     -16.8%    2889475 =C2=B1  3%  numa-meminfo.node0.=
MemFree
       591 =C2=B1  3%     -18.0%        485 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.tg_runnable_contrib
     83450 =C2=B1  3%     -17.9%      68547 =C2=B1  2%  sched_debug.cpu#35.=
nr_load_updates
   2571432 =C2=B1  1%     -17.6%    2119533 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.min_vruntime
     27116 =C2=B1  3%     -17.9%      22268 =C2=B1  5%  sched_debug.cfs_rq[=
13]:/.avg->runnable_avg_sum
     82841 =C2=B1  5%     -15.4%      70118 =C2=B1  2%  sched_debug.cpu#24.=
nr_load_updates
      1.82 =C2=B1 11%     +35.2%       2.47 =C2=B1  0%  perf-profile.cpu-cy=
cles.xfs_vm_readpages.__do_page_cache_readahead.ondemand_readahead.page_cac=
he_async_readahead.filemap_fault
      1.81 =C2=B1 11%     +35.7%       2.46 =C2=B1  0%  perf-profile.cpu-cy=
cles.mpage_readpages.xfs_vm_readpages.__do_page_cache_readahead.ondemand_re=
adahead.page_cache_async_readahead
    867184 =C2=B1  5%     -15.0%     736731 =C2=B1  2%  numa-vmstat.node0.n=
r_free_pages
       555 =C2=B1  8%     -21.3%        436 =C2=B1 17%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
    924672 =C2=B1 19%     +47.3%    1362330 =C2=B1  3%  sched_debug.cpu#4.s=
ched_count
      1.21 =C2=B1 18%     +44.6%       1.74 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_page_cache_rea=
dahead.ondemand_readahead
     25390 =C2=B1  8%     -21.1%      20035 =C2=B1 17%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
   2557617 =C2=B1  0%     -17.2%    2118082 =C2=B1  1%  sched_debug.cfs_rq[=
19]:/.min_vruntime
    351375 =C2=B1  1%     -12.9%     306106 =C2=B1  6%  softirqs.SCHED
      2370 =C2=B1  6%     -13.2%       2058 =C2=B1  6%  sched_debug.cpu#13.=
curr->pid
     91070 =C2=B1  7%     -12.8%      79415 =C2=B1  2%  sched_debug.cfs_rq[=
8]:/.exec_clock
     95294 =C2=B1  4%     -14.1%      81823 =C2=B1  0%  sched_debug.cfs_rq[=
5]:/.exec_clock
    238317 =C2=B1  5%     -30.9%     164683 =C2=B1 34%  sched_debug.cpu#6.a=
vg_idle
     83424 =C2=B1  2%     -16.2%      69867 =C2=B1  2%  sched_debug.cpu#33.=
nr_load_updates
      8294 =C2=B1  2%     -23.4%       6355 =C2=B1 18%  sched_debug.cfs_rq[=
33]:/.avg->runnable_avg_sum
       180 =C2=B1  2%     -23.2%        138 =C2=B1 18%  sched_debug.cfs_rq[=
33]:/.tg_runnable_contrib
     95628 =C2=B1  4%     -14.2%      82063 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.exec_clock
    131027 =C2=B1  4%     -11.9%     115387 =C2=B1  1%  sched_debug.cpu#14.=
nr_load_updates
    398962 =C2=B1 35%     +58.2%     631265 =C2=B1  2%  sched_debug.cpu#19.=
ttwu_count
    133714 =C2=B1  5%     -11.4%     118513 =C2=B1  0%  sched_debug.cpu#3.n=
r_load_updates
     85431 =C2=B1  5%     -12.5%      74779 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.exec_clock
     78487 =C2=B1  3%     -12.9%      68362 =C2=B1  3%  sched_debug.cpu#36.=
nr_load_updates
       572 =C2=B1  1%     -18.1%        468 =C2=B1  9%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
    135275 =C2=B1  3%     -12.7%     118072 =C2=B1  0%  sched_debug.cpu#2.n=
r_load_updates
     26171 =C2=B1  1%     -17.8%      21516 =C2=B1  9%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
        30 =C2=B1  6%     -11.7%         26 =C2=B1 10%  sched_debug.cpu#5.c=
pu_load[4]
    131222 =C2=B1  5%     -11.6%     116049 =C2=B1  0%  sched_debug.cpu#15.=
nr_load_updates
 4.739e+09 =C2=B1  3%     -13.1%  4.119e+09 =C2=B1  2%  cpuidle.C1-IVT.time
        32 =C2=B1  3%     +25.8%         40 =C2=B1 10%  sched_debug.cpu#8.l=
oad
    486160 =C2=B1  8%     +28.9%     626649 =C2=B1  3%  sched_debug.cpu#13.=
ttwu_count
     79004 =C2=B1  2%     -13.1%      68621 =C2=B1  2%  sched_debug.cpu#37.=
nr_load_updates
     78588 =C2=B1  3%     -11.5%      69531 =C2=B1  2%  sched_debug.cpu#39.=
nr_load_updates
        97 =C2=B1  2%     -20.4%         77 =C2=B1 10%  sched_debug.cfs_rq[=
16]:/.tg_load_contrib
      2.50 =C2=B1 30%     +53.0%       3.82 =C2=B1  0%  perf-profile.cpu-cy=
cles.generic_smp_call_function_single_interrupt.smp_call_function_interrupt=
.call_function_interrupt.do_unit
      2233 =C2=B1  4%     -15.2%       1893 =C2=B1 14%  sched_debug.cpu#5.c=
urr->pid
      2.79 =C2=B1 29%     +51.9%       4.24 =C2=B1  0%  perf-profile.cpu-cy=
cles.smp_call_function_interrupt.call_function_interrupt.do_unit
    410822 =C2=B1 32%     +53.0%     628526 =C2=B1  3%  sched_debug.cpu#17.=
ttwu_count
      2.17 =C2=B1 30%     +51.0%       3.27 =C2=B1  0%  perf-profile.cpu-cy=
cles.flush_smp_call_function_queue.generic_smp_call_function_single_interru=
pt.smp_call_function_interrupt.call_function_interrupt.do_unit
      6181 =C2=B1  2%     -14.9%       5262 =C2=B1  8%  numa-vmstat.node0.n=
r_active_anon
    378032 =C2=B1 30%     +50.5%     568832 =C2=B1  2%  sched_debug.cpu#6.t=
twu_count
      4.48 =C2=B1 29%     +50.2%       6.74 =C2=B1  0%  perf-profile.cpu-cy=
cles.call_function_interrupt.do_unit.runtime_exceeded
     78723 =C2=B1  2%     -11.9%      69385 =C2=B1  2%  sched_debug.cpu#46.=
nr_load_updates
        19 =C2=B1 28%     +47.4%         28 =C2=B1  2%  sched_debug.cpu#7.c=
pu_load[4]
     24780 =C2=B1  2%     -14.8%      21123 =C2=B1  8%  numa-meminfo.node0.=
Active(anon)
     79208 =C2=B1  2%     -12.5%      69275 =C2=B1  1%  sched_debug.cpu#43.=
nr_load_updates
      1001 =C2=B1  0%     -12.8%        873 =C2=B1  2%  proc-vmstat.nr_isol=
ated_file
    122398 =C2=B1  5%      -8.0%     112589 =C2=B1  1%  sched_debug.cpu#0.n=
r_load_updates
       838 =C2=B1  4%     -26.7%        614 =C2=B1 26%  sched_debug.cpu#32.=
curr->pid
     52.08 =C2=B1  1%     +16.7%      60.80 =C2=B1  0%  turbostat.%c1
     78330 =C2=B1  1%     -12.2%      68759 =C2=B1  2%  sched_debug.cpu#45.=
nr_load_updates
     78994 =C2=B1  1%     -12.4%      69228 =C2=B1  1%  sched_debug.cpu#44.=
nr_load_updates
     77859 =C2=B1  1%     -10.3%      69825 =C2=B1  3%  sched_debug.cpu#47.=
nr_load_updates
      9588 =C2=B1  3%     +17.7%      11289 =C2=B1  0%  uptime.idle
     77946 =C2=B1  1%     -11.6%      68910 =C2=B1  1%  sched_debug.cpu#42.=
nr_load_updates
        29 =C2=B1  1%     +22.0%         36 =C2=B1 14%  sched_debug.cfs_rq[=
8]:/.load
     79172 =C2=B1  1%     -10.3%      71045 =C2=B1  1%  sched_debug.cpu#38.=
nr_load_updates
     78525 =C2=B1  1%     -11.3%      69640 =C2=B1  2%  sched_debug.cpu#41.=
nr_load_updates
    552379 =C2=B1  3%      -7.4%     511740 =C2=B1  0%  meminfo.Committed_AS
     78896 =C2=B1  1%     -10.5%      70631 =C2=B1  2%  sched_debug.cpu#40.=
nr_load_updates
    659571 =C2=B1  6%     +18.5%     781765 =C2=B1  4%  sched_debug.cpu#44.=
avg_idle
      2200 =C2=B1 16%     -67.7%        710 =C2=B1  6%  time.system_time
     77502 =C2=B1 10%     -43.3%      43925 =C2=B1  5%  time.involuntary_co=
ntext_switches
     42.57 =C2=B1  5%     -27.6%      30.82 =C2=B1  0%  turbostat.%c0
      1933 =C2=B1  5%     -25.6%       1437 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
   1325078 =C2=B1  3%     -21.2%    1044202 =C2=B1  0%  vmstat.system.in
       138 =C2=B1  2%      -9.3%        125 =C2=B1  0%  turbostat.Cor_W
       171 =C2=B1  1%      -7.5%        159 =C2=B1  0%  turbostat.Pkg_W
  30073157 =C2=B1  3%      +4.7%   31478827 =C2=B1  0%  time.voluntary_cont=
ext_switches
      3758 =C2=B1  0%      -1.1%       3717 =C2=B1  0%  time.user_time


ivb43: Ivytown Ivy Bridge-EP
Memory: 64G


                                   unixbench.score

  12000 ++-----------------------------------------------------------------=
-+
        |                                     .*      *..   .*..           =
 |
  11800 *+*..*.*..*.*..*.*.*..     *.    .*.*.  +    :   *.*    *.*..*.*.. =
.*
        |                         +  *..*        *.. :                    *=
 |
  11600 ++                    *. +                  *                      =
 |
        |                       *                                          =
 |
  11400 ++                    O O  O O  O O O  O                           =
 |
        |                                                                  =
 |
  11200 ++                                                                 =
 |
        | O                                      O                         =
 |
  11000 O+   O O  O    O O O                                               =
 |
        |           O                               O    O O O             =
 |
  10800 ++                                                                 =
 |
        |                                             O                    =
 |
  10600 ++-----------------------------------------------------------------=
-+


                            time.voluntary_context_switches

  3.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    3e+06 ++                                           O                   =
 |
          O O  O O O  O      O                      O    O  O O            =
 |
          |             O  O   O  O O O  O O O  O O                        =
 |
  2.5e+06 ++                                                               =
 |
          |                                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          *.*..*.*.*..*.*..*.*.*.. .*.*..*.*.*..*.*.  .*.*..*.*.*..*.*.*..*=
.*
   500000 ++----------------------*-----------------*----------------------=
-+


                                  vmstat.system.cs

  105000 ++----------------------------------------------------------------=
-+
         O O       O        O      O  O O  O O      O O  O O  O            =
 |
         |    O O    O O  O    O O             O  O                        =
 |
  100000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
   95000 ++                                                                =
 |
         |                                                                 =
 |
   90000 ++                                                                =
 |
         |                                                                 =
 |
         |                                              .*.  .*.           =
 |
   85000 *+*..*.*..*.*.*..*.*..    *..*.*..*.*.*..*. .*.   *.   *.*..*.*..*=
.*
         |                     *. +                 *                      =
 |
         |                       *                                         =
 |
   80000 ++----------------------------------------------------------------=
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
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============2587458788511098903==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB1bml4YmVuY2gKZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVz
dAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51
bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6
IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAog
IGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tz
dGF0czogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcTogCiAgdHVyYm9zdGF0OiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiAxMAogIHBtZXRlcjogCmRlZmF1bHRfd2F0Y2hkb2dzOgogIHdhdGNo
LW9vbTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOgotIHBlcmZvcm1hbmNlCmNvbW1p
dDogYjczOTJkMjI0N2NmZTY3NzFmOTVkMjU2Mzc0ZjFhOGU2YTZmNDhkNgptb2RlbDogR3JhbnRs
ZXkgSGFzd2VsbApucl9jcHU6IDE2Cm1lbW9yeTogMTZHCmhkZF9wYXJ0aXRpb25zOiAKc3dhcF9w
YXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCnVuaXhiZW5jaDoKICB0ZXN0OgogIC0gZXhl
Y2wKdGVzdGJveDogbGl0dXlhCnRib3hfZ3JvdXA6IGxpdHV5YQprY29uZmlnOiB4ODZfNjQtcmhl
bAplbnF1ZXVlX3RpbWU6IDIwMTQtMTItMTggMTc6NTI6MTEuNDU5NDc5Njg0ICswODowMApoZWFk
X2NvbW1pdDogZDVkMmZkN2FmODk2NDUxYjg2MjI3YTA4NDdiNTQ5NzZkODdkMTNmMwpiYXNlX2Nv
bW1pdDogYjczOTJkMjI0N2NmZTY3NzFmOTVkMjU2Mzc0ZjFhOGU2YTZmNDhkNgpicmFuY2g6IGxp
bnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE0MTIzMDE5Cmtlcm5lbDogIi9rZXJuZWwveDg2XzY0
LXJoZWwvYjczOTJkMjI0N2NmZTY3NzFmOTVkMjU2Mzc0ZjFhOGU2YTZmNDhkNi92bWxpbnV6LTMu
MTkuMC1yYzItZ2I3MzkyZDIiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJvb3RmczogZGViaWFu
LXg4Nl82NC5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2xpdHV5YS91bml4YmVuY2gvcGVyZm9y
bWFuY2UtZXhlY2wvZGViaWFuLXg4Nl82NC5jZ3oveDg2XzY0LXJoZWwvYjczOTJkMjI0N2NmZTY3
NzFmOTVkMjU2Mzc0ZjFhOGU2YTZmNDhkNi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xp
dHV5YS9jeWNsaWNfdW5peGJlbmNoLXBlcmZvcm1hbmNlLWV4ZWNsLXg4Nl82NC1yaGVsLUJBU0Ut
YjczOTJkMjI0N2NmZTY3NzFmOTVkMjU2Mzc0ZjFhOGU2YTZmNDhkNi0wLnlhbWwiCmRlcXVldWVf
dGltZTogMjAxNC0xMi0zMCAxOTo0OToyMS45MTk2NjMzNzkgKzA4OjAwCmpvYl9zdGF0ZTogZmlu
aXNoZWQKbG9hZGF2ZzogOS4yNiAzLjgyIDEuNDIgMS8xNjQgNTEzOApzdGFydF90aW1lOiAnMTQx
OTk0MDE5MCcKZW5kX3RpbWU6ICcxNDE5OTQwMzg4Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0y
MDE0MTIzMC0wOTE4MzMiCg==

--===============2587458788511098903==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vUnVuIGV4ZWNsCg==

--===============2587458788511098903==--

