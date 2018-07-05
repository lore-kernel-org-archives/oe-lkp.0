Content-Type: multipart/mixed; boundary="===============3581076980276315976=="
MIME-Version: 1.0
From: Matt Fleming <matt@codeblueprint.co.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] fbd5188493: WARNING:inconsistent_lock_state
Date: Thu, 05 Jul 2018 15:43:54 +0100
Message-ID: <20180705144354.GC3864@codeblueprint.co.uk>
In-Reply-To: <20180705132458.GA3864@codeblueprint.co.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3581076980276315976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 05 Jul, at 02:24:58PM, Matt Fleming wrote:
> =

> Hmm.. it still looks to me like we should be saving and restoring IRQs
> since this can be called from IRQ context, no?
> =

> The patch was a forward-port from one of our SLE kernels, and I messed
> up the IRQ flag balancing for the v4.18-rc3 code :-(
 =

Something like this?

---->8----

>From 9b152d8dadec04ac631300d86a92552e57e81db5 Mon Sep 17 00:00:00 2001
From: Matt Fleming <matt@codeblueprint.co.uk>
Date: Wed, 4 Jul 2018 14:22:51 +0100
Subject: [PATCH v2] sched/fair: Avoid divide by zero when rebalancing domai=
ns

It's possible that the CPU doing nohz idle balance hasn't had its own
load updated for many seconds. This can lead to huge deltas between
rq->avg_stamp and rq->clock when rebalancing, and has been seen to
cause the following crash:

 divide error: 0000 [#1] SMP
 Call Trace:
  [<ffffffff810bcba8>] update_sd_lb_stats+0xe8/0x560
  [<ffffffff810bd04d>] find_busiest_group+0x2d/0x4b0
  [<ffffffff810bd640>] load_balance+0x170/0x950
  [<ffffffff810be3ff>] rebalance_domains+0x13f/0x290
  [<ffffffff810852bc>] __do_softirq+0xec/0x300
  [<ffffffff8108578a>] irq_exit+0xfa/0x110
  [<ffffffff816167d9>] reschedule_interrupt+0xc9/0xd0

Make sure we update the rq clock and load before balancing.

Cc: Ingo Molnar <mingo@kernel.org>
Cc: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Matt Fleming <matt@codeblueprint.co.uk>
---
 kernel/sched/fair.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

Changes in v2: Balance IRQ flags properly.

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2f0a0be4d344..150b92c7c9d1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9676,6 +9676,7 @@ static bool nohz_idle_balance(struct rq *this_rq, enu=
m cpu_idle_type idle)
 {
 	int this_cpu =3D this_rq->cpu;
 	unsigned int flags;
+	struct rq_flags rf;
 =

 	if (!(atomic_read(nohz_flags(this_cpu)) & NOHZ_KICK_MASK))
 		return false;
@@ -9692,6 +9693,16 @@ static bool nohz_idle_balance(struct rq *this_rq, en=
um cpu_idle_type idle)
 	if (!(flags & NOHZ_KICK_MASK))
 		return false;
 =

+	/*
+	 * Ensure this_rq's clock and load are up-to-date before we
+	 * rebalance since it's possible that they haven't been
+	 * updated for multiple schedule periods, i.e. many seconds.
+	 */
+	rq_lock_irqsave(this_rq, &rf);
+	update_rq_clock(this_rq);
+	cpu_load_update_idle(this_rq);
+	rq_unlock_irqrestore(this_rq, &rf);
+
 	_nohz_idle_balance(this_rq, flags, idle);
 =

 	return true;
-- =

2.13.6


--===============3581076980276315976==--

