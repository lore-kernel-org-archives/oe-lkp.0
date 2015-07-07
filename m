Content-Type: multipart/mixed; boundary="===============0428064359921658262=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [trace] kernel BUG at kernel/sched/core.c:2881!
Date: Tue, 07 Jul 2015 11:06:27 -0400
Message-ID: <20150707110627.2a638539@gandalf.local.home>
In-Reply-To: <20150630141803.GA28071@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0428064359921658262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Jun 2015 22:18:03 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Rostedt,
> =

> FYI, this merge changes kernel crash to some more obvious kernel BUG
> message. If it's still not helpful, I can try bisect the old crash
> or split up the merge and bisect into them.
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =


This has been a bug for some time. Does this fix it?

-- Steve

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
index a87b43f49eb4..720ed604882e 100644
--- a/kernel/trace/trace_branch.c
+++ b/kernel/trace/trace_branch.c
@@ -49,7 +49,11 @@ probe_likely_condition(struct ftrace_branch_data *f, int=
 val, int expect)
 	if (unlikely(!tr))
 		return;
 =

+	if (current->trace_recursion & TRACE_BRANCH_BIT)
+		return;
+
 	local_irq_save(flags);
+	current->trace_recursion |=3D TRACE_BRANCH_BIT;
 	cpu =3D raw_smp_processor_id();
 	data =3D per_cpu_ptr(tr->trace_buffer.data, cpu);
 	if (atomic_inc_return(&data->disabled) !=3D 1)
@@ -82,6 +86,7 @@ probe_likely_condition(struct ftrace_branch_data *f, int =
val, int expect)
 =

  out:
 	atomic_dec(&data->disabled);
+	current->trace_recursion &=3D ~TRACE_BRANCH_BIT;
 	local_irq_restore(flags);
 }
=20

--===============0428064359921658262==--

