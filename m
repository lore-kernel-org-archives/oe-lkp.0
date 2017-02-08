Content-Type: multipart/mixed; boundary="===============7990141022178941759=="
MIME-Version: 1.0
From: Cao Shufeng <caosf.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: [PATCH_v4.1_2_3] Limit dump_pipe program's permission to init for container
Date: Wed, 08 Feb 2017 11:00:56 +0800
Message-ID: <1486522857-9946-3-git-send-email-caosf.fnst@cn.fujitsu.com>
In-Reply-To: <1486522857-9946-1-git-send-email-caosf.fnst@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7990141022178941759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently when we set core_pattern to a pipe, the pipe program is
forked by kthread running with root's permission, and write dumpfile
into host's filesystem.
Same thing happened for container, the dumper and dumpfile are also
in host(not in container).

It have following program:
1: Not consistent with file_type core_pattern
   When we set core_pattern to a file, the container will write dump
   into container's filesystem instead of host.
2: Not safe for privileged container
   In a privileged container, user can destroy host system by following
   command:
   # # In a container
   # echo "|/bin/dd of=3D/boot/vmlinuz" >/proc/sys/kernel/core_pattern
   # make_dump

This patch switch dumper program's environment to init task, so, for
container, dumper program have same environment with init task in
container, which make dumper program put in container's filesystem, and
write coredump into container's filesystem.
The dumper's permission is also limited into subset of container's init
process.

Suggested-by: Eric W. Biederman <ebiederm@xmission.com>
Suggested-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>

Signed-off-by: Cao ShuFeng<caosf.fnst@cn.fujitsu.com>
---
 fs/coredump.c           | 126 ++++++++++++++++++++++++++++++++++++++++++++=
+++-
 include/linux/binfmts.h |   2 +
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index 9abf4e5..83282d7 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -505,6 +505,45 @@ static void wait_for_dump_helpers(struct file *file)
 }
 =

 /*
+ * umh_ns_setup
+ * set the namesapces to the bask task of a container.
+ * we need to switch back to the original namespaces
+ * so that the thread of workqueue is not influlenced.
+ *
+ * this method runs in workqueue kernel thread.
+ */
+static void umh_ns_setup(struct subprocess_info *info)
+{
+	struct coredump_params *cp =3D (struct coredump_params *)info->data;
+	struct task_struct *base_task =3D cp->base_task;
+
+	if (base_task) {
+		cp->current_task_nsproxy =3D current->nsproxy;
+		//prevent current namespace from being freed
+		get_nsproxy(current->nsproxy);
+		/* Set namespaces to base_task */
+		get_nsproxy(base_task->nsproxy);
+		switch_task_namespaces(current, base_task->nsproxy);
+	}
+}
+
+/*
+ * umh_ns_cleanup
+ * cleanup what we have done in umh_ns_setup.
+ *
+ * this method runs in workqueue kernel thread.
+ */
+static void umh_ns_cleanup(struct subprocess_info *info)
+{
+	struct coredump_params *cp =3D (struct coredump_params *)info->data;
+	struct nsproxy *current_task_nsproxy =3D cp->current_task_nsproxy;
+	if (current_task_nsproxy) {
+		/* switch workqueue's original namespace back */
+		switch_task_namespaces(current, current_task_nsproxy);
+	}
+}
+
+/*
  * umh_pipe_setup
  * helper function to customize the process used
  * to collect the core in userspace.  Specifically
@@ -519,6 +558,8 @@ static int umh_pipe_setup(struct subprocess_info *info,=
 struct cred *new)
 {
 	struct file *files[2];
 	struct coredump_params *cp =3D (struct coredump_params *)info->data;
+	struct task_struct *base_task;
+
 	int err =3D create_pipe_files(files, 0);
 	if (err)
 		return err;
@@ -527,10 +568,76 @@ static int umh_pipe_setup(struct subprocess_info *inf=
o, struct cred *new)
 =

 	err =3D replace_fd(0, files[0], 0);
 	fput(files[0]);
+	if (err)
+		return err;
+
 	/* and disallow core files too */
 	current->signal->rlim[RLIMIT_CORE] =3D (struct rlimit){1, 1};
 =

