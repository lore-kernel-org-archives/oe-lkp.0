Content-Type: multipart/mixed; boundary="===============3866654519576905493=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8901ecc231: stress-ng.lockbus.ops_per_sec -9.5% regression
Date: Thu, 05 Aug 2021 08:37:27 -0700
Message-ID: <20210805153727.GG4397@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210805053938.GA12593@gao-cwp>
List-Id: <oe-lkp.lists.linux.dev>

--===============3866654519576905493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 05, 2021 at 01:39:40PM +0800, Chao Gao wrote:
> [snip]
> >> This patch works well; no false-positive (marking TSC unstable) in a
> >> 10hr stress test.
> >
> >Very good, thank you!  May I add your Tested-by?
> =

> sure.
> Tested-by: Chao Gao <chao.gao@intel.com>

Very good, thank you!  I will apply this on the next rebase.

> >I expect that I will need to modify the patch a bit more to check for
> >a system where it is -never- able to get a good fine-grained read from
> >the clock.
> =

> Agreed.
> =

> >And it might be that your test run ended up in that state.
> =

> Not that case judging from kernel logs. Coarse-grained check happened 6475
> times in 43k seconds (by grep "coarse-grained skew check" in kernel logs).
> So, still many checks were fine-grained.

Whew!  ;-)

So about once per 13 clocksource watchdog checks.

To Andi's point, do you have enough information in your console log to
work out the longest run of course-grained clocksource checks?

> >My current thought is that if more than (say) 100 consecutive attempts
> >to read the clocksource get hit with excessive delays, it is time to at
> >least do a WARN_ON(), and maybe also time to disable the clocksource
> >due to skew.  The reason is that if reading the clocksource -always-
> >sees excessive delays, perhaps the clock driver or hardware is to blame.
> >
> >Thoughts?
> =

> It makes sense to me.

Sounds good!

							Thanx, Paul
--===============3866654519576905493==--

