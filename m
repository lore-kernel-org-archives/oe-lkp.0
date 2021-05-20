Content-Type: multipart/mixed; boundary="===============2835332901264340149=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: [PATCH v3 00/14] Multigenerational LRU Framework
Date: Thu, 20 May 2021 00:53:41 -0600
Message-ID: <20210520065355.2736558-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2835332901264340149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

What's new in v3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1) Fixed a bug reported by the Arch Linux kernel team:
   https://github.com/zen-kernel/zen-kernel/issues/207
2) Rebased to v5.13-rc2.

Highlights from v2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Konstantin Kharlamov <hi-angel@yandex.ru> reported:
  My success story: I have Archlinux with 8G RAM + zswap + swap. While
  developing, I have lots of apps opened such as multiple LSP-servers
  for different langs, chats, two browsers, etc. Usually, my system
  gets quickly to a point of SWAP-storms, where I have to kill
  LSP-servers, restart browsers to free memory, etc, otherwise the
  system lags heavily and is barely usable.
 =

  1.5 day ago I migrated from 5.11.15 kernel to 5.12 + the LRU
  patchset, and I started up by opening lots of apps to create memory
  pressure, and worked for a day like this. Till now I had *not a
  single SWAP-storm*, and mind you I got 3.4G in SWAP. I was never
  getting to the point of 3G in SWAP before without a single
  SWAP-storm.

TLDR
=3D=3D=3D=3D
The current page reclaim is too expensive in terms of CPU usage and
often making poor choices about what to evict. We would like to offer
an alternative framework that is performant, versatile and
straightforward.

Repo
=3D=3D=3D=3D
git fetch https://linux-mm.googlesource.com/page-reclaim refs/changes/53/12=
53/1

Problems
=3D=3D=3D=3D=3D=3D=3D=3D
Notion of active/inactive
-------------------------
Data centers need to predict whether a job can successfully land on a
machine without actually impacting the existing jobs. The granularity
of the active/inactive is too coarse to be useful for job schedulers
to make such decisions. In addition, data centers need to monitor
their memory utilization for horizontal scaling. The active/inactive
cannot give any insight into a pool of machines because aggregating
them across multiple machines without a common frame of reference
yields no meaningful results.

Phones and laptops need to make good choices about what to evict,
since they are more sensitive to the major faults and the power
consumption. Major faults can cause "janks" (slow UI renderings) and
negatively impact user experience. The selection between anon and file
types has been suboptimal because direct comparisons between them are
infeasible based on the notion of active/inactive. On phones and
laptops, executable pages are frequently evicted despite the fact that
there are many less recently used anon pages. Conversely, on
workstations building large projects, anon pages are occasionally
swapped out while page cache contains many less recently used pages.

Fundamentally, the notion of active/inactive has very limited ability
to measure temporal locality.

Incremental scans via rmap
--------------------------
Each incremental scan picks up at where the last scan left off and
stops after it has found a handful of unreferenced pages. For
workloads using a large amount of anon memory, incremental scans lose
the advantage under sustained memory pressure due to high ratios of
the number of scanned pages to the number of reclaimed pages. On top
of this, the rmap has complex data structures. And the combined
effects typically result in a high amount of CPU usage in the reclaim
path.

Simply put, incremental scans via rmap have no regard for spatial
locality.

Solutions
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Notion of generation numbers
----------------------------
The notion of generation numbers introduces a temporal dimension. Each
generation is a dot on the timeline and it includes all pages that
have been referenced since it was created.

Given an lruvec, scans of anon and file types and selections between
them are all based on direct comparisons of generation numbers, which
are simple and yet effective.

A larger number of pages can be spread out across a configurable
number of generations, which are associated with timestamps and
therefore aggregatable. This is specifically designed for data centers
that require working set estimation and proactive reclaim.

Differential scans via page tables
----------------------------------
Each differential scan discovers all pages that have been referenced
since the last scan. It walks the mm_struct list associated with an
lruvec to scan page tables of processes that have been scheduled since
the last scan. The cost of each differential scan is roughly
proportional to the number of referenced pages it discovers. Page
tables usually have good memory locality. The end result is generally
a significant reduction in CPU usage, for workloads using a large
amount of anon memory.

