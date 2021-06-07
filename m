Content-Type: multipart/mixed; boundary="===============4660760326461073664=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Mon, 07 Jun 2021 14:05:51 +0800
Message-ID: <20210607060551.GB48020@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=whoqV=cX5VC80mmR9rr+Z+yQ6fiQZm36Fb-izsanHg23w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4660760326461073664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 06, 2021 at 12:20:46PM -0700, Linus Torvalds wrote:
> [ Adding Waiman Long to the participants, because this seems to be a
> very specific cacheline alignment behavior of rwsems, maybe Waiman has
> some comments ]
> =

> On Sun, Jun 6, 2021 at 3:16 AM Feng Tang <feng.tang@intel.com> wrote:
> >
> > * perf-c2c: The hotspots(HITM) for 2 kernels are different due to the
> >   data structure change
> >
> >   - old kernel
> >
> >     - first cacheline
> >         mmap_lock->count (75%)
> >         mm->mapcount (14%)
> >
> >     - second cacheline
> >         mmap_lock->owner (97%)
> >
> >   - new kernel
> >
> >     mainly in the cacheline of 'mmap_lock'
> >
> >     mmap_lock->count (~2%)
> >     mmap_lock->owner (95%)
> =

> Oooh.
> =

> It looks like pretty much all the contention is on mmap_lock, and the
> difference is that the old kernel just _happened_ to split the
> mmap_lock rwsem at *exactly* the right place.
> =

> The rw_semaphore structure looks like this:
> =

