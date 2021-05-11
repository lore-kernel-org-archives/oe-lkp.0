Content-Type: multipart/mixed; boundary="===============6430715160704138870=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 09bc0443e9: will-it-scale.per_thread_ops -7.2% regression
Date: Tue, 11 May 2021 18:41:19 -0400
Message-ID: <YJsID1tfXfrtRfFd@redhat.com>
In-Reply-To: <4111dbd3-164a-2c67-04f2-cee2aa950b04@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6430715160704138870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 04:43:27PM +0800, Xing Zhengjun wrote:
> I test the patches, patch 1 gets 2.1% improvement, patch 2 gets 3.6% =

> improvement, patch 3 gets -7.0% regression.

Ok, so I reworked patch 2 as below... As bonus now page_table_lock
also has its own cacheline.

>From ed0f406d6c1f694d0af1818928f004410e97e1aa Mon Sep 17 00:00:00 2001
From: Andrea Arcangeli <aarcange@redhat.com>
Date: Sat, 8 May 2021 18:54:34 -0400
Subject: [PATCH 1/1] mm: cacheline alignment for page_table_lock and mmap_l=
ock

It's important to keep the mmap_lock in an isolated cacheline to avoid
false sharing. While it at put also the page_table_lock in a separate
cacheline.

The kernel test robot reported a per_thread_ops -7.2% regression for
the will-it-scale mmap2 threaded testcase when the two locks
accidentally landed in the same cacheline with other fields before the
previous location of the page_table_lock.

