Content-Type: multipart/mixed; boundary="===============0376610015899482186=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [kprobes/x86] a19b2e3d78: WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_off_caller
Date: Mon, 02 Oct 2017 18:05:43 +0200
Message-ID: <20171002160543.5d35jgxxfa4bftnu@hirez.programming.kicks-ass.net>
In-Reply-To: <20171003004605.8da2be5a86be135f792d29bd@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0376610015899482186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 12:46:05AM +0900, Masami Hiramatsu wrote:
> On Mon, 2 Oct 2017 09:33:16 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:

> > > [   87.018115] Call Trace:
> > > [   87.025046]  trace_hardirqs_off+0xd/0xf
> > > [   87.034185]  setjmp_pre_handler+0x6c/0x95
> > > [   87.043738]  kprobe_ftrace_handler+0xc3/0xf4
> > =

> > =

> > So setjmp_pre_handler() does:
> > =

> > 	regs->flags &=3D ~X86_EFLAGS_IF;
> > 	trace_hardirqs_off();
> > 	regs->ip =3D (unsigned long)(jp->entry);
> > =

> > Which clears IF on the regs, but those will only take effect after an
> > IRET, not instantly. This messes up he IRQ state tracing, which you're
> > telling it will instantly disable IRQs.
> =

> Thanks for analyzing!
> And right, since IRQ should be off while jump handler, it changes
> regs->flags. (but ...why?)

Otherwise the IRET could re-enable interrupts?

> > A possible 'fix' would be to do local_irq_disable() in front of that,
> > but I got pretty lost in that stuff so I can't say for sure if that
> > makes sense or not.
> =

> I'm not sure how lockdep traces irq-disabling state, but it seems
> that "enabling" irq state(trace_hardirqs_on()) is already missing
> from kprobes.

If you could point me at where that is supposed to happen I can have a
look at how that tracing works. I got lost in the code this morning.

> I'm considering to remove disabling-irq itself from jprobe.
> (Frankly to say, I would like to remove jprobe itself...)

That would obviously also solve all problems :-)

--===============0376610015899482186==--

