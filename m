Content-Type: multipart/mixed; boundary="===============7359738010843680863=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 07 Apr 2017 17:23:04 +0200
Message-ID: <20170407152304.bkbceqmg3kxeqvur@hirez.programming.kicks-ass.net>
In-Reply-To: <20170407151306.GA384@tigerII.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============7359738010843680863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 08, 2017 at 12:13:06AM +0900, Sergey Senozhatsky wrote:
> On (04/07/17 14:44), Pavel Machek wrote:
> [..]
> > > [..]
> > > > I believe "spend at most 2 seconds in printk(), then print a warning
> > > > and offload" is a solution closer to what we had before.
> > > =

> > > a warning here can be very noisy.
> > =

> > Well, on normally-configured it should be ok. We don't commonly see
> > printk problems... If it is too noisy, perhaps we should increase from
> > 2 seconds, but I don't think it will be problem.
> =

> we are looking at different typical setups :) serial console being 45
> seconds behind logbuf does not surprise me anymore.

That does sound like you're doing something wrong and should look at
reducing printk() more than anything else.

--===============7359738010843680863==--

