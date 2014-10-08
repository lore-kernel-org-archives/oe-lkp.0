Content-Type: multipart/mixed; boundary="===============3402072992853008009=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: [PATCH] trace: Robustify wait loop
Date: Wed, 08 Oct 2014 18:51:10 +0200
Message-ID: <20141008165110.GA14547@worktop.programming.kicks-ass.net>
In-Reply-To: <20141008163657.GN10832@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3402072992853008009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2014 at 06:36:57PM +0200, Peter Zijlstra wrote:
> =

> Right, I'll send the patch. =



---
Subject: trace: Robustify wait loop
From: Peter Zijlstra (Intel) <peterz@infradead.org>
Date: Wed Oct  8 18:44:26 CEST 2014

The pending nested sleep debugging triggered on the potential stale
TASK_INTERRUPTIBLE in this code.

While there, fix the loop such that we won't revert to a while(1)
yield() 'spin' loop if we ever get a spurious wakeup.

And fix the actual issue by properly terminating the 'wait' loop by
setting TASK_RUNNING.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/trace/trace_events.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -2513,8 +2513,11 @@ static __init int event_test_thread(void
 	kfree(test_malloc);
 =

 	set_current_state(TASK_INTERRUPTIBLE);
-	while (!kthread_should_stop())
+	while (!kthread_should_stop()) {
 		schedule();
+		set_current_state(TASK_INTERRUPTIBLE);
+	}
+	__set_current_state(TASK_RUNNING);
 =

 	return 0;
 }

--===============3402072992853008009==--

