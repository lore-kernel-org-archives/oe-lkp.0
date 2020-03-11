Content-Type: multipart/mixed; boundary="===============1989591292507716337=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Thu, 12 Mar 2020 09:22:26 +1100
Message-ID: <87v9nattul.fsf@notabene.neil.brown.name>
In-Reply-To: <CAHk-=whUgeZGcs5YAfZa07BYKNDCNO=xr4wT6JLATJTpX0bjGg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1989591292507716337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10 2020, Linus Torvalds wrote:

> On Tue, Mar 10, 2020 at 3:07 PM Jeff Layton <jlayton@kernel.org> wrote:
>>
>> Given that, and the fact that Neil pointed out that yangerkun's latest
>> patch would reintroduce the original race, I'm leaning back toward the
>> patch Neil sent yesterday. It relies solely on spinlocks, and so doesn't
>> have the subtle memory-ordering requirements of the others.
>
> It has subtle locking changes, though.
>
> It now calls the "->lm_notify()" callback with the wait queue spinlock he=
ld.
>
> is that ok? It's not obvious. Those functions take other spinlocks,
> and wake up other things. See for example nlmsvc_notify_blocked()..
> Yes, it was called under the blocked_lock_lock spinlock before too,
> but now there's an _additional_ spinlock, and it must not call
> "wake_up(&waiter->fl_wait))" in the callback, for example, because it
> already holds the lock on that wait queue.
>
> Maybe that is never done. I don't know the callbacks.
>
> I was really hoping that the simple memory ordering of using that
> smp_store_release -> smp_load_acquire using fl_blocker would be
> sufficient. That's a particularly simple and efficient ordering.
>
> Oh well. If you want to go that spinlock way, it needs to document why
> it's safe to do a callback under it.
>
>                   Linus

I've learn recently to dislike calling callbacks while holding a lock.
I don't think the current callbacks care, but the requirement imposes a
burden on future callbacks too.

We can combine the two ideas - move the list_del_init() later, and still
protect it with the wq locks.  This avoids holding the lock across the
callback, but provides clear atomicity guarantees.

NeilBrown

From: NeilBrown <neilb@suse.de>
Subject: [PATCH] Subject: [PATCH] locks: restore locks_delete_lock
 optimization

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

This patch restores the optimization and reorders code to avoid the
use-after-free.  Specifically we move the list_del_init on
fl_blocked_member to *after* the wake_up(), and add an extra test on
fl_block_member() to locks_delete_lock() before deciding to avoid taking
the spinlock.

To ensure correct ordering for the list_empty() test and the
list_del_init() call, we protect them both with the wq spinlock.  This
provides required atomicity, while scaling much better than taking the
global blocked_lock_lock.

Fixes: 6d390e4b5d48 ("locks: fix a potential use-after-free problem when wa=
keup a waiter")
Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/locks.c | 46 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/fs/locks.c b/fs/locks.c
index 426b55d333d5..16098a209d63 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -721,11 +721,19 @@ static void locks_delete_global_blocked(struct file_l=
ock *waiter)
  *
  * Must be called with blocked_lock_lock held.
  */
-static void __locks_delete_block(struct file_lock *waiter)
+static void __locks_delete_block(struct file_lock *waiter, bool notify)
 {
 	locks_delete_global_blocked(waiter);
-	list_del_init(&waiter->fl_blocked_member);
 	waiter->fl_blocker =3D NULL;
+	if (notify) {
+		if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
+			waiter->fl_lmops->lm_notify(waiter);
+		else
+			wake_up(&waiter->fl_wait);
+	}
+	spin_lock(&waiter->fl_wait.lock);
+	list_del_init(&waiter->fl_blocked_member);
+	spin_unlock(&waiter->fl_wait.lock);
 }
 =

 static void __locks_wake_up_blocks(struct file_lock *blocker)
@@ -735,11 +743,7 @@ static void __locks_wake_up_blocks(struct file_lock *b=
locker)
 =

 		waiter =3D list_first_entry(&blocker->fl_blocked_requests,
 					  struct file_lock, fl_blocked_member);
-		__locks_delete_block(waiter);
-		if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
-			waiter->fl_lmops->lm_notify(waiter);
-		else
-			wake_up(&waiter->fl_wait);
+		__locks_delete_block(waiter, true);
 	}
 }
 =

