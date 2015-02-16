Content-Type: multipart/mixed; boundary="===============5181094557415666432=="
MIME-Version: 1.0
From: Frederic Weisbecker <fweisbec@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched] BUG: kernel boot hang
Date: Mon, 16 Feb 2015 19:22:38 +0100
Message-ID: <20150216182235.GA20614@lerouge>
In-Reply-To: <20150216150733.GD5029@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5181094557415666432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 04:07:33PM +0100, Peter Zijlstra wrote:
> On Sun, Feb 15, 2015 at 01:18:07PM -0500, Steven Rostedt wrote:
> > On Sun, 15 Feb 2015 16:46:22 +0100
> > Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > index c017a5f..a6d4d6c 100644
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -2879,7 +2879,7 @@ void __sched schedule_preempt_disabled(void)
> > >  	preempt_disable();
> > >  }
> > >  =

> > > -static void preempt_schedule_common(void)
> > > +static void __sched notrace preempt_schedule_common(void)
> > >  {
> > >  	do {
> > >  		preempt_count_add(PREEMPT_ACTIVE);
> > =

> > Ah, since I added better recursion protection code in function tracer
> > this didn't break that. But unfortunately, function graph tracer
> > doesn't have that protection.
> > =

> > If it traces between preempt_schedule() and where it sets
> > PREEMPT_ACTIVE, it can indeed go into an infinite recursion. Yeah,
> > preempt_schedule_common() should be notrace, at least until we change
> > function_graph to have that recursion protection.
> > =

> > Acked-by: Steven Rostedt <rostedt@goodmis.org>
> =

> =

> Can someone shoot me a proper patch with Changelog and such?

Sure, I just sent it as: "[PATCH] sched: Fix preempt_schedule_common() trig=
gering tracing recursion"

Huang Ying hasn't yet reported a Tested-by but I could reproduce (with both=
 function and function_graph tracers btw)
and the patch fixed it.

Thanks.

--===============5181094557415666432==--