For workloads that have extremely sparse page tables, it is still
possible to fall back to incremental scans via rmap.

Framework
=3D=3D=3D=3D=3D=3D=3D=3D=3D
For each lruvec, evictable pages are divided into multiple
generations. The youngest generation number is stored in
lrugen->max_seq for both anon and file types as they are aged on an
equal footing. The oldest generation numbers are stored in
lrugen->min_seq[2] separately for anon and file types as clean file
pages can be evicted regardless of may_swap or may_writepage. These
three variables are monotonically increasing. Generation numbers are
truncated into order_base_2(MAX_NR_GENS+1) bits in order to fit into
page->flags. The sliding window technique is used to prevent truncated
generation numbers from overlapping. Each truncated generation number
is an index to
lrugen->lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES]. Evictable
pages are added to the per-zone lists indexed by lrugen->max_seq or
lrugen->min_seq[2] (modulo MAX_NR_GENS), depending on their types.

Each generation is then divided into multiple tiers. Tiers represent
levels of usage from file descriptors only. Pages accessed N times via
file descriptors belong to tier order_base_2(N). Each generation
contains at most MAX_NR_TIERS tiers, and they require additional
MAX_NR_TIERS-2 bits in page->flags. In contrast to moving across
generations which requires the lru lock for the list operations,
moving across tiers only involves an atomic operation on page->flags
and therefore has a negligible cost. A feedback loop modeled after the
PID controller monitors the refault rates across all tiers and decides
when to activate pages from which tiers in the reclaim path.

The framework comprises two conceptually independent components: the
aging and the eviction, which can be invoked separately from user
space for the purpose of working set estimation and proactive reclaim.

Aging
-----
The aging produces young generations. Given an lruvec, the aging scans
page tables for referenced pages of this lruvec. Upon finding one, the
aging updates its generation number to max_seq. After each round of
scan, the aging increments max_seq.

The aging maintains either a system-wide mm_struct list or per-memcg
mm_struct lists, and it only scans page tables of processes that have
been scheduled since the last scan.

The aging is due when both of min_seq[2] reaches max_seq-1, assuming
both anon and file types are reclaimable.

Eviction
--------
The eviction consumes old generations. Given an lruvec, the eviction
scans the pages on the per-zone lists indexed by either of min_seq[2].
It first tries to select a type based on the values of min_seq[2].
When anon and file types are both available from the same generation,
it selects the one that has a lower refault rate.

During a scan, the eviction sorts pages according to their new
generation numbers, if the aging has found them referenced. It also
moves pages from the tiers that have higher refault rates than tier 0
to the next generation.

When it finds all the per-zone lists of a selected type are empty, the
eviction increments min_seq[2] indexed by this selected type.

Use cases
=3D=3D=3D=3D=3D=3D=3D=3D=3D
High anon workloads
-------------------
Our real-world benchmark that browses popular websites in multiple
Chrome tabs demonstrates 51% less CPU usage from kswapd and 52% (full)
less PSI.

Without this patchset, the profile of kswapd looks like:
  31.03%  page_vma_mapped_walk
  25.59%  lzo1x_1_do_compress
   4.63%  do_raw_spin_lock
   3.89%  vma_interval_tree_iter_next
   3.33%  vma_interval_tree_subtree_search

With this patchset, it looks like:
  49.36%  lzo1x_1_do_compress
   4.54%  page_vma_mapped_walk
   4.45%  memset_erms
   3.47%  walk_pte_range
   2.88%  zram_bvec_rw

In addition, direct reclaim latency is reduced by 22% at 99th
percentile and the number of refaults is reduced by 7%. Both metrics
are important to phones and laptops as they are highly correlated to
user experience.

High page cache workloads
-------------------------
Tiers are specifically designed to improve the performance of page
cache under memory pressure. The fio/io_uring benchmark shows 14%
increase in IOPS when randomly accessing in buffered I/O mode.

