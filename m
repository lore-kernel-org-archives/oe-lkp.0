Content-Type: multipart/mixed; boundary="===============0242964368918190667=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 10 Mar 2020 08:42:13 +1100
Message-ID: <87blp5urwq.fsf@notabene.neil.brown.name>
In-Reply-To: <1bfba96b4bf0d3ca9a18a2bced3ef3a2a7b44dad.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0242964368918190667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09 2020, Jeff Layton wrote:

> On Mon, 2020-03-09 at 13:22 -0400, Jeff Layton wrote:
>> On Mon, 2020-03-09 at 08:52 -0700, Linus Torvalds wrote:
>> > On Mon, Mar 9, 2020 at 7:36 AM Jeff Layton <jlayton@kernel.org> wrot=
e:
>> > > On Sun, 2020-03-08 at 22:03 +0800, kernel test robot wrote:
>> > > > FYI, we noticed a -96.6% regression of will-it-scale.per_process_o=
ps due to commit:
>> > > =

>> > > This is not completely unexpected as we're banging on the global
>> > > blocked_lock_lock now for every unlock. This test just thrashes file
>> > > locks and unlocks without doing anything in between, so the workload
>> > > looks pretty artificial [1].
>> > > =

>> > > It would be nice to avoid the global lock in this codepath, but it
>> > > doesn't look simple to do. I'll keep thinking about it, but for now =
I'm
>> > > inclined to ignore this result unless we see a problem in more reali=
stic
>> > > workloads.
>> > =

>> > That is a _huge_ regression, though.
>> > =

>> > What about something like the attached? Wouldn't that work? And make
>> > the code actually match the old comment about wow "fl_blocker" being
>> > NULL being special.
>> > =

>> > The old code seemed to not know about things like memory ordering eith=
er.
>> > =

>> > Patch is entirely untested, but aims to have that "smp_store_release()
>> > means I'm done and not going to touch it any more", making that
>> > smp_load_acquire() test hopefully be valid as per the comment..
>> =

>> Yeah, something along those lines maybe. I don't think we can use
>> fl_blocker that way though, as the wait_event_interruptible is waiting
>> on it to go to NULL, and the wake_up happens before fl_blocker is
>> cleared.
>> =

>> Maybe we need to mix in some sort of FL_BLOCK_ACTIVE flag and use that
>> instead of testing for !fl_blocker to see whether we can avoid the
>> blocked_lock_lock?
>>   =

>
> How about something like this instead? (untested other than for
> compilation)
>
> Basically, this just switches the waiters over to wait for
> fl_blocked_member to go empty. That still happens before the wakeup, so
> it should be ok to wait on that.
>
> I think we can also eliminate the lockless list_empty check in
> locks_delete_block, as the fl_blocker check should be sufficient now.
> -- =

> Jeff Layton <jlayton@kernel.org>
> From c179d779c9b72838ed9996a65d686d86679d1639 Mon Sep 17 00:00:00 2001
> From: Linus Torvalds <torvalds@linux-foundation.org>
> Date: Mon, 9 Mar 2020 14:35:43 -0400
> Subject: [PATCH] locks: reinstate locks_delete_lock optimization
>
> ...by using smp_load_acquire and smp_store_release to close the race
> window.
>
> [ jlayton: wait on the fl_blocked_requests list to go empty instead of
> 	   the fl_blocker pointer to clear. Remove the list_empty check
> 	   from locks_delete_lock shortcut. ]

Why do you think it is OK to remove that list_empty check?  I don't
think it is.  There might be locked requests that need to be woken up.

As the problem here is a use-after-free due to a race, one option would
be to use rcu_free() on the file_lock, and hold rcu_read_lock() around
test/use.

Another option is to use a different lock.  The fl_wait contains a
spinlock, and we have wake_up_locked() which is provided for exactly
these sorts of situations where the wake_up call can race with a thread
waking up.

So my compile-tested-only proposal is below.
I can probably a proper change-log entry if you think the patch is a
good way to go.

NeilBrown


