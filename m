Content-Type: multipart/mixed; boundary="===============8951587723180236509=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Subject: [PATCH] cgroup: css_set_lock should nest inside tasklist_lock
Date: Wed, 23 May 2018 11:14:33 -0700
Message-ID: <20180523181433.GP1718769@devbig577.frc2.facebook.com>
In-Reply-To: <20180522002001.GA13023@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============8951587723180236509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Applied the following patch to cgroup/for-4.18.

Thanks.

------ 8< ------
>From d8742e22902186e30c346b1ba881cb52942ae3e4 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Wed, 23 May 2018 11:04:54 -0700

cgroup_enable_task_cg_lists() incorrectly nests non-irq-safe
tasklist_lock inside irq-safe css_set_lock triggering the following
lockdep warning.

  WARNING: possible irq lock inversion dependency detected
  4.17.0-rc1-00027-gb37d049 #6 Not tainted
  --------------------------------------------------------
  systemd/1 just changed the state of lock:
  00000000fe57773b (css_set_lock){..-.}, at: cgroup_free+0xf2/0x12a
  but this lock took another, SOFTIRQ-unsafe lock in the past:
   (tasklist_lock){.+.+}

  and interrupts could create inverse lock ordering between them.

  other info that might help us debug this:
   Possible interrupt unsafe locking scenario:

	 CPU0                    CPU1
	 ----                    ----
    lock(tasklist_lock);
				 local_irq_disable();
				 lock(css_set_lock);
				 lock(tasklist_lock);
    <Interrupt>
      lock(css_set_lock);

   *** DEADLOCK ***

The condition is highly unlikely to actually happen especially given
that the path is executed only once per boot.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/cgroup/cgroup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 04b7e7f..63989cb 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1798,13 +1798,6 @@ static void cgroup_enable_task_cg_lists(void)
 {
 	struct task_struct *p, *g;
 =

-	spin_lock_irq(&css_set_lock);
-
-	if (use_task_css_set_links)
-		goto out_unlock;
-
-	use_task_css_set_links =3D true;
-
 	/*
 	 * We need tasklist_lock because RCU is not safe against
 	 * while_each_thread(). Besides, a forking task that has passed
@@ -1813,6 +1806,13 @@ static void cgroup_enable_task_cg_lists(void)
 	 * tasklist if we walk through it with RCU.
 	 */
 	read_lock(&tasklist_lock);
+	spin_lock_irq(&css_set_lock);
+
+	if (use_task_css_set_links)
+		goto out_unlock;
+
+	use_task_css_set_links =3D true;
+
 	do_each_thread(g, p) {
 		WARN_ON_ONCE(!list_empty(&p->cg_list) ||
 			     task_css_set(p) !=3D &init_css_set);
@@ -1840,9 +1840,9 @@ static void cgroup_enable_task_cg_lists(void)
 		}
 		spin_unlock(&p->sighand->siglock);
 	} while_each_thread(g, p);
-	read_unlock(&tasklist_lock);
 out_unlock:
 	spin_unlock_irq(&css_set_lock);
+	read_unlock(&tasklist_lock);
 }
 =

 static void init_cgroup_housekeeping(struct cgroup *cgrp)
-- =

2.9.5


--===============8951587723180236509==--