Without this patchset, the profile of fio/io_uring looks like:
  Children  Self   Symbol
  -----------------------------------
  12.03%    0.03%  __page_cache_alloc
   6.53%    0.83%  shrink_active_list
   2.53%    0.44%  mark_page_accessed

With this patchset, it looks like:
  Children  Self   Symbol
  -----------------------------------
  9.45%     0.03%  __page_cache_alloc
  0.52%     0.46%  mark_page_accessed

Working set estimation
----------------------
User space can invoke the aging by writing "+ memcg_id node_id gen
[swappiness]" to /sys/kernel/debug/lru_gen. This debugfs interface
also provides the birth time and the size of each generation.

For example, given a pool of machines, a job scheduler periodically
invokes the aging to estimate the working set of each machine. And it
ranks the machines based on the sizes of their working sets and
selects the most ideal ones to land new jobs.

Proactive reclaim
-----------------
User space can invoke the eviction by writing "- memcg_id node_id gen
[swappiness] [nr_to_reclaim]" to /sys/kernel/debug/lru_gen. Multiple
command lines are supported, so does concatenation with delimiters.

For example, a job scheduler can invoke the eviction if it anticipates
new jobs. The savings from proactive reclaim may provide certain SLA
when new jobs actually land.

Yu Zhao (14):
  include/linux/memcontrol.h: do not warn in page_memcg_rcu() if
    !CONFIG_MEMCG
  include/linux/nodemask.h: define next_memory_node() if !CONFIG_NUMA
  include/linux/cgroup.h: export cgroup_mutex
  mm, x86: support the access bit on non-leaf PMD entries
  mm/vmscan.c: refactor shrink_node()
  mm/workingset.c: refactor pack_shadow() and unpack_shadow()
  mm: multigenerational lru: groundwork
  mm: multigenerational lru: activation
  mm: multigenerational lru: mm_struct list
  mm: multigenerational lru: aging
  mm: multigenerational lru: eviction
  mm: multigenerational lru: user interface
  mm: multigenerational lru: Kconfig
  mm: multigenerational lru: documentation

 Documentation/vm/index.rst        |    1 +
 Documentation/vm/multigen_lru.rst |  143 ++
 arch/Kconfig                      |    9 +
 arch/x86/Kconfig                  |    1 +
 arch/x86/include/asm/pgtable.h    |    2 +-
 arch/x86/mm/pgtable.c             |    5 +-
 fs/exec.c                         |    2 +
 fs/fuse/dev.c                     |    3 +-
 include/linux/cgroup.h            |   15 +-
 include/linux/memcontrol.h        |    7 +-
 include/linux/mm.h                |    2 +
 include/linux/mm_inline.h         |  234 +++
 include/linux/mm_types.h          |  107 ++
 include/linux/mmzone.h            |  117 ++
 include/linux/nodemask.h          |    1 +
 include/linux/page-flags-layout.h |   19 +-
 include/linux/page-flags.h        |    4 +-
 include/linux/pgtable.h           |    4 +-
 include/linux/swap.h              |    4 +-
 kernel/bounds.c                   |    6 +
 kernel/events/uprobes.c           |    2 +-
 kernel/exit.c                     |    1 +
 kernel/fork.c                     |   10 +
 kernel/kthread.c                  |    1 +
 kernel/sched/core.c               |    2 +
 mm/Kconfig                        |   58 +
 mm/huge_memory.c                  |    5 +-
 mm/khugepaged.c                   |    2 +-
 mm/memcontrol.c                   |   28 +
 mm/memory.c                       |   10 +-
 mm/migrate.c                      |    2 +-
 mm/mm_init.c                      |    6 +-
 mm/mmzone.c                       |    2 +
 mm/rmap.c                         |    6 +
 mm/swap.c                         |   22 +-
 mm/swapfile.c                     |    6 +-
 mm/userfaultfd.c                  |    2 +-
 mm/vmscan.c                       | 2638 ++++++++++++++++++++++++++++-
 mm/workingset.c                   |  169 +-
 39 files changed, 3498 insertions(+), 160 deletions(-)
 create mode 100644 Documentation/vm/multigen_lru.rst

-- =

2.31.1.751.gd2f1c929bd-goog

--===============2835332901264340149==--

