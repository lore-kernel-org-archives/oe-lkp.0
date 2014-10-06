Content-Type: multipart/mixed; boundary="===============8901185763825788470=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Mon, 06 Oct 2014 10:59:46 +0000
Message-ID: <20141006105940.GY5015@linux.vnet.ibm.com>
In-Reply-To: <20141006091915.GC6758@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8901185763825788470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2014 at 11:19:15AM +0200, Peter Zijlstra wrote:
> On Mon, Oct 06, 2014 at 02:25:09AM +0200, Oleg Nesterov wrote:
> > Yes, and the comments ;)
> > =

> > I showed this patch only to complete the discussion, I am not going to
> > send it now.
> =

> Fair enough :-)
> =

> > But thanks for the review!
> > =

> > > > +static void kthread_kill(struct task_struct *k, struct kthread *kt=
hread)
> > > > +{
> > > > +	smp_mb__before_atomic();
> > >
> > > test_bit isn't actually an atomic op so this barrier is 'wrong'. If y=
ou
> > > need an MB there smp_mb() it is.
> > =

> > Hmm. I specially checked Documentation/memory-barriers.txt,
> > =

> >  (*) smp_mb__before_atomic();
> >  (*) smp_mb__after_atomic();
> > =

> >      These are for use with atomic (such as add, subtract, increment and
> >      decrement) functions that don't return a value, especially when us=
ed for
> >      reference counting.  These functions do not imply memory barriers.
> > =

> >      These are also used for atomic bitop functions that do not return a
> >      value (such as set_bit and clear_bit).
> >                     ^^^^^^^^^^^^^^^^^^^^^
> > =

> > Either you or memory-barriers.txt should be fixed ;)
> =

> Its in there, just not explicitly. All those functions listed are
> read-modify-write ops, test_bit() is not, its just a read. But yes I
> suppose we could make that more explicit.
> =

> Also test_bit() obviously does return a value, so it doesn't fall in the
> {set,clear}_bit() class.
> =

> Does the change below clarify things?
> =

> > > > +	if (test_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags)) {
> > > > +		unsigned long flags;
> > > > +		bool kill =3D true;
> > > > +
> > > > +		if (lock_task_sighand(k, &flags)) {
> > >
> > > Since we do the double test thing here, with the set side also done
> > > under the lock, so we really need a barrier above?
> > =

> > Yes, otherwise set_kthread_wants_signal() can miss a signal. And note
> > that the 2nd check is only needed to ensure that we can not race
> > with set_kthread_wants_signal(false).
> > =

> > BUT!!! I have to admit that I simply do not know if there is any arch
> > =

> > 	set_bit(&word, X);
> > 	test_bit(&word, Y);
> > =

> > which actually needs mb() in between, the word is the same. Probably
> > not.
> =

> DEC Alpha? Wasn't it the problem there that dependencies didn't actually
> work as expected?

This looks to me to be an issue of cache coherence rather than
dependency ordering, so I would expect that DEC Alpha would respect
the ordering.

							Thanx, Paul

> Added Paul to Cc.
> =

> ---
>  Documentation/memory-barriers.txt | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> =

> diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-bar=
riers.txt
> index 22a969cdd476..0d97c99ad957 100644
> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -1594,12 +1594,9 @@ CPU from reordering them.
>   (*) smp_mb__before_atomic();
>   (*) smp_mb__after_atomic();
> =

> -     These are for use with atomic (such as add, subtract, increment and
> -     decrement) functions that don't return a value, especially when use=
d for
> -     reference counting.  These functions do not imply memory barriers.
> -
> -     These are also used for atomic bitop functions that do not return a
> -     value (such as set_bit and clear_bit).
> +     These are for use with atomic/bitop (r-m-w) functions that don't re=
turn
> +     a value (eg. atomic_{add,sub,inc,dec}(), {set,clear}_bit()). These
> +     functions do not imply memory barriers.
> =

>       As an example, consider a piece of code that marks an object as bei=
ng dead
>       and then decrements the object's reference count:
> =



--===============8901185763825788470==--

