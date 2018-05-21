Content-Type: multipart/mixed; boundary="===============0453349496202884708=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] b37d0497aa: WARNING:possible_irq_lock_inversion_dependency_detected
Date: Mon, 21 May 2018 08:33:31 -0700
Message-ID: <20180521153331.GM1718769@devbig577.frc2.facebook.com>
In-Reply-To: <20180521073808.GA21726@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0453349496202884708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 21, 2018 at 03:38:08PM +0800, Boqun Feng wrote:
> > [   28.387571] WARNING: possible irq lock inversion dependency detected
> > [   28.389198] 4.17.0-rc1-00027-gb37d049 #6 Not tainted
> > [   28.390617] --------------------------------------------------------
> > [   28.392205] systemd/1 just changed the state of lock:
> > [   28.393627] 00000000fe57773b (css_set_lock){..-.}, at: cgroup_free+0=
xf2/0x12a
> > [   28.395456] but this lock took another, SOFTIRQ-unsafe lock in the p=
ast:
> > [   28.397152]  (tasklist_lock){.+.+}
> > [   28.397155] =

> > [   28.397155] =

> > [   28.397155] and interrupts could create inverse lock ordering betwee=
n them.
> > [   28.397155] =

> > [   28.402049] =

> > [   28.402049] other info that might help us debug this:
> > [   28.404203]  Possible interrupt unsafe locking scenario:
> > [   28.404203] =

> > [   28.406379]        CPU0                    CPU1
> > [   28.407712]        ----                    ----
> > [   28.409107]   lock(tasklist_lock);
> > [   28.410207]                                local_irq_disable();
> > [   28.411822]                                lock(css_set_lock);
> > [   28.413423]                                lock(tasklist_lock);
> > [   28.415094]   <Interrupt>
> > [   28.416106]     lock(css_set_lock);
> > [   28.417263] =

> > [   28.417263]  *** DEADLOCK ***
> > [   28.417263] =


Would something like the following work?

Thanks.

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index a662bfc..3b68174 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1782,13 +1782,6 @@ static void cgroup_enable_task_cg_lists(void)
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
@@ -1797,6 +1790,13 @@ static void cgroup_enable_task_cg_lists(void)
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
@@ -1824,9 +1824,9 @@ static void cgroup_enable_task_cg_lists(void)
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

--===============0453349496202884708==--

