Content-Type: multipart/mixed; boundary="===============5505201444688670314=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] powerpc: secondary CPUs signal to master before setting active and online (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Wed, 10 Dec 2014 15:08:57 +0100
Message-ID: <alpine.DEB.2.11.1412101427080.13233@nanos>
In-Reply-To: <CA+55aFyR5PzNkojvEej1NXnpEFOPOYfnxCcPDAjg1rE79tQv7A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5505201444688670314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Dec 2014, Linus Torvalds wrote:
> On Mon, Dec 8, 2014 at 3:58 PM, Anton Blanchard <anton@samba.org> wrote:
> > Hi Ingo,
> >
> >> At that point I thought the previous task_cpu() was somewhat ingrained
> >> in the scheduler and came up with the patch. If not, we could go on a
> >> hunt to see what else needs fixing.
> >
> > I had another look. The scheduled does indeed make assumptions about the
> > previous task_cpu, but we have a hammer to fix it up called
> > select_fallback_rq.
> >
> > I annotated select_fallback_rq, and did hit a case where the CPU was
> > not active. ppc64 patch below.
> =

> Anton, I'll assume I will get this through the usual powerpc pull request=
s?
> =

> > I think x86 have a similar (although harder to hit) issue.

Indeed way harder to hit:

CPU 0				CPU 1

    				set_cpu_online(1, true) {
while (!cpu_online(cpu1))	   cpumask_set_cpu(1, to_cpumask(cpu_online_bits)=
);
      relax();

wakeup_thread_on_cpu1();
				   cpumask_set_cpu(1, to_cpumask(cpu_active_bits));

On bare metal probably impossible, but on virt it should be
observable. Fix is simple.

Thanks,

	tglx

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 668d8f2a8781..534f3384f03f 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -222,7 +222,6 @@ static void notrace start_secondary(void *unused)
 	lock_vector_lock();
 	set_cpu_online(smp_processor_id(), true);
 	unlock_vector_lock();
-	per_cpu(cpu_state, smp_processor_id()) =3D CPU_ONLINE;
 	x86_platform.nmi_init();
 =

 	/* enable local interrupts */
@@ -234,6 +233,7 @@ static void notrace start_secondary(void *unused)
 	x86_cpuinit.setup_percpu_clockev();
 =

 	wmb();
+	per_cpu(cpu_state, smp_processor_id()) =3D CPU_ONLINE;
 	cpu_startup_entry(CPUHP_ONLINE);
 }
 =

@@ -932,7 +932,7 @@ int native_cpu_up(unsigned int cpu, struct task_struct =
*tidle)
 	check_tsc_sync_source(cpu);
 	local_irq_restore(flags);
 =

-	while (!cpu_online(cpu)) {
+	while (per_cpu(cpu_state,cpu) !=3D CPU_ONLINE) {
 		cpu_relax();
 		touch_nmi_watchdog();
 	}



--===============5505201444688670314==--

