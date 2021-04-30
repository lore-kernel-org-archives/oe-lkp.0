Content-Type: multipart/mixed; boundary="===============4367007036981572006=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Thu, 29 Apr 2021 17:24:59 -0700
Message-ID: <20210430002459.GB975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210429230411.GK4032392@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4367007036981572006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 04:04:11PM -0700, Andi Kleen wrote:
> > > The idea is to leave the watchdog code in kernel/time/clocksource.c,
> > > but to move the fault injection into kernel/time/clocksourcefault.c or
> > > some such.  In this new file, new clocksource structures are created =
that
> > > use some existing timebase/clocksource under the covers.  These then
> > > inject delays based on module parameters (one senstive to CPU number,
> > > the other unconditional).  They register these clocksources using the
> > > normal interfaces, and verify that they are eventually marked unstable
> > > when the fault-injection parameters warrant it.  This is combined with
> > > the usual checking of the console log.
> > >
> > > Or am I missing your point?
> > =

> > That's what I meant.
> =

> I still think all this stuff should be in the fault injection framework,
> like other fault injections, to have a consistent discoverable interface. =

> =

> I actually checked now and the standard fault injection supports boot arg=
uments,
> so needing it at boot time shouldn't be a barrier.

Per Thomas's feedback, I am in the midst of converting this to a unit
test implemented as a kernel module, at which point the only fault
injection will be in the unit test.

At the moment, the code just registers, reads, unregisters, and verifies
that the bogus unit-test clocksources act normally.  Fault injection is
next on the list for the fine-grained clocksource.  Which, as Thomas
noted, is quite a bit simpler, as I just need to force a delay until
the clocksource gets marked unstable with no need for fancy counting.

							Thanx, Paul
--===============4367007036981572006==--

