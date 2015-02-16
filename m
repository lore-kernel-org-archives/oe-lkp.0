Content-Type: multipart/mixed; boundary="===============3169424997967974966=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] BUG: kernel boot hang
Date: Mon, 16 Feb 2015 16:07:33 +0100
Message-ID: <20150216150733.GD5029@twins.programming.kicks-ass.net>
In-Reply-To: <20150215131807.30c1808c@grimm.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============3169424997967974966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2015 at 01:18:07PM -0500, Steven Rostedt wrote:
> On Sun, 15 Feb 2015 16:46:22 +0100
> Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index c017a5f..a6d4d6c 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -2879,7 +2879,7 @@ void __sched schedule_preempt_disabled(void)
> >  	preempt_disable();
> >  }
> >  =

> > -static void preempt_schedule_common(void)
> > +static void __sched notrace preempt_schedule_common(void)
> >  {
> >  	do {
> >  		preempt_count_add(PREEMPT_ACTIVE);
> =

> Ah, since I added better recursion protection code in function tracer
> this didn't break that. But unfortunately, function graph tracer
> doesn't have that protection.
> =

> If it traces between preempt_schedule() and where it sets
> PREEMPT_ACTIVE, it can indeed go into an infinite recursion. Yeah,
> preempt_schedule_common() should be notrace, at least until we change
> function_graph to have that recursion protection.
> =

> Acked-by: Steven Rostedt <rostedt@goodmis.org>


Can someone shoot me a proper patch with Changelog and such?

--===============3169424997967974966==--

