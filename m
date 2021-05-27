Content-Type: multipart/mixed; boundary="===============0261759323801379936=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 27 May 2021 12:19:23 -0700
Message-ID: <20210527191923.GD4397@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <138f81df-08e1-f96e-1915-c58b44f96a41@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0261759323801379936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 12:01:23PM -0700, Andi Kleen wrote:
> =

> >      Nevertheless, it is quite possible that real-world use will result=
 in
> >      some situation requiring that high-stress workloads run on hardware
> >      not designed to accommodate them, and also requiring that the kern=
el
> >      refrain from marking clocksources unstable.
> >      Therefore, provide an out-of-tree patch that reacts to this situat=
ion
> =

> out-of-tree means it will not be submitted?
> =

> I think it would make sense upstream, but perhaps guarded with some optio=
n.

The reason I do not intend to immediately upstream this patch is that
it increases the probability that a real clocksource read-latency issue
will be ignored, for example, during hardware bringup.  Furthermore,
the only known need from it comes from hardware that is, in the words
of the stress-ng man page, "poorly designed".  And the timing of this
email thread leads me to believe that such hardware is not easy to obtain.

Adding an option would increase complexity, but I agree that such an
option would address some of the patch's downsides.  On the other hand,
there has been some pushback to such options.

My thought is therefore to keep this patch out of tree for now.
If it becomes clear that long-latency clocksource reads really are
a significant issue in their own right (as opposed to merely being a
symptom of a hardware or firmware bug), then this patch is available to
immediately respond to that issue.

And there would then be strong evidence in favor of me biting the bullet,
adding the complexity and the additional option (with your Suggested-by),
and getting that upstream and into -stable.

Seem reasonable?

							Thanx, Paul
--===============0261759323801379936==--

