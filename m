Content-Type: multipart/mixed; boundary="===============9002025449209468107=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 13:26:26 +0800
Message-ID: <20190603052626.nz2qktwmkswxfnsd@gondor.apana.org.au>
In-Reply-To: <20190603034707.GG28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9002025449209468107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2019 at 08:47:07PM -0700, Paul E. McKenney wrote:
> =

> 1.	These guarantees are of full memory barriers, -not- compiler
> 	barriers.

What I'm saying is that wherever they are, they must come with
compiler barriers.  I'm not aware of any synchronisation mechanism
in the kernel that gives a memory barrier without a compiler barrier.

> 2.	These rules don't say exactly where these full memory barriers
> 	go.  SRCU is at one extreme, placing those full barriers in
> 	srcu_read_lock() and srcu_read_unlock(), and !PREEMPT Tree RCU
> 	at the other, placing these barriers entirely within the callback
> 	queueing/invocation, grace-period computation, and the scheduler.
> 	Preemptible Tree RCU is in the middle, with rcu_read_unlock()
> 	sometimes including a full memory barrier, but other times with
> 	the full memory barrier being confined as it is with !PREEMPT
> 	Tree RCU.

The rules do say that the (full) memory barrier must precede any
RCU read-side that occur after the synchronize_rcu and after the
end of any RCU read-side that occur before the synchronize_rcu.

All I'm arguing is that wherever that full mb is, as long as it
also carries with it a barrier() (which it must do if it's done
using an existing kernel mb/locking primitive), then we're fine.

> Interleaving and inserting full memory barriers as per the rules above:
> =

> 	CPU1: WRITE_ONCE(a, 1)
> 	CPU1: synchronize_rcu	=

> 	/* Could put a full memory barrier here, but it wouldn't help. */

	CPU1: smp_mb();
	CPU2: smp_mb();

Let's put them in because I think they are critical.  smp_mb() also
carries with it a barrier().

> 	CPU2: rcu_read_lock();
> 	CPU1: b =3D 2;	=

> 	CPU2: if (READ_ONCE(a) =3D=3D 0)
> 	CPU2:         if (b !=3D 1)  /* Weakly ordered CPU moved this up! */
> 	CPU2:                 b =3D 1;
> 	CPU2: rcu_read_unlock
> =

> In fact, CPU2's load from b might be moved up to race with CPU1's store,
> which (I believe) is why the model complains in this case.

Let's put aside my doubt over how we're even allowing a compiler
to turn

	b =3D 1

into

	if (b !=3D 1)
		b =3D 1

Since you seem to be assuming that (a =3D=3D 0) is true in this case
(as the assignment b =3D 1 is carried out), then because of the
presence of the full memory barrier, the RCU read-side section
must have started prior to the synchronize_rcu.  This means that
synchronize_rcu is not allowed to return until at least the end
of the grace period, or at least until the end of rcu_read_unlock.

So it actually should be:

	CPU1: WRITE_ONCE(a, 1)
	CPU1: synchronize_rcu called
	/* Could put a full memory barrier here, but it wouldn't help. */

	CPU1: smp_mb();
	CPU2: smp_mb();

	CPU2: grace period starts
	...time passes...
	CPU2: rcu_read_lock();
	CPU2: if (READ_ONCE(a) =3D=3D 0)
	CPU2:         if (b !=3D 1)  /* Weakly ordered CPU moved this up! */
	CPU2:                 b =3D 1;
	CPU2: rcu_read_unlock
	...time passes...
	CPU2: grace period ends

	/* This full memory barrier is also guaranteed by RCU. */
	CPU2: smp_mb();

	CPU1 synchronize_rcu returns
	CPU1: b =3D 2;	=


Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============9002025449209468107==--

