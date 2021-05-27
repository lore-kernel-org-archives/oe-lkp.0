Content-Type: multipart/mixed; boundary="===============6239476617720115146=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 27 May 2021 20:29:32 +0100
Message-ID: <YK/zHMPSZSKrmXC6@casper.infradead.org>
In-Reply-To: <20210527191923.GD4397@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============6239476617720115146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 12:19:23PM -0700, Paul E. McKenney wrote:
> On Thu, May 27, 2021 at 12:01:23PM -0700, Andi Kleen wrote:
> > =

> > >      Nevertheless, it is quite possible that real-world use will resu=
lt in
> > >      some situation requiring that high-stress workloads run on hardw=
are
> > >      not designed to accommodate them, and also requiring that the ke=
rnel
> > >      refrain from marking clocksources unstable.
> > >      Therefore, provide an out-of-tree patch that reacts to this situ=
ation
> > =

> > out-of-tree means it will not be submitted?
> > =

> > I think it would make sense upstream, but perhaps guarded with some opt=
ion.
> =

> The reason I do not intend to immediately upstream this patch is that
> it increases the probability that a real clocksource read-latency issue
> will be ignored, for example, during hardware bringup.  Furthermore,
> the only known need from it comes from hardware that is, in the words
> of the stress-ng man page, "poorly designed".  And the timing of this
> email thread leads me to believe that such hardware is not easy to obtain.

I think you're placing a little too much weight on the documentation
here.  It seems that a continuous stream of locked operations executed
in userspace on a single CPU can cause this problem to occur.  If that's
true all the way out to one guest in a hypervisor can cause problems
for the hypervisor itself, I think cloud providers everywhere are
going to want this patch?

> My thought is therefore to keep this patch out of tree for now.
> If it becomes clear that long-latency clocksource reads really are
> a significant issue in their own right (as opposed to merely being a
> symptom of a hardware or firmware bug), then this patch is available to
> immediately respond to that issue.
> =

> And there would then be strong evidence in favor of me biting the bullet,
> adding the complexity and the additional option (with your Suggested-by),
> and getting that upstream and into -stable.
> =

> Seem reasonable?
> =

> 							Thanx, Paul
>=20
--===============6239476617720115146==--

