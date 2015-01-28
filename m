Content-Type: multipart/mixed; boundary="===============0827524241469729553=="
MIME-Version: 1.0
From: Kamal Mostafa <kamal@canonical.com>
To: lkp@lists.01.org
Subject: [3.13.y-ckt stable] Patch "tick/powerclamp: Remove tick_nohz_idle abuse" has been added to staging queue
Date: Wed, 28 Jan 2015 14:20:17 -0800
Message-ID: <1422483617-15131-1-git-send-email-kamal@canonical.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0827524241469729553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is a note to let you know that I have just added a patch titled

    tick/powerclamp: Remove tick_nohz_idle abuse

to the linux-3.13.y-queue branch of the 3.13.y-ckt extended stable tree =

which can be found at:

 http://kernel.ubuntu.com/git?p=3Dubuntu/linux.git;a=3Dshortlog;h=3Drefs/he=
ads/linux-3.13.y-queue

This patch is scheduled to be released in version 3.13.11-ckt15.

If you, or anyone else, feels it should not be added to this tree, please =

reply to this email.

For more information about the 3.13.y-ckt tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Kamal

------

>From f9ab87de3b27dc729b9a0cfc9dc5612dda04c995 Mon Sep 17 00:00:00 2001
From: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 18 Dec 2014 11:51:01 +0100
Subject: tick/powerclamp: Remove tick_nohz_idle abuse

commit a5fd9733a30d18d7ac23f17080e7e07bb3205b69 upstream.

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
Link: http://lkml.kernel.org/r/alpine.DEB.2.11.1412181110110.17382(a)nanos
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Kamal Mostafa <kamal@canonical.com>
---
 drivers/thermal/intel_powerclamp.c | 2 --
 kernel/time/tick-sched.c           | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/thermal/intel_powerclamp.c b/drivers/thermal/intel_pow=
erclamp.c
index 8f181b3..cde9cff 100644
--- a/drivers/thermal/intel_powerclamp.c
+++ b/drivers/thermal/intel_powerclamp.c
@@ -426,7 +426,6 @@ static int clamp_thread(void *arg)
 		 * allowed. thus jiffies are updated properly.
 		 */
 		preempt_disable();
-		tick_nohz_idle_enter();
 		/* mwait until target jiffies is reached */
 		while (time_before(jiffies, target_jiffies)) {
 			unsigned long ecx =3D 1;
@@ -444,7 +443,6 @@ static int clamp_thread(void *arg)
 			start_critical_timings();
 			atomic_inc(&idle_wakeup_counter);
 		}
-		tick_nohz_idle_exit();
 		preempt_enable_no_resched();
 	}
 	del_timer_sync(&wakeup_timer);
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 29b063b..67673ca 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -806,7 +806,6 @@ void tick_nohz_idle_enter(void)

 	local_irq_enable();
 }
-EXPORT_SYMBOL_GPL(tick_nohz_idle_enter);

 /**
  * tick_nohz_irq_exit - update next tick event from interrupt exit
@@ -934,7 +933,6 @@ void tick_nohz_idle_exit(void)

 	local_irq_enable();
 }
-EXPORT_SYMBOL_GPL(tick_nohz_idle_exit);

 static int tick_nohz_reprogram(struct tick_sched *ts, ktime_t now)
 {
--
1.9.1


--===============0827524241469729553==--

