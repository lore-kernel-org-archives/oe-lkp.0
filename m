Content-Type: multipart/mixed; boundary="===============1264743416261052583=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Sun, 15 Mar 2020 09:54:02 -0400
Message-ID: <b5a1bb4c4494a370f915af479bcdf8b3b351eb6d.camel@kernel.org>
In-Reply-To: <CAHk-=whYQqtW6B7oPmPr9-PXwyqUneF4sSFE+o3=7QcENstE-g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1264743416261052583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-03-14 at 08:58 -0700, Linus Torvalds wrote:
> On Fri, Mar 13, 2020 at 7:31 PM NeilBrown <neilb@suse.de> wrote:
> > The idea of list_del_init_release() and list_empty_acquire() is growing
> > on me though.  See below.
> =

> This does look like a promising approach.
> =

> However:
> =

> > +       if (waiter->fl_blocker =3D=3D NULL &&
> > +           list_empty(&waiter->fl_blocked_requests) &&
> > +           list_empty_acquire(&waiter->fl_blocked_member))
> > +               return status;
> =

> This does not seem sensible to me.
> =

> The thing is, the whole point about "acquire" semantics is that it
> should happen _first_ - because a load-with-acquire only orders things
> _after_ it.
> =

> So testing some other non-locked state before testing the load-acquire
> state makes little sense: it means that the other tests you do are
> fundamentally unordered and nonsensical in an unlocked model.
> =

> So _if_ those other tests matter (do they?), then they should be after
> the acquire test (because they test things that on the writer side are
> set before the "store-release"). Otherwise you're testing random
> state.
> =

> And if they don't matter, then they shouldn't exist at all.
> =

> IOW, if you depend on ordering, then the _only_ ordering that exists is:
> =

>  - writer side: writes done _before_ the smp_store_release() are visible
> =

>  - to the reader side done _after_ the smp_load_acquire()
> =

> and absolutely no other ordering exists or makes sense to test for.
> =

> That limited ordering guarantee is why a store-release -> load-acquire
> is fundamentally cheaper than any other serialization.
> =

> So the optimistic "I don't need to do anything" case should start ouf with
> =

>         if (list_empty_acquire(&waiter->fl_blocked_member)) {
> =

> and go from there. Does it actually need to do anything else at all?
> But if it does need to check the other fields, they should be checked
> after that acquire.
> =

> Also, it worries me that the comment talks about "if fl_blocker is
> NULL". But it realy now is that fl_blocked_member list being empty
> that is the real serialization test, adn that's the one that the
> comment should primarily talk about.
> =


Good point. The list manipulation and setting of fl_blocker are always
done in conjunction, so I don't see why we'd need to check but one
condition there (whichever gets the explicit acquire/release semantics).

The fl_blocker pointer seems like the clearest way to indicate that to
me, but if using list_empty makes sense for other reasons, I'm fine with
that.

This is what I have so far (leaving Linus as author since he did the
original patch):

------------8<-------------

>From 1493f539e09dfcd5e0862209c6f7f292a2f2d228 Mon Sep 17 00:00:00 2001
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Mar 2020 14:35:43 -0400
Subject: [PATCH] locks: reinstate locks_delete_block optimization

There is measurable performance impact in some synthetic tests due to
commit 6d390e4b5d48 (locks: fix a potential use-after-free problem when
wakeup a waiter). Fix the race condition instead by clearing the
fl_blocker pointer after the wake_up, using explicit acquire/release
semantics.

With this change, we can just check for fl_blocker to clear as an
indicator that the block is already deleted, and eliminate the
list_empty check that was in the old optimization.

This does mean that we can no longer use the clearing of fl_blocker as
the wait condition, so switch the waiters over to checking whether the
fl_blocked_member list_head is empty.

Cc: yangerkun <yangerkun@huawei.com>
Cc: NeilBrown <neilb@suse.de>
Fixes: 6d390e4b5d48 (locks: fix a potential use-after-free problem when wak=
eup a waiter)
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/cifs/file.c |  3 ++-
 fs/locks.c     | 38 ++++++++++++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 3b942ecdd4be..8f9d849a0012 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -1169,7 +1169,8 @@ cifs_posix_lock_set(struct file *file, struct file_lo=
ck *flock)
 	rc =3D posix_lock_file(file, flock, NULL);
 	up_write(&cinode->lock_sem);
 	if (rc =3D=3D FILE_LOCK_DEFERRED) {
-		rc =3D wait_event_interruptible(flock->fl_wait, !flock->fl_blocker);
+		rc =3D wait_event_interruptible(flock->fl_wait,
+					list_empty(&flock->fl_blocked_member));
 		if (!rc)
 			goto try_again;
 		locks_delete_block(flock);
diff --git a/fs/locks.c b/fs/locks.c
index 426b55d333d5..652a09ab02d7 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -725,7 +725,6 @@ static void __locks_delete_block(struct file_lock *wait=
er)
 {
 	locks_delete_global_blocked(waiter);
 	list_del_init(&waiter->fl_blocked_member);
-	waiter->fl_blocker =3D NULL;
 }
 =

 static void __locks_wake_up_blocks(struct file_lock *blocker)
@@ -740,6 +739,12 @@ static void __locks_wake_up_blocks(struct file_lock *b=
locker)
 			waiter->fl_lmops->lm_notify(waiter);
 		else
 			wake_up(&waiter->fl_wait);
+
+		/*
+		 * Tell the world we're done with it - see comment at
+		 * top of locks_delete_block().
+		 */
+		smp_store_release(&waiter->fl_blocker, NULL);
 	}
 }
 =

