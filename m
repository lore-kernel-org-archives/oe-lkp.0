Content-Type: multipart/mixed; boundary="===============7825619227346662904=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] kernel BUG at include/linux/pagemap.h:149!
Date: Mon, 21 Sep 2015 13:43:27 -0700
Message-ID: <20150921204327.GH4029@linux.vnet.ibm.com>
In-Reply-To: <20150921193045.GA13674@lerouge>
List-Id: <oe-lkp.lists.linux.dev>

--===============7825619227346662904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 09:30:49PM +0200, Frederic Weisbecker wrote:
> On Fri, Sep 11, 2015 at 10:19:47AM +0800, Boqun Feng wrote:
> > Subject: [PATCH 01/27] rcu: Don't disable preemption for Tiny and Tree =
RCU
> >  readers
> > =

> > Because preempt_disable() maps to barrier() for non-debug builds,
> > it forces the compiler to spill and reload registers.  Because Tree
> > RCU and Tiny RCU now only appear in CONFIG_PREEMPT=3Dn builds, these
> > barrier() instances generate needless extra code for each instance of
> > rcu_read_lock() and rcu_read_unlock().  This extra code slows down Tree
> > RCU and bloats Tiny RCU.
> > =

> > This commit therefore removes the preempt_disable() and preempt_enable()
> > from the non-preemptible implementations of __rcu_read_lock() and
> > __rcu_read_unlock(), respectively.
> > =

> > For debug purposes, preempt_disable() and preempt_enable() are still
> > kept if CONFIG_PREEMPT_COUNT=3Dy, which makes the detection of sleeping
> > inside atomic sections still work in non-preemptible kernels.
> > =

> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > ---
> >  include/linux/rcupdate.h | 6 ++++--
> >  include/linux/rcutiny.h  | 1 +
> >  kernel/rcu/tree.c        | 9 +++++++++
> >  3 files changed, 14 insertions(+), 2 deletions(-)
> > =

> > diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> > index d63bb77..6c3cece 100644
> > --- a/include/linux/rcupdate.h
> > +++ b/include/linux/rcupdate.h
> > @@ -297,12 +297,14 @@ void synchronize_rcu(void);
> >  =

> >  static inline void __rcu_read_lock(void)
> >  {
> > -	preempt_disable();
> > +	if (IS_ENABLED(CONFIG_PREEMPT_COUNT))
> > +		preempt_disable();
> =

> preempt_disable() is a no-op when !CONFIG_PREEMPT_COUNT, right?
> Or rather it's a barrier(), which is anyway implied by rcu_read_lock().
> =

> So perhaps we can get rid of the IS_ENABLED() check?

Actually, barrier() is not intended to be implied by rcu_read_lock().
In a non-preemptible RCU implementation, it doesn't help anything
to have the compiler flush its temporaries upon rcu_read_lock()
and rcu_read_unlock().

						Thanx, Paul


--===============7825619227346662904==--

