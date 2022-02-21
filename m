Content-Type: multipart/mixed; boundary="===============7838016615458003555=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: [PATCH] workqueue: Use private WQ for schedule_on_each_cpu() API
Date: Mon, 21 Feb 2022 19:38:09 +0900
Message-ID: <3a20c799-c18e-dd3a-3161-fee6bca1491e@I-love.SAKURA.ne.jp>
In-Reply-To: <20220221083358.GC835@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7838016615458003555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since schedule_on_each_cpu() calls schedule_work_on() and flush_work(),
we should avoid using system_wq in order to avoid unexpected locking
dependency.

  [T1] Running RCU-tasks wait API self tests
  [T9] Please do not flush events WQ.
  [T9] CPU: 0 PID: 9 Comm: rcu_tasks_rude_ Not tainted 5.16.0-06523-g29bd19=
9e4e73 #1
  [T9] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1=
 04/01/2014
  [T9] Call Trace:
  [T9]  <TASK>
  [T9]  dump_stack_lvl+0x45/0x59
  [T9]  check_flush_dependency.cold+0x18/0x49
  [T9]  __flush_work+0x202/0xa00
  [T9]  schedule_on_each_cpu+0x1d8/0x300
  [T9]  rcu_tasks_kthread+0x21f/0x580
  [T9]  kthread+0x3a4/0x480
  [T9]  ret_from_fork+0x22/0x30
  [T9]  </TASK>
  [T1] Performance Events: unsupported p6 CPU model 42 no PMU driver, softw=
are events only.

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Tejun, are you OK with https://lkml.kernel.org/r/2f887679-c783-bf18-a2aa-aa=
9a709bfb38(a)I-love.SAKURA.ne.jp ?

 kernel/workqueue.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 8e6e64372441..6ebc6cb15c1c 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -3345,10 +3345,16 @@ int schedule_on_each_cpu(work_func_t func)
 {
 	int cpu;
 	struct work_struct __percpu *works;
+	struct workqueue_struct *wq;
 =

 	works =3D alloc_percpu(struct work_struct);
 	if (!works)
 		return -ENOMEM;
+	wq =3D alloc_workqueue("events_sync", 0, 0);
+	if (!wq) {
+		free_percpu(works);
+		return -ENOMEM;
+	}
 =

 	cpus_read_lock();
 =

@@ -3363,6 +3369,7 @@ int schedule_on_each_cpu(work_func_t func)
 		flush_work(per_cpu_ptr(works, cpu));
 =

 	cpus_read_unlock();
+	destroy_workqueue(wq);
 	free_percpu(works);
 	return 0;
 }
-- =

2.32.0


--===============7838016615458003555==--

