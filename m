Content-Type: multipart/mixed; boundary="===============4188683758249485203=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86,tsc] a4adad8d16: BUG:kernel_hang_in_boot_stage
Date: Tue, 02 May 2017 13:31:03 +0200
Message-ID: <20170502113103.j5gdfrj2sepuiw6y@hirez.programming.kicks-ass.net>
In-Reply-To: <20170502063854.GA61648@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4188683758249485203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2017 at 02:38:54PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: a4adad8d16a6d2d4208998db794b55ec6e63722f ("x86,tsc: Feed refined =
TSC calibration into sched_clock")
> https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/core
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 420M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-------------------------------+------------+------------+
> |                               | d8a91d9f0b | a4adad8d16 |
> +-------------------------------+------------+------------+
> | boot_successes                | 6          | 0          |
> | boot_failures                 | 0          | 8          |
> | BUG:kernel_hang_in_boot_stage | 0          | 8          |
> +-------------------------------+------------+------------+
> =

> =

> =

> [    2.020173] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [    2.159072] random: fast init done
> [    2.206708] tsc: Refined TSC clocksource calibration: 2925.999 MHz
> =

> Elapsed time: 510
> BUG: kernel hang in boot stage


The below cures it..

I'm not entirely happy as the fast path of cycles_2_ns() has gotten a
little bit fatter, but it removes a lot of icky code with something that
relatively well documented and used in other parts of the kernel as
well.



--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2254,7 +2254,7 @@ static struct pmu pmu =3D {
 void arch_perf_update_userpage(struct perf_event *event,
 			       struct perf_event_mmap_page *userpg, u64 now)
 {
-	struct cyc2ns_data *data;
+	struct cyc2ns_data data;
 	u64 offset;
 =

 	userpg->cap_user_time =3D 0;
@@ -2266,17 +2266,17 @@ void arch_perf_update_userpage(struct pe
 	if (!using_native_sched_clock() || !sched_clock_stable())
 		return;
 =

-	data =3D cyc2ns_read_begin();
+	cyc2ns_read_begin(&data);
 =

-	offset =3D data->cyc2ns_offset + __sched_clock_offset;
+	offset =3D data.cyc2ns_offset + __sched_clock_offset;
 =

 	/*
 	 * Internal timekeeping for enabled/running/stopped times
 	 * is always in the local_clock domain.
 	 */
 	userpg->cap_user_time =3D 1;
-	userpg->time_mult =3D data->cyc2ns_mul;
-	userpg->time_shift =3D data->cyc2ns_shift;
+	userpg->time_mult =3D data.cyc2ns_mul;
+	userpg->time_shift =3D data.cyc2ns_shift;
 	userpg->time_offset =3D offset - now;
 =

 	/*
@@ -2288,7 +2288,7 @@ void arch_perf_update_userpage(struct pe
 		userpg->time_zero =3D offset;
 	}
 =

-	cyc2ns_read_end(data);
+	cyc2ns_read_end();
 }
 =

 void
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -29,11 +29,9 @@ struct cyc2ns_data {
 	u32 cyc2ns_mul;
 	u32 cyc2ns_shift;
 	u64 cyc2ns_offset;
-	u32 __count;
-	/* u32 hole */
-}; /* 24 bytes -- do not grow */
+}; /* 16 bytes */
 =

-extern struct cyc2ns_data *cyc2ns_read_begin(void);
-extern void cyc2ns_read_end(struct cyc2ns_data *);
+extern void cyc2ns_read_begin(struct cyc2ns_data *);
+extern void cyc2ns_read_end(void);
 =

 #endif /* _ASM_X86_TIMER_H */
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -51,115 +51,31 @@ static u32 art_to_tsc_denominator;
 static u64 art_to_tsc_offset;
 struct clocksource *art_related_clocksource;
 =

-/*
- * Use a ring-buffer like data structure, where a writer advances the head=
 by
- * writing a new data entry and a reader advances the tail when it observe=
s a
- * new entry.
- *
- * Writers are made to wait on readers until there's space to write a new
- * entry.
- *
- * This means that we can always use an {offset, mul} pair to compute a ns
- * value that is 'roughly' in the right direction, even if we're writing a=
 new
- * {offset, mul} pair during the clock read.
- *
- * The down-side is that we can no longer guarantee strict monotonicity an=
ymore
- * (assuming the TSC was that to begin with), because while we compute the
- * intersection point of the two clock slopes and make sure the time is
- * continuous at the point of switching; we can no longer guarantee a read=
er is
- * strictly before or after the switch point.
- *
- * It does mean a reader no longer needs to disable IRQs in order to avoid
- * CPU-Freq updates messing with his times, and similarly an NMI reader wi=
ll
- * no longer run the risk of hitting half-written state.
- */
-
 struct cyc2ns {
-	struct cyc2ns_data data[2];	/*  0 + 2*24 =3D 48 */
-	struct cyc2ns_data *head;	/* 48 + 8    =3D 56 */
-	struct cyc2ns_data *tail;	/* 56 + 8    =3D 64 */
-}; /* exactly fits one cacheline */
+	struct cyc2ns_data data[2];	/*  0 + 2*16 =3D 32 */
+	seqcount_t	   seq;		/* 32 + 4    =3D 36 */
 =

-static DEFINE_PER_CPU_ALIGNED(struct cyc2ns, cyc2ns);
-
-struct cyc2ns_data *cyc2ns_read_begin(void)
-{
-	struct cyc2ns_data *head;
+}; /* fits one cacheline */
 =

-	preempt_disable();
-
-	head =3D this_cpu_read(cyc2ns.head);
-	/*
-	 * Ensure we observe the entry when we observe the pointer to it.
-	 * matches the wmb from cyc2ns_write_end().
-	 */
-	smp_read_barrier_depends();
-	head->__count++;
-	barrier();
-
-	return head;
-}
-
-void cyc2ns_read_end(struct cyc2ns_data *head)
-{
-	barrier();
-	/*
-	 * If we're the outer most nested read; update the tail pointer
-	 * when we're done. This notifies possible pending writers
-	 * that we've observed the head pointer and that the other
-	 * entry is now free.
-	 */
-	if (!--head->__count) {
-		/*
-		 * x86-TSO does not reorder writes with older reads;
-		 * therefore once this write becomes visible to another
-		 * cpu, we must be finished reading the cyc2ns_data.
-		 *
-		 * matches with cyc2ns_write_begin().
-		 */
-		this_cpu_write(cyc2ns.tail, head);
-	}
-	preempt_enable();
-}
+static DEFINE_PER_CPU_ALIGNED(struct cyc2ns, cyc2ns);
 =

-/*
- * Begin writing a new @data entry for @cpu.
- *
- * Assumes some sort of write side lock; currently 'provided' by the assum=
ption
- * that cpufreq will call its notifiers sequentially.
- */
-static struct cyc2ns_data *cyc2ns_write_begin(int cpu)
+void cyc2ns_read_begin(struct cyc2ns_data *data)
 {
-	struct cyc2ns *c2n =3D &per_cpu(cyc2ns, cpu);
-	struct cyc2ns_data *data =3D c2n->data;
-
-	if (data =3D=3D c2n->head)
-		data++;
+	struct cyc2ns *c2n;
+	int seq;
 =

-	/* XXX send an IPI to @cpu in order to guarantee a read? */
-
-	/*
-	 * When we observe the tail write from cyc2ns_read_end(),
-	 * the cpu must be done with that entry and its safe
-	 * to start writing to it.
-	 */
-	while (c2n->tail =3D=3D data)
-		cpu_relax();
+	preempt_disable_notrace();
+	c2n =3D this_cpu_ptr(&cyc2ns);
+	do {
+		seq =3D raw_read_seqcount_latch(&c2n->seq);
+		*data =3D c2n->data[seq & 1];
 =

-	return data;
+	} while (read_seqcount_retry(&c2n->seq, seq));
 }
 =

-static void cyc2ns_write_end(int cpu, struct cyc2ns_data *data)
+void cyc2ns_read_end(void)
 {
-	struct cyc2ns *c2n =3D &per_cpu(cyc2ns, cpu);
-
-	/*
-	 * Ensure the @data writes are visible before we publish the
-	 * entry. Matches the data-depencency in cyc2ns_read_begin().
-	 */
-	smp_wmb();
-
-	ACCESS_ONCE(c2n->head) =3D data;
+	preempt_enable_notrace();
 }
 =

 /*
@@ -191,7 +107,6 @@ static void cyc2ns_data_init(struct cyc2
 	data->cyc2ns_mul =3D 0;
 	data->cyc2ns_shift =3D 0;
 	data->cyc2ns_offset =3D 0;
-	data->__count =3D 0;
 }
 =

 static void cyc2ns_init(int cpu)
@@ -201,42 +116,26 @@ static void cyc2ns_init(int cpu)
 	cyc2ns_data_init(&c2n->data[0]);
 	cyc2ns_data_init(&c2n->data[1]);
 =

-	c2n->head =3D c2n->data;
-	c2n->tail =3D c2n->data;
+	seqcount_init(&c2n->seq);
 }
 =

 static inline unsigned long long cycles_2_ns(unsigned long long cyc)
 {
-	struct cyc2ns_data *data, *tail;
+	struct cyc2ns_data *data;
 	unsigned long long ns;
-
-	/*
-	 * See cyc2ns_read_*() for details; replicated in order to avoid
-	 * an extra few instructions that came with the abstraction.
-	 * Notable, it allows us to only do the __count and tail update
-	 * dance when its actually needed.
-	 */
+	struct cyc2ns *c2n;
+	int seq;
 =

 	preempt_disable_notrace();
-	data =3D this_cpu_read(cyc2ns.head);
-	tail =3D this_cpu_read(cyc2ns.tail);
-
-	if (likely(data =3D=3D tail)) {
-		ns =3D data->cyc2ns_offset;
-		ns +=3D mul_u64_u32_shr(cyc, data->cyc2ns_mul, data->cyc2ns_shift);
-	} else {
-		data->__count++;
-
-		barrier();
+	c2n =3D this_cpu_ptr(&cyc2ns);
+	do {
+		seq =3D raw_read_seqcount_latch(&c2n->seq);
+		data =3D &c2n->data[seq & 1];
 =

 		ns =3D data->cyc2ns_offset;
 		ns +=3D mul_u64_u32_shr(cyc, data->cyc2ns_mul, data->cyc2ns_shift);
 =

-		barrier();
-
-		if (!--data->__count)
-			this_cpu_write(cyc2ns.tail, data);
-	}
+	} while (read_seqcount_retry(&c2n->seq, seq));
 	preempt_enable_notrace();
 =

 	return ns;
@@ -245,7 +144,8 @@ static inline unsigned long long cycles_
 static void set_cyc2ns_scale(unsigned long khz, int cpu)
 {
 	unsigned long long tsc_now, ns_now;
-	struct cyc2ns_data *data;
+	struct cyc2ns_data data;
+	struct cyc2ns *c2n;
 	unsigned long flags;
 =

 	local_irq_save(flags);
@@ -254,8 +154,6 @@ static void set_cyc2ns_scale(unsigned lo
 	if (!khz)
 		goto done;
 =

-	data =3D cyc2ns_write_begin(cpu);
-
 	tsc_now =3D rdtsc();
 	ns_now =3D cycles_2_ns(tsc_now);
 =

@@ -264,7 +162,7 @@ static void set_cyc2ns_scale(unsigned lo
 	 * time function is continuous; see the comment near struct
 	 * cyc2ns_data.
 	 */
-	clocks_calc_mult_shift(&data->cyc2ns_mul, &data->cyc2ns_shift, khz,
+	clocks_calc_mult_shift(&data.cyc2ns_mul, &data.cyc2ns_shift, khz,
 			       NSEC_PER_MSEC, 0);
 =

 	/*
@@ -273,15 +171,20 @@ static void set_cyc2ns_scale(unsigned lo
 	 * conversion algorithm shifting a 32-bit value (now specifies a 64-bit
 	 * value) - refer perf_event_mmap_page documentation in perf_event.h.
 	 */
-	if (data->cyc2ns_shift =3D=3D 32) {
-		data->cyc2ns_shift =3D 31;
-		data->cyc2ns_mul >>=3D 1;
+	if (data.cyc2ns_shift =3D=3D 32) {
+		data.cyc2ns_shift =3D 31;
+		data.cyc2ns_mul >>=3D 1;
 	}
 =

-	data->cyc2ns_offset =3D ns_now -
-		mul_u64_u32_shr(tsc_now, data->cyc2ns_mul, data->cyc2ns_shift);
+	data.cyc2ns_offset =3D ns_now -
+		mul_u64_u32_shr(tsc_now, data.cyc2ns_mul, data.cyc2ns_shift);
+
+	c2n =3D this_cpu_ptr(&cyc2ns);
 =

-	cyc2ns_write_end(cpu, data);
+	raw_write_seqcount_latch(&c2n->seq);
+	c2n->data[0] =3D data;
+	raw_write_seqcount_latch(&c2n->seq);
+	c2n->data[1] =3D data;
 =

 done:
 	sched_clock_idle_wakeup_event();
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -456,12 +456,13 @@ static void reset_with_ipi(struct pnmask
  */
 static inline unsigned long long cycles_2_ns(unsigned long long cyc)
 {
-	struct cyc2ns_data *data =3D cyc2ns_read_begin();
+	struct cyc2ns_data data;
 	unsigned long long ns;
 =

-	ns =3D mul_u64_u32_shr(cyc, data->cyc2ns_mul, data->cyc2ns_shift);
+       	cyc2ns_read_begin(&data);
+	ns =3D mul_u64_u32_shr(cyc, data.cyc2ns_mul, data.cyc2ns_shift);
+	cyc2ns_read_end();
 =

-	cyc2ns_read_end(data);
 	return ns;
 }
 =

@@ -470,12 +471,13 @@ static inline unsigned long long cycles_
  */
 static inline unsigned long long ns_2_cycles(unsigned long long ns)
 {
-	struct cyc2ns_data *data =3D cyc2ns_read_begin();
+	struct cyc2ns_data data;
 	unsigned long long cyc;
 =

-	cyc =3D (ns << data->cyc2ns_shift) / data->cyc2ns_mul;
+       	cyc2ns_read_begin(&data);
+	cyc =3D (ns << data.cyc2ns_shift) / data.cyc2ns_mul;
+	cyc2ns_read_end();
 =

-	cyc2ns_read_end(data);
 	return cyc;
 }
=20

--===============4188683758249485203==--

