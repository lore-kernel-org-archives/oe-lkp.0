Content-Type: multipart/mixed; boundary="===============4006266838045825414=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rcutorture] 46e26223e3: WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print
Date: Mon, 18 Jun 2018 18:08:03 -0700
Message-ID: <20180619010803.GC3593@linux.vnet.ibm.com>
In-Reply-To: <20180618222647.GA156172@joelaf.mtv.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4006266838045825414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 03:26:47PM -0700, Joel Fernandes wrote:
> On Mon, Jun 18, 2018 at 09:56:46AM -0700, Paul E. McKenney wrote:
> > > The reason for the rcutorture test failure could be that the default
> > > kthread_prio for the system's RCU threads is set to 1 (unless overrid=
den by
> > > rcutree.kthread_prio) which is also equal to the priority of the rcut=
orture's
> > > boost threads. Due to this the rcutorture test could starve the RCU t=
hreads
> > > as well and defeat the boosting mechanism. I was able to solve a simi=
lar
> > > issue by just passing rcutree.kthread_prio of 50 on the kernel comman=
d line.
> > > =

> > > Paul, would it be ok if we changed the default kthread_prio to someth=
ing > 1
> > > so that rcutorture can test properly without needing to pass any extra
> > > rcutree.* parameters?
> > > =

> > > so something like this in kernel/rcu/tree.c ?
> > > =

> > > static int kthread_prio =3D IS_ENABLED(CONFIG_RCU_BOOST) ? 2 : 0;
> > =

> > Would it be possible to also condition this on rcutorture being built
> > in?  Or are they doing modprobes for rcutorture?
> =

> They seem to be doing built-in rcutorture tests. But I believe the same
> problem would occur even if you used modules? I believe the fact that
> rcutorture is a module or built-in wouldn't matter to the underlying issue
> which is the RCU subsystems's threads are at too low of a priority
> (rcutree.kthread_prio =3D 1).

Understood...

> If you agree with changing the default priority, I have included a patch
> below for rcu/dev.

The problem is that without rcutorture, rcutree.kthread_prio=3D1 is a
legitimate choice, and changing the default globally could be breaking
someone.  So it would be far better to up the priority only during known
rcutorture testing.

							Thanx, Paul

> thanks,
> =

>  - Joel
> =

> ---8<-----------------------
> =

> >From b0f4111ef1abd1c481c269fadb3535c83ab43c93 Mon Sep 17 00:00:00 2001
> From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
> Date: Mon, 18 Jun 2018 15:13:10 -0700
> Subject: [PATCH] rcu: Change default RCU kthread priority to 2
> =

> The current RT priority of 1 for RCU kthreads makes rcutorture's boost te=
st
> fail on systems where rcutree.kthread_prio isn't passed.
> =

> The rcutorture boost kthreads have the same priority as well (RT priority=
 of
> 1). Due to this, the rcutorture kthreads starve the RCU subsystem's kthre=
ads
> and causes rcutorture failures. This patch changes the priority of the RCU
> subsystem's threads to a default RT priority of 2 so that rcutorture's
> threads get preempted by them. Verified that the boost tests will pass wi=
th
> this change.
> =

> Reported-by: Xiaolong Ye (via lkp-robot) <xiaolong.ye@intel.com>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> ---
>  kernel/rcu/tree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index deb2508be923..920c39e3f871 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -171,7 +171,7 @@ static void rcu_report_exp_rdp(struct rcu_state *rsp,
>  static void sync_sched_exp_online_cleanup(int cpu);
> =

>  /* rcuc/rcub kthread realtime priority */
> -static int kthread_prio =3D IS_ENABLED(CONFIG_RCU_BOOST) ? 1 : 0;
> +static int kthread_prio =3D IS_ENABLED(CONFIG_RCU_BOOST) ? 2 : 0;
>  module_param(kthread_prio, int, 0644);
> =

>  /* Delay in jiffies for grace-period initialization delays, debug only. =
*/
> -- =

> 2.18.0.rc1.244.gcf134e6275-goog
> =



--===============4006266838045825414==--

