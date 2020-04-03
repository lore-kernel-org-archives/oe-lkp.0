Content-Type: multipart/mixed; boundary="===============7810353205232404230=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing] cd8f62b481: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Fri, 03 Apr 2020 09:16:42 -0400
Message-ID: <20200403091642.5ce182f1@gandalf.local.home>
In-Reply-To: <20200403154702.bc3478c84d70fb48b07d9985@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7810353205232404230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Apr 2020 15:47:02 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> > +#define STATIC_TEMP_BUF_SIZE	128
> > +static char static_temp_buf[STATIC_TEMP_BUF_SIZE];
> > +
> >  /* Find the next real entry, without updating the iterator itself */
> >  struct trace_entry *trace_find_next_entry(struct trace_iterator *iter,
> >  					  int *ent_cpu, u64 *ent_ts)
> > @@ -3480,13 +3483,26 @@ struct trace_entry *trace_find_next_entry(struc=
t trace_iterator *iter,
> >  	int ent_size =3D iter->ent_size;
> >  	struct trace_entry *entry;
> >  =

> > +	/*
> > +	 * If called from ftrace_dump(), then the iter->temp buffer
> > +	 * will be the static_temp_buf and not created from kmalloc.
> > +	 * If the entry size is greater than the buffer, we can
> > +	 * not save it. Just return NULL in that case. This is only
> > +	 * used to add markers when two consecutive events' time
> > +	 * stamps have a large delta. See trace_print_lat_context()
> > +	 */
> > +	if (iter->temp =3D=3D static_temp_buf &&
> > +	    STATIC_TEMP_BUF_SIZE < ent_size)
> > +		return NULL;
> > +
> >  	/*
> >  	 * The __find_next_entry() may call peek_next_entry(), which may
> >  	 * call ring_buffer_peek() that may make the contents of iter->ent
> >  	 * undefined. Need to copy iter->ent now.
> >  	 */
> >  	if (iter->ent && iter->ent !=3D iter->temp) {
> > -		if (!iter->temp || iter->temp_size < iter->ent_size) {
> > +		if ((!iter->temp || iter->temp_size < iter->ent_size) &&
> > +		    !WARN_ON_ONCE(iter->temp =3D=3D static_temp_buf)) {  =

> =

> This must not happen because ent_size =3D=3D iter->ent_size.
> If it happens, it should return NULL without any trial of kfree() and
> kmalloc(), becuase it will cause illegal freeing memory and memory leak.
> (Note that the iter->temp never be freed in ftrace_dump() path)

Correct, which is why there's a ! in there. It's a paranoid check which
should never trigger, which is why there's a WARN_ON_ONCE() there. But as
the "!" is not easy to see, the above is the same logic as:

	if ((!iter->temp || iter->temp_size < iter->ent_size) &&
	    (iter->temp !=3D static_temp_buf)) {

Thus, if we get to that test against static_temp_buf, and it's true, then
we will trigger the WARN_ON, but it wont call the kfree().

> =

> Anyway, this condition is completery same as above return code.
> =

> >  			kfree(iter->temp);
> >  			iter->temp =3D kmalloc(iter->ent_size, GFP_KERNEL);
> >  			if (!iter->temp)
> > @@ -9203,6 +9219,8 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_=
mode)
> >  =

> >  	/* Simulate the iterator */
> >  	trace_init_global_iter(&iter);
> > +	/* Can not use kmalloc for iter.temp */
> > +	iter.temp =3D static_temp_buf;
> >    =

> =

> You may miss initializing temp_size here.
> =

> 	iter.temp_size =3D STATIC_TEMP_BUF_SIZE;

Oh, damn! You're right.

> =

> BTW, as I pointed, if the iter->temp is for avoiding the data overwritten
> by ringbuffer writer, would we need to use it for ftrace_dump() too?
> It seems that ftrace_dump() stops tracing.

Yes, it is still needed. That's because the old way use to just leave the
iter->ent pointing into the ring buffer itself. The new way, the ring
buffer makes a copy of the event, and passes that back. When you do another
read, it overwrites the copy. It doesn't matter if the ring buffer is
stopped or not.

-- Steve
--===============7810353205232404230==--

