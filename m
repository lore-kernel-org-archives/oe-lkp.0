Content-Type: multipart/mixed; boundary="===============2808864947957115746=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 09bc0443e9: will-it-scale.per_thread_ops -7.2% regression
Date: Sat, 08 May 2021 19:12:14 -0400
Message-ID: <YJcazvhz2E5256m5@redhat.com>
In-Reply-To: <82458eba-7ecf-018a-7e73-671199c8794a@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2808864947957115746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 08, 2021 at 10:58:34AM +0800, Xing Zhengjun wrote:
> Hi Andrea,
> =

>  =C2=A0=C2=A0=C2=A0 I re-test it more than 10 times, the regression still=
 exists.

Probably I didn't measure it because for me they may have always
landed in the same cacheline even before the patch was applied.

Ouch btw looking at flush_tlb_pending I also noticed I forgot to revert
6ce64428d62026a10cb5d80138ff2f90cc21d367, that has to be added to the
pile of SMP unscalable upstream code to be reverted on my tree to
improve performance even more to the wp fault with uffd-wp.

>  =C2=A0=C2=A0=C2=A0 0d2285c62210(mm: gup: pack has_pinned in MMF_HAS_PINN=
ED) removed =

> "atomic_t has_pinned" from "struct mm_struct", it changed the "struct =

> mm_struct" cache line layout (please see in the attached pahole dumped =

> results), in its parent commit, "spinlock_t page_table_lock" and "struct =

> rw_semaphore mmap_lock" in two different cache line, but in =

> 0d2285c62210, they may in the same cache line, "mm_struct" is widely =

> used, it may have potential contention issue, so I apply the following =

> patch change the layout, retest the regression is gone (very small, -0.9%=
).

Agreed, the accidental cacheline alignment change is the only thing
that could explain a performance difference, except it didn't make a
difference for me.

I applied this, this should fix your issue and it is going to work
without depending on .config options (see all fields before mmap_lock,
they vary depending on config/arch).

I'm not really sure the problem is the page_table_lock even, it may be
just false sharing on the fields at the top of the vma.

The best I recommend to try also in addition of the below is to move
this line:

+		struct rw_semaphore mmap_lock ____cacheline_aligned_in_smp;

at the very end. so it gets 64 bytes alone and reduces all false
sharing to zero. That cacheline is heavily heavily contended during
the mmap test. so it may be worth wasting 64bytes per vma even...

The below wastes in average not more than 32 bytes.

>From 99a2452759bb5cfb2a77405d7db42968bf7e7509 Mon Sep 17 00:00:00 2001
From: Andrea Arcangeli <aarcange@redhat.com>
Date: Sat, 8 May 2021 18:54:34 -0400
Subject: [PATCH 1/1] mm: cacheline alignment for page_table_lock and mmap_l=
ock

It's important to keep the two fields in two different cachelines and
this will enforce it.

The kernel test robot reported a per_thread_ops -7.2% regression for
the will-it-scale mmap2 threaded testcase when the two fields
accidentally landed in the same cacheline.

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
---
 include/linux/mm_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 7fc7a3320ad9..714b4c3e2a7c 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -456,7 +456,7 @@ struct mm_struct {
 		spinlock_t page_table_lock; /* Protects page tables and some
 					     * counters
 					     */
-		struct rw_semaphore mmap_lock;
+		struct rw_semaphore mmap_lock ____cacheline_aligned_in_smp;
 =

 		struct list_head mmlist; /* List of maybe swapped mm's.	These
 					  * are globally strung together off

--===============2808864947957115746==--

