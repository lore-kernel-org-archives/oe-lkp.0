Content-Type: multipart/mixed; boundary="===============4142498221987271489=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [torture] b151f93a71: INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
Date: Tue, 28 Nov 2017 15:16:30 +0100
Message-ID: <alpine.DEB.2.20.1711281454430.1723@nanos>
In-Reply-To: <20171127215735.GP3624@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4142498221987271489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Nov 2017, Paul E. McKenney wrote:
> On Sun, Nov 26, 2017 at 04:42:03PM +0800, kernel test robot wrote:
> > [  116.353432] rcu_preempt kthread starved for 9974 jiffies! g429496720=
8 c4294967207 f0x0 RCU_GP_WAIT_FQS(3) ->state=3D0x402 ->cpu=3D0
> =

> So the immediate reason for the stall warning is that the RCU grace-period
> kthread isn't being allowed to run.
> =

> > [  116.355517] rcu_preempt     I 7464     8      2 0x80000000
> > [  116.356543] Call Trace:
> > [  116.357008]  __schedule+0x493/0x620
> > [  116.357682]  schedule+0x24/0x40
> > [  116.358291]  schedule_timeout+0x330/0x3b0
> =

> And the reason that it isn't being allowed to run is that its few-jiffy
> schedule_timeout has extended for more than nine thousand jiffies.
> =

> There was an odd combination of kernel parameters that Thomas Gleixner
> came across that could cause writer-thread stalls (since fixed in -rcu
> by the exact patch you call out here), but I don't see how this could
> cause an RCU CPU stall warning.

<Trimmed a lot of useless crap.....>

The only reasonable explanation is that either a wakeup is missed or the
timer is not expired. Hard to tell from that back trace, but it would be
interesting to figure that out. Let me think about how that can be done.

Thanks,

	tglx



--===============4142498221987271489==--

