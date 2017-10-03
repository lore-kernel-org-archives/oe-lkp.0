Content-Type: multipart/mixed; boundary="===============0025320607359575047=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [kprobes/x86] a19b2e3d78: WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_off_caller
Date: Tue, 03 Oct 2017 10:10:12 +0900
Message-ID: <20171003101012.12cee3b5f7085ddbd0d63fb8@kernel.org>
In-Reply-To: <20171002160543.5d35jgxxfa4bftnu@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0025320607359575047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Oct 2017 18:05:43 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Tue, Oct 03, 2017 at 12:46:05AM +0900, Masami Hiramatsu wrote:
> > On Mon, 2 Oct 2017 09:33:16 +0200
> > Peter Zijlstra <peterz@infradead.org> wrote:
> =

> > > > [   87.018115] Call Trace:
> > > > [   87.025046]  trace_hardirqs_off+0xd/0xf
> > > > [   87.034185]  setjmp_pre_handler+0x6c/0x95
> > > > [   87.043738]  kprobe_ftrace_handler+0xc3/0xf4
> > > =

> > > =

> > > So setjmp_pre_handler() does:
> > > =

> > > 	regs->flags &=3D ~X86_EFLAGS_IF;
> > > 	trace_hardirqs_off();
> > > 	regs->ip =3D (unsigned long)(jp->entry);
> > > =

> > > Which clears IF on the regs, but those will only take effect after an
> > > IRET, not instantly. This messes up he IRQ state tracing, which you're
> > > telling it will instantly disable IRQs.
> > =

> > Thanks for analyzing!
> > And right, since IRQ should be off while jump handler, it changes
> > regs->flags. (but ...why?)
> =

> Otherwise the IRET could re-enable interrupts?

Ah, I meant why IRQ should be disabled... It doesn't guarantee to
avoid nested kprobes (since another kprobe can be hit in jprobe
handler).

> > > A possible 'fix' would be to do local_irq_disable() in front of that,
> > > but I got pretty lost in that stuff so I can't say for sure if that
> > > makes sense or not.
> > =

> > I'm not sure how lockdep traces irq-disabling state, but it seems
> > that "enabling" irq state(trace_hardirqs_on()) is already missing
> > from kprobes.
> =

> If you could point me at where that is supposed to happen I can have a
> look at how that tracing works. I got lost in the code this morning.

The right place to decrement irq counter(trace_hardirqs_on()) should
be longjmp_break_handler(), which recovers flags register with other
registers from kcb->jprobe_saved_regs, and IRET recovers IF.
(maybe it doesn't count inc/dec correctly, isn't it?)

> > I'm considering to remove disabling-irq itself from jprobe.
> > (Frankly to say, I would like to remove jprobe itself...)
> =

> That would obviously also solve all problems :-)

Yeah, for long term it needs to be removed :)

Thank you,

-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============0025320607359575047==--

