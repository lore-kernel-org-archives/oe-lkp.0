Content-Type: multipart/mixed; boundary="===============1950118246902334295=="
MIME-Version: 1.0
From: Konstantin Kharlamov <hi-angel@yandex.ru>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Fri, 30 Apr 2021 02:46:53 +0300
Message-ID: <140226722f2032c86301fbd326d91baefe3d7d23.camel@yandex.ru>
In-Reply-To: <20210413065633.2782273-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1950118246902334295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In case you need it yet, this series is:

Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>

My success story: I have Archlinux with 8G RAM + zswap + swap. While develo=
ping,
I have lots of apps opened such as multiple LSP-servers for different langs,
chats, two browsers, etc=E2=80=A6 Usually, my system gets quickly to a poin=
t of SWAP-
storms, where I have to kill LSP-servers, restart browsers to free memory, =
etc,
otherwise the system lags heavily and is barely usable.

1.5 day ago I migrated from 5.11.15 kernel to 5.12 + the LRU patchset, and I
started up by opening lots of apps to create memory pressure, and worked fo=
r a
day like this. Till now I had *not a single SWAP-storm*, and mind you I got=
 3.4G
in SWAP. I was never getting to the point of 3G in SWAP before without a si=
ngle
SWAP-storm.

Right now my gf on Fedora 33 also suffers from SWAP-storms on her old Macbo=
ok
2013 with 4G RAM + zswap + swap, I think the next week I'll build for her 5=
.12 +
LRU patchset as well. Will see how it goes, I expect it will improve her
experience by a lot too.

P.S.: upon replying please keep me CCed, I'm not subscribed to the list

On Tue, 2021-04-13 at 00:56 -0600, Yu Zhao wrote:
> What's new in v2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Special thanks to Jens Axboe for reporting a regression in buffered
> I/O and helping test the fix.
> =

> This version includes the support of tiers, which represent levels of
> usage from file descriptors only. Pages accessed N times via file
> descriptors belong to tier order_base_2(N). Each generation contains
> at most MAX_NR_TIERS tiers, and they require additional MAX_NR_TIERS-2
> bits in page->flags. In contrast to moving across generations which
> requires the lru lock, moving across tiers only involves an atomic
> operation on page->flags and therefore has a negligible cost. A
> feedback loop modeled after the well-known PID controller monitors the
> refault rates across all tiers and decides when to activate pages from
> which tiers, on the reclaim path.
> =

> This feedback model has a few advantages over the current feedforward
> model:
> 1) It has a negligible overhead in the buffered I/O access path
> =C2=A0=C2=A0 because activations are done in the reclaim path.
> 2) It takes mapped pages into account and avoids overprotecting pages
> =C2=A0=C2=A0 accessed multiple times via file descriptors.
> 3) More tiers offer better protection to pages accessed more than
> =C2=A0=C2=A0 twice when buffered-I/O-intensive workloads are under memory
> =C2=A0=C2=A0 pressure.
> =

> The fio/io_uring benchmark shows 14% improvement in IOPS when randomly
> accessing Samsung PM981a in the buffered I/O mode.
> =

> Highlights from the discussions on v1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Thanks to Ying Huang and Dave Hansen for the comments and suggestions
> on page table scanning.
> =

> A simple worst-case scenario test did not find page table scanning
> underperforms the rmap because of the following optimizations:
> 1) It will not scan page tables from processes that have been sleeping
> =C2=A0=C2=A0 since the last scan.
> 2) It will not scan PTE tables under non-leaf PMD entries that do not
> =C2=A0=C2=A0 have the accessed bit set, when
> =C2=A0=C2=A0 CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
> 3) It will not zigzag between the PGD table and the same PMD or PTE
> =C2=A0=C2=A0 table spanning multiple VMAs. In other words, it finishes al=
l the
> =C2=A0=C2=A0 VMAs with the range of the same PMD or PTE table before it r=
eturns
> =C2=A0=C2=A0 to the PGD table. This optimizes workloads that have large n=
umbers
> =C2=A0=C2=A0 of tiny VMAs, especially when CONFIG_PGTABLE_LEVELS=3D5.
> =

> TLDR
> =3D=3D=3D=3D
> The current page reclaim is too expensive in terms of CPU usage and
> often making poor choices about what to evict. We would like to offer
> an alternative framework that is performant, versatile and
> straightforward.
> =

> Repo
> =3D=3D=3D=3D
> git fetch https://linux-mm.googlesource.com/page-reclaim=C2=A0refs/change=
s/73/1173/1
> =

