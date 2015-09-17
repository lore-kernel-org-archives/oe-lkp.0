Content-Type: multipart/mixed; boundary="===============4969971213783522208=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf] 3215929f8f: n f[d 29 [ 4:22:177.]092021] EIP is at SyS_perf_event_open+0x757/0xb86
Date: Thu, 17 Sep 2015 17:06:39 +0800
Message-ID: <20150917090639.GA8019@wfg-t540p.sh.intel.com>
In-Reply-To: <20150917085336.GG3816@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4969971213783522208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, Sep 17, 2015 at 10:53:36AM +0200, Peter Zijlstra wrote:
> On Thu, Sep 17, 2015 at 01:28:18PM +0800, kernel test robot wrote:
> > FYI, we noticed the below changes on
> > =

> > git://internal_merge_and_test_tree devel-catchup-201509131855
> > commit 3215929f8ff55da910c26971d4286abff53ea6e2 ("perf: Restructure per=
f syscall point of no return")
> =

> How can I get the actual patch? I don't have this commit. (It could be a
> previous version, I had a bug like that, but not having the actual patch
> I cannot check if its the same or not).

Here is the patch:

>From 3215929f8ff55da910c26971d4286abff53ea6e2 Mon Sep 17 00:00:00 2001
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 9 Sep 2015 19:06:33 +0200
Subject: [PATCH] perf: Restructure perf syscall point of no return

The exclusive_event_installable() stuff only works because its
exclusive with the grouping bits.

Rework the code such that there is a sane place to error out before we
go do things we cannot undo.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel(a)vger.kernel.org
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 kernel/events/core.c | 52 +++++++++++++++++++++++++++++++++---------------=
----
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index ae16867..cc06c7c 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8242,15 +8242,31 @@ SYSCALL_DEFINE5(perf_event_open,
 		goto err_context;
 	}
 =

-	if (move_group) {
-		gctx =3D group_leader->ctx;
+	gctx =3D group_leader->ctx;
+	if (move_group)
+		mutex_lock_double(&gctx->mutex, &ctx->mutex);
+	else
+		mutex_lock(&ctx->mutex);
+
+	/*
+	 * Must be under the same ctx::mutex as perf_install_in_context(),
+	 * because we need to serialize with concurrent event creation.
+	 */
+	if (!exclusive_event_installable(event, ctx)) {
+		/* exclusive and group stuff are assumed mutually exclusive */
+		WARN_ON_ONCE(move_group);
+
+		err =3D -EBUSY;
+		goto err_locked;
+	}
 =

+	WARN_ON_ONCE(ctx->parent_ctx);
+
+	if (move_group) {
 		/*
 		 * See perf_event_ctx_lock() for comments on the details
 		 * of swizzling perf_event::ctx.
 		 */
-		mutex_lock_double(&gctx->mutex, &ctx->mutex);
-
 		perf_remove_from_context(group_leader, false);
 =

 		list_for_each_entry(sibling, &group_leader->sibling_list,
@@ -8258,13 +8274,7 @@ SYSCALL_DEFINE5(perf_event_open,
 			perf_remove_from_context(sibling, false);
 			put_ctx(gctx);
 		}
-	} else {
-		mutex_lock(&ctx->mutex);
-	}
-
-	WARN_ON_ONCE(ctx->parent_ctx);
 =

-	if (move_group) {
 		/*
 		 * Wait for everybody to stop referencing the events through
 		 * the old lists, before installing it on new lists.
@@ -8296,22 +8306,20 @@ SYSCALL_DEFINE5(perf_event_open,
 		perf_event__state_init(group_leader);
 		perf_install_in_context(ctx, group_leader, group_leader->cpu);
 		get_ctx(ctx);
-	}
 =

-	if (!exclusive_event_installable(event, ctx)) {
-		err =3D -EBUSY;
-		mutex_unlock(&ctx->mutex);
-		fput(event_file);
-		goto err_context;
+		/*
+		 * Now that all events are installed in @ctx, nothing
+		 * references @gctx anymore, so drop the last reference we have
+		 * on it.
+		 */
+		put_ctx(gctx);
 	}
 =

 	perf_install_in_context(ctx, event, event->cpu);
 	perf_unpin_context(ctx);
 =

-	if (move_group) {
+	if (move_group)
 		mutex_unlock(&gctx->mutex);
-		put_ctx(gctx);
-	}
 	mutex_unlock(&ctx->mutex);
 =

 	put_online_cpus();
@@ -8338,6 +8346,12 @@ SYSCALL_DEFINE5(perf_event_open,
 	fd_install(event_fd, event_file);
 	return event_fd;
 =

+err_locked:
+	if (move_group)
+		mutex_unlock(&gctx->mutex);
+	mutex_unlock(&ctx->mutex);
+/* err_file: */
+	fput(event_file);
 err_context:
 	perf_unpin_context(ctx);
 	put_ctx(ctx);
-- =

2.1.4


--===============4969971213783522208==--

