Content-Type: multipart/mixed; boundary="===============2380601464544089934=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] trace: Robustify wait loop
Date: Wed, 08 Oct 2014 13:52:16 -0400
Message-ID: <20141008135216.76142204@gandalf.local.home>
In-Reply-To: <20141008165110.GA14547@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2380601464544089934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Oct 2014 18:51:10 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Oct 08, 2014 at 06:36:57PM +0200, Peter Zijlstra wrote:
> > =

> > Right, I'll send the patch. =

> =

> =


I'll see if I can get this in this merge window before I leave to
Dusseldorf.

BTW, what do you think of this solution? Feel free to ack it if you
like it.

-- Steve

diff --git a/kernel/trace/trace_selftest.c b/kernel/trace/trace_selftest.c
index 5ef60499dc8e..593f52b73551 100644
--- a/kernel/trace/trace_selftest.c
+++ b/kernel/trace/trace_selftest.c
@@ -1025,6 +1025,12 @@ trace_selftest_startup_nop(struct tracer *trace, str=
uct trace_array *tr)
 #endif
 =

 #ifdef CONFIG_SCHED_TRACER
+
+struct wakeup_test_data {
+	struct completion	is_ready;
+	int			go;
+};
+
 static int trace_wakeup_test_thread(void *data)
 {
 	/* Make this a -deadline thread */
@@ -1034,51 +1040,56 @@ static int trace_wakeup_test_thread(void *data)
 		.sched_deadline =3D 10000000ULL,
 		.sched_period =3D 10000000ULL
 	};
-	struct completion *x =3D data;
+	struct wakeup_test_data *x =3D data;
 =

 	sched_setattr(current, &attr);
 =

 	/* Make it know we have a new prio */
-	complete(x);
+	complete(&x->is_ready);
 =

 	/* now go to sleep and let the test wake us up */
 	set_current_state(TASK_INTERRUPTIBLE);
-	schedule();
+	while (!x->go) {
+		schedule();
+		set_current_state(TASK_INTERRUPTIBLE);
+	}
 =

-	complete(x);
+	complete(&x->is_ready);
+
+	set_current_state(TASK_INTERRUPTIBLE);
 =

 	/* we are awake, now wait to disappear */
 	while (!kthread_should_stop()) {
-		/*
-		 * This will likely be the system top priority
-		 * task, do short sleeps to let others run.
-		 */
-		msleep(100);
+		schedule();
+		set_current_state(TASK_INTERRUPTIBLE);
 	}
 =

+	__set_current_state(TASK_RUNNING);
+
 	return 0;
 }
-
 int
 trace_selftest_startup_wakeup(struct tracer *trace, struct trace_array *tr)
 {
 	unsigned long save_max =3D tr->max_latency;
 	struct task_struct *p;
-	struct completion is_ready;
+	struct wakeup_test_data data;
 	unsigned long count;
 	int ret;
 =

-	init_completion(&is_ready);
+	memset(&data, 0, sizeof(data));
+
+	init_completion(&data.is_ready);
 =

 	/* create a -deadline thread */
-	p =3D kthread_run(trace_wakeup_test_thread, &is_ready, "ftrace-test");
+	p =3D kthread_run(trace_wakeup_test_thread, &data, "ftrace-test");
 	if (IS_ERR(p)) {
 		printk(KERN_CONT "Failed to create ftrace wakeup test thread ");
 		return -1;
 	}
 =

 	/* make sure the thread is running at -deadline policy */
-	wait_for_completion(&is_ready);
+	wait_for_completion(&data.is_ready);
 =

 	/* start the tracing */
 	ret =3D tracer_init(trace, tr);
@@ -1099,18 +1110,20 @@ trace_selftest_startup_wakeup(struct tracer *trace,=
 struct trace_array *tr)
 		msleep(100);
 	}
 =

-	init_completion(&is_ready);
+	init_completion(&data.is_ready);
+
+	data.go =3D 1;
+	/* memory barrier is in the wake_up_process() */
 =

 	wake_up_process(p);
 =

 	/* Wait for the task to wake up */
-	wait_for_completion(&is_ready);
+	wait_for_completion(&data.is_ready);
 =

 	/* stop the tracing. */
 	tracing_stop();
 	/* check both trace buffers */
 	ret =3D trace_test_buffer(&tr->trace_buffer, NULL);
-	printk("ret =3D %d\n", ret);
 	if (!ret)
 		ret =3D trace_test_buffer(&tr->max_buffer, &count);
=20

--===============2380601464544089934==--

