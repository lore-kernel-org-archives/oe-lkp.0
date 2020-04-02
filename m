Content-Type: multipart/mixed; boundary="===============3867153654539786228=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing] cd8f62b481: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Thu, 02 Apr 2020 14:14:40 -0400
Message-ID: <20200402141440.7868465a@gandalf.local.home>
In-Reply-To: <20200402161920.3b3649cac4cc47a52679d69b@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3867153654539786228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Apr 2020 16:19:20 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Wed, 1 Apr 2020 11:04:01 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> =

> > On Wed, 1 Apr 2020 10:21:12 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> >   =

> > > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > > index 6519b7afc499..7f1466253ca8 100644
> > > --- a/kernel/trace/trace.c
> > > +++ b/kernel/trace/trace.c
> > > @@ -3487,6 +3487,14 @@ struct trace_entry *trace_find_next_entry(stru=
ct trace_iterator *iter,
> > >  	 */
> > >  	if (iter->ent && iter->ent !=3D iter->temp) {
> > >  		if (!iter->temp || iter->temp_size < iter->ent_size) {
> > > +			/*
> > > +			 * This function is only used to add markers between
> > > +			 * events that are far apart (see trace_print_lat_context()),
> > > +			 * but if this is called in an atomic context (like NMIs)
> > > +			 * we can't call kmalloc(), thus just return NULL.
> > > +			 */
> > > +			if (in_atomic() || irqs_disabled())
> > > +				return NULL;
> > >  			kfree(iter->temp);
> > >  			iter->temp =3D kmalloc(iter->ent_size, GFP_KERNEL);
> > >  			if (!iter->temp)  =

> > =

> > Peter informed me on IRC not to use in_atomic() as it doesn't catch
> > spin_locks when CONFIG_PREEMPT is not defined.
> > =

> > As the issue is just with ftrace_dump(), I'll have it use a static buff=
er
> > instead of 128 bytes. Which should be big enough for most events, and if
> > not, then it will just miss the markers.  =

> =

> =

> That sounds good, but the below patch seems to do different thing.
> Does it just makes trace_find_next_entry() always fail if it is
> called from ftrace_dump()?

Bah! I send my emails on a different machine than I create the patches on.
Below was my first iteration, then I decided to at least try to print some,
changed it, but never copied the new version over, and ended up sending the
last one.

Here's the actual patch!

-- Steve

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: [PATCH] tracing: Do not allocate buffer in trace_find_next_entry()=
 in
 atomic

When dumping out the trace data in latency format, a check is made to peek
at the next event to compare its timestamp to the current one, and if the
delta is of a greater size, it will add a marker showing so. But to do this,
it needs to save the current event otherwise peeking at the next event will
remove the current event. To save the event, a temp buffer is used, and if
the event is bigger than the temp buffer, the temp buffer is freed and a
bigger buffer is allocated.

This allocation is a problem when called in atomic context. The only way
this gets called via atomic context is via ftrace_dump(). Thus, use a static
buffer of 128 bytes (which covers most events), and if the event is bigger
than that, simply return NULL. The callers of trace_find_next_entry() need
to handle a NULL case, as that's what would happen if the allocation failed.

Link: https://lore.kernel.org/r/20200326091256.GR11705(a)shao2-debian

Fixes: ff895103a84ab ("tracing: Save off entry when peeking at next entry")
Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6519b7afc499..4b7bbfe7f809 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3472,6 +3472,9 @@ __find_next_entry(struct trace_iterator *iter, int *e=
nt_cpu,
 	return next;
 }
 =

+#define STATIC_TEMP_BUF_SIZE	128
+static char static_temp_buf[STATIC_TEMP_BUF_SIZE];
+
 /* Find the next real entry, without updating the iterator itself */
 struct trace_entry *trace_find_next_entry(struct trace_iterator *iter,
 					  int *ent_cpu, u64 *ent_ts)
@@ -3480,13 +3483,26 @@ struct trace_entry *trace_find_next_entry(struct tr=
ace_iterator *iter,
 	int ent_size =3D iter->ent_size;
 	struct trace_entry *entry;
 =

+	/*
+	 * If called from ftrace_dump(), then the iter->temp buffer
+	 * will be the static_temp_buf and not created from kmalloc.
+	 * If the entry size is greater than the buffer, we can
+	 * not save it. Just return NULL in that case. This is only
+	 * used to add markers when two consecutive events' time
+	 * stamps have a large delta. See trace_print_lat_context()
+	 */
+	if (iter->temp =3D=3D static_temp_buf &&
+	    STATIC_TEMP_BUF_SIZE < ent_size)
+		return NULL;
+
 	/*
 	 * The __find_next_entry() may call peek_next_entry(), which may
 	 * call ring_buffer_peek() that may make the contents of iter->ent
 	 * undefined. Need to copy iter->ent now.
 	 */
 	if (iter->ent && iter->ent !=3D iter->temp) {
-		if (!iter->temp || iter->temp_size < iter->ent_size) {
+		if ((!iter->temp || iter->temp_size < iter->ent_size) &&
+		    !WARN_ON_ONCE(iter->temp =3D=3D static_temp_buf)) {
 			kfree(iter->temp);
 			iter->temp =3D kmalloc(iter->ent_size, GFP_KERNEL);
 			if (!iter->temp)
@@ -9203,6 +9219,8 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 =

 	/* Simulate the iterator */
 	trace_init_global_iter(&iter);
+	/* Can not use kmalloc for iter.temp */
+	iter.temp =3D static_temp_buf;
 =

 	for_each_tracing_cpu(cpu) {
 		atomic_inc(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);
-- =

2.20.1

--===============3867153654539786228==--

