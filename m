Content-Type: multipart/mixed; boundary="===============2728099311218648967=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcutorture] 82e310033d: WARNING:possible_recursive_locking_detected
Date: Thu, 30 Dec 2021 10:00:44 +0800
Message-ID: <20211230020044.GA17043@xsang-OptiPlex-9020>
In-Reply-To: <20211229172441.GA4109570@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============2728099311218648967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Paul,

On Wed, Dec 29, 2021 at 09:24:41AM -0800, Paul E. McKenney wrote:
> On Wed, Dec 29, 2021 at 10:01:21PM +0800, Oliver Sang wrote:
> > hi Paul,
> > =

> > we applied below patch upon next-20211224,
> > confirmed no "WARNING:possible_recursive_locking_detected" after patch.
> > =

> =

> Good to hear!  May I add your Tested-by?

sure (:

Tested-by: Oliver Sang <oliver.sang@intel.com>

> =

> Many of the remainder appear to be due to memory exhaustion, FWIW.

thanks for information

> =

> 							Thanx, Paul
> =

> > > ---------------------------------------------------------------------=
---
> > > =

> > > commit dd47cbdcc2f72ba3df1248fb7fe210acca18d09c
> > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > Date:   Tue Dec 28 15:59:38 2021 -0800
> > > =

> > >     rcutorture: Fix rcu_fwd_mutex deadlock
> > >     =

> > >     The rcu_torture_fwd_cb_hist() function acquires rcu_fwd_mutex, bu=
t is
> > >     invoked from rcutorture_oom_notify() function, which hold this sa=
me
> > >     mutex across this call.  This commit fixes the resulting deadlock.
> > >     =

> > >     Reported-by: kernel test robot <oliver.sang@intel.com>
> > >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > =

> > > diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> > > index 918a2ea34ba13..9190dce686208 100644
> > > --- a/kernel/rcu/rcutorture.c
> > > +++ b/kernel/rcu/rcutorture.c
> > > @@ -2184,7 +2184,6 @@ static void rcu_torture_fwd_cb_hist(struct rcu_=
fwd *rfp)
> > >  	for (i =3D ARRAY_SIZE(rfp->n_launders_hist) - 1; i > 0; i--)
> > >  		if (rfp->n_launders_hist[i].n_launders > 0)
> > >  			break;
> > > -	mutex_lock(&rcu_fwd_mutex); // Serialize histograms.
> > >  	pr_alert("%s: Callback-invocation histogram %d (duration %lu jiffie=
s):",
> > >  		 __func__, rfp->rcu_fwd_id, jiffies - rfp->rcu_fwd_startat);
> > >  	gps_old =3D rfp->rcu_launder_gp_seq_start;
> > > @@ -2197,7 +2196,6 @@ static void rcu_torture_fwd_cb_hist(struct rcu_=
fwd *rfp)
> > >  		gps_old =3D gps;
> > >  	}
> > >  	pr_cont("\n");
> > > -	mutex_unlock(&rcu_fwd_mutex);
> > >  }
> > >  =

> > >  /* Callback function for continuous-flood RCU callbacks. */
> > > @@ -2435,7 +2433,9 @@ static void rcu_torture_fwd_prog_cr(struct rcu_=
fwd *rfp)
> > >  			 n_launders, n_launders_sa,
> > >  			 n_max_gps, n_max_cbs, cver, gps);
> > >  		atomic_long_add(n_max_cbs, &rcu_fwd_max_cbs);
> > > +		mutex_lock(&rcu_fwd_mutex); // Serialize histograms.
> > >  		rcu_torture_fwd_cb_hist(rfp);
> > > +		mutex_unlock(&rcu_fwd_mutex);
> > >  	}
> > >  	schedule_timeout_uninterruptible(HZ); /* Let CBs drain. */
> > >  	tick_dep_clear_task(current, TICK_DEP_BIT_RCU);
--===============2728099311218648967==--

