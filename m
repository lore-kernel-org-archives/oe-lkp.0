Content-Type: multipart/mixed; boundary="===============7837838258032213428=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] [ INFO: suspicious RCU usage. ]
Date: Wed, 04 Feb 2015 07:46:13 -0800
Message-ID: <20150204154613.GE5370@linux.vnet.ibm.com>
In-Reply-To: <20150204151624.GI8656@n2100.arm.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7837838258032213428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2015 at 03:16:24PM +0000, Russell King - ARM Linux wrote:
> On Wed, Feb 04, 2015 at 07:10:28AM -0800, Paul E. McKenney wrote:
> > You know, this situation is giving me a bad case of nostalgia for the
> > old Sequent Symmetry and NUMA-Q hardware.  On those platforms, the
> > outgoing CPU could turn itself off, and thus didn't need to tell some
> > other CPU when it was ready to be turned off.  Seems to me that this
> > self-turn-off capability would be a great feature for future systems!
> =

> Unfortunately, some briliant people decided that secure firmware on
> their platforms (which is sometimes needed to turn the secondary CPUs
> off) can only be called by CPU0...
> =

> Other people decide that they can power down the secondary CPU when it
> hits a WFI (wait for interrupt) instruction after arming that state
> change, which is far saner - but we still need to know on the requesting
> CPU when the dying CPU has completed the time-expensive parts of the
> offlining process.

I suppose that you could grant the outgoing CPU the ability to arm
that state, but easy for me to say...

Anyway, still looks like a pure polling loop is required, with short
timed waits running on the surviving CPU.

							Thanx, Paul


--===============7837838258032213428==--

