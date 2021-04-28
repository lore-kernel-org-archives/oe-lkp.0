Content-Type: multipart/mixed; boundary="===============8740888230550303238=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Wed, 28 Apr 2021 11:31:41 -0700
Message-ID: <20210428183141.GS975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <87czuen2au.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8740888230550303238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:14:49PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 27 2021 at 18:48, Paul E. McKenney wrote:
> > On Tue, Apr 27, 2021 at 11:09:49PM +0200, Thomas Gleixner wrote:
> >> Paul,
> >> =

> >> On Tue, Apr 27 2021 at 10:50, Paul E. McKenney wrote:
> >> > On Tue, Apr 27, 2021 at 06:37:46AM -0700, Paul E. McKenney wrote:
> >> >> I suppose that I give it (say) 120 seconds instead of the current 6=
0,
> >> >> which might be the right thing to do, but it does feel like papering
> >> >> over a very real initramfs problem.  Alternatively, I could provide=
 a
> >> >> boot parameter allowing those with slow systems to adjust as needed.
> >> >
> >> > OK, it turns out that there are systems for which boot times in exce=
ss
> >> > of one minute are expected behavior.  They are a bit rare, though.
> >> > So what I will do is keep the 60-second default, add a boot paramete=
r,
> >> > and also add a comment by the warning pointing out the boot paramete=
r.
> >> =

> >> Oh, no. This starts to become yet another duct tape horror show.
> >> =

> >> I'm not at all against a more robust and resilent watchdog mechanism,
> >> but having a dozen knobs to tune and heuristics which are doomed to fa=
il
> >> is not a solution at all.
> >
> > One problem is that I did the .max_drift patch backwards.  I tightened
> > the skew requirements on all clocks except those specially marked, and
> > I should have done the reverse.  With that change, all of the clocks
> > except for clocksource_tsc would work (or as the case might be, fail to
> > work) in exactly the same way that they do today, but still rejecting
> > false-positive skew events due to NMIs, SMIs, vCPU preemption, and so o=
n.
> >
> > Then patch v10 7/7 can go away completely, and patch 6/7 becomes much
> > smaller (and gets renamed), for example, as shown below.
> >
> > Does that help?
> =

> No. Because the problem is on both ends. We have TSC early which has
> inaccurate frequency and we have watchdogs which are inaccurate,
> i.e. refined jiffies.
> =

> So the threshold has to take both into account.

Got it, and will fix.

							Thanx, Paul
--===============8740888230550303238==--

