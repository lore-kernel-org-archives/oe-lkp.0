Content-Type: multipart/mixed; boundary="===============1075687921317040200=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [trace] kernel BUG at kernel/sched/core.c:2881!
Date: Tue, 07 Jul 2015 18:37:11 -0400
Message-ID: <20150707183711.3ae23c8b@gandalf.local.home>
In-Reply-To: <20150707150331.6181f431@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============1075687921317040200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Jul 2015 15:03:31 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 7 Jul 2015 11:06:27 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> =

> > On Tue, 30 Jun 2015 22:18:03 +0800
> > Fengguang Wu <fengguang.wu@intel.com> wrote:
> > =

> > > Hi Rostedt,
> > > =

> > > FYI, this merge changes kernel crash to some more obvious kernel BUG
> > > message. If it's still not helpful, I can try bisect the old crash
> > > or split up the merge and bisect into them.
> > > =

> > > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > > =

> > =

> > This has been a bug for some time. Does this fix it?
> > =

> =

> Test this patch instead, this is the one I'm testing and will be
> pushing to Linus.
> =


Um, third time's a charm. Found yet another area that can recurse.

-- Steve

>From efd39d5241abf5bde995b1d324d619cca0a23b71 Mon Sep 17 00:00:00 2001
From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>
Date: Tue, 7 Jul 2015 15:05:03 -0400
Subject: [PATCH] tracing: Have branch tracer use recursive field of task
 struct

Fengguang Wu's tests triggered a bug in the branch tracer's start up
test when CONFIG_DEBUG_PREEMPT set. This was because that config
adds some debug logic in the per cpu field, which calls back into
the branch tracer.

The branch tracer has its own recursive checks, but uses a per cpu
variable to implement it. If retrieving the per cpu variable calls
back into the branch tracer, you can see how things will break.

Instead of using a per cpu variable, use the trace_recursion field
of the current task struct. Simply set a bit when entering the
branch tracing and clear it when leaving. If the bit is set on
entry, just don't do the tracing.

There's also the case with lockdep, as the local_irq_save() called
before the recursion can also trigger code that can call back into
the function. Changing that to a raw_local_irq_save() will protect
that as well.

This prevents the recursion and the inevitable crash that follows.

Link: http://lkml.kernel.org/r/20150630141803.GA28071(a)wfg-t540p.sh.intel.=
com

Cc: stable(a)vger.kernel.org # 3.10+
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.h        |  1 +
 kernel/trace/trace_branch.c | 17 ++++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index f060716b02ae..74bde81601a9 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -444,6 +444,7 @@ enum {
 =

 	TRACE_CONTROL_BIT,
 =

+	TRACE_BRANCH_BIT,
 /*
  * Abuse of the trace_recursion.
  * As we need a way to maintain state if we are tracing the function
diff --git a/kernel/trace/trace_branch.c b/kernel/trace/trace_branch.c
index a87b43f49eb4..e2e12ad3186f 100644
--- a/kernel/trace/trace_branch.c
+++ b/kernel/trace/trace_branch.c
@@ -36,9 +36,12 @@ probe_likely_condition(struct ftrace_branch_data *f, int=
 val, int expect)
 	struct trace_branch *entry;
 	struct ring_buffer *buffer;
 	unsigned long flags;
-	int cpu, pc;
+	int pc;
 	const char *p;
 =

+	if (current->trace_recursion & TRACE_BRANCH_BIT)
+		return;
+
 	/*
 	 * I would love to save just the ftrace_likely_data pointer, but
 	 * this code can also be used by modules. Ugly things can happen
@@ -49,10 +52,10 @@ probe_likely_condition(struct ftrace_branch_data *f, in=
t val, int expect)
 	if (unlikely(!tr))
 		return;
 =

-	local_irq_save(flags);
-	cpu =3D raw_smp_processor_id();
-	data =3D per_cpu_ptr(tr->trace_buffer.data, cpu);
-	if (atomic_inc_return(&data->disabled) !=3D 1)
+	raw_local_irq_save(flags);
+	current->trace_recursion |=3D TRACE_BRANCH_BIT;
+	data =3D this_cpu_ptr(tr->trace_buffer.data);
+	if (atomic_read(&data->disabled))
 		goto out;
 =

 	pc =3D preempt_count();
@@ -81,8 +84,8 @@ probe_likely_condition(struct ftrace_branch_data *f, int =
val, int expect)
 		__buffer_unlock_commit(buffer, event);
 =

  out:
-	atomic_dec(&data->disabled);
-	local_irq_restore(flags);
+	current->trace_recursion &=3D ~TRACE_BRANCH_BIT;
+	raw_local_irq_restore(flags);
 }
 =

 static inline
-- =

1.8.3.1


--===============1075687921317040200==--

