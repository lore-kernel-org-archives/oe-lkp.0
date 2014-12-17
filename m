Content-Type: multipart/mixed; boundary="===============4304127806897039272=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [mm] 1306a85aed3: +5.8% will-it-scale.per_thread_ops
Date: Wed, 17 Dec 2014 16:18:27 +0800
Message-ID: <1418804307.5745.252.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4304127806897039272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 1306a85aed3ec3db98945aafb7dfbe5648a1203c ("mm: embed the memcg point=
er directly into struct page")


testbox/testcase/testparams: lkp-snb01/will-it-scale/performance-page_fault2

22811c6bc3c764d8  1306a85aed3ec3db98945aafb7  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    185591 =C2=B1  0%      +5.8%     196339 =C2=B1  0%  will-it-scale.per_t=
hread_ops
    268066 =C2=B1  0%      +4.2%     279258 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
     66204 =C2=B1 47%     -79.9%      13282 =C2=B1  6%  sched_debug.cpu#14.=
sched_count
       726 =C2=B1 12%    -100.0%          0 =C2=B1  0%  slabinfo.blkdev_req=
uests.num_objs
       726 =C2=B1 12%    -100.0%          0 =C2=B1  0%  slabinfo.blkdev_req=
uests.active_objs
       282 =C2=B1 11%     -86.2%         39 =C2=B1  0%  slabinfo.bdev_cache=
.num_objs
       282 =C2=B1 11%     -86.2%         39 =C2=B1  0%  slabinfo.bdev_cache=
.active_objs
       536 =C2=B1 10%     -92.7%         39 =C2=B1  0%  slabinfo.blkdev_ioc=
.num_objs
       536 =C2=B1 10%     -92.7%         39 =C2=B1  0%  slabinfo.blkdev_ioc=
.active_objs
       745 =C2=B1 13%     -93.0%         52 =C2=B1 34%  slabinfo.xfs_buf.nu=
m_objs
      1.35 =C2=B1  2%     -97.0%       0.04 =C2=B1 17%  perf-profile.cpu-cy=
cles.mem_cgroup_page_lruvec.release_pages.free_pages_and_swap_cache.tlb_flu=
sh_mmu_free.unmap_page_range
     70832 =C2=B1  7%     -84.6%      10928 =C2=B1  0%  meminfo.DirectMap4k
       745 =C2=B1 13%     -93.0%         52 =C2=B1 34%  slabinfo.xfs_buf.ac=
tive_objs
        20 =C2=B1 34%    +173.8%         54 =C2=B1 38%  sched_debug.cfs_rq[=
25]:/.runnable_load_avg
        21 =C2=B1 32%    +163.5%         56 =C2=B1 37%  sched_debug.cfs_rq[=
25]:/.load
        21 =C2=B1 32%    +163.5%         56 =C2=B1 37%  sched_debug.cpu#25.=
load
      6.68 =C2=B1  2%     -69.0%       2.07 =C2=B1  4%  perf-profile.cpu-cy=
cles.lru_cache_add_active_or_unevictable.do_cow_fault.handle_mm_fault.__do_=
page_fault.do_page_fault
     11481 =C2=B1 40%     -60.4%       4550 =C2=B1 24%  sched_debug.cpu#31.=
sched_count
     35880 =C2=B1 29%     -54.4%      16355 =C2=B1 20%  sched_debug.cpu#8.s=
ched_count
        30 =C2=B1 44%     +90.8%         57 =C2=B1 34%  sched_debug.cpu#25.=
cpu_load[0]
       258 =C2=B1 42%     -58.4%        107 =C2=B1 21%  sched_debug.cfs_rq[=
20]:/.blocked_load_avg
       615 =C2=B1 47%     -55.8%        271 =C2=B1 18%  sched_debug.cpu#22.=
ttwu_local
        24 =C2=B1 36%     +81.6%         44 =C2=B1 26%  sched_debug.cpu#25.=
cpu_load[1]
     31132 =C2=B1 41%     -47.8%      16259 =C2=B1 47%  sched_debug.cpu#13.=
sched_count
       287 =C2=B1 37%     -53.0%        135 =C2=B1 18%  sched_debug.cfs_rq[=
20]:/.tg_load_contrib
      2755 =C2=B1 22%     +79.7%       4950 =C2=B1 36%  sched_debug.cpu#8.t=
twu_local
         9 =C2=B1 22%     +69.2%         16 =C2=B1 31%  sched_debug.cpu#14.=
cpu_load[0]
      8626 =C2=B1 14%     -46.4%       4621 =C2=B1 32%  sched_debug.cpu#0.t=
twu_local
        37 =C2=B1 44%     -43.6%         21 =C2=B1 22%  sched_debug.cpu#31.=
cpu_load[1]
       390 =C2=B1 13%     -45.3%        213 =C2=B1 16%  sched_debug.cfs_rq[=
25]:/.blocked_load_avg
        14 =C2=B1 24%     -40.4%          8 =C2=B1 25%  sched_debug.cpu#13.=
cpu_load[0]
    309688 =C2=B1 24%     -44.8%     170966 =C2=B1 34%  sched_debug.cfs_rq[=
18]:/.spread0
       410 =C2=B1 13%     -34.6%        268 =C2=B1  7%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
        20 =C2=B1 30%     +64.6%         33 =C2=B1 17%  sched_debug.cpu#25.=
cpu_load[2]
    370117 =C2=B1  6%     -43.0%     210857 =C2=B1 45%  sched_debug.cfs_rq[=
17]:/.spread0
        28 =C2=B1 29%     -34.2%         18 =C2=B1 10%  sched_debug.cpu#31.=
cpu_load[2]
     16558 =C2=B1 28%     -40.9%       9784 =C2=B1 11%  sched_debug.cfs_rq[=
8]:/.exec_clock
      8517 =C2=B1 15%     -32.9%       5715 =C2=B1  9%  sched_debug.cpu#20.=
sched_count
      2301 =C2=B1 29%     +68.2%       3871 =C2=B1 17%  sched_debug.cpu#29.=
ttwu_count
        13 =C2=B1 17%     -35.8%          8 =C2=B1 26%  sched_debug.cfs_rq[=
13]:/.runnable_load_avg
      2317 =C2=B1  6%     -26.5%       1703 =C2=B1 18%  sched_debug.cpu#13.=
curr->pid
      2470 =C2=B1 12%     -23.3%       1893 =C2=B1 12%  sched_debug.cpu#15.=
curr->pid
        12 =C2=B1 14%     -28.0%          9 =C2=B1  7%  sched_debug.cpu#13.=
cpu_load[3]
    330696 =C2=B1 22%     -35.6%     212829 =C2=B1  5%  sched_debug.cfs_rq[=
8]:/.min_vruntime
        42 =C2=B1 38%     -43.8%         23 =C2=B1 15%  sched_debug.cpu#24.=
cpu_load[0]
      2556 =C2=B1  6%     +42.8%       3649 =C2=B1  9%  sched_debug.cpu#25.=
curr->pid
        33 =C2=B1 33%     -34.6%         21 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.load
        33 =C2=B1 33%     -33.1%         22 =C2=B1  7%  sched_debug.cpu#5.l=
oad
      3595 =C2=B1 17%     -25.0%       2697 =C2=B1  5%  sched_debug.cpu#17.=
ttwu_count
     24718 =C2=B1 15%     -27.3%      17972 =C2=B1 13%  sched_debug.cpu#0.n=
r_switches
        18 =C2=B1 25%     +45.2%         26 =C2=B1 10%  sched_debug.cpu#25.=
cpu_load[3]
      7788 =C2=B1 16%     -24.8%       5857 =C2=B1  5%  sched_debug.cpu#17.=
nr_switches
        17 =C2=B1 12%     +31.4%         23 =C2=B1 17%  sched_debug.cpu#1.c=
pu_load[3]
        18 =C2=B1 10%     +33.3%         24 =C2=B1 16%  sched_debug.cpu#1.c=
pu_load[2]
      6091 =C2=B1  5%     -26.8%       4460 =C2=B1 25%  sched_debug.cpu#31.=
nr_switches
      3956 =C2=B1 15%     -28.8%       2816 =C2=B1 16%  sched_debug.cpu#31.=
ttwu_count
      4.82 =C2=B1  1%     -24.3%       3.65 =C2=B1  1%  perf-profile.cpu-cy=
cles.release_pages.free_pages_and_swap_cache.tlb_flush_mmu_free.unmap_page_=
range.unmap_single_vma
        13 =C2=B1  9%     -26.9%          9 =C2=B1 11%  sched_debug.cpu#13.=
cpu_load[2]
      3327 =C2=B1 11%     -20.2%       2655 =C2=B1 11%  sched_debug.cpu#4.c=
urr->pid
      4.91 =C2=B1  1%     -23.8%       3.74 =C2=B1  1%  perf-profile.cpu-cy=
cles.tlb_flush_mmu_free.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_=
region
      4.91 =C2=B1  1%     -23.7%       3.74 =C2=B1  1%  perf-profile.cpu-cy=
cles.free_pages_and_swap_cache.tlb_flush_mmu_free.unmap_page_range.unmap_si=
ngle_vma.unmap_vmas
        36 =C2=B1  8%     -22.9%         27 =C2=B1  7%  sched_debug.cpu#17.=
cpu_load[0]
      1.74 =C2=B1  2%     -22.8%       1.34 =C2=B1  2%  perf-profile.cpu-cy=
cles.unlock_page.do_cow_fault.handle_mm_fault.__do_page_fault.do_page_fault
        17 =C2=B1 21%     +33.8%         22 =C2=B1  7%  sched_debug.cpu#25.=
cpu_load[4]
    347045 =C2=B1  0%     -20.8%     274703 =C2=B1  0%  meminfo.Inactive(fi=
le)
     86761 =C2=B1  0%     -20.8%      68676 =C2=B1  0%  proc-vmstat.nr_inac=
tive_file
     42941 =C2=B1  0%     -20.7%      34065 =C2=B1  1%  numa-vmstat.node0.n=
r_inactive_file
    171765 =C2=B1  0%     -20.7%     136260 =C2=B1  1%  numa-meminfo.node0.=
Inactive(file)
    175280 =C2=B1  0%     -21.0%     138443 =C2=B1  1%  numa-meminfo.node1.=
Inactive(file)
     43819 =C2=B1  0%     -21.0%      34611 =C2=B1  1%  numa-vmstat.node1.n=
r_inactive_file
     14245 =C2=B1 13%     -28.8%      10144 =C2=B1 18%  sched_debug.cpu#0.t=
twu_count
     34770 =C2=B1 14%     +29.3%      44960 =C2=B1 18%  sched_debug.cfs_rq[=
1]:/.exec_clock
      1.23 =C2=B1  1%     +23.8%       1.52 =C2=B1  2%  perf-profile.cpu-cy=
cles._raw_spin_lock.get_page_from_freelist.__alloc_pages_nodemask.alloc_pag=
es_vma.do_cow_fault
        17 =C2=B1 21%     +23.5%         21 =C2=B1  7%  sched_debug.cpu#29.=
cpu_load[3]
        32 =C2=B1  5%     -12.2%         28 =C2=B1  8%  sched_debug.cpu#21.=
cpu_load[1]
        35 =C2=B1  9%     -19.1%         28 =C2=B1  8%  sched_debug.cpu#17.=
cpu_load[1]
     10608 =C2=B1  2%     -17.2%       8783 =C2=B1  4%  numa-vmstat.node0.n=
r_active_file
     42435 =C2=B1  2%     -17.2%      35136 =C2=B1  4%  numa-meminfo.node0.=
Active(file)
     63836 =C2=B1  0%     -16.9%      53045 =C2=B1  0%  numa-vmstat.node1.n=
uma_interleave
     53212 =C2=B1  0%     -16.3%      44533 =C2=B1  0%  numa-vmstat.node0.n=
uma_interleave
     84165 =C2=B1  0%     -16.2%      70563 =C2=B1  0%  meminfo.Active(file)
     21040 =C2=B1  0%     -16.2%      17640 =C2=B1  0%  proc-vmstat.nr_acti=
ve_file
      6709 =C2=B1  0%     +18.4%       7944 =C2=B1  3%  sched_debug.cfs_rq[=
20]:/.tg_load_avg
      6711 =C2=B1  0%     +18.5%       7950 =C2=B1  3%  sched_debug.cfs_rq[=
21]:/.tg_load_avg
     35768 =C2=B1  9%     -15.0%      30418 =C2=B1  8%  sched_debug.cpu#8.n=
r_load_updates
      6714 =C2=B1  0%     +18.4%       7946 =C2=B1  3%  sched_debug.cfs_rq[=
22]:/.tg_load_avg
      6717 =C2=B1  0%     +18.0%       7924 =C2=B1  3%  sched_debug.cfs_rq[=
18]:/.tg_load_avg
      6712 =C2=B1  0%     +17.9%       7910 =C2=B1  3%  sched_debug.cfs_rq[=
19]:/.tg_load_avg
      6688 =C2=B1  1%     +17.9%       7883 =C2=B1  2%  sched_debug.cfs_rq[=
23]:/.tg_load_avg
        33 =C2=B1  5%     -16.5%         27 =C2=B1  2%  sched_debug.cpu#21.=
cpu_load[0]
      6893 =C2=B1  0%     +17.4%       8092 =C2=B1  3%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
      6988 =C2=B1  1%     +15.6%       8078 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      6577 =C2=B1  1%     +18.0%       7760 =C2=B1  3%  sched_debug.cfs_rq[=
30]:/.tg_load_avg
      6982 =C2=B1  1%     +16.1%       8105 =C2=B1  3%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      6875 =C2=B1  0%     +17.6%       8085 =C2=B1  3%  sched_debug.cfs_rq[=
8]:/.tg_load_avg
      6579 =C2=B1  1%     +17.8%       7748 =C2=B1  3%  sched_debug.cfs_rq[=
29]:/.tg_load_avg
      7016 =C2=B1  1%     +15.2%       8083 =C2=B1  4%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
      6873 =C2=B1  0%     +17.0%       8042 =C2=B1  3%  sched_debug.cfs_rq[=
9]:/.tg_load_avg
      7005 =C2=B1  1%     +15.4%       8084 =C2=B1  3%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
        34 =C2=B1  5%     -13.9%         29 =C2=B1  6%  sched_debug.cpu#20.=
cpu_load[0]
      6737 =C2=B1  1%     +17.6%       7922 =C2=B1  3%  sched_debug.cfs_rq[=
17]:/.tg_load_avg
      6742 =C2=B1  1%     +17.4%       7912 =C2=B1  3%  sched_debug.cfs_rq[=
16]:/.tg_load_avg
      6575 =C2=B1  1%     +17.4%       7720 =C2=B1  3%  sched_debug.cfs_rq[=
31]:/.tg_load_avg
      8.09 =C2=B1  1%     -13.8%       6.97 =C2=B1  0%  perf-profile.cpu-cy=
cles.munmap
      8.08 =C2=B1  1%     -13.7%       6.97 =C2=B1  0%  perf-profile.cpu-cy=
cles.system_call_fastpath.munmap
        27 =C2=B1  6%      -9.0%         25 =C2=B1  4%  sched_debug.cfs_rq[=
23]:/.runnable_load_avg
      8.07 =C2=B1  1%     -13.8%       6.96 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_munmap.vm_munmap.sys_munmap.system_call_fastpath.munmap
      8.07 =C2=B1  1%     -13.8%       6.95 =C2=B1  0%  perf-profile.cpu-cy=
cles.unmap_region.do_munmap.vm_munmap.sys_munmap.system_call_fastpath
      8.08 =C2=B1  1%     -13.8%       6.97 =C2=B1  0%  perf-profile.cpu-cy=
cles.vm_munmap.sys_munmap.system_call_fastpath.munmap
      8.08 =C2=B1  1%     -13.8%       6.97 =C2=B1  0%  perf-profile.cpu-cy=
cles.sys_munmap.system_call_fastpath.munmap
      6939 =C2=B1  1%     +16.4%       8080 =C2=B1  3%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
      6710 =C2=B1  1%     +16.4%       7812 =C2=B1  3%  sched_debug.cfs_rq[=
24]:/.tg_load_avg
      6653 =C2=B1  1%     +17.0%       7783 =C2=B1  3%  sched_debug.cfs_rq[=
26]:/.tg_load_avg
    622401 =C2=B1  4%     +15.2%     717037 =C2=B1 11%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      1504 =C2=B1  1%     -13.6%       1300 =C2=B1  7%  slabinfo.sock_inode=
_cache.active_objs
        30 =C2=B1  8%     -15.4%         26 =C2=B1  5%  sched_debug.cpu#23.=
load
      1504 =C2=B1  1%     -13.6%       1300 =C2=B1  7%  slabinfo.sock_inode=
_cache.num_objs
        30 =C2=B1  8%     -15.4%         26 =C2=B1  5%  sched_debug.cfs_rq[=
23]:/.load
      7.46 =C2=B1  0%     -13.3%       6.47 =C2=B1  0%  perf-profile.cpu-cy=
cles.unmap_vmas.unmap_region.do_munmap.vm_munmap.sys_munmap
      7.46 =C2=B1  0%     -13.3%       6.47 =C2=B1  0%  perf-profile.cpu-cy=
cles.unmap_single_vma.unmap_vmas.unmap_region.do_munmap.vm_munmap
      5.11 =C2=B1  1%     +15.5%       5.90 =C2=B1  0%  perf-profile.cpu-cy=
cles.__list_del_entry.list_del.__rmqueue.get_page_from_freelist.__alloc_pag=
es_nodemask
      6887 =C2=B1  0%     +16.0%       7986 =C2=B1  3%  sched_debug.cfs_rq[=
10]:/.tg_load_avg
      6645 =C2=B1  2%     +17.1%       7783 =C2=B1  3%  sched_debug.cfs_rq[=
25]:/.tg_load_avg
      7.40 =C2=B1  0%     -13.4%       6.41 =C2=B1  0%  perf-profile.cpu-cy=
cles.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region.do_munmap
      5.16 =C2=B1  1%     +15.7%       5.96 =C2=B1  0%  perf-profile.cpu-cy=
cles.list_del.__rmqueue.get_page_from_freelist.__alloc_pages_nodemask.alloc=
_pages_vma
    687523 =C2=B1  2%     +11.9%     769461 =C2=B1  4%  sched_debug.cfs_rq[=
0]:/.min_vruntime
      6834 =C2=B1  0%     +16.8%       7979 =C2=B1  3%  sched_debug.cfs_rq[=
14]:/.tg_load_avg
      6885 =C2=B1  0%     +16.1%       7996 =C2=B1  3%  sched_debug.cfs_rq[=
12]:/.tg_load_avg
      6894 =C2=B1  0%     +16.1%       8005 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.tg_load_avg
      6803 =C2=B1  1%     +16.2%       7901 =C2=B1  3%  sched_debug.cfs_rq[=
15]:/.tg_load_avg
      6963 =C2=B1  1%     +16.1%       8087 =C2=B1  3%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
      6841 =C2=B1  0%     +16.8%       7991 =C2=B1  3%  sched_debug.cfs_rq[=
13]:/.tg_load_avg
      5.64 =C2=B1  1%     +14.8%       6.48 =C2=B1  0%  perf-profile.cpu-cy=
cles.__rmqueue.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vm=
a.do_cow_fault
       403 =C2=B1  7%     +13.6%        458 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      6967 =C2=B1  1%     +15.9%       8078 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
     18553 =C2=B1  7%     +13.6%      21084 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
      6645 =C2=B1  1%     +16.7%       7755 =C2=B1  3%  sched_debug.cfs_rq[=
27]:/.tg_load_avg
      8.77 =C2=B1  0%     +14.1%      10.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_vma.do_cow_f=
ault.handle_mm_fault
     37777 =C2=B1 12%     +20.6%      45541 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.exec_clock
     67160 =C2=B1  8%     -12.5%      58785 =C2=B1  8%  sched_debug.cfs_rq[=
18]:/.exec_clock
      6641 =C2=B1  2%     +16.6%       7742 =C2=B1  3%  sched_debug.cfs_rq[=
28]:/.tg_load_avg
        35 =C2=B1  9%     -17.0%         29 =C2=B1 10%  sched_debug.cpu#17.=
cpu_load[2]
        34 =C2=B1  9%     -13.7%         30 =C2=B1  9%  sched_debug.cpu#17.=
cpu_load[3]
      9.53 =C2=B1  0%     +12.7%      10.74 =C2=B1  0%  perf-profile.cpu-cy=
cles.__alloc_pages_nodemask.alloc_pages_vma.do_cow_fault.handle_mm_fault.__=
do_page_fault
     10.08 =C2=B1  0%     +12.5%      11.34 =C2=B1  0%  perf-profile.cpu-cy=
cles.alloc_pages_vma.do_cow_fault.handle_mm_fault.__do_page_fault.do_page_f=
ault
     41728 =C2=B1  2%     -15.1%      35425 =C2=B1  4%  numa-meminfo.node1.=
Active(file)
     10431 =C2=B1  2%     -15.1%       8856 =C2=B1  4%  numa-vmstat.node1.n=
r_active_file
     19883 =C2=B1  0%     -10.0%      17893 =C2=B1  1%  slabinfo.radix_tree=
_node.num_objs
      7.52 =C2=B1  1%     +11.3%       8.37 =C2=B1  1%  perf-profile.cpu-cy=
cles._raw_spin_lock.do_cow_fault.handle_mm_fault.__do_page_fault.do_page_fa=
ult
     14873 =C2=B1  5%     -11.0%      13243 =C2=B1  6%  sched_debug.cpu#14.=
nr_switches
        56 =C2=B1  3%      -7.1%         52 =C2=B1  6%  sched_debug.cpu#16.=
cpu_load[2]
     19817 =C2=B1  0%      -9.9%      17856 =C2=B1  0%  slabinfo.radix_tree=
_node.active_objs
     49459 =C2=B1 10%     +14.7%      56743 =C2=B1  2%  sched_debug.cpu#25.=
nr_load_updates
    741856 =C2=B1 10%     +16.5%     864387 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     31.79 =C2=B1  0%      -9.3%      28.84 =C2=B1  0%  perf-profile.cpu-cy=
cles.do_cow_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
     47.90 =C2=B1  1%     +16.9%      55.99 =C2=B1  2%  time.user_time
    238256 =C2=B1  0%      +8.4%     258184 =C2=B1  0%  time.voluntary_cont=
ext_switches
 2.015e+08 =C2=B1  0%      +8.4%  2.184e+08 =C2=B1  0%  time.minor_page_fau=
lts
       476 =C2=B1  0%      +5.9%        504 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      1441 =C2=B1  0%      +5.5%       1520 =C2=B1  0%  time.system_time
     40.26 =C2=B1  0%      +2.0%      41.04 =C2=B1  0%  turbostat.%c0

lkp-snb01: Sandy Bridge-EP
Memory: 32G




                                time.minor_page_faults

  2.5e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          O O O O O O   O  O O O O O O O O O O O O O O O O  O O O O O O O O=
 O
    2e+08 *+*.*.*.*.*.*.*..*.*.*.*.*.*.*.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*=
 |
          |                                                                =
 |
          |                                                                =
 |
  1.5e+08 ++                                                               =
 |
          |                                                                =
 |
    1e+08 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
    5e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
        0 ++----------O----------------------------------------------------=
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


--===============4304127806897039272==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3
YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpj
b21taXQ6IDBkOGUwMTI3M2NlZjk1MjlmNzdhZjE5OWIxYjdkZTUxYTdhMjk0YzUKbW9kZWw6IFNh
bmR5IEJyaWRnZS1FUAptZW1vcnk6IDMyRwpoZGRfcGFydGl0aW9uczogIi9kZXYvc2RhMiIKc3dh
cF9wYXJ0aXRpb25zOiAKcGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgog
IHRlc3Q6CiAgLSBwYWdlX2ZhdWx0Mgp0ZXN0Ym94OiBsa3Atc25iMDEKdGJveF9ncm91cDogbGtw
LXNuYjAxCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNC0xMi0xMyAxOTox
OToxNi45MzE5NTUxNTEgKzA4OjAwCmhlYWRfY29tbWl0OiAwZDhlMDEyNzNjZWY5NTI5Zjc3YWYx
OTliMWI3ZGU1MWE3YTI5NGM1CmJhc2VfY29tbWl0OiBiMjc3NmJmNzE0OWJkZGQxZjQxNjFmMTRm
Nzk1MjBmMTdmYzFkNzFkCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTQxMjEz
MDcKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC8wZDhlMDEyNzNjZWY5NTI5Zjc3YWYxOTli
MWI3ZGU1MWE3YTI5NGM1L3ZtbGludXotMy4xOC4wLWcwZDhlMDEyIgp1c2VyOiBsa3AKcXVldWU6
IGN5Y2xpYwpyb290ZnM6IGRlYmlhbi14ODZfNjQuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9s
a3Atc25iMDEvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1wYWdlX2ZhdWx0Mi9kZWJpYW4teDg2
XzY0LmNnei94ODZfNjQtcmhlbC8wZDhlMDEyNzNjZWY5NTI5Zjc3YWYxOTliMWI3ZGU1MWE3YTI5
NGM1LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXNuYjAxL2N5Y2xpY193aWxsLWl0
LXNjYWxlLXBlcmZvcm1hbmNlLXBhZ2VfZmF1bHQyLXg4Nl82NC1yaGVsLUhFQUQtMGQ4ZTAxMjcz
Y2VmOTUyOWY3N2FmMTk5YjFiN2RlNTFhN2EyOTRjNS0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAx
NC0xMi0xNCAwMzo0MDoyMy42ODkwNjA5MTggKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9h
ZGF2ZzogMjMuNTMgMTIuMTUgNC44OCAxLzMwMiAxMDA3MgpzdGFydF90aW1lOiAnMTQxODQ5OTY2
NicKZW5kX3RpbWU6ICcxNDE4NDk5OTc4Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTIx
My0xNTA1MjciCg==

--===============4304127806897039272==
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
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKLi9ydW50ZXN0LnB5IHBhZ2VfZmF1bHQyIDI1IDEgOCAxNiAy
NCAzMgo=

--===============4304127806897039272==--

