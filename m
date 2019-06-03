Content-Type: multipart/mixed; boundary="===============0357996874792744654=="
MIME-Version: 1.0
From: Boqun Feng <boqun.feng@gmail.com>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 14:42:00 +0800
Message-ID: <20190603064200.GA11024@tardis>
In-Reply-To: <20190603052626.nz2qktwmkswxfnsd@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============0357996874792744654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 01:26:26PM +0800, Herbert Xu wrote:
> On Sun, Jun 02, 2019 at 08:47:07PM -0700, Paul E. McKenney wrote:
> > =

> > 1.	These guarantees are of full memory barriers, -not- compiler
> > 	barriers.
> =

> What I'm saying is that wherever they are, they must come with
> compiler barriers.  I'm not aware of any synchronisation mechanism
> in the kernel that gives a memory barrier without a compiler barrier.
> =

> > 2.	These rules don't say exactly where these full memory barriers
> > 	go.  SRCU is at one extreme, placing those full barriers in
> > 	srcu_read_lock() and srcu_read_unlock(), and !PREEMPT Tree RCU
> > 	at the other, placing these barriers entirely within the callback
> > 	queueing/invocation, grace-period computation, and the scheduler.
> > 	Preemptible Tree RCU is in the middle, with rcu_read_unlock()
> > 	sometimes including a full memory barrier, but other times with
> > 	the full memory barrier being confined as it is with !PREEMPT
> > 	Tree RCU.
> =

> The rules do say that the (full) memory barrier must precede any
> RCU read-side that occur after the synchronize_rcu and after the
> end of any RCU read-side that occur before the synchronize_rcu.
> =

> All I'm arguing is that wherever that full mb is, as long as it
> also carries with it a barrier() (which it must do if it's done
> using an existing kernel mb/locking primitive), then we're fine.
> =

> > Interleaving and inserting full memory barriers as per the rules above:
> > =

> > 	CPU1: WRITE_ONCE(a, 1)
> > 	CPU1: synchronize_rcu	=

> > 	/* Could put a full memory barrier here, but it wouldn't help. */
> =

> 	CPU1: smp_mb();
> 	CPU2: smp_mb();
> =

> Let's put them in because I think they are critical.  smp_mb() also
> carries with it a barrier().
> =

> > 	CPU2: rcu_read_lock();
> > 	CPU1: b =3D 2;	=

> > 	CPU2: if (READ_ONCE(a) =3D=3D 0)
> > 	CPU2:         if (b !=3D 1)  /* Weakly ordered CPU moved this up! */
> > 	CPU2:                 b =3D 1;
> > 	CPU2: rcu_read_unlock
> > =

> > In fact, CPU2's load from b might be moved up to race with CPU1's store,
> > which (I believe) is why the model complains in this case.
> =

> Let's put aside my doubt over how we're even allowing a compiler
> to turn
> =

> 	b =3D 1
> =

> into
> =

> 	if (b !=3D 1)
> 		b =3D 1
> =

> Since you seem to be assuming that (a =3D=3D 0) is true in this case

I think Paul's example assuming (a =3D=3D 0) is false, and maybe
speculative writes (by compilers) needs to added into consideration?
Please consider the following case (I add a few smp_mb()s), the case may
be a little bit crasy, you have been warned ;-)

 	CPU1: WRITE_ONCE(a, 1)
 	CPU1: synchronize_rcu called

 	CPU1: smp_mb(); /* let assume there is one here */

 	CPU2: rcu_read_lock();
 	CPU2: smp_mb(); /* let assume there is one here */

	/* "if (b !=3D 1) b =3D 1" reordered  */
 	CPU2: r0 =3D b;       /* if (b !=3D 1) reordered here, r0 =3D=3D 0 */
 	CPU2: if (r0 !=3D 1)  /* true */
	CPU2:     b =3D 1;    /* b =3D=3D 1 now, this is a speculative write
	                       by compiler
			     */

	CPU1: b =3D 2;        /* b =3D=3D 2 */

 	CPU2: if (READ_ONCE(a) =3D=3D 0) /* false */
	CPU2: ...
	CPU2  else                   /* undo the speculative write */
	CPU2:	  b =3D r0;   /* b =3D=3D 0 */

 	CPU2: smp_mb();
	CPU2: read_read_unlock();

I know this is too crasy for us to think a compiler like this, but this
might be the reason why the model complain about this.

Paul, did I get this right? Or you mean something else?

Regards,
Boqun



> (as the assignment b =3D 1 is carried out), then because of the
> presence of the full memory barrier, the RCU read-side section
> must have started prior to the synchronize_rcu.  This means that
> synchronize_rcu is not allowed to return until at least the end
> of the grace period, or at least until the end of rcu_read_unlock.
> =

> So it actually should be:
> =

> 	CPU1: WRITE_ONCE(a, 1)
> 	CPU1: synchronize_rcu called
> 	/* Could put a full memory barrier here, but it wouldn't help. */
> =

> 	CPU1: smp_mb();
> 	CPU2: smp_mb();
> =

> 	CPU2: grace period starts
> 	...time passes...
> 	CPU2: rcu_read_lock();
> 	CPU2: if (READ_ONCE(a) =3D=3D 0)
> 	CPU2:         if (b !=3D 1)  /* Weakly ordered CPU moved this up! */
> 	CPU2:                 b =3D 1;
> 	CPU2: rcu_read_unlock
> 	...time passes...
> 	CPU2: grace period ends
> =

> 	/* This full memory barrier is also guaranteed by RCU. */
> 	CPU2: smp_mb();
> =

> 	CPU1 synchronize_rcu returns
> 	CPU1: b =3D 2;	=

> =

> Cheers,
> -- =

> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============0357996874792744654==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVqNUlvc1FUUHo4
WFUxd1JIU1hub3c3VUgrcmdGQWx6MHdUVUFDZ2tRU1hub3c3VUgKK3JobFVRZi9mT1dZdDJzYXdY
bG9NZzlTS0VGQTA4ZG90NkdXeDdNWFl6cFlRSVgxWnA4UnhjQUxDVlZXUDBDRApyQmV4bjZKRk45
OVZEaE1ZVTQ4ZjJaUnM2ZGswWUFIQVZKcHFuQVhCSkRCQVJkeHdiVmlCOEdkRC9zZXUrM2hDCkhC
RmVPWFpWdHF3MzAzbFp0RjJHaWE4KzFNMDFYd3VSM1lWL0JCOFRTc0Q3RllaUE1ReDFOSUJ0UUoy
SXJISUYKRzU4cXNiQjcrNEg3TExDSkNqU2IrbVV5ZWt0NUhHWmd1aFpMK2liM2tiUHNFWTB5b1o5
UzNocXFRMTRPVFBGRwp5eWVyUDBSWE1LYmhxTkVKeE5ua3VzSVlpaWF5YndNYkxZSStyL216WmtF
Y1RFekdmZVJxZW9OSHpzSktKcjgyCnZUU1k0NUhBdFJqaGphc2JpM2c5SGNLYldob0Y1Zz09Cj1s
MlM5Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0357996874792744654==--

