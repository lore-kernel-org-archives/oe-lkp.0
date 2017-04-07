Content-Type: multipart/mixed; boundary="===============7822195548826227593=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Sat, 08 Apr 2017 00:13:06 +0900
Message-ID: <20170407151306.GA384@tigerII.localdomain>
In-Reply-To: <20170407124455.GC4756@amd>
List-Id: <oe-lkp.lists.linux.dev>

--===============7822195548826227593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/07/17 14:44), Pavel Machek wrote:
[..]
> > [..]
> > > I believe "spend at most 2 seconds in printk(), then print a warning
> > > and offload" is a solution closer to what we had before.
> > =

> > a warning here can be very noisy.
> =

> Well, on normally-configured it should be ok. We don't commonly see
> printk problems... If it is too noisy, perhaps we should increase from
> 2 seconds, but I don't think it will be problem.

we are looking at different typical setups :) serial console being 45
seconds behind logbuf does not surprise me anymore.

[..]
> > what we have been thinking about is something like printk-stall detecti=
on.
> > we probably (there are some if-s) can detect in printk() that offloading
> > does not work and we must automatically switch to printk_emergency mode.
> > that, in theory, can relax our dependency on printk_emergency_begin/end
> > being in the right place at the right time. need to think more about it.
> =

> So... I don't really like the begin/end interface. I would rather have
> printk_emergency(KERN_ ...).

you mean a single printk_emergency() switches printk to emergency mode
or printk_emergency(KERN_ ... ) is a single message that must be printed
in emergency mode?

printk() depends on console_trylock(). we can't expect printk_emergency(KER=
N_ ...)
to always do more than just log_store().

the idea behind begin/end interface is that you can do

	emergency_begin
	printk
	pr_cont
	pr_cont
	pr_cont
	printk
	dump_stack
	emergency_end

with out the need of rewriting dump_stack() or anything else to use
printk_emergency(). we, for example, do this in sysrq patch from this
series.

> Second... I don't think "stuck detector" is that helpful. What I
> usually seen was some rather innocent kernel message followed by
> hard-lock. That's where "message delayed" is useful..

a side note,
that's rather unclear to me how would "message delayed" really help.
if your system hard-lockup so badly and there are no printk messages
even from NMI watchdog, then we won't be able to print that message.
we had sort of similar type of issue years ago. cpu could receive
STOP_IPI while holding console_sem and we couldn't print anything
(that was before we learned the console_trylock();console_unlock()
trick). if you, on the other hand, can access vmcore, then you know
where to look for the messages anyway.

but let's keep it for later. this nuance is not really important now.

	-ss

--===============7822195548826227593==--

