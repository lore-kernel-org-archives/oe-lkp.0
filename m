Content-Type: multipart/mixed; boundary="===============4373717904844863453=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: rcu_read_lock lost its compiler barrier
Date: Sun, 02 Jun 2019 13:56:07 +0800
Message-ID: <20190602055607.bk5vgmwjvvt4wejd@gondor.apana.org.au>
In-Reply-To: <20150921204327.GH4029@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4373717904844863453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Digging up an old email because I was not aware of this previously
but Paul pointed me to it during another discussion.

On Mon, Sep 21, 2015 at 01:43:27PM -0700, Paul E. McKenney wrote:
> On Mon, Sep 21, 2015 at 09:30:49PM +0200, Frederic Weisbecker wrote:
>
> > > diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> > > index d63bb77..6c3cece 100644
> > > --- a/include/linux/rcupdate.h
> > > +++ b/include/linux/rcupdate.h
> > > @@ -297,12 +297,14 @@ void synchronize_rcu(void);
> > >  =

> > >  static inline void __rcu_read_lock(void)
> > >  {
> > > -	preempt_disable();
> > > +	if (IS_ENABLED(CONFIG_PREEMPT_COUNT))
> > > +		preempt_disable();
> > =

> > preempt_disable() is a no-op when !CONFIG_PREEMPT_COUNT, right?
> > Or rather it's a barrier(), which is anyway implied by rcu_read_lock().
> > =

> > So perhaps we can get rid of the IS_ENABLED() check?
> =

> Actually, barrier() is not intended to be implied by rcu_read_lock().
> In a non-preemptible RCU implementation, it doesn't help anything
> to have the compiler flush its temporaries upon rcu_read_lock()
> and rcu_read_unlock().

This is seriously broken.  RCU has been around for years and is
used throughout the kernel while the compiler barrier existed.

You can't then go and decide to remove the compiler barrier!  To do
that you'd need to audit every single use of rcu_read_lock in the
kernel to ensure that they're not depending on the compiler barrier.

This is also contrary to the definition of almost every other
*_lock primitive in the kernel where the compiler barrier is
included.

So please revert this patch.

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4373717904844863453==--

