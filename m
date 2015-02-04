Content-Type: multipart/mixed; boundary="===============7190556105845832319=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: lkp@lists.01.org
Subject: Re: [rcu] [ INFO: suspicious RCU usage. ]
Date: Wed, 04 Feb 2015 15:16:27 +0100
Message-ID: <1423059387.24415.2.camel@AMDC1943>
In-Reply-To: <20150204131420.GC5370@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7190556105845832319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On =C5=9Bro, 2015-02-04 at 05:14 -0800, Paul E. McKenney wrote:
> On Wed, Feb 04, 2015 at 01:00:18PM +0000, Russell King - ARM Linux wrote:
> > On Wed, Feb 04, 2015 at 12:39:07PM +0100, Krzysztof Kozlowski wrote:
> > > +Cc some ARM people
> > =

> > I wish that people would CC this list with problems seen on ARM.  I'm
> > minded to just ignore this message because of this in the hope that by
> > doing so, people will learn something...
> > =

> > > > Another thing I could do would be to have an arch-specific Kconfig
> > > > variable that made ARM responsible for informing RCU that the CPU
> > > > was departing, which would allow a call to as follows to be placed
> > > > immediately after the complete():
> > > > =

> > > > rcu_cpu_notify(NULL, CPU_DYING_IDLE, (void *)(long)smp_processor_id=
());
> > > > =

> > > > Note:  This absolutely requires that the rcu_cpu_notify() -always-
> > > > be allowed to execute!!!  This will not work if there is -any- poss=
ibility
> > > > of __cpu_die() powering off the outgoing CPU before the call to
> > > > rcu_cpu_notify() returns.
> > =

> > Exactly, so that's not going to be possible.  The completion at that
> > point marks the point at which power _could_ be removed from the CPU
> > going down.
> =

> OK, sounds like a polling loop is required.

I thought about using wait_on_bit() in __cpu_die() (the waiting thread)
and clearing the bit on CPU being powered down. What do you think about
such idea?

Best regards,
Krzysztof



--===============7190556105845832319==--

