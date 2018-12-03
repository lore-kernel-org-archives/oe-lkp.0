Content-Type: multipart/mixed; boundary="===============0406886226764855922=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Mon, 03 Dec 2018 15:50:18 -0800
Message-ID: <alpine.DEB.2.21.1812031545080.161134@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0406886226764855922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This fixes a 13.9% of remote memory access regression and 40% remote
memory allocation regression on Haswell when the local node is fragmented
for hugepage sized pages and memory is being faulted with either the thp
defrag setting of "always" or has been madvised with MADV_HUGEPAGE.

The usecase that initially identified this issue were binaries that mremap
their .text segment to be backed by transparent hugepages on startup.
They do mmap(), madvise(MADV_HUGEPAGE), memcpy(), and mremap().

This requires a full revert and partial revert of commits merged during
the 4.20 rc cycle.  The full revert, of ac5b2c18911f ("mm: thp: relax
__GFP_THISNODE for MADV_HUGEPAGE mappings"), was anticipated to fix large
amounts of swap activity on the local zone when faulting hugepages by
falling back to remote memory.  This remote allocation causes the access
regression and, if fragmented, the allocation regression.

This patchset also fixes that issue by not attempting direct reclaim at
all when compaction fails to free a hugepage.  Note that if remote memory
was also low or fragmented that ac5b2c18911f ("mm: thp: relax
__GFP_THISNODE for MADV_HUGEPAGE mappings") would only have compounded the
problem it attempts to address by now thrashing all nodes instead of only
the local node.

The reverts for the stable trees will be different: just a straight revert
of commit ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for MADV_HUGEPAGE
mappings") is likely needed.

Cross compiled for architectures with thp support and thp enabled:
arc (with ISA_ARCV2), arm (with ARM_LPAE), arm64, i386, mips64, powerpc, =

s390, sparc, x86_64.

Andrea, is this acceptable?
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c     |    8 +++---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c |    3 --
 include/linux/gfp.h                      |    3 +-
 include/linux/mempolicy.h                |    2 -
 mm/huge_memory.c                         |   41 +++++++++++---------------=
-----
 mm/mempolicy.c                           |    7 +++--
 mm/page_alloc.c                          |   16 ++++++++++++
 7 files changed, 42 insertions(+), 38 deletions(-)

--===============0406886226764855922==--

