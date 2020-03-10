Content-Type: multipart/mixed; boundary="===============6538913940684568873=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 10 Mar 2020 13:27:55 -0400
Message-ID: <36c58a6d07b67aac751fca27a4938dc1759d9267.camel@kernel.org>
In-Reply-To: <923487db2c9396c79f8e8dd4f846b2b1762635c8.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6538913940684568873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-10 at 08:52 -0400, Jeff Layton wrote:

[snip]

> On Tue, 2020-03-10 at 11:24 +0800, yangerkun wrote:
> > > =

> > Something others. I think there is no need to call locks_delete_block =

> > for all case in function like flock_lock_inode_wait. What we should do =

> > as the patch '16306a61d3b7 ("fs/locks: always delete_block after =

> > waiting.")' describes is that we need call locks_delete_block not only =

> > for error equal to -ERESTARTSYS(please point out if I am wrong). And =

> > this patch may fix the regression too since simple lock that success or =

> > unlock will not try to acquire blocked_lock_lock.
> > =

> > =

> =

> Nice! This looks like it would work too, and it's a simpler fix.
> =

> I'd be inclined to add a WARN_ON_ONCE(fl->fl_blocker) after the if
> statements to make sure we never exit with one still queued. Also, I
> think we can do a similar optimization in __break_lease.
> =

> There are some other callers of locks_delete_block:
> =

> cifs_posix_lock_set: already only calls it in these cases
> =

> nlmsvc_unlink_block: I think we need to call this in most cases, and
> they're not going to be high-performance codepaths in general
> =

> nfsd4 callback handling: Several calls here, most need to always be
> called. find_blocked_lock could be reworked to take the
> blocked_lock_lock only once (I'll do that in a separate patch).
> =

> How about something like this (
> =

> ----------------------8<---------------------
> =

> From: yangerkun <yangerkun@huawei.com>
> =

> [PATCH] filelock: fix regression in unlock performance
> =

> '6d390e4b5d48 ("locks: fix a potential use-after-free problem when
> wakeup a waiter")' introduces a regression since we will acquire
> blocked_lock_lock every time locks_delete_block is called.
> =

> In many cases we can just avoid calling locks_delete_block at all,
> when we know that the wait was awoken by the condition becoming true.
> Change several callers of locks_delete_block to only call it when
> waking up due to signal or other error condition.
> =

> [ jlayton: add similar optimization to __break_lease, reword changelog,
> 	   add WARN_ON_ONCE calls ]
> =

> Fixes: 16306a61d3b7 ("fs/locks: always delete_block after waiting.")
> Fixes: 6d390e4b5d48 ("locks: fix a potential use-after-free problem when =
wakeup a waiter")
> Signed-off-by: yangerkun <yangerkun@huawei.com>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/locks.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> =

> diff --git a/fs/locks.c b/fs/locks.c
> index 426b55d333d5..b88a5b11c464 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -1354,7 +1354,10 @@ static int posix_lock_inode_wait(struct inode *ino=
de, struct file_lock *fl)
>  		if (error)
>  			break;
>  	}
> -	locks_delete_block(fl);
> +	if (error)
> +		locks_delete_block(fl);
> +	WARN_ON_ONCE(fl->fl_blocker);
> +
>  	return error;
>  }
>  =

> @@ -1447,7 +1450,9 @@ int locks_mandatory_area(struct inode *inode, struc=
t file *filp, loff_t start,
>  =

>  		break;
>  	}
> -	locks_delete_block(&fl);
> +	if (error)
> +		locks_delete_block(&fl);
> +	WARN_ON_ONCE(fl.fl_blocker);
>  =

>  	return error;
>  }
> @@ -1638,23 +1643,28 @@ int __break_lease(struct inode *inode, unsigned i=
nt mode, unsigned int type)
>  =

>  	locks_dispose_list(&dispose);
>  	error =3D wait_event_interruptible_timeout(new_fl->fl_wait,
> -						!new_fl->fl_blocker, break_time);
> +						 !new_fl->fl_blocker,
> +						 break_time);
>  =

>  	percpu_down_read(&file_rwsem);
>  	spin_lock(&ctx->flc_lock);
>  	trace_break_lease_unblock(inode, new_fl);
> -	locks_delete_block(new_fl);
>  	if (error >=3D 0) {
>  		/*
>  		 * Wait for the next conflicting lease that has not been
>  		 * broken yet
>  		 */
> -		if (error =3D=3D 0)
> +		if (error =3D=3D 0) {
> +			locks_delete_block(new_fl);
>  			time_out_leases(inode, &dispose);
> +		}
>  		if (any_leases_conflict(inode, new_fl))
>  			goto restart;
>  		error =3D 0;
> +	} else {
> +		locks_delete_block(new_fl);
>  	}
> +	WARN_ON_ONCE(fl->fl_blocker);
>  out:
>  	spin_unlock(&ctx->flc_lock);
>  	percpu_up_read(&file_rwsem);
> @@ -2126,7 +2136,10 @@ static int flock_lock_inode_wait(struct inode *ino=
de, struct file_lock *fl)
>  		if (error)
>  			break;
>  	}
> -	locks_delete_block(fl);
> +	if (error)
> +		locks_delete_block(fl);
> +	WARN_ON_ONCE(fl->fl_blocker);
> +
>  	return error;
>  }
>  =

> @@ -2403,7 +2416,9 @@ static int do_lock_file_wait(struct file *filp, uns=
igned int cmd,
>  		if (error)
>  			break;
>  	}
> -	locks_delete_block(fl);
> +	if (error)
> +		locks_delete_block(fl);
> +	WARN_ON_ONCE(fl->fl_blocker);
>  =

>  	return error;
>  }

I've gone ahead and added the above patch to linux-next. Linus, Neil,
are you ok with this one? I think this is probably the simplest
approach.

Assuming so and that this tests out OK, I'll a PR in a few days, after
it has had a bit of soak time in next.

Thanks for the effort everyone! =

-- =

Jeff Layton <jlayton@kernel.org>

--===============6538913940684568873==--

