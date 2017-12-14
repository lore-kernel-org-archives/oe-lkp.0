Content-Type: multipart/mixed; boundary="===============1589201828578872258=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: d1fc031747 ("sched/wait: assert the wait_queue_head lock is .."): EIP: __wake_up_common
Date: Thu, 14 Dec 2017 05:05:18 -0800
Message-ID: <20171214130518.GC30288@bombadil.infradead.org>
In-Reply-To: <20171214125809.GB30288@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1589201828578872258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Argh, forgot to cc the userfaultfd people.  Sorry.

On Thu, Dec 14, 2017 at 04:58:09AM -0800, Matthew Wilcox wrote:
> On Wed, Dec 13, 2017 at 05:03:00PM -0800, Andrew Morton wrote:
> > >     sched/wait: assert the wait_queue_head lock is held in __wake_up_=
common
> > >     =

> > >     Better ensure we actually hold the lock using lockdep than just c=
ommenting
> > >     on it.  Due to the various exported _locked interfaces it is far =
too easy
> > >     to get the locking wrong.
> > =

> > I'm probably sitting on an older version.  I've dropped
> > =

> > epoll: use the waitqueue lock to protect ep->wq
> > sched/wait: assert the wait_queue_head lock is held in __wake_up_common
> =

> Looks pretty clear to me that userfaultfd is also abusing the wake_up_loc=
ked
> interfaces:
> =

>         spin_lock(&ctx->fault_pending_wqh.lock);
>         __wake_up_locked_key(&ctx->fault_pending_wqh, TASK_NORMAL, &range=
);
>         __wake_up_locked_key(&ctx->fault_wqh, TASK_NORMAL, &range);
>         spin_unlock(&ctx->fault_pending_wqh.lock);
> =

> Sure, it's locked, but not by the lock you thought it was going to be.
> =

> There doesn't actually appear to be a bug here; fault_wqh is always seria=
lised
> by fault_pending_wqh.lock, but lockdep can't know that.  I think this pat=
ch
> will solve the problem.
> =

> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index ac9a4e65ca49..a39bc3237b68 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -879,7 +879,7 @@ static int userfaultfd_release(struct inode *inode, s=
truct file *file)
>  	 */
>  	spin_lock(&ctx->fault_pending_wqh.lock);
>  	__wake_up_locked_key(&ctx->fault_pending_wqh, TASK_NORMAL, &range);
> -	__wake_up_locked_key(&ctx->fault_wqh, TASK_NORMAL, &range);
> +	__wake_up(&ctx->fault_wqh, TASK_NORMAL, 1, &range);
>  	spin_unlock(&ctx->fault_pending_wqh.lock);
>  =

>  	/* Flush pending events that may still wait on event_wqh */
> @@ -1045,7 +1045,7 @@ static ssize_t userfaultfd_ctx_read(struct userfaul=
tfd_ctx *ctx, int no_wait,
>  			 * anyway.
>  			 */
>  			list_del(&uwq->wq.entry);
> -			__add_wait_queue(&ctx->fault_wqh, &uwq->wq);
> +			add_wait_queue(&ctx->fault_wqh, &uwq->wq);
>  =

>  			write_seqcount_end(&ctx->refile_seq);
>  =

> @@ -1194,7 +1194,7 @@ static void __wake_userfault(struct userfaultfd_ctx=
 *ctx,
>  		__wake_up_locked_key(&ctx->fault_pending_wqh, TASK_NORMAL,
>  				     range);
>  	if (waitqueue_active(&ctx->fault_wqh))
> -		__wake_up_locked_key(&ctx->fault_wqh, TASK_NORMAL, range);
> +		__wake_up(&ctx->fault_wqh, TASK_NORMAL, 1, range);
>  	spin_unlock(&ctx->fault_pending_wqh.lock);
>  }
>  =

> =

> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo(a)kvack.org.  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=3Dmailto:"dont@kvack.org"> email(a)kvack.org </a>

--===============1589201828578872258==--

