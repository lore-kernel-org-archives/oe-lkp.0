Content-Type: multipart/mixed; boundary="===============5391643181999038304=="
MIME-Version: 1.0
From: gregkh@linuxfoundation.org
To: lkp@lists.01.org
Subject: FAILED: patch "[PATCH] tick/powerclamp: Remove tick_nohz_idle abuse" failed to apply to 3.10-stable tree
Date: Tue, 20 Jan 2015 15:20:10 +0800
Message-ID: <1421738410105248@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5391643181999038304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


The patch below does not apply to the 3.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

thanks,

greg k-h

------------------ original commit in Linus's tree ------------------

>From a5fd9733a30d18d7ac23f17080e7e07bb3205b69 Mon Sep 17 00:00:00 2001
From: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 18 Dec 2014 11:51:01 +0100
Subject: [PATCH] tick/powerclamp: Remove tick_nohz_idle abuse

commit 4dbd27711cd9 "tick: export nohz tick idle symbols for module
use" was merged via the thermal tree without an explicit ack from the
relevant maintainers.

The exports are abused by the intel powerclamp driver which implements
a fake idle state from a sched FIFO task. This causes all kinds of
wreckage in the NOHZ core code which rightfully assumes that
tick_nohz_idle_enter/exit() are only called from the idle task itself.

Recent changes in the NOHZ core lead to a failure of the powerclamp
driver and now people try to hack completely broken and backwards
workarounds into the NOHZ core code. This is completely unacceptable
and just papers over the real problem. There are way more subtle
issues lurking around the corner.

The real solution is to fix the powerclamp driver by rewriting it with
a sane concept, but that's beyond the scope of this.

So the only solution for now is to remove the calls into the core NOHZ
code from the powerclamp trainwreck along with the exports.

Fixes: d6d71ee4a14a "PM: Introduce Intel PowerClamp Driver"
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Pan Jacob jun <jacob.jun.pan@intel.com>
Cc: LKP <lkp@01.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: stable(a)vger.kernel.org
Link: http://lkml.kernel.org/r/alpine.DEB.2.11.1412181110110.17382(a)nanos
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

diff --git a/drivers/thermal/intel_powerclamp.c b/drivers/thermal/intel_pow=
erclamp.c
index 95cb7fc20e17..6cb78497076a 100644
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
index 1f4356037a7d..ff3ec34702e8 100644
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


--===============5391643181999038304==--

