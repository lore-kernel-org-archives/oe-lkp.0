Content-Type: multipart/mixed; boundary="===============8264059091621046069=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 9cf57731b6 [ 60.033405] kernel BUG at lib/list_debug.c:28!
Date: Wed, 01 Aug 2018 14:42:52 +0200
Message-ID: <20180801124252.GB2494@hirez.programming.kicks-ass.net>
In-Reply-To: <20180801120202.GA31022@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8264059091621046069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 08:02:02PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 9cf57731b63e37ed995b46690adc604891a9a28f
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Thu Jun 7 10:52:03 2018 +0200
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Tue Jul 3 09:20:43 2018 +0200
> =

>     watchdog/softlockup: Replace "watchdog/%u" threads with cpu_stop_work
>     =

>     Oleg suggested to replace the "watchdog/%u" threads with
>     cpu_stop_work. That removes one thread per CPU while at the same time
>     fixes softlockup vs SCHED_DEADLINE.
>     =

>     But more importantly, it does away with the single
>     smpboot_update_cpumask_percpu_thread() user, which allows
>     cleanups/shrinkage of the smpboot interface.
>     =

>     Suggested-by: Oleg Nesterov <oleg@redhat.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Thomas Gleixner <tglx@linutronix.de>
>     Cc: linux-kernel(a)vger.kernel.org
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
> =


The below commit (which afaict) should also be in next should fix that.

---

commit be45bf5395e0886a93fc816bbe41a008ec2e42e2
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Fri Jul 13 12:42:08 2018 +0200

    watchdog/softlockup: Fix cpu_stop_queue_work() double-queue bug
    =

    When scheduling is delayed for longer than the softlockup interrupt
    period it is possible to double-queue the cpu_stop_work, causing list
    corruption.
    =

    Cure this by adding a completion to track the cpu_stop_work's
    progress.
    =

    Reported-by: kernel test robot <lkp@intel.com>
    Tested-by: Rong Chen <rong.a.chen@intel.com>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Fixes: 9cf57731b63e ("watchdog/softlockup: Replace "watchdog/%u" thread=
s with cpu_stop_work")
    Link: http://lkml.kernel.org/r/20180713104208.GW2494(a)hirez.programmin=
g.kicks-ass.net
    Signed-off-by: Ingo Molnar <mingo@kernel.org>

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

--===============8264059091621046069==--

