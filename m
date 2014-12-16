Content-Type: multipart/mixed; boundary="===============8429148476729220314=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 17:54:58 +0100
Message-ID: <alpine.DEB.2.11.1412161741480.17382@nanos>
In-Reply-To: <20141216145653.GY3337@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8429148476729220314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2014, Peter Zijlstra wrote:
> On Tue, Dec 16, 2014 at 03:32:28PM +0100, Thomas Gleixner wrote:
> So let me try and understand the problem with the emulated idle thing
> better (running idle from FIFO threads).
> =

> I suppose the tricky bit is what happens when the cpu was idle; in that
> case we'll end up with 1 running thread in state:
> =

>  1              0               1               valid
> =

> But need to avoid ending up in:
> =

>  1              1               1               BUG
> =

> Which should be relatively simple by never entering nohzfull when 'idle'.

Well, yes. =

 =

> However with your proposed thingy, I think we'll end up in:
> =

>  1              1               1               BUG
> =

> Because we don't start another thread, so infullnohz will stay valid,
> however we'll also be 'forced' into idle (with nr_running > 0) and stop
> the tick.

Indeed.
 =

> A remote wakeup might result in nr_running going from 1->2 and seeing
> infullnohz =3D=3D 1, try and restart the tick, while we're idle!
> =

> Of course, we can fix that too, by clearing nohzfull when going 'idle',
> after all, nohzfull will re-establish itself automagically when the tick
> detects but the one task afterwards.
> =

> So both cases need work, neither works out of the box afaict. But I

Agreed.

> can't see one really being better than the other either -- am I missing
> obvious things again?

No, it's both butt ugly, though what really bothers me is that we
pretend to be idle without being in the idle thread. That makes a lot
of stuff really weird.

Anything which relies on is_idle_task(current), idle_cpu() and a bunch
of other things just fail to work while we pretend being "the idle"
task.

That's just wrong. That powerclamp stuff needs to put the cpu
(including the scheduler, etc.) into a well defined state.

The fake idle task is everything else than well defined state, really.

Thanks,

	tglx

   =



--===============8429148476729220314==--

