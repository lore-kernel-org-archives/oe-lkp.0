Content-Type: multipart/mixed; boundary="===============6669156540624269373=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] kernel BUG at include/linux/pagemap.h:149!
Date: Fri, 11 Sep 2015 14:59:37 -0700
Message-ID: <20150911215937.GH4029@linux.vnet.ibm.com>
In-Reply-To: <CAJzB8QG=1iZW3dQEie6ZSTLv8GZ3YSut0aL1VU7LLmiHQ1B1DQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6669156540624269373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Hi Paul
> =

> On Thu, Sep 10, 2015 at 10:16:49AM -0700, Paul E. McKenney wrote:
> > On Thu, Sep 10, 2015 at 06:25:13PM +0800, Boqun Feng wrote:
> [snip]
> > >
> > > Code here is:
> > >
> > > #ifdef CONFIG_TINY_RCU
> > > # ifdef CONFIG_PREEMPT_COUNT
> > >     VM_BUG_ON(!in_atomic()); <-- BUG triggered here.
> > > # endif
> > > ...
> > > #endif
> > >
> > > This indicates that CONFIG_TINY_RCU and CONFIG_PREEMPT_COUNT are both=
 y.
> > > Normally, IIUC, this is not possible or meaningless, because TINY_RCU=
 is
