Content-Type: multipart/mixed; boundary="===============5214176874170979572=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/core] 1c3c5eab17: BUG:using_smp_processor_id()in_preemptible
Date: Wed, 24 May 2017 08:52:02 +0200
Message-ID: <20170524065202.v25vyu7pvba5mhpd@hirez.programming.kicks-ass.net>
In-Reply-To: <20170524052545.GQ1795@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5214176874170979572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2017 at 01:25:45PM +0800, kernel test robot wrote:

> [   15.697784] BUG: using smp_processor_id() in preemptible [00000000] co=
de: swapper/0/1
> [   15.698793] caller is debug_smp_processor_id+0x1c/0x1e
> [   15.699461] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.0-rc2-00108=
-g1c3c5ea #1
> [   15.700431] Call Trace:
> [   15.700530]  dump_stack+0x110/0x192
> [   15.700530]  check_preemption_disabled+0x10c/0x128
> [   15.700530]  ? set_debug_rodata+0x25/0x25
> [   15.700530]  debug_smp_processor_id+0x1c/0x1e
> [   15.700530]  sched_clock_init_late+0x27/0x87
> [   15.700530]  ? sched_init+0x4c6/0x4c6
> [   15.700530]  do_one_initcall+0xa3/0x1a7
> [   15.700530]  ? set_debug_rodata+0x25/0x25
> [   15.700530]  kernel_init_freeable+0x25e/0x304
> [   15.700530]  ? rest_init+0x29a/0x29a
> [   15.700530]  kernel_init+0x14/0x147
> [   15.700530]  ? rest_init+0x29a/0x29a
> [   15.700530]  ret_from_fork+0x31/0x40
> [   15.707460] sched_clock: Marking stable (15707446101, 0)->(16254936915=
, -547490814)


This should fix I think...

---
Subject: sched/clock: Fix early boot preempt warning

The more strict early boot preemption warnings found that
__set_sched_clock_stable() was incorrectly assuming we'd still be
running on a single CPU.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/clock.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/clock.c b/kernel/sched/clock.c
index 1a0d389d2f2b..ca0f8fc945c6 100644
--- a/kernel/sched/clock.c
+++ b/kernel/sched/clock.c
@@ -133,12 +133,19 @@ static void __scd_stamp(struct sched_clock_data *scd)
 =

 static void __set_sched_clock_stable(void)
 {
-	struct sched_clock_data *scd =3D this_scd();
+	struct sched_clock_data *scd;
 =

 	/*
+	 * Since we're still unstable and the tick is already running, we have
+	 * to disable IRQs in order to get a consistent scd->tick* reading.
+	 */
+	local_irq_disable();
+	scd =3D this_scd();
+	/*
 	 * Attempt to make the (initial) unstable->stable transition continuous.
 	 */
 	__sched_clock_offset =3D (scd->tick_gtod + __gtod_offset) - (scd->tick_ra=
w);
+	local_irq_enable();
 =

 	printk(KERN_INFO "sched_clock: Marking stable (%lld, %lld)->(%lld, %lld)\=
n",
 			scd->tick_gtod, __gtod_offset,

--===============5214176874170979572==--