> Gerrit https://linux-mm-review.googlesource.com/c/page-reclaim/+/1173
> =

> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> DRAM is a major factor in total cost of ownership, and improving
> memory overcommit brings a high return on investment. Over the past
> decade of research and experimentation in memory overcommit, we
> observed a distinct trend across millions of servers and clients: the
> size of page cache has been decreasing because of the growing
> popularity of cloud storage. Nowadays anon pages account for more than
> 90% of our memory consumption and page cache contains mostly
> executable pages.
> =

> Problems
> =3D=3D=3D=3D=3D=3D=3D=3D
> Notion of active/inactive
> -------------------------
> For servers equipped with hundreds of gigabytes of memory, the
> granularity of the active/inactive is too coarse to be useful for job
> scheduling. False active/inactive rates are relatively high, and thus
> the assumed savings may not materialize.
> =

> For phones and laptops, executable pages are frequently evicted
> despite the fact that there are many less recently used anon pages.
> Major faults on executable pages cause "janks" (slow UI renderings)
> and negatively impact user experience.
> =

> For lruvecs from different memcgs or nodes, comparisons are impossible
> due to the lack of a common frame of reference.
> =

> Incremental scans via rmap
> --------------------------
> Each incremental scan picks up at where the last scan left off and
> stops after it has found a handful of unreferenced pages. For
> workloads using a large amount of anon memory, incremental scans lose
> the advantage under sustained memory pressure due to high ratios of
> the number of scanned pages to the number of reclaimed pages. In our
> case, the average ratio of pgscan to pgsteal is above 7.
> =

> On top of that, the rmap has poor memory locality due to its complex
> data structures. The combined effects typically result in a high
> amount of CPU usage in the reclaim path. For example, with zram, a
> typical kswapd profile on v5.11 looks like:
> =C2=A0 31.03%=C2=A0 page_vma_mapped_walk
> =C2=A0 25.59%=C2=A0 lzo1x_1_do_compress
> =C2=A0=C2=A0 4.63%=C2=A0 do_raw_spin_lock
> =C2=A0=C2=A0 3.89%=C2=A0 vma_interval_tree_iter_next
> =C2=A0=C2=A0 3.33%=C2=A0 vma_interval_tree_subtree_search
> =

> And with real swap, it looks like:
> =C2=A0 45.16%=C2=A0 page_vma_mapped_walk
> =C2=A0=C2=A0 7.61%=C2=A0 do_raw_spin_lock
> =C2=A0=C2=A0 5.69%=C2=A0 vma_interval_tree_iter_next
> =C2=A0=C2=A0 4.91%=C2=A0 vma_interval_tree_subtree_search
> =C2=A0=C2=A0 3.71%=C2=A0 page_referenced_one
> =

> Solutions
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Notion of generation numbers
> ----------------------------
> The notion of generation numbers introduces a quantitative approach to
> memory overcommit. A larger number of pages can be spread out across
> a configurable number of generations, and each generation includes all
> pages that have been referenced since the last generation. This
> improved granularity yields relatively low false active/inactive
> rates.
> =

> Given an lruvec, scans of anon and file types and selections between
> them are all based on direct comparisons of generation numbers, which
> are simple and yet effective. For different lruvecs, comparisons are
> still possible based on birth times of generations.
> =

> Differential scans via page tables
> ----------------------------------
> Each differential scan discovers all pages that have been referenced
> since the last scan. Specifically, it walks the mm_struct list
> associated with an lruvec to scan page tables of processes that have
> been scheduled since the last scan. The cost of each differential scan
> is roughly proportional to the number of referenced pages it
> discovers. Unless address spaces are extremely sparse, page tables
> usually have better memory locality than the rmap. The end result is
> generally a significant reduction in CPU usage, for workloads using a
> large amount of anon memory.
> =

> Our real-world benchmark that browses popular websites in multiple
> Chrome tabs demonstrates 51% less CPU usage from kswapd and 52% (full)
> less PSI on v5.11. With this patchset, kswapd profile looks like:
> =C2=A0 49.36%=C2=A0 lzo1x_1_do_compress
> =C2=A0=C2=A0 4.54%=C2=A0 page_vma_mapped_walk
> =C2=A0=C2=A0 4.45%=C2=A0 memset_erms
> =C2=A0=C2=A0 3.47%=C2=A0 walk_pte_range
> =C2=A0=C2=A0 2.88%=C2=A0 zram_bvec_rw
> =

> In addition, direct reclaim latency is reduced by 22% at 99th
> percentile and the number of refaults is reduced by 7%. Both metrics
> are important to phones and laptops as they are correlated to user
> experience.
> =

