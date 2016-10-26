Content-Type: multipart/mixed; boundary="===============6361384926756183033=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: [PATCHv3] perf powerpc: Don't call perf_event_disable from atomic context
Date: Wed, 26 Oct 2016 11:48:24 +0200
Message-ID: <20161026094824.GA21397@krava>
In-Reply-To: <87mvhroo8c.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6361384926756183033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2016 at 10:09:23AM +0800, Huang, Ying wrote:

SNIP

> > ARGH... so what is the normal metric for this test and did that change?
> > And why can't I still find that? These reports suck!
> =

> There is observable changes between the benchmark (will-it-scale)
> scores.  That is said in the subject of the mail: "[No primary
> change]".  But apparently, that is not clear.  We will improve that to
> make it more clear.
> =

> > The result doesn't make sense, my gcc inlines the function call, the
> > emitted code is very similar to the old code, with exception of one
> > extra symbol.
> >
> > Are you sure this isn't simple run to run variation?
> =

> The reported change is perf-stat.branch-miss-rate%, which is changed
> from 0.19% to 0.21%.  That is too small.  So, please ignore this
> report.  We will be more careful in the future.
> =


hi,
thanks for clarification

attaching v3 patch with complete changelog,
I tested and seems to work fine

thanks,
jirka


---
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

Adding new function for that:
  perf_event_disable_inatomic(event, kill)

Reported-by: Jan Stancek <jstancek@redhat.com>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 arch/powerpc/kernel/hw_breakpoint.c |  2 +-
 include/linux/perf_event.h          |  1 +
 kernel/events/core.c                | 11 ++++++++---
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_b=
reakpoint.c
index 9781c69eae57..58024eecbd9e 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -275,7 +275,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	if (!stepped) {
 		WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
 			"0x%lx will be disabled.", info->address);
-		perf_event_disable(bp);
+		perf_event_disable_inatomic(bp, 0);
 		goto out;
 	}
 	/*
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 060d0ede88df..055bc837bfc1 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1257,6 +1257,7 @@ extern u64 perf_swevent_set_period(struct perf_event =
*event);
 extern void perf_event_enable(struct perf_event *event);
 extern void perf_event_disable(struct perf_event *event);
 extern void perf_event_disable_local(struct perf_event *event);
+extern void perf_event_disable_inatomic(struct perf_event *event, int kill=
);
 extern void perf_event_task_tick(void);
 #else /* !CONFIG_PERF_EVENTS: */
 static inline void *
diff --git a/kernel/events/core.c b/kernel/events/core.c
index c6e47e97b33f..04477983945e 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1960,6 +1960,13 @@ void perf_event_disable(struct perf_event *event)
 }
 EXPORT_SYMBOL_GPL(perf_event_disable);
 =

+void perf_event_disable_inatomic(struct perf_event *event, int kill)
+{
+	event->pending_kill    =3D kill;
+	event->pending_disable =3D 1;
+	irq_work_queue(&event->pending);
+}
+
 static void perf_set_shadow_time(struct perf_event *event,
 				 struct perf_event_context *ctx,
 				 u64 tstamp)
@@ -7074,9 +7081,7 @@ static int __perf_event_overflow(struct perf_event *e=
vent,
 	event->pending_kill =3D POLL_IN;
 	if (events && atomic_dec_and_test(&event->event_limit)) {
 		ret =3D 1;
-		event->pending_kill =3D POLL_HUP;
-		event->pending_disable =3D 1;
-		irq_work_queue(&event->pending);
+		perf_event_disable_inatomic(event, POLL_HUP);
 	}
 =

 	READ_ONCE(event->overflow_handler)(event, data, regs);
-- =

2.7.4


--===============6361384926756183033==--

