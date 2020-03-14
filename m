Content-Type: multipart/mixed; boundary="===============1003688045761097997=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Sat, 14 Mar 2020 13:31:03 +1100
Message-ID: <877dznu0pk.fsf@notabene.neil.brown.name>
In-Reply-To: <f000e352d9e103b3ade3506aac225920420d2323.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1003688045761097997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13 2020, Jeff Layton wrote:

> On Thu, 2020-03-12 at 09:07 -0700, Linus Torvalds wrote:
>> On Wed, Mar 11, 2020 at 9:42 PM NeilBrown <neilb@suse.de> wrote:
>> > It seems that test_and_set_bit_lock() is the preferred way to handle
>> > flags when memory ordering is important
>> =

>> That looks better.
>> =

>> The _preferred_ way is actually the one I already posted: do a
>> "smp_store_release()" to store the flag (like a NULL pointer), and a
>> smp_load_acquire() to load it.
>> =

>> That's basically optimal on most architectures (all modern ones -
>> there are bad architectures from before people figured out that
>> release/acquire is better than separate memory barriers), not needing
>> any atomics and only minimal memory ordering.
>> =

>> I wonder if a special flags value (keeping it "unsigned int" to avoid
>> the issue Jeff pointed out) might be acceptable?
>> =

>> IOW, could we do just
>> =

>>         smp_store_release(&waiter->fl_flags, FL_RELEASED);
>> =

>> to say that we're done with the lock? Or do people still look at and
>> depend on the flag values at that point?
>
> I think nlmsvc_grant_block does. We could probably work around it
> there, but we'd need to couple this change with some clear
> documentation to make it clear that you can't rely on fl_flags after
> locks_delete_block returns.
>
> If avoiding new locks is preferred here (and I'm fine with that), then
> maybe we should just go with the patch you sent originally (along with
> changing the waiters to wait on fl_blocked_member going empty instead
> of the fl_blocker going NULL)?

I agree.  I've poked at this for a while and come to the conclusion that
I cannot really come up with anything that is structurally better than
your patch.
The idea of list_del_init_release() and list_empty_acquire() is growing
on me though.  See below.

list_empty_acquire() might be appropriate for waitqueue_active(), which
is documented as requiring a memory barrier, but in practice seems to
often be used without one.

But I'm happy for you to go with your patch that changes all the wait
calls.

NeilBrown



diff --git a/fs/locks.c b/fs/locks.c
index 426b55d333d5..2e5eb677c324 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -174,6 +174,20 @@
 =

 #include <linux/uaccess.h>
 =

+/* Should go in list.h */
+static inline int list_empty_acquire(const struct list_head *head)
+{
+	return smp_load_acquire(&head->next) =3D=3D head;
+}
+
+static inline void list_del_init_release(struct list_head *entry)
+{
+	__list_del_entry(entry);
+	entry->prev =3D entry;
+	smp_store_release(&entry->next, entry);
+}
+
+
 #define IS_POSIX(fl)	(fl->fl_flags & FL_POSIX)
 #define IS_FLOCK(fl)	(fl->fl_flags & FL_FLOCK)
 #define IS_LEASE(fl)	(fl->fl_flags & (FL_LEASE|FL_DELEG|FL_LAYOUT))
@@ -724,7 +738,6 @@ static void locks_delete_global_blocked(struct file_loc=
k *waiter)
 static void __locks_delete_block(struct file_lock *waiter)
 {
 	locks_delete_global_blocked(waiter);
-	list_del_init(&waiter->fl_blocked_member);
 	waiter->fl_blocker =3D NULL;
 }
 =

@@ -740,6 +753,11 @@ static void __locks_wake_up_blocks(struct file_lock *b=
locker)
 			waiter->fl_lmops->lm_notify(waiter);
 		else
 			wake_up(&waiter->fl_wait);
+		/*
+		 * Tell the world that we're done with it - see comment at
+		 * top of locks_delete_block().
+		 */
+		list_del_init_release(&waiter->fl_blocked_member);
 	}
 }
 =

@@ -753,6 +771,25 @@ int locks_delete_block(struct file_lock *waiter)
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
+	 * However, some other thread could still be in__locks_wake_up_blocks()
+	 * and may yet access 'waiter', so we cannot return and possibly
+	 * free the 'waiter' unless we check that __locks_wake_up_blocks()
+	 * is done.  For that we carefully test fl_blocked_member.
+	 */
+	if (waiter->fl_blocker =3D=3D NULL &&
+	    list_empty(&waiter->fl_blocked_requests) &&
+	    list_empty_acquire(&waiter->fl_blocked_member))
+		return status;
 	spin_lock(&blocked_lock_lock);
 	if (waiter->fl_blocker)
 		status =3D 0;

--===============1003688045761097997==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1c1FlZ0FDZ2tRT2V5ZTNWWmkKZ2JsdVFSQUFwczRua3NoUnJ0
elRCYy92OE9EczZIWXpqR3R4MXM3cE9zNXJMVW9wTVFHU3B0SE80VjArempOZwprK3FGUnh2Z1JT
V1c4REp2VWJHRENjRkRWL1dMQklPSHRVQmtIY3BNcVhTcXp4RzI5ZXhvdHZFQnVjMDdTZmJDCkJG
c0FidkxCNnBaTHV0WUs2ZmxUcnpkTXlBTzVXbTA2UVltTE1UdFZKUW5NdlBzYWFRcVZvekZCMktW
WitMZ0MKZUVFeC9URHRxaHk2UGFHbG4wNW5QM1BDOEdoYkQrd016TkordExvcmlqMDNjRkVmUytJ
ZmZWT29NMFE5b3EvSApQZHhwN2xaT1B2NWVoY0xvMGxTZ1RrUFNkVGtXR3EzUUZaR253TkZBcnV1
YmUrOU8vYVo0TGVhTXJveUpuQjRHCnRpOTArZlNrd3VyM1JwYlp2ZE1LOTZQd1NUeTMyYjl0WTVh
T2lRZTd0RmF2M1lJdndsRTZmemRhdWRPQzJoTkkKMkJOb3IyOElUb3ZSOHVDQjRsVWI4aThxQVh4
NkpFOTg4Tm5aMmoyTFFHWmVHVStFTDJDYTRrbFVva3Fqd042bQoveENMajBybjhMTnNaZ1dudjhR
dXNnZmQxaTQrQ3lQWjgrQ2NvZHpkTTJucGVZcDNqZ21qdmRLaDI5RjZNa0pQCkZHOXEwZ0ljZmVi
NWlkM2xBVUk0TVdTYjNyK3NabW1RdnFEMTlySURRdUNpcWJJbzFOVG03d2xtTXJZQ2tnSC8KMUo4
N2luNy9mZ29wL05BRG5GcnRIeVZGOVRoaTl0VTRXT3R0TDFyMWxkakxHY2lscVVSeEkxOGpmODIr
TFliQwp5dWdvY3JuRjBYdzMrdGZaeWNKU0FKMkpoWmtOZU9FcDdNVW9SY2RjSlhjZmtzSXg2d289
Cj00UHBqCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============1003688045761097997==--

