Content-Type: multipart/mixed; boundary="===============0729848828030524970=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [nohz] 2a16fc93d2c: kernel lockup on idle injection
Date: Tue, 16 Dec 2014 15:32:28 +0100
Message-ID: <alpine.DEB.2.11.1412161510000.17382@nanos>
In-Reply-To: <alpine.DEB.2.11.1412161105470.17382@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============0729848828030524970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2014, Thomas Gleixner wrote:
> Now the powerclamp mess is a different story.
> =

> Calling tick_nohz_idle_enter()/exit() from outside the idle task is
> just broken. Period.
> =

> Trying to work around that madness in the core code is just fiddling
> with the symptoms and ignoring the root cause. And the root cause is
> simply that powerclamp calls tick_nohz_idle_enter()/exit().

The only sane solution for that insanity is to rip out the thread code
from powerclamp and replace it with a simple per cpu timer.

timerfn() =

{
   too_hot =3D magic();
   sched_fair_this_cpu_wreckaged(too_hot);   =

   restart_clamp_timer();
}

And have the following in sched

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index df2cdf77f899..d257b62ee533 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4989,6 +4989,34 @@ preempt:
 		set_last_buddy(se);
 }
 =

+#ifdef CONFIG_WRECKAGE_SCHED_FAIR
+static struct static_key wreckage_key =3D STATIC_KEY_INIT;
+static DEFINE_PER_CPU(cpu_is_wreckaged, bool);
+
+void sched_fair_this_cpu_wreckaged(bool wreckaged)
+{
+	this_cpu_write(sched_block_fair, wreckaged);
+}
+
+void sched_fair_cpu_wreckage_control(bool on)
+{
+	if (on)
+		static_key_slow_inc(&wreckage_key);
+	else
+		static_key_slow_dec(&wreckage_key);
+}
+
+static inline bool class_fair_disabled(void)
+{
+	if (static_key_false(&wreckage_key))
+		return false;
+	return this_cpu_read(sched_block_fair);
+}
+
+#else
+static inline bool class_fair_disabled(void) { return false; }
+#endif
+
 static struct task_struct *
 pick_next_task_fair(struct rq *rq, struct task_struct *prev)
 {
@@ -4997,6 +5025,8 @@ pick_next_task_fair(struct rq *rq, struct task_struct=
 *prev)
 	struct task_struct *p;
 	int new_tasks;
 =

+	if (class_fair_disabled())
+		goto idle;
 again:
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	if (!cfs_rq->nr_running)

The static key is enabled once the powerclamp mess starts. So nobody
else than powerclamp users are affected by this and rightfully so.

Not pretty, but better than a gazillion workarounds all over the place
to make "pretending I'm idle" actually work. This is basically the
same mechanism as we have with the RT throttler, where a RT hog will
be put onto hold for some time. We just put all sched other tasks on
hold while still allowing RT tasks and everything else to work.

Thoughts?

Thanks,

	tglx

--===============0729848828030524970==--

