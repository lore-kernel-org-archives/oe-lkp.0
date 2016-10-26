Content-Type: multipart/mixed; boundary="===============3994155725133632859=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCHv3] perf powerpc: Don't call perf_event_disable from atomic context
Date: Wed, 26 Oct 2016 17:12:49 +0200
Message-ID: <20161026151249.GC3117@twins.programming.kicks-ass.net>
In-Reply-To: <20161026094824.GA21397@krava>
List-Id: <oe-lkp.lists.linux.dev>

--===============3994155725133632859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2016 at 11:48:24AM +0200, Jiri Olsa wrote:

> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index c6e47e97b33f..04477983945e 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -1960,6 +1960,13 @@ void perf_event_disable(struct perf_event *event)
>  }
>  EXPORT_SYMBOL_GPL(perf_event_disable);
>  =

> +void perf_event_disable_inatomic(struct perf_event *event, int kill)
> +{
> +	event->pending_kill    =3D kill;
> +	event->pending_disable =3D 1;
> +	irq_work_queue(&event->pending);
> +}
> +
>  static void perf_set_shadow_time(struct perf_event *event,
>  				 struct perf_event_context *ctx,
>  				 u64 tstamp)
> @@ -7074,9 +7081,7 @@ static int __perf_event_overflow(struct perf_event =
*event,
>  	event->pending_kill =3D POLL_IN;
>  	if (events && atomic_dec_and_test(&event->event_limit)) {
>  		ret =3D 1;
> -		event->pending_kill =3D POLL_HUP;
> -		event->pending_disable =3D 1;
> -		irq_work_queue(&event->pending);
> +		perf_event_disable_inatomic(event, POLL_HUP);
>  	}

So the pending_kill stuff is independent of the disable here. No need to
combine the two. I've change the patch as per the below.

That is, pending_kill is part of pending_wakeup, not of pending_disable.
Here we simply use both, its just that on disable we need a different
kind of wakeup (HANGUP instead of IN).

See how after ->overflow_handler() we send a wakeup if there's a
registered signal.

---
Subject: perf powerpc: Don't call perf_event_disable from atomic context
From: Jiri Olsa <jolsa@redhat.com>
Date: Wed, 26 Oct 2016 11:48:24 +0200

The trinity syscall fuzzer triggered following WARN on powerpc:
  WARNING: CPU: 9 PID: 2998 at arch/powerpc/kernel/hw_breakpoint.c:278
  ...
  NIP [c00000000093aedc] .hw_breakpoint_handler+0x28c/0x2b0
  LR [c00000000093aed8] .hw_breakpoint_handler+0x288/0x2b0
  Call Trace:
  [c0000002f7933580] [c00000000093aed8] .hw_breakpoint_handler+0x288/0x2b0 =
(unreliable)
  [c0000002f7933630] [c0000000000f671c] .notifier_call_chain+0x7c/0xf0
  [c0000002f79336d0] [c0000000000f6abc] .__atomic_notifier_call_chain+0xbc/=
0x1c0
  [c0000002f7933780] [c0000000000f6c40] .notify_die+0x70/0xd0
  [c0000002f7933820] [c00000000001a74c] .do_break+0x4c/0x100
  [c0000002f7933920] [c0000000000089fc] handle_dabr_fault+0x14/0x48

Followed by lockdep warning:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  [ INFO: suspicious RCU usage. ]
  4.8.0-rc5+ #7 Tainted: G        W
  -------------------------------
  ./include/linux/rcupdate.h:556 Illegal context switch in RCU read-side cr=
itical section!

  other info that might help us debug this:

  rcu_scheduler_active =3D 1, debug_locks =3D 0
  2 locks held by ls/2998:
   #0:  (rcu_read_lock){......}, at: [<c0000000000f6a00>] .__atomic_notifie=
r_call_chain+0x0/0x1c0
   #1:  (rcu_read_lock){......}, at: [<c00000000093ac50>] .hw_breakpoint_ha=
ndler+0x0/0x2b0

  stack backtrace:
  CPU: 9 PID: 2998 Comm: ls Tainted: G        W       4.8.0-rc5+ #7
  Call Trace:
  [c0000002f7933150] [c00000000094b1f8] .dump_stack+0xe0/0x14c (unreliable)
  [c0000002f79331e0] [c00000000013c468] .lockdep_rcu_suspicious+0x138/0x180
  [c0000002f7933270] [c0000000001005d8] .___might_sleep+0x278/0x2e0
  [c0000002f7933300] [c000000000935584] .mutex_lock_nested+0x64/0x5a0
  [c0000002f7933410] [c00000000023084c] .perf_event_ctx_lock_nested+0x16c/0=
x380
  [c0000002f7933500] [c000000000230a80] .perf_event_disable+0x20/0x60
  [c0000002f7933580] [c00000000093aeec] .hw_breakpoint_handler+0x29c/0x2b0
  [c0000002f7933630] [c0000000000f671c] .notifier_call_chain+0x7c/0xf0
  [c0000002f79336d0] [c0000000000f6abc] .__atomic_notifier_call_chain+0xbc/=
0x1c0
  [c0000002f7933780] [c0000000000f6c40] .notify_die+0x70/0xd0
  [c0000002f7933820] [c00000000001a74c] .do_break+0x4c/0x100
  [c0000002f7933920] [c0000000000089fc] handle_dabr_fault+0x14/0x48

While it looks like the first WARN is probably valid, the other one is
triggered by disabling event via perf_event_disable from atomic context.

The event is disabled here in case we were not able to emulate
the instruction that hit the breakpoint. By disabling the event
we unschedule the event and make sure it's not scheduled back.

But we can't call perf_event_disable from atomic context, instead
we need to use event's pending_disable irq_work way to disable it.

Cc: Michael Neuling <mikey@neuling.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: "Huang Ying" <ying.huang@intel.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Reported-by: Jan Stancek <jstancek@redhat.com>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: http://lkml.kernel.org/r/20161026094824.GA21397(a)krava
---
 arch/powerpc/kernel/hw_breakpoint.c |    2 +-
 include/linux/perf_event.h          |    1 +
 kernel/events/core.c                |   10 ++++++++--
 3 files changed, 10 insertions(+), 3 deletions(-)

--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -275,7 +275,7 @@ int hw_breakpoint_handler(struct die_arg
 	if (!stepped) {
 		WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
 			"0x%lx will be disabled.", info->address);
-		perf_event_disable(bp);
+		perf_event_disable_inatomic(bp);
 		goto out;
 	}
 	/*
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1257,6 +1257,7 @@ extern u64 perf_swevent_set_period(struc
 extern void perf_event_enable(struct perf_event *event);
 extern void perf_event_disable(struct perf_event *event);
 extern void perf_event_disable_local(struct perf_event *event);
+extern void perf_event_disable_inatomic(struct perf_event *event);
 extern void perf_event_task_tick(void);
 #else /* !CONFIG_PERF_EVENTS: */
 static inline void *
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1960,6 +1960,12 @@ void perf_event_disable(struct perf_even
 }
 EXPORT_SYMBOL_GPL(perf_event_disable);
 =

+void perf_event_disable_inatomic(struct perf_event *event)
+{
+	event->pending_disable =3D 1;
+	irq_work_queue(&event->pending);
+}
+
 static void perf_set_shadow_time(struct perf_event *event,
 				 struct perf_event_context *ctx,
 				 u64 tstamp)
@@ -7075,8 +7081,8 @@ static int __perf_event_overflow(struct
 	if (events && atomic_dec_and_test(&event->event_limit)) {
 		ret =3D 1;
 		event->pending_kill =3D POLL_HUP;
-		event->pending_disable =3D 1;
-		irq_work_queue(&event->pending);
+
+		perf_event_disable_inatomic(event);
 	}
 =

 	READ_ONCE(event->overflow_handler)(event, data, regs);

--===============3994155725133632859==--