@@ -753,11 +757,37 @@ int locks_delete_block(struct file_lock *waiter)
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
+	 * We also check fl_blocked_member is empty un the fl_wait.lock.
+	 * If this fails, __locks_delete_block() must still be notifying
+	 * waiters, so it isn't yet safe to return and free the file_lock.
+	 * Doing this under fl_wait.lock allows significantly better scaling
+	 * than unconditionally taking blocks_lock_lock.
+	 */
+	if (waiter->fl_blocker =3D=3D NULL &&
+	    list_empty(&waiter->fl_blocked_requests)) {
+		spin_lock(&waiter->fl_wait.lock);
+		if (list_empty(&waiter->fl_blocked_member)) {
+			spin_unlock(&waiter->fl_wait.lock);
+			return status;
+		}
+		/* Notification is still happening */
+		spin_unlock(&waiter->fl_wait.lock);
+	}
 	spin_lock(&blocked_lock_lock);
 	if (waiter->fl_blocker)
 		status =3D 0;
 	__locks_wake_up_blocks(waiter);
-	__locks_delete_block(waiter);
+	__locks_delete_block(waiter, false);
 	spin_unlock(&blocked_lock_lock);
 	return status;
 }
-- =

2.25.1


--===============1989591292507716337==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1cFpLSUFDZ2tRT2V5ZTNWWmkKZ2JsYVJRLy9adi9xQjZxZUJ4
T3pqK1NVVTF6S0pZejYxZFBEcFZWbVhEOUtpVjZZcjZ1ZGNLRVoxRzAxb3M2Ygp6cVV5ZDZWQkll
K2JxeCttb2FFS3dNdmpZN2tzdlpiTGZ5VzN1R3ZKMmhNcmxnaXM0WldVV1Z1M2UwTzg5dVgyCi9Z
V05BQmVYVllXWndvYWZQbXk2Wno0Y1dzRDVLdTAvR2twUVA2bHhMdWZzRWIxQWlqT0dqc0JXR2cw
MXZxVjEKemoxZnZ6Tktja3pSR0hDUzBhYUEzZEoycmgwVG5QSndYdmtVTmJPRUNzak5mdlNXQXVK
RnQvZTFJV0dIM3ZKSgpFTHVObnJpb0RDaC9sZXVTNUtPb1pwMEJKR0JmN2E4blJra0pVTUtjckh2
RFpVeTgyVWlsRFNCTnZzdjNzOU41Ck9WeFE4L2JlTjlrMXFhTHZKekZZUEtVeHlIcWF1YmF2RVVT
NW91aDRTTCtrWkM0RlF2YW5HTXVTYlVVMnZ2NWMKYzNBanowQ2E4dlhQV0F5QUVCdTJHNjRueUJL
Y2M3TmhIajlsTHNaZkJEQUpOLytCTTNlakwvdkdKaUlLV3MxVQpTeHRWVlFLampldC9sV29nQzZ6
SS84MTFNdVViaUFmaUsxbW43cmdIeFBEanBEa0tJUGYzRk5xWklTcGZ4eUVVCldtVExGMExWdlFO
V20vK1cyYXJuTmJ5OWN3eUwxZkJsKzRrY3ZqQ0VaZXBvOHJoTjlTbmplMFFsREVWbUNBYnIKbU5r
VVk4MU0yTUVuSE1XM2VDM3FrRlZraE4xdUxJNElNTmpwc2d0a0tMd3VlRjh6WmNkL1A1VHlObTJ1
c2hOegpWanMzTjE2RXNZTXVXZEtNMkFBMXpSWXgvVVJkcFNBRzkvS3g0NjQ2ajZuSFhqc0RHZnM9
Cj00QWdRCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============1989591292507716337==--

