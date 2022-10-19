Content-Type: multipart/mixed; boundary="===============8906653557988228371=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression
Date: Wed, 19 Oct 2022 10:05:50 +0800
Message-ID: <87edv4r2ip.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <202210181535.7144dd15-yujie.liu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8906653557988228371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Yujie,

>      32528  48%    +147.6%      80547  38%  numa-meminfo.node0.AnonHugePa=
ges
>      92821  23%     +59.3%     147839  28%  numa-meminfo.node0.AnonPages

The Anon pages allocated are much more than the parent commit.  This is
expected, because THP instead of normal page will be allocated for
aligned memory area.

>      95.23           -79.8       15.41   6%  perf-profile.calltrace.cycle=
s-pp.__munmap
>      95.08           -79.7       15.40   6%  perf-profile.calltrace.cycle=
s-pp.entry_SYSCALL_64_after_hwframe.__munmap
>      95.02           -79.6       15.39   6%  perf-profile.calltrace.cycle=
s-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
>      94.96           -79.6       15.37   6%  perf-profile.calltrace.cycle=
s-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
>      94.95           -79.6       15.37   6%  perf-profile.calltrace.cycle=
s-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.__munmap
>      94.86           -79.5       15.35   6%  perf-profile.calltrace.cycle=
s-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
>      94.38           -79.2       15.22   6%  perf-profile.calltrace.cycle=
s-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
>      42.74           -42.7        0.00        perf-profile.calltrace.cycl=
es-pp.lru_add_drain.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap
>      42.74           -42.7        0.00        perf-profile.calltrace.cycl=
es-pp.lru_add_drain_cpu.lru_add_drain.unmap_region.__do_munmap.__vm_munmap
>      42.72           -42.7        0.00        perf-profile.calltrace.cycl=
es-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.unmap_region.__d=
o_munmap
>      41.84           -41.8        0.00        perf-profile.calltrace.cycl=
es-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_=
add_drain.unmap_region
>      41.70           -41.7        0.00        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru=
.lru_add_drain_cpu.lru_add_drain
>      41.62           -41.6        0.00        perf-profile.calltrace.cycl=
es-pp.folio_lruvec_lock_irqsave.release_pages.tlb_batch_pages_flush.tlb_fin=
ish_mmu.unmap_region
>      41.55           -41.6        0.00        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_=
lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu
>      41.52           -41.5        0.00        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.release_pages.tlb_ba=
tch_pages_flush.tlb_finish_mmu
>      41.28           -41.3        0.00        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_=
lock_irqsave.release_pages.tlb_batch_pages_flush

In the parent commit, most CPU cycles are used for contention on LRU lock.

>       0.00            +4.8        4.82   7%  perf-profile.calltrace.cycle=
s-pp.do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_a=
ddr_fault.exc_page_fault
>       0.00            +4.9        4.88   7%  perf-profile.calltrace.cycle=
s-pp.zap_huge_pmd.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region
>       0.00            +8.2        8.22   8%  perf-profile.calltrace.cycle=
s-pp.native_queued_spin_lock_slowpath._raw_spin_lock.rmqueue_bulk.rmqueue.g=
et_page_from_freelist
>       0.00            +8.2        8.23   8%  perf-profile.calltrace.cycle=
s-pp._raw_spin_lock.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pag=
es
>       0.00            +8.3        8.35   8%  perf-profile.calltrace.cycle=
s-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_pcppages_bulk.fre=
e_unref_page.release_pages
>       0.00            +8.3        8.35   8%  perf-profile.calltrace.cycle=
s-pp._raw_spin_lock.free_pcppages_bulk.free_unref_page.release_pages.tlb_ba=
tch_pages_flush
>       0.00            +8.4        8.37   8%  perf-profile.calltrace.cycle=
s-pp.free_pcppages_bulk.free_unref_page.release_pages.tlb_batch_pages_flush=
.tlb_finish_mmu
>       0.00            +9.6        9.60   6%  perf-profile.calltrace.cycle=
s-pp.free_unref_page.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.unm=
ap_region
>       0.00           +65.5       65.48   2%  perf-profile.calltrace.cycle=
s-pp.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_=
mm_fault.handle_mm_fault
>       0.00           +72.5       72.51   2%  perf-profile.calltrace.cycle=
s-pp.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_=
mm_fault.do_user_addr_fault

With the commit, most CPU cycles are consumed for clear huge page.  This
is expected.  We allocate more pages, so, we need more cycles to clear
them.

Check the source code of test case (will-it-scale/malloc1), I found that
it will allocate some memory with malloc() then free it.

In the parent commit, because the virtual memory address isn't aligned
with 2M, normal page will be allocated.  With the commit, THP will be
allocated, so more page clearing and less LRU lock contention.  I think
this is the expected behavior of the commit.  And the test case isn't so
popular (malloc() then free() but don't access the memory allocated).  So
this regression isn't important.  We can just ignore it.

Best Regards,
Huang, Ying
--===============8906653557988228371==--

