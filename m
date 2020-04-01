Content-Type: multipart/mixed; boundary="===============8077966635769224231=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing] cd8f62b481: BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h
Date: Wed, 01 Apr 2020 10:21:12 -0400
Message-ID: <20200401102112.35036490@gandalf.local.home>
In-Reply-To: <20200401230700.d9ddb42b3459dca98144b55c@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8077966635769224231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Apr 2020 23:07:00 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Hi Steve,
> =

> On Thu, 26 Mar 2020 17:12:56 +0800
> kernel test robot <rong.a.chen@intel.com> wrote:
> =

> > FYI, we noticed the following commit (built with gcc-7):
> > =

> > commit: cd8f62b481530fafbeacee0d3283b60bcf42d854 ("[PATCH 02/12 v2] tra=
cing: Save off entry when peeking at next entry")
> > url: https://github.com/0day-ci/linux/commits/Steven-Rostedt/ring-buffe=
r-tracing-Remove-disabling-of-ring-buffer-while-reading-trace-file/20200320=
-073240
> >   =

> =

> Hmm, this seems that we can not call kmalloc() in ftrace_dump().
> Maybe we can fix it by
> - Use GFP_ATOMIC.
>  or
> - Do not use iter->temp if it is NULL. (it is safe since ftrace_dump() st=
ops tracing)
> =

> What would you think?
> =


Thanks for the reminder, I knew there was something that I had to deal with
and forgot to mark this report!

I already looked at it, and yes, this is an issue, but for PREEMPT_RT even
GFP_ATOMIC will fail. As it's not critical to record it, we can just check
for in atomic and not bother with the allocation.

-- Steve

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6519b7afc499..7f1466253ca8 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3487,6 +3487,14 @@ struct trace_entry *trace_find_next_entry(struct tra=
ce_iterator *iter,
 	 */
 	if (iter->ent && iter->ent !=3D iter->temp) {
 		if (!iter->temp || iter->temp_size < iter->ent_size) {
+			/*
+			 * This function is only used to add markers between
+			 * events that are far apart (see trace_print_lat_context()),
+			 * but if this is called in an atomic context (like NMIs)
+			 * we can't call kmalloc(), thus just return NULL.
+			 */
+			if (in_atomic() || irqs_disabled())
+				return NULL;
 			kfree(iter->temp);
 			iter->temp =3D kmalloc(iter->ent_size, GFP_KERNEL);
 			if (!iter->temp)
--===============8077966635769224231==--

