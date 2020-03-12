Content-Type: multipart/mixed; boundary="===============4434973242927059596=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Fri, 13 Mar 2020 09:19:24 +1100
Message-ID: <87ftedtdw3.fsf@notabene.neil.brown.name>
In-Reply-To: <5e5a109f2a8f64324c114f4f55b7cb7c21a8d8da.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4434973242927059596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12 2020, Jeff Layton wrote:

> On Thu, 2020-03-12 at 15:42 +1100, NeilBrown wrote:
>> On Wed, Mar 11 2020, Linus Torvalds wrote:
>> =

>> > On Wed, Mar 11, 2020 at 3:22 PM NeilBrown <neilb@suse.de> wrote:
>> > > We can combine the two ideas - move the list_del_init() later, and s=
till
>> > > protect it with the wq locks.  This avoids holding the lock across t=
he
>> > > callback, but provides clear atomicity guarantees.
>> > =

>> > Ugfh. Honestly, this is disgusting.
>> > =

>> > Now you re-take the same lock in immediate succession for the
>> > non-callback case.  It's just hidden.
>> > =

>> > And it's not like the list_del_init() _needs_ the lock (it's not
>> > currently called with the lock held).
>> > =

>> > So that "hold the lock over list_del_init()" seems to be horrendously
>> > bogus. It's only done as a serialization thing for that optimistic
>> > case.
>> > =

>> > And that optimistic case doesn't even *want* that kind of
>> > serialization. It really just wants a "I'm done" flag.
>> > =

>> > So no. Don't do this. It's mis-using the lock in several ways.
>> > =

>> >              Linus
>> =

>> It seems that test_and_set_bit_lock() is the preferred way to handle
>> flags when memory ordering is important, and I can't see how to use that
>> well with an "I'm done" flag.  I can make it look OK with a "I'm
>> detaching" flag.  Maybe this is better.
>> =

>> NeilBrown
>> =

>> From f46db25f328ddf37ca9fbd390c6eb5f50c4bd2e6 Mon Sep 17 00:00:00 2001
>> From: NeilBrown <neilb@suse.de>
>> Date: Wed, 11 Mar 2020 07:39:04 +1100
>> Subject: [PATCH] locks: restore locks_delete_lock optimization
>> =

>> A recent patch (see Fixes: below) removed an optimization which is
>> important as it avoids taking a lock in a common case.
>> =

>> The comment justifying the optimisation was correct as far as it went,
>> in that if the tests succeeded, then the values would remain stable and
>> the test result will remain valid even without a lock.
>> =

>> However after the test succeeds the lock can be freed while some other
>> thread might have only just set ->blocker to NULL (thus allowing the
>> test to succeed) but has not yet called wake_up() on the wq in the lock.
>> If the wake_up happens after the lock is freed, a use-after-free error o=
ccurs.
>> =

>> This patch restores the optimization and adds a flag to ensure this
>> use-after-free is avoid.  The use happens only when the flag is set, and
>> the free doesn't happen until the flag has been cleared, or we have
>> taken blocked_lock_lock.
>> =

