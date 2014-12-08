Content-Type: multipart/mixed; boundary="===============4662505960927889184=="
MIME-Version: 1.0
From: Anton Blanchard <anton@samba.org>
To: lkp@lists.01.org
Subject: [PATCH] powerpc: secondary CPUs signal to master before setting active and online (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Tue, 09 Dec 2014 10:58:19 +1100
Message-ID: <20141209105819.0e847b4b@kryten>
In-Reply-To: <20141208211859.6e81ec81@kryten>
List-Id: <oe-lkp.lists.linux.dev>

--===============4662505960927889184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

> At that point I thought the previous task_cpu() was somewhat ingrained
> in the scheduler and came up with the patch. If not, we could go on a
> hunt to see what else needs fixing.

I had another look. The scheduled does indeed make assumptions about the
previous task_cpu, but we have a hammer to fix it up called
select_fallback_rq.

I annotated select_fallback_rq, and did hit a case where the CPU was
not active. ppc64 patch below.

I think x86 have a similar (although harder to hit) issue. While it
does wait for the cpu_online bit to be set:

        while (!cpu_online(cpu)) {
                cpu_relax();
                touch_nmi_watchdog();
        }

The cpu_active bit is set after the cpu_online bit:

void set_cpu_online(unsigned int cpu, bool online)
{
        if (online) {
                cpumask_set_cpu(cpu, to_cpumask(cpu_online_bits));
                cpumask_set_cpu(cpu, to_cpumask(cpu_active_bits));

If the CPU got delayed between the two stores (eg a KVM guest had the CPU
scheduled out), then we'd end up with cpu_active unset and hit the same
issue in select_fallback_rq.

Anton
--

I have a busy ppc64le KVM box where guests sometimes hit the infamous
"kernel BUG at kernel/smpboot.c:134!" issue during boot:

BUG_ON(td->cpu !=3D smp_processor_id());

Basically a per CPU hotplug thread scheduled on the wrong CPU. The oops
output confirms it:

CPU: 0
Comm: watchdog/130

The problem is that we aren't ensuring the CPU active and online bits are s=
et
before allowing the master to continue on. The master unparks the secondary
CPUs kthreads and the scheduler looks for a CPU to run on. It calls
select_task_rq and realises the suggested CPU is not in the cpus_allowed
mask. It then ends up in select_fallback_rq, and since the active and
online bits aren't set we choose some other CPU to run on.

Cc: stable(a)vger.kernel.org
Signed-off-by: Anton Blanchard <anton@samba.org>
---
 arch/powerpc/kernel/smp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 71e186d..d40e46e 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -700,7 +700,6 @@ void start_secondary(void *unused)
 	smp_store_cpu_info(cpu);
 	set_dec(tb_ticks_per_jiffy);
 	preempt_disable();
-	cpu_callin_map[cpu] =3D 1;
 =

 	if (smp_ops->setup_cpu)
 		smp_ops->setup_cpu(cpu);
@@ -739,6 +738,14 @@ void start_secondary(void *unused)
 	notify_cpu_starting(cpu);
 	set_cpu_online(cpu, true);
 =

+	/*
+	 * CPU must be marked active and online before we signal back to the
+	 * master, because the scheduler needs to see the cpu_online and
+	 * cpu_active bits set.
+	 */
+	smp_wmb();
+	cpu_callin_map[cpu] =3D 1;
+
 	local_irq_enable();
 =

 	cpu_startup_entry(CPUHP_ONLINE);
-- =

2.1.0


--===============4662505960927889184==--

