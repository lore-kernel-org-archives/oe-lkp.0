Content-Type: multipart/mixed; boundary="===============4398009952144963128=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 11:03:24 +0800
Message-ID: <20190603030324.kl3bckqmebzis2vw@gondor.apana.org.au>
In-Reply-To: <20190603000617.GD28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4398009952144963128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2019 at 05:06:17PM -0700, Paul E. McKenney wrote:
>
> Please note that preemptible Tree RCU has lacked the compiler barrier on
> all but the outermost rcu_read_unlock() for years before Boqun's patch.

Actually this is not true.  Boqun's patch (commit bb73c52bad36) does
not add a barrier() to __rcu_read_lock.  In fact I dug into the git
history and this compiler barrier() has existed in preemptible tree
RCU since the very start in 2009:

: commit f41d911f8c49a5d65c86504c19e8204bb605c4fd
: Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
: Date:   Sat Aug 22 13:56:52 2009 -0700
:
:     rcu: Merge preemptable-RCU functionality into hierarchical RCU
:
: +/*
: + * Tree-preemptable RCU implementation for rcu_read_lock().
: + * Just increment ->rcu_read_lock_nesting, shared state will be updated
: + * if we block.
: + */
: +void __rcu_read_lock(void)
: +{
: +       ACCESS_ONCE(current->rcu_read_lock_nesting)++;
: +       barrier();  /* needed if we ever invoke rcu_read_lock in rcutree.=
c */
: +}
: +EXPORT_SYMBOL_GPL(__rcu_read_lock);

However, you are correct that in the non-preempt tree RCU case,
the compiler barrier in __rcu_read_lock was not always present.
In fact it was added by:

: commit 386afc91144b36b42117b0092893f15bc8798a80
: Author: Linus Torvalds <torvalds@linux-foundation.org>
: Date:   Tue Apr 9 10:48:33 2013 -0700
:
:     spinlocks and preemption points need to be at least compiler barriers

I suspect this is what prompted you to remove it in 2015.

> I do not believe that reverting that patch will help you at all.
> =

> But who knows?  So please point me at the full code body that was being
> debated earlier on this thread.  It will no doubt take me quite a while to
> dig through it, given my being on the road for the next couple of weeks,
> but so it goes.

Please refer to my response to Linus for the code in question.

In any case, I am now even more certain that compiler barriers are
not needed in the code in question.  The reasoning is quite simple.
If you need those compiler barriers then you surely need real memory
barriers.

Vice versa, if real memory barriers are already present thanks to
RCU, then you don't need those compiler barriers.

In fact this calls into question the use of READ_ONCE/WRITE_ONCE in
RCU primitives such as rcu_dereference and rcu_assign_pointer.  IIRC
when RCU was first added to the Linux kernel we did not have compiler
barriers in rcu_dereference and rcu_assign_pointer.  They were added
later on.

As compiler barriers per se are useless, these are surely meant to
be coupled with the memory barriers provided by RCU grace periods
and synchronize_rcu.  But then those real memory barriers would have
compiler barriers too.  So why do we need the compiler barriers in
rcu_dereference and rcu_assign_pointer?

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4398009952144963128==--