> > > for !PREEMPT kernel. However, according to commmit e8f7c70f4 ("sched:
> > > Make sleeping inside spinlock detection working in !CONFIG_PREEMPT"),
> > > maintaining preempt counts in !PREEMPT kernel makes sense for finding
> > > preempt-related bugs.
> >
> > Good analysis, thank you!
> >
> > > So a possible fix would be still counting preempt_count in
> > > rcu_read_lock and rcu_read_unlock if PREEMPT_COUNT is y for debug
> > > purpose:
> > >
> > > diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> > > index 07f9b95..887bf5f 100644
> > > --- a/include/linux/rcupdate.h
> > > +++ b/include/linux/rcupdate.h
> > > @@ -297,10 +297,16 @@ void synchronize_rcu(void);
> > >
> > >  static inline void __rcu_read_lock(void)
> > >  {
> > > +#ifdef CONFIG_PREEMPT_COUNT
> > > +       preempt_disable();
> > > +#endif
> >
> > We can save a line as follows:
> >
> >       if (IS_ENABLED(CONFIG_PREEMPT_COUNT))
> >               preempt_disable();
> >
> > This approach also has the advantage of letting the compiler look at
> > more of the code, so that compiler errors in strange combinations of
> > configurations are less likely to be missed.
> >
> =

> Good idea, plus better readability IMO.
> =

> =

> > >  }
> > >
> > >  static inline void __rcu_read_unlock(void)
> > >  {
> > > +#ifdef CONFIG_PREEMPT_COUNT
> > > +       preempt_enable();
> > > +#endif
> > >  }
> > >
> > > I did a simple booting test with the some configuration on a guest on
> > > x86, didn't see this error again.
> > >
> > > (Also add Frederic Weisbecker to CCed)
> >
> > Would you like to send me a replacement patch?
> >
> =

> Not sure I'm handling the Signed-off-by right.., but here it is:
> =

> (The rest on dev.2015.09.01a branch can be applied on this cleanly, and
> I did a simple booting test with the same configuration on a guest on
> x86, didn't see the reported error again)

Queued for v4.4, thank you!  Please see below for updated commit log,
and please let me know if there are any problems with it.

							Thanx, Paul

> --------------->8
> Subject: [PATCH 01/27] rcu: Don't disable preemption for Tiny and Tree RCU
>  readers
> =

> Because preempt_disable() maps to barrier() for non-debug builds,
> it forces the compiler to spill and reload registers.  Because Tree
> RCU and Tiny RCU now only appear in CONFIG_PREEMPT=3Dn builds, these
> barrier() instances generate needless extra code for each instance of
> rcu_read_lock() and rcu_read_unlock().  This extra code slows down Tree
> RCU and bloats Tiny RCU.
> =

> This commit therefore removes the preempt_disable() and preempt_enable()
> from the non-preemptible implementations of __rcu_read_lock() and
> __rcu_read_unlock(), respectively.
> =

> For debug purposes, preempt_disable() and preempt_enable() are still
> kept if CONFIG_PREEMPT_COUNT=3Dy, which makes the detection of sleeping
> inside atomic sections still work in non-preemptible kernels.
> =

> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> ---
>  include/linux/rcupdate.h | 6 ++++--
>  include/linux/rcutiny.h  | 1 +
>  kernel/rcu/tree.c        | 9 +++++++++
>  3 files changed, 14 insertions(+), 2 deletions(-)
> =

> diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> index d63bb77..6c3cece 100644
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@ -297,12 +297,14 @@ void synchronize_rcu(void);
> =

>  static inline void __rcu_read_lock(void)
>  {
> -       preempt_disable();
> +       if (IS_ENABLED(CONFIG_PREEMPT_COUNT))
> +               preempt_disable();
>  }
> =

>  static inline void __rcu_read_unlock(void)
>  {
> -       preempt_enable();
> +       if (IS_ENABLED(CONFIG_PREEMPT_COUNT))
> +               preempt_enable();
>  }
> =

>  static inline void synchronize_rcu(void)
> diff --git a/include/linux/rcutiny.h b/include/linux/rcutiny.h
> index c8a0722..4c1aaf9 100644
> --- a/include/linux/rcutiny.h
> +++ b/include/linux/rcutiny.h
> @@ -216,6 +216,7 @@ static inline bool rcu_is_watching(void)
> =

>  static inline void rcu_all_qs(void)
>  {
> +       barrier(); /* Avoid RCU read-side critical sections leaking acros=
s.
> */
>  }
> =

>  #endif /* __LINUX_RCUTINY_H */
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index ce43fac..b4882f8 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -337,12 +337,14 @@ static void rcu_momentary_dyntick_idle(void)
>   */
>  void rcu_note_context_switch(void)
>  {
> +       barrier(); /* Avoid RCU read-side critical sections leaking down.=
 */
>         trace_rcu_utilization(TPS("Start context switch"));
>         rcu_sched_qs();
>         rcu_preempt_note_context_switch();
>         if (unlikely(raw_cpu_read(rcu_sched_qs_mask)))
>                 rcu_momentary_dyntick_idle();
>         trace_rcu_utilization(TPS("End context switch"));
> +       barrier(); /* Avoid RCU read-side critical sections leaking up. */
>  }
>  EXPORT_SYMBOL_GPL(rcu_note_context_switch);
> =

> @@ -353,12 +355,19 @@ EXPORT_SYMBOL_GPL(rcu_note_context_switch);
>   * RCU flavors in desperate need of a quiescent state, which will normal=
ly
>   * be none of them).  Either way, do a lightweight quiescent state for
>   * all RCU flavors.
> + *
> + * The barrier() calls are redundant in the common case when this is
> + * called externally, but just in case this is called from within this
> + * file.
> + *
>   */
>  void rcu_all_qs(void)
>  {
> +       barrier(); /* Avoid RCU read-side critical sections leaking down.=
 */
>         if (unlikely(raw_cpu_read(rcu_sched_qs_mask)))
>                 rcu_momentary_dyntick_idle();
>         this_cpu_inc(rcu_qs_ctr);
> +       barrier(); /* Avoid RCU read-side critical sections leaking up. */
>  }
>  EXPORT_SYMBOL_GPL(rcu_all_qs);

------------------------------------------------------------------------

    rcu: Don't disable preemption for Tiny and Tree RCU readers
    =

    Because preempt_disable() maps to barrier() for non-debug builds,
    it forces the compiler to spill and reload registers.  Because Tree
    RCU and Tiny RCU now only appear in CONFIG_PREEMPT=3Dn builds, these
    barrier() instances generate needless extra code for each instance of
    rcu_read_lock() and rcu_read_unlock().  This extra code slows down Tree
    RCU and bloats Tiny RCU.
    =

    This commit therefore removes the preempt_disable() and preempt_enable()
    from the non-preemptible implementations of __rcu_read_lock() and
    __rcu_read_unlock(), respectively.  However, for debug purposes,
    preempt_disable() and preempt_enable() are still invoked if
    CONFIG_PREEMPT_COUNT=3Dy, because this allows detection of sleeping ins=
ide
    atomic sections in non-preemptible kernels.
    =

    This is based on an earlier patch by Paul E. McKenney, fixing
    a bug encountered in kernels built with CONFIG_PREEMPT=3Dn and
    CONFIG_PREEMPT_COUNT=3Dy.
    =

    Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index d63bb77dab35..6c3ceceb6148 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -297,12 +297,14 @@ void synchronize_rcu(void);
 =

 static inline void __rcu_read_lock(void)
 {
-	preempt_disable();
+	if (IS_ENABLED(CONFIG_PREEMPT_COUNT))
+		preempt_disable();
 }
 =

 static inline void __rcu_read_unlock(void)
 {
-	preempt_enable();
+	if (IS_ENABLED(CONFIG_PREEMPT_COUNT))
+		preempt_enable();
 }
 =

 static inline void synchronize_rcu(void)
diff --git a/include/linux/rcutiny.h b/include/linux/rcutiny.h
index c8a0722f77ea..4c1aaf9cce7b 100644
--- a/include/linux/rcutiny.h
+++ b/include/linux/rcutiny.h
@@ -216,6 +216,7 @@ static inline bool rcu_is_watching(void)
 =

 static inline void rcu_all_qs(void)
 {
+	barrier(); /* Avoid RCU read-side critical sections leaking across. */
 }
 =

 #endif /* __LINUX_RCUTINY_H */
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index ce43fac5ff91..b4882f8b8a9e 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -337,12 +337,14 @@ static void rcu_momentary_dyntick_idle(void)
  */
 void rcu_note_context_switch(void)
 {
+	barrier(); /* Avoid RCU read-side critical sections leaking down. */
 	trace_rcu_utilization(TPS("Start context switch"));
 	rcu_sched_qs();
 	rcu_preempt_note_context_switch();
 	if (unlikely(raw_cpu_read(rcu_sched_qs_mask)))
 		rcu_momentary_dyntick_idle();
 	trace_rcu_utilization(TPS("End context switch"));
+	barrier(); /* Avoid RCU read-side critical sections leaking up. */
 }
 EXPORT_SYMBOL_GPL(rcu_note_context_switch);
 =

@@ -353,12 +355,19 @@ EXPORT_SYMBOL_GPL(rcu_note_context_switch);
  * RCU flavors in desperate need of a quiescent state, which will normally
  * be none of them).  Either way, do a lightweight quiescent state for
  * all RCU flavors.
+ *
+ * The barrier() calls are redundant in the common case when this is
+ * called externally, but just in case this is called from within this
+ * file.
+ *
  */
 void rcu_all_qs(void)
 {
+	barrier(); /* Avoid RCU read-side critical sections leaking down. */
 	if (unlikely(raw_cpu_read(rcu_sched_qs_mask)))
 		rcu_momentary_dyntick_idle();
 	this_cpu_inc(rcu_qs_ctr);
+	barrier(); /* Avoid RCU read-side critical sections leaking up. */
 }
 EXPORT_SYMBOL_GPL(rcu_all_qs);
 =



--===============6669156540624269373==--

