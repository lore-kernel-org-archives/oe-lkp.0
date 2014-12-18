Content-Type: multipart/mixed; boundary="===============3976254546349690566=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: [PATCH] tick/powerclamp: Remove tick_nohz_idle abuse
Date: Thu, 18 Dec 2014 11:51:01 +0100
Message-ID: <alpine.DEB.2.11.1412181110110.17382@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============3976254546349690566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

commit 4dbd27711cd9 "tick: export nohz tick idle symbols for module
use" was merged via the thermal tree without an explicit ack from the
relevant maintainers.

The exports are abused by the intel powerclamp driver which implements
a fake idle state from a sched FIFO task. This causes all kinds of
wreckage in the NOHZ core code which rightfully assumes that
tick_nohz_idle_enter/exit() are only called from the idle task itself.

Recent changes in the NOHZ core lead to a failure of the powerclamp
driver and now people try to hack completely broken and backwards
workarounds into the NOHZ core code. This is completely unacceptable.

The real solution is to fix the powerclamp driver by rewriting it with
a sane concept, but that's beyond the scope of this.

So the only solution for now is to remove the calls into the core NOHZ
code from the powerclamp trainwreck along with the exports.

Fixes: d6d71ee4a14a "PM: Introduce Intel PowerClamp Driver"
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
diff --git a/drivers/thermal/intel_powerclamp.c b/drivers/thermal/intel_pow=
erclamp.c
index b46c706e1cac..e98b4249187c 100644
--- a/drivers/thermal/intel_powerclamp.c
+++ b/drivers/thermal/intel_powerclamp.c
@@ -435,7 +435,6 @@ static int clamp_thread(void *arg)
 		 * allowed. thus jiffies are updated properly.
 		 */
 		preempt_disable();
-		tick_nohz_idle_enter();
 		/* mwait until target jiffies is reached */
 		while (time_before(jiffies, target_jiffies)) {
 			unsigned long ecx =3D 1;
@@ -451,7 +450,6 @@ static int clamp_thread(void *arg)
 			start_critical_timings();
 			atomic_inc(&idle_wakeup_counter);
 		}
-		tick_nohz_idle_exit();
 		preempt_enable();
 	}
 	del_timer_sync(&wakeup_timer);
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 4d54b7540585..1363d58f07e9 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -847,7 +847,6 @@ void tick_nohz_idle_enter(void)
 =

 	local_irq_enable();
 }
-EXPORT_SYMBOL_GPL(tick_nohz_idle_enter);
 =

 /**
  * tick_nohz_irq_exit - update next tick event from interrupt exit
@@ -974,7 +973,6 @@ void tick_nohz_idle_exit(void)
 =

 	local_irq_enable();
 }
-EXPORT_SYMBOL_GPL(tick_nohz_idle_exit);
 =

 static int tick_nohz_reprogram(struct tick_sched *ts, ktime_t now)
 {


--===============3976254546349690566==--

