Content-Type: multipart/mixed; boundary="===============6005378721691090715=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Wed, 18 Mar 2020 13:12:14 +0800
Message-ID: <20200318051214.GL11705@shao2-debian>
In-Reply-To: <ce48ed9e48eda3c0f27d2f417314bd00cb1a68db.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6005378721691090715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 07:07:24AM -0400, Jeff Layton wrote:
> On Mon, 2020-03-16 at 16:06 +1100, NeilBrown wrote:
> =

> [...]
> =

> > No, we really do need fl_blocked_requests to be empty.
> > After fl_blocker is cleared, the owner might check for other blockers
> > and might queue behind them leaving the blocked requests in place.
> > Or it might have to detach all those blocked requests and wake them up
> > so they can go and fend for themselves.
> > =

> > I think the worse-case scenario could go something like that.
> > Process A get a lock - Al
> > Process B tries to get a conflicting lock and blocks Bl -> Al
> > Process C tries to get a conflicting lock and blocks on B:
> >    Cl -> Bl -> Al
> > =

> > At much the same time that C goes to attach Cl to Bl, A
> > calls unlock and B get signaled.
> > =

> > So A is calling locks_wake_up_blocks(Al) - which takes blocked_lock_loc=
k.
> > C is calling  locks_insert_block(Bl, Cl) - which also takes the lock
> > B is calling  locks_delete_block(Bl)  which might not take the lock.
> > =

> > Assume C gets the lock first.
> > =

> > Before C calls locks_insert_block, Bl->fl_blocked_requests is empty.
> > After A finishes in locks_wake_up_blocks, Bl->fl_blocker is NULL
> > =

> > If B sees that fl_blocker is NULL, we need it to see that
> > fl_blocked_requests is no longer empty, so that it takes the lock and
> > cleans up fl_blocked_requests.
> > =

> > If the list_empty test on fl_blocked_request goes after the fl_blocker
> > test, the memory barriers we have should assure that.  I had thought
> > that it would need an extra barrier, but as a spinlock places the change
> > to fl_blocked_requests *before* the change to fl_blocker, I no longer
> > think that is needed.
> =

> Got it. I was thinking all of the waiters of a blocker would already be
> awoken once fl_blocker was set to NULL, but you're correct and they
> aren't. How about this?

Hi,

We tested the patch and confirmed it can fix the regression:

