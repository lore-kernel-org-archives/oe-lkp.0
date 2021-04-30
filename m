Content-Type: multipart/mixed; boundary="===============2076794971760523166=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Thu, 29 Apr 2021 17:59:19 -0700
Message-ID: <20210430005919.GA983840@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210430002459.GB975577@paulmck-ThinkPad-P17-Gen-1>
List-Id: <oe-lkp.lists.linux.dev>

--===============2076794971760523166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 05:24:59PM -0700, Paul E. McKenney wrote:
> On Thu, Apr 29, 2021 at 04:04:11PM -0700, Andi Kleen wrote:
> > > > The idea is to leave the watchdog code in kernel/time/clocksource.c,
> > > > but to move the fault injection into kernel/time/clocksourcefault.c=
 or
> > > > some such.  In this new file, new clocksource structures are create=
d that
> > > > use some existing timebase/clocksource under the covers.  These then
> > > > inject delays based on module parameters (one senstive to CPU numbe=
r,
> > > > the other unconditional).  They register these clocksources using t=
he
> > > > normal interfaces, and verify that they are eventually marked unsta=
ble
> > > > when the fault-injection parameters warrant it.  This is combined w=
ith
> > > > the usual checking of the console log.
> > > >
> > > > Or am I missing your point?
> > > =

> > > That's what I meant.
> > =

> > I still think all this stuff should be in the fault injection framework,
> > like other fault injections, to have a consistent discoverable interfac=
e. =

> > =

> > I actually checked now and the standard fault injection supports boot a=
rguments,
> > so needing it at boot time shouldn't be a barrier.
> =

> Per Thomas's feedback, I am in the midst of converting this to a unit
> test implemented as a kernel module, at which point the only fault
> injection will be in the unit test.
> =

> At the moment, the code just registers, reads, unregisters, and verifies
> that the bogus unit-test clocksources act normally.  Fault injection is
> next on the list for the fine-grained clocksource.  Which, as Thomas
> noted, is quite a bit simpler, as I just need to force a delay until
> the clocksource gets marked unstable with no need for fancy counting.

And this is what I currently get on the console from a successful test:

------------------------------------------------------------------------

clocksource_wdtest: --- holdoff=3D20
clocksource_wdtest: --- Verify jiffies-like uncertainty margin.
clocksource: wdtest-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_i=
dle_ns: 1911260446275000 ns
clocksource_wdtest: --- Verify tsc-like uncertainty margin.
clocksource: wdtest-ktime: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4df=
fb, max_idle_ns: 881590591483 ns
clocksource_wdtest: --- tsc-like times: 1619743817068433427 - 1619743817068=
432303 =3D 1124.
clocksource_wdtest: --- Watchdog without error injection.
clocksource_wdtest: --- Watchdog with singleton error injection.
clocksource_wdtest: --- Watchdog with doublet error injection, expect conso=
le messages.
clocksource: timekeeping watchdog on CPU4: kvm-clock retried 2 times before=
 success
clocksource_wdtest: --- Watchdog with quadruplet error injection, expect cl=
ock skew.
clocksource: timekeeping watchdog on CPU8: kvm-clock read-back delay of 401=
209ns, attempt 4, marking unstable
clocksource_wdtest: --- Marking wdtest-ktime unstable due to clocksource wa=
tchdog.
clocksource_wdtest: --- Done with test.

------------------------------------------------------------------------

The code currently looks like a dog's breakfast, so I will clean it
up before sending it out.  And of course add the time-readout error
injection to test the other clock-skew code path.

And yes, there are WARNs to verify that skew happens when it is supposed
to and so on.

							Thanx, Paul
--===============2076794971760523166==--

