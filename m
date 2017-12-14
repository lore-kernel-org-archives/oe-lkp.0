Content-Type: multipart/mixed; boundary="===============5213609002480962645=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: d1fc031747 ("sched/wait: assert the wait_queue_head lock is .."): EIP: __wake_up_common
Date: Thu, 14 Dec 2017 06:12:40 -0800
Message-ID: <20171214141240.GD30288@bombadil.infradead.org>
In-Reply-To: <20171214131037.GD10791@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5213609002480962645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 02:10:37PM +0100, Christoph Hellwig wrote:
> On Thu, Dec 14, 2017 at 04:58:09AM -0800, Matthew Wilcox wrote:
> > Looks pretty clear to me that userfaultfd is also abusing the wake_up_l=
ocked
> > interfaces:
> > =

> >         spin_lock(&ctx->fault_pending_wqh.lock);
> >         __wake_up_locked_key(&ctx->fault_pending_wqh, TASK_NORMAL, &ran=
ge);
> >         __wake_up_locked_key(&ctx->fault_wqh, TASK_NORMAL, &range);
> >         spin_unlock(&ctx->fault_pending_wqh.lock);
> > =

> > Sure, it's locked, but not by the lock you thought it was going to be.
> > =

> > There doesn't actually appear to be a bug here; fault_wqh is always ser=
ialised
> > by fault_pending_wqh.lock, but lockdep can't know that.  I think this p=
atch
> > will solve the problem.
> =

> Or userfaultfd could just always use the waitqueue lock, similar to what
> we are doing in epoll.
> =

> But unless someone care about micro-optimizatations I'm tempted to
> add your patch to the next iteration of the series.

userfaultfd is using the waitqueue lock -- it just has two waitqueues
that it's protecting with the same lock.

If the patch goes through as-is, try this changelog:

[PATCH] userfaultfd: Use fault_wqh lock

userfaultfd was using the fault_pending_wq lock to protect both
fault_pending_wq and fault_wqh.  With Christoph's addition of a lockdep
assert to the wait queue code, that will trigger warnings (although there
is no bug).  Remove the warning by using __wake_up which will take the
fault_wqh lock.  This lock now nests inside the fault_pending_wqh lock,
but that's not a problem since it was entireyl unused before.

Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>

--===============5213609002480962645==--

