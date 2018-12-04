Content-Type: multipart/mixed; boundary="===============4211561009598816770=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Tue, 04 Dec 2018 11:10:58 +0100
Message-ID: <bb198d88-27be-0d5c-d871-1ffd26a08e29@suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812031545080.161134@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4211561009598816770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/4/18 12:50 AM, David Rientjes wrote:
> This fixes a 13.9% of remote memory access regression and 40% remote
> memory allocation regression on Haswell when the local node is fragmented
> for hugepage sized pages and memory is being faulted with either the thp
> defrag setting of "always" or has been madvised with MADV_HUGEPAGE.
> =

> The usecase that initially identified this issue were binaries that mremap
> their .text segment to be backed by transparent hugepages on startup.
> They do mmap(), madvise(MADV_HUGEPAGE), memcpy(), and mremap().
> =

> This requires a full revert and partial revert of commits merged during
> the 4.20 rc cycle.  The full revert, of ac5b2c18911f ("mm: thp: relax
> __GFP_THISNODE for MADV_HUGEPAGE mappings"), was anticipated to fix large
> amounts of swap activity on the local zone when faulting hugepages by
> falling back to remote memory.  This remote allocation causes the access
> regression and, if fragmented, the allocation regression.
> =

> This patchset also fixes that issue by not attempting direct reclaim at
> all when compaction fails to free a hugepage.  Note that if remote memory
> was also low or fragmented that ac5b2c18911f ("mm: thp: relax
> __GFP_THISNODE for MADV_HUGEPAGE mappings") would only have compounded the
> problem it attempts to address by now thrashing all nodes instead of only
> the local node.
> =

> The reverts for the stable trees will be different: just a straight revert
> of commit ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for MADV_HUGEPAGE
> mappings") is likely needed.
> =

> Cross compiled for architectures with thp support and thp enabled:
> arc (with ISA_ARCV2), arm (with ARM_LPAE), arm64, i386, mips64, powerpc, =

> s390, sparc, x86_64.
> =

> Andrea, is this acceptable?

So, AFAIK, the situation is:

- commit 5265047ac301 in 4.1 introduced __GFP_THISNODE for THP. The
intention came a bit earlier in 4.0 commit 077fcf116c8c. (I admit acking
both as it seemed to make sense).
- The resulting node-reclaim-like behavior regressed Andrea's KVM
workloads, but reverting it (only for madvised or non-default
defrag=3Dalways THP by commit ac5b2c18911f) would regress David's
workloads starting with 4.20 to pre-4.1 levels.

If the decision is that it's too late to revert a 4.1 regression for one
kind of workload in 4.20 because it causes regression for another
workload, then I guess we just revert ac5b2c18911f (patch 1) for 4.20
and don't rush a different fix (patch 2) to 4.20. It's not a big
difference if a 4.1 regression is fixed in 4.20 or 4.21?

Because there might be other unexpected consequences of patch 2 that
testing won't be able to catch in the remaining 4.20 rc's. And I'm not
even sure if it will fix Andrea's workloads. While it should prevent
node-reclaim-like thrashing, it will still mean that KVM (or anyone)
won't be able to allocate THP's remotely, even if the local node is
exhausted of both huge and base pages.

> ---
>  drivers/gpu/drm/ttm/ttm_page_alloc.c     |    8 +++---
>  drivers/gpu/drm/ttm/ttm_page_alloc_dma.c |    3 --
>  include/linux/gfp.h                      |    3 +-
>  include/linux/mempolicy.h                |    2 -
>  mm/huge_memory.c                         |   41 +++++++++++-------------=
-------
>  mm/mempolicy.c                           |    7 +++--
>  mm/page_alloc.c                          |   16 ++++++++++++
>  7 files changed, 42 insertions(+), 38 deletions(-)
> =



--===============4211561009598816770==--

