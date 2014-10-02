Content-Type: multipart/mixed; boundary="===============2113353715390823858=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 15:58:05 +0200
Message-ID: <20141002135805.GF6324@worktop.programming.kicks-ass.net>
In-Reply-To: <20141002135250.GB10583@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2113353715390823858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 03:52:50PM +0200, Peter Zijlstra wrote:
> > If yes, then wakeups from signals don't work either, right?
> =

> Its a kthread, there should not be any signals.

That said, in the tty patch we do appear to have this problem.

Oleg, do we want something like the below on top to make that work
again?

---
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -326,8 +326,10 @@ long wait_woken(wait_queue_t *wait, unsi
 	 * woken_wake_function() such that if we observe WQ_FLAG_WOKEN we must
 	 * also observe all state before the wakeup.
 	 */
-	if (!(wait->flags & WQ_FLAG_WOKEN))
-		timeout =3D schedule_timeout(timeout);
+	if (!(wait->flags & WQ_FLAG_WOKEN)) {
+		if (___wait_is_interruptible(mode) && !signal_pending_state(mode, curren=
t))
+			timeout =3D schedule_timeout(timeout);
+	}
 	__set_current_state(TASK_RUNNING);
 =

 	/*

--===============2113353715390823858==--