commit:
  0a68ff5e2e ("fcntl: Distribute switch variables for initialization")
  6d390e4b5d ("locks: fix a potential use-after-free problem when wakeup a =
waiter")
  3063690b0e ("locks: reinstate locks_delete_block optimization")

0a68ff5e2e7cf226  6d390e4b5d48ec03bb87e63cf0  3063690b0ef0089115914f366a  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
         %stddev      change         %stddev      change         %stddev
             \          |                \          |                \  =

     66597 =C2=B1  3%       -97%       2260                       67062    =
    will-it-scale/performance-process-100%-lock1-ucode=3D0x11/lkp-knm01
     66597             -97%       2260                       67062        G=
EO-MEAN will-it-scale.per_process_ops

Best Regards,
Rong Chen

> =

> -----------------8<------------------
> =

> From f40e865842ae84a9d465ca9edb66f0985c1587d4 Mon Sep 17 00:00:00 2001
> From: Linus Torvalds <torvalds@linux-foundation.org>
> Date: Mon, 9 Mar 2020 14:35:43 -0400
> Subject: [PATCH] locks: reinstate locks_delete_block optimization
> =

> There is measurable performance impact in some synthetic tests due to
> commit 6d390e4b5d48 (locks: fix a potential use-after-free problem when
> wakeup a waiter). Fix the race condition instead by clearing the
> fl_blocker pointer after the wake_up, using explicit acquire/release
> semantics.
> =

> This does mean that we can no longer use the clearing of fl_blocker as
> the wait condition, so switch the waiters over to checking whether the
> fl_blocked_member list_head is empty.
> =

> Cc: yangerkun <yangerkun@huawei.com>
> Cc: NeilBrown <neilb@suse.de>
> Fixes: 6d390e4b5d48 (locks: fix a potential use-after-free problem when w=
akeup a waiter)
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/cifs/file.c |  3 ++-
>  fs/locks.c     | 41 +++++++++++++++++++++++++++++++++++------
>  2 files changed, 37 insertions(+), 7 deletions(-)
> =

> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 3b942ecdd4be..8f9d849a0012 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -1169,7 +1169,8 @@ cifs_posix_lock_set(struct file *file, struct file_=
lock *flock)
>  	rc =3D posix_lock_file(file, flock, NULL);
>  	up_write(&cinode->lock_sem);
>  	if (rc =3D=3D FILE_LOCK_DEFERRED) {
> -		rc =3D wait_event_interruptible(flock->fl_wait, !flock->fl_blocker);
> +		rc =3D wait_event_interruptible(flock->fl_wait,
> +					list_empty(&flock->fl_blocked_member));
>  		if (!rc)
>  			goto try_again;
>  		locks_delete_block(flock);
> diff --git a/fs/locks.c b/fs/locks.c
> index 426b55d333d5..eaf754ecdaa8 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -725,7 +725,6 @@ static void __locks_delete_block(struct file_lock *wa=
iter)
>  {
>  	locks_delete_global_blocked(waiter);
>  	list_del_init(&waiter->fl_blocked_member);
> -	waiter->fl_blocker =3D NULL;
>  }
>  =

>  static void __locks_wake_up_blocks(struct file_lock *blocker)
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
> +	 */
> +	smp_store_release(&waiter->fl_blocker, NULL);
>  	spin_unlock(&blocked_lock_lock);
>  	return status;
>  }
> @@ -1350,7 +1374,8 @@ static int posix_lock_inode_wait(struct inode *inod=
e, struct file_lock *fl)
>  		error =3D posix_lock_inode(inode, fl, NULL);
>  		if (error !=3D FILE_LOCK_DEFERRED)
>  			break;
> -		error =3D wait_event_interruptible(fl->fl_wait, !fl->fl_blocker);
> +		error =3D wait_event_interruptible(fl->fl_wait,
> +					list_empty(&fl->fl_blocked_member));
>  		if (error)
>  			break;
>  	}
> @@ -1435,7 +1460,8 @@ int locks_mandatory_area(struct inode *inode, struc=
t file *filp, loff_t start,
>  		error =3D posix_lock_inode(inode, &fl, NULL);
>  		if (error !=3D FILE_LOCK_DEFERRED)
>  			break;
> -		error =3D wait_event_interruptible(fl.fl_wait, !fl.fl_blocker);
> +		error =3D wait_event_interruptible(fl.fl_wait,
> +					list_empty(&fl.fl_blocked_member));
>  		if (!error) {
>  			/*
>  			 * If we've been sleeping someone might have
> @@ -1638,7 +1664,8 @@ int __break_lease(struct inode *inode, unsigned int=
 mode, unsigned int type)
>  =

>  	locks_dispose_list(&dispose);
>  	error =3D wait_event_interruptible_timeout(new_fl->fl_wait,
> -						!new_fl->fl_blocker, break_time);
> +					list_empty(&new_fl->fl_blocked_member),
> +					break_time);
>  =

>  	percpu_down_read(&file_rwsem);
>  	spin_lock(&ctx->flc_lock);
> @@ -2122,7 +2149,8 @@ static int flock_lock_inode_wait(struct inode *inod=
e, struct file_lock *fl)
>  		error =3D flock_lock_inode(inode, fl);
>  		if (error !=3D FILE_LOCK_DEFERRED)
>  			break;
> -		error =3D wait_event_interruptible(fl->fl_wait, !fl->fl_blocker);
> +		error =3D wait_event_interruptible(fl->fl_wait,
> +				list_empty(&fl->fl_blocked_member));
>  		if (error)
>  			break;
>  	}
> @@ -2399,7 +2427,8 @@ static int do_lock_file_wait(struct file *filp, uns=
igned int cmd,
>  		error =3D vfs_lock_file(filp, cmd, fl, NULL);
>  		if (error !=3D FILE_LOCK_DEFERRED)
>  			break;
> -		error =3D wait_event_interruptible(fl->fl_wait, !fl->fl_blocker);
> +		error =3D wait_event_interruptible(fl->fl_wait,
> +					list_empty(&fl->fl_blocked_member));
>  		if (error)
>  			break;
>  	}
> -- =

> 2.24.1
> =



--===============6005378721691090715==--

