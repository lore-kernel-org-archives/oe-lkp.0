Content-Type: multipart/mixed; boundary="===============5833467641528387102=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 9cf57731b6 [ 8.051016] WARNING: CPU: 1 PID: 58 at lib/list_debug.c:28 __list_add_valid
Date: Wed, 11 Jul 2018 14:34:36 +0200
Message-ID: <20180711123436.GD2476@hirez.programming.kicks-ass.net>
In-Reply-To: <20180711060753.GC17385@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5833467641528387102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 02:07:53PM +0800, kernel test robot wrote:
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

> [    8.051016] ------------[ cut here ]------------
> [    8.051016] list_add corruption. prev->next should be next (ffff88001d=
7dc998), but was 0000000000000000. (prev=3Dffff88001d7dc9e0).
> [    8.051016] WARNING: CPU: 1 PID: 58 at lib/list_debug.c:28 __list_add_=
valid+0xc8/0x15c
> [    8.051016] CPU: 1 PID: 58 Comm: rb_consumer Not tainted 4.18.0-rc3-00=
013-g9cf5773 #2
> [    8.051016] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    8.051016] RIP: 0010:__list_add_valid+0xc8/0x15c

> [    8.051016] Call Trace:
> [    8.051016]  <IRQ>
> [    8.051016]  __cpu_stop_queue_work+0x2c/0x53
> [    8.051016]  cpu_stop_queue_work+0x60/0x93
> [    8.051016]  watchdog_timer_fn+0x66/0x227

Does the below fix?

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

--===============5833467641528387102==--

