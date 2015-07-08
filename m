Content-Type: multipart/mixed; boundary="===============6585860262579065844=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm: meminit] WARNING: CPU: 1 PID: 15 at kernel/locking/lockdep.c:3382 lock_release()
Date: Wed, 08 Jul 2015 11:32:13 +0100
Message-ID: <20150708103213.GO6812@suse.de>
In-Reply-To: <559be1ee.oKzhDxqT1ZZpBUZm%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6585860262579065844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2015 at 10:27:58PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 0e1cc95b4cc7293bb7b39175035e7f7e45c90977
> Author:     Mel Gorman <mgorman@suse.de>
> AuthorDate: Tue Jun 30 14:57:27 2015 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Tue Jun 30 19:44:56 2015 -0700
> =

>     mm: meminit: finish initialisation of struct pages before basic setup
>     =

>     Waiman Long reported that 24TB machines hit OOM during basic setup wh=
en
>     struct page initialisation was deferred.  One approach is to initiali=
se
>     memory on demand but it interferes with page allocator paths.  This p=
atch
>     creates dedicated threads to initialise memory before basic setup.  It
>     then blocks on a rw_semaphore until completion as a wait_queue and co=
unter
>     is overkill.  This may be slower to boot but it's simplier overall and
>     also gets rid of a section mangling which existed so kswapd could do =
the
>     initialisation.
>     =

>     [akpm(a)linux-foundation.org: include rwsem.h, use DECLARE_RWSEM, fix=
 comment, remove unneeded cast]
>     Signed-off-by: Mel Gorman <mgorman@suse.de>
>     Cc: Waiman Long <waiman.long@hp.com
>     Cc: Nathan Zimmer <nzimmer@sgi.com>
>     Cc: Dave Hansen <dave.hansen@intel.com>
>     Cc: Scott Norton <scott.norton@hp.com>
>     Tested-by: Daniel J Blueman <daniel@numascale.com>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> =


Would it be possible to test with this patch on top?

---8<---
From: Nicolai Stange <nicstange@gmail.com>
Subject: Re: [PATCH] mm/page_alloc: deferred meminit: replace rwsem with co=
mpletion

Commit 0e1cc95b4cc7
  ("mm: meminit: finish initialisation of struct pages before basic setup")
introduced a rwsem to signal completion of the initialization workers.

Lockdep complains about possible recursive locking:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [ INFO: possible recursive locking detected ]
  4.1.0-12802-g1dc51b8 #3 Not tainted
  ---------------------------------------------
  swapper/0/1 is trying to acquire lock:
  (pgdat_init_rwsem){++++.+},
    at: [<ffffffff8424c7fb>] page_alloc_init_late+0xc7/0xe6

  but task is already holding lock:
  (pgdat_init_rwsem){++++.+},
    at: [<ffffffff8424c772>] page_alloc_init_late+0x3e/0xe6

Replace the rwsem by a completion together with an atomic
"outstanding work counter".

Signed-off-by: Nicolai Stange <nicstange@gmail.com>
Acked-by: Mel Gorman <mgorman@suse.de>
---
 mm/page_alloc.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 506eac8..3886e66 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -18,7 +18,9 @@
 #include <linux/mm.h>
 #include <linux/swap.h>
 #include <linux/interrupt.h>
-#include <linux/rwsem.h>
+#include <linux/completion.h>
+#include <linux/atomic.h>
+#include <asm/barrier.h>
 #include <linux/pagemap.h>
 #include <linux/jiffies.h>
 #include <linux/bootmem.h>
@@ -1062,7 +1064,20 @@ static void __init deferred_free_range(struct page *=
page,
 		__free_pages_boot_core(page, pfn, 0);
 }
 =

-static __initdata DECLARE_RWSEM(pgdat_init_rwsem);
+/* counter and completion tracking outstanding deferred_init_memmap()
+   threads */
+static atomic_t pgdat_init_n_undone __initdata;
+static __initdata DECLARE_COMPLETION(pgdat_init_all_done_comp);
+
+static inline void __init pgdat_init_report_one_done(void)
+{
+	/* Write barrier is paired with read barrier in
+	   page_alloc_init_late(). It makes all writes visible to
+	   readers seeing our decrement on pgdat_init_n_undone. */
+	smp_wmb();
+	if (atomic_dec_and_test(&pgdat_init_n_undone))
+		complete(&pgdat_init_all_done_comp);
+}
 =

 /* Initialise remaining memory on a node */
 static int __init deferred_init_memmap(void *data)
@@ -1079,7 +1094,7 @@ static int __init deferred_init_memmap(void *data)
 	const struct cpumask *cpumask =3D cpumask_of_node(pgdat->node_id);
 =

 	if (first_init_pfn =3D=3D ULONG_MAX) {
-		up_read(&pgdat_init_rwsem);
+		pgdat_init_report_one_done();
 		return 0;
 	}
 =

@@ -1179,7 +1194,8 @@ free_range:
 =

 	pr_info("node %d initialised, %lu pages in %ums\n", nid, nr_pages,
 					jiffies_to_msecs(jiffies - start));
-	up_read(&pgdat_init_rwsem);
+
+	pgdat_init_report_one_done();
 	return 0;
 }
 =

@@ -1187,14 +1203,18 @@ void __init page_alloc_init_late(void)
 {
 	int nid;
 =

+	/* There will be num_node_state(N_MEMORY) threads */
+	atomic_set(&pgdat_init_n_undone, num_node_state(N_MEMORY));
 	for_each_node_state(nid, N_MEMORY) {
-		down_read(&pgdat_init_rwsem);
 		kthread_run(deferred_init_memmap, NODE_DATA(nid), "pgdatinit%d", nid);
 	}
 =

 	/* Block until all are initialised */
-	down_write(&pgdat_init_rwsem);
-	up_write(&pgdat_init_rwsem);
+	wait_for_completion(&pgdat_init_all_done_comp);
+
+	/* Paired with write barrier in deferred_init_memmap(),
+	   ensures a consistent view of all its writes. */
+	smp_rmb();
 }
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
 =

-- =

2.4.5


--===============6585860262579065844==--

