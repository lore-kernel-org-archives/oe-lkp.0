Content-Type: multipart/mixed; boundary="===============7402867878112279528=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 05 Aug 2021 08:33:10 -0700
Message-ID: <20210805153310.GF4397@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <a8d99be8-da3f-6c8e-cdbb-efd239ff3f14@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7402867878112279528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 09:34:13PM -0700, Andi Kleen wrote:
> =

> > My current thought is that if more than (say) 100 consecutive attempts
> > to read the clocksource get hit with excessive delays, it is time to at
> > least do a WARN_ON(), and maybe also time to disable the clocksource
> > due to skew.  The reason is that if reading the clocksource -always-
> > sees excessive delays, perhaps the clock driver or hardware is to blame.
> > =

> > Thoughts?
> =

> On TDX this would be fatal because we don't have a usable fallback source
> =

> (just jiffies). Better try as hard as possible.

At some point, won't the system's suffering in silence become quite the
disservice to its users?

One alternative would be to give a warning splat, but avoid reporting
skew.  Unless there is the traditional 62.5ms of skew, of course.

							Thanx, Paul
--===============7402867878112279528==--

