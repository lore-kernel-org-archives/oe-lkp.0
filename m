Content-Type: multipart/mixed; boundary="===============3000534828361617678=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 9cf57731b6 [ 8.051016] WARNING: CPU: 1 PID: 58 at lib/list_debug.c:28 __list_add_valid
Date: Fri, 13 Jul 2018 12:42:08 +0200
Message-ID: <20180713104208.GW2494@hirez.programming.kicks-ass.net>
In-Reply-To: <85eb9dd4-2a20-9c2a-d805-e38cf749f187@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3000534828361617678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2018 at 12:32:41PM +0800, Rong Chen wrote:
> Thanks, it's fixed with the patch.

Ingo, could you merge?

---
Subject: watchdog/softlockup: Fix cpu_stop_queue_work double-queue
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 11 Jul 2018 14:34:36 +0200

When scheduling is delayed for longer than the softlockup interrupt
period it is possible to double-queue the cpu_stop_work, causing list
corruption.

Cure this by adding a completion to track the cpu_stop_work's
progress.

Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Rong Chen <rong.a.chen@intel.com>
Fixes: 9cf57731b63e ("watchdog/softlockup: Replace "watchdog/%u" threads wi=
th cpu_stop_work")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/watchdog.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index b81f777838d5..5470dce212c0 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -330,6 +330,9 @@ static void watchdog_interrupt_count(void)
 	__this_cpu_inc(hrtimer_interrupts);
 }
 =

+static DEFINE_PER_CPU(struct completion, softlockup_completion);
+static DEFINE_PER_CPU(struct cpu_stop_work, softlockup_stop_work);
+
 /*
  * The watchdog thread function - touches the timestamp.
  *
@@ -343,12 +346,11 @@ static int softlockup_fn(void *data)
 	__this_cpu_write(soft_lockup_hrtimer_cnt,
 			 __this_cpu_read(hrtimer_interrupts));
 	__touch_watchdog();
+	complete(this_cpu_ptr(&softlockup_completion));
 =

 	return 0;
 }
 =

-static DEFINE_PER_CPU(struct cpu_stop_work, softlockup_stop_work);
-
 /* watchdog kicker functions */
 static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 {
@@ -364,9 +366,12 @@ static enum hrtimer_restart watchdog_timer_fn(struct h=
rtimer *hrtimer)
 	watchdog_interrupt_count();
 =

 	/* kick the softlockup detector */
-	stop_one_cpu_nowait(smp_processor_id(),
-			softlockup_fn, NULL,
-			this_cpu_ptr(&softlockup_stop_work));
+	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
+		reinit_completion(this_cpu_ptr(&softlockup_completion));
+		stop_one_cpu_nowait(smp_processor_id(),
+				softlockup_fn, NULL,
+				this_cpu_ptr(&softlockup_stop_work));
+	}
 =

 	/* .. and repeat */
 	hrtimer_forward_now(hrtimer, ns_to_ktime(sample_period));
@@ -467,9 +472,13 @@ static enum hrtimer_restart watchdog_timer_fn(struct h=
rtimer *hrtimer)
 static void watchdog_enable(unsigned int cpu)
 {
 	struct hrtimer *hrtimer =3D this_cpu_ptr(&watchdog_hrtimer);
+	struct completion *done =3D this_cpu_ptr(&softlockup_completion);
 =

 	WARN_ON_ONCE(cpu !=3D smp_processor_id());
 =

+	init_completion(done);
+	complete(done);
+
 	/*
 	 * Start the timer first to prevent the NMI watchdog triggering
 	 * before the timer has a chance to fire.
@@ -499,6 +508,7 @@ static void watchdog_disable(unsigned int cpu)
 	 */
 	watchdog_nmi_disable(cpu);
 	hrtimer_cancel(hrtimer);
+	wait_for_completion(this_cpu_ptr(&softlockup_completion));
 }
 =

 static int softlockup_stop_fn(void *data)

--===============3000534828361617678==--

