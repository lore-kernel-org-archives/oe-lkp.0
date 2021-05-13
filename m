Content-Type: multipart/mixed; boundary="===============8705403772146198428=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [entry] 47b8ff194c: will-it-scale.per_process_ops -3.0% regression
Date: Thu, 13 May 2021 10:19:21 +0200
Message-ID: <YJzhCX/CqrMQDB+y@hirez.programming.kicks-ass.net>
In-Reply-To: <20210428071653.GC13086@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8705403772146198428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 03:16:53PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -3.0% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> =

> commit: 47b8ff194c1fd73d58dc339b597d466fe48c8958 ("entry: Explicitly flus=
h pending rcuog wakeup before last rescheduling point")

So the RCU bits are in rcu_user_enter(), which is called from
__context_tracking_enter() aka user_enter(), which is under
context_tracking_enabled().

But the new code in entry is not; we now unconditionally call
rcu_nocb_flush_deferred_wakeup(). Did that want to be under
context_tracking_enabled() as well?

Frederic, Paul?

---

diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 9455476c5ba2..f4df001410fc 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -114,7 +114,12 @@ static inline void rcu_user_exit(void) { }
 void rcu_init_nohz(void);
 int rcu_nocb_cpu_offload(int cpu);
 int rcu_nocb_cpu_deoffload(int cpu);
-void rcu_nocb_flush_deferred_wakeup(void);
+void __rcu_nocb_flush_deferred_wakeup(void);
+static inline void rcu_nocb_flush_deferred_wakeup(void)
+{
+	if (context_tracking_enabled())
+		__rcu_nocb_flush_deferred_wakeup();
+}
 #else /* #ifdef CONFIG_RCU_NOCB_CPU */
 static inline void rcu_init_nohz(void) { }
 static inline int rcu_nocb_cpu_offload(int cpu) { return -EINVAL; }
diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index ad0156b86937..3cdbbf7fba01 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -2378,7 +2378,7 @@ static bool do_nocb_deferred_wakeup(struct rcu_data *=
rdp)
 	return false;
 }
 =

-void rcu_nocb_flush_deferred_wakeup(void)
+void __rcu_nocb_flush_deferred_wakeup(void)
 {
 	do_nocb_deferred_wakeup(this_cpu_ptr(&rcu_data));
 }

--===============8705403772146198428==--

