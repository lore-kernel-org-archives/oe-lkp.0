Content-Type: multipart/mixed; boundary="===============6795287429022467035=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 17 Mar 2020 09:45:37 +1100
Message-ID: <87k13jsyum.fsf@notabene.neil.brown.name>
In-Reply-To: <ce48ed9e48eda3c0f27d2f417314bd00cb1a68db.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6795287429022467035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16 2020, Jeff Layton wrote:

> @@ -740,6 +739,12 @@ static void __locks_wake_up_blocks(struct file_lock =
*blocker)
>  			waiter->fl_lmops->lm_notify(waiter);
>  		else
>  			wake_up(&waiter->fl_wait);
> +
> +		/*
> +		 * Tell the world we're done with it - see comment at
> +		 * top of locks_delete_block().
> +		 */
> +		smp_store_release(&waiter->fl_blocker, NULL);
>  	}
>  }
>  =

> @@ -753,11 +758,30 @@ int locks_delete_block(struct file_lock *waiter)
>  {
>  	int status =3D -ENOENT;
>  =

> +	/*
> +	 * If fl_blocker is NULL, it won't be set again as this thread "owns"
> +	 * the lock and is the only one that might try to claim the lock.
> +	 * Because fl_blocker is explicitly set last during a delete, it's
> +	 * safe to locklessly test to see if it's NULL. If it is, then we know
> +	 * that no new locks can be inserted into its fl_blocked_requests list,
> +	 * and we can therefore avoid doing anything further as long as that
> +	 * list is empty.

I think it would be worth spelling out what the 'acquire' is needed
for.  We seem to have a general policy of requiring comment to explain
the presence of barriers.

  The 'acquire' on fl_blocker guarantees two things.
  1/ that fl_blocked_requests can be tested locklessly. If something was
     recently added to that list it must have been in a locked region
     *before* the locked region when fl_blocker was set to NULL.
  2/ that no other thread is accessing 'waiter', so it is safe to free it.
      __locks_wake_up_blocks is careful not to touch waiter after
      fl_blocker is released.  =

  =


> +	 */
> +	if (!smp_load_acquire(&waiter->fl_blocker) &&
> +	    list_empty(&waiter->fl_blocked_requests))
> +		return status;
> +
>  	spin_lock(&blocked_lock_lock);
>  	if (waiter->fl_blocker)
>  		status =3D 0;
>  	__locks_wake_up_blocks(waiter);
>  	__locks_delete_block(waiter);
> +
> +	/*
> +	 * Tell the world we're done with it - see comment at top
> +	 * of this function

This comment might be misleading.  The world doesn't care.
Only this thread cares where ->fl_blocker is NULL.  We need the release
semantics when some *other* thread sets fl_blocker to NULL, not when
this thread does.
I don't think we need to spell that out and I'm not against using
store_release here, but locks_delete_block cannot race with itself, so
referring to the comment at the top of this function is misleading.

So:
  Reviewed-by: NeilBrown <neilb@suse.de>

but I'm not totally happy with the comments.

Thanks,
NeilBrown


> +	 */
> +	smp_store_release(&waiter->fl_blocker, NULL);
>  	spin_unlock(&blocked_lock_lock);
>  	return status;
>  }

--===============6795287429022467035==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1d0FaRUFDZ2tRT2V5ZTNWWmkKZ2JrcDFoQUF2Y1JlVGZBTWk2
NjIrcWFBcmpwWURtK0VwaFZmS3dhVWoyL0hEZmQ1SDl1WllWdUFjZzM1Sk4xcwo3c1dsUVhIeFF2
aWpvRjVFbzVtdTN2NnBxdTYzRWR4V0syaTFiY09aUThWY0dwbVkwREYrNDQ4aWRsWWRMUTJDCmRJ
cDlQcmhpRmRjdXRMZzlEdFY4NG1INnJqV3FoRTl3aGlXN1N0bVVXY2dHczFvdzVmbGxvTGVmSVZO
Znp6MW4KbmRvWkp1TGhpbTkzbDFmUUQyQ1dEWmloNVRycjZyL2d0bVVRVXFIanFmR01IOTJnWmJJ
ZG0yVlpXREJlRDJRUwpSY3l5aTVHT1dMLzR6Rmp6NWlMR0hnVkFvNm5rN1NrSlR5MGMyR2RzblNz
ZTFaWjFVNURLZkZpYWg1ZVl2cmN5CmhyQ2tvc1FjS3pzYktVcllPM1BxdFV6aTZSNzRpWlNxSVpI
dnFiT1czWUNxbGNCS2ZzYzdielAxN212NUk3WHEKVDN6OW10UFl4OFJFdjg5ZStMR1V6dVhva1h0
NU1WbVAxYmZQTTUxM3g3UVRwdE5XSURqMEpINytTTXBXZWlZUgpackhXbU5LNHNSb0Ezd0c4NThL
YlZtUWwvRExYdHZDcm5JRkhxbzQzQVhBUGppRUh4TTNZQkdzdGY3UHlvcmxaCjZxZks2dmxndzgy
WUFoV1huaDVpL2ZnM010dzVXRVBFaTdBVUo0NGJ0bWhndzFYYnpmb0pRVUVuVlBzc21qeVoKOW5L
ZHlnUjlHV3NQRnZBUUpCcjNwZHBrUGwvMVRMOG9sSkxqNEVEQmtMMGxwbnFOTFplZ2Z2RzlkMVYw
SWNqcwp6SGVVT0ZvOTd1R21KZ2tTSEVmR0s4ZTdJTVFRYXE3emJWb09aSld2NzRTdzZNc1A3bG89
Cj1NOUxsCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============6795287429022467035==--