>         struct rw_semaphore {
>                 atomic_long_t count;
>                 atomic_long_t owner;
>                 struct optimistic_spin_queue osq; /* spinner MCS lock */
>                 ...
> =

> and before the addition of the 'write_protect_seq' field, the mmap_sem
> was at offset 120 in 'struct mm_struct'.
> =

> Which meant that count and owner were in two different cachelines, and
> then when you have contention and spend time in
> rwsem_down_write_slowpath(), this is probably *exactly* the kind of
> layout you want.
> =

> Because first the rwsem_write_trylock() will do a cmpxchg on the first
> cacheline (for the optimistic fast-path), and then in the case of
> contention, rwsem_down_write_slowpath() will just access the second
> cacheline.
> =

> Which is probably just optimal for a load that spends a lot of time
> contended - new waiters touch that first cacheline, and then they
> queue themselves up on the second cacheline. Waiman, does that sound
> believable?
> =

> Anyway, I'm certainly ok with the patch that just moves
> 'write_protect_seq' down, it might be worth commenting about how this
> is about some very special cache layout of the mmap_sem part of the
> structure.
> =

> That said, this means that it all is very subtle dependent on a lot of
> kernel config options, and I'm not sure how relevant the exact kernel
> options are that the test robot has been using. But even if this is
> just a "kernel test robot reports", I think it's an interesting case
> and worth a comment for when this happens next time...

There are 3 kernel config options before 'mmap_lock' (inside 'mm_struct'):

  CONFIG_MMU
  CONFIG_MEMBARRIER
  CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES

0day's default kernel config is similar to RHEL-8.3, which has all
these three enabled. IIUC, the first 2 options are 'y' for many common
configs, while 'CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES' is only available
on x86 system.

Please review the updated patch, thanks

- Feng


>From cbdbe70fb9e5bab2988d645c6f0f614d51b2e386 Mon Sep 17 00:00:00 2001
From: Feng Tang <feng.tang@intel.com>
Date: Fri, 4 Jun 2021 15:20:57 +0800
Subject: [PATCH] mm: relocate 'write_protect_seq' in struct mm_struct

0day robot reports a 9.2% regression for will-it-scale mmap1 test
case[1], caused by commit 57efa1fe5957 ("mm/gup: prevent gup_fast
from racing with COW during fork").

Further debug shows the regression is due to that commit changes
the offset of hot fields 'mmap_lock' inside structure 'mm_struct',
thus some cache alignmeent changes.

>From the perf data, the contention for 'mmap_lock' is very severe
and takes around 95% cpu cycles, and it is a rw_semaphore

        struct rw_semaphore {
                atomic_long_t count;	/* 8 bytes */
                atomic_long_t owner;	/* 8 bytes */
                struct optimistic_spin_queue osq; /* spinner MCS lock */
                ...

Before commit 57efa1fe5957 adds the 'write_protect_seq', it
happens to have a very optimal cache alignment layout, as
Linus explained:

 "and before the addition of the 'write_protect_seq' field, the
  mmap_sem was at offset 120 in 'struct mm_struct'.

  Which meant that count and owner were in two different cachelines,
  and then when you have contention and spend time in
  rwsem_down_write_slowpath(), this is probably *exactly* the kind
  of layout you want.

  Because first the rwsem_write_trylock() will do a cmpxchg on the
  first cacheline (for the optimistic fast-path), and then in the
  case of contention, rwsem_down_write_slowpath() will just access
  the second cacheline.

  Which is probably just optimal for a load that spends a lot of
  time contended - new waiters touch that first cacheline, and then
  they queue themselves up on the second cacheline."

After the commit, the rw_semaphore is at offset 128, which means
the 'count' and 'owner' fields are now in the same cacheline,
and causes more cache bouncing.

Currently there are "#ifdef CONFIG_XXX" before 'mmap_lock' which
will affect its offset:

  CONFIG_MMU
  CONFIG_MEMBARRIER
  CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES

The layout above is on 64 bits system with 0day's default kernel
config (similar to RHEL-8.3's config), which all these 3 options
are 'y'. And the layout can ary with different kernel configs.

Relayouting a structure is usually a double-edged sword, as sometimes
it can helps one case, but hurt other cases. For this case, one
solution is, as the newly added 'write_protect_seq' is a 4 bytes long
seqcount_t (when CONFIG_DEBUG_LOCK_ALLOC=3Dn), placing it into an
existing 4 bytes hole in 'mm_struct' will not change other fields'
alignment, while restoring the regression. =


[1]. https://lore.kernel.org/lkml/20210525031636.GB7744(a)xsang-OptiPlex-90=
20/
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Feng Tang <feng.tang@intel.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/mm_types.h | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5aacc1c..cba6022 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -445,13 +445,6 @@ struct mm_struct {
 		 */
 		atomic_t has_pinned;
 =

-		/**
-		 * @write_protect_seq: Locked when any thread is write
-		 * protecting pages mapped by this mm to enforce a later COW,
-		 * for instance during page table copying for fork().
-		 */
-		seqcount_t write_protect_seq;
-
 #ifdef CONFIG_MMU
 		atomic_long_t pgtables_bytes;	/* PTE page table pages */
 #endif
@@ -460,6 +453,18 @@ struct mm_struct {
 		spinlock_t page_table_lock; /* Protects page tables and some
 					     * counters
 					     */
+		/*
+		 * With some kernel config, the current mmap_lock's offset
+		 * inside 'mm_struct' is at 0x120, which is very optimal, as
+		 * its two hot fields 'count' and 'owner' sit in 2 different
+		 * cachelines,  and when mmap_lock is highly contended, both
+		 * of the 2 fields will be accessed frequently, current layout
+		 * will help to reduce cache bouncing.
+		 *
+		 * So please be careful with adding new fields before
+		 * mmap_lock, which can easily push the 2 fields into one
+		 * cacheline.
+		 */
 		struct rw_semaphore mmap_lock;
 =

 		struct list_head mmlist; /* List of maybe swapped mm's.	These
@@ -480,7 +485,15 @@ struct mm_struct {
 		unsigned long stack_vm;	   /* VM_STACK */
 		unsigned long def_flags;
 =

+		/**
+		 * @write_protect_seq: Locked when any thread is write
+		 * protecting pages mapped by this mm to enforce a later COW,
+		 * for instance during page table copying for fork().
+		 */
+		seqcount_t write_protect_seq;
+
 		spinlock_t arg_lock; /* protect the below fields */
+
 		unsigned long start_code, end_code, start_data, end_data;
 		unsigned long start_brk, brk, start_stack;
 		unsigned long arg_start, arg_end, env_start, env_end;
-- =

2.7.4

--===============4660760326461073664==--