>> Fixes: 6d390e4b5d48 ("locks: fix a potential use-after-free problem when=
 wakeup a waiter")
>> Signed-off-by: NeilBrown <neilb@suse.de>
>> ---
>>  fs/locks.c         | 44 ++++++++++++++++++++++++++++++++++++++------
>>  include/linux/fs.h |  3 ++-
>>  2 files changed, 40 insertions(+), 7 deletions(-)
>> =

>
> Just a note that I'm traveling at the moment, and won't be able do much
> other than comment on this for a few days.
>
>> diff --git a/fs/locks.c b/fs/locks.c
>> index 426b55d333d5..334473004c6c 100644
>> --- a/fs/locks.c
>> +++ b/fs/locks.c
>> @@ -283,7 +283,7 @@ locks_dump_ctx_list(struct list_head *list, char *li=
st_type)
>>  	struct file_lock *fl;
>>  =

>>  	list_for_each_entry(fl, list, fl_list) {
>> -		pr_warn("%s: fl_owner=3D%p fl_flags=3D0x%x fl_type=3D0x%x fl_pid=3D%u=
\n", list_type, fl->fl_owner, fl->fl_flags, fl->fl_type, fl->fl_pid);
>> +		pr_warn("%s: fl_owner=3D%p fl_flags=3D0x%lx fl_type=3D0x%x fl_pid=3D%=
u\n", list_type, fl->fl_owner, fl->fl_flags, fl->fl_type, fl->fl_pid);
>>  	}
>>  }
>>  =

>> @@ -314,7 +314,7 @@ locks_check_ctx_file_list(struct file *filp, struct =
list_head *list,
>>  	list_for_each_entry(fl, list, fl_list)
>>  		if (fl->fl_file =3D=3D filp)
>>  			pr_warn("Leaked %s lock on dev=3D0x%x:0x%x ino=3D0x%lx "
>> -				" fl_owner=3D%p fl_flags=3D0x%x fl_type=3D0x%x fl_pid=3D%u\n",
>> +				" fl_owner=3D%p fl_flags=3D0x%lx fl_type=3D0x%x fl_pid=3D%u\n",
>>  				list_type, MAJOR(inode->i_sb->s_dev),
>>  				MINOR(inode->i_sb->s_dev), inode->i_ino,
>>  				fl->fl_owner, fl->fl_flags, fl->fl_type, fl->fl_pid);
>> @@ -736,10 +736,13 @@ static void __locks_wake_up_blocks(struct file_loc=
k *blocker)
>>  		waiter =3D list_first_entry(&blocker->fl_blocked_requests,
>>  					  struct file_lock, fl_blocked_member);
>>  		__locks_delete_block(waiter);
>> -		if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
>> -			waiter->fl_lmops->lm_notify(waiter);
>> -		else
>> -			wake_up(&waiter->fl_wait);
>> +		if (!test_and_set_bit_lock(FL_DELETING, &waiter->fl_flags)) {
>> +			if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
>> +				waiter->fl_lmops->lm_notify(waiter);
>> +			else
>> +				wake_up(&waiter->fl_wait);
>> +			clear_bit_unlock(FL_DELETING, &waiter->fl_flags);
>> +		}
>
> I *think* this is probably safe.
>
> AIUI, when you use atomic bitops on a flag word like this, you should
> use them for all modifications to ensure that your changes don't get
> clobbered by another task racing in to do a read/modify/write cycle on
> the same word.
>
> I haven't gone over all of the places where fl_flags is changed, but I
> don't see any at first glance that do it on a blocked request.
>
>>  	}
>>  }
>>  =

>> @@ -753,11 +756,40 @@ int locks_delete_block(struct file_lock *waiter)
>>  {
>>  	int status =3D -ENOENT;
>>  =

>> +	/*
>> +	 * If fl_blocker is NULL, it won't be set again as this thread
>> +	 * "owns" the lock and is the only one that might try to claim
>> +	 * the lock.  So it is safe to test fl_blocker locklessly.
>> +	 * Also if fl_blocker is NULL, this waiter is not listed on
>> +	 * fl_blocked_requests for some lock, so no other request can
>> +	 * be added to the list of fl_blocked_requests for this
>> +	 * request.  So if fl_blocker is NULL, it is safe to
>> +	 * locklessly check if fl_blocked_requests is empty.  If both
>> +	 * of these checks succeed, there is no need to take the lock.
>> +	 *
>> +	 * We perform these checks only if we can set FL_DELETING.
>> +	 * This ensure that we don't race with __locks_wake_up_blocks()
>> +	 * in a way which leads it to call wake_up() *after* we return
>> +	 * and the file_lock is freed.
>> +	 */
>> +	if (!test_and_set_bit_lock(FL_DELETING, &waiter->fl_flags)) {
>> +		if (waiter->fl_blocker =3D=3D NULL &&
>> +		    list_empty(&waiter->fl_blocked_requests)) {
>> +			/* Already fully unlinked */
>> +			clear_bit_unlock(FL_DELETING, &waiter->fl_flags);
>> +			return status;
>> +		}
>> +	}
>> +
>>  	spin_lock(&blocked_lock_lock);
>>  	if (waiter->fl_blocker)
>>  		status =3D 0;
>>  	__locks_wake_up_blocks(waiter);
>>  	__locks_delete_block(waiter);
>> +	/* This flag might not be set and it is largely irrelevant
>> +	 * now, but it seem cleaner to clear it.
>> +	 */
>> +	clear_bit(FL_DELETING, &waiter->fl_flags);
>>  	spin_unlock(&blocked_lock_lock);
>>  	return status;
>>  }
>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>> index 3cd4fe6b845e..4db514f29bca 100644
>> --- a/include/linux/fs.h
>> +++ b/include/linux/fs.h
>> @@ -1012,6 +1012,7 @@ static inline struct file *get_file(struct file *f)
>>  #define FL_UNLOCK_PENDING	512 /* Lease is being broken */
>>  #define FL_OFDLCK	1024	/* lock is "owned" by struct file */
>>  #define FL_LAYOUT	2048	/* outstanding pNFS layout */
>> +#define FL_DELETING	32768	/* lock is being disconnected */
>
> nit: Why the big gap?

No good reason - it seems like a conceptually different sort of flag so
I vaguely felt that it would help if it were numerically separate.

>
>>  =

>>  #define FL_CLOSE_POSIX (FL_POSIX | FL_CLOSE)
>>  =

>> @@ -1087,7 +1088,7 @@ struct file_lock {
>>  						 * ->fl_blocker->fl_blocked_requests
>>  						 */
>>  	fl_owner_t fl_owner;
>> -	unsigned int fl_flags;
>> +	unsigned long fl_flags;
>
> This will break kABI, so backporting this to enterprise distro kernels
> won't be trivial. Not a showstopper, but it might be nice to avoid that
> if we can.
>
> While it's not quite as efficient, we could just do the FL_DELETING
> manipulation under the flc->flc_lock. That's per-inode, so it should be
> safe to do it that way.

If we are going to use a spinlock, I'd much rather not add a flag bit,
but instead use the blocked_member list_head.

I'm almost tempted to suggest adding
  smp_list_del_init_release() and smp_list_empty_careful_acquire()
so that list membership can be used as a barrier.  I'm not sure I game
though.

NeilBrown


>
>>  	unsigned char fl_type;
>>  	unsigned int fl_pid;
>>  	int fl_link_cpu;		/* what cpu's list is this on? */

--===============4434973242927059596==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1cXRXd0FDZ2tRT2V5ZTNWWmkKZ2JteHl4QUFoS291cWU2c0Vs
WWhsNEk0T0loK25DbkVhR3RNQkh5TVVpUmRLNFZyWmpFY24zMnhoRXRqd2wvMAp4WXVRUzhGUzRV
VnBac3ZBQTkxL3ljV2Z4TzliN0Y4dXBpL1hYcCtTTExEa29qaFdiTHVtMmRmdGNrMm9peUdHCklj
b1BRMHBrT09CeFkrL3UydVVkZnBtbjlPQUtpRW5hZ0crTVF5RE81SFJLSVVxYlZQRmprQWRLL1Mv
cjZ4b3AKRUh4Qm14NVFCSm9DU0RzRHE5Y0YzdjUvOURsMWdXTWY3bnk2NmlyQTgzMG5rbHBlQVFW
ZmtURnJFbm94Wm9VOAorekxjVzNkMmh6L1NWQmxQaENkcXVYSmVtcEt6bTRNTVh5M2Z4Z08wUWVo
c0NIMDduMHViVkRVc2FObXppKytuCkFwYVBFWTUwWlRyMXVYT0lNUzZyWkxFTGFMakhDU0hJdjdY
NXB1VkFRUGlmUy9GcWI5enpGbEtLZVFwQmc3Z2YKUWEvUjdvZXdxLzAza1gvTSsyQjZxMmltSW16
cDdxSFY1OUVGZWFYL09kUWFxU0RsdXV6Zm8wWGs0eHA1ekJKWApFVC9XUVBzcVhyVFhnSXpPOUND
MGswRTNUdVF0TEtqWDlQMityWnc1NVZDZ25EUFp0eExrSk9LWlpWcmgwczczCkxQRzF4bnIrTkNR
dmdmQk5rQ2VTZGd0Y2I3UjMzM051QjRKWnYwQy9BWVE3NWlhOXgzYktuVXcxWVhyYkVIYTkKc1RD
V3I1NkJTb05ub0FpT1NwdzMzalEwU0RYRy9qenh1aUg4QWxBZjViRWpoU2pjTFVZTHAwZkc3c3ZY
MHBkQwp6RlRweXFuMnJlU1lKdmpVbFh3ZHl1SUxjcnVkN3JhVVVGekpTZk44R2ZsUGhqcldpTGM9
Cj1sN0JZCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============4434973242927059596==--

