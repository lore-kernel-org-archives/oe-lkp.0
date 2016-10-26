Content-Type: multipart/mixed; boundary="===============6559740246236508403=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCHv3] perf powerpc: Don't call perf_event_disable from atomic context
Date: Wed, 26 Oct 2016 17:24:55 +0200
Message-ID: <20161026152454.GA1186@krava>
In-Reply-To: <20161026151249.GC3117@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6559740246236508403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2016 at 05:12:49PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 26, 2016 at 11:48:24AM +0200, Jiri Olsa wrote:
> =

> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index c6e47e97b33f..04477983945e 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -1960,6 +1960,13 @@ void perf_event_disable(struct perf_event *event)
> >  }
> >  EXPORT_SYMBOL_GPL(perf_event_disable);
> >  =

> > +void perf_event_disable_inatomic(struct perf_event *event, int kill)
> > +{
> > +	event->pending_kill    =3D kill;
> > +	event->pending_disable =3D 1;
> > +	irq_work_queue(&event->pending);
> > +}
> > +
> >  static void perf_set_shadow_time(struct perf_event *event,
> >  				 struct perf_event_context *ctx,
> >  				 u64 tstamp)
> > @@ -7074,9 +7081,7 @@ static int __perf_event_overflow(struct perf_even=
t *event,
> >  	event->pending_kill =3D POLL_IN;
> >  	if (events && atomic_dec_and_test(&event->event_limit)) {
> >  		ret =3D 1;
> > -		event->pending_kill =3D POLL_HUP;
> > -		event->pending_disable =3D 1;
> > -		irq_work_queue(&event->pending);
> > +		perf_event_disable_inatomic(event, POLL_HUP);
> >  	}
> =

> So the pending_kill stuff is independent of the disable here. No need to
> combine the two. I've change the patch as per the below.
> =

> That is, pending_kill is part of pending_wakeup, not of pending_disable.
> Here we simply use both, its just that on disable we need a different
> kind of wakeup (HANGUP instead of IN).
> =

> See how after ->overflow_handler() we send a wakeup if there's a
> registered signal.

ok, seems good

thanks,
jirka

--===============6559740246236508403==--

