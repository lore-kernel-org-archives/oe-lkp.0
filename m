Content-Type: multipart/mixed; boundary="===============8795902784010145449=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [tracing] cd8f62b481: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Thu, 02 Apr 2020 16:19:20 +0900
Message-ID: <20200402161920.3b3649cac4cc47a52679d69b@kernel.org>
In-Reply-To: <20200401110401.23cda3b3@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============8795902784010145449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Apr 2020 11:04:01 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 1 Apr 2020 10:21:12 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> =

> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index 6519b7afc499..7f1466253ca8 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -3487,6 +3487,14 @@ struct trace_entry *trace_find_next_entry(struct=
 trace_iterator *iter,
> >  	 */
> >  	if (iter->ent && iter->ent !=3D iter->temp) {
> >  		if (!iter->temp || iter->temp_size < iter->ent_size) {
> > +			/*
> > +			 * This function is only used to add markers between
> > +			 * events that are far apart (see trace_print_lat_context()),
> > +			 * but if this is called in an atomic context (like NMIs)
> > +			 * we can't call kmalloc(), thus just return NULL.
> > +			 */
> > +			if (in_atomic() || irqs_disabled())
> > +				return NULL;
> >  			kfree(iter->temp);
> >  			iter->temp =3D kmalloc(iter->ent_size, GFP_KERNEL);
> >  			if (!iter->temp)
> =

> Peter informed me on IRC not to use in_atomic() as it doesn't catch
> spin_locks when CONFIG_PREEMPT is not defined.
> =

> As the issue is just with ftrace_dump(), I'll have it use a static buffer
> instead of 128 bytes. Which should be big enough for most events, and if
> not, then it will just miss the markers.


That sounds good, but the below patch seems to do different thing.
Does it just makes trace_find_next_entry() always fail if it is
called from ftrace_dump()?

Thank you,

> =

> -- Steve
> =

> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 6519b7afc499..8c9d6a75abbf 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -3472,6 +3472,8 @@ __find_next_entry(struct trace_iterator *iter, int =
*ent_cpu,
>  	return next;
>  }
>  =

> +#define IGNORE_TEMP		((struct trace_iterator *)-1L)
> +
>  /* Find the next real entry, without updating the iterator itself */
>  struct trace_entry *trace_find_next_entry(struct trace_iterator *iter,
>  					  int *ent_cpu, u64 *ent_ts)
> @@ -3480,6 +3482,17 @@ struct trace_entry *trace_find_next_entry(struct t=
race_iterator *iter,
>  	int ent_size =3D iter->ent_size;
>  	struct trace_entry *entry;
>  =

> +	/*
> +	 * This function is only used to add markers between
> +	 * events that are far apart (see trace_print_lat_context()),
> +	 * but if this is called in an atomic context (like NMIs)
> +	 * kmalloc() can't be called.
> +	 * That happens via ftrace_dump() which will initialize
> +	 * iter->temp to IGNORE_TEMP. In such a case, just return NULL.
> +	 */
> +	if (iter->temp =3D=3D IGNORE_TEMP)
> +		return NULL;
> +
>  	/*
>  	 * The __find_next_entry() may call peek_next_entry(), which may
>  	 * call ring_buffer_peek() that may make the contents of iter->ent
> @@ -9203,6 +9216,8 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mo=
de)
>  =

>  	/* Simulate the iterator */
>  	trace_init_global_iter(&iter);
> +	/* Force not using the temp buffer */
> +	iter.temp =3D IGNORE_TEMP;
>  =

>  	for_each_tracing_cpu(cpu) {
>  		atomic_inc(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);


-- =

Masami Hiramatsu <mhiramat@kernel.org>
--===============8795902784010145449==--