Moving the mmap_lock in an isolated cacheline as this patch
implements, increases the SMP scalability by an extra 3.6%.

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
---
 include/linux/mm_types.h | 21 ++++++++++-----------
 kernel/fork.c            |  8 ++++++++
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 7fc7a3320ad9..716e56f2fdc0 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -391,6 +391,16 @@ struct core_state {
 =

 struct kioctx_table;
 struct mm_struct {
+	struct {
+		struct rw_semaphore mmap_lock;
+		unsigned long saved_auxv[AT_VECTOR_SIZE]; /* for /proc/PID/auxv */
+		struct core_state *core_state; /* coredumping support */
+		/* store ref to file /proc/<pid>/exe symlink points to */
+		struct file __rcu *exe_file;
+		spinlock_t page_table_lock; /* Protects page tables and some
+					     * counters
+					     */
+	}  __randomize_layout ____cacheline_aligned_in_smp;
 	struct {
 		struct vm_area_struct *mmap;		/* list of VMAs */
 		struct rb_root mm_rb;
@@ -453,18 +463,12 @@ struct mm_struct {
 #endif
 		int map_count;			/* number of VMAs */
 =

-		spinlock_t page_table_lock; /* Protects page tables and some
-					     * counters
-					     */
-		struct rw_semaphore mmap_lock;
-
 		struct list_head mmlist; /* List of maybe swapped mm's.	These
 					  * are globally strung together off
 					  * init_mm.mmlist, and are protected
 					  * by mmlist_lock
 					  */
 =

-
 		unsigned long hiwater_rss; /* High-watermark of RSS usage */
 		unsigned long hiwater_vm;  /* High-water virtual memory usage */
 =

@@ -481,8 +485,6 @@ struct mm_struct {
 		unsigned long start_brk, brk, start_stack;
 		unsigned long arg_start, arg_end, env_start, env_end;
 =

-		unsigned long saved_auxv[AT_VECTOR_SIZE]; /* for /proc/PID/auxv */
-
 		/*
 		 * Special counters, in some configurations protected by the
 		 * page_table_lock, in other configurations by being atomic.
@@ -496,7 +498,6 @@ struct mm_struct {
 =

 		unsigned long flags; /* Must use atomic bitops to access */
 =

-		struct core_state *core_state; /* coredumping support */
 =

 #ifdef CONFIG_AIO
 		spinlock_t			ioctx_lock;
@@ -517,8 +518,6 @@ struct mm_struct {
 #endif
 		struct user_namespace *user_ns;
 =

-		/* store ref to file /proc/<pid>/exe symlink points to */
-		struct file __rcu *exe_file;
 #ifdef CONFIG_MMU_NOTIFIER
 		struct mmu_notifier_subscriptions *notifier_subscriptions;
 #endif
diff --git a/kernel/fork.c b/kernel/fork.c
index e31541da7dbd..fc4bae6c853e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2825,6 +2825,7 @@ static void sighand_ctor(void *data)
 void __init proc_caches_init(void)
 {
 	unsigned int mm_size;
+	struct mm_struct *mm_check =3D NULL;
 =

 	sighand_cachep =3D kmem_cache_create("sighand_cache",
 			sizeof(struct sighand_struct), 0,
@@ -2850,6 +2851,13 @@ void __init proc_caches_init(void)
 	 */
 	mm_size =3D sizeof(struct mm_struct) + cpumask_size();
 =

+	/*
+	 * enforce that mmap_lock and page_table_lock are located on
+	 * two different cachelines.
+	 */
+	BUILD_BUG_ON(sizeof(mm_check->saved_auxv) +
+		     sizeof(mm_check->core_state) +
+		     sizeof(mm_check->exe_file) < L1_CACHE_BYTES);
 	mm_cachep =3D kmem_cache_create_usercopy("mm_struct",
 			mm_size, ARCH_MIN_MMSTRUCT_ALIGN,
 			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_ACCOUNT,



> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/cpufreq_gov=
ernor/ucode/debug-setup:
>  =

> lkp-csl-2sp9/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.=
3/gcc-9/100%/thread/mmap2/performance/0x5003006/test
> =

> commit:
>    cf379a4e0005ff9a4e734901aab9eeafe28c4eb6
>    0d2285c622103f0314ced7485c3b5b43f870c2d3
>    4e1291d70e101e7e1064ca814288a003171d75c7  (patch1)
>    3d5791b79590c6d57b9a66be7d4ec33bfa5027fc  (patch2)
>    5f65daa0dc701eeae20d29b0521dd11becd50239  (patch3)
> =

> cf379a4e0005ff9a 0d2285c622103f0314ced7485c3 4e1291d70e101e7e1064ca81428 =

> 3d5791b79590c6d57b9a66be7d4 5f65daa0dc701eeae20d29b0521
> ---------------- --------------------------- --------------------------- =

> --------------------------- ---------------------------
>           %stddev     %change         %stddev     %change =

> %stddev     %change         %stddev     %change         %stddev
>               \          |                \          |                \ =

>           |                \          |                \
>      204106 =C2=B1  2%      -5.6%     192733            +2.1%     208489 =

>         +3.6%     211498            -7.0%     189797 =C2=B1  2% =

> will-it-scale.88.threads
>        3.13 =C2=B1  2%     +25.1%       3.91 =C2=B1  2%      -1.3%       =
3.08 =C2=B1 =

> 3%      -1.8%       3.07           +25.9%       3.94 =C2=B1  2% =

> will-it-scale.88.threads_idle
>        2319 =C2=B1  2%      -5.6%       2189            +2.1%       2368 =

>         +3.6%       2403            -7.0%       2156 =C2=B1  2% =

> will-it-scale.per_thread_ops
>      204106 =C2=B1  2%      -5.6%     192733            +2.1%     208489 =

>         +3.6%     211498            -7.0%     189797 =C2=B1  2% =

> will-it-scale.workload
> =

> =

> =

> =

> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/cpufreq_=
governor/ucode/debug-setup:
> >>   =

> >> lkp-csl-2sp9/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel=
-8.3/gcc-9/100%/thread/mmap2/performance/0x5003006/test
> >>
> >> commit:
> >>     cf379a4e0005ff9a4e734901aab9eeafe28c4eb6
> >>     0d2285c622103f0314ced7485c3b5b43f870c2d3
> >>     4e1291d70e101e7e1064ca814288a003171d75c7  (test patch)
> >>
> >> cf379a4e0005ff9a 0d2285c622103f0314ced7485c3 4e1291d70e101e7e1064ca814=
28
> >> ---------------- --------------------------- -------------------------=
--
> >>            %stddev     %change         %stddev     %change         %st=
ddev
> >>                \          |                \          |               =
 \
> >>       204106 =C2=B1  2%      -5.6%     192733            +2.1%     208=
489
> >>      will-it-scale.88.threads
> >>         3.13 =C2=B1  2%     +25.1%       3.91 =C2=B1  2%      -1.3%   =
    3.08 =C2=B1
> >> 3%  will-it-scale.88.threads_idle
> >>         2319 =C2=B1  2%      -5.6%       2189            +2.1%       2=
368
> >>      will-it-scale.per_thread_ops
> >>       204106 =C2=B1  2%      -5.6%     192733            +2.1%     208=
489
> >>      will-it-scale.workload
> >>
> >>
> >>
> >> -- =

> >> Zhengjun Xing
> >>
> > =

> =

> -- =

> Zhengjun Xing
>=20

--===============6430715160704138870==--

