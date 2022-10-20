Content-Type: multipart/mixed; boundary="===============1889441489513508282=="
MIME-Version: 1.0
From: Yujie Liu <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression
Date: Fri, 21 Oct 2022 00:40:51 +0800
Message-ID: <Y1F6EyGz734q/po5@yujie-X299>
In-Reply-To: <871qr3nkw2.fsf@yhuang6-desk2.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1889441489513508282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 01:07:09PM +0800, Huang, Ying wrote:
> Hi, Nathan,
> =

> Thanks for your information!  That's valuable.
> =

> Nathan Chancellor <nathan@kernel.org> writes:
> =

> > Hi Ying,
> >
> > On Wed, Oct 19, 2022 at 10:05:50AM +0800, Huang, Ying wrote:
> >> Hi, Yujie,
> >> =

> >> >      32528  48%    +147.6%      80547  38%  numa-meminfo.node0.AnonH=
ugePages
> >> >      92821  23%     +59.3%     147839  28%  numa-meminfo.node0.AnonP=
ages
> >> =

> >> The Anon pages allocated are much more than the parent commit.  This is
> >> expected, because THP instead of normal page will be allocated for
> >> aligned memory area.
> >> =

> >> >      95.23           -79.8       15.41   6%  perf-profile.calltrace.=
cycles-pp.__munmap
> >> >      95.08           -79.7       15.40   6%  perf-profile.calltrace.=
cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
> >> >      95.02           -79.6       15.39   6%  perf-profile.calltrace.=
cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
> >> >      94.96           -79.6       15.37   6%  perf-profile.calltrace.=
cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__m=
unmap
> >> >      94.95           -79.6       15.37   6%  perf-profile.calltrace.=
cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.__munmap
> >> >      94.86           -79.5       15.35   6%  perf-profile.calltrace.=
cycles-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
> >> >      94.38           -79.2       15.22   6%  perf-profile.calltrace.=
cycles-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_=
64
> >> >      42.74           -42.7        0.00        perf-profile.calltrace=
.cycles-pp.lru_add_drain.unmap_region.__do_munmap.__vm_munmap.__x64_sys_mun=
map
> >> >      42.74           -42.7        0.00        perf-profile.calltrace=
.cycles-pp.lru_add_drain_cpu.lru_add_drain.unmap_region.__do_munmap.__vm_mu=
nmap
> >> >      42.72           -42.7        0.00        perf-profile.calltrace=
.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.unmap_regio=
n.__do_munmap
> >> >      41.84           -41.8        0.00        perf-profile.calltrace=
.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu=
.lru_add_drain.unmap_region
> >> >      41.70           -41.7        0.00        perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_mov=
e_lru.lru_add_drain_cpu.lru_add_drain
> >> >      41.62           -41.6        0.00        perf-profile.calltrace=
.cycles-pp.folio_lruvec_lock_irqsave.release_pages.tlb_batch_pages_flush.tl=
b_finish_mmu.unmap_region
> >> >      41.55 -41.6 0.00
> >> > perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._r=
aw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add=
_drain_cpu
> >> >      41.52           -41.5        0.00        perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.t=
lb_batch_pages_flush.tlb_finish_mmu
> >> >      41.28 -41.3 0.00
> >> > perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._r=
aw_spin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.tlb_batch_page=
s_flush
> >> =

> >> In the parent commit, most CPU cycles are used for contention on LRU l=
ock.
> >> =

> >> >       0.00            +4.8        4.82   7%  perf-profile.calltrace.=
cycles-pp.do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_u=
ser_addr_fault.exc_page_fault
> >> >       0.00            +4.9        4.88   7%  perf-profile.calltrace.=
cycles-pp.zap_huge_pmd.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_regi=
on
> >> >       0.00            +8.2        8.22   8%  perf-profile.calltrace.=
cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.rmqueue_bulk.rmqu=
eue.get_page_from_freelist
> >> >       0.00            +8.2        8.23   8%  perf-profile.calltrace.=
cycles-pp._raw_spin_lock.rmqueue_bulk.rmqueue.get_page_from_freelist.__allo=
c_pages
> >> >       0.00            +8.3        8.35   8%  perf-profile.calltrace.=
cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bul=
k.free_unref_page.release_pages
> >> >       0.00            +8.3        8.35   8%  perf-profile.calltrace.=
cycles-pp._raw_spin_lock.free_pcppages_bulk.free_unref_page.release_pages.t=
lb_batch_pages_flush
> >> >       0.00            +8.4        8.37   8%  perf-profile.calltrace.=
cycles-pp.free_pcppages_bulk.free_unref_page.release_pages.tlb_batch_pages_=
flush.tlb_finish_mmu
> >> >       0.00            +9.6        9.60   6%  perf-profile.calltrace.=
cycles-pp.free_unref_page.release_pages.tlb_batch_pages_flush.tlb_finish_mm=
u.unmap_region
> >> >       0.00           +65.5       65.48   2%  perf-profile.calltrace.=
cycles-pp.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__ha=
ndle_mm_fault.handle_mm_fault
> >> >       0.00           +72.5       72.51   2%  perf-profile.calltrace.=
cycles-pp.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.ha=
ndle_mm_fault.do_user_addr_fault
> >> =

> >> With the commit, most CPU cycles are consumed for clear huge page.  Th=
is
> >> is expected.  We allocate more pages, so, we need more cycles to clear
> >> them.
> >> =

> >> Check the source code of test case (will-it-scale/malloc1), I found th=
at
> >> it will allocate some memory with malloc() then free it.
> >> =

