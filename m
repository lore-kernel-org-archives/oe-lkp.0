Content-Type: multipart/mixed; boundary="===============7637293368535298550=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rcutorture] 46e26223e3: WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print
Date: Mon, 18 Jun 2018 19:38:59 -0700
Message-ID: <20180619023859.GE3593@linux.vnet.ibm.com>
In-Reply-To: <2CDE3A5B-1AD3-4185-9E24-24D4075A9EA6@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7637293368535298550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 06:36:06PM -0700, Joel Fernandes wrote:
> =

> =

> On June 18, 2018 6:08:03 PM PDT, "Paul E. McKenney" <paulmck@linux.vnet=
.ibm.com> wrote:
> >On Mon, Jun 18, 2018 at 03:26:47PM -0700, Joel Fernandes wrote:
> >> On Mon, Jun 18, 2018 at 09:56:46AM -0700, Paul E. McKenney wrote:
> >> > > The reason for the rcutorture test failure could be that the
> >default
> >> > > kthread_prio for the system's RCU threads is set to 1 (unless
> >overridden by
> >> > > rcutree.kthread_prio) which is also equal to the priority of the
> >rcutorture's
> >> > > boost threads. Due to this the rcutorture test could starve the
> >RCU threads
> >> > > as well and defeat the boosting mechanism. I was able to solve a
> >similar
> >> > > issue by just passing rcutree.kthread_prio of 50 on the kernel
> >command line.
> >> > > =

> >> > > Paul, would it be ok if we changed the default kthread_prio to
> >something > 1
> >> > > so that rcutorture can test properly without needing to pass any
> >extra
> >> > > rcutree.* parameters?
> >> > > =

> >> > > so something like this in kernel/rcu/tree.c ?
> >> > > =

> >> > > static int kthread_prio =3D IS_ENABLED(CONFIG_RCU_BOOST) ? 2 : 0;
> >> > =

> >> > Would it be possible to also condition this on rcutorture being
> >built
> >> > in?  Or are they doing modprobes for rcutorture?
> >> =

> >> They seem to be doing built-in rcutorture tests. But I believe the
> >same
> >> problem would occur even if you used modules? I believe the fact that
> >> rcutorture is a module or built-in wouldn't matter to the underlying
> >issue
> >> which is the RCU subsystems's threads are at too low of a priority
> >> (rcutree.kthread_prio =3D 1).
> >
> >Understood...
> >
> >> If you agree with changing the default priority, I have included a
> >patch
> >> below for rcu/dev.
> >
> >The problem is that without rcutorture, rcutree.kthread_prio=3D1 is a
> >legitimate choice, and changing the default globally could be breaking
> >someone.  So it would be far better to up the priority only during
> >known
> >rcutorture testing.
> =

> Oh I see what you're saying. I'll work on a patch along these lines
> then. Thanks!

Looking forward to seeing it!

							Thanx, Paul


--===============7637293368535298550==--