-	return err;
+	base_task =3D cp->base_task;
+	if (base_task) {
+		const struct cred *base_cred;
+
+		/* Set fs_root to base_task */
+		spin_lock(&base_task->fs->lock);
+		set_fs_root(current->fs, &base_task->fs->root);
+		set_fs_pwd(current->fs, &base_task->fs->pwd);
+		spin_unlock(&base_task->fs->lock);
+
+		/* Set cgroup to base_task */
+		current->flags &=3D ~PF_NO_SETAFFINITY;
+		err =3D cgroup_attach_task_all(base_task, current);
+		if (err < 0)
+			return err;
+
+		/* Set cred to base_task */
+		base_cred =3D get_task_cred(base_task);
+
+		new->uid   =3D base_cred->uid;
+		new->gid   =3D base_cred->gid;
+		new->suid  =3D base_cred->suid;
+		new->sgid  =3D base_cred->sgid;
+		new->euid  =3D base_cred->euid;
+		new->egid  =3D base_cred->egid;
+		new->fsuid =3D base_cred->fsuid;
+		new->fsgid =3D base_cred->fsgid;
+
+		new->securebits =3D base_cred->securebits;
+
+		new->cap_inheritable =3D base_cred->cap_inheritable;
+		new->cap_permitted   =3D base_cred->cap_permitted;
+		new->cap_effective   =3D base_cred->cap_effective;
+		new->cap_bset        =3D base_cred->cap_bset;
+		new->cap_ambient     =3D base_cred->cap_ambient;
+
+		security_cred_free(new);
+#ifdef CONFIG_SECURITY
+		new->security =3D NULL;
+#endif
+		err =3D security_prepare_creds(new, base_cred, GFP_KERNEL);
+		if (err < 0) {
+			put_cred(base_cred);
+			return err;
+		}
+
+		free_uid(new->user);
+		new->user =3D base_cred->user;
+		get_uid(new->user);
+
+		put_user_ns(new->user_ns);
+		new->user_ns =3D base_cred->user_ns;
+		get_user_ns(new->user_ns);
+
+		put_group_info(new->group_info);
+		new->group_info =3D base_cred->group_info;
+		get_group_info(new->group_info);
+
+		put_cred(base_cred);
+
+		validate_creds(new);
+	}
+
+	return 0;
 }
 =

 void do_coredump(const siginfo_t *siginfo)
@@ -593,6 +700,7 @@ void do_coredump(const siginfo_t *siginfo)
 =

 	if (ispipe) {
 		int dump_count;
+                struct task_struct *vinit_task;
 		char **helper_argv;
 		struct subprocess_info *sub_info;
 =

@@ -634,6 +742,15 @@ void do_coredump(const siginfo_t *siginfo)
 			goto fail_dropcount;
 		}
 =

+		rcu_read_lock();
+		vinit_task =3D find_task_by_vpid(1);
+		rcu_read_unlock();
+		if (!vinit_task) {
+			printk(KERN_WARNING "failed getting init task info, skipping core dump\=
n");
+			goto fail_dropcount;
+		}
+
+
 		helper_argv =3D argv_split(GFP_KERNEL, cn.corename, NULL);
 		if (!helper_argv) {
 			printk(KERN_WARNING "%s failed to allocate memory\n",
@@ -641,15 +758,20 @@ void do_coredump(const siginfo_t *siginfo)
 			goto fail_dropcount;
 		}
 =

+		get_task_struct(vinit_task);
+
+		cprm.base_task =3D vinit_task;
+
 		retval =3D -ENOMEM;
 		sub_info =3D call_usermodehelper_setup(helper_argv[0],
 						helper_argv, NULL, GFP_KERNEL,
-						NULL, NULL, umh_pipe_setup,
+						umh_ns_setup, umh_ns_cleanup, umh_pipe_setup,
 						NULL, &cprm);
 		if (sub_info)
 			retval =3D call_usermodehelper_exec(sub_info,
 							  UMH_WAIT_EXEC);
 =

+		put_task_struct(vinit_task);
 		argv_free(helper_argv);
 		if (retval) {
 			printk(KERN_INFO "Core dump to |%s pipe failed\n",
diff --git a/include/linux/binfmts.h b/include/linux/binfmts.h
index 1303b57..7ba4271 100644
--- a/include/linux/binfmts.h
+++ b/include/linux/binfmts.h
@@ -59,6 +59,8 @@ struct linux_binprm {
 =

 /* Function parameter for binfmt->coredump */
 struct coredump_params {
+        struct task_struct *base_task;
+        struct nsproxy *current_task_nsproxy;
 	const siginfo_t *siginfo;
 	struct pt_regs *regs;
 	struct file *file;
-- =

2.9.3




--===============7990141022178941759==--

