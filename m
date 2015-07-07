Content-Type: multipart/mixed; boundary="===============6992641753275622001=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [trace] kernel BUG at kernel/sched/core.c:2881!
Date: Tue, 07 Jul 2015 15:03:31 -0400
Message-ID: <20150707150331.6181f431@gandalf.local.home>
In-Reply-To: <20150707110627.2a638539@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============6992641753275622001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Jul 2015 11:06:27 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 30 Jun 2015 22:18:03 +0800
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> =

> > Hi Rostedt,
> > =

> > FYI, this merge changes kernel crash to some more obvious kernel BUG
> > message. If it's still not helpful, I can try bisect the old crash
> > or split up the merge and bisect into them.
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > =

> =

> This has been a bug for some time. Does this fix it?
> =


Test this patch instead, this is the one I'm testing and will be
pushing to Linus.

-- Steve

---
 kernel/trace/trace.h        |    1 +
 kernel/trace/trace_branch.c |   13 ++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

Index: linux-trace.git/kernel/trace/trace.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-trace.git.orig/kernel/trace/trace.h	2015-07-07 14:28:27.391715136=
 -0400
+++ linux-trace.git/kernel/trace/trace.h	2015-07-07 14:29:08.133213493 -0400
@@ -444,6 +444,7 @@ enum {
 =

 	TRACE_CONTROL_BIT,
 =

+	TRACE_BRANCH_BIT,
 /*
  * Abuse of the trace_recursion.
  * As we need a way to maintain state if we are tracing the function
Index: linux-trace.git/kernel/trace/trace_branch.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-trace.git.orig/kernel/trace/trace_branch.c	2015-07-07 14:28:27.39=
1715136 -0400
+++ linux-trace.git/kernel/trace/trace_branch.c	2015-07-07 14:56:52.0367642=
40 -0400
@@ -36,9 +36,12 @@ probe_likely_condition(struct ftrace_bra
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
@@ -50,9 +53,9 @@ probe_likely_condition(struct ftrace_bra
 		return;
 =

 	local_irq_save(flags);
-	cpu =3D raw_smp_processor_id();
-	data =3D per_cpu_ptr(tr->trace_buffer.data, cpu);
-	if (atomic_inc_return(&data->disabled) !=3D 1)
+	current->trace_recursion |=3D TRACE_BRANCH_BIT;
+	data =3D this_cpu_ptr(tr->trace_buffer.data);
+	if (atomic_read(&data->disabled))
 		goto out;
 =

 	pc =3D preempt_count();
@@ -81,7 +84,7 @@ probe_likely_condition(struct ftrace_bra
 		__buffer_unlock_commit(buffer, event);
 =

  out:
-	atomic_dec(&data->disabled);
+	current->trace_recursion &=3D ~TRACE_BRANCH_BIT;
 	local_irq_restore(flags);
 }
=20

--===============6992641753275622001==--

