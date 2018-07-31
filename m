Content-Type: multipart/mixed; boundary="===============3640124571036863800=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm, oom] c1e4c54f9c: BUG:KASAN:null-ptr-deref_in_d
Date: Mon, 30 Jul 2018 19:05:50 -0700
Message-ID: <alpine.DEB.2.21.1807301854040.198273@chino.kir.corp.google.com>
In-Reply-To: <20180730095635.GI24267@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3640124571036863800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Jul 2018, Michal Hocko wrote:

> On Mon 30-07-18 17:03:20, kernel test robot wrote:
> [...]
> > [    9.034310] BUG: KASAN: null-ptr-deref in dump_header+0x10c/0x448
> =

> Could you faddr2line on the offset please?
> =


It's possible that p is NULL when calling dump_header().  In this case we =

do not want to print any line concerning a victim because no oom kill has =

occurred.

This code shouldn't be part of dump_header(), which is called from =

multiple contexts even when an oom kill has not occurred, and is =

ratelimited.  The single line output should be the canonical way that =

userspace parses the log for oom victims, we can't ratelimit it.

The following would be a fix patch, but it will be broken if the cgroup =

aware oom killer is removed from -mm so that the oom_group stuff can be =

merged.


diff --git a/mm/oom_kill.c b/mm/oom_kill.c
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -438,14 +438,6 @@ static void dump_header(struct oom_control *oc, struct=
 task_struct *p)
 =

 	dump_stack();
 =

-	/* one line summary of the oom killer context. */
-	pr_info("oom-kill:constraint=3D%s,nodemask=3D%*pbl",
-			oom_constraint_text[oc->constraint],
-			nodemask_pr_args(oc->nodemask));
-	cpuset_print_current_mems_allowed();
-	mem_cgroup_print_oom_context(oc->memcg, p);
-	pr_cont(",task=3D%s,pid=3D%d,uid=3D%d\n", p->comm, p->pid,
-		from_kuid(&init_user_ns, task_uid(p)));
 	if (is_memcg_oom(oc))
 		mem_cgroup_print_oom_meminfo(oc->memcg);
 	else {
@@ -836,7 +828,8 @@ static bool task_will_free_mem(struct task_struct *task)
 	return ret;
 }
 =

-static void __oom_kill_process(struct task_struct *victim)
+static void __oom_kill_process(struct task_struct *victim,
+			       struct oom_control *oc)
 {
 	struct task_struct *p;
 	struct mm_struct *mm;
@@ -883,6 +876,18 @@ static void __oom_kill_process(struct task_struct *vic=
tim)
 		K(get_mm_counter(victim->mm, MM_ANONPAGES)),
 		K(get_mm_counter(victim->mm, MM_FILEPAGES)),
 		K(get_mm_counter(victim->mm, MM_SHMEMPAGES)));
+
+	if (oc) {
+		/* One line summary for non-group oom kills */
+		pr_info("oom-kill: constraint=3D%s, nodemask=3D%*pbl",
+			oom_constraint_text[oc->constraint],
+			nodemask_pr_args(oc->nodemask));
+		cpuset_print_current_mems_allowed();
+		mem_cgroup_print_oom_context(oc->memcg, victim);
+		pr_cont(", task=3D%s, pid=3D%d, uid=3D%d\n",
+			victim->comm, victim->pid,
+			from_kuid(&init_user_ns, task_uid(victim)));
+	}
 	task_unlock(victim);
 =

 	/*
@@ -986,13 +991,13 @@ static void oom_kill_process(struct oom_control *oc, =
const char *message)
 	}
 	read_unlock(&tasklist_lock);
 =

-	__oom_kill_process(victim);
+	__oom_kill_process(victim, oc);
 }
 =

 static int oom_kill_memcg_member(struct task_struct *task, void *unused)
 {
 	get_task_struct(task);
-	__oom_kill_process(task);
+	__oom_kill_process(task, NULL);
 	return 0;
 }
 =

@@ -1020,7 +1025,7 @@ static bool oom_kill_memcg_victim(struct oom_control =
*oc)
 		    oc->chosen_task =3D=3D INFLIGHT_VICTIM)
 			goto out;
 =

-		__oom_kill_process(oc->chosen_task);
+		__oom_kill_process(oc->chosen_task, oc);
 	}
 =

 out:

--===============3640124571036863800==--

