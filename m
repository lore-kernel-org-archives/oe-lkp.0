Content-Type: multipart/mixed; boundary="===============2694076607327674058=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm] c8c06efa8b5: -7.6% unixbench.score
Date: Thu, 08 Jan 2015 11:37:08 +0100
Message-ID: <20150108103708.GE29390@twins.programming.kicks-ass.net>
In-Reply-To: <1420707599.12346.14.camel@stgolabs.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2694076607327674058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 12:59:59AM -0800, Davidlohr Bueso wrote:
> > > >     721721 =C2=B1  1%    +303.6%    2913110 =C2=B1  3%  unixbench.t=
ime.voluntary_context_switches
> > > >      11767 =C2=B1  0%      -7.6%      10867 =C2=B1  1%  unixbench.s=
core

> heh I was actually looking at the reader code. We really do:
> =

> 	/* wait until we successfully acquire the lock */
> 	set_current_state(TASK_UNINTERRUPTIBLE);
> 	while (true) {
> 		if (rwsem_try_write_lock(count, sem))
> 			break;
> 		raw_spin_unlock_irq(&sem->wait_lock);
> =

> 		/* Block until there are no active lockers. */
> 		do {
> 			schedule();
> 			set_current_state(TASK_UNINTERRUPTIBLE);
> 		} while ((count =3D sem->count) & RWSEM_ACTIVE_MASK);
> =

> 		raw_spin_lock_irq(&sem->wait_lock);
> 	}
> =

> =

> Which still has similar issues with even two barriers, I guess for both
> the rwsem_try_write_lock call (less severe) and count checks. Anyway...

So its actually scheduling a lot more, this could also mean the opt
spinning thing isn't working as well (I've no real idea what the
workload is).

One thing I noticed is that we set sem->owner very late in comparison
with the mutex code, this could cause us to break out of the spin loop
prematurely.

--===============2694076607327674058==--

