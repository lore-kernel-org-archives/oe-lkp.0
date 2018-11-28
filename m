Content-Type: multipart/mixed; boundary="===============0965566382185439017=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] locks: fix performance regressions.
Date: Wed, 28 Nov 2018 06:37:05 -0500
Message-ID: <9bba46b3f9b67a3a52c3a1f22caa9cd7cdabfca7.camel@redhat.com>
In-Reply-To: <87k1kyowdf.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============0965566382185439017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-11-28 at 11:53 +1100, NeilBrown wrote:
> The kernel test robot reported two performance regressions
> caused by recent patches.
> Both appear to related to the global spinlock blocked_lock_lock
> being taken more often.
> =

> This patch avoids taking that lock in the cases tested.
> =

> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: NeilBrown <neilb@suse.com>
> ---
> =

> Hi Jeff,
>  you might like to merge these back into the patches that introduced
>  the problem.
>  Or you might like me to re-send the series with these merged in,
>  in which case, please ask.
> =


Thanks Neil,

This looks great. I'll go ahead and toss this patch on top of the pile
in linux-next for now.

Would you mind resending the series with this patch merged in? I took a
quick stab at squashing it into the earlier patch, but there is some
churn in this area.

Maybe you can also turn that Reported-by: into a Tested-by: in the
changelog afterward?

> And a BIG thank-you to the kernel-test-robot team!!
> =


Absolutely! We love you guys!

> Thanks,
> NeilBrown
> =

>  fs/locks.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> =

> diff --git a/fs/locks.c b/fs/locks.c
> index f456cd3d9d50..67519a43e27a 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -444,6 +444,13 @@ static void locks_move_blocks(struct file_lock *new,=
 struct file_lock *fl)
>  {
>  	struct file_lock *f;
>  =

> +	/*
> +	 * As ctx->flc_lock is held, new requests cannot be added to
> +	 * ->fl_blocked_requests, so we don't need a lock to check if it
> +	 * is empty.
> +	 */
> +	if (list_empty(&fl->fl_blocked_requests))
> +		return;
>  	spin_lock(&blocked_lock_lock);
>  	list_splice_init(&fl->fl_blocked_requests, &new->fl_blocked_requests);
>  	list_for_each_entry(f, &fl->fl_blocked_requests, fl_blocked_member)
> @@ -749,6 +756,20 @@ int locks_delete_block(struct file_lock *waiter)
>  {
>  	int status =3D -ENOENT;
>  =

> +	/*
> +	 * If fl_blocker is NULL, it won't be set again as this thread
> +	 * "owns" the lock and is the only one that might try to claim
> +	 * the lock.  So it is safe to test fl_blocker locklessly.
> +	 * Also if fl_blocker is NULL, this waiter is not listed on
> +	 * fl_blocked_requests for some lock, so no other request can
> +	 * be added to the list of fl_blocked_requests for this
> +	 * request.  So if fl_blocker is NULL, it is safe to
> +	 * locklessly check if fl_blocked_requests is empty.  If both
> +	 * of these checks succeed, there is no need to take the lock.
> +	 */
> +	if (waiter->fl_blocker =3D=3D NULL &&
> +	    list_empty(&waiter->fl_blocked_requests))
> +		return status;
>  	spin_lock(&blocked_lock_lock);
>  	if (waiter->fl_blocker)
>  		status =3D 0;

-- =

Jeff Layton <jlayton@redhat.com>


--===============0965566382185439017==--

