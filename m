Content-Type: multipart/mixed; boundary="===============9169146753125463659=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 9ddf3ebd04 [ 0.004000] BUG: scheduling while atomic: swapper/0/0x00000002
Date: Thu, 12 Apr 2018 14:19:56 +0200
Message-ID: <20180412121956.GB4082@hirez.programming.kicks-ass.net>
In-Reply-To: <20180412045706.6tneupzzmux5ucmv@tardis>
List-Id: <oe-lkp.lists.linux.dev>

--===============9169146753125463659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2018 at 12:57:07PM +0800, Boqun Feng wrote:

> So we met this problem because:
> =

> a)	all the lock selftest cases are called with preemption off,
> 	because locking_selftest() is called in start_kernel() with
> 	preemption off. (Note that the preemption off is actually fine
> 	for the selftest because the whole selftest is single-threaded,
> 	so all the acquisitions of locks will succeed in fast path, so
> 	no block. And if we hit a self deadlock, which will trigger a
> 	real block, the lockdep should report it, and we skip to the
> 	next test case with preempt count recoverd)
> =

> and
> =

> b)	we do a schedule() in srcu_ABBA() because we call
> 	synchronize_srcu(), note that SMP=3Dn, so means we hit this for
> 	tiny SRCU. And I don't think we have a similar problem for tree
> 	SRCU.
> =

> So the problem is basically caused by an unconditional
> wait_for_completion() in tiny SRCU, which I think could be fixed by
> adding the rcu_scheduler_state check as the same for tree SRCU, like:
> =

> 	diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
> 	index bc89cb48d800..21f4765ef8ee 100644
> 	--- a/kernel/rcu/srcutiny.c
> 	+++ b/kernel/rcu/srcutiny.c
> 	@@ -190,6 +190,9 @@ void synchronize_srcu(struct srcu_struct *sp)
> 	 =

> 		srcu_lock_sync(&sp->dep_map);
> 	 =

> 	+	if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
> 	+		return;
> 	+
> 		init_rcu_head_on_stack(&rs.head);
> 		init_completion(&rs.completion);
> 		call_srcu(sp, &rs.head, wakeme_after_rcu);
> =

> I think this not only fixes the problem here, but also is the right way
> to do because for tiny SRCU, synchronize_srcu() should be a no-op if
> rcu scheduler is inactive, right?
> =

> Thoughts?

Works for me; and yes the locking primitives as used in the selftest are
not expected to ever actually block (which would result in much the same
splat).

--===============9169146753125463659==--

