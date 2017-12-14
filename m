Content-Type: multipart/mixed; boundary="===============0184247200085284238=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: d1fc031747 ("sched/wait: assert the wait_queue_head lock is .."): EIP: __wake_up_common
Date: Thu, 14 Dec 2017 14:10:37 +0100
Message-ID: <20171214131037.GD10791@lst.de>
In-Reply-To: <20171214125809.GB30288@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0184247200085284238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

Or userfaultfd could just always use the waitqueue lock, similar to what
we are doing in epoll.

But unless someone care about micro-optimizatations I'm tempted to
add your patch to the next iteration of the series.

--===============0184247200085284238==--