> >> In the parent commit, because the virtual memory address isn't aligned
> >> with 2M, normal page will be allocated.  With the commit, THP will be
> >> allocated, so more page clearing and less LRU lock contention.  I think
> >> this is the expected behavior of the commit.  And the test case isn't =
so
> >> popular (malloc() then free() but don't access the memory allocated). =
 So
> >> this regression isn't important.  We can just ignore it.
> >
> > For what it's worth, I just bisected a massive and visible performance
> > regression on my Threadripper 3990X workstation to commit f35b5d7d676e
> > ("mm: align larger anonymous mappings on THP boundaries"), which seems
> > directly related to this report/analysis. I initially noticed this
> > because my full set of kernel builds against mainline went from 2 hours
> > and 20 minutes or so to over 3 hours. Zeroing in on x86_64 allmodconfig,
> > which I used for the bisect:
> >
> > @ 7b5a0b664ebe ("mm/page_ext: remove unused variable in offline_page_ex=
t"):
> >
> > Benchmark 1: make -skj128 LLVM=3D1 allmodconfig all
> >   Time (mean =C2=B1 =CF=83):     318.172 s =C2=B1  0.730 s    [User: 31=
750.902 s, System: 4564.246 s]
> >   Range (min =E2=80=A6 max):   317.332 s =E2=80=A6 318.662 s    3 runs
> >
> > @ f35b5d7d676e ("mm: align larger anonymous mappings on THP boundaries"=
):
> >
> > Benchmark 1: make -skj128 LLVM=3D1 allmodconfig all
> =

> Have you tried to build with gcc?  Want to check whether is this clang
> specific issue or not.

We saw a 2.8% gain in kbuild time test with gcc. Please check below
test result for details:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
build_kconfig/compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/targ=
et/tbox_group/testcase/thp_defrag/thp_enabled:
  allyesconfig/gcc-11/performance/x86_64-rhel-8.3/200%/debian-11.1-x86_64-2=
0220510.cgz/600s/autoksyms_recursive/lkp-icl-2sp5/kbuild/always/always

commit:
  7b5a0b664ebe ("mm/page_ext: remove unused variable in offline_page_ext")
  f35b5d7d676e ("mm: align larger anonymous mappings on THP boundaries")

7b5a0b664ebe2625 f35b5d7d676e59e401690b678cd
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
    220.89            -2.8%     214.78        kbuild.buildtime_per_iteration
    662.55            -2.7%     644.52        kbuild.time.elapsed_time
    662.55            -2.7%     644.52        kbuild.time.elapsed_time.max
   7918841            -2.3%    7740039        kbuild.time.involuntary_conte=
xt_switches
     55936            +6.4%      59540        kbuild.time.major_page_faults
   2845254            +0.0%    2846257        kbuild.time.maximum_resident_=
set_size
 1.534e+09           -43.2%  8.709e+08        kbuild.time.minor_page_faults
      4096            +0.0%       4096        kbuild.time.page_size
      7295            -2.1%       7145        kbuild.time.percent_of_cpu_th=
is_job_got
      8017           -29.0%       5690        kbuild.time.system_time
     40321            +0.1%      40364        kbuild.time.user_time
   8024178            +1.0%    8106814        kbuild.time.voluntary_context=
_switches
      3.00            +0.0%       3.00        kbuild.workload
    788.52            -1.6%     776.25 =C2=B1  2%  dmesg.timestamp:last
    429.90            -0.5%     427.75        kmsg.timestamp:last
 3.464e+10            +0.2%  3.472e+10        cpuidle..time
  71725422            -0.0%   71720918        cpuidle..usage
    705.10            -2.5%     687.50        uptime.boot
     39399            +0.3%      39504        uptime.idle
     37.28            +0.3%      37.38        boot-time.boot
     22.72            -0.3%      22.64        boot-time.dhcp
      4254            +0.7%       4286        boot-time.idle
      1.52            -0.0%       1.51        boot-time.smp_boot
     40.87            +1.2       42.12        mpstat.cpu.all.idle%
      1.96 =C2=B1  7%      -0.0        1.95 =C2=B1  8%  mpstat.cpu.all.irq%
      0.19 =C2=B1  7%      +0.0        0.19 =C2=B1  7%  mpstat.cpu.all.soft%
      9.32            -2.5        6.81        mpstat.cpu.all.sys%
     47.65            +1.3       48.93        mpstat.cpu.all.usr%
      0.00          -100.0%       0.00        numa-numastat.node0.interleav=
e_hit
 7.222e+08           -46.6%  3.857e+08        numa-numastat.node0.local_node
 7.223e+08           -46.6%  3.858e+08        numa-numastat.node0.numa_hit
     77202 =C2=B1 39%     -64.3%      27589 =C2=B1 70%  numa-numastat.node0=
.other_node
      0.00          -100.0%       0.00        numa-numastat.node1.interleav=
e_hit
 7.104e+08           -45.5%  3.869e+08        numa-numastat.node1.local_node
 7.105e+08           -45.5%   3.87e+08        numa-numastat.node1.numa_hit
     38778 =C2=B1 78%    +127.9%      88368 =C2=B1 21%  numa-numastat.node1=
.other_node
    662.55            -2.7%     644.52        time.elapsed_time
    662.55            -2.7%     644.52        time.elapsed_time.max
   7918841            -2.3%    7740039        time.involuntary_context_swit=
ches
     55936            +6.4%      59540        time.major_page_faults
   2845254            +0.0%    2846257        time.maximum_resident_set_size
 1.534e+09           -43.2%  8.709e+08        time.minor_page_faults
      4096            +0.0%       4096        time.page_size
      7295            -2.1%       7145        time.percent_of_cpu_this_job_=
got
      8017           -29.0%       5690        time.system_time
     40321            +0.1%      40364        time.user_time
   8024178            +1.0%    8106814        time.voluntary_context_switch=
es
     41.00            +2.4%      42.00        vmstat.cpu.id
     11.00           -27.3%       8.00        vmstat.cpu.sy
     47.00            +2.8%      48.33        vmstat.cpu.us
      0.00          -100.0%       0.00        vmstat.io.bi
      0.00       +6.7e+101%       0.67 =C2=B1 70%  vmstat.io.bo
      5.00 =C2=B1 28%     +20.0%       6.00 =C2=B1 23%  vmstat.memory.buff
   6438472            +0.4%    6466124        vmstat.memory.cache
 1.178e+08            -0.1%  1.177e+08        vmstat.memory.free
      0.00          -100.0%       0.00        vmstat.procs.b
    146.00            -2.7%     142.00        vmstat.procs.r
     31058            +2.0%      31693        vmstat.system.cs
    265989            -0.0%     265868        vmstat.system.in
      1804            -6.4%       1689        turbostat.Avg_MHz
     59.63            -1.2       58.48        turbostat.Busy%
      3033            -4.6%       2895        turbostat.Bzy_MHz
     56301          +178.2%     156603 =C2=B1 89%  turbostat.C1
      0.00            +0.1        0.11 =C2=B1134%  turbostat.C1%
  55119210 =C2=B1 25%     -12.9%   48006244 =C2=B1 34%  turbostat.C1E
     26.32 =C2=B1 51%      -8.8       17.49 =C2=B1 98%  turbostat.C1E%
  16462378 =C2=B1 88%     +42.6%   23471160 =C2=B1 70%  turbostat.C6
     14.35 =C2=B1 94%      +9.9       24.26 =C2=B1 70%  turbostat.C6%
     29.19 =C2=B1 48%     -36.2%      18.62 =C2=B1 87%  turbostat.CPU%c1
     11.17 =C2=B1124%    +105.0%      22.91 =C2=B1 70%  turbostat.CPU%c6
     60.33 =C2=B1  5%      -1.7%      59.33 =C2=B1  5%  turbostat.CoreTmp
      0.25            +6.6%       0.27        turbostat.IPC
 1.772e+08            -2.7%  1.725e+08        turbostat.IRQ
    114.11            -2.7      111.37        turbostat.PKG_%
     34096 =C2=B1  2%      +4.6%      35653 =C2=B1  9%  turbostat.POLL
      3.22 =C2=B1141%     +95.0%       6.29 =C2=B1 70%  turbostat.Pkg%pc2
     60.67 =C2=B1  4%      -1.6%      59.67 =C2=B1  5%  turbostat.PkgTmp
    392.96            -2.3%     383.84 =C2=B1  2%  turbostat.PkgWatt
     78.55            +4.4%      81.98        turbostat.RAMWatt
      2594            +0.0%       2594        turbostat.TSC_MHz
    182786            -4.9%     173793 =C2=B1  2%  meminfo.Active
    182711            -5.0%     173527 =C2=B1  2%  meminfo.Active(anon)
     75.33 =C2=B1 21%    +252.7%     265.67 =C2=B1 58%  meminfo.Active(file)
    414770          +904.5%    4166363        meminfo.AnonHugePages
   5917906            +0.7%    5960021        meminfo.AnonPages
      5.00 =C2=B1 28%     +20.0%       6.00 =C2=B1 23%  meminfo.Buffers
   6178648            +0.4%    6202569        meminfo.Cached
  65836880            +0.0%   65836880        meminfo.CommitLimit
   6914586            -2.7%    6727090        meminfo.Committed_AS
 1.265e+08            -0.6%  1.258e+08        meminfo.DirectMap1G
   9768277 =C2=B1 14%      +6.7%   10420224 =C2=B1 14%  meminfo.DirectMap2M
    746928 =C2=B1 15%      +6.3%     794032 =C2=B1  3%  meminfo.DirectMap4k
      0.00       +2.7e+102%       2.67 =C2=B1 70%  meminfo.Dirty
      2048            +0.0%       2048        meminfo.Hugepagesize
   5983334            +0.7%    6026071        meminfo.Inactive
   5983186            +0.7%    6025838        meminfo.Inactive(anon)
    147.33 =C2=B1 14%     +57.9%     232.67 =C2=B1 27%  meminfo.Inactive(fi=
le)
    279848            +0.3%     280656        meminfo.KReclaimable
     27804            -0.6%      27650        meminfo.KernelStack
    110382 =C2=B1  2%      -1.4%     108862        meminfo.Mapped
 1.173e+08            -0.1%  1.172e+08        meminfo.MemAvailable
 1.178e+08            -0.1%  1.177e+08        meminfo.MemFree
 1.317e+08            +0.0%  1.317e+08        meminfo.MemTotal
  13845459            +0.8%   13951748        meminfo.Memused
      1266            -2.4%       1236        meminfo.Mlocked
     36943            -1.7%      36301        meminfo.PageTables
     69992            -0.2%      69887        meminfo.Percpu
    279848            +0.3%     280656        meminfo.SReclaimable
    305520            +0.4%     306812        meminfo.SUnreclaim
    229589 =C2=B1  2%      -3.3%     222046        meminfo.Shmem
    585369            +0.4%     587468        meminfo.Slab
   5948778            +0.5%    5979958        meminfo.Unevictable
 1.374e+13            +0.0%  1.374e+13        meminfo.VmallocTotal
    194761            -0.1%     194634        meminfo.VmallocUsed
  19416429            +1.7%   19756098        meminfo.max_used_kB
      6516 =C2=B1 18%      -9.9%       5871 =C2=B1 14%  numa-meminfo.node0.=
Active
      6472 =C2=B1 19%     -11.5%       5729 =C2=B1 14%  numa-meminfo.node0.=
Active(anon)
     43.67 =C2=B1 65%    +222.9%     141.00 =C2=B1 94%  numa-meminfo.node0.=
Active(file)
    192829 =C2=B1 14%    +960.5%    2044918 =C2=B1  2%  numa-meminfo.node0.=
AnonHugePages
   2946303            -0.7%    2926031        numa-meminfo.node0.AnonPages
   6975049 =C2=B1  4%      +1.9%    7107616 =C2=B1  2%  numa-meminfo.node0.=
AnonPages.max
      0.00       +1.3e+102%       1.33 =C2=B1141%  numa-meminfo.node0.Dirty
   2479087 =C2=B1 77%     +46.3%    3627935 =C2=B1 42%  numa-meminfo.node0.=
FilePages
   2958399            -0.7%    2937077        numa-meminfo.node0.Inactive
   2958313            -0.7%    2936942        numa-meminfo.node0.Inactive(a=
non)
     86.67 =C2=B1 70%     +55.4%     134.67 =C2=B1 45%  numa-meminfo.node0.=
Inactive(file)
    120799 =C2=B1 44%     +33.7%     161521 =C2=B1 33%  numa-meminfo.node0.=
KReclaimable
     13904 =C2=B1  2%      -2.1%      13607 =C2=B1  2%  numa-meminfo.node0.=
KernelStack
     36268 =C2=B1 64%     +39.4%      50562 =C2=B1 42%  numa-meminfo.node0.=
Mapped
  59414836 =C2=B1  3%      -2.0%   58226661 =C2=B1  2%  numa-meminfo.node0.=
MemFree
  65663956            +0.0%   65663956        numa-meminfo.node0.MemTotal
   6249119 =C2=B1 30%     +19.0%    7437293 =C2=B1 18%  numa-meminfo.node0.=
MemUsed
    545.00 =C2=B1 93%     +51.4%     825.33 =C2=B1 70%  numa-meminfo.node0.=
Mlocked
     18693            -5.8%      17617        numa-meminfo.node0.PageTables
    120799 =C2=B1 44%     +33.7%     161521 =C2=B1 33%  numa-meminfo.node0.=
SReclaimable
    155553 =C2=B1  7%      -0.0%     155524 =C2=B1  5%  numa-meminfo.node0.=
SUnreclaim
      9569 =C2=B1 17%     -21.4%       7517 =C2=B1 11%  numa-meminfo.node0.=
Shmem
    276353 =C2=B1 19%     +14.7%     317046 =C2=B1 15%  numa-meminfo.node0.=
Slab
   2469448 =C2=B1 77%     +46.6%    3620137 =C2=B1 42%  numa-meminfo.node0.=
Unevictable
    176559            -4.7%     168248 =C2=B1  3%  numa-meminfo.node1.Active
    176527            -4.8%     168123 =C2=B1  2%  numa-meminfo.node1.Activ=
e(anon)
     31.33 =C2=B1141%    +297.9%     124.67 =C2=B1109%  numa-meminfo.node1.=
Active(file)
    222472 =C2=B1 11%    +840.3%    2092001        numa-meminfo.node1.AnonH=
ugePages
   2940819            +1.9%    2996244        numa-meminfo.node1.AnonPages
   6775470 =C2=B1  2%     +13.9%    7719184 =C2=B1  4%  numa-meminfo.node1.=
AnonPages.max
      0.00       +1.3e+102%       1.33 =C2=B1141%  numa-meminfo.node1.Dirty
   3703809 =C2=B1 51%     -30.3%    2582256 =C2=B1 59%  numa-meminfo.node1.=
FilePages
   2994213 =C2=B1  2%      +1.9%    3052599        numa-meminfo.node1.Inact=
ive
   2994152 =C2=B1  2%      +1.9%    3052501        numa-meminfo.node1.Inact=
ive(anon)
     60.67 =C2=B1136%     +61.0%      97.67 =C2=B1109%  numa-meminfo.node1.=
Inactive(file)
    159156 =C2=B1 33%     -25.0%     119290 =C2=B1 45%  numa-meminfo.node1.=
KReclaimable
     13840 =C2=B1  2%      +1.2%      14002 =C2=B1  2%  numa-meminfo.node1.=
KernelStack
     74373 =C2=B1 32%     -20.2%      59373 =C2=B1 35%  numa-meminfo.node1.=
Mapped
  58441734 =C2=B1  3%      +1.9%   59526117 =C2=B1  2%  numa-meminfo.node1.=
MemFree
  66009808            +0.0%   66009808        numa-meminfo.node1.MemTotal
   7568072 =C2=B1 25%     -14.3%    6483689 =C2=B1 22%  numa-meminfo.node1.=
MemUsed
    722.67 =C2=B1 70%     -43.0%     412.00 =C2=B1141%  numa-meminfo.node1.=
Mlocked
     18101 =C2=B1  2%      +2.1%      18485        numa-meminfo.node1.PageT=
ables
    159156 =C2=B1 33%     -25.0%     119290 =C2=B1 45%  numa-meminfo.node1.=
SReclaimable
    149871 =C2=B1  7%      +1.0%     151303 =C2=B1  4%  numa-meminfo.node1.=
SUnreclaim
    220726            -2.4%     215489 =C2=B1  2%  numa-meminfo.node1.Shmem
    309028 =C2=B1 17%     -12.4%     270594 =C2=B1 18%  numa-meminfo.node1.=
Slab
   3482874 =C2=B1 54%     -32.1%    2366476 =C2=B1 64%  numa-meminfo.node1.=
Unevictable
    339.67 =C2=B1 16%      +7.0%     363.33 =C2=B1  3%  proc-vmstat.direct_=
map_level2_splits
      2.33 =C2=B1 53%     +28.6%       3.00 =C2=B1 47%  proc-vmstat.direct_=
map_level3_splits
     45656            -4.9%      43403 =C2=B1  2%  proc-vmstat.nr_active_an=
on
     18.67 =C2=B1 20%    +255.4%      66.33 =C2=B1 58%  proc-vmstat.nr_acti=
ve_file
   1476514            +0.6%    1485684        proc-vmstat.nr_anon_pages
    202.00          +903.5%       2027        proc-vmstat.nr_anon_transpare=
nt_hugepages
      5.33 =C2=B1141%   +2125.0%     118.67 =C2=B1 70%  proc-vmstat.nr_dirt=
ied
      0.00       +6.7e+101%       0.67 =C2=B1 70%  proc-vmstat.nr_dirty
   2926273            -0.1%    2923659        proc-vmstat.nr_dirty_backgrou=
nd_threshold
   5859703            -0.1%    5854468        proc-vmstat.nr_dirty_threshold
   1544951            +0.4%    1551178        proc-vmstat.nr_file_pages
  29460263            -0.1%   29434012        proc-vmstat.nr_free_pages
   1492541            +0.7%    1502535        proc-vmstat.nr_inactive_anon
     36.67 =C2=B1 14%     +58.2%      58.00 =C2=B1 27%  proc-vmstat.nr_inac=
tive_file
      0.00       +3.3e+101%       0.33 =C2=B1141%  proc-vmstat.nr_isolated_=
anon
     27788            -0.5%      27654        proc-vmstat.nr_kernel_stack
     27584            -0.5%      27458        proc-vmstat.nr_mapped
    316.33            -2.5%     308.33        proc-vmstat.nr_mlock
      9217            -1.6%       9067        proc-vmstat.nr_page_table_pag=
es
     57434 =C2=B1  2%      -3.2%      55599        proc-vmstat.nr_shmem
     69964            +0.3%      70176        proc-vmstat.nr_slab_reclaimab=
le
     76352            +0.5%      76758        proc-vmstat.nr_slab_unreclaim=
able
   1487442            +0.5%    1495431        proc-vmstat.nr_unevictable
      0.00          -100.0%       0.00        proc-vmstat.nr_writeback
      6.67 =C2=B1141%   +1680.0%     118.67 =C2=B1 70%  proc-vmstat.nr_writ=
ten
     45656            -4.9%      43403 =C2=B1  2%  proc-vmstat.nr_zone_acti=
ve_anon
     18.67 =C2=B1 20%    +255.4%      66.33 =C2=B1 58%  proc-vmstat.nr_zone=
_active_file
   1492541            +0.7%    1502535        proc-vmstat.nr_zone_inactive_=
anon
     36.67 =C2=B1 14%     +58.2%      58.00 =C2=B1 27%  proc-vmstat.nr_zone=
_inactive_file
   1487442            +0.5%    1495431        proc-vmstat.nr_zone_unevictab=
le
      0.00       +6.7e+101%       0.67 =C2=B1 70%  proc-vmstat.nr_zone_writ=
e_pending
    664037 =C2=B1 15%     +46.5%     972834 =C2=B1 33%  proc-vmstat.numa_hi=
nt_faults
    524692 =C2=B1 15%     +39.8%     733659 =C2=B1 37%  proc-vmstat.numa_hi=
nt_faults_local
 1.433e+09           -46.1%  7.728e+08        proc-vmstat.numa_hit
      9265 =C2=B1  4%    +912.7%      93825        proc-vmstat.numa_huge_pt=
e_updates
      0.00          -100.0%       0.00        proc-vmstat.numa_interleave
 1.433e+09           -46.1%  7.726e+08        proc-vmstat.numa_local
    115980            -0.0%     115957        proc-vmstat.numa_other
    222139 =C2=B1 49%    +207.6%     683356 =C2=B1  6%  proc-vmstat.numa_pa=
ges_migrated
   6070902 =C2=B1  6%    +711.1%   49242299        proc-vmstat.numa_pte_upd=
ates
   1657653            -0.8%    1645015        proc-vmstat.pgactivate
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
 1.432e+09           -46.1%  7.726e+08        proc-vmstat.pgalloc_normal
 1.537e+09           -43.1%  8.745e+08        proc-vmstat.pgfault
  1.43e+09           -46.1%  7.709e+08        proc-vmstat.pgfree
    222139 =C2=B1 49%    +207.6%     683356 =C2=B1  6%  proc-vmstat.pgmigra=
te_success
      0.00       +2.1e+104%     208.00 =C2=B1 70%  proc-vmstat.pgpgin
     29.33 =C2=B1141%   +1554.5%     485.33 =C2=B1 70%  proc-vmstat.pgpgout
   4728028            -0.0%    4726238        proc-vmstat.pgreuse
    240.67 =C2=B1  6%      -6.9%     224.00 =C2=B1  5%  proc-vmstat.thp_col=
lapse_alloc
    168.67           -92.9%      12.00        proc-vmstat.thp_deferred_spli=
t_page
     40677         +3313.6%    1388568        proc-vmstat.thp_fault_alloc
    164.33 =C2=B1 77%    +436.5%     881.67 =C2=B1 13%  proc-vmstat.thp_mig=
ration_success
      1370           -11.6%       1211        proc-vmstat.thp_split_pmd
      0.67 =C2=B1 70%     -50.0%       0.33 =C2=B1141%  proc-vmstat.thp_zer=
o_page_alloc
   5512262            -0.0%    5512262        proc-vmstat.unevictable_pgs_c=
ulled
    608.00            -0.2%     607.00        proc-vmstat.unevictable_pgs_m=
locked
      4.00 =C2=B1 20%     -25.0%       3.00        proc-vmstat.unevictable_=
pgs_munlocked
      4.00 =C2=B1 20%     -25.0%       3.00        proc-vmstat.unevictable_=
pgs_rescued
      1628 =C2=B1 18%     -11.6%       1439 =C2=B1 13%  numa-vmstat.node0.n=
r_active_anon
     10.67 =C2=B1 70%    +228.1%      35.00 =C2=B1 94%  numa-vmstat.node0.n=
r_active_file
    734608            -0.3%     732747        numa-vmstat.node0.nr_anon_pag=
es
     93.67 =C2=B1 13%    +966.5%     999.00 =C2=B1  2%  numa-vmstat.node0.n=
r_anon_transparent_hugepages
      0.00       +5.9e+103%      58.67 =C2=B1113%  numa-vmstat.node0.nr_dir=
tied
      0.00       +3.3e+101%       0.33 =C2=B1141%  numa-vmstat.node0.nr_dir=
ty
    619437 =C2=B1 76%     +46.4%     906779 =C2=B1 42%  numa-vmstat.node0.n=
r_file_pages
  14855848 =C2=B1  3%      -2.0%   14555595 =C2=B1  2%  numa-vmstat.node0.n=
r_free_pages
    737673            -0.3%     735382        numa-vmstat.node0.nr_inactive=
_anon
     21.67 =C2=B1 70%     +53.8%      33.33 =C2=B1 46%  numa-vmstat.node0.n=
r_inactive_file
      0.00       +3.3e+101%       0.33 =C2=B1141%  numa-vmstat.node0.nr_iso=
lated_anon
     13888 =C2=B1  2%      -2.2%      13587 =C2=B1  2%  numa-vmstat.node0.n=
r_kernel_stack
      9041 =C2=B1 64%     +40.2%      12677 =C2=B1 42%  numa-vmstat.node0.n=
r_mapped
    135.67 =C2=B1 93%     +52.3%     206.67 =C2=B1 70%  numa-vmstat.node0.n=
r_mlock
      4658            -5.7%       4392        numa-vmstat.node0.nr_page_tab=
le_pages
      2395 =C2=B1 17%     -21.3%       1886 =C2=B1 10%  numa-vmstat.node0.n=
r_shmem
     30203 =C2=B1 44%     +33.7%      40383 =C2=B1 33%  numa-vmstat.node0.n=
r_slab_reclaimable
     38902 =C2=B1  7%      +0.0%      38911 =C2=B1  5%  numa-vmstat.node0.n=
r_slab_unreclaimable
    617024 =C2=B1 77%     +46.6%     904823 =C2=B1 42%  numa-vmstat.node0.n=
r_unevictable
      0.00       +5.9e+103%      58.67 =C2=B1113%  numa-vmstat.node0.nr_wri=
tten
      1629 =C2=B1 18%     -11.7%       1439 =C2=B1 13%  numa-vmstat.node0.n=
r_zone_active_anon
     10.67 =C2=B1 70%    +228.1%      35.00 =C2=B1 94%  numa-vmstat.node0.n=
r_zone_active_file
    737675            -0.3%     735362        numa-vmstat.node0.nr_zone_ina=
ctive_anon
     21.67 =C2=B1 70%     +53.8%      33.33 =C2=B1 46%  numa-vmstat.node0.n=
r_zone_inactive_file
    617023 =C2=B1 77%     +46.6%     904823 =C2=B1 42%  numa-vmstat.node0.n=
r_zone_unevictable
      0.00       +3.3e+101%       0.33 =C2=B1141%  numa-vmstat.node0.nr_zon=
e_write_pending
 7.223e+08           -46.6%  3.858e+08        numa-vmstat.node0.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node0.numa_interl=
eave
 7.222e+08           -46.6%  3.857e+08        numa-vmstat.node0.numa_local
     77202 =C2=B1 39%     -64.3%      27589 =C2=B1 70%  numa-vmstat.node0.n=
uma_other
     44125            -4.8%      42015 =C2=B1  3%  numa-vmstat.node1.nr_act=
ive_anon
      7.67 =C2=B1141%    +300.0%      30.67 =C2=B1110%  numa-vmstat.node1.n=
r_active_file
    733960            +2.1%     749048        numa-vmstat.node1.nr_anon_pag=
es
    108.00 =C2=B1 12%    +844.1%       1019        numa-vmstat.node1.nr_ano=
n_transparent_hugepages
      5.33 =C2=B1141%   +1025.0%      60.00 =C2=B1114%  numa-vmstat.node1.n=
r_dirtied
      0.00       +3.3e+101%       0.33 =C2=B1141%  numa-vmstat.node1.nr_dir=
ty
    926708 =C2=B1 51%     -30.3%     645773 =C2=B1 59%  numa-vmstat.node1.n=
r_file_pages
  14610869 =C2=B1  3%      +1.9%   14881195 =C2=B1  2%  numa-vmstat.node1.n=
r_free_pages
    747090            +2.2%     763248        numa-vmstat.node1.nr_inactive=
_anon
     15.00 =C2=B1136%     +62.2%      24.33 =C2=B1110%  numa-vmstat.node1.n=
r_inactive_file
      0.00          -100.0%       0.00        numa-vmstat.node1.nr_isolated=
_anon
     13862 =C2=B1  2%      +1.0%      14005        numa-vmstat.node1.nr_ker=
nel_stack
     18536 =C2=B1 32%     -20.1%      14813 =C2=B1 36%  numa-vmstat.node1.n=
r_mapped
    180.67 =C2=B1 70%     -43.0%     103.00 =C2=B1141%  numa-vmstat.node1.n=
r_mlock
      4525 =C2=B1  2%      +2.0%       4617        numa-vmstat.node1.nr_pag=
e_table_pages
     55065            -2.0%      53957 =C2=B1  2%  numa-vmstat.node1.nr_shm=
em
     39795 =C2=B1 33%     -25.1%      29825 =C2=B1 45%  numa-vmstat.node1.n=
r_slab_reclaimable
     37487 =C2=B1  7%      +1.0%      37863 =C2=B1  4%  numa-vmstat.node1.n=
r_slab_unreclaimable
    871589 =C2=B1 54%     -32.1%     591742 =C2=B1 64%  numa-vmstat.node1.n=
r_unevictable
      6.67 =C2=B1141%    +800.0%      60.00 =C2=B1114%  numa-vmstat.node1.n=
r_written
     44125            -4.8%      42014 =C2=B1  3%  numa-vmstat.node1.nr_zon=
e_active_anon
      7.67 =C2=B1141%    +300.0%      30.67 =C2=B1110%  numa-vmstat.node1.n=
r_zone_active_file
    747087            +2.2%     763250        numa-vmstat.node1.nr_zone_ina=
ctive_anon
     15.00 =C2=B1136%     +62.2%      24.33 =C2=B1110%  numa-vmstat.node1.n=
r_zone_inactive_file
    871589 =C2=B1 54%     -32.1%     591742 =C2=B1 64%  numa-vmstat.node1.n=
r_zone_unevictable
      0.00       +3.3e+101%       0.33 =C2=B1141%  numa-vmstat.node1.nr_zon=
e_write_pending
 7.105e+08           -45.5%   3.87e+08        numa-vmstat.node1.numa_hit
      0.00          -100.0%       0.00        numa-vmstat.node1.numa_interl=
eave
 7.104e+08           -45.5%  3.869e+08        numa-vmstat.node1.numa_local
     38778 =C2=B1 78%    +127.9%      88368 =C2=B1 21%  numa-vmstat.node1.n=
uma_other
     11.03 =C2=B1 26%     +19.4%      13.17 =C2=B1 23%  perf-stat.i.MPKI
 3.859e+10            +0.8%  3.889e+10        perf-stat.i.branch-instructio=
ns
      2.44 =C2=B1 13%      +0.2        2.68 =C2=B1 13%  perf-stat.i.branch-=
miss-rate%
 9.766e+08            +2.9%  1.005e+09        perf-stat.i.branch-misses
     22.01 =C2=B1 11%      -1.1       20.93 =C2=B1 13%  perf-stat.i.cache-m=
iss-rate%
 4.328e+08            +6.7%  4.617e+08        perf-stat.i.cache-misses
 1.639e+09            +4.4%   1.71e+09        perf-stat.i.cache-references
     30948            +2.4%      31684        perf-stat.i.context-switches
      1.28 =C2=B1  6%      +0.3%       1.29 =C2=B1  6%  perf-stat.i.cpi
    128012            -0.0%     128008        perf-stat.i.cpu-clock
  2.26e+11            -6.3%  2.119e+11        perf-stat.i.cpu-cycles
      2554            +3.3%       2638        perf-stat.i.cpu-migrations
      1097 =C2=B1 12%      +4.8%       1150 =C2=B1  9%  perf-stat.i.cycles-=
between-cache-misses
      0.18 =C2=B1 23%      -0.0        0.15 =C2=B1 31%  perf-stat.i.dTLB-lo=
ad-miss-rate%
  60757842           -57.8%   25667706 =C2=B1  3%  perf-stat.i.dTLB-load-mi=
sses
 4.847e+10            +0.7%  4.879e+10        perf-stat.i.dTLB-loads
      0.13 =C2=B1 10%      -0.0        0.09 =C2=B1 16%  perf-stat.i.dTLB-st=
ore-miss-rate%
  28490589           -48.3%   14736435        perf-stat.i.dTLB-store-misses
 2.176e+10            +0.1%  2.179e+10        perf-stat.i.dTLB-stores
 1.756e+11            +0.6%  1.766e+11        perf-stat.i.instructions
      0.83 =C2=B1  6%      -0.1%       0.83 =C2=B1  6%  perf-stat.i.ipc
     83.76            +9.6%      91.77        perf-stat.i.major-faults
      1.77            -6.3%       1.66        perf-stat.i.metric.GHz
    497.86 =C2=B1 12%     -32.9%     334.04 =C2=B1 16%  perf-stat.i.metric.=
K/sec
    864.66            +0.7%     870.45        perf-stat.i.metric.M/sec
   2284606           -41.7%    1331208        perf-stat.i.minor-faults
     15.63 =C2=B1  2%      +0.7       16.37        perf-stat.i.node-load-mi=
ss-rate%
   8958056            +0.8%    9026272        perf-stat.i.node-load-misses
 1.457e+08            -0.5%   1.45e+08        perf-stat.i.node-loads
      4.67 =C2=B1 17%      +0.1        4.74 =C2=B1 16%  perf-stat.i.node-st=
ore-miss-rate%
   1889607            -1.9%    1852810        perf-stat.i.node-store-misses
 1.043e+08            +9.3%   1.14e+08        perf-stat.i.node-stores
   2284690           -41.7%    1331300        perf-stat.i.page-faults
    128012            -0.0%     128008        perf-stat.i.task-clock
      9.34            +3.7%       9.68        perf-stat.overall.MPKI
      2.53            +0.1        2.58        perf-stat.overall.branch-miss=
-rate%
     26.42            +0.6       27.02        perf-stat.overall.cache-miss-=
rate%
      1.29            -6.8%       1.20        perf-stat.overall.cpi
    522.01           -12.1%     458.69        perf-stat.overall.cycles-betw=
een-cache-misses
      0.13            -0.1        0.05 =C2=B1  3%  perf-stat.overall.dTLB-l=
oad-miss-rate%
      0.13            -0.1        0.07        perf-stat.overall.dTLB-store-=
miss-rate%
      0.78            +7.3%       0.83        perf-stat.overall.ipc
      5.78            +0.1        5.89        perf-stat.overall.node-load-m=
iss-rate%
      1.78            -0.2        1.60        perf-stat.overall.node-store-=
miss-rate%
 3.918e+13            -2.2%  3.832e+13        perf-stat.overall.path-length
 3.892e+10            +0.6%  3.915e+10        perf-stat.ps.branch-instructi=
ons
  9.85e+08            +2.7%  1.012e+09        perf-stat.ps.branch-misses
 4.367e+08            +6.5%  4.649e+08        perf-stat.ps.cache-misses
 1.653e+09            +4.1%  1.721e+09        perf-stat.ps.cache-references
     31105            +2.1%      31746        perf-stat.ps.context-switches
    127807            -0.0%     127801        perf-stat.ps.cpu-clock
  2.28e+11            -6.5%  2.133e+11        perf-stat.ps.cpu-cycles
      2573            +3.2%       2654        perf-stat.ps.cpu-migrations
  61292622           -57.9%   25818880 =C2=B1  3%  perf-stat.ps.dTLB-load-m=
isses
 4.888e+10            +0.5%  4.911e+10        perf-stat.ps.dTLB-loads
  28723007           -48.4%   14823680        perf-stat.ps.dTLB-store-misses
 2.195e+10            -0.1%  2.193e+10        perf-stat.ps.dTLB-stores
 1.771e+11            +0.4%  1.777e+11        perf-stat.ps.instructions
     84.44            +9.3%      92.27        perf-stat.ps.major-faults
   2302575           -41.9%    1338900        perf-stat.ps.minor-faults
   9029295            +1.2%    9141253        perf-stat.ps.node-load-misses
 1.471e+08            -0.7%   1.46e+08        perf-stat.ps.node-loads
   1901728            -1.6%    1870808        perf-stat.ps.node-store-misses
 1.052e+08            +9.1%  1.148e+08        perf-stat.ps.node-stores
   2302659           -41.9%    1338992        perf-stat.ps.page-faults
    127807            -0.0%     127801        perf-stat.ps.task-clock
 1.175e+14            -2.2%  1.149e+14        perf-stat.total.instructions
     58777 =C2=B1 24%     -22.5%      45566 =C2=B1 53%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
   7072999 =C2=B1 32%     -17.5%    5832509 =C2=B1 53%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vrun=
time.min
    638221 =C2=B1 29%     -19.5%     513508 =C2=B1 53%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
      1.08 =C2=B1  3%     +19.3%       1.29 =C2=B1  4%  sched_debug.cfs_rq:=
/.h_nr_running.avg
      2.35 =C2=B1  5%     +26.5%       2.97 =C2=B1  4%  sched_debug.cfs_rq:=
/.h_nr_running.max
      0.52 =C2=B1  4%     +10.0%       0.57 =C2=B1  8%  sched_debug.cfs_rq:=
/.h_nr_running.min
      0.46           +15.7%       0.53        sched_debug.cfs_rq:/.h_nr_run=
ning.stddev
     18158 =C2=B1  5%     -21.7%      14209 =C2=B1 11%  sched_debug.cfs_rq:=
/.load.avg
    542665 =C2=B1 13%     -35.5%     349767 =C2=B1 56%  sched_debug.cfs_rq:=
/.load.max
      1730 =C2=B1  5%     +15.4%       1996 =C2=B1 10%  sched_debug.cfs_rq:=
/.load.min
     71133 =C2=B1  7%     -36.5%      45198 =C2=B1 38%  sched_debug.cfs_rq:=
/.load.stddev
     27.26 =C2=B1 17%      -7.2%      25.30 =C2=B1 15%  sched_debug.cfs_rq:=
/.load_avg.avg
    668.31 =C2=B1  9%      +0.6%     672.13 =C2=B1 15%  sched_debug.cfs_rq:=
/.load_avg.max
      1.72 =C2=B1  5%     +26.2%       2.17 =C2=B1  9%  sched_debug.cfs_rq:=
/.load_avg.min
    101.88 =C2=B1 13%      -5.6%      96.17 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.stddev
     58777 =C2=B1 24%     -22.5%      45566 =C2=B1 53%  sched_debug.cfs_rq:=
/.max_vruntime.avg
   7072999 =C2=B1 32%     -17.5%    5832510 =C2=B1 53%  sched_debug.cfs_rq:=
/.max_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vrun=
time.min
    638221 =C2=B1 29%     -19.5%     513508 =C2=B1 53%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
  30192748 =C2=B1  3%     -15.4%   25535393        sched_debug.cfs_rq:/.min=
_vruntime.avg
  32157892 =C2=B1  4%     -15.9%   27049639        sched_debug.cfs_rq:/.min=
_vruntime.max
  28428586 =C2=B1  3%     -15.4%   24036465        sched_debug.cfs_rq:/.min=
_vruntime.min
    459798 =C2=B1 12%     -16.4%     384573 =C2=B1  5%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.55 =C2=B1  3%     +28.8%       0.71 =C2=B1  2%  sched_debug.cfs_rq:=
/.nr_running.avg
      1.35 =C2=B1  6%      -8.4%       1.23 =C2=B1 10%  sched_debug.cfs_rq:=
/.nr_running.max
      0.52 =C2=B1  4%     +10.0%       0.57 =C2=B1  8%  sched_debug.cfs_rq:=
/.nr_running.min
      0.15           -15.6%       0.13 =C2=B1 19%  sched_debug.cfs_rq:/.nr_=
running.stddev
     11.65 =C2=B1 35%     -14.4%       9.97 =C2=B1 34%  sched_debug.cfs_rq:=
/.removed.load_avg.avg
    490.45 =C2=B1 18%     +14.7%     562.37 =C2=B1 19%  sched_debug.cfs_rq:=
/.removed.load_avg.max
     68.74 =C2=B1 21%      +2.1%      70.18 =C2=B1 26%  sched_debug.cfs_rq:=
/.removed.load_avg.stddev
      4.93 =C2=B1 31%     -22.7%       3.81 =C2=B1 21%  sched_debug.cfs_rq:=
/.removed.runnable_avg.avg
    218.51 =C2=B1 26%      +8.2%     236.53 =C2=B1 21%  sched_debug.cfs_rq:=
/.removed.runnable_avg.max
     29.13 =C2=B1 17%      -6.1%      27.35 =C2=B1 19%  sched_debug.cfs_rq:=
/.removed.runnable_avg.stddev
      3.97 =C2=B1 36%     -24.4%       3.00 =C2=B1 23%  sched_debug.cfs_rq:=
/.removed.util_avg.avg
    150.56 =C2=B1 29%     +17.2%     176.50 =C2=B1 18%  sched_debug.cfs_rq:=
/.removed.util_avg.max
     21.53 =C2=B1 17%      -2.9%      20.91 =C2=B1 16%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
    929.10 =C2=B1  4%     +19.9%       1114 =C2=B1  4%  sched_debug.cfs_rq:=
/.runnable_avg.avg
      2098 =C2=B1  2%     +12.5%       2360 =C2=B1  9%  sched_debug.cfs_rq:=
/.runnable_avg.max
    416.51 =C2=B1 11%      +5.3%     438.47 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_avg.min
    348.16           +12.8%     392.78 =C2=B1  5%  sched_debug.cfs_rq:/.run=
nable_avg.stddev
      0.01 =C2=B1 72%     -44.8%       0.00 =C2=B1141%  sched_debug.cfs_rq:=
/.spread.avg
      0.78 =C2=B1 72%     -44.8%       0.43 =C2=B1141%  sched_debug.cfs_rq:=
/.spread.max
      0.07 =C2=B1 72%     -44.8%       0.04 =C2=B1141%  sched_debug.cfs_rq:=
/.spread.stddev
  -1923853           -22.5%   -1490838        sched_debug.cfs_rq:/.spread0.=
avg
     44889 =C2=B1370%     -42.6%      25746 =C2=B1164%  sched_debug.cfs_rq:=
/.spread0.max
  -3688946           -18.9%   -2991064        sched_debug.cfs_rq:/.spread0.=
min
    459603 =C2=B1 12%     -16.4%     384061 =C2=B1  5%  sched_debug.cfs_rq:=
/.spread0.stddev
    537.53 =C2=B1  3%     +29.1%     694.09 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.avg
      1258 =C2=B1  5%     +13.6%       1429 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.max
    210.10 =C2=B1 16%      +3.8%     218.10 =C2=B1  2%  sched_debug.cfs_rq:=
/.util_avg.min
    160.50 =C2=B1  3%     +17.7%     188.96        sched_debug.cfs_rq:/.uti=
l_avg.stddev
     17.02 =C2=B1 26%    +226.0%      55.50 =C2=B1 46%  sched_debug.cfs_rq:=
/.util_est_enqueued.avg
    555.21 =C2=B1  6%     +31.4%     729.80 =C2=B1 18%  sched_debug.cfs_rq:=
/.util_est_enqueued.max
     72.57 =C2=B1  6%     +64.0%     119.00 =C2=B1 13%  sched_debug.cfs_rq:=
/.util_est_enqueued.stddev
    750029            -7.7%     692057 =C2=B1  2%  sched_debug.cpu.avg_idle=
.avg
   1085988 =C2=B1  5%      +0.3%    1088834 =C2=B1  4%  sched_debug.cpu.avg=
_idle.max
    104257 =C2=B1 29%     +28.7%     134136 =C2=B1 25%  sched_debug.cpu.avg=
_idle.min
    190580 =C2=B1  5%     +11.7%     212828        sched_debug.cpu.avg_idle=
.stddev
    361058 =C2=B1  4%     -14.0%     310652        sched_debug.cpu.clock.avg
    361088 =C2=B1  4%     -14.0%     310679        sched_debug.cpu.clock.max
    361026 =C2=B1  4%     -14.0%     310622        sched_debug.cpu.clock.min
     18.10 =C2=B1 11%      -6.3%      16.96 =C2=B1  8%  sched_debug.cpu.clo=
ck.stddev
    353859 =C2=B1  3%     -13.9%     304664        sched_debug.cpu.clock_ta=
sk.avg
    354440 =C2=B1  3%     -13.9%     305329        sched_debug.cpu.clock_ta=
sk.max
    347598 =C2=B1  4%     -14.3%     297852        sched_debug.cpu.clock_ta=
sk.min
    670.49 =C2=B1  4%     +16.2%     779.29 =C2=B1 13%  sched_debug.cpu.clo=
ck_task.stddev
    440487 =C2=B1  4%     +41.1%     621446 =C2=B1  3%  sched_debug.cpu.cur=
r->pid.avg
    922331 =C2=B1  3%     -11.8%     813459        sched_debug.cpu.curr->pi=
d.max
    326811 =C2=B1 30%     +33.5%     436169 =C2=B1 24%  sched_debug.cpu.cur=
r->pid.min
     76483 =C2=B1 19%     -20.7%      60619 =C2=B1 52%  sched_debug.cpu.cur=
r->pid.stddev
    501232            +0.1%     501595        sched_debug.cpu.max_idle_bala=
nce_cost.avg
    542187 =C2=B1  4%      +0.5%     544947 =C2=B1  5%  sched_debug.cpu.max=
_idle_balance_cost.max
    500000            +0.0%     500000        sched_debug.cpu.max_idle_bala=
nce_cost.min
      5329 =C2=B1 42%     +18.5%       6316 =C2=B1 41%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      4295            -0.0%       4294        sched_debug.cpu.next_balance.=
avg
      4295            -0.0%       4294        sched_debug.cpu.next_balance.=
max
      4295            -0.0%       4294        sched_debug.cpu.next_balance.=
min
      0.00 =C2=B1  8%     +45.5%       0.00 =C2=B1 29%  sched_debug.cpu.nex=
t_balance.stddev
      1.06 =C2=B1  3%     +20.3%       1.28 =C2=B1  4%  sched_debug.cpu.nr_=
running.avg
      2.38 =C2=B1  6%     +24.8%       2.97 =C2=B1  4%  sched_debug.cpu.nr_=
running.max
      0.52 =C2=B1  4%     +10.0%       0.57 =C2=B1  8%  sched_debug.cpu.nr_=
running.min
      0.42           +18.8%       0.50 =C2=B1  2%  sched_debug.cpu.nr_runni=
ng.stddev
     87519 =C2=B1  3%     -12.1%      76971        sched_debug.cpu.nr_switc=
hes.avg
    110370 =C2=B1  5%      -9.3%     100152 =C2=B1  4%  sched_debug.cpu.nr_=
switches.max
     77628 =C2=B1  4%     -12.3%      68061        sched_debug.cpu.nr_switc=
hes.min
      5244            +1.0%       5296 =C2=B1  8%  sched_debug.cpu.nr_switc=
hes.stddev
 2.076e+09 =C2=B1  2%      +1.2%  2.102e+09        sched_debug.cpu.nr_unint=
erruptible.avg
 4.295e+09            +0.0%  4.295e+09        sched_debug.cpu.nr_uninterrup=
tible.max
      0.88 =C2=B1 44%     -47.0%       0.47 =C2=B1 66%  sched_debug.cpu.nr_=
uninterruptible.min
 2.144e+09            +0.0%  2.144e+09        sched_debug.cpu.nr_uninterrup=
tible.stddev
    361026 =C2=B1  4%     -14.0%     310622        sched_debug.cpu_clk
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
avg
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
max
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
min
 4.295e+09            -0.0%  4.295e+09        sched_debug.jiffies
    360299 =C2=B1  4%     -14.0%     309897        sched_debug.ktime
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.avg
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.max
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.min
    361614 =C2=B1  4%     -13.9%     311213        sched_debug.sched_clk
      1.00            +0.0%       1.00        sched_debug.sched_clock_stabl=
e()
  58611259            +0.0%   58611259        sched_debug.sysctl_sched.sysc=
tl_sched_features
      0.75            +0.0%       0.75        sched_debug.sysctl_sched.sysc=
tl_sched_idle_min_granularity
     24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysc=
tl_sched_latency
      3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysc=
tl_sched_min_granularity
      1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysc=
tl_sched_tunable_scaling
      4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysc=
tl_sched_wakeup_granularity
    494099            -0.0%     494074        slabinfo.Acpi-Operand.active_=
objs
      8828            -0.0%       8826        slabinfo.Acpi-Operand.active_=
slabs
    494405            -0.0%     494293        slabinfo.Acpi-Operand.num_objs
      8828            -0.0%       8826        slabinfo.Acpi-Operand.num_sla=
bs
      5579 =C2=B1  3%      -2.9%       5416        slabinfo.Acpi-Parse.acti=
ve_objs
     76.00 =C2=B1  4%      -3.1%      73.67        slabinfo.Acpi-Parse.acti=
ve_slabs
      5579 =C2=B1  3%      -2.9%       5416        slabinfo.Acpi-Parse.num_=
objs
     76.00 =C2=B1  4%      -3.1%      73.67        slabinfo.Acpi-Parse.num_=
slabs
      1376 =C2=B1 13%      +5.2%       1448 =C2=B1  4%  slabinfo.Acpi-State=
.active_objs
     26.67 =C2=B1 14%      +5.0%      28.00 =C2=B1  5%  slabinfo.Acpi-State=
.active_slabs
      1376 =C2=B1 13%      +5.2%       1448 =C2=B1  4%  slabinfo.Acpi-State=
.num_objs
     26.67 =C2=B1 14%      +5.0%      28.00 =C2=B1  5%  slabinfo.Acpi-State=
.num_slabs
     36.00            +0.0%      36.00        slabinfo.DCCP.active_objs
      2.00            +0.0%       2.00        slabinfo.DCCP.active_slabs
     36.00            +0.0%      36.00        slabinfo.DCCP.num_objs
      2.00            +0.0%       2.00        slabinfo.DCCP.num_slabs
     34.00            +0.0%      34.00        slabinfo.DCCPv6.active_objs
      2.00            +0.0%       2.00        slabinfo.DCCPv6.active_slabs
     34.00            +0.0%      34.00        slabinfo.DCCPv6.num_objs
      2.00            +0.0%       2.00        slabinfo.DCCPv6.num_slabs
    256.00            +0.0%     256.00        slabinfo.RAW.active_objs
      8.00            +0.0%       8.00        slabinfo.RAW.active_slabs
    256.00            +0.0%     256.00        slabinfo.RAW.num_objs
      8.00            +0.0%       8.00        slabinfo.RAW.num_slabs
    190.67 =C2=B1  6%      +4.5%     199.33 =C2=B1  6%  slabinfo.RAWv6.acti=
ve_objs
      7.33 =C2=B1  6%      +4.5%       7.67 =C2=B1  6%  slabinfo.RAWv6.acti=
ve_slabs
    190.67 =C2=B1  6%      +4.5%     199.33 =C2=B1  6%  slabinfo.RAWv6.num_=
objs
      7.33 =C2=B1  6%      +4.5%       7.67 =C2=B1  6%  slabinfo.RAWv6.num_=
slabs
     56.00            +0.0%      56.00        slabinfo.TCP.active_objs
      4.00            +0.0%       4.00        slabinfo.TCP.active_slabs
     56.00            +0.0%      56.00        slabinfo.TCP.num_objs
      4.00            +0.0%       4.00        slabinfo.TCP.num_slabs
     39.00            +0.0%      39.00        slabinfo.TCPv6.active_objs
      3.00            +0.0%       3.00        slabinfo.TCPv6.active_slabs
     39.00            +0.0%      39.00        slabinfo.TCPv6.num_objs
      3.00            +0.0%       3.00        slabinfo.TCPv6.num_slabs
    300.00            -3.3%     290.00 =C2=B1 12%  slabinfo.UDP.active_objs
     10.00            -3.3%       9.67 =C2=B1 12%  slabinfo.UDP.active_slabs
    300.00            -3.3%     290.00 =C2=B1 12%  slabinfo.UDP.num_objs
     10.00            -3.3%       9.67 =C2=B1 12%  slabinfo.UDP.num_slabs
    141.67 =C2=B1  8%      +5.9%     150.00        slabinfo.UDPv6.active_ob=
js
      5.67 =C2=B1  8%      +5.9%       6.00        slabinfo.UDPv6.active_sl=
abs
    141.67 =C2=B1  8%      +5.9%     150.00        slabinfo.UDPv6.num_objs
      5.67 =C2=B1  8%      +5.9%       6.00        slabinfo.UDPv6.num_slabs
      2967 =C2=B1  2%      +0.6%       2986 =C2=B1  2%  slabinfo.UNIX.activ=
e_objs
     92.00 =C2=B1  2%      +0.7%      92.67 =C2=B1  2%  slabinfo.UNIX.activ=
e_slabs
      2967 =C2=B1  2%      +0.6%       2986 =C2=B1  2%  slabinfo.UNIX.num_o=
bjs
     92.00 =C2=B1  2%      +0.7%      92.67 =C2=B1  2%  slabinfo.UNIX.num_s=
labs
     23604            +3.5%      24423        slabinfo.anon_vma.active_objs
    517.00            +3.5%     535.00        slabinfo.anon_vma.active_slabs
     23802            +3.5%      24626        slabinfo.anon_vma.num_objs
    517.00            +3.5%     535.00        slabinfo.anon_vma.num_slabs
     27164            +3.2%      28025        slabinfo.anon_vma_chain.activ=
e_objs
    431.67            +3.6%     447.00        slabinfo.anon_vma_chain.activ=
e_slabs
     27646            +3.6%      28636        slabinfo.anon_vma_chain.num_o=
bjs
    431.67            +3.6%     447.00        slabinfo.anon_vma_chain.num_s=
labs
    126.67 =C2=B1  7%     +15.8%     146.67 =C2=B1  6%  slabinfo.bdev_cache=
.active_objs
      6.33 =C2=B1  7%     +15.8%       7.33 =C2=B1  6%  slabinfo.bdev_cache=
.active_slabs
    126.67 =C2=B1  7%     +15.8%     146.67 =C2=B1  6%  slabinfo.bdev_cache=
.num_objs
      6.33 =C2=B1  7%     +15.8%       7.33 =C2=B1  6%  slabinfo.bdev_cache=
.num_slabs
    256.00            +0.0%     256.00        slabinfo.bio-120.active_objs
      4.00            +0.0%       4.00        slabinfo.bio-120.active_slabs
    256.00            +0.0%     256.00        slabinfo.bio-120.num_objs
      4.00            +0.0%       4.00        slabinfo.bio-120.num_slabs
    713.33 =C2=B1  9%     +15.3%     822.67 =C2=B1 16%  slabinfo.bio-184.ac=
tive_objs
     16.67 =C2=B1 10%     +14.0%      19.00 =C2=B1 17%  slabinfo.bio-184.ac=
tive_slabs
    713.33 =C2=B1  9%     +15.3%     822.67 =C2=B1 16%  slabinfo.bio-184.nu=
m_objs
     16.67 =C2=B1 10%     +14.0%      19.00 =C2=B1 17%  slabinfo.bio-184.nu=
m_slabs
     64.00            +0.0%      64.00        slabinfo.bio-216.active_objs
      1.00            +0.0%       1.00        slabinfo.bio-216.active_slabs
     64.00            +0.0%      64.00        slabinfo.bio-216.num_objs
      1.00            +0.0%       1.00        slabinfo.bio-216.num_slabs
    128.00            +0.0%     128.00        slabinfo.bio-248.active_objs
      2.00            +0.0%       2.00        slabinfo.bio-248.active_slabs
    128.00            +0.0%     128.00        slabinfo.bio-248.num_objs
      2.00            +0.0%       2.00        slabinfo.bio-248.num_slabs
    139.33 =C2=B1 13%     +62.9%     227.00 =C2=B1 31%  slabinfo.bio-336.ac=
tive_objs
      3.00           +66.7%       5.00 =C2=B1 28%  slabinfo.bio-336.active_=
slabs
    139.33 =C2=B1 13%     +62.9%     227.00 =C2=B1 31%  slabinfo.bio-336.nu=
m_objs
      3.00           +66.7%       5.00 =C2=B1 28%  slabinfo.bio-336.num_sla=
bs
    160.00 =C2=B1 14%     +28.3%     205.33 =C2=B1 11%  slabinfo.biovec-128=
.active_objs
     10.00 =C2=B1 14%     +23.3%      12.33 =C2=B1 13%  slabinfo.biovec-128=
.active_slabs
    160.00 =C2=B1 14%     +28.3%     205.33 =C2=B1 11%  slabinfo.biovec-128=
.num_objs
     10.00 =C2=B1 14%     +23.3%      12.33 =C2=B1 13%  slabinfo.biovec-128=
.num_slabs
    394.67 =C2=B1  3%     +10.8%     437.33 =C2=B1 20%  slabinfo.biovec-64.=
active_objs
     12.33 =C2=B1  3%     +10.8%      13.67 =C2=B1 20%  slabinfo.biovec-64.=
active_slabs
    394.67 =C2=B1  3%     +10.8%     437.33 =C2=B1 20%  slabinfo.biovec-64.=
num_objs
     12.33 =C2=B1  3%     +10.8%      13.67 =C2=B1 20%  slabinfo.biovec-64.=
num_slabs
     79.67 =C2=B1  7%     +24.3%      99.00 =C2=B1 13%  slabinfo.biovec-max=
.active_objs
      9.67 =C2=B1  4%     +24.1%      12.00 =C2=B1 11%  slabinfo.biovec-max=
.active_slabs
     79.67 =C2=B1  7%     +24.3%      99.00 =C2=B1 13%  slabinfo.biovec-max=
.num_objs
      9.67 =C2=B1  4%     +24.1%      12.00 =C2=B1 11%  slabinfo.biovec-max=
.num_slabs
     38.33 =C2=B1141%    +241.7%     131.00 =C2=B1 71%  slabinfo.btrfs_free=
_space.active_objs
      0.67 =C2=B1141%    +350.0%       3.00 =C2=B1 72%  slabinfo.btrfs_free=
_space.active_slabs
     38.33 =C2=B1141%    +241.7%     131.00 =C2=B1 71%  slabinfo.btrfs_free=
_space.num_objs
      0.67 =C2=B1141%    +350.0%       3.00 =C2=B1 72%  slabinfo.btrfs_free=
_space.num_slabs
    108.00            +7.1%     115.67 =C2=B1 10%  slabinfo.btrfs_inode.act=
ive_objs
      4.00            -8.3%       3.67 =C2=B1 12%  slabinfo.btrfs_inode.act=
ive_slabs
    108.00            +7.1%     115.67 =C2=B1 10%  slabinfo.btrfs_inode.num=
_objs
      4.00            -8.3%       3.67 =C2=B1 12%  slabinfo.btrfs_inode.num=
_slabs
      0.00       +2.1e+103%      21.33 =C2=B1 70%  slabinfo.btrfs_ordered_e=
xtent.active_objs
      0.00          -100.0%       0.00        slabinfo.btrfs_ordered_extent=
.active_slabs
      0.00       +2.1e+103%      21.33 =C2=B1 70%  slabinfo.btrfs_ordered_e=
xtent.num_objs
      0.00          -100.0%       0.00        slabinfo.btrfs_ordered_extent=
.num_slabs
    259.33 =C2=B1 13%     +22.4%     317.33 =C2=B1 27%  slabinfo.buffer_hea=
d.active_objs
      6.33 =C2=B1  7%     +21.1%       7.67 =C2=B1 24%  slabinfo.buffer_hea=
d.active_slabs
    259.33 =C2=B1 13%     +22.4%     317.33 =C2=B1 27%  slabinfo.buffer_hea=
d.num_objs
      6.33 =C2=B1  7%     +21.1%       7.67 =C2=B1 24%  slabinfo.buffer_hea=
d.num_slabs
     35983            +2.8%      36974        slabinfo.cred_jar.active_objs
    870.67            +3.4%     900.33        slabinfo.cred_jar.active_slabs
     36604            +3.3%      37827        slabinfo.cred_jar.num_objs
    870.67            +3.4%     900.33        slabinfo.cred_jar.num_slabs
     39.00            +0.0%      39.00        slabinfo.dax_cache.active_objs
      1.00            +0.0%       1.00        slabinfo.dax_cache.active_sla=
bs
     39.00            +0.0%      39.00        slabinfo.dax_cache.num_objs
      1.00            +0.0%       1.00        slabinfo.dax_cache.num_slabs
    265837            +0.4%     266770        slabinfo.dentry.active_objs
      7248            +0.9%       7310        slabinfo.dentry.active_slabs
    304475            +0.8%     307058        slabinfo.dentry.num_objs
      7248            +0.9%       7310        slabinfo.dentry.num_slabs
     30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.=
active_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.=
active_slabs
     30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.=
num_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.=
num_slabs
      1489 =C2=B1  4%      +0.2%       1492 =C2=B1  3%  slabinfo.dmaengine-=
unmap-16.active_objs
     35.00 =C2=B1  4%      -1.0%      34.67 =C2=B1  3%  slabinfo.dmaengine-=
unmap-16.active_slabs
      1489 =C2=B1  4%      +0.2%       1492 =C2=B1  3%  slabinfo.dmaengine-=
unmap-16.num_objs
     35.00 =C2=B1  4%      -1.0%      34.67 =C2=B1  3%  slabinfo.dmaengine-=
unmap-16.num_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.=
active_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.=
active_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.=
num_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.=
num_slabs
     26156 =C2=B1  2%     -10.4%      23434 =C2=B1  4%  slabinfo.ep_head.ac=
tive_objs
    102.00 =C2=B1  2%     -10.8%      91.00 =C2=B1  4%  slabinfo.ep_head.ac=
tive_slabs
     26156 =C2=B1  2%     -10.4%      23434 =C2=B1  4%  slabinfo.ep_head.nu=
m_objs
    102.00 =C2=B1  2%     -10.8%      91.00 =C2=B1  4%  slabinfo.ep_head.nu=
m_slabs
      2878            -3.9%       2765        slabinfo.file_lock_cache.acti=
ve_objs
     77.33            -3.9%      74.33        slabinfo.file_lock_cache.acti=
ve_slabs
      2878            -3.9%       2765        slabinfo.file_lock_cache.num_=
objs
     77.33            -3.9%      74.33        slabinfo.file_lock_cache.num_=
slabs
      6210            -0.6%       6171        slabinfo.files_cache.active_o=
bjs
    134.67            -1.0%     133.33        slabinfo.files_cache.active_s=
labs
      6210            -0.6%       6171        slabinfo.files_cache.num_objs
    134.67            -1.0%     133.33        slabinfo.files_cache.num_slabs
     35516            +3.4%      36720 =C2=B1  3%  slabinfo.filp.active_objs
    667.33            -0.1%     666.67 =C2=B1  2%  slabinfo.filp.active_sla=
bs
     42724            -0.1%      42691 =C2=B1  2%  slabinfo.filp.num_objs
    667.33            -0.1%     666.67 =C2=B1  2%  slabinfo.filp.num_slabs
      2732 =C2=B1 11%     +15.7%       3163 =C2=B1  8%  slabinfo.fsnotify_m=
ark_connector.active_objs
     21.33 =C2=B1 11%     +14.1%      24.33 =C2=B1  8%  slabinfo.fsnotify_m=
ark_connector.active_slabs
      2732 =C2=B1 11%     +15.7%       3163 =C2=B1  8%  slabinfo.fsnotify_m=
ark_connector.num_objs
     21.33 =C2=B1 11%     +14.1%      24.33 =C2=B1  8%  slabinfo.fsnotify_m=
ark_connector.num_slabs
     53975            -0.2%      53890        slabinfo.ftrace_event_field.a=
ctive_objs
    635.00            -0.2%     634.00        slabinfo.ftrace_event_field.a=
ctive_slabs
     53975            -0.2%      53890        slabinfo.ftrace_event_field.n=
um_objs
    635.00            -0.2%     634.00        slabinfo.ftrace_event_field.n=
um_slabs
     92.33 =C2=B1 55%    +105.8%     190.00 =C2=B1 49%  slabinfo.fuse_reque=
st.active_objs
      1.33 =C2=B1 35%    +125.0%       3.00 =C2=B1 47%  slabinfo.fuse_reque=
st.active_slabs
     92.33 =C2=B1 55%    +105.8%     190.00 =C2=B1 49%  slabinfo.fuse_reque=
st.num_objs
      1.33 =C2=B1 35%    +125.0%       3.00 =C2=B1 47%  slabinfo.fuse_reque=
st.num_slabs
     98.00            +0.0%      98.00        slabinfo.hugetlbfs_inode_cach=
e.active_objs
      2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_cach=
e.active_slabs
     98.00            +0.0%      98.00        slabinfo.hugetlbfs_inode_cach=
e.num_objs
      2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_cach=
e.num_slabs
    237067            +0.2%     237441        slabinfo.inode_cache.active_o=
bjs
      4740            +0.2%       4748        slabinfo.inode_cache.active_s=
labs
    241752            +0.2%     242169        slabinfo.inode_cache.num_objs
      4740            +0.2%       4748        slabinfo.inode_cache.num_slabs
    170.33 =C2=B1 20%     +28.6%     219.00 =C2=B1 27%  slabinfo.ip_fib_ali=
as.active_objs
      2.33 =C2=B1 20%     +28.6%       3.00 =C2=B1 27%  slabinfo.ip_fib_ali=
as.active_slabs
    170.33 =C2=B1 20%     +28.6%     219.00 =C2=B1 27%  slabinfo.ip_fib_ali=
as.num_objs
      2.33 =C2=B1 20%     +28.6%       3.00 =C2=B1 27%  slabinfo.ip_fib_ali=
as.num_slabs
    198.33 =C2=B1 20%     +28.6%     255.00 =C2=B1 27%  slabinfo.ip_fib_tri=
e.active_objs
      2.33 =C2=B1 20%     +28.6%       3.00 =C2=B1 27%  slabinfo.ip_fib_tri=
e.active_slabs
    198.33 =C2=B1 20%     +28.6%     255.00 =C2=B1 27%  slabinfo.ip_fib_tri=
e.num_objs
      2.33 =C2=B1 20%     +28.6%       3.00 =C2=B1 27%  slabinfo.ip_fib_tri=
e.num_slabs
    113280            -0.1%     113216        slabinfo.kernfs_node_cache.ac=
tive_objs
      1769            -0.0%       1769        slabinfo.kernfs_node_cache.ac=
tive_slabs
    113280            -0.1%     113216        slabinfo.kernfs_node_cache.nu=
m_objs
      1769            -0.0%       1769        slabinfo.kernfs_node_cache.nu=
m_slabs
      4582            +0.2%       4589        slabinfo.khugepaged_mm_slot.a=
ctive_objs
    127.00            +0.0%     127.00        slabinfo.khugepaged_mm_slot.a=
ctive_slabs
      4582            +0.2%       4589        slabinfo.khugepaged_mm_slot.n=
um_objs
    127.00            +0.0%     127.00        slabinfo.khugepaged_mm_slot.n=
um_slabs
     11297            -1.9%      11083        slabinfo.kmalloc-128.active_o=
bjs
    177.33 =C2=B1  2%      -1.1%     175.33        slabinfo.kmalloc-128.act=
ive_slabs
     11384 =C2=B1  2%      -1.3%      11238        slabinfo.kmalloc-128.num=
_objs
    177.33 =C2=B1  2%      -1.1%     175.33        slabinfo.kmalloc-128.num=
_slabs
     49512            -0.0%      49493        slabinfo.kmalloc-16.active_ob=
js
    193.67            -0.2%     193.33        slabinfo.kmalloc-16.active_sl=
abs
     49578            -0.2%      49493        slabinfo.kmalloc-16.num_objs
    193.67            -0.2%     193.33        slabinfo.kmalloc-16.num_slabs
      7798            +0.3%       7822        slabinfo.kmalloc-192.active_o=
bjs
    185.67            +0.4%     186.33        slabinfo.kmalloc-192.active_s=
labs
      7798            +0.4%       7826        slabinfo.kmalloc-192.num_objs
    185.67            +0.4%     186.33        slabinfo.kmalloc-192.num_slabs
      6385 =C2=B1  3%      +0.6%       6421 =C2=B1  3%  slabinfo.kmalloc-1k=
.active_objs
    200.67 =C2=B1  4%      +1.0%     202.67 =C2=B1  3%  slabinfo.kmalloc-1k=
.active_slabs
      6434 =C2=B1  4%      +0.9%       6490 =C2=B1  3%  slabinfo.kmalloc-1k=
.num_objs
    200.67 =C2=B1  4%      +1.0%     202.67 =C2=B1  3%  slabinfo.kmalloc-1k=
.num_slabs
     11745            -0.9%      11642        slabinfo.kmalloc-256.active_o=
bjs
    187.00            -1.4%     184.33        slabinfo.kmalloc-256.active_s=
labs
     11994            -1.5%      11808 =C2=B1  2%  slabinfo.kmalloc-256.num=
_objs
    187.00            -1.4%     184.33        slabinfo.kmalloc-256.num_slabs
      5794            -1.2%       5723        slabinfo.kmalloc-2k.active_ob=
js
    369.33            -1.5%     363.67        slabinfo.kmalloc-2k.active_sl=
abs
      5918            -1.6%       5824        slabinfo.kmalloc-2k.num_objs
    369.33            -1.5%     363.67        slabinfo.kmalloc-2k.num_slabs
     93489 =C2=B1  2%      -1.6%      92022 =C2=B1  3%  slabinfo.kmalloc-32=
.active_objs
    732.00 =C2=B1  2%      -1.6%     720.00 =C2=B1  3%  slabinfo.kmalloc-32=
.active_slabs
     93754 =C2=B1  3%      -1.6%      92218 =C2=B1  3%  slabinfo.kmalloc-32=
.num_objs
    732.00 =C2=B1  2%      -1.6%     720.00 =C2=B1  3%  slabinfo.kmalloc-32=
.num_slabs
      1945            +0.3%       1950        slabinfo.kmalloc-4k.active_ob=
js
    248.00            +0.3%     248.67        slabinfo.kmalloc-4k.active_sl=
abs
      1987            +0.3%       1993        slabinfo.kmalloc-4k.num_objs
    248.00            +0.3%     248.67        slabinfo.kmalloc-4k.num_slabs
     26031            +1.7%      26484        slabinfo.kmalloc-512.active_o=
bjs
    468.67            +7.1%     502.00 =C2=B1  2%  slabinfo.kmalloc-512.act=
ive_slabs
     30027            +7.0%      32143 =C2=B1  2%  slabinfo.kmalloc-512.num=
_objs
    468.67            +7.1%     502.00 =C2=B1  2%  slabinfo.kmalloc-512.num=
_slabs
    114083            -0.9%     113046        slabinfo.kmalloc-64.active_ob=
js
      1788            -1.0%       1770        slabinfo.kmalloc-64.active_sl=
abs
    114457            -1.0%     113312        slabinfo.kmalloc-64.num_objs
      1788            -1.0%       1770        slabinfo.kmalloc-64.num_slabs
     74273            -0.5%      73893 =C2=B1  2%  slabinfo.kmalloc-8.activ=
e_objs
    150.67 =C2=B1  2%      +0.0%     150.67        slabinfo.kmalloc-8.activ=
e_slabs
     77367 =C2=B1  2%      +0.1%      77408        slabinfo.kmalloc-8.num_o=
bjs
    150.67 =C2=B1  2%      +0.0%     150.67        slabinfo.kmalloc-8.num_s=
labs
    875.33            +0.0%     875.33        slabinfo.kmalloc-8k.active_ob=
js
    223.00            +0.0%     223.00        slabinfo.kmalloc-8k.active_sl=
abs
    894.33            +0.0%     894.33        slabinfo.kmalloc-8k.num_objs
    223.00            +0.0%     223.00        slabinfo.kmalloc-8k.num_slabs
      9911            -0.3%       9881        slabinfo.kmalloc-96.active_ob=
js
    238.00            -0.4%     237.00        slabinfo.kmalloc-96.active_sl=
abs
     10003            -0.3%       9974        slabinfo.kmalloc-96.num_objs
    238.00            -0.4%     237.00        slabinfo.kmalloc-96.num_slabs
    853.33 =C2=B1  9%      +7.5%     917.33 =C2=B1  3%  slabinfo.kmalloc-cg=
-128.active_objs
     13.33 =C2=B1  9%      +7.5%      14.33 =C2=B1  3%  slabinfo.kmalloc-cg=
-128.active_slabs
    853.33 =C2=B1  9%      +7.5%     917.33 =C2=B1  3%  slabinfo.kmalloc-cg=
-128.num_objs
     13.33 =C2=B1  9%      +7.5%      14.33 =C2=B1  3%  slabinfo.kmalloc-cg=
-128.num_slabs
      3136 =C2=B1  2%      +1.5%       3184 =C2=B1  6%  slabinfo.kmalloc-cg=
-16.active_objs
     11.67 =C2=B1  4%      +2.9%      12.00 =C2=B1  6%  slabinfo.kmalloc-cg=
-16.active_slabs
      3136 =C2=B1  2%      +1.5%       3184 =C2=B1  6%  slabinfo.kmalloc-cg=
-16.num_objs
     11.67 =C2=B1  4%      +2.9%      12.00 =C2=B1  6%  slabinfo.kmalloc-cg=
-16.num_slabs
      5371            +0.0%       5372        slabinfo.kmalloc-cg-192.activ=
e_objs
    127.00            +0.0%     127.00        slabinfo.kmalloc-cg-192.activ=
e_slabs
      5371            +0.0%       5372        slabinfo.kmalloc-cg-192.num_o=
bjs
    127.00            +0.0%     127.00        slabinfo.kmalloc-cg-192.num_s=
labs
      4531            -3.9%       4353        slabinfo.kmalloc-cg-1k.active=
_objs
    141.00            -4.0%     135.33        slabinfo.kmalloc-cg-1k.active=
_slabs
      4531            -3.9%       4353        slabinfo.kmalloc-cg-1k.num_ob=
js
    141.00            -4.0%     135.33        slabinfo.kmalloc-cg-1k.num_sl=
abs
    613.67 =C2=B1  4%     +17.1%     718.33 =C2=B1  4%  slabinfo.kmalloc-cg=
-256.active_objs
      8.67 =C2=B1  5%     +19.2%      10.33 =C2=B1  4%  slabinfo.kmalloc-cg=
-256.active_slabs
    613.67 =C2=B1  4%     +17.1%     718.33 =C2=B1  4%  slabinfo.kmalloc-cg=
-256.num_objs
      8.67 =C2=B1  5%     +19.2%      10.33 =C2=B1  4%  slabinfo.kmalloc-cg=
-256.num_slabs
      1317            +1.3%       1335        slabinfo.kmalloc-cg-2k.active=
_objs
     82.00            +1.2%      83.00        slabinfo.kmalloc-cg-2k.active=
_slabs
      1317            +1.3%       1335        slabinfo.kmalloc-cg-2k.num_ob=
js
     82.00            +1.2%      83.00        slabinfo.kmalloc-cg-2k.num_sl=
abs
     16374            +0.0%      16374        slabinfo.kmalloc-cg-32.active=
_objs
    127.00            +0.0%     127.00        slabinfo.kmalloc-cg-32.active=
_slabs
     16374            +0.0%      16374        slabinfo.kmalloc-cg-32.num_ob=
js
    127.00            +0.0%     127.00        slabinfo.kmalloc-cg-32.num_sl=
abs
      1040            -0.3%       1037        slabinfo.kmalloc-cg-4k.active=
_objs
    130.00            -0.3%     129.67        slabinfo.kmalloc-cg-4k.active=
_slabs
      1040            -0.3%       1037        slabinfo.kmalloc-cg-4k.num_ob=
js
    130.00            -0.3%     129.67        slabinfo.kmalloc-cg-4k.num_sl=
abs
      8192            -0.5%       8149        slabinfo.kmalloc-cg-512.activ=
e_objs
    128.00            -0.5%     127.33        slabinfo.kmalloc-cg-512.activ=
e_slabs
      8192            -0.5%       8149        slabinfo.kmalloc-cg-512.num_o=
bjs
    128.00            -0.5%     127.33        slabinfo.kmalloc-cg-512.num_s=
labs
      6462            +1.6%       6563 =C2=B1  2%  slabinfo.kmalloc-cg-64.a=
ctive_objs
    100.33            +1.3%     101.67 =C2=B1  2%  slabinfo.kmalloc-cg-64.a=
ctive_slabs
      6462            +1.6%       6563 =C2=B1  2%  slabinfo.kmalloc-cg-64.n=
um_objs
    100.33            +1.3%     101.67 =C2=B1  2%  slabinfo.kmalloc-cg-64.n=
um_slabs
     66047            +0.0%      66048        slabinfo.kmalloc-cg-8.active_=
objs
    128.67            +0.3%     129.00        slabinfo.kmalloc-cg-8.active_=
slabs
     66047            +0.0%      66048        slabinfo.kmalloc-cg-8.num_objs
    128.67            +0.3%     129.00        slabinfo.kmalloc-cg-8.num_sla=
bs
     58.67 =C2=B1  3%      -2.3%      57.33 =C2=B1  4%  slabinfo.kmalloc-cg=
-8k.active_objs
     14.67 =C2=B1  3%      -6.8%      13.67 =C2=B1  3%  slabinfo.kmalloc-cg=
-8k.active_slabs
     58.67 =C2=B1  3%      -2.3%      57.33 =C2=B1  4%  slabinfo.kmalloc-cg=
-8k.num_objs
     14.67 =C2=B1  3%      -6.8%      13.67 =C2=B1  3%  slabinfo.kmalloc-cg=
-8k.num_slabs
      3337            +0.5%       3352        slabinfo.kmalloc-cg-96.active=
_objs
     79.00            +0.4%      79.33        slabinfo.kmalloc-cg-96.active=
_slabs
      3337            +0.5%       3352        slabinfo.kmalloc-cg-96.num_ob=
js
     79.00            +0.4%      79.33        slabinfo.kmalloc-cg-96.num_sl=
abs
    213.33 =C2=B1 14%     +20.0%     256.00        slabinfo.kmalloc-rcl-128=
.active_objs
      3.33 =C2=B1 14%     +20.0%       4.00        slabinfo.kmalloc-rcl-128=
.active_slabs
    213.33 =C2=B1 14%     +20.0%     256.00        slabinfo.kmalloc-rcl-128=
.num_objs
      3.33 =C2=B1 14%     +20.0%       4.00        slabinfo.kmalloc-rcl-128=
.num_slabs
     42.00            +0.0%      42.00        slabinfo.kmalloc-rcl-192.acti=
ve_objs
      1.00            +0.0%       1.00        slabinfo.kmalloc-rcl-192.acti=
ve_slabs
     42.00            +0.0%      42.00        slabinfo.kmalloc-rcl-192.num_=
objs
      1.00            +0.0%       1.00        slabinfo.kmalloc-rcl-192.num_=
slabs
     12059            +0.7%      12149 =C2=B1  2%  slabinfo.kmalloc-rcl-64.=
active_objs
    188.00            +0.9%     189.67 =C2=B1  2%  slabinfo.kmalloc-rcl-64.=
active_slabs
     12059            +0.8%      12150 =C2=B1  2%  slabinfo.kmalloc-rcl-64.=
num_objs
    188.00            +0.9%     189.67 =C2=B1  2%  slabinfo.kmalloc-rcl-64.=
num_slabs
      1671            +1.0%       1687 =C2=B1  2%  slabinfo.kmalloc-rcl-96.=
active_objs
     39.33            +0.8%      39.67 =C2=B1  2%  slabinfo.kmalloc-rcl-96.=
active_slabs
      1671            +1.0%       1687 =C2=B1  2%  slabinfo.kmalloc-rcl-96.=
num_objs
     39.33            +0.8%      39.67 =C2=B1  2%  slabinfo.kmalloc-rcl-96.=
num_slabs
    960.00 =C2=B1  5%      +2.2%     981.33 =C2=B1  6%  slabinfo.kmem_cache=
.active_objs
     15.00 =C2=B1  5%      +2.2%      15.33 =C2=B1  6%  slabinfo.kmem_cache=
.active_slabs
    960.00 =C2=B1  5%      +2.2%     981.33 =C2=B1  6%  slabinfo.kmem_cache=
.num_objs
     15.00 =C2=B1  5%      +2.2%      15.33 =C2=B1  6%  slabinfo.kmem_cache=
.num_slabs
      1138 =C2=B1  4%      +1.9%       1159 =C2=B1  5%  slabinfo.kmem_cache=
_node.active_objs
     18.00 =C2=B1  4%      +1.9%      18.33 =C2=B1  5%  slabinfo.kmem_cache=
_node.active_slabs
      1152 =C2=B1  4%      +1.9%       1173 =C2=B1  5%  slabinfo.kmem_cache=
_node.num_objs
     18.00 =C2=B1  4%      +1.9%      18.33 =C2=B1  5%  slabinfo.kmem_cache=
_node.num_slabs
     46174            -0.3%      46022        slabinfo.lsm_file_cache.activ=
e_objs
    273.00            -0.2%     272.33        slabinfo.lsm_file_cache.activ=
e_slabs
     46524            -0.3%      46407        slabinfo.lsm_file_cache.num_o=
bjs
    273.00            -0.2%     272.33        slabinfo.lsm_file_cache.num_s=
labs
      4223            +0.9%       4263        slabinfo.mm_struct.active_objs
    140.33            +1.2%     142.00        slabinfo.mm_struct.active_sla=
bs
      4223            +1.0%       4266        slabinfo.mm_struct.num_objs
    140.33            +1.2%     142.00        slabinfo.mm_struct.num_slabs
    952.00 =C2=B1  2%      +1.8%     969.00 =C2=B1  4%  slabinfo.mnt_cache.=
active_objs
     18.67 =C2=B1  2%      +1.8%      19.00 =C2=B1  4%  slabinfo.mnt_cache.=
active_slabs
    952.00 =C2=B1  2%      +1.8%     969.00 =C2=B1  4%  slabinfo.mnt_cache.=
num_objs
     18.67 =C2=B1  2%      +1.8%      19.00 =C2=B1  4%  slabinfo.mnt_cache.=
num_slabs
     34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.a=
ctive_objs
      1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.a=
ctive_slabs
     34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.n=
um_objs
      1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.n=
um_slabs
      1758 =C2=B1  6%      +5.3%       1851 =C2=B1  3%  slabinfo.names_cach=
e.active_objs
    220.67 =C2=B1  6%      +5.6%     233.00 =C2=B1  3%  slabinfo.names_cach=
e.active_slabs
      1770 =C2=B1  6%      +5.4%       1867 =C2=B1  3%  slabinfo.names_cach=
e.num_objs
    220.67 =C2=B1  6%      +5.6%     233.00 =C2=B1  3%  slabinfo.names_cach=
e.num_slabs
      8.00            +0.0%       8.00        slabinfo.net_namespace.active=
_objs
      1.00            +0.0%       1.00        slabinfo.net_namespace.active=
_slabs
      8.00            +0.0%       8.00        slabinfo.net_namespace.num_ob=
js
      1.00            +0.0%       1.00        slabinfo.net_namespace.num_sl=
abs
     36.00            +0.0%      36.00        slabinfo.nfs_read_data.active=
_objs
      1.00            +0.0%       1.00        slabinfo.nfs_read_data.active=
_slabs
     36.00            +0.0%      36.00        slabinfo.nfs_read_data.num_ob=
js
      1.00            +0.0%       1.00        slabinfo.nfs_read_data.num_sl=
abs
    271.67 =C2=B1  9%      +0.0%     271.67 =C2=B1  9%  slabinfo.nsproxy.ac=
tive_objs
      4.33 =C2=B1 10%      +0.0%       4.33 =C2=B1 10%  slabinfo.nsproxy.ac=
tive_slabs
    271.67 =C2=B1  9%      +0.0%     271.67 =C2=B1  9%  slabinfo.nsproxy.nu=
m_objs
      4.33 =C2=B1 10%      +0.0%       4.33 =C2=B1 10%  slabinfo.nsproxy.nu=
m_slabs
    180.00            +0.0%     180.00        slabinfo.numa_policy.active_o=
bjs
      3.00            +0.0%       3.00        slabinfo.numa_policy.active_s=
labs
    180.00            +0.0%     180.00        slabinfo.numa_policy.num_objs
      3.00            +0.0%       3.00        slabinfo.numa_policy.num_slabs
     13045            -0.0%      13045        slabinfo.pde_opener.active_ob=
js
    127.00            +0.0%     127.00        slabinfo.pde_opener.active_sl=
abs
     13045            -0.0%      13045        slabinfo.pde_opener.num_objs
    127.00            +0.0%     127.00        slabinfo.pde_opener.num_slabs
      5212            +0.4%       5233        slabinfo.perf_event.active_ob=
js
    196.00            +0.3%     196.67        slabinfo.perf_event.active_sl=
abs
      5303            +0.4%       5324        slabinfo.perf_event.num_objs
    196.00            +0.3%     196.67        slabinfo.perf_event.num_slabs
     12380 =C2=B1  4%      -0.4%      12329 =C2=B1  5%  slabinfo.pid.active=
_objs
    193.33 =C2=B1  4%      -0.5%     192.33 =C2=B1  5%  slabinfo.pid.active=
_slabs
     12390 =C2=B1  4%      -0.3%      12349 =C2=B1  5%  slabinfo.pid.num_ob=
js
    193.33 =C2=B1  4%      -0.5%     192.33 =C2=B1  5%  slabinfo.pid.num_sl=
abs
      3111 =C2=B1  2%      +7.7%       3350 =C2=B1  3%  slabinfo.pool_workq=
ueue.active_objs
     48.67 =C2=B1  2%      +6.8%      52.00 =C2=B1  3%  slabinfo.pool_workq=
ueue.active_slabs
      3136 =C2=B1  2%      +7.2%       3363 =C2=B1  3%  slabinfo.pool_workq=
ueue.num_objs
     48.67 =C2=B1  2%      +6.8%      52.00 =C2=B1  3%  slabinfo.pool_workq=
ueue.num_slabs
      3556            +3.1%       3668        slabinfo.proc_dir_entry.activ=
e_objs
     84.67            +3.1%      87.33        slabinfo.proc_dir_entry.activ=
e_slabs
      3556            +3.1%       3668        slabinfo.proc_dir_entry.num_o=
bjs
     84.67            +3.1%      87.33        slabinfo.proc_dir_entry.num_s=
labs
     13396            -0.4%      13339        slabinfo.proc_inode_cache.act=
ive_objs
    291.00            -0.3%     290.00        slabinfo.proc_inode_cache.act=
ive_slabs
     13414            -0.4%      13367        slabinfo.proc_inode_cache.num=
_objs
    291.00            -0.3%     290.00        slabinfo.proc_inode_cache.num=
_slabs
     97227            +0.3%      97498        slabinfo.radix_tree_node.acti=
ve_objs
      1746            +0.2%       1750        slabinfo.radix_tree_node.acti=
ve_slabs
     97813            +0.2%      98049        slabinfo.radix_tree_node.num_=
objs
      1746            +0.2%       1750        slabinfo.radix_tree_node.num_=
slabs
    128.33 =C2=B1 12%      +0.0%     128.33 =C2=B1 12%  slabinfo.request_qu=
eue.active_objs
      3.67 =C2=B1 12%      +0.0%       3.67 =C2=B1 12%  slabinfo.request_qu=
eue.active_slabs
    128.33 =C2=B1 12%      +0.0%     128.33 =C2=B1 12%  slabinfo.request_qu=
eue.num_objs
      3.67 =C2=B1 12%      +0.0%       3.67 =C2=B1 12%  slabinfo.request_qu=
eue.num_slabs
     46.00            +0.0%      46.00        slabinfo.rpc_inode_cache.acti=
ve_objs
      1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.acti=
ve_slabs
     46.00            +0.0%      46.00        slabinfo.rpc_inode_cache.num_=
objs
      1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.num_=
slabs
    746.67 =C2=B1  4%      +0.0%     746.67 =C2=B1  4%  slabinfo.scsi_sense=
_cache.active_objs
     11.67 =C2=B1  4%      +0.0%      11.67 =C2=B1  4%  slabinfo.scsi_sense=
_cache.active_slabs
    746.67 =C2=B1  4%      +0.0%     746.67 =C2=B1  4%  slabinfo.scsi_sense=
_cache.num_objs
     11.67 =C2=B1  4%      +0.0%      11.67 =C2=B1  4%  slabinfo.scsi_sense=
_cache.num_slabs
      8704            +0.0%       8704        slabinfo.seq_file.active_objs
    128.00            +0.0%     128.00        slabinfo.seq_file.active_slabs
      8704            +0.0%       8704        slabinfo.seq_file.num_objs
    128.00            +0.0%     128.00        slabinfo.seq_file.num_slabs
      6965            -0.8%       6910        slabinfo.shmem_inode_cache.ac=
tive_objs
    165.33            -0.8%     164.00        slabinfo.shmem_inode_cache.ac=
tive_slabs
      6965            -0.8%       6910        slabinfo.shmem_inode_cache.nu=
m_objs
    165.33            -0.8%     164.00        slabinfo.shmem_inode_cache.nu=
m_slabs
      6477            +1.4%       6566        slabinfo.sighand_cache.active=
_objs
    434.33            +1.3%     440.00        slabinfo.sighand_cache.active=
_slabs
      6525            +1.3%       6611        slabinfo.sighand_cache.num_ob=
js
    434.33            +1.3%     440.00        slabinfo.sighand_cache.num_sl=
abs
      8339            -2.4%       8142        slabinfo.signal_cache.active_=
objs
    301.00            -2.4%     293.67        slabinfo.signal_cache.active_=
slabs
      8446            -2.4%       8244        slabinfo.signal_cache.num_objs
    301.00            -2.4%     293.67        slabinfo.signal_cache.num_sla=
bs
      7070 =C2=B1  2%      -1.2%       6985        slabinfo.sigqueue.active=
_objs
    137.67 =C2=B1  2%      -1.2%     136.00        slabinfo.sigqueue.active=
_slabs
      7070 =C2=B1  2%      -1.2%       6985        slabinfo.sigqueue.num_ob=
js
    137.67 =C2=B1  2%      -1.2%     136.00        slabinfo.sigqueue.num_sl=
abs
    853.33 =C2=B1  7%      +9.5%     934.00 =C2=B1 27%  slabinfo.skbuff_fcl=
one_cache.active_objs
     13.33 =C2=B1  7%      +7.5%      14.33 =C2=B1 25%  slabinfo.skbuff_fcl=
one_cache.active_slabs
    853.33 =C2=B1  7%      +9.5%     934.00 =C2=B1 27%  slabinfo.skbuff_fcl=
one_cache.num_objs
     13.33 =C2=B1  7%      +7.5%      14.33 =C2=B1 25%  slabinfo.skbuff_fcl=
one_cache.num_slabs
      9984            +0.4%      10022        slabinfo.skbuff_head_cache.ac=
tive_objs
    157.33            +0.0%     157.33        slabinfo.skbuff_head_cache.ac=
tive_slabs
     10069            +0.0%      10069        slabinfo.skbuff_head_cache.nu=
m_objs
    157.33            +0.0%     157.33        slabinfo.skbuff_head_cache.nu=
m_slabs
      4409 =C2=B1  3%      +1.0%       4454 =C2=B1  3%  slabinfo.sock_inode=
_cache.active_objs
    112.67 =C2=B1  3%      +1.2%     114.00 =C2=B1  3%  slabinfo.sock_inode=
_cache.active_slabs
      4409 =C2=B1  3%      +1.0%       4454 =C2=B1  3%  slabinfo.sock_inode=
_cache.num_objs
    112.67 =C2=B1  3%      +1.2%     114.00 =C2=B1  3%  slabinfo.sock_inode=
_cache.num_slabs
      1416 =C2=B1  6%      +3.7%       1469 =C2=B1  3%  slabinfo.task_group=
.active_objs
     30.33 =C2=B1  5%      +3.3%      31.33 =C2=B1  3%  slabinfo.task_group=
.active_slabs
      1416 =C2=B1  6%      +3.7%       1469 =C2=B1  3%  slabinfo.task_group=
.num_objs
     30.33 =C2=B1  5%      +3.3%      31.33 =C2=B1  3%  slabinfo.task_group=
.num_slabs
      2661            -0.4%       2651        slabinfo.task_struct.active_o=
bjs
      2665            -0.4%       2655        slabinfo.task_struct.active_s=
labs
      2665            -0.4%       2655        slabinfo.task_struct.num_objs
      2665            -0.4%       2655        slabinfo.task_struct.num_slabs
    308.00            -4.5%     294.00 =C2=B1  6%  slabinfo.taskstats.activ=
e_objs
      7.00            -4.8%       6.67 =C2=B1  7%  slabinfo.taskstats.activ=
e_slabs
    308.00            -4.5%     294.00 =C2=B1  6%  slabinfo.taskstats.num_o=
bjs
      7.00            -4.8%       6.67 =C2=B1  7%  slabinfo.taskstats.num_s=
labs
      2722 =C2=B1  4%      +3.7%       2822        slabinfo.trace_event_fil=
e.active_objs
     59.00 =C2=B1  4%      +4.0%      61.33        slabinfo.trace_event_fil=
e.active_slabs
      2722 =C2=B1  4%      +3.7%       2822        slabinfo.trace_event_fil=
e.num_objs
     59.00 =C2=B1  4%      +4.0%      61.33        slabinfo.trace_event_fil=
e.num_slabs
     66.00            +0.0%      66.00        slabinfo.tw_sock_TCP.active_o=
bjs
      1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.active_s=
labs
     66.00            +0.0%      66.00        slabinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.num_slabs
     74.00           -16.7%      61.67 =C2=B1 28%  slabinfo.uts_namespace.a=
ctive_objs
      2.00           -16.7%       1.67 =C2=B1 28%  slabinfo.uts_namespace.a=
ctive_slabs
     74.00           -16.7%      61.67 =C2=B1 28%  slabinfo.uts_namespace.n=
um_objs
      2.00           -16.7%       1.67 =C2=B1 28%  slabinfo.uts_namespace.n=
um_slabs
     29597            -0.8%      29361        slabinfo.vmap_area.active_objs
    580.33            -0.5%     577.67        slabinfo.vmap_area.active_sla=
bs
     37166            -0.4%      37007        slabinfo.vmap_area.num_objs
    580.33            -0.5%     577.67        slabinfo.vmap_area.num_slabs
      6.45            -3.4        3.07 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_f=
ault.exc_page_fault
      8.05            -2.8        5.27 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_faul=
t.asm_exc_page_fault
      6.69 =C2=B1  2%      -1.6        5.08 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe
      6.68 =C2=B1  2%      -1.6        5.07 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.24 =C2=B1  2%      -1.6        1.64 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
      3.24 =C2=B1  2%      -1.6        1.64 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
      3.24 =C2=B1  2%      -1.6        1.64 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      3.09 =C2=B1  2%      -1.6        1.49 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
      3.07 =C2=B1  2%      -1.6        1.48 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
      3.08 =C2=B1  2%      -1.6        1.49 =C2=B1  4%  perf-profile.calltr=
ace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      2.06 =C2=B1  2%      -1.4        0.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_=
mmap
      2.08 =C2=B1  2%      -1.4        0.67 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      2.09 =C2=B1  2%      -1.4        0.68 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      2.11 =C2=B1  2%      -1.4        0.70 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      5.45            -1.2        4.28        perf-profile.calltrace.cycles=
-pp.asm_exc_page_fault
      2.71 =C2=B1  2%      -1.1        1.58 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.vma_alloc_folio.do_anonymous_page.__handle_mm_fault.handle_mm=
_fault.do_user_addr_fault
      2.63            -1.1        1.51 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page.__ha=
ndle_mm_fault
      2.64 =C2=B1  2%      -1.1        1.52 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.__folio_alloc.vma_alloc_folio.do_anonymous_page.__handle_mm_f=
ault.handle_mm_fault
      2.51            -1.1        1.41 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.get_page_from_freelist.__alloc_pages.__folio_alloc.vma_alloc_folio=
.do_anonymous_page
      5.27            -1.1        4.22        perf-profile.calltrace.cycles=
-pp.exc_page_fault.asm_exc_page_fault
      1.05 =C2=B1  2%      -1.1        0.00        perf-profile.calltrace.c=
ycles-pp.asm_exc_page_fault.build_decl
      5.24            -1.0        4.20        perf-profile.calltrace.cycles=
-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      4.93            -1.0        3.92        perf-profile.calltrace.cycles=
-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.98 =C2=B1  3%      -1.0        0.00        perf-profile.calltrace.c=
ycles-pp.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range=
.unmap_vmas
      0.95 =C2=B1  2%      -1.0        0.00        perf-profile.calltrace.c=
ycles-pp.exc_page_fault.asm_exc_page_fault.build_decl
      0.95 =C2=B1  2%      -1.0        0.00        perf-profile.calltrace.c=
ycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.build_decl
      0.90 =C2=B1  3%      -0.9        0.00        perf-profile.calltrace.c=
ycles-pp.release_pages.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.un=
map_page_range
      0.90 =C2=B1  2%      -0.9        0.00        perf-profile.calltrace.c=
ycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fau=
lt.build_decl
      0.89            -0.9        0.00        perf-profile.calltrace.cycles=
-pp.__mem_cgroup_charge.do_anonymous_page.__handle_mm_fault.handle_mm_fault=
.do_user_addr_fault
      0.87            -0.9        0.00        perf-profile.calltrace.cycles=
-pp.asm_exc_page_fault.make_node
      0.79            -0.8        0.00        perf-profile.calltrace.cycles=
-pp.clear_page_erms.get_page_from_freelist.__alloc_pages.__folio_alloc.vma_=
alloc_folio
      0.79 =C2=B1  3%      -0.8        0.00        perf-profile.calltrace.c=
ycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.__folio_alloc.vma_all=
oc_folio
      0.78 =C2=B1  2%      -0.8        0.00        perf-profile.calltrace.c=
ycles-pp.exc_page_fault.asm_exc_page_fault.make_node
      0.78 =C2=B1  2%      -0.8        0.00        perf-profile.calltrace.c=
ycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.make_node
      0.74 =C2=B1  2%      -0.7        0.00        perf-profile.calltrace.c=
ycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fau=
lt.make_node
      0.68            -0.7        0.00        perf-profile.calltrace.cycles=
-pp.charge_memcg.__mem_cgroup_charge.do_anonymous_page.__handle_mm_fault.ha=
ndle_mm_fault
      0.60 =C2=B1  4%      -0.6        0.00        perf-profile.calltrace.c=
ycles-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.__folio_=
alloc
      0.59 =C2=B1  4%      -0.6        0.00        perf-profile.calltrace.c=
ycles-pp.free_unref_page_list.release_pages.tlb_batch_pages_flush.zap_pte_r=
ange.zap_pmd_range
      0.55            -0.6        0.00        perf-profile.calltrace.cycles=
-pp.allocate_struct_function
      0.55            -0.5        0.00        perf-profile.calltrace.cycles=
-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interru=
pt.__sysvec_apic_timer_interrupt
      0.55            -0.5        0.00        perf-profile.calltrace.cycles=
-pp.linemap_enter_macro
      0.54            -0.5        0.00        perf-profile.calltrace.cycles=
-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_q=
ueues.hrtimer_interrupt
      1.71            -0.5        1.19        perf-profile.calltrace.cycles=
-pp.make_node
      0.67 =C2=B1  3%      -0.5        0.18 =C2=B1141%  perf-profile.calltr=
ace.cycles-pp.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.=
__mmput
      2.03 =C2=B1  2%      -0.5        1.58        perf-profile.calltrace.c=
ycles-pp.build_decl
      0.35 =C2=B1 70%      -0.4        0.00        perf-profile.calltrace.c=
ycles-pp.free_pcppages_bulk.free_unref_page_list.release_pages.tlb_batch_pa=
ges_flush.zap_pte_range
      0.35 =C2=B1 70%      -0.4        0.00        perf-profile.calltrace.c=
ycles-pp.tlb_finish_mmu.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munm=
ap
      0.34 =C2=B1 70%      -0.3        0.00        perf-profile.calltrace.c=
ycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.__do_munmap.__vm=
_munmap
      0.34 =C2=B1 70%      -0.3        0.00        perf-profile.calltrace.c=
ycles-pp.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.=
exc_page_fault
      0.33 =C2=B1 70%      -0.3        0.00        perf-profile.calltrace.c=
ycles-pp.lookup_name
      1.78            -0.2        1.55 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fau=
lt.elf_read
      1.86 =C2=B1  2%      -0.2        1.64 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.elf_read
      1.87 =C2=B1  2%      -0.2        1.65 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.exc_page_fault.asm_exc_page_fault.elf_read
      2.09 =C2=B1  2%      -0.2        1.89 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.asm_exc_page_fault.elf_read
      0.75 =C2=B1  3%      -0.2        0.56 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.tlb_finish_mmu.exit_mmap.__mmput.exit_mm.do_exit
      0.74 =C2=B1  3%      -0.2        0.55 =C2=B1  6%  perf-profile.calltr=
ace.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput.exit_mm
      2.53 =C2=B1  2%      -0.2        2.35 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.elf_read
      0.17 =C2=B1141%      -0.2        0.00        perf-profile.calltrace.c=
ycles-pp.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.__=
do_munmap
      0.78 =C2=B1  3%      -0.1        0.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
      0.78 =C2=B1  3%      -0.1        0.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      0.78 =C2=B1  3%      -0.1        0.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__munmap
      0.78 =C2=B1  3%      -0.1        0.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.__munmap
      0.78 =C2=B1  3%      -0.1        0.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.__munmap
      0.78 =C2=B1  2%      -0.1        0.64 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
      0.76 =C2=B1  2%      -0.1        0.62 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_sysc=
all_64
      2.49            -0.1        2.37        perf-profile.calltrace.cycles=
-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      1.19            -0.1        1.07        perf-profile.calltrace.cycles=
-pp.asm_sysvec_apic_timer_interrupt
      2.50            -0.1        2.39        perf-profile.calltrace.cycles=
-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
      1.12            -0.1        1.01        perf-profile.calltrace.cycles=
-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.87            -0.1        0.76        perf-profile.calltrace.cycles=
-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_ap=
ic_timer_interrupt
      0.86            -0.1        0.75        perf-profile.calltrace.cycles=
-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt
      1.41 =C2=B1  4%      -0.1        1.31        perf-profile.calltrace.c=
ycles-pp.read
      1.77            -0.1        1.68        perf-profile.calltrace.cycles=
-pp.type_hash_canon
      0.63            -0.1        0.53        perf-profile.calltrace.cycles=
-pp.build_function_type
      1.37 =C2=B1  4%      -0.1        1.28        perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      1.34 =C2=B1  5%      -0.1        1.25        perf-profile.calltrace.c=
ycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.re=
ad
      1.37 =C2=B1  5%      -0.1        1.28        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe.read
      0.74            -0.1        0.65 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interru=
pt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.35 =C2=B1  5%      -0.1        1.26        perf-profile.calltrace.c=
ycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      1.24            -0.1        1.17        perf-profile.calltrace.cycles=
-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      1.82            -0.1        1.76        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.open64
      1.81            -0.1        1.75        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      0.61 =C2=B1  2%      -0.1        0.54 =C2=B1  3%  perf-profile.calltr=
ace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.86            -0.1        1.80        perf-profile.calltrace.cycles=
-pp.open64
      1.72            -0.0        1.67        perf-profile.calltrace.cycles=
-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      1.71            -0.0        1.66        perf-profile.calltrace.cycles=
-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.open64
      1.14 =C2=B1  2%      -0.0        1.10        perf-profile.calltrace.c=
ycles-pp.filemap_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
      1.09            -0.0        1.06 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.09            -0.0        1.05 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
      0.85 =C2=B1  3%      -0.0        0.82        perf-profile.calltrace.c=
ycles-pp._copy_to_iter.copy_page_to_iter.filemap_read.vfs_read.ksys_read
      0.71 =C2=B1  3%      -0.0        0.68        perf-profile.calltrace.c=
ycles-pp.copy_user_enhanced_fast_string.copyout._copy_to_iter.copy_page_to_=
iter.filemap_read
      0.82 =C2=B1  3%      -0.0        0.80        perf-profile.calltrace.c=
ycles-pp.copyout._copy_to_iter.copy_page_to_iter.filemap_read.vfs_read
      0.72            -0.0        0.70 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_=
page_fault
      0.86 =C2=B1  3%      -0.0        0.84        perf-profile.calltrace.c=
ycles-pp.copy_page_to_iter.filemap_read.vfs_read.ksys_read.do_syscall_64
      0.74 =C2=B1  2%      +0.0        0.75        perf-profile.calltrace.c=
ycles-pp.pop_scope
      2.49            +0.0        2.51 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp._cpp_create_definition
      0.60            +0.0        0.62 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      0.66 =C2=B1  2%      +0.0        0.69        perf-profile.calltrace.c=
ycles-pp.variably_modified_type_p
      0.51            +0.0        0.54 =C2=B1  5%  perf-profile.calltrace.c=
ycles-pp.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve.do_sys=
call_64
      0.51            +0.0        0.54 =C2=B1  5%  perf-profile.calltrace.c=
ycles-pp.search_binary_handler.exec_binprm.bprm_execve.do_execveat_common._=
_x64_sys_execve
      0.88            +0.1        0.93 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe.execve
      0.88            +0.1        0.93 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.88            +0.1        0.93 =C2=B1  4%  perf-profile.calltrace.c=
ycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.exec=
ve
      0.89            +0.1        0.94 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.execve
      0.88            +0.1        0.93 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.execve
      0.55 =C2=B1  2%      +0.1        0.61        perf-profile.calltrace.c=
ycles-pp._cpp_skip_block_comment
      0.51            +0.1        0.58 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.build_binary_op
      0.51            +0.1        0.57        perf-profile.calltrace.cycles=
-pp.operand_equal_p
      1.01            +0.1        1.08        perf-profile.calltrace.cycles=
-pp.size_binop_loc
      0.56 =C2=B1  2%      +0.1        0.63 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.location_get_source_line
      0.62 =C2=B1  5%      +0.1        0.70 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.df_bb_refs_record
      0.64            +0.1        0.72        perf-profile.calltrace.cycles=
-pp.c_parser_declspecs
      0.87            +0.1        0.96        perf-profile.calltrace.cycles=
-pp.cfree
      0.58 =C2=B1  2%      +0.1        0.69        perf-profile.calltrace.c=
ycles-pp.layout_type
      0.83 =C2=B1  3%      +0.1        0.95 =C2=B1  9%  perf-profile.calltr=
ace.cycles-pp.linemap_location_in_system_header_p
      0.00            +0.2        0.17 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp.constrain_operands
      0.00            +0.2        0.17 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp.getenv
      0.00            +0.2        0.17 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp._cpp_handle_directive
      1.94            +0.2        2.12        perf-profile.calltrace.cycles=
-pp.malloc
      0.00            +0.2        0.19 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wai=
t_queue.poll_freewait.do_select
      0.00            +0.2        0.19 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp._raw_spin_lock_irqsave.remove_wait_queue.poll_freewait.do_select.c=
ore_sys_select
      0.87            +0.2        1.05        perf-profile.calltrace.cycles=
-pp.ggc_internal_alloc
      0.00            +0.2        0.19 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp.remove_wait_queue.poll_freewait.do_select.core_sys_select.do_psele=
ct
      0.00            +0.2        0.19 =C2=B1141%  perf-profile.calltrace.c=
ycles-pp.poll_freewait.do_select.core_sys_select.do_pselect.__x64_sys_psele=
ct6
      0.33 =C2=B1 70%      +0.2        0.53 =C2=B1  5%  perf-profile.calltr=
ace.cycles-pp.load_elf_binary.search_binary_handler.exec_binprm.bprm_execve=
.do_execveat_common
      3.59 =C2=B1  2%      +0.2        3.80        perf-profile.calltrace.c=
ycles-pp.htab_find_slot_with_hash
      0.18 =C2=B1141%      +0.2        0.40 =C2=B1 73%  perf-profile.calltr=
ace.cycles-pp.do_select.core_sys_select.do_pselect.__x64_sys_pselect6.do_sy=
scall_64
      0.19 =C2=B1141%      +0.2        0.41 =C2=B1 72%  perf-profile.calltr=
ace.cycles-pp.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
      0.19 =C2=B1141%      +0.2        0.41 =C2=B1 72%  perf-profile.calltr=
ace.cycles-pp.do_pselect.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
      0.19 =C2=B1141%      +0.2        0.41 =C2=B1 72%  perf-profile.calltr=
ace.cycles-pp.core_sys_select.do_pselect.__x64_sys_pselect6.do_syscall_64.e=
ntry_SYSCALL_64_after_hwframe
      1.02            +0.2        1.25 =C2=B1  3%  perf-profile.calltrace.c=
ycles-pp._cpp_lex_direct
      0.00            +0.5        0.53        perf-profile.calltrace.cycles=
-pp.wi::force_to_size
      0.00            +0.7        0.68        perf-profile.calltrace.cycles=
-pp.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_m=
m_fault.handle_mm_fault
      0.00            +0.8        0.77        perf-profile.calltrace.cycles=
-pp.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_m=
m_fault.do_user_addr_fault
      0.00            +0.8        0.79        perf-profile.calltrace.cycles=
-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_=
addr_fault.exc_page_fault
      6.09            +0.9        7.03        perf-profile.calltrace.cycles=
-pp.c_lex_with_flags
      9.49            -5.8        3.72 =C2=B1  2%  perf-profile.children.cy=
cles-pp.do_anonymous_page
     13.72            -4.3        9.38        perf-profile.children.cycles-=
pp.asm_exc_page_fault
     12.62            -3.8        8.87        perf-profile.children.cycles-=
pp.exc_page_fault
     12.57            -3.7        8.84        perf-profile.children.cycles-=
pp.do_user_addr_fault
     11.96            -3.5        8.46        perf-profile.children.cycles-=
pp.handle_mm_fault
      5.55            -3.3        2.22 =C2=B1  2%  perf-profile.children.cy=
cles-pp.vma_alloc_folio
     11.51            -3.3        8.20        perf-profile.children.cycles-=
pp.__handle_mm_fault
      5.59            -3.3        2.33 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__alloc_pages
      5.38            -3.3        2.12 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__folio_alloc
      5.26            -3.1        2.12 =C2=B1  2%  perf-profile.children.cy=
cles-pp.get_page_from_freelist
     13.50 =C2=B1  2%      -2.0       11.47 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_syscall_64
     13.53            -2.0       11.50 =C2=B1  2%  perf-profile.children.cy=
cles-pp.entry_SYSCALL_64_after_hwframe
      3.18 =C2=B1  4%      -2.0        1.19 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.native_queued_spin_lock_slowpath
      2.51 =C2=B1  2%      -1.6        0.87 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.rmqueue
      3.27 =C2=B1  2%      -1.6        1.67 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_exit
      3.10 =C2=B1  2%      -1.6        1.50 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.exit_mm
      3.27 =C2=B1  2%      -1.6        1.67 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__x64_sys_exit_group
      3.27 =C2=B1  2%      -1.6        1.67 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_group_exit
      3.20 =C2=B1  2%      -1.6        1.63 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__mmput
      3.20 =C2=B1  2%      -1.6        1.63 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.exit_mmap
      2.38 =C2=B1  3%      -1.5        0.89 =C2=B1  6%  perf-profile.childr=
en.cycles-pp._raw_spin_lock
      2.75            -1.5        1.26        perf-profile.children.cycles-=
pp.__mem_cgroup_charge
      2.38 =C2=B1  2%      -1.4        0.94 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.zap_pte_range
      2.39 =C2=B1  2%      -1.4        0.96 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.zap_pmd_range
      2.40 =C2=B1  2%      -1.4        0.98 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.unmap_page_range
      2.43 =C2=B1  2%      -1.4        1.01 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.unmap_vmas
      1.91 =C2=B1  3%      -1.3        0.58 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.rmqueue_bulk
      2.27 =C2=B1  2%      -1.2        1.08 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.tlb_batch_pages_flush
      2.21 =C2=B1  2%      -1.2        1.05 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.release_pages
      2.08            -1.1        1.00        perf-profile.children.cycles-=
pp.charge_memcg
      1.35 =C2=B1  2%      -0.8        0.58 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.free_unref_page_list
      1.23 =C2=B1  3%      -0.7        0.56 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.free_pcppages_bulk
      1.82            -0.6        1.21        perf-profile.children.cycles-=
pp.make_node
      1.34 =C2=B1  7%      -0.6        0.75 =C2=B1 26%  perf-profile.childr=
en.cycles-pp._raw_spin_lock_irqsave
      2.17 =C2=B1  2%      -0.6        1.59        perf-profile.children.cy=
cles-pp.build_decl
      0.93            -0.6        0.38 =C2=B1  2%  perf-profile.children.cy=
cles-pp.folio_batch_move_lru
      0.91            -0.6        0.36 =C2=B1  2%  perf-profile.children.cy=
cles-pp.folio_add_lru
      0.99            -0.5        0.48        perf-profile.children.cycles-=
pp.try_charge_memcg
      1.03            -0.5        0.52        perf-profile.children.cycles-=
pp.__list_del_entry_valid
      0.57 =C2=B1  2%      -0.4        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.folio_lruvec_lock_irqsave
      0.76            -0.4        0.40 =C2=B1  3%  perf-profile.children.cy=
cles-pp.__free_one_page
      0.88            -0.3        0.55 =C2=B1  4%  perf-profile.children.cy=
cles-pp.error_entry
      0.51 =C2=B1  2%      -0.3        0.18 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.get_mem_cgroup_from_mm
      0.80            -0.3        0.50 =C2=B1  4%  perf-profile.children.cy=
cles-pp.sync_regs
      1.32 =C2=B1  2%      -0.3        1.05 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.tlb_finish_mmu
      0.68            -0.3        0.42 =C2=B1  2%  perf-profile.children.cy=
cles-pp.native_irq_return_iret
      2.61            -0.2        2.36        perf-profile.children.cycles-=
pp.asm_sysvec_apic_timer_interrupt
      2.44            -0.2        2.20        perf-profile.children.cycles-=
pp.sysvec_apic_timer_interrupt
      1.87            -0.2        1.63        perf-profile.children.cycles-=
pp.__sysvec_apic_timer_interrupt
      1.84            -0.2        1.61        perf-profile.children.cycles-=
pp.hrtimer_interrupt
      0.44 =C2=B1  2%      -0.2        0.22 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__mod_lruvec_page_state
      0.49            -0.2        0.28 =C2=B1  3%  perf-profile.children.cy=
cles-pp.tree_cons
      0.33 =C2=B1  2%      -0.2        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.page_add_new_anon_rmap
      1.57            -0.2        1.39        perf-profile.children.cycles-=
pp.__hrtimer_run_queues
      0.36            -0.2        0.18 =C2=B1  2%  perf-profile.children.cy=
cles-pp.lru_add_fn
      1.18 =C2=B1  2%      -0.2        1.00 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__do_munmap
      2.74 =C2=B1  2%      -0.2        2.58 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.elf_read
      0.92 =C2=B1  3%      -0.2        0.75 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.unmap_region
      0.83 =C2=B1 12%      -0.2        0.67 =C2=B1 33%  perf-profile.childr=
en.cycles-pp.core_sys_select
      0.84 =C2=B1 12%      -0.2        0.67 =C2=B1 33%  perf-profile.childr=
en.cycles-pp.__x64_sys_pselect6
      0.84 =C2=B1 12%      -0.2        0.67 =C2=B1 33%  perf-profile.childr=
en.cycles-pp.do_pselect
      0.82 =C2=B1 12%      -0.2        0.66 =C2=B1 34%  perf-profile.childr=
en.cycles-pp.do_select
      0.72 =C2=B1 13%      -0.2        0.57 =C2=B1 35%  perf-profile.childr=
en.cycles-pp.poll_freewait
      0.70 =C2=B1 12%      -0.2        0.55 =C2=B1 35%  perf-profile.childr=
en.cycles-pp.remove_wait_queue
      0.46            -0.2        0.31 =C2=B1  4%  perf-profile.children.cy=
cles-pp.page_remove_rmap
      0.28 =C2=B1  2%      -0.2        0.13        perf-profile.children.cy=
cles-pp.__mod_lruvec_state
      0.33 =C2=B1  2%      -0.2        0.18        perf-profile.children.cy=
cles-pp.cgraph_node::create
      0.35 =C2=B1 18%      -0.1        0.21 =C2=B1 15%  perf-profile.childr=
en.cycles-pp.pselect
      0.91 =C2=B1  2%      -0.1        0.76 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__vm_munmap
      0.78 =C2=B1  3%      -0.1        0.64 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__munmap
      0.85 =C2=B1  2%      -0.1        0.71 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__x64_sys_munmap
      1.29 =C2=B1  2%      -0.1        1.16 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.tick_sched_timer
      0.60            -0.1        0.47        perf-profile.children.cycles-=
pp.allocate_struct_function
      1.17 =C2=B1  2%      -0.1        1.04        perf-profile.children.cy=
cles-pp.tick_sched_handle
      0.23 =C2=B1  2%      -0.1        0.10        perf-profile.children.cy=
cles-pp.__mod_node_page_state
      0.67            -0.1        0.54        perf-profile.children.cycles-=
pp.build_function_type
      2.64            -0.1        2.52        perf-profile.children.cycles-=
pp.do_filp_open
      2.63            -0.1        2.51        perf-profile.children.cycles-=
pp.path_openat
      1.15            -0.1        1.03        perf-profile.children.cycles-=
pp.update_process_times
      0.84            -0.1        0.72        perf-profile.children.cycles-=
pp.scheduler_tick
      0.57            -0.1        0.45 =C2=B1  2%  perf-profile.children.cy=
cles-pp.linemap_enter_macro
      0.65            -0.1        0.54        perf-profile.children.cycles-=
pp.task_tick_fair
      0.31            -0.1        0.20 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__perf_sw_event
      1.78            -0.1        1.69        perf-profile.children.cycles-=
pp.type_hash_canon
      0.37            -0.1        0.28        perf-profile.children.cycles-=
pp.build1
      1.41 =C2=B1  4%      -0.1        1.32        perf-profile.children.cy=
cles-pp.read
      2.90            -0.1        2.82        perf-profile.children.cycles-=
pp.__x64_sys_openat
      2.89            -0.1        2.81        perf-profile.children.cycles-=
pp.do_sys_openat2
      0.24            -0.1        0.16 =C2=B1  2%  perf-profile.children.cy=
cles-pp.___perf_sw_event
      0.15            -0.1        0.07 =C2=B1  6%  perf-profile.children.cy=
cles-pp.free_pages_and_swap_cache
      0.40 =C2=B1  3%      -0.1        0.32        perf-profile.children.cy=
cles-pp.build_call_array_loc
      0.07 =C2=B1  6%      -0.1        0.00        perf-profile.children.cy=
cles-pp.mem_cgroup_charge_statistics
      0.07 =C2=B1 12%      -0.1        0.00        perf-profile.children.cy=
cles-pp.__cgroup_throttle_swaprate
      0.26 =C2=B1  4%      -0.1        0.18 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.update_cfs_group
      0.20 =C2=B1  2%      -0.1        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__mod_memcg_lruvec_state
      0.14            -0.1        0.07 =C2=B1 11%  perf-profile.children.cy=
cles-pp.free_swap_cache
      0.13            -0.1        0.06        perf-profile.children.cycles-=
pp.page_counter_try_charge
      0.07            -0.1        0.00        perf-profile.children.cycles-=
pp.mem_cgroup_update_lru_size
      0.07            -0.1        0.00        perf-profile.children.cycles-=
pp.__mod_zone_page_state
      0.07            -0.1        0.00        perf-profile.children.cycles-=
pp.free_unref_page_commit
      1.45            -0.1        1.38 =C2=B1  2%  perf-profile.children.cy=
cles-pp.link_path_walk
      0.56 =C2=B1  2%      -0.1        0.50 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.wp_page_copy
      0.51 =C2=B1  2%      -0.1        0.44        perf-profile.children.cy=
cles-pp.lookup_name
      1.53 =C2=B1  7%      -0.1        1.47 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.vfs_read
      1.05            -0.1        0.99 =C2=B1  2%  perf-profile.children.cy=
cles-pp.walk_component
      0.06            -0.1        0.00        perf-profile.children.cycles-=
pp.__page_set_anon_rmap
      0.15 =C2=B1  5%      -0.1        0.09 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__list_add_valid
      0.13 =C2=B1  3%      -0.1        0.07 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.build_string
      0.30 =C2=B1  2%      -0.1        0.24 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.add_stmt
      0.06 =C2=B1  8%      -0.1        0.00        perf-profile.children.cy=
cles-pp.down_read_trylock
      0.06 =C2=B1  8%      -0.1        0.00        perf-profile.children.cy=
cles-pp.blk_cgroup_congested
      0.12            -0.1        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.build_tree_list
      1.87            -0.1        1.81        perf-profile.children.cycles-=
pp.open64
      1.53 =C2=B1  7%      -0.1        1.47 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.ksys_read
      0.47 =C2=B1  2%      -0.1        0.42        perf-profile.children.cy=
cles-pp.build2
      0.41 =C2=B1  2%      -0.1        0.36 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.pushdecl
      0.05            -0.1        0.00        perf-profile.children.cycles-=
pp.security_file_open
      0.05            -0.1        0.00        perf-profile.children.cycles-=
pp.output_addr_const
      0.05            -0.1        0.00        perf-profile.children.cycles-=
pp.apparmor_file_open
      0.05            -0.1        0.00        perf-profile.children.cycles-=
pp.enqueue_hrtimer
      0.05            -0.1        0.00        perf-profile.children.cycles-=
pp.errseq_sample
      0.05            -0.1        0.00        perf-profile.children.cycles-=
pp.uncharge_folio
      0.48 =C2=B1  2%      -0.0        0.43 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.dput
      0.12 =C2=B1  4%      -0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp._raw_spin_unlock_irqrestore
      0.11 =C2=B1  4%      -0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.cgroup_rstat_updated
      0.48 =C2=B1  2%      -0.0        0.44        perf-profile.children.cy=
cles-pp.exit_to_user_mode_loop
      0.55 =C2=B1  2%      -0.0        0.51 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.exit_to_user_mode_prepare
      1.22 =C2=B1  3%      -0.0        1.18        perf-profile.children.cy=
cles-pp.filemap_read
      0.10 =C2=B1  9%      -0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__count_memcg_events
      0.59            -0.0        0.55 =C2=B1  3%  perf-profile.children.cy=
cles-pp.d_alloc_parallel
      0.11            -0.0        0.07 =C2=B1  6%  perf-profile.children.cy=
cles-pp.vmacache_find
      0.36 =C2=B1  2%      -0.0        0.32 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.task_work_run
      0.20 =C2=B1 51%      -0.0        0.16 =C2=B1 91%  perf-profile.childr=
en.cycles-pp.__mutex_lock
      0.15 =C2=B1  3%      -0.0        0.11 =C2=B1 25%  perf-profile.childr=
en.cycles-pp.__clone
      0.05            -0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.copy_p4d_range
      0.07 =C2=B1  7%      -0.0        0.03 =C2=B1 70%  perf-profile.childr=
en.cycles-pp.__pte_alloc
      0.03 =C2=B1 70%      -0.0        0.00        perf-profile.children.cy=
cles-pp.create_tmp_var_raw
      0.03 =C2=B1 70%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__tlb_remove_page_size
      0.03 =C2=B1 70%      -0.0        0.00        perf-profile.children.cy=
cles-pp.rwsem_spin_on_owner
      0.03 =C2=B1 70%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__update_load_avg_se
      0.91 =C2=B1  3%      -0.0        0.88        perf-profile.children.cy=
cles-pp._copy_to_iter
      0.87 =C2=B1  3%      -0.0        0.84        perf-profile.children.cy=
cles-pp.copyout
      0.34            -0.0        0.31        perf-profile.children.cycles-=
pp.ht_lookup_with_hash
      0.16 =C2=B1  5%      -0.0        0.13        perf-profile.children.cy=
cles-pp.security_file_free
      0.16 =C2=B1  3%      -0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.apparmor_file_free_security
      0.63            -0.0        0.61 =C2=B1  3%  perf-profile.children.cy=
cles-pp.__lookup_slow
      0.18            -0.0        0.15 =C2=B1  3%  perf-profile.children.cy=
cles-pp.find_vma
      0.18 =C2=B1 10%      -0.0        0.16 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.copy_node
      0.27 =C2=B1  4%      -0.0        0.24 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__fput
      0.24 =C2=B1  3%      -0.0        0.21 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.dentry_kill
      0.18 =C2=B1  2%      -0.0        0.15        perf-profile.children.cy=
cles-pp.irqentry_exit_to_user_mode
      0.17 =C2=B1  2%      -0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.lockref_put_or_lock
      0.13            -0.0        0.10 =C2=B1  4%  perf-profile.children.cy=
cles-pp.ggc_internal_cleared_alloc
      0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.shallow_copy_rtx
      0.09 =C2=B1  5%      -0.0        0.06        perf-profile.children.cy=
cles-pp.lru_add_drain
      0.08            -0.0        0.05 =C2=B1  8%  perf-profile.children.cy=
cles-pp.__mem_cgroup_uncharge_list
      0.08            -0.0        0.05 =C2=B1  8%  perf-profile.children.cy=
cles-pp.__irqentry_text_end
      0.06 =C2=B1 13%      -0.0        0.03 =C2=B1 70%  perf-profile.childr=
en.cycles-pp.__lock_parent
      0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp._raw_spin_trylock
      0.25 =C2=B1  3%      -0.0        0.22 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.security_file_alloc
      0.96 =C2=B1  2%      -0.0        0.93        perf-profile.children.cy=
cles-pp.copy_user_enhanced_fast_string
      0.92 =C2=B1  3%      -0.0        0.89        perf-profile.children.cy=
cles-pp.copy_page_to_iter
      2.57            -0.0        2.54 =C2=B1  2%  perf-profile.children.cy=
cles-pp._cpp_create_definition
      0.25            -0.0        0.23 =C2=B1  3%  perf-profile.children.cy=
cles-pp.vma_interval_tree_insert
      0.19            -0.0        0.17 =C2=B1  2%  perf-profile.children.cy=
cles-pp.build_stmt
      0.07 =C2=B1  6%      -0.0        0.05 =C2=B1 74%  perf-profile.childr=
en.cycles-pp.target_environment
      0.19 =C2=B1  2%      -0.0        0.16 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.apparmor_file_alloc_security
      0.23 =C2=B1 45%      -0.0        0.20 =C2=B1 67%  perf-profile.childr=
en.cycles-pp.pipe_read
      0.21 =C2=B1 47%      -0.0        0.19 =C2=B1 69%  perf-profile.childr=
en.cycles-pp.osq_lock
      0.07 =C2=B1  6%      -0.0        0.05        perf-profile.children.cy=
cles-pp.ktime_get_update_offsets_now
      0.07 =C2=B1  6%      -0.0        0.05        perf-profile.children.cy=
cles-pp.up_read
      0.06 =C2=B1  8%      -0.0        0.03 =C2=B1 70%  perf-profile.childr=
en.cycles-pp.timerqueue_del
      0.06            -0.0        0.04 =C2=B1 71%  perf-profile.children.cy=
cles-pp.__wake_up_common
      0.07 =C2=B1 25%      -0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.run_builtin
      0.07 =C2=B1 20%      -0.0        0.05 =C2=B1 72%  perf-profile.childr=
en.cycles-pp.__libc_start_main
      0.65            -0.0        0.63        perf-profile.children.cycles-=
pp.__alloc_file
      0.36 =C2=B1  2%      -0.0        0.33 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.step_into
      0.67            -0.0        0.65        perf-profile.children.cycles-=
pp.alloc_empty_file
      0.45            -0.0        0.43        perf-profile.children.cycles-=
pp.lookup_fast
      0.43            -0.0        0.41        perf-profile.children.cycles-=
pp.d_alloc
      0.32            -0.0        0.30 =C2=B1  3%  perf-profile.children.cy=
cles-pp.__vma_adjust
      0.30 =C2=B1  8%      -0.0        0.28 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.check
      0.19 =C2=B1  2%      -0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.update_load_avg
      0.07 =C2=B1  6%      -0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.make_ssa_name_fn
      0.08            -0.0        0.06        perf-profile.children.cycles-=
pp.lru_add_drain_cpu
      0.06 =C2=B1 19%      -0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.cmd_record
      0.06 =C2=B1 19%      -0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.__cmd_record
      0.10 =C2=B1  8%      -0.0        0.08 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.rtx_alloc
      0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.rwsem_down_write_slowpath
      0.24            -0.0        0.22 =C2=B1  2%  perf-profile.children.cy=
cles-pp.fold_build2_loc
      0.28            -0.0        0.27        perf-profile.children.cycles-=
pp.do_open
      0.19            -0.0        0.17 =C2=B1  2%  perf-profile.children.cy=
cles-pp.do_dentry_open
      0.18 =C2=B1  2%      -0.0        0.17 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.select_task_rq_fair
      0.13            -0.0        0.11 =C2=B1  4%  perf-profile.children.cy=
cles-pp.lockref_get_not_dead
      0.13 =C2=B1  3%      -0.0        0.11        perf-profile.children.cy=
cles-pp.build_pointer_type_for_mode
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.arch_scale_freq_tick
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.user_path_at_empty
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp._cpp_parse_expr
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.string_concat_db::record_string_concatenation
      0.03 =C2=B1 70%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.mm_init
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.build4
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.policy_node
      0.03 =C2=B1 70%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.enqueue_task_fair
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.record__pushfn
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.__libc_write
      0.03 =C2=B1 70%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.up_write
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.memcg_check_events
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.make_edge
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.plus_constant
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.split_edge
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.scev_initialize
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.children.cy=
cles-pp.bitmap_ior_into
      0.35            -0.0        0.34 =C2=B1  3%  perf-profile.children.cy=
cles-pp.next_uptodate_page
      0.14 =C2=B1  3%      -0.0        0.13 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.update_sg_wakeup_stats
      0.14 =C2=B1  3%      -0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__legitimize_path
      0.08            -0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.c_add_case_label
      0.15 =C2=B1  3%      -0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.try_to_unlazy
      0.15 =C2=B1  3%      -0.0        0.14 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.find_idlest_group
      0.40 =C2=B1  3%      -0.0        0.38 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.syscall_exit_to_user_mode
      0.33 =C2=B1  2%      -0.0        0.31        perf-profile.children.cy=
cles-pp.__split_vma
      0.25            -0.0        0.24 =C2=B1  3%  perf-profile.children.cy=
cles-pp.__schedule
      0.18            -0.0        0.17 =C2=B1  2%  perf-profile.children.cy=
cles-pp.update_curr
      0.07            -0.0        0.06 =C2=B1  8%  perf-profile.children.cy=
cles-pp.handle_pte_fault
      0.17 =C2=B1  7%      -0.0        0.16 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.vfs_write
      0.16 =C2=B1  7%      -0.0        0.15 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.ksys_write
      0.13 =C2=B1  3%      -0.0        0.12        perf-profile.children.cy=
cles-pp.build_pointer_type
      0.12 =C2=B1  3%      -0.0        0.11        perf-profile.children.cy=
cles-pp.terminate_walk
      0.11 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__might_sleep
      0.11 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.perf_mux_hrtimer_handler
      0.08            -0.0        0.07 =C2=B1 14%  perf-profile.children.cy=
cles-pp.irqtime_account_irq
      0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.rwsem_optimistic_spin
      0.10 =C2=B1  9%      -0.0        0.09 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.generic_perform_write
      0.69            -0.0        0.68        perf-profile.children.cycles-=
pp.mmap_region
      0.32            -0.0        0.31        perf-profile.children.cycles-=
pp.__d_lookup_rcu
      0.16            -0.0        0.15 =C2=B1  6%  perf-profile.children.cy=
cles-pp.find_idlest_cpu
      0.22 =C2=B1  2%      -0.0        0.21 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.schedule
      0.21 =C2=B1  2%      -0.0        0.20 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.copy_page
      0.19 =C2=B1  2%      -0.0        0.18 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.elf_map
      0.17 =C2=B1  2%      -0.0        0.16 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.filemap_get_pages
      0.17 =C2=B1  5%      -0.0        0.16 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.build_qualified_type
      0.16 =C2=B1  2%      -0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.filemap_get_read_batch
      0.14            -0.0        0.13        perf-profile.children.cycles-=
pp.__dentry_kill
      0.13            -0.0        0.12        perf-profile.children.cycles-=
pp.build_external_ref
      0.11 =C2=B1  7%      -0.0        0.10 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.generic_file_write_iter
      0.07            -0.0        0.06        perf-profile.children.cycles-=
pp.update_type_inheritance_graph
      0.07 =C2=B1  7%      -0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.ktime_get
      0.12            -0.0        0.11        perf-profile.children.cycles-=
pp.load_elf_interp
      0.06            -0.0        0.05        perf-profile.children.cycles-=
pp._cpp_stack_include
      0.06            -0.0        0.05        perf-profile.children.cycles-=
pp.update_rq_clock
      0.46            -0.0        0.45        perf-profile.children.cycles-=
pp.ksys_mmap_pgoff
      0.21 =C2=B1  3%      -0.0        0.20        perf-profile.children.cy=
cles-pp.__close
      0.23 =C2=B1  3%      -0.0        0.22 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.elf_create_section
      0.10            -0.0        0.09 =C2=B1  5%  perf-profile.children.cy=
cles-pp.sched_exec
      0.11 =C2=B1  4%      -0.0        0.10 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__generic_file_write_iter
      0.09            -0.0        0.08 =C2=B1  5%  perf-profile.children.cy=
cles-pp.push_stmt_list
      0.09            -0.0        0.08 =C2=B1  5%  perf-profile.children.cy=
cles-pp.build_type_inheritance_graph
      0.07 =C2=B1  6%      -0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.down_read
      0.07 =C2=B1  6%      -0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.hard_function_value
      0.10 =C2=B1  4%      -0.0        0.09        perf-profile.children.cy=
cles-pp.rcu_sched_clock_irq
      0.09 =C2=B1  5%      -0.0        0.08        perf-profile.children.cy=
cles-pp.write
      0.07            -0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.__mmdrop
      0.07            -0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.vma_merge
      0.08 =C2=B1  6%      -0.0        0.07        perf-profile.children.cy=
cles-pp.vfs_fstat
      0.07            -0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.finish_task_switch
      0.07            -0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.do_wait
      0.06            -0.0        0.05 =C2=B1  8%  perf-profile.children.cy=
cles-pp._raw_spin_lock_irq
      0.06            -0.0        0.05 =C2=B1  8%  perf-profile.children.cy=
cles-pp.get_zeroed_page
      0.43            -0.0        0.42 =C2=B1  4%  perf-profile.children.cy=
cles-pp.kernel_clone
      0.34            -0.0        0.33 =C2=B1  4%  perf-profile.children.cy=
cles-pp.__do_sys_clone
      0.26 =C2=B1  3%      -0.0        0.25        perf-profile.children.cy=
cles-pp.open_last_lookups
      0.16 =C2=B1  3%      -0.0        0.15 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__slab_free
      0.13 =C2=B1  3%      -0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.unlink_file_vma
      0.08 =C2=B1 11%      -0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.tick_sched_do_timer
      0.08 =C2=B1  5%      -0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
      0.18            -0.0        0.18 =C2=B1  2%  perf-profile.children.cy=
cles-pp.vma_link
      0.12 =C2=B1  3%      -0.0        0.12        perf-profile.children.cy=
cles-pp.__get_user_pages_remote
      0.12 =C2=B1  3%      -0.0        0.12        perf-profile.children.cy=
cles-pp.__get_user_pages
      0.10            -0.0        0.10 =C2=B1  4%  perf-profile.children.cy=
cles-pp.vma_interval_tree_remove
      0.10            -0.0        0.10 =C2=B1  4%  perf-profile.children.cy=
cles-pp.try_to_wake_up
      0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__x64_sys_vfork
      0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.wake_up_new_task
      0.07 =C2=B1  6%      -0.0        0.07        perf-profile.children.cy=
cles-pp.check_cpu_stall
      0.07 =C2=B1  6%      -0.0        0.07        perf-profile.children.cy=
cles-pp.slab_pre_alloc_hook
      0.07 =C2=B1  6%      -0.0        0.07        perf-profile.children.cy=
cles-pp.__memcg_kmem_charge_page
      0.08 =C2=B1 10%      -0.0        0.08 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.__wake_up_common_lock
      0.07            -0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.finish_record_layout
      0.07            -0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.do_faccessat
      0.07            -0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.copy_string_kernel
      0.07            -0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.finish_declspecs
      0.06 =C2=B1  7%      -0.0        0.06        perf-profile.children.cy=
cles-pp.may_open
      0.07 =C2=B1  6%      -0.0        0.07 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.get_alias_set
      0.06 =C2=B1  7%      -0.0        0.06        perf-profile.children.cy=
cles-pp.cgraph_edge::rebuild_edges
      0.06            -0.0        0.06 =C2=B1  8%  perf-profile.children.cy=
cles-pp.touch_atime
      0.02 =C2=B1141%      -0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.record__mmap_read_evlist
      0.17 =C2=B1  2%      -0.0        0.16 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__x64_sys_mprotect
      0.13            -0.0        0.13 =C2=B1  3%  perf-profile.children.cy=
cles-pp.get_arg_page
      0.12 =C2=B1  8%      -0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.cleanup_tree_cfg
      0.08 =C2=B1  6%      -0.0        0.07 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.wait4
      0.05 =C2=B1  8%      -0.0        0.05        perf-profile.children.cy=
cles-pp.xas_start
      0.06 =C2=B1  8%      -0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__get_free_pages
      0.06 =C2=B1  8%      -0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.cgraph_node::create_edge
      0.05 =C2=B1  8%      -0.0        0.05        perf-profile.children.cy=
cles-pp.alloc_bprm
      0.05 =C2=B1  8%      -0.0        0.05        perf-profile.children.cy=
cles-pp.gimple_copy
      0.27            -0.0        0.26        perf-profile.children.cycles-=
pp.__do_sys_newstat
      0.26            -0.0        0.25 =C2=B1  3%  perf-profile.children.cy=
cles-pp.set_source_range
      0.31 =C2=B1  2%      +0.0        0.31 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.copy_process
      0.29            +0.0        0.29        perf-profile.children.cycles-=
pp.build_function_call_vec
      0.24 =C2=B1  3%      +0.0        0.24 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.run_ksoftirqd
      0.24 =C2=B1  3%      +0.0        0.24 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.free_pgtables
      0.22 =C2=B1  3%      +0.0        0.22        perf-profile.children.cy=
cles-pp.fold_convert_loc
      0.16 =C2=B1  2%      +0.0        0.16 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.do_mprotect_pkey
      0.14            +0.0        0.14 =C2=B1  5%  perf-profile.children.cy=
cles-pp.mprotect_fixup
      0.14 =C2=B1 12%      +0.0        0.14 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.main
      0.11            +0.0        0.11        perf-profile.children.cycles-=
pp.perf_iterate_sb
      0.11            +0.0        0.11        perf-profile.children.cycles-=
pp.__do_sys_newfstat
      0.10 =C2=B1  4%      +0.0        0.10 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.setlocale
      0.09            +0.0        0.09        perf-profile.children.cycles-=
pp.pte_alloc_one
      0.09            +0.0        0.09        perf-profile.children.cycles-=
pp.inode_permission
      0.09            +0.0        0.09        perf-profile.children.cycles-=
pp.sizeof_pointer_memaccess_warning
      0.08 =C2=B1  5%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__xstat64
      0.08            +0.0        0.08        perf-profile.children.cycles-=
pp.warning_at
      0.08 =C2=B1  5%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.dup_task_struct
      0.08 =C2=B1  6%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.flush_tlb_mm_range
      0.07 =C2=B1  6%      +0.0        0.07 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.compute_fn_summary
      0.07            +0.0        0.07 =C2=B1 11%  perf-profile.children.cy=
cles-pp.kernel_wait4
      0.08 =C2=B1 10%      +0.0        0.08        perf-profile.children.cy=
cles-pp.execute_fixup_cfg
      0.08 =C2=B1 12%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.compute_may_aliases
      0.07            +0.0        0.07        perf-profile.children.cycles-=
pp.mark_dfs_back_edges
      0.06            +0.0        0.06        perf-profile.children.cycles-=
pp.down_write
      0.06            +0.0        0.06        perf-profile.children.cycles-=
pp.mark_exp_read
      0.05 =C2=B1  8%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.lookup_open
      0.06            +0.0        0.06        perf-profile.children.cycles-=
pp.finish_function
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.push_scope
      0.06            +0.0        0.06        perf-profile.children.cycles-=
pp.__do_sys_brk
      0.06 =C2=B1  7%      +0.0        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.et_below
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__close_nocancel
      0.06            +0.0        0.06        perf-profile.children.cycles-=
pp.split_all_insns
      0.05 =C2=B1  8%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.finish_fault
      0.05 =C2=B1  8%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.ptep_clear_flush
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.force_fit_type
      0.05 =C2=B1  8%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.alloc_thread_stack_node
      0.05 =C2=B1  8%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.may_trap_p_1
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.fput
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.c_parser_next_tokens_start_declaration
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.xas_find
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.compute_record_mode
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.copy_page_range
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.folio_memcg_lock
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.pick_next_task_fair
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.do_brk_flags
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.c_finish_return
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.rest_of_decl_compilation
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.filp_close
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.find_comparison_dom_walker::before_dom_children
      0.05            +0.0        0.05        perf-profile.children.cycles-=
pp.shorten_binary_op
      0.04 =C2=B1 71%      +0.0        0.04 =C2=B1 71%  perf-profile.childr=
en.cycles-pp.pipe_write
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.perf_mmap__push
      0.03 =C2=B1 70%      +0.0        0.03 =C2=B1 70%  perf-profile.childr=
en.cycles-pp.useless_type_conversion_p
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.pipe_poll
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.schedule_hrtimeout_range_clock
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.validate_branch
      0.03 =C2=B1 70%      +0.0        0.03 =C2=B1 70%  perf-profile.childr=
en.cycles-pp.set_reg_attrs_for_decl_rtl
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.childr=
en.cycles-pp.update_ssa
      0.10 =C2=B1  8%      +0.0        0.10        perf-profile.children.cy=
cles-pp.xas_load
      0.10 =C2=B1  8%      +0.0        0.10        perf-profile.children.cy=
cles-pp.finish_struct
      0.29            +0.0        0.29 =C2=B1  2%  perf-profile.children.cy=
cles-pp.vfs_fstatat
      0.27 =C2=B1  4%      +0.0        0.28 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.smpboot_thread_fn
      0.10            +0.0        0.10 =C2=B1  4%  perf-profile.children.cy=
cles-pp.__vfork
      0.10 =C2=B1  4%      +0.0        0.10 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.ira_init_register_move_cost
      0.24            +0.0        0.24 =C2=B1  3%  perf-profile.children.cy=
cles-pp.build3
      0.14            +0.0        0.14 =C2=B1  3%  perf-profile.children.cy=
cles-pp.cgraph_node::remove
      0.15 =C2=B1  3%      +0.0        0.15        perf-profile.children.cy=
cles-pp.__fxstat64
      0.13            +0.0        0.13 =C2=B1  3%  perf-profile.children.cy=
cles-pp.strncpy_from_user
      0.13            +0.0        0.13 =C2=B1  3%  perf-profile.children.cy=
cles-pp.dup_mm
      0.08 =C2=B1  6%      +0.0        0.08        perf-profile.children.cy=
cles-pp.wi::mul_internal
      0.07 =C2=B1  6%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.lra
      0.06 =C2=B1  7%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.reg_scan
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.file_free_rcu
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.do_open_execat
      0.06 =C2=B1  7%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.df_grow_reg_info
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.children.cy=
cles-pp.cpp_spell_token
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__x64_sys_close
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__get_obj_cgroup_from_memcg
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.children.cy=
cles-pp.expand_call
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.delete_basic_block
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.children.cy=
cles-pp.flush_tlb_func
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.children.cy=
cles-pp.schedule_block
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.children.cy=
cles-pp.gimple_resimplify2
      0.12 =C2=B1  3%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.get_inner_reference
      0.10 =C2=B1  9%      +0.0        0.11 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.__check_object_size
      0.10 =C2=B1  4%      +0.0        0.10        perf-profile.children.cy=
cles-pp.__open64_nocancel
      0.09 =C2=B1  5%      +0.0        0.09        perf-profile.children.cy=
cles-pp.page_add_file_rmap
      0.09 =C2=B1  5%      +0.0        0.09 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.simple_lookup
      0.08 =C2=B1  5%      +0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.post_order_compute
      0.07            +0.0        0.07 =C2=B1  6%  perf-profile.children.cy=
cles-pp.eliminate_dom_walker::before_dom_children
      0.07 =C2=B1  7%      +0.0        0.07        perf-profile.children.cy=
cles-pp._copy_from_user
      0.07 =C2=B1  7%      +0.0        0.07        perf-profile.children.cy=
cles-pp.remove_vma
      0.07 =C2=B1  7%      +0.0        0.07        perf-profile.children.cy=
cles-pp.dom_opt_dom_walker::before_dom_children
      0.06            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.memcpy(a)plt
      0.06            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.lvalue_p
      0.07 =C2=B1 14%      +0.0        0.07        perf-profile.children.cy=
cles-pp.ipa_icf::sem_function::init
      0.06            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.make_pointer_declarator
      0.06            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.brk
      0.06            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.bitmap_clear_bit
      0.06            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.df_analyze
      0.06            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.estimate_num_insns
      0.06 =C2=B1 13%      +0.0        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.regstat_compute_calls_crossed
      0.28 =C2=B1  3%      +0.0        0.29 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.filename_lookup
      0.28 =C2=B1  3%      +0.0        0.29 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.path_lookupat
      0.16 =C2=B1  6%      +0.0        0.16 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.update_stmt_operands
      0.97            +0.0        0.97 =C2=B1  3%  perf-profile.children.cy=
cles-pp.do_fault
      0.78            +0.0        0.78        perf-profile.children.cycles-=
pp.do_mmap
      0.81            +0.0        0.82        perf-profile.children.cycles-=
pp.vm_mmap_pgoff
      0.14 =C2=B1  3%      +0.0        0.15        perf-profile.children.cy=
cles-pp.remove_unused_locals
      0.13 =C2=B1  9%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.rewrite_update_dom_walker::before_dom_children
      0.10            +0.0        0.11 =C2=B1 11%  perf-profile.children.cy=
cles-pp.page_remove_file_rmap
      0.10 =C2=B1  4%      +0.0        0.10 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.vn_reference_lookup
      0.08 =C2=B1  6%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__d_add
      0.08 =C2=B1  6%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.__might_fault
      0.07 =C2=B1  6%      +0.0        0.08        perf-profile.children.cy=
cles-pp.c_common_truthvalue_conversion
      0.05            +0.0        0.06 =C2=B1  8%  perf-profile.children.cy=
cles-pp.build_component_ref
      0.05 =C2=B1  8%      +0.0        0.06        perf-profile.children.cy=
cles-pp.count
      0.05 =C2=B1  8%      +0.0        0.06        perf-profile.children.cy=
cles-pp.excess_precision_type
      0.05 =C2=B1  8%      +0.0        0.06        perf-profile.children.cy=
cles-pp.sd_add_dep
      0.05 =C2=B1  8%      +0.0        0.06        perf-profile.children.cy=
cles-pp.bitmap_bit_p
      0.12 =C2=B1  3%      +0.0        0.13        perf-profile.children.cy=
cles-pp.walk_stmt_load_store_addr_ops
      0.12 =C2=B1  3%      +0.0        0.13        perf-profile.children.cy=
cles-pp.substitute_and_fold_engine::substitute_and_fold
      0.10 =C2=B1  4%      +0.0        0.11        perf-profile.children.cy=
cles-pp.c_parse_file
      0.10 =C2=B1  9%      +0.0        0.10 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.mark_irreducible_loops
      0.09 =C2=B1  5%      +0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp._cpp_temp_token
      0.08            +0.0        0.09 =C2=B1  5%  perf-profile.children.cy=
cles-pp.generic_simplify
      0.07            +0.0        0.08 =C2=B1  6%  perf-profile.children.cy=
cles-pp.call_rcu
      0.07            +0.0        0.08 =C2=B1 12%  perf-profile.children.cy=
cles-pp.build_asm_expr
      0.06 =C2=B1  7%      +0.0        0.07        perf-profile.children.cy=
cles-pp.const_unop
      0.07            +0.0        0.08 =C2=B1  6%  perf-profile.children.cy=
cles-pp.execute_update_addresses_taken
      0.06 =C2=B1  7%      +0.0        0.07        perf-profile.children.cy=
cles-pp.flow_loops_find
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.start_function
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.rcu_all_qs
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.simple_cst_equal
      0.07 =C2=B1 11%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.gimple_fold_stmt_to_constant_1
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.compare_tree_int
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.recompute_tree_invariant_for_addr_expr
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.lra_assign
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.children.cy=
cles-pp.protected_set_expr_location
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.lra_constraints
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.init_subregs_of_mode
      0.12 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.dup_mmap
      0.12 =C2=B1  6%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.cleanup_cfg
      0.07 =C2=B1  7%      +0.0        0.07 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.lra_remat
      0.26            +0.0        0.26        perf-profile.children.cycles-=
pp.vfs_statx
      0.28            +0.0        0.29        perf-profile.children.cycles-=
pp.convert_lvalue_to_rvalue
      0.22 =C2=B1  2%      +0.0        0.23 =C2=B1  2%  perf-profile.childr=
en.cycles-pp._cpp_pop_context
      0.22 =C2=B1  2%      +0.0        0.23 =C2=B1  2%  perf-profile.childr=
en.cycles-pp._cpp_find_file
      0.14 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.do_set_pte
      0.14            +0.0        0.15        perf-profile.children.cycles-=
pp.wide_int_binop
      0.10            +0.0        0.11        perf-profile.children.cycles-=
pp.c_token_starts_typename
      0.07 =C2=B1  6%      +0.0        0.08 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.extract_constrain_insn_cached
      0.05            +0.0        0.06        perf-profile.children.cycles-=
pp.fold_ternary_loc
      0.05            +0.0        0.06        perf-profile.children.cycles-=
pp.cgraph_node::finalize_function
      0.05            +0.0        0.06        perf-profile.children.cycles-=
pp.build_c_cast
      0.05            +0.0        0.06        perf-profile.children.cycles-=
pp.alloc_fd
      0.05            +0.0        0.06 =C2=B1 13%  perf-profile.children.cy=
cles-pp.rtx_equal_for_cselib_1
      0.05            +0.0        0.06        perf-profile.children.cycles-=
pp.sched_free_deps
      0.11            +0.0        0.12 =C2=B1  6%  perf-profile.children.cy=
cles-pp.create_elf_tables
      0.10 =C2=B1  4%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.realloc
      0.10 =C2=B1  4%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.mod_objcg_state
      0.08 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.hash_rtx_cb
      0.07            +0.0        0.08        perf-profile.children.cycles-=
pp.shorten_compare
      0.07            +0.0        0.08        perf-profile.children.cycles-=
pp.get_user_arg_ptr
      0.07            +0.0        0.08        perf-profile.children.cycles-=
pp.arch_get_unmapped_area_topdown
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.avail_exprs_stack::lookup_avail_expr
      0.62            +0.0        0.63 =C2=B1  2%  perf-profile.children.cy=
cles-pp.filemap_map_pages
      0.26            +0.0        0.27 =C2=B1  5%  perf-profile.children.cy=
cles-pp.__libc_fork
      0.22 =C2=B1  3%      +0.0        0.23        perf-profile.children.cy=
cles-pp.__d_alloc
      0.21 =C2=B1  2%      +0.0        0.22 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.check_function_arguments
      0.17            +0.0        0.18        perf-profile.children.cycles-=
pp.declspecs_add_type
      0.16 =C2=B1  2%      +0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.kmem_cache_alloc_lru
      0.15 =C2=B1  3%      +0.0        0.16 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.linemap_resolve_location
      0.16 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.memcg_slab_post_alloc_hook
      0.13 =C2=B1  6%      +0.0        0.14        perf-profile.children.cy=
cles-pp.cpp_classify_number
      0.13 =C2=B1  3%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ssa_propagation_engine::ssa_propagate
      0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.linemap_lookup
      0.10 =C2=B1  9%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.inverted_post_order_compute
      0.10 =C2=B1  9%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.rebuild_jump_labels
      0.08 =C2=B1  5%      +0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.make_location
      0.06            +0.0        0.07        perf-profile.children.cycles-=
pp.check_heap_object
      0.06 =C2=B1  7%      +0.0        0.07 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.delete_trivially_dead_insns
      0.06 =C2=B1  7%      +0.0        0.07 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.ggc_free
      0.06 =C2=B1 13%      +0.0        0.07        perf-profile.children.cy=
cles-pp.unshare_all_rtl_in_chain
      0.12 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.extract_insn
      0.66            +0.0        0.67 =C2=B1  2%  perf-profile.children.cy=
cles-pp.do_read_fault
      0.40            +0.0        0.41 =C2=B1  2%  perf-profile.children.cy=
cles-pp.fold_unary_loc
      0.19 =C2=B1  2%      +0.0        0.21 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.begin_new_exec
      0.14 =C2=B1  3%      +0.0        0.16 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ira_init
      0.14 =C2=B1  3%      +0.0        0.16 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.perf_event_mmap_event
      0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.get_attr_type
      0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.df_compact_blocks
      0.07            +0.0        0.08 =C2=B1  5%  perf-profile.children.cy=
cles-pp.unlink_anon_vmas
      0.05            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.unmapped_area_topdown
      0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.lra_final_code_change
      0.05            +0.0        0.06 =C2=B1  7%  perf-profile.children.cy=
cles-pp.__clear_user
      0.16            +0.0        0.17 =C2=B1  7%  perf-profile.children.cy=
cles-pp.type_hash_canon_hash
      0.15            +0.0        0.16 =C2=B1  2%  perf-profile.children.cy=
cles-pp.iterative_hash
      0.15 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.exec_mmap
      0.13            +0.0        0.14 =C2=B1  3%  perf-profile.children.cy=
cles-pp.rcu_cblist_dequeue
      0.14 =C2=B1  5%      +0.0        0.15 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.side_effects_p
      0.13 =C2=B1  6%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.schedule_insns
      0.12            +0.0        0.13 =C2=B1  9%  perf-profile.children.cy=
cles-pp.ferror(a)plt
      0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.place_field
      0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.max_issue
      0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.add_dependence
      0.08            +0.0        0.09 =C2=B1  5%  perf-profile.children.cy=
cles-pp.get_unmapped_area
      0.08 =C2=B1  6%      +0.0        0.09        perf-profile.children.cy=
cles-pp.wi::divmod_internal
      0.06 =C2=B1  7%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.___slab_alloc
      0.07 =C2=B1  7%      +0.0        0.08        perf-profile.children.cy=
cles-pp.get_obj_cgroup_from_current
      0.06 =C2=B1  7%      +0.0        0.08 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.rtx_equal_p
      0.06 =C2=B1  8%      +0.0        0.07        perf-profile.children.cy=
cles-pp.__entry_text_start
      0.06 =C2=B1  8%      +0.0        0.07        perf-profile.children.cy=
cles-pp.vm_unmapped_area
      0.06 =C2=B1  8%      +0.0        0.07        perf-profile.children.cy=
cles-pp.c_build_qualified_type
      0.11 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.pop_stmt_list
      0.11 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.gimplify_expr
      0.08 =C2=B1  5%      +0.0        0.10 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.dom_walker::walk
      0.06            +0.0        0.07 =C2=B1  6%  perf-profile.children.cy=
cles-pp.wi::lshift_large
      0.33 =C2=B1  2%      +0.0        0.35        perf-profile.children.cy=
cles-pp.build_null_declspecs
      0.38 =C2=B1  4%      +0.0        0.40 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.df_insn_rescan
      0.31 =C2=B1  2%      +0.0        0.33 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.kthread
      0.20 =C2=B1  2%      +0.0        0.22        perf-profile.children.cy=
cles-pp.getname_flags
      0.15            +0.0        0.17 =C2=B1  2%  perf-profile.children.cy=
cles-pp.perf_event_mmap
      0.14 =C2=B1  3%      +0.0        0.16        perf-profile.children.cy=
cles-pp.parser_build_binary_op
      0.10 =C2=B1  4%      +0.0        0.12        perf-profile.children.cy=
cles-pp.walk_tree_1
      0.09            +0.0        0.11 =C2=B1  4%  perf-profile.children.cy=
cles-pp.cpp_interpret_integer
      0.09            +0.0        0.11 =C2=B1  8%  perf-profile.children.cy=
cles-pp.build_int_cst
      0.07            +0.0        0.09 =C2=B1  5%  perf-profile.children.cy=
cles-pp.wi::zext_large
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%  perf-profile.childr=
en.cycles-pp.update_min_vruntime
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.shorten_branches
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp._cpp_get_buff
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.__rb_insert_augmented
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.lra_undo_inheritance
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.record_temporary_equivalences
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.add_wait_queue
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.int_fits_type_p
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.children.cy=
cles-pp.update_alignment_for_field
      0.12 =C2=B1  3%      +0.0        0.14        perf-profile.children.cy=
cles-pp.malloc(a)plt
      0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.inchash::add_expr
      0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.warnings_for_convert_and_check
      0.12 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.memchr(a)plt
      0.12 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.sched_rgn_compute_dependencies
      0.11            +0.0        0.13 =C2=B1  3%  perf-profile.children.cy=
cles-pp.fold
      0.06            +0.0        0.08 =C2=B1  6%  perf-profile.children.cy=
cles-pp.size_int_kind
      0.06            +0.0        0.08 =C2=B1  6%  perf-profile.children.cy=
cles-pp.rpo_vn_valueize
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.children.cy=
cles-pp.native_flush_tlb_one_user
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.children.cy=
cles-pp.c_process_expr_stmt
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.children.cy=
cles-pp.__fsnotify_parent
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.children.cy=
cles-pp.htab_hash_string
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.children.cy=
cles-pp.recog
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.children.cy=
cles-pp.__update_load_avg_cfs_rq
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.children.cy=
cles-pp.delete_unreachable_blocks
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.children.cy=
cles-pp.vm_area_dup
      0.16 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.childr=
en.cycles-pp._dl_addr
      0.17 =C2=B1  7%      +0.0        0.19 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.pre_and_rev_post_order_compute_fn
      0.74 =C2=B1  3%      +0.0        0.76        perf-profile.children.cy=
cles-pp.pop_scope
      0.49            +0.0        0.51 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__irq_exit_rcu
      0.36 =C2=B1  4%      +0.0        0.38 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.gimple_call_flags
      0.29 =C2=B1  4%      +0.0        0.31        perf-profile.children.cy=
cles-pp.calculate_dominance_info
      0.21 =C2=B1  5%      +0.0        0.23 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.regstat_compute_ri
      0.19 =C2=B1  4%      +0.0        0.21 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.get_ref_base_and_extent
      0.19 =C2=B1  4%      +0.0        0.21 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.htab_traverse
      0.07 =C2=B1  7%      +0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.shift_arg_pages
      0.03 =C2=B1 70%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.parse_input_constraint
      0.03 =C2=B1 70%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.simplify_const_relational_operation
      0.03 =C2=B1 70%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.expand_expr_real_1
      0.03 =C2=B1 70%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.42 =C2=B1  7%      +0.0        0.44        perf-profile.children.cy=
cles-pp.df_worklist_dataflow
      0.34 =C2=B1  2%      +0.0        0.36 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.ret_from_fork
      0.17 =C2=B1  2%      +0.0        0.19 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.strnlen_user
      0.17            +0.0        0.19 =C2=B1  4%  perf-profile.children.cy=
cles-pp.free(a)plt
      0.16 =C2=B1  3%      +0.0        0.18 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.c_parser_declarator
      0.24 =C2=B1  3%      +0.0        0.26        perf-profile.children.cy=
cles-pp.get_range_from_loc
      0.21 =C2=B1  6%      +0.0        0.23 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.single_def_use_dom_walker::before_dom_children
      0.18 =C2=B1  7%      +0.0        0.20 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.diagnostic_report_diagnostic
      0.19 =C2=B1  4%      +0.0        0.21 =C2=B1  5%  perf-profile.childr=
en.cycles-pp._IO_ferror
      0.17 =C2=B1  7%      +0.0        0.20 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.cselib_lookup
      0.13 =C2=B1  9%      +0.0        0.16 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.lra_inheritance
      0.08            +0.0        0.10 =C2=B1  4%  perf-profile.children.cy=
cles-pp.c_parser_skip_until_found
      0.03 =C2=B1 70%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.c_determine_visibility
      0.03 =C2=B1 70%      +0.0        0.06 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.insn_extract
      0.24            +0.0        0.27        perf-profile.children.cycles-=
pp.convert
      0.10 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.start_decl
      0.08 =C2=B1  6%      +0.0        0.10        perf-profile.children.cy=
cles-pp.(a)plt
      0.11 =C2=B1  4%      +0.0        0.14 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.general_operand
      0.34            +0.0        0.36        perf-profile.children.cycles-=
pp.verify_sequence_points
      0.25            +0.0        0.27 =C2=B1  4%  perf-profile.children.cy=
cles-pp.__mmap
      0.43 =C2=B1  6%      +0.0        0.46 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.execute_one_pass
      0.68            +0.0        0.70 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__softirqentry_text_start
      0.56 =C2=B1  2%      +0.0        0.59        perf-profile.children.cy=
cles-pp.rcu_do_batch
      0.62 =C2=B1  2%      +0.0        0.65 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.rcu_core
      0.18 =C2=B1  2%      +0.0        0.21        perf-profile.children.cy=
cles-pp.layout_decl
      0.18 =C2=B1  2%      +0.0        0.21        perf-profile.children.cy=
cles-pp.rtx_cost
      0.14 =C2=B1  3%      +0.0        0.16 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.build_unary_op
      0.13 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.c_parser_require
      0.22 =C2=B1  3%      +0.0        0.25        perf-profile.children.cy=
cles-pp.integer_zerop
      0.07            +0.0        0.10 =C2=B1  4%  perf-profile.children.cy=
cles-pp.setup_arg_pages
      0.11 =C2=B1  8%      +0.0        0.14        perf-profile.children.cy=
cles-pp.c_fully_fold
      0.23 =C2=B1  4%      +0.0        0.26        perf-profile.children.cy=
cles-pp.__libc_calloc
      0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.account_user_time
      0.47            +0.0        0.50 =C2=B1  2%  perf-profile.children.cy=
cles-pp.fold_binary_loc
      0.27 =C2=B1  3%      +0.0        0.30        perf-profile.children.cy=
cles-pp.kmem_cache_free
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.exp_equiv_p
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.get_attr_memory
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.__get_user_8
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.declspecs_add_scspec
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.worker_thread
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.children.cy=
cles-pp.integer_onep
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.children.cy=
cles-pp.c_objc_common_truthvalue_conversion
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.children.cy=
cles-pp.c_common_signed_or_unsigned_type
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.children.cy=
cles-pp.strncmp(a)plt
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.children.cy=
cles-pp.bitmap_alloc
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.children.cy=
cles-pp.evrp_dom_walker::before_dom_children
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.children.cy=
cles-pp.const_binop
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.children.cy=
cles-pp.output_asm_insn
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.children.cy=
cles-pp.cselib_subst_to_values
      0.32            +0.0        0.35 =C2=B1  2%  perf-profile.children.cy=
cles-pp.copy_strings
      0.50            +0.0        0.54 =C2=B1  3%  perf-profile.children.cy=
cles-pp.getenv
      0.02 =C2=B1141%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.ira_build_conflicts
      0.02 =C2=B1141%      +0.0        0.05 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.vr_values::extract_range_from_stmt
      0.00            +0.0        0.04 =C2=B1 71%  perf-profile.children.cy=
cles-pp.insn_default_length
      0.97            +0.0        1.01 =C2=B1  4%  perf-profile.children.cy=
cles-pp.execve
      0.29 =C2=B1  2%      +0.0        0.33 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.default_conversion
      0.26 =C2=B1  3%      +0.0        0.31 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.get_combined_adhoc_loc
      0.88            +0.0        0.92 =C2=B1  2%  perf-profile.children.cy=
cles-pp.bprm_execve
      0.47            +0.0        0.51 =C2=B1  2%  perf-profile.children.cy=
cles-pp._cpp_clean_line
      0.24 =C2=B1  5%      +0.0        0.28 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.bitmap_set_bit
      0.72            +0.0        0.77 =C2=B1  3%  perf-profile.children.cy=
cles-pp.exec_binprm
      0.44            +0.0        0.48        perf-profile.children.cycles-=
pp.kmem_cache_alloc
      0.41 =C2=B1  6%      +0.0        0.45 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.init_alias_analysis
      0.32 =C2=B1  2%      +0.0        0.37 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.c_parser_consume_token
      0.69 =C2=B1  3%      +0.0        0.74        perf-profile.children.cy=
cles-pp.variably_modified_type_p
      0.28 =C2=B1  2%      +0.0        0.33 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.fix_string_type
      0.26            +0.0        0.31 =C2=B1  3%  perf-profile.children.cy=
cles-pp.linemap_line_start
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.__anon_vma_prepare
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.c_parser_peek_2nd_token
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.memcmp(a)plt
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.c_vla_unspec_p
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.pos_from_bit
      0.71            +0.1        0.76 =C2=B1  2%  perf-profile.children.cy=
cles-pp.search_binary_handler
      0.70            +0.1        0.75 =C2=B1  3%  perf-profile.children.cy=
cles-pp.load_elf_binary
      0.08            +0.1        0.13 =C2=B1  3%  perf-profile.children.cy=
cles-pp.free_unref_page
      0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.cy=
cles-pp.c_end_compound_stmt
      0.14 =C2=B1  3%      +0.1        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__cond_resched
      0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children.cy=
cles-pp.free_pcp_prepare
      0.00            +0.1        0.06        perf-profile.children.cycles-=
pp.check_new_pages
      0.00            +0.1        0.06        perf-profile.children.cycles-=
pp.set_cfun
      0.11            +0.1        0.17 =C2=B1  2%  perf-profile.children.cy=
cles-pp.get_parm_info
      0.56 =C2=B1  2%      +0.1        0.62        perf-profile.children.cy=
cles-pp._cpp_skip_block_comment
      0.52            +0.1        0.59 =C2=B1  2%  perf-profile.children.cy=
cles-pp.operand_equal_p
      0.44 =C2=B1  2%      +0.1        0.51 =C2=B1  4%  perf-profile.childr=
en.cycles-pp._cpp_handle_directive
      1.39            +0.1        1.46 =C2=B1  2%  perf-profile.children.cy=
cles-pp.__x64_sys_execve
      0.54            +0.1        0.62 =C2=B1  2%  perf-profile.children.cy=
cles-pp.build_binary_op
      1.38            +0.1        1.46 =C2=B1  2%  perf-profile.children.cy=
cles-pp.do_execveat_common
      0.63 =C2=B1  5%      +0.1        0.71 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.df_bb_refs_record
      1.09            +0.1        1.17        perf-profile.children.cycles-=
pp.size_binop_loc
      0.69 =C2=B1  2%      +0.1        0.77 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.location_get_source_line
      0.42 =C2=B1  5%      +0.1        0.51 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.constrain_operands
      0.00            +0.1        0.09        perf-profile.children.cycles-=
pp.do_huge_pmd_anonymous_page
      0.71            +0.1        0.80        perf-profile.children.cycles-=
pp.c_parser_declspecs
      0.42 =C2=B1  2%      +0.1        0.52        perf-profile.children.cy=
cles-pp.decl_attributes
      0.19 =C2=B1  2%      +0.1        0.29        perf-profile.children.cy=
cles-pp.finish_decl
      0.95            +0.1        1.06        perf-profile.children.cycles-=
pp.cfree
      0.00            +0.1        0.12 =C2=B1  4%  perf-profile.children.cy=
cles-pp.init_ttree
      0.62 =C2=B1  2%      +0.1        0.74 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.layout_type
      0.84 =C2=B1  2%      +0.1        0.96 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.linemap_location_in_system_header_p
      0.24            +0.2        0.40        perf-profile.children.cycles-=
pp.__might_resched
      0.45            +0.2        0.62        perf-profile.children.cycles-=
pp.wi::force_to_size
      0.89            +0.2        1.08        perf-profile.children.cycles-=
pp.ggc_internal_alloc
      2.01            +0.2        2.21        perf-profile.children.cycles-=
pp.malloc
      3.60 =C2=B1  2%      +0.2        3.81        perf-profile.children.cy=
cles-pp.htab_find_slot_with_hash
      1.06            +0.2        1.29 =C2=B1  3%  perf-profile.children.cy=
cles-pp._cpp_lex_direct
      2.58            +0.8        3.41        perf-profile.children.cycles-=
pp.clear_page_erms
      6.26            +1.0        7.23        perf-profile.children.cycles-=
pp.c_lex_with_flags
      0.04 =C2=B1 71%      +2.5        2.58        perf-profile.children.cy=
cles-pp.clear_huge_page
      0.05 =C2=B1 70%      +2.6        2.62        perf-profile.children.cy=
cles-pp.__do_huge_pmd_anonymous_page
      3.17 =C2=B1  4%      -2.0        1.19 =C2=B1 15%  perf-profile.self.c=
ycles-pp.native_queued_spin_lock_slowpath
      1.01            -0.5        0.51        perf-profile.self.cycles-pp._=
_list_del_entry_valid
      1.01 =C2=B1  2%      -0.5        0.51        perf-profile.self.cycles=
-pp.charge_memcg
      0.83            -0.4        0.40        perf-profile.self.cycles-pp.t=
ry_charge_memcg
      0.84            -0.4        0.49 =C2=B1  3%  perf-profile.self.cycles=
-pp.zap_pte_range
      0.71            -0.3        0.38 =C2=B1  2%  perf-profile.self.cycles=
-pp.__free_one_page
      0.49 =C2=B1  3%      -0.3        0.17 =C2=B1  5%  perf-profile.self.c=
ycles-pp.get_mem_cgroup_from_mm
      0.79            -0.3        0.49 =C2=B1  4%  perf-profile.self.cycles=
-pp.sync_regs
      0.68            -0.3        0.42 =C2=B1  2%  perf-profile.self.cycles=
-pp.native_irq_return_iret
      0.21 =C2=B1  4%      -0.1        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__mod_node_page_state
      0.24            -0.1        0.12        perf-profile.self.cycles-pp.g=
et_page_from_freelist
      0.28            -0.1        0.17 =C2=B1  2%  perf-profile.self.cycles=
-pp.__handle_mm_fault
      0.28 =C2=B1  2%      -0.1        0.18 =C2=B1  2%  perf-profile.self.c=
ycles-pp.release_pages
      0.19 =C2=B1  4%      -0.1        0.09        perf-profile.self.cycles=
-pp.page_remove_rmap
      0.20 =C2=B1  4%      -0.1        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.do_anonymous_page
      0.16 =C2=B1  2%      -0.1        0.08        perf-profile.self.cycles=
-pp.__mem_cgroup_charge
      0.16 =C2=B1  5%      -0.1        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.__mod_lruvec_page_state
      1.72            -0.1        1.64        perf-profile.self.cycles-pp.t=
ype_hash_canon
      0.18 =C2=B1  5%      -0.1        0.10 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__alloc_pages
      0.16 =C2=B1  3%      -0.1        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.lru_add_fn
      0.26 =C2=B1  4%      -0.1        0.18 =C2=B1  5%  perf-profile.self.c=
ycles-pp.update_cfs_group
      0.49            -0.1        0.42        perf-profile.self.cycles-pp.l=
ookup_name
      0.13 =C2=B1  3%      -0.1        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.free_swap_cache
      0.16 =C2=B1  3%      -0.1        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.rmqueue
      0.17 =C2=B1  2%      -0.1        0.11        perf-profile.self.cycles=
-pp.handle_mm_fault
      0.06 =C2=B1  7%      -0.1        0.00        perf-profile.self.cycles=
-pp.mem_cgroup_update_lru_size
      0.06 =C2=B1  7%      -0.1        0.00        perf-profile.self.cycles=
-pp.__count_memcg_events
      0.18 =C2=B1  2%      -0.1        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.___perf_sw_event
      0.06            -0.1        0.00        perf-profile.self.cycles-pp.k=
time_get_update_offsets_now
      0.06            -0.1        0.00        perf-profile.self.cycles-pp._=
_mod_zone_page_state
      0.06            -0.1        0.00        perf-profile.self.cycles-pp.f=
ree_unref_page_commit
      0.11 =C2=B1  4%      -0.1        0.05        perf-profile.self.cycles=
-pp.page_counter_try_charge
      0.05 =C2=B1  8%      -0.1        0.00        perf-profile.self.cycles=
-pp.folio_add_lru
      0.05 =C2=B1  8%      -0.1        0.00        perf-profile.self.cycles=
-pp.mem_cgroup_charge_statistics
      0.05 =C2=B1  8%      -0.1        0.00        perf-profile.self.cycles=
-pp.down_read_trylock
      0.11 =C2=B1  4%      -0.1        0.06        perf-profile.self.cycles=
-pp.folio_batch_move_lru
      0.05            -0.1        0.00        perf-profile.self.cycles-pp._=
_mod_lruvec_state
      0.05            -0.1        0.00        perf-profile.self.cycles-pp._=
_page_set_anon_rmap
      0.05            -0.1        0.00        perf-profile.self.cycles-pp.o=
utput_addr_const
      0.05            -0.1        0.00        perf-profile.self.cycles-pp.e=
rrseq_sample
      0.14 =C2=B1  3%      -0.1        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__mod_memcg_lruvec_state
      0.13 =C2=B1  6%      -0.1        0.08 =C2=B1 10%  perf-profile.self.c=
ycles-pp.__list_add_valid
      0.07 =C2=B1  7%      -0.1        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.up_read
      0.10 =C2=B1  4%      -0.0        0.05 =C2=B1  8%  perf-profile.self.c=
ycles-pp.rmqueue_bulk
      0.42            -0.0        0.37 =C2=B1  5%  perf-profile.self.cycles=
-pp._raw_spin_lock
      0.06 =C2=B1  7%      -0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.asm_exc_page_fault
      0.08            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.free_unref_page_list
      0.14 =C2=B1  3%      -0.0        0.10 =C2=B1  4%  perf-profile.self.c=
ycles-pp.do_user_addr_fault
      0.11 =C2=B1  4%      -0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.vma_alloc_folio
      0.10 =C2=B1  9%      -0.0        0.06        perf-profile.self.cycles=
-pp.cgroup_rstat_updated
      0.05 =C2=B1  8%      -0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.irqtime_account_irq
      0.09            -0.0        0.06 =C2=B1  8%  perf-profile.self.cycles=
-pp.__perf_sw_event
      0.05            -0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.string_concat_db::record_string_concatenation
      0.03 =C2=B1 70%      -0.0        0.00        perf-profile.self.cycles=
-pp.blk_cgroup_congested
      0.03 =C2=B1 70%      -0.0        0.00        perf-profile.self.cycles=
-pp.apparmor_file_open
      0.03 =C2=B1 70%      -0.0        0.00        perf-profile.self.cycles=
-pp.rwsem_spin_on_owner
      0.03 =C2=B1 70%      -0.0        0.00        perf-profile.self.cycles=
-pp.up_write
      0.15 =C2=B1  6%      -0.0        0.12 =C2=B1  3%  perf-profile.self.c=
ycles-pp.apparmor_file_free_security
      0.10            -0.0        0.07        perf-profile.self.cycles-pp.v=
macache_find
      0.09 =C2=B1  5%      -0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.error_entry
      0.11            -0.0        0.08        perf-profile.self.cycles-pp._=
raw_spin_lock_irqsave
      0.08            -0.0        0.05        perf-profile.self.cycles-pp._=
_irqentry_text_end
      0.31            -0.0        0.28        perf-profile.self.cycles-pp.h=
t_lookup_with_hash
      0.33 =C2=B1  2%      -0.0        0.30 =C2=B1  4%  perf-profile.self.c=
ycles-pp.build_call_array_loc
      0.17 =C2=B1  2%      -0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.apparmor_file_alloc_security
      0.10            -0.0        0.07 =C2=B1  6%  perf-profile.self.cycles=
-pp._raw_spin_trylock
      0.06            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.handle_pte_fault
      0.07 =C2=B1  6%      -0.0        0.05 =C2=B1 74%  perf-profile.self.c=
ycles-pp.target_environment
      0.21 =C2=B1 46%      -0.0        0.18 =C2=B1 68%  perf-profile.self.c=
ycles-pp.osq_lock
      0.35            -0.0        0.33 =C2=B1  3%  perf-profile.self.cycles=
-pp.next_uptodate_page
      0.32 =C2=B1  2%      -0.0        0.30        perf-profile.self.cycles=
-pp.__d_lookup_rcu
      0.05 =C2=B1  8%      -0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.ktime_get
      0.25            -0.0        0.23 =C2=B1  2%  perf-profile.self.cycles=
-pp.vma_interval_tree_insert
      0.12            -0.0        0.10        perf-profile.self.cycles-pp.c=
graph_node::create
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.__vma_adjust
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.build_tree_list
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.arch_scale_freq_tick
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp._cpp_parse_expr
      0.05            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.find_comparison_dom_walker::before_dom_children
      0.05 =C2=B1  8%      -0.0        0.04 =C2=B1 71%  perf-profile.self.c=
ycles-pp.file_free_rcu
      0.03 =C2=B1 70%      -0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.hrtimer_interrupt
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles=
-pp.may_open
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles=
-pp.c_finish_return
      0.03 =C2=B1 70%      -0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.htab_hash_string
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles=
-pp.__hrtimer_run_queues
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles=
-pp.make_ssa_name_fn
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles=
-pp.update_ssa
      0.02 =C2=B1141%      -0.0        0.00        perf-profile.self.cycles=
-pp.bitmap_ior_into
      0.13            -0.0        0.12 =C2=B1  4%  perf-profile.self.cycles=
-pp.filemap_get_read_batch
      0.13            -0.0        0.12 =C2=B1  4%  perf-profile.self.cycles=
-pp.build_pointer_type
      0.13 =C2=B1  3%      -0.0        0.12 =C2=B1  6%  perf-profile.self.c=
ycles-pp.update_sg_wakeup_stats
      0.12 =C2=B1  3%      -0.0        0.11        perf-profile.self.cycles=
-pp.build_pointer_type_for_mode
      0.09 =C2=B1  5%      -0.0        0.08        perf-profile.self.cycles=
-pp.update_load_avg
      0.73 =C2=B1  2%      -0.0        0.72        perf-profile.self.cycles=
-pp.copy_user_enhanced_fast_string
      0.21 =C2=B1  3%      -0.0        0.20 =C2=B1  2%  perf-profile.self.c=
ycles-pp.__alloc_file
      0.23 =C2=B1  9%      -0.0        0.22 =C2=B1 11%  perf-profile.self.c=
ycles-pp.check
      0.13 =C2=B1  3%      -0.0        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.build_external_ref
      0.16 =C2=B1  5%      -0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.build_qualified_type
      0.09            -0.0        0.08        perf-profile.self.cycles-pp._=
_might_sleep
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.d=
own_read
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.u=
pdate_type_inheritance_graph
      0.08            -0.0        0.07        perf-profile.self.cycles-pp.l=
ockref_get_not_dead
      0.08 =C2=B1  5%      -0.0        0.07 =C2=B1  6%  perf-profile.self.c=
ycles-pp.update_curr
      0.20 =C2=B1  2%      -0.0        0.20 =C2=B1  6%  perf-profile.self.c=
ycles-pp.copy_page
      0.09            -0.0        0.08 =C2=B1  5%  perf-profile.self.cycles=
-pp.build_type_inheritance_graph
      0.07 =C2=B1 12%      -0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.update_process_times
      0.07 =C2=B1  7%      -0.0        0.06        perf-profile.self.cycles=
-pp.finish_declspecs
      0.24 =C2=B1  3%      -0.0        0.24        perf-profile.self.cycles=
-pp.set_source_range
      0.06 =C2=B1  8%      -0.0        0.05        perf-profile.self.cycles=
-pp._cpp_stack_include
      0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.vma_interval_tree_remove
      0.09 =C2=B1  5%      -0.0        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.filemap_read
      0.09 =C2=B1  5%      -0.0        0.08 =C2=B1  5%  perf-profile.self.c=
ycles-pp.push_stmt_list
      0.08 =C2=B1  6%      -0.0        0.07 =C2=B1 12%  perf-profile.self.c=
ycles-pp.tick_sched_do_timer
      0.07 =C2=B1  6%      -0.0        0.07        perf-profile.self.cycles=
-pp.check_cpu_stall
      0.06 =C2=B1  7%      -0.0        0.06        perf-profile.self.cycles=
-pp.hard_function_value
      0.20 =C2=B1  2%      -0.0        0.19 =C2=B1  2%  perf-profile.self.c=
ycles-pp.tree_cons
      0.15 =C2=B1  3%      -0.0        0.15 =C2=B1  5%  perf-profile.self.c=
ycles-pp.__slab_free
      0.06 =C2=B1  8%      -0.0        0.05 =C2=B1  8%  perf-profile.self.c=
ycles-pp.inode_permission
      0.11 =C2=B1 11%      -0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.cleanup_tree_cfg
      0.37 =C2=B1  2%      +0.0        0.37 =C2=B1  2%  perf-profile.self.c=
ycles-pp.linemap_enter_macro
      0.28            +0.0        0.28        perf-profile.self.cycles-pp.b=
uild_function_call_vec
      0.08            +0.0        0.08        perf-profile.self.cycles-pp.d=
_alloc_parallel
      0.08            +0.0        0.08        perf-profile.self.cycles-pp.g=
gc_internal_cleared_alloc
      0.07            +0.0        0.07        perf-profile.self.cycles-pp.s=
horten_compare
      0.06 =C2=B1  7%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.finish_record_layout
      0.07 =C2=B1  6%      +0.0        0.07 =C2=B1  6%  perf-profile.self.c=
ycles-pp.compute_fn_summary
      0.08 =C2=B1 10%      +0.0        0.08        perf-profile.self.cycles=
-pp.execute_fixup_cfg
      0.07 =C2=B1 11%      +0.0        0.07 =C2=B1 11%  perf-profile.self.c=
ycles-pp.get_alias_set
      0.06 =C2=B1  7%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.flow_loops_find
      0.06            +0.0        0.06        perf-profile.self.cycles-pp.m=
ark_exp_read
      0.07 =C2=B1 14%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.ipa_icf::sem_function::init
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.push_scope
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.schedule_insns
      0.05            +0.0        0.05        perf-profile.self.cycles-pp.x=
as_load
      0.05            +0.0        0.05        perf-profile.self.cycles-pp.f=
inish_function
      0.05            +0.0        0.05        perf-profile.self.cycles-pp._=
raw_spin_lock_irq
      0.05            +0.0        0.05        perf-profile.self.cycles-pp.c=
graph_node::create_edge
      0.05            +0.0        0.05        perf-profile.self.cycles-pp.e=
xcess_precision_type
      0.05 =C2=B1  8%      +0.0        0.05 =C2=B1  8%  perf-profile.self.c=
ycles-pp.may_trap_p_1
      0.05            +0.0        0.05        perf-profile.self.cycles-pp.c=
_parser_next_tokens_start_declaration
      0.03 =C2=B1 70%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.force_fit_type
      0.03 =C2=B1 70%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.useless_type_conversion_p
      0.03 =C2=B1 70%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.delete_unreachable_blocks
      0.02 =C2=B1141%      +0.0        0.02 =C2=B1141%  perf-profile.self.c=
ycles-pp.set_reg_attrs_for_decl_rtl
      0.21 =C2=B1  2%      +0.0        0.22 =C2=B1  2%  perf-profile.self.c=
ycles-pp.build1
      0.20 =C2=B1  2%      +0.0        0.21 =C2=B1  2%  perf-profile.self.c=
ycles-pp.fold_convert_loc
      0.14 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.remove_unused_locals
      0.09            +0.0        0.09 =C2=B1 10%  perf-profile.self.cycles=
-pp.page_remove_file_rmap
      0.08            +0.0        0.08 =C2=B1  5%  perf-profile.self.cycles=
-pp._cpp_temp_token
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.start_function
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.self.cycles=
-pp.elf_create_section
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.perf_iterate_sb
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.shallow_copy_rtx
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.self.cycles=
-pp.c_add_case_label
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.self.cycles=
-pp.protected_set_expr_location
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.self.cycles=
-pp.cpp_spell_token
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.self.cycles=
-pp.fold_ternary_loc
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.self.cycles=
-pp.__get_obj_cgroup_from_memcg
      0.05            +0.0        0.05 =C2=B1  8%  perf-profile.self.cycles=
-pp.build_c_cast
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.delete_basic_block
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.const_unop
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.simple_cst_equal
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.make_pointer_declarator
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.compare_tree_int
      0.06 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.estimate_num_insns
      0.12 =C2=B1  3%      +0.0        0.13 =C2=B1  3%  perf-profile.self.c=
ycles-pp.walk_stmt_load_store_addr_ops
      0.12 =C2=B1  4%      +0.0        0.12        perf-profile.self.cycles=
-pp.get_inner_reference
      0.12 =C2=B1  8%      +0.0        0.12        perf-profile.self.cycles=
-pp.cleanup_cfg
      0.09 =C2=B1  5%      +0.0        0.10 =C2=B1  4%  perf-profile.self.c=
ycles-pp.ira_init_register_move_cost
      0.09 =C2=B1  5%      +0.0        0.09        perf-profile.self.cycles=
-pp.sizeof_pointer_memaccess_warning
      0.08 =C2=B1  5%      +0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.post_order_compute
      0.07            +0.0        0.07 =C2=B1  6%  perf-profile.self.cycles=
-pp.c_common_truthvalue_conversion
      0.07 =C2=B1  7%      +0.0        0.07        perf-profile.self.cycles=
-pp.mark_dfs_back_edges
      0.06            +0.0        0.06 =C2=B1  7%  perf-profile.self.cycles=
-pp.lockref_put_or_lock
      0.07 =C2=B1 11%      +0.0        0.07 =C2=B1  6%  perf-profile.self.c=
ycles-pp.compute_may_aliases
      0.07 =C2=B1  7%      +0.0        0.07        perf-profile.self.cycles=
-pp.eliminate_dom_walker::before_dom_children
      0.06 =C2=B1 13%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.regstat_compute_calls_crossed
      0.20 =C2=B1  2%      +0.0        0.21        perf-profile.self.cycles=
-pp.check_function_arguments
      0.14 =C2=B1  3%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.cgraph_node::remove
      0.14 =C2=B1  3%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.wide_int_binop
      0.11 =C2=B1  7%      +0.0        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.extract_insn
      0.05            +0.0        0.06 =C2=B1  8%  perf-profile.self.cycles=
-pp.gimple_resimplify2
      0.05            +0.0        0.06 =C2=B1  8%  perf-profile.self.cycles=
-pp.rtx_equal_for_cselib_1
      0.05            +0.0        0.06 =C2=B1  8%  perf-profile.self.cycles=
-pp.bitmap_bit_p
      0.05 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.lvalue_p
      0.05 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.rtx_alloc
      0.05 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.split_all_insns
      0.05 =C2=B1  8%      +0.0        0.06        perf-profile.self.cycles=
-pp.schedule_block
      0.12 =C2=B1  3%      +0.0        0.13        perf-profile.self.cycles=
-pp.cpp_classify_number
      0.10 =C2=B1  4%      +0.0        0.11        perf-profile.self.cycles=
-pp.c_parse_file
      0.10 =C2=B1  9%      +0.0        0.10 =C2=B1  4%  perf-profile.self.c=
ycles-pp.mark_irreducible_loops
      0.08            +0.0        0.09 =C2=B1  5%  perf-profile.self.cycles=
-pp.realloc
      0.07            +0.0        0.08 =C2=B1  6%  perf-profile.self.cycles=
-pp.wi::mul_internal
      0.08 =C2=B1 10%      +0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.dom_walker::walk
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.self.cycles=
-pp.memchr(a)plt
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.self.cycles=
-pp.ferror(a)plt
      0.06 =C2=B1  7%      +0.0        0.07 =C2=B1 11%  perf-profile.self.c=
ycles-pp.gimple_fold_stmt_to_constant_1
      0.06 =C2=B1  7%      +0.0        0.07        perf-profile.self.cycles=
-pp.dom_opt_dom_walker::before_dom_children
      0.06 =C2=B1  7%      +0.0        0.07        perf-profile.self.cycles=
-pp.delete_trivially_dead_insns
      0.06 =C2=B1  7%      +0.0        0.07        perf-profile.self.cycles=
-pp.ggc_free
      0.06            +0.0        0.07 =C2=B1  7%  perf-profile.self.cycles=
-pp.reg_scan
      0.06 =C2=B1 13%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.unshare_all_rtl_in_chain
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.et_below
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.lra_constraints
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.df_analyze
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1 14%  perf-profile.self.c=
ycles-pp.df_grow_reg_info
      0.06 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.init_subregs_of_mode
      0.22            +0.0        0.23 =C2=B1  2%  perf-profile.self.cycles=
-pp._cpp_find_file
      0.13            +0.0        0.14 =C2=B1  3%  perf-profile.self.cycles=
-pp.rcu_cblist_dequeue
      0.13 =C2=B1 10%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.copy_node
      0.09 =C2=B1  5%      +0.0        0.10        perf-profile.self.cycles=
-pp.c_token_starts_typename
      0.09 =C2=B1  5%      +0.0        0.10        perf-profile.self.cycles=
-pp.max_issue
      0.07 =C2=B1 14%      +0.0        0.07 =C2=B1  6%  perf-profile.self.c=
ycles-pp.lra
      0.85            +0.0        0.86        perf-profile.self.cycles-pp.m=
ake_node
      0.15 =C2=B1  3%      +0.0        0.16 =C2=B1  3%  perf-profile.self.c=
ycles-pp.kmem_cache_alloc
      0.15 =C2=B1  3%      +0.0        0.16 =C2=B1  6%  perf-profile.self.c=
ycles-pp.linemap_resolve_location
      0.14            +0.0        0.15        perf-profile.self.cycles-pp.b=
uild_stmt
      0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  8%  perf-profile.self.c=
ycles-pp.linemap_lookup
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.c=
_build_qualified_type
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.c=
graph_node::finalize_function
      0.10 =C2=B1  4%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.memcg_slab_post_alloc_hook
      0.10 =C2=B1  4%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.malloc(a)plt
      0.12 =C2=B1 10%      +0.0        0.13 =C2=B1  3%  perf-profile.self.c=
ycles-pp.rewrite_update_dom_walker::before_dom_children
      0.09 =C2=B1  5%      +0.0        0.10 =C2=B1  4%  perf-profile.self.c=
ycles-pp.filemap_map_pages
      0.09 =C2=B1  5%      +0.0        0.10 =C2=B1  9%  perf-profile.self.c=
ycles-pp.vn_reference_lookup
      0.09 =C2=B1  5%      +0.0        0.10 =C2=B1  4%  perf-profile.self.c=
ycles-pp.add_dependence
      0.08 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.mod_objcg_state
      0.08 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.hash_rtx_cb
      0.07            +0.0        0.08        perf-profile.self.cycles-pp.l=
ink_path_walk
      0.07            +0.0        0.08        perf-profile.self.cycles-pp.g=
eneric_simplify
      0.08 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.make_location
      0.08 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.wi::divmod_internal
      0.07            +0.0        0.08 =C2=B1 10%  perf-profile.self.cycles=
-pp.(a)plt
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.lra_assign
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.extract_constrain_insn_cached
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.bitmap_clear_bit
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.avail_exprs_stack::lookup_avail_expr
      0.05 =C2=B1  8%      +0.0        0.06 =C2=B1  7%  perf-profile.self.c=
ycles-pp.lra_final_code_change
      0.21 =C2=B1  2%      +0.0        0.22 =C2=B1  2%  perf-profile.self.c=
ycles-pp._cpp_pop_context
      0.16            +0.0        0.17        perf-profile.self.cycles-pp.d=
eclspecs_add_type
      0.13 =C2=B1  7%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.update_stmt_operands
      0.13 =C2=B1  3%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.ssa_propagation_engine::ssa_propagate
      0.09 =C2=B1  5%      +0.0        0.10 =C2=B1  4%  perf-profile.self.c=
ycles-pp.finish_struct
      0.08 =C2=B1  5%      +0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.place_field
      0.10 =C2=B1  9%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.inverted_post_order_compute
      0.09 =C2=B1  5%      +0.0        0.10 =C2=B1  4%  perf-profile.self.c=
ycles-pp.get_attr_type
      0.08 =C2=B1  5%      +0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.build_int_cst
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.f=
ind_vma
      0.28            +0.0        0.29        perf-profile.self.cycles-pp.c=
onvert_lvalue_to_rvalue
      0.73 =C2=B1  2%      +0.0        0.74        perf-profile.self.cycles=
-pp.pop_scope
      0.37 =C2=B1  3%      +0.0        0.39 =C2=B1  4%  perf-profile.self.c=
ycles-pp.df_insn_rescan
      0.18 =C2=B1  2%      +0.0        0.20 =C2=B1  4%  perf-profile.self.c=
ycles-pp.add_stmt
      0.19            +0.0        0.20 =C2=B1  2%  perf-profile.self.cycles=
-pp.fold_build2_loc
      0.19 =C2=B1  4%      +0.0        0.20 =C2=B1  8%  perf-profile.self.c=
ycles-pp.get_ref_base_and_extent
      0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.pop_stmt_list
      0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  4%  perf-profile.self.c=
ycles-pp.gimplify_expr
      0.09            +0.0        0.10 =C2=B1  4%  perf-profile.self.cycles=
-pp.cpp_interpret_integer
      0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  7%  perf-profile.self.c=
ycles-pp.recompute_tree_invariant_for_addr_expr
      0.05            +0.0        0.06 =C2=B1  7%  perf-profile.self.cycles=
-pp.unmapped_area_topdown
      0.15 =C2=B1  3%      +0.0        0.16 =C2=B1  5%  perf-profile.self.c=
ycles-pp.type_hash_canon_hash
      0.13 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.side_effects_p
      0.12            +0.0        0.13 =C2=B1  3%  perf-profile.self.cycles=
-pp.free(a)plt
      0.12 =C2=B1  6%      +0.0        0.13 =C2=B1  3%  perf-profile.self.c=
ycles-pp.inchash::add_expr
      0.11            +0.0        0.12 =C2=B1  3%  perf-profile.self.cycles=
-pp.ira_init
      0.10 =C2=B1  8%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.walk_tree_1
      0.10 =C2=B1  8%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.df_compact_blocks
      0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  4%  perf-profile.self.c=
ycles-pp.rebuild_jump_labels
      0.07 =C2=B1  7%      +0.0        0.08        perf-profile.self.cycles=
-pp.main
      0.06 =C2=B1  7%      +0.0        0.08 =C2=B1  6%  perf-profile.self.c=
ycles-pp.rtx_equal_p
      0.12 =C2=B1  8%      +0.0        0.13        perf-profile.self.cycles=
-pp.substitute_and_fold_engine::substitute_and_fold
      0.06            +0.0        0.07 =C2=B1  6%  perf-profile.self.cycles=
-pp.wi::lshift_large
      0.06            +0.0        0.07 =C2=B1  6%  perf-profile.self.cycles=
-pp.lra_remat
      0.38            +0.0        0.40        perf-profile.self.cycles-pp.f=
old_unary_loc
      0.19 =C2=B1  4%      +0.0        0.21        perf-profile.self.cycles=
-pp.htab_traverse
      0.10            +0.0        0.12 =C2=B1  4%  perf-profile.self.cycles=
-pp.fold
      0.41 =C2=B1  6%      +0.0        0.43        perf-profile.self.cycles=
-pp.df_worklist_dataflow
      0.17 =C2=B1  8%      +0.0        0.19 =C2=B1  5%  perf-profile.self.c=
ycles-pp.pre_and_rev_post_order_compute_fn
      0.07            +0.0        0.09 =C2=B1  5%  perf-profile.self.cycles=
-pp.wi::zext_large
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.xas_start
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.compute_record_mode
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.__fsnotify_parent
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.__update_load_avg_cfs_rq
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.gimple_copy
      0.02 =C2=B1141%      +0.0        0.03 =C2=B1 70%  perf-profile.self.c=
ycles-pp.update_min_vruntime
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.shorten_branches
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.lra_undo_inheritance
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.build_asm_expr
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.call_rcu
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.c_end_compound_stmt
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.insn_default_length
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.const_binop
      0.00            +0.0        0.02 =C2=B1141%  perf-profile.self.cycles=
-pp.pos_from_bit
      0.05 =C2=B1  8%      +0.0        0.07        perf-profile.self.cycles=
-pp.rpo_vn_valueize
      0.04 =C2=B1 71%      +0.0        0.05 =C2=B1  8%  perf-profile.self.c=
ycles-pp.sd_add_dep
      0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  5%  perf-profile.self.c=
ycles-pp.warnings_for_convert_and_check
      0.11 =C2=B1  4%      +0.0        0.13 =C2=B1  6%  perf-profile.self.c=
ycles-pp.sched_rgn_compute_dependencies
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.self.cycles=
-pp.__d_alloc
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.self.cycles=
-pp.strncpy_from_user
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.self.cycles=
-pp.down_write
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.self.cycles=
-pp.native_flush_tlb_one_user
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.self.cycles=
-pp.expand_call
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.self.cycles=
-pp.expand_expr_real_1
      0.03 =C2=B1 70%      +0.0        0.05        perf-profile.self.cycles=
-pp.entry_SYSRETQ_unsafe_stack
      0.17 =C2=B1  2%      +0.0        0.19        perf-profile.self.cycles=
-pp.strnlen_user
      0.43 =C2=B1  5%      +0.0        0.45 =C2=B1  2%  perf-profile.self.c=
ycles-pp.execute_one_pass
      0.31 =C2=B1  3%      +0.0        0.33        perf-profile.self.cycles=
-pp.build_null_declspecs
      0.28 =C2=B1  4%      +0.0        0.30        perf-profile.self.cycles=
-pp.calculate_dominance_info
      0.19 =C2=B1  4%      +0.0        0.21        perf-profile.self.cycles=
-pp.integer_zerop
      0.14 =C2=B1  3%      +0.0        0.16 =C2=B1  3%  perf-profile.self.c=
ycles-pp._dl_addr
      0.18 =C2=B1  7%      +0.0        0.20 =C2=B1  8%  perf-profile.self.c=
ycles-pp.diagnostic_report_diagnostic
      0.15 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.self.c=
ycles-pp.c_parser_declarator
      0.14            +0.0        0.16 =C2=B1  5%  perf-profile.self.cycles=
-pp.iterative_hash
      0.13 =C2=B1  3%      +0.0        0.15 =C2=B1  8%  perf-profile.self.c=
ycles-pp._IO_ferror
      0.13 =C2=B1  6%      +0.0        0.15 =C2=B1  5%  perf-profile.self.c=
ycles-pp.lra_inheritance
      0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  3%  perf-profile.self.c=
ycles-pp.parser_build_binary_op
      0.11 =C2=B1  8%      +0.0        0.13 =C2=B1  3%  perf-profile.self.c=
ycles-pp.general_operand
      0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  6%  perf-profile.self.c=
ycles-pp.size_int_kind
      0.35 =C2=B1  4%      +0.0        0.37 =C2=B1  5%  perf-profile.self.c=
ycles-pp.gimple_call_flags
      0.24 =C2=B1  3%      +0.0        0.26        perf-profile.self.cycles=
-pp.get_range_from_loc
      0.17 =C2=B1  5%      +0.0        0.19 =C2=B1  5%  perf-profile.self.c=
ycles-pp.cselib_lookup
      0.33            +0.0        0.35        perf-profile.self.cycles-pp.v=
erify_sequence_points
      0.19 =C2=B1  2%      +0.0        0.22 =C2=B1  2%  perf-profile.self.c=
ycles-pp.kmem_cache_free
      0.20 =C2=B1  6%      +0.0        0.23 =C2=B1  5%  perf-profile.self.c=
ycles-pp.regstat_compute_ri
      0.12 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.build_unary_op
      0.08            +0.0        0.10 =C2=B1  4%  perf-profile.self.cycles=
-pp.c_parser_skip_until_found
      0.03 =C2=B1 70%      +0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.insn_extract
      0.03 =C2=B1 70%      +0.0        0.06 =C2=B1  8%  perf-profile.self.c=
ycles-pp.sched_free_deps
      0.21 =C2=B1  4%      +0.0        0.23        perf-profile.self.cycles=
-pp.__libc_calloc
      0.22 =C2=B1  2%      +0.0        0.25 =C2=B1  3%  perf-profile.self.c=
ycles-pp.convert
      0.21 =C2=B1  4%      +0.0        0.23 =C2=B1  5%  perf-profile.self.c=
ycles-pp.single_def_use_dom_walker::before_dom_children
      0.18 =C2=B1  4%      +0.0        0.21 =C2=B1  2%  perf-profile.self.c=
ycles-pp.layout_decl
      0.10            +0.0        0.13 =C2=B1  3%  perf-profile.self.cycles=
-pp.start_decl
      0.18 =C2=B1  2%      +0.0        0.20 =C2=B1  4%  perf-profile.self.c=
ycles-pp.get_combined_adhoc_loc
      0.10 =C2=B1  9%      +0.0        0.13        perf-profile.self.cycles=
-pp.c_fully_fold
      0.44            +0.0        0.47        perf-profile.self.cycles-pp.f=
old_binary_loc
      0.18 =C2=B1  4%      +0.0        0.21        perf-profile.self.cycles=
-pp.rtx_cost
      0.12 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.self.c=
ycles-pp.c_parser_require
      0.28 =C2=B1  2%      +0.0        0.31 =C2=B1  3%  perf-profile.self.c=
ycles-pp.default_conversion
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.cselib_subst_to_values
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.exp_equiv_p
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.c_common_signed_or_unsigned_type
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.__get_user_8
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.declspecs_add_scspec
      0.00            +0.0        0.03 =C2=B1 70%  perf-profile.self.cycles=
-pp.c_process_expr_stmt
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.self.cycles=
-pp.c_determine_visibility
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.self.cycles=
-pp.parse_input_constraint
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.self.cycles=
-pp.rest_of_decl_compilation
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.self.cycles=
-pp.page_add_file_rmap
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.self.cycles=
-pp.simplify_const_relational_operation
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.self.cycles=
-pp.recog
      0.02 =C2=B1141%      +0.0        0.05        perf-profile.self.cycles=
-pp.bitmap_alloc
      0.07            +0.0        0.11 =C2=B1  4%  perf-profile.self.cycles=
-pp.__cond_resched
      0.02 =C2=B1141%      +0.0        0.05 =C2=B1  8%  perf-profile.self.c=
ycles-pp.ira_build_conflicts
      0.49            +0.0        0.53 =C2=B1  2%  perf-profile.self.cycles=
-pp.getenv
      0.29 =C2=B1  2%      +0.0        0.33        perf-profile.self.cycles=
-pp.pushdecl
      0.24            +0.0        0.28 =C2=B1  3%  perf-profile.self.cycles=
-pp.fix_string_type
      0.24            +0.0        0.28 =C2=B1  3%  perf-profile.self.cycles=
-pp.linemap_line_start
      0.60 =C2=B1  3%      +0.0        0.64 =C2=B1  2%  perf-profile.self.c=
ycles-pp.elf_read
      0.23 =C2=B1  3%      +0.0        0.27 =C2=B1  3%  perf-profile.self.c=
ycles-pp.bitmap_set_bit
      0.43            +0.0        0.47        perf-profile.self.cycles-pp.b=
uild_function_type
      0.33 =C2=B1  2%      +0.0        0.37        perf-profile.self.cycles=
-pp.build2
      0.30 =C2=B1  2%      +0.0        0.34        perf-profile.self.cycles=
-pp.allocate_struct_function
      0.40 =C2=B1  5%      +0.0        0.45 =C2=B1  4%  perf-profile.self.c=
ycles-pp.init_alias_analysis
      0.67 =C2=B1  3%      +0.0        0.72        perf-profile.self.cycles=
-pp.variably_modified_type_p
      0.30            +0.0        0.35 =C2=B1  2%  perf-profile.self.cycles=
-pp.c_parser_consume_token
      0.44            +0.0        0.49 =C2=B1  2%  perf-profile.self.cycles=
-pp._cpp_clean_line
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._=
__slab_alloc
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.b=
uild_component_ref
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.s=
horten_binary_op
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.o=
utput_asm_insn
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.c=
_objc_common_truthvalue_conversion
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.c=
_parser_peek_2nd_token
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.f=
ree_pcp_prepare
      0.15 =C2=B1  3%      +0.1        0.21 =C2=B1  2%  perf-profile.self.c=
ycles-pp.build3
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.c=
heck_new_pages
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.s=
et_cfun
      0.54 =C2=B1  3%      +0.1        0.61        perf-profile.self.cycles=
-pp._cpp_skip_block_comment
      0.43 =C2=B1  2%      +0.1        0.49 =C2=B1  4%  perf-profile.self.c=
ycles-pp._cpp_handle_directive
      0.11 =C2=B1  4%      +0.1        0.17        perf-profile.self.cycles=
-pp.get_parm_info
      0.51            +0.1        0.57        perf-profile.self.cycles-pp.o=
perand_equal_p
      0.51            +0.1        0.58 =C2=B1  2%  perf-profile.self.cycles=
-pp.build_binary_op
      0.63 =C2=B1  2%      +0.1        0.70 =C2=B1  5%  perf-profile.self.c=
ycles-pp.location_get_source_line
      0.57 =C2=B1  6%      +0.1        0.64 =C2=B1  3%  perf-profile.self.c=
ycles-pp.df_bb_refs_record
      1.00            +0.1        1.07        perf-profile.self.cycles-pp.s=
ize_binop_loc
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.c=
lear_huge_page
      0.41 =C2=B1  4%      +0.1        0.50 =C2=B1  4%  perf-profile.self.c=
ycles-pp.constrain_operands
      0.41 =C2=B1  2%      +0.1        0.49        perf-profile.self.cycles=
-pp.decl_attributes
      0.82            +0.1        0.91        perf-profile.self.cycles-pp.c=
free
      0.66            +0.1        0.75        perf-profile.self.cycles-pp.c=
_parser_declspecs
      0.17            +0.1        0.27        perf-profile.self.cycles-pp.f=
inish_decl
      0.58 =C2=B1  2%      +0.1        0.70 =C2=B1  2%  perf-profile.self.c=
ycles-pp.layout_type
      0.82 =C2=B1  3%      +0.1        0.94 =C2=B1  9%  perf-profile.self.c=
ycles-pp.linemap_location_in_system_header_p
      0.22 =C2=B1  2%      +0.1        0.36        perf-profile.self.cycles=
-pp.__might_resched
      1.01 =C2=B1  2%      +0.2        1.16        perf-profile.self.cycles=
-pp.build_decl
      0.42            +0.2        0.57        perf-profile.self.cycles-pp.w=
i::force_to_size
      0.86            +0.2        1.03        perf-profile.self.cycles-pp.g=
gc_internal_alloc
      1.87            +0.2        2.05        perf-profile.self.cycles-pp.m=
alloc
      3.54 =C2=B1  2%      +0.2        3.75        perf-profile.self.cycles=
-pp.htab_find_slot_with_hash
      1.02            +0.2        1.25 =C2=B1  3%  perf-profile.self.cycles=
-pp._cpp_lex_direct
      2.04            +0.3        2.29 =C2=B1  2%  perf-profile.self.cycles=
-pp._cpp_create_definition
      2.54            +0.8        3.36        perf-profile.self.cycles-pp.c=
lear_page_erms
      6.10            +1.0        7.05        perf-profile.self.cycles-pp.c=
_lex_with_flags


Best Regards,
Yujie

> =

> Best Regards,
> Huang, Ying
> =

> >   Time (mean =C2=B1 =CF=83):     406.688 s =C2=B1  0.676 s    [User: 31=
819.526 s, System: 16327.022 s]
> >   Range (min =E2=80=A6 max):   405.954 s =E2=80=A6 407.284 s    3 run
> >
> > That is a pretty big difference (27%), which is visible while doing a
> > lot of builds, only because of the extra system time. If there is any
> > way to improve this, it should certainly be considered.
> >
> > For now, I'll just revert it locally.
> >
> > Cheers,
> > Nathan
> >
> > # bad: [aae703b02f92bde9264366c545e87cec451de471] Merge tag 'for-6.1-rc=
1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> > # good: [4fe89d07dcc2804c8b562f6c7896a45643d34b2f] Linux 6.0
> > git bisect start 'aae703b02f92bde9264366c545e87cec451de471' 'v6.0'
> > # good: [18fd049731e67651009f316195da9281b756f2cf] Merge tag 'arm64-ups=
tream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
> > git bisect good 18fd049731e67651009f316195da9281b756f2cf
> > # good: [ab0c23b535f3f9d8345d8ad4c18c0a8594459d55] MAINTAINERS: add RIS=
C-V's patchwork
> > git bisect good ab0c23b535f3f9d8345d8ad4c18c0a8594459d55
> > # bad: [f721d24e5dae8358b49b24399d27ba5d12a7e049] Merge tag 'pull-tmpfi=
le' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
> > git bisect bad f721d24e5dae8358b49b24399d27ba5d12a7e049
> > # good: [ada3bfb6492a6d0d3eca50f3b61315fe032efc72] Merge tag 'tpmdd-nex=
t-v6.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-t=
pmdd
> > git bisect good ada3bfb6492a6d0d3eca50f3b61315fe032efc72
> > # bad: [4e07acdda7fc23f5c4666e54961ef972a1195ffd] mm/hwpoison: add __in=
it/__exit annotations to module init/exit funcs
> > git bisect bad 4e07acdda7fc23f5c4666e54961ef972a1195ffd
> > # bad: [000a449345bbb4ffbd880f7143b5fb4acac34121] radix tree test suite=
: add allocation counts and size to kmem_cache
> > git bisect bad 000a449345bbb4ffbd880f7143b5fb4acac34121
> > # bad: [47d55419951312d723de1b6ad53ee92948b8eace] btrfs: convert proces=
s_page_range() to use filemap_get_folios_contig()
> > git bisect bad 47d55419951312d723de1b6ad53ee92948b8eace
> > # bad: [4d86d4f7227c6f2acfbbbe0623d49865aa71b756] mm: add more BUILD_BU=
G_ONs to gfp_migratetype()
> > git bisect bad 4d86d4f7227c6f2acfbbbe0623d49865aa71b756
> > # bad: [816284a3d0e27828b5cc35f3cf539b0711939ce3] userfaultfd: update d=
ocumentation to describe /dev/userfaultfd
> > git bisect bad 816284a3d0e27828b5cc35f3cf539b0711939ce3
> > # good: [be6667b0db97e10b2a6d57a906c2c8fd2b985e5e] selftests/vm: dedup =
hugepage allocation logic
> > git bisect good be6667b0db97e10b2a6d57a906c2c8fd2b985e5e
> > # bad: [2ace36f0f55777be8a871c370832527e1cd54b15] mm: memory-failure: c=
leanup try_to_split_thp_page()
> > git bisect bad 2ace36f0f55777be8a871c370832527e1cd54b15
> > # good: [9d0d946840075e0268f4f77fe39ba0f53e84c7c4] selftests/vm: add se=
lftest to verify multi THP collapse
> > git bisect good 9d0d946840075e0268f4f77fe39ba0f53e84c7c4
> > # bad: [f35b5d7d676e59e401690b678cd3cfec5e785c23] mm: align larger anon=
ymous mappings on THP boundaries
> > git bisect bad f35b5d7d676e59e401690b678cd3cfec5e785c23
> > # good: [7b5a0b664ebe2625965a0fdba2614c88c4b9bbc6] mm/page_ext: remove =
unused variable in offline_page_ext
> > git bisect good 7b5a0b664ebe2625965a0fdba2614c88c4b9bbc6
> > # first bad commit: [f35b5d7d676e59e401690b678cd3cfec5e785c23] mm: alig=
n larger anonymous mappings on THP boundaries
--===============1889441489513508282==--

