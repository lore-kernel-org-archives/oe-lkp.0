Content-Type: multipart/mixed; boundary="===============6680300920947294393=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Thu, 12 Mar 2020 15:42:07 +1100
Message-ID: <87o8t2tc9s.fsf@notabene.neil.brown.name>
In-Reply-To: <CAHk-=wiNoAk8v3GrbK3=q6KRBrhLrTafTmWmAo6-up6Ce9fp6A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6680300920947294393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11 2020, Linus Torvalds wrote:

> On Wed, Mar 11, 2020 at 3:22 PM NeilBrown <neilb@suse.de> wrote:
>>
>> We can combine the two ideas - move the list_del_init() later, and still
>> protect it with the wq locks.  This avoids holding the lock across the
>> callback, but provides clear atomicity guarantees.
>
> Ugfh. Honestly, this is disgusting.
>
> Now you re-take the same lock in immediate succession for the
> non-callback case.  It's just hidden.
>
> And it's not like the list_del_init() _needs_ the lock (it's not
> currently called with the lock held).
>
> So that "hold the lock over list_del_init()" seems to be horrendously
> bogus. It's only done as a serialization thing for that optimistic
> case.
>
> And that optimistic case doesn't even *want* that kind of
> serialization. It really just wants a "I'm done" flag.
>
> So no. Don't do this. It's mis-using the lock in several ways.
>
>              Linus

It seems that test_and_set_bit_lock() is the preferred way to handle
flags when memory ordering is important, and I can't see how to use that
well with an "I'm done" flag.  I can make it look OK with a "I'm
detaching" flag.  Maybe this is better.

NeilBrown

>From f46db25f328ddf37ca9fbd390c6eb5f50c4bd2e6 Mon Sep 17 00:00:00 2001
From: NeilBrown <neilb@suse.de>
Date: Wed, 11 Mar 2020 07:39:04 +1100
Subject: [PATCH] locks: restore locks_delete_lock optimization

A recent patch (see Fixes: below) removed an optimization which is
important as it avoids taking a lock in a common case.

The comment justifying the optimisation was correct as far as it went,
in that if the tests succeeded, then the values would remain stable and
the test result will remain valid even without a lock.

However after the test succeeds the lock can be freed while some other
thread might have only just set ->blocker to NULL (thus allowing the
test to succeed) but has not yet called wake_up() on the wq in the lock.
If the wake_up happens after the lock is freed, a use-after-free error occu=
rs.

This patch restores the optimization and adds a flag to ensure this
use-after-free is avoid.  The use happens only when the flag is set, and
the free doesn't happen until the flag has been cleared, or we have
taken blocked_lock_lock.

Fixes: 6d390e4b5d48 ("locks: fix a potential use-after-free problem when wa=
keup a waiter")
Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/locks.c         | 44 ++++++++++++++++++++++++++++++++++++++------
 include/linux/fs.h |  3 ++-
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/locks.c b/fs/locks.c
index 426b55d333d5..334473004c6c 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -283,7 +283,7 @@ locks_dump_ctx_list(struct list_head *list, char *list_=
type)
 	struct file_lock *fl;
 =

 	list_for_each_entry(fl, list, fl_list) {
-		pr_warn("%s: fl_owner=3D%p fl_flags=3D0x%x fl_type=3D0x%x fl_pid=3D%u\n"=
, list_type, fl->fl_owner, fl->fl_flags, fl->fl_type, fl->fl_pid);
+		pr_warn("%s: fl_owner=3D%p fl_flags=3D0x%lx fl_type=3D0x%x fl_pid=3D%u\n=
", list_type, fl->fl_owner, fl->fl_flags, fl->fl_type, fl->fl_pid);
 	}
 }
 =

@@ -314,7 +314,7 @@ locks_check_ctx_file_list(struct file *filp, struct lis=
t_head *list,
 	list_for_each_entry(fl, list, fl_list)
 		if (fl->fl_file =3D=3D filp)
 			pr_warn("Leaked %s lock on dev=3D0x%x:0x%x ino=3D0x%lx "
-				" fl_owner=3D%p fl_flags=3D0x%x fl_type=3D0x%x fl_pid=3D%u\n",
+				" fl_owner=3D%p fl_flags=3D0x%lx fl_type=3D0x%x fl_pid=3D%u\n",
 				list_type, MAJOR(inode->i_sb->s_dev),
 				MINOR(inode->i_sb->s_dev), inode->i_ino,
 				fl->fl_owner, fl->fl_flags, fl->fl_type, fl->fl_pid);
@@ -736,10 +736,13 @@ static void __locks_wake_up_blocks(struct file_lock *=
blocker)
 		waiter =3D list_first_entry(&blocker->fl_blocked_requests,
 					  struct file_lock, fl_blocked_member);
 		__locks_delete_block(waiter);
-		if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
-			waiter->fl_lmops->lm_notify(waiter);
-		else
-			wake_up(&waiter->fl_wait);
+		if (!test_and_set_bit_lock(FL_DELETING, &waiter->fl_flags)) {
+			if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
+				waiter->fl_lmops->lm_notify(waiter);
+			else
+				wake_up(&waiter->fl_wait);
+			clear_bit_unlock(FL_DELETING, &waiter->fl_flags);
+		}
 	}
 }
 =

