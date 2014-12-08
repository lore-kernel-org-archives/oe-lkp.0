Content-Type: multipart/mixed; boundary="===============6481611521277553850=="
MIME-Version: 1.0
From: Anton Blanchard <anton@samba.org>
To: lkp@lists.01.org
Subject: [PATCH] kthread: kthread_bind fails to enforce CPU affinity (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Mon, 08 Dec 2014 14:27:01 +1100
Message-ID: <1418009221-12719-1-git-send-email-anton@samba.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6481611521277553850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have a busy ppc64le KVM box where guests sometimes hit the infamous
"kernel BUG at kernel/smpboot.c:134!" issue during boot:

BUG_ON(td->cpu !=3D smp_processor_id());

Basically a per CPU hotplug thread scheduled on the wrong CPU. The oops
output confirms it:

CPU: 0
Comm: watchdog/130

The issue is in kthread_bind where we set the cpus_allowed mask, but do
not touch task_thread_info(p)->cpu. The scheduler assumes the previously
scheduled CPU is in the cpus_allowed mask, but in this case we are
moving a thread to another CPU so it is not.

We used to call set_task_cpu which sets task_thread_info(p)->cpu (in fact
kthread_bind still has a comment suggesting this). That was removed in
e2912009fb7b ("sched: Ensure set_task_cpu() is never called on blocked
tasks").

Since we cannot call set_task_cpu (the task is in a sleeping state),
just do an explicit set of task_thread_info(p)->cpu.

Fixes: e2912009fb7b ("sched: Ensure set_task_cpu() is never called on block=
ed tasks")
Cc: stable(a)vger.kernel.org
Signed-off-by: Anton Blanchard <anton@samba.org>
---
 kernel/kthread.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 10e489c..e40ab1d 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -327,13 +327,14 @@ EXPORT_SYMBOL(kthread_create_on_node);
 =

 static void __kthread_bind(struct task_struct *p, unsigned int cpu, long s=
tate)
 {
-	/* Must have done schedule() in kthread() before we set_task_cpu */
+	/* Must have done schedule() in kthread() before we change affinity */
 	if (!wait_task_inactive(p, state)) {
 		WARN_ON(1);
 		return;
 	}
 	/* It's safe because the task is inactive. */
 	do_set_cpus_allowed(p, cpumask_of(cpu));
+	task_thread_info(p)->cpu =3D cpu;
 	p->flags |=3D PF_NO_SETAFFINITY;
 }
 =

-- =

2.1.0


--===============6481611521277553850==--