diff --git a/fs/locks.c b/fs/locks.c
index 426b55d333d5..8aa04d5ac8b3 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -735,11 +735,13 @@ static void __locks_wake_up_blocks(struct file_lock *=
blocker)
 =

 		waiter =3D list_first_entry(&blocker->fl_blocked_requests,
 					  struct file_lock, fl_blocked_member);
+		spin_lock(&waiter->fl_wait.lock);
 		__locks_delete_block(waiter);
 		if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
 			waiter->fl_lmops->lm_notify(waiter);
 		else
-			wake_up(&waiter->fl_wait);
+			wake_up_locked(&waiter->fl_wait);
+		spin_unlock(&waiter->fl_wait.lock);
 	}
 }
 =

@@ -753,6 +755,31 @@ int locks_delete_block(struct file_lock *waiter)
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
+	 * However, some other thread might have only *just* set
+	 * fl_blocker to NULL and it about to send a wakeup on
+	 * fl_wait, so we mustn't return too soon or we might free waiter
+	 * before that wakeup can be sent.  So take the fl_wait.lock
+	 * to serialize with the wakeup in __locks_wake_up_blocks().
+	 */
+	if (waiter->fl_blocker =3D=3D NULL) {
+		spin_lock(&waiter->fl_wait.lock);
+		if (waiter->fl_blocker =3D=3D NULL &&
+		    list_empty(&waiter->fl_blocked_requests)) {
+			spin_unlock(&waiter->fl_wait.lock);
+			return status;
+		}
+		spin_unlock(&waiter->fl_wait.lock);
+	}
 	spin_lock(&blocked_lock_lock);
 	if (waiter->fl_blocker)
 		status =3D 0;


--===============0242964368918190667==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1bXVEZ0FDZ2tRT2V5ZTNWWmkKZ2JsM3RRLy9XRzFhRTlkSk9t
NmxWd1pFOFFBWUg4NllmMlNOSDlUYmlaU0t6OWNlZ24vb0xMaXBFUzluazlOTApxVnJWS0RXSEVC
MklZaTlwUW8yVzlDOFJNR2Qwc2wzdURQM0QveEYvLzcyeXJHNW1nY3VRcmVodlNwUk9KMXp1Ck1z
anJiRk9DNm1VZnNXZCtNTlo0MW1pUi9abXh1VndIc2RNcXZURXhreGFSc3pnVTl6VXNGa21rbDRl
VHZCNEQKRzF6Y3pMcmtEMkdlQXZJUWlDL2M5QW9LdGNNMVAwS0VLM0huL3hjTFd0RGNoRDlJTmQ0
UjU3K1BaL0hNenQ2WQphQWxFWkh4STl0L0NEalM1V1lSUTk4elhEK21OZVJwQW9MTjBmUFZDeHdn
TnBIak1OVWo0aFZpd1hFZFFwSjVQCmNCWHIyeUZpNmY2dHMzbVNMUVQveUFId0crMzBNMTBMUzhG
dFJhMGRnVHhkTUNNRU5JcTFZa2puQnQ2a3RkM24KYmZHODJwWnJVSEs4eXhRQmVmcHNWOG9ka0pM
bW85cVZ1TFQ5dlRPc1VkOXhETlZpOXhpZElDckRoTjhKYnNWZApadDRDMHNaZkNMSWRMNFpGVFA2
RFNUSFNReG12c0U4RkQxWUxZQmgwU295WFlOU3ZRazh0bVhkYUhLQVF2VHRnCkhDSFZNVm5iMFFJ
NWtMZGIvNTNmOURiMUZ5SWpIcExmSGFvdWh0T2pZK21wcjdqZHBHV3A0em1jc1pOQm84VUwKbkV3
VDN0RzRYUCtCUFM4aTlkNVFwRGZZOFlkVU9GNDBnNzNHODk3bXFsYU05RTNxb2dFYkRjY1FNQTNv
ejYyZgo1NmQ1T0tPNENGMkhYY21QT3BQemtWeDFiaW1aYVF5QzByUlcyNlBxSzFvR3A1M1BsN3M9
Cj14VmExCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============0242964368918190667==--

