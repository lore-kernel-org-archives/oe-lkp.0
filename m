Content-Type: multipart/mixed; boundary="===============3673766115877417826=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Sun, 06 Jun 2021 12:47:31 +0800
Message-ID: <20210606044731.GA69002@shbuild999.sh.intel.com>
In-Reply-To: <f35ae155-d73c-eca4-b950-58589a76addc@nvidia.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3673766115877417826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 10:58:14AM -0700, John Hubbard wrote:
> On 6/4/21 12:52 AM, Feng Tang wrote:
> ...
> >>>The perf data doesn't even mention any of the GUP paths, and on the
> >>>pure fork path the biggest impact would be:
> >>>
> >>>  (a) maybe "struct mm_struct" changed in size or had a different cach=
e layout
> >>
> >>Yes, this seems to be the cause of the regression.
> >>
> >>The test case is many thread are doing map/unmap at the same time,
> >>so the process's rw_semaphore 'mmap_lock' is highly contended.
> >>
> >>Before the patch (with 0day's kconfig), the mmap_lock is separated
> >>into 2 cachelines, the 'count' is in one line, and the other members
> >>sit in the next line, so it luckily avoid some cache bouncing. After
> =

> Wow! That's quite a fortunate layout to land on by accident. Almost
> makes me wonder if mmap_lock should be designed to do that, but it's
> probably even better to just keep working on having a less contended
> mmap_lock.

Yes, manipulating cache alignment is always tricky and fragile, as
data structure keeps being changed and it is affected by differrent =

kernel config options, also different workloads will see different
hot fields of it. =


Optimizing 'mmap_lock' is the better and ultimate solution. =


> I *suppose* it's worth trying to keep this fragile layout in place,
> but it is a landmine for anyone who touches mm_struct. And the struct
> is so large already that I'm not sure a comment warning would even
> be noticed. Anyway...

Linus also mentioned clear comment is needed. Will collect more info.


> >>the patch, the 'mmap_lock' is pushed into one cacheline, which may
> >>cause the regression.
> >>
> >>Below is the pahole info:
> >>
> >>- before the patch
> >>
> >>	spinlock_t         page_table_lock;      /*   116     4 */
> >>	struct rw_semaphore mmap_lock;           /*   120    40 */
> >>	/* --- cacheline 2 boundary (128 bytes) was 32 bytes ago --- */
> >>	struct list_head   mmlist;               /*   160    16 */
> >>	long unsigned int  hiwater_rss;          /*   176     8 */
> >>
> >>- after the patch
> >>
> >>	spinlock_t         page_table_lock;      /*   124     4 */
> >>	/* --- cacheline 2 boundary (128 bytes) --- */
> >>	struct rw_semaphore mmap_lock;           /*   128    40 */
> >>	struct list_head   mmlist;               /*   168    16 */
> >>	long unsigned int  hiwater_rss;          /*   184     8 */
> >>
> >>perf c2c log can also confirm this.
> >We've tried some patch, which can restore the regerssion. As the
> >newly added member 'write_protect_seq' is 4 bytes long, and putting
> >it into an existing 4 bytes long hole can restore the regeression,
> >while not affecting most of other member's alignment. Please review
> >the following patch, thanks!
> >
> =

> So, this is a neat little solution, if we agree that it's worth "fixing".
> =

> I'm definitely on the fence, but leaning toward, "go for it", because
> I like the "no cache effect" result of using up the hole.
> =

> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks for the reviewing!

- Feng


> thanks,
> -- =

> John Hubbard
> NVIDIA
> =

> >- Feng
> >
> > From 85ddc2c3d0f2bdcbad4edc5c392c7bc90bb1667e Mon Sep 17 00:00:00 2001
> >From: Feng Tang <feng.tang@intel.com>
> >Date: Fri, 4 Jun 2021 15:20:57 +0800
> >Subject: [PATCH RFC] mm: relocate 'write_protect_seq' in struct mm_struct
> >
> >Before commit 57efa1fe5957 ("mm/gup: prevent gup_fast from
> >racing with COW during fork), on 64bits system, the hot member
> >rw_semaphore 'mmap_lock' of 'mm_struct' could be separated into
> >2 cachelines, that its member 'count' sits in one cacheline while
> >all other members in next cacheline, this naturally reduces some
> >cache bouncing, and with the commit, the 'mmap_lock' is pushed
> >into one cacheline, as shown in the pahole info:
> >
> >  - before the commit
> >
> >	spinlock_t         page_table_lock;      /*   116     4 */
> >	struct rw_semaphore mmap_lock;           /*   120    40 */
> >	/* --- cacheline 2 boundary (128 bytes) was 32 bytes ago --- */
> >	struct list_head   mmlist;               /*   160    16 */
> >	long unsigned int  hiwater_rss;          /*   176     8 */
> >
> >  - after the commit
> >
> >	spinlock_t         page_table_lock;      /*   124     4 */
> >	/* --- cacheline 2 boundary (128 bytes) --- */
> >	struct rw_semaphore mmap_lock;           /*   128    40 */
> >	struct list_head   mmlist;               /*   168    16 */
> >	long unsigned int  hiwater_rss;          /*   184     8 */
> >
> >and it causes one 9.2% regression for 'mmap1' case of will-it-scale
> >benchmark[1], as in the case 'mmap_lock' is highly contented (occupies
> >90%+ cpu cycles).
> >
> >Though relayouting a structure could be a double-edged sword, as it
> >helps some case, but may hurt other cases. So one solution is the
> >newly added 'seqcount_t' is 4 bytes long (when CONFIG_DEBUG_LOCK_ALLOC=
=3Dn),
> >placing it into an existing 4 bytes hole in 'mm_struct' will not
> >affect most of other members's alignment, while restoring the
> >regression.
> >
> >[1]. https://lore.kernel.org/lkml/20210525031636.GB7744(a)xsang-OptiPlex=
-9020/
> >Reported-by: kernel test robot <oliver.sang@intel.com>
> >Signed-off-by: Feng Tang <feng.tang@intel.com>
> >---
> >  include/linux/mm_types.h | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> >diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> >index 5aacc1c..5b55f88 100644
> >--- a/include/linux/mm_types.h
> >+++ b/include/linux/mm_types.h
> >@@ -445,13 +445,6 @@ struct mm_struct {
> >  		 */
> >  		atomic_t has_pinned;
> >-		/**
> >-		 * @write_protect_seq: Locked when any thread is write
> >-		 * protecting pages mapped by this mm to enforce a later COW,
> >-		 * for instance during page table copying for fork().
> >-		 */
> >-		seqcount_t write_protect_seq;
> >-
> >  #ifdef CONFIG_MMU
> >  		atomic_long_t pgtables_bytes;	/* PTE page table pages */
> >  #endif
> >@@ -480,7 +473,15 @@ struct mm_struct {
> >  		unsigned long stack_vm;	   /* VM_STACK */
> >  		unsigned long def_flags;
> >+		/**
> >+		 * @write_protect_seq: Locked when any thread is write
> >+		 * protecting pages mapped by this mm to enforce a later COW,
> >+		 * for instance during page table copying for fork().
> >+		 */
> >+		seqcount_t write_protect_seq;
> >+
> >  		spinlock_t arg_lock; /* protect the below fields */
> >+
> >  		unsigned long start_code, end_code, start_data, end_data;
> >  		unsigned long start_brk, brk, start_stack;
> >  		unsigned long arg_start, arg_end, env_start, env_end;
> >
--===============3673766115877417826==--

