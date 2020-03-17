Content-Type: multipart/mixed; boundary="===============3706185162372308616=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Wed, 18 Mar 2020 08:27:40 +1100
Message-ID: <878sjysmcz.fsf@notabene.neil.brown.name>
In-Reply-To: <46d2c16f48f1fd4ad28a85099c59ae95a9997740.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3706185162372308616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17 2020, Jeff Layton wrote:

> On Tue, 2020-03-17 at 09:45 +1100, NeilBrown wrote:
>> > +
>> > +	/*
>> > +	 * Tell the world we're done with it - see comment at top
>> > +	 * of this function
>> =

>> This comment might be misleading.  The world doesn't care.
>> Only this thread cares where ->fl_blocker is NULL.  We need the release
>> semantics when some *other* thread sets fl_blocker to NULL, not when
>> this thread does.
>> I don't think we need to spell that out and I'm not against using
>> store_release here, but locks_delete_block cannot race with itself, so
>> referring to the comment at the top of this function is misleading.
>> =

>> So:
>>   Reviewed-by: NeilBrown <neilb@suse.de>
>> =

>> but I'm not totally happy with the comments.
>> =

>> =

>
> Thanks Neil. We can clean up the comments before merge. How about this
> revision to the earlier patch? I took the liberty of poaching your your
> proposed verbiage:

Thanks.  I'm happy with that.

(Well.... actually I hate the use of the word "official" unless there is
a well defined office holder being blamed.  But the word has come to
mean something vaguer in common usage and there is probably no point
fighting it.  In this case "formal" is close but less personally
annoying, but I'm not sure the word is needed at all).

Thanks,
NeilBrown


>
> ------------------8<---------------------
>
> From c9fbfae0ab615e20de0bdf1ae7b27591d602f577 Mon Sep 17 00:00:00 2001
> From: Jeff Layton <jlayton@kernel.org>
> Date: Mon, 16 Mar 2020 18:57:47 -0400
> Subject: [PATCH] SQUASH: update with Neil's comments
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/locks.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/fs/locks.c b/fs/locks.c
> index eaf754ecdaa8..e74075b0e8ec 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -741,8 +741,9 @@ static void __locks_wake_up_blocks(struct file_lock *=
blocker)
>  			wake_up(&waiter->fl_wait);
>  =

>  		/*
> -		 * Tell the world we're done with it - see comment at
> -		 * top of locks_delete_block().
> +		 * The setting of fl_blocker to NULL marks the official "done"
> +		 * point in deleting a block. Paired with acquire at the top
> +		 * of locks_delete_block().
>  		 */
>  		smp_store_release(&waiter->fl_blocker, NULL);
>  	}
> @@ -761,11 +762,23 @@ int locks_delete_block(struct file_lock *waiter)
>  	/*
>  	 * If fl_blocker is NULL, it won't be set again as this thread "owns"
>  	 * the lock and is the only one that might try to claim the lock.
> -	 * Because fl_blocker is explicitly set last during a delete, it's
> -	 * safe to locklessly test to see if it's NULL. If it is, then we know
> -	 * that no new locks can be inserted into its fl_blocked_requests list,
> -	 * and we can therefore avoid doing anything further as long as that
> -	 * list is empty.
> +	 *
> +	 * We use acquire/release to manage fl_blocker so that we can
> +	 * optimize away taking the blocked_lock_lock in many cases.
> +	 *
> +	 * The smp_load_acquire guarantees two things:
> +	 *
> +	 * 1/ that fl_blocked_requests can be tested locklessly. If something
> +	 * was recently added to that list it must have been in a locked region
> +	 * *before* the locked region when fl_blocker was set to NULL.
> +	 *
> +	 * 2/ that no other thread is accessing 'waiter', so it is safe to free
> +	 * it.  __locks_wake_up_blocks is careful not to touch waiter after
> +	 * fl_blocker is released.
> +	 *
> +	 * If a lockless check of fl_blocker shows it to be NULL, we know that
> +	 * no new locks can be inserted into its fl_blocked_requests list, and
> +	 * can avoid doing anything further if the list is empty.
>  	 */
>  	if (!smp_load_acquire(&waiter->fl_blocker) &&
>  	    list_empty(&waiter->fl_blocked_requests))
> @@ -778,8 +791,8 @@ int locks_delete_block(struct file_lock *waiter)
>  	__locks_delete_block(waiter);
>  =

>  	/*
> -	 * Tell the world we're done with it - see comment at top
> -	 * of this function
> +	 * The setting of fl_blocker to NULL marks the official "done" point in
> +	 * deleting a block. Paired with acquire at the top of this function.
>  	 */
>  	smp_store_release(&waiter->fl_blocker, NULL);
>  	spin_unlock(&blocked_lock_lock);
> -- =

> 2.24.1

--===============3706185162372308616==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1eFFNd0FDZ2tRT2V5ZTNWWmkKZ2JrbHl3Ly9iRnRDeDNOT2FD
STIybDF4UXBhS3Z0TEJZMTF6dkxMaVNFTXZpZjFxdmEyTzBLVERjdHpJY3BpOQpYaWJhbUtEMVlt
RGFPaTBrN1kyNjdOd3FBZE1qeUZTS3QvZDdwU1VFTFVCZmRyK3grZDQ4dHZGL3grUVQrSHEwCnh0
K1BwNlcyUCthelVzd2hoajRFV0VHaGh0SWVnR0hmdjFjNkdmQkM4TmFyZ1B0YWVhM1VsOXVva3Iv
Ym9ZYTEKZDBPaUVPeGFFMHJBcDA0WVFlTVlpZHRFZ2h1U2dCMmc2U1JWbDYrZVZoTFl5TmErdnNr
NVR4U1NaMkU1UGYyUApGdVNzSC9KUllRdWNtaTJyZmtaMnJ1MmtXdmJRSUtnalZhTERaa3JVaDNT
QW5SK3ZZNlMrYkhEcjlxZVIzYmxzCjE1RU16c0ppYm5FSkh4VjJYdzduQWJSS0FjRDZ3NUhOSjZ4
dERYVXdsbzhMZFAxWTVER2x1NnZXNzZzVExZam0KMG9GV0t2KzhobDNoMk5DamNLK0Zhb2h3RDRD
M3VYMFpsVjBRVzF0K1NURGo0a21JcGJ2TlZ4ZHBzOEZrVGdBZwppdTVxVWYxcW9ZUzlYSXRlZ0Nw
OUFEYUtUdWw0RVBzMGNqZXZxR3JESGZDU2l1amJ3MHhXWUlWV1ZUSGRvVGdBCkZSM0JabXRFNFhF
NDR3a0Q1TjJ6MFJQMzUxeW5QNm1KcXV6Y0NPVjYvbnp1bGdtLy9ORVA2NHBmWmpXeU1pQWIKVGdT
QlBQQ1lnWUdPd09WZUN4ajN1aUpmLytRTW85TEpYQU9zV2k1Qk1ya3pBRGlyRDcwdHUrUW1sQUN6
L1ExeApDQmhWRXdpMFYrYUJMbmkwdW5ieDBQREJQcWppTHBpRHhEQXAxWTRReEtTV1pwbWdicTg9
Cj1WQ1M2Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============3706185162372308616==--