@@ -753,11 +758,27 @@ int locks_delete_block(struct file_lock *waiter)
 {
 	int status =3D -ENOENT;
 =

+	/*
+	 * If fl_blocker is NULL, it won't be set again as this thread "owns"
+	 * the lock and is the only one that might try to claim the lock.
+	 * Because fl_blocker is explicitly set last during a delete, it's
+	 * safe to locklessly test to see if it's NULL and avoid doing
+	 * anything further if it is.
+	 */
+	if (!smp_load_acquire(&waiter->fl_blocker))
+		return status;
+
 	spin_lock(&blocked_lock_lock);
 	if (waiter->fl_blocker)
 		status =3D 0;
 	__locks_wake_up_blocks(waiter);
 	__locks_delete_block(waiter);
+
+	/*
+	 * Tell the world we're done with it - see comment at top
+	 * of this function
+	 */
+	smp_store_release(&waiter->fl_blocker, NULL);
 	spin_unlock(&blocked_lock_lock);
 	return status;
 }
@@ -1350,7 +1371,8 @@ static int posix_lock_inode_wait(struct inode *inode,=
 struct file_lock *fl)
 		error =3D posix_lock_inode(inode, fl, NULL);
 		if (error !=3D FILE_LOCK_DEFERRED)
 			break;
-		error =3D wait_event_interruptible(fl->fl_wait, !fl->fl_blocker);
+		error =3D wait_event_interruptible(fl->fl_wait,
+					list_empty(&fl->fl_blocked_member));
 		if (error)
 			break;
 	}
@@ -1435,7 +1457,8 @@ int locks_mandatory_area(struct inode *inode, struct =
file *filp, loff_t start,
 		error =3D posix_lock_inode(inode, &fl, NULL);
 		if (error !=3D FILE_LOCK_DEFERRED)
 			break;
-		error =3D wait_event_interruptible(fl.fl_wait, !fl.fl_blocker);
+		error =3D wait_event_interruptible(fl.fl_wait,
+					list_empty(&fl.fl_blocked_member));
 		if (!error) {
 			/*
 			 * If we've been sleeping someone might have
@@ -1638,7 +1661,8 @@ int __break_lease(struct inode *inode, unsigned int m=
ode, unsigned int type)
 =

 	locks_dispose_list(&dispose);
 	error =3D wait_event_interruptible_timeout(new_fl->fl_wait,
-						!new_fl->fl_blocker, break_time);
+					list_empty(&new_fl->fl_blocked_member),
+					break_time);
 =

 	percpu_down_read(&file_rwsem);
 	spin_lock(&ctx->flc_lock);
@@ -2122,7 +2146,8 @@ static int flock_lock_inode_wait(struct inode *inode,=
 struct file_lock *fl)
 		error =3D flock_lock_inode(inode, fl);
 		if (error !=3D FILE_LOCK_DEFERRED)
 			break;
-		error =3D wait_event_interruptible(fl->fl_wait, !fl->fl_blocker);
+		error =3D wait_event_interruptible(fl->fl_wait,
+				list_empty(&fl->fl_blocked_member));
 		if (error)
 			break;
 	}
@@ -2399,7 +2424,8 @@ static int do_lock_file_wait(struct file *filp, unsig=
ned int cmd,
 		error =3D vfs_lock_file(filp, cmd, fl, NULL);
 		if (error !=3D FILE_LOCK_DEFERRED)
 			break;
-		error =3D wait_event_interruptible(fl->fl_wait, !fl->fl_blocker);
+		error =3D wait_event_interruptible(fl->fl_wait,
+					list_empty(&fl->fl_blocked_member));
 		if (error)
 			break;
 	}
-- =

2.24.1


--===============1264743416261052583==--

