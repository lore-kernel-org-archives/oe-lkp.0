Content-Type: multipart/mixed; boundary="===============6631010109344557005=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 17 Mar 2020 11:59:24 -0400
Message-ID: <46d2c16f48f1fd4ad28a85099c59ae95a9997740.camel@kernel.org>
In-Reply-To: <87k13jsyum.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============6631010109344557005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-17 at 09:45 +1100, NeilBrown wrote:
> > +
> > +	/*
> > +	 * Tell the world we're done with it - see comment at top
> > +	 * of this function
> =

> This comment might be misleading.  The world doesn't care.
> Only this thread cares where ->fl_blocker is NULL.  We need the release
> semantics when some *other* thread sets fl_blocker to NULL, not when
> this thread does.
> I don't think we need to spell that out and I'm not against using
> store_release here, but locks_delete_block cannot race with itself, so
> referring to the comment at the top of this function is misleading.
> =

> So:
>   Reviewed-by: NeilBrown <neilb@suse.de>
> =

> but I'm not totally happy with the comments.
> =

> =


Thanks Neil. We can clean up the comments before merge. How about this
revision to the earlier patch? I took the liberty of poaching your your
proposed verbiage:

------------------8<---------------------

>From c9fbfae0ab615e20de0bdf1ae7b27591d602f577 Mon Sep 17 00:00:00 2001
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 16 Mar 2020 18:57:47 -0400
Subject: [PATCH] SQUASH: update with Neil's comments

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/locks.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/fs/locks.c b/fs/locks.c
index eaf754ecdaa8..e74075b0e8ec 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -741,8 +741,9 @@ static void __locks_wake_up_blocks(struct file_lock *bl=
ocker)
 			wake_up(&waiter->fl_wait);
 =

 		/*
-		 * Tell the world we're done with it - see comment at
-		 * top of locks_delete_block().
+		 * The setting of fl_blocker to NULL marks the official "done"
+		 * point in deleting a block. Paired with acquire at the top
+		 * of locks_delete_block().
 		 */
 		smp_store_release(&waiter->fl_blocker, NULL);
 	}
@@ -761,11 +762,23 @@ int locks_delete_block(struct file_lock *waiter)
 	/*
 	 * If fl_blocker is NULL, it won't be set again as this thread "owns"
 	 * the lock and is the only one that might try to claim the lock.
-	 * Because fl_blocker is explicitly set last during a delete, it's
-	 * safe to locklessly test to see if it's NULL. If it is, then we know
-	 * that no new locks can be inserted into its fl_blocked_requests list,
-	 * and we can therefore avoid doing anything further as long as that
-	 * list is empty.
+	 *
+	 * We use acquire/release to manage fl_blocker so that we can
+	 * optimize away taking the blocked_lock_lock in many cases.
+	 *
+	 * The smp_load_acquire guarantees two things:
+	 *
+	 * 1/ that fl_blocked_requests can be tested locklessly. If something
+	 * was recently added to that list it must have been in a locked region
+	 * *before* the locked region when fl_blocker was set to NULL.
+	 *
+	 * 2/ that no other thread is accessing 'waiter', so it is safe to free
+	 * it.  __locks_wake_up_blocks is careful not to touch waiter after
+	 * fl_blocker is released.
+	 *
+	 * If a lockless check of fl_blocker shows it to be NULL, we know that
+	 * no new locks can be inserted into its fl_blocked_requests list, and
+	 * can avoid doing anything further if the list is empty.
 	 */
 	if (!smp_load_acquire(&waiter->fl_blocker) &&
 	    list_empty(&waiter->fl_blocked_requests))
@@ -778,8 +791,8 @@ int locks_delete_block(struct file_lock *waiter)
 	__locks_delete_block(waiter);
 =

 	/*
-	 * Tell the world we're done with it - see comment at top
-	 * of this function
+	 * The setting of fl_blocker to NULL marks the official "done" point in
+	 * deleting a block. Paired with acquire at the top of this function.
 	 */
 	smp_store_release(&waiter->fl_blocker, NULL);
 	spin_unlock(&blocked_lock_lock);
-- =

2.24.1

--===============6631010109344557005==--