@@ -753,11 +756,40 @@ int locks_delete_block(struct file_lock *waiter)
 {
 	int status =3D -ENOENT;
 =

+	/*
+	 * If fl_blocker is NULL, it won't be set again as this thread
+	 * "owns" the lock and is the only one that might try to claim
+	 * the lock.  So it is safe to test fl_blocker locklessly.
+	 * Also if fl_blocker is NULL, this waiter is not listed on
+	 * fl_blocked_requests for some lock, so no other request can
+	 * be added to the list of fl_blocked_requests for this
+	 * request.  So if fl_blocker is NULL, it is safe to
+	 * locklessly check if fl_blocked_requests is empty.  If both
+	 * of these checks succeed, there is no need to take the lock.
+	 *
+	 * We perform these checks only if we can set FL_DELETING.
+	 * This ensure that we don't race with __locks_wake_up_blocks()
+	 * in a way which leads it to call wake_up() *after* we return
+	 * and the file_lock is freed.
+	 */
+	if (!test_and_set_bit_lock(FL_DELETING, &waiter->fl_flags)) {
+		if (waiter->fl_blocker =3D=3D NULL &&
+		    list_empty(&waiter->fl_blocked_requests)) {
+			/* Already fully unlinked */
+			clear_bit_unlock(FL_DELETING, &waiter->fl_flags);
+			return status;
+		}
+	}
+
 	spin_lock(&blocked_lock_lock);
 	if (waiter->fl_blocker)
 		status =3D 0;
 	__locks_wake_up_blocks(waiter);
 	__locks_delete_block(waiter);
+	/* This flag might not be set and it is largely irrelevant
+	 * now, but it seem cleaner to clear it.
+	 */
+	clear_bit(FL_DELETING, &waiter->fl_flags);
 	spin_unlock(&blocked_lock_lock);
 	return status;
 }
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3cd4fe6b845e..4db514f29bca 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1012,6 +1012,7 @@ static inline struct file *get_file(struct file *f)
 #define FL_UNLOCK_PENDING	512 /* Lease is being broken */
 #define FL_OFDLCK	1024	/* lock is "owned" by struct file */
 #define FL_LAYOUT	2048	/* outstanding pNFS layout */
+#define FL_DELETING	32768	/* lock is being disconnected */
 =

 #define FL_CLOSE_POSIX (FL_POSIX | FL_CLOSE)
 =

@@ -1087,7 +1088,7 @@ struct file_lock {
 						 * ->fl_blocker->fl_blocked_requests
 						 */
 	fl_owner_t fl_owner;
-	unsigned int fl_flags;
+	unsigned long fl_flags;
 	unsigned char fl_type;
 	unsigned int fl_pid;
 	int fl_link_cpu;		/* what cpu's list is this on? */
-- =

2.25.1


--===============6680300920947294393==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1cHZaOEFDZ2tRT2V5ZTNWWmkKZ2JuU05CQUFuRFhKRGFKYWZ1
M0hWT1Z0VmM2QjF1dE1rRmZSYlE3SnBJRllpV1NYYjhOOEVLZGNTelZQbU9GYgpRdGEybjFLN3dE
ZStRM2ZuM1h2QUhNdTdYVFRxcmZ5amRPc0FEV2l2NkRyNHMrT1RIMDE1SjR4NDZwR3J0NVNMCnZQ
MmRhQUVKNjVrdTFYMWdEZmFRSW5CekQ5RnUwRUVaMjQ1Mkc2Q0VKc2c5WVhNU2ZMSzhIWnFVSTl0
QU9HR04KTHJNY1RHWUR2N1JGakEwREZWNHZ0NFVwSzMrTHQxODB0TGtMUE5SRlpZLzlaUGxHNzJw
YmE0WUkrQ0JYUXZuSwpzc2w3MVlWZHcvVThsRmRmeGdkNy9BRmRQNmlIOWNRWDRYdHN0UW9GUld4
b3k5TWFNQzFRNThCWGlzUERYRjl2Ck0yNWZYRlZEbVFwR2JOUXdjeDgvU2JKck1LNDlQQUtnL1pn
NEdpdEw5OXAvQTlBdmlPSGhxdTR5NWYybW1HZzEKLzhlRk10ejNVdWRTTVd1U1FlUlpkVG4rbFA3
RnRHSVQvTTNvWC80Zm9VTHViVlloYitWTXZWZW1mYUJRZ2l2aAprZmNrdHl5SkNDcHltUk45amVV
MGYrSlNrR2hGZkF5amxRTmgxenhoQmF1ZUFaRnpsNnV1clljWWFkczhnM3lUCml3RnFIUGNQWXZt
RllWQS9rNXZUd0hSOWw5VVc1bTFkNWZ6QTd3SUpMRWcra3J6NXFsN2VvZVFaOUpobDNwYVUKa2Vi
ZkJaLzZ3ay80NVZVNWVRaXNrOElYb1VTaW9iV2xqUDk0ZUwxNzdha2NiY0tWU3prUmRQNVhvZWZD
a1ZhQgo1QTNDTE4rY0piS2hYek1YbGQ5WlpGeUdObDdRb0xkaHBDRXlCbm42ZWVhd1dkak5QbWs9
Cj13T1FDCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============6680300920947294393==--

