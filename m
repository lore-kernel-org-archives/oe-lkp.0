Content-Type: multipart/mixed; boundary="===============7609605914614754195=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] tracing: Avoid adding duplicated tracer options when update_tracer_options is running in parallel
Date: Wed, 23 Mar 2022 10:28:31 -0400
Message-ID: <20220323102831.1cf884d6@gandalf.local.home>
In-Reply-To: <20220323142129.4175-1-mark-pk.tsai@mediatek.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7609605914614754195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Mar 2022 22:21:29 +0800
Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:

> > On Wed, 23 Mar 2022 11:24:42 +0800
> > Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> >   =

> > > When update_tracer_options is running in parallel,
> > > tr->tops might be updated before the trace_types list traversal.
> > > Let update_tracer_options traverse the trace_types list safely in
> > > kernel init time and avoid the tr->tops update before it finish.  =

> > =

> > ??? Have you seen a bug here? I'm totally confused by this.  =

> =

> Sorry to make you confused.
> =

> After the below patch, update_tracer_options might be executed later than=
 registering
> hwlat_tracer, which is in late_initcall.
> =

> https://lore.kernel.org/lkml/20220316151639.9216-1-mark-pk.tsai(a)mediate=
k.com/

If you send patches that depend on patches that are not in the tree, you
need to explicitly state that.


> =

> The init_hwlat_tracer initcall will put hwlat_tracer to tr->tops.
> Then when the later arrived __update_tracer_options is trying to
> update all the tracer options, create_trace_option_files show the
> below warning because hwlat_tracer is already in the list.
> =

> [ 6.680068 ][ T7 ] WARNING: CPU: 0 PID: 7 at kernel/trace/trace.c:8899 cr=
eate_trace_option_files (kernel/trace/trace.c:8899 (discriminator 1))
> =

> full log: https://lore.kernel.org/lkml/20220322133339.GA32582(a)xsang-Opt=
iPlex-9020/

So this is all dependent on patches not in the tree?

> =

> =

> >   =

> > > =

> > > Link: https://lore.kernel.org/lkml/20220322133339.GA32582(a)xsang-Opt=
iPlex-9020/
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > ---
> > >  kernel/trace/trace.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > =

> > > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > > index adb37e437a05..2974ae056068 100644
> > > --- a/kernel/trace/trace.c
> > > +++ b/kernel/trace/trace.c
> > > @@ -6317,12 +6317,18 @@ static void tracing_set_nop(struct trace_arra=
y *tr)
> > >  	tr->current_trace =3D &nop_trace;
> > >  }
> > >  =

> > > +static bool tracer_options_updated;
> > > +
> > >  static void add_tracer_options(struct trace_array *tr, struct tracer=
 *t)
> > >  {
> > >  	/* Only enable if the directory has been created already. */
> > >  	if (!tr->dir)
> > >  		return;
> > >  =

> > > +	/* Only create trace option files after update_tracer_options finis=
h */
> > > +	if (!tracer_options_updated)
> > > +		return;
> > > +
> > >  	create_trace_option_files(tr, t);
> > >  }
> > >  =

> > > @@ -9133,6 +9139,7 @@ static void update_tracer_options(struct trace_=
array *tr)
> > >  {
> > >  	mutex_lock(&trace_types_lock);  =

> > =

> > How is update_trace_options run in parallel?
> > =

> > There's a mutex that protects it. =

> >   =

> =

> Oh sorry.
> What I trying to tell is that update_trace_options is run in parallel with
> the initcall thread after:
> =

> https://lore.kernel.org/lkml/20220316151639.9216-1-mark-pk.tsai(a)mediate=
k.com/
> =


Again, this is not in the tree, so it should be part of that patch series,
which I haven't yet been able to fully review.

-- Steve
--===============7609605914614754195==--