> Framework
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> For each lruvec, evictable pages are divided into multiple
> generations. The youngest generation number is stored in
> lruvec->evictable.max_seq for both anon and file types as they are
> aged on an equal footing. The oldest generation numbers are stored in
> lruvec->evictable.min_seq[2] separately for anon and file types as
> clean file pages can be evicted regardless of may_swap or
> may_writepage. Generation numbers are truncated into
> order_base_2(MAX_NR_GENS+1) bits in order to fit into page->flags. The
> sliding window technique is used to prevent truncated generation
> numbers from overlapping. Each truncated generation number is an inde
> to lruvec->evictable.lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES].
> Evictable pages are added to the per-zone lists indexed by max_seq or
> min_seq[2] (modulo MAX_NR_GENS), depending on whether they are being
> faulted in.
> =

> Each generation is then divided into multiple tiers. Tiers represent
> levels of usage from file descriptors only. Pages accessed N times via
> file descriptors belong to tier order_base_2(N). In contrast to moving
> across generations which requires the lru lock, moving across tiers
> only involves an atomic operation on page->flags and therefore has a
> lower cost. A feedback loop modeled after the well-known PID
> controller monitors the refault rates across all tiers and decides
> when to activate pages from which tiers on the reclaim path.
> =

> The framework comprises two conceptually independent components: the
> aging and the eviction, which can be invoked separately from user
> space.
> =

> Aging
> -----
> The aging produces young generations. Given an lruvec, the aging scans
> page tables for referenced pages of this lruvec. Upon finding one, the
> aging updates its generation number to max_seq. After each round of
> scan, the aging increments max_seq.
> =

> The aging maintains either a system-wide mm_struct list or per-memcg
> mm_struct lists and tracks whether an mm_struct is being used or has
> been used since the last scan. Multiple threads can concurrently work
> on the same mm_struct list, and each of them will be given a different
> mm_struct belonging to a process that has been scheduled since the
> last scan.
> =

> The aging is due when both of min_seq[2] reaches max_seq-1, assuming
> both anon and file types are reclaimable.
> =

> Eviction
> --------
> The eviction consumes old generations. Given an lruvec, the eviction
> scans the pages on the per-zone lists indexed by either of min_seq[2].
> It first tries to select a type based on the values of min_seq[2].
> When anon and file types are both available from the same generation,
> it selects the one that has a lower refault rate.
> =

> During a scan, the eviction sorts pages according to their generation
> numbers, if the aging has found them referenced. It also moves pages
> from the tiers that have higher refault rates than tier 0 to the next
> generation.
> =

> When it finds all the per-zone lists of a selected type are empty, the
> eviction increments min_seq[2] indexed by this selected type.
> =

> Use cases
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> On Android, our most advanced simulation that generates memory
> pressure from realistic user behavior shows 18% fewer low-memory
> kills, which in turn reduces cold starts by 16%.
> =

> On Borg, a similar approach enables us to identify jobs that
> underutilize their memory and downsize them considerably without
> compromising any of our service level indicators.
> =

> On Chrome OS, our field telemetry reports 96% fewer low-memory tab
> discards and 59% fewer OOM kills from fully-utilized devices and no
> regressions in monitored user experience from underutilized devices.
> =

> Working set estimation
> ----------------------
> User space can invoke the aging by writing "+ memcg_id node_id gen
> [swappiness]" to /sys/kernel/debug/lru_gen. This debugfs interface
> also provides the birth time and the size of each generation.
> =

> Proactive reclaim
> -----------------
> User space can invoke the eviction by writing "- memcg_id node_id gen
> [swappiness] [nr_to_reclaim]" to /sys/kernel/debug/lru_gen. Multiple
> command lines are supported, so does concatenation with delimiters.
> =

> Intensive buffered I/O
> ----------------------
> Tiers are specifically designed to improve the performance of
> intensive buffered I/O under memory pressure. The fio/io_uring
> benchmark shows 14% improvement in IOPS when randomly accessing
> Samsung PM981a in buffered I/O mode.
> =

> For far memory tiering and NUMA-aware job scheduling, please refer to
> the reference section.
> =

> FAQ
> =3D=3D=3D
> Why not try to improve the existing code?
> -----------------------------------------
> We have tried but concluded the aforementioned problems are
> fundamental, and therefore changes made on top of them will not result
> in substantial gains.
> =

> What particular workloads does it help?
> ---------------------------------------
> This framework is designed to improve the performance of the page
> reclaim under any types of workloads.
> =

