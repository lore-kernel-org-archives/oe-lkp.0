Content-Type: multipart/mixed; boundary="===============7744445646680596137=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Thu, 02 Oct 2014 18:57:39 +0200
Message-ID: <20141002165739.GC10583@worktop.programming.kicks-ass.net>
In-Reply-To: <542D5E3B.6000309@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7744445646680596137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 10:16:27AM -0400, Peter Hurley wrote:
> That's what I meant. And the module load patch too.

Ah, my bad. I thought you were talking about the rfcomm thing.

In any case, if we change wait_woken() like the below, then we can
simplify the loops by taking out their signal_pending checks and using
the wait_woken() return value instead.

---
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -326,8 +326,14 @@ long wait_woken(wait_queue_t *wait, unsi
 	 * woken_wake_function() such that if we observe WQ_FLAG_WOKEN we must
 	 * also observe all state before the wakeup.
 	 */
-	if (!(wait->flags & WQ_FLAG_WOKEN))
-		timeout =3D schedule_timeout(timeout);
+	if (!(wait->flags & WQ_FLAG_WOKEN)) {
+		if (___wait_is_interruptible(mode)) {
+		       if (signal_pending_state(mode, current))
+			       timeout =3D -ERESTARTSYS;
+		       else
+			       timeout =3D schedule_timeout(timeout);
+		}
+	}
 	__set_current_state(TASK_RUNNING);
 =

 	/*

--===============7744445646680596137==--