> How would it benefit the community?
> -----------------------------------
> Google is committed to promoting sustainable development of the
> community. We hope successful adoptions of this framework will
> steadily climb over time. To that end, we would be happy to learn your
> workloads and work with you case by case, and we will do our best to
> keep the repo fully maintained. For those whose workloads rely on the
> existing code, we will make sure you will not be affected in any way.
> =

> References
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Long-term SLOs for reclaimed cloud computing resources
> =C2=A0=C2=A0 https://research.google/pubs/pub43017/
> 2. Profiling a warehouse-scale computer
> =C2=A0=C2=A0 https://research.google/pubs/pub44271/
> 3. Evaluation of NUMA-Aware Scheduling in Warehouse-Scale Clusters
> =C2=A0=C2=A0 https://research.google/pubs/pub48329/
> 4. Software-defined far memory in warehouse-scale computers
> =C2=A0=C2=A0 https://research.google/pubs/pub48551/
> 5. Borg: the Next Generation
> =C2=A0=C2=A0 https://research.google/pubs/pub49065/
> =

> Yu Zhao (16):
> =C2=A0 include/linux/memcontrol.h: do not warn in page_memcg_rcu() if
> =C2=A0=C2=A0=C2=A0 !CONFIG_MEMCG
> =C2=A0 include/linux/nodemask.h: define next_memory_node() if !CONFIG_NUMA
> =C2=A0 include/linux/huge_mm.h: define is_huge_zero_pmd() if
> =C2=A0=C2=A0=C2=A0 !CONFIG_TRANSPARENT_HUGEPAGE
> =C2=A0 include/linux/cgroup.h: export cgroup_mutex
> =C2=A0 mm/swap.c: export activate_page()
> =C2=A0 mm, x86: support the access bit on non-leaf PMD entries
> =C2=A0 mm/vmscan.c: refactor shrink_node()
> =C2=A0 mm: multigenerational lru: groundwork
> =C2=A0 mm: multigenerational lru: activation
> =C2=A0 mm: multigenerational lru: mm_struct list
> =C2=A0 mm: multigenerational lru: aging
> =C2=A0 mm: multigenerational lru: eviction
> =C2=A0 mm: multigenerational lru: page reclaim
> =C2=A0 mm: multigenerational lru: user interface
> =C2=A0 mm: multigenerational lru: Kconfig
> =C2=A0 mm: multigenerational lru: documentation
> =

> =C2=A0Documentation/vm/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0Documentation/vm/multigen_lru.rst |=C2=A0 192 +++
> =C2=A0arch/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 9 +
> =C2=A0arch/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0arch/x86/include/asm/pgtable.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 2 +-
> =C2=A0arch/x86/mm/pgtable.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +-
> =C2=A0fs/exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0fs/fuse/dev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 3 +-
> =C2=A0fs/proc/task_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +-
> =C2=A0include/linux/cgroup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 15 +-
> =C2=A0include/linux/huge_mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +
> =C2=A0include/linux/memcontrol.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 7 +-
> =C2=A0include/linux/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0include/linux/mm_inline.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 294 ++++
> =C2=A0include/linux/mm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 117 ++
> =C2=A0include/linux/mmzone.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 118 +-
> =C2=A0include/linux/nodemask.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0include/linux/page-flags-layout.h |=C2=A0=C2=A0 20 +-
> =C2=A0include/linux/page-flags.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 4 +-
> =C2=A0include/linux/pgtable.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 4 +-
> =C2=A0include/linux/swap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +-
> =C2=A0kernel/bounds.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 6 +
> =C2=A0kernel/events/uprobes.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0kernel/exit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 1 +
> =C2=A0kernel/fork.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 10 +
> =C2=A0kernel/kthread.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0kernel/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0mm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 55 +
> =C2=A0mm/huge_memory.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +-
> =C2=A0mm/khugepaged.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 2 +-
> =C2=A0mm/memcontrol.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 28 +
> =C2=A0mm/memory.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 14 +-
> =C2=A0mm/migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0mm/mm_init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 16 +-
> =C2=A0mm/mmzone.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 2 +
> =C2=A0mm/rmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +
> =C2=A0mm/swap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 54 +-
> =C2=A0mm/swapfile.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 6 +-
> =C2=A0mm/userfaultfd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0mm/vmscan.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2580 ++++++++++++++++++++++++++++-
> =C2=A0mm/workingset.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 179 +-
> =C2=A041 files changed, 3603 insertions(+), 180 deletions(-)
> =C2=A0create mode 100644 Documentation/vm/multigen_lru.rst
> =



--===============1950118246902334295==--

