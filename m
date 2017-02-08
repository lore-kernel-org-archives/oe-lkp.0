Content-Type: multipart/mixed; boundary="===============7649831148106294791=="
MIME-Version: 1.0
From: Cao Shufeng <caosf.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: [PATCH_v4.1_1_3] Make call_usermodehelper_exec possible to set namespaces
Date: Wed, 08 Feb 2017 11:00:55 +0800
Message-ID: <1486522857-9946-2-git-send-email-caosf.fnst@cn.fujitsu.com>
In-Reply-To: <1486522857-9946-1-git-send-email-caosf.fnst@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7649831148106294791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Current call_usermodehelper_work() can not set namespaces for
the executed program.

This patch add above function for call_usermodehelper_work().
The init_intermediate is introduced for init works which should
be done before fork(). So that we get a method to set namespaces
for children. The cleanup_intermediate is introduced for cleaning
up what we have done in init_intermediate, like switching back
the namespace.

This function is helpful for coredump to run pipe_program in
specific container environment.

Signed-off-by: Cao Shufeng <caosf.fnst@cn.fujitsu.com>
Co-author-by: Zhao Lei <zhaolei@cn.fujitsu.com>
---
 fs/coredump.c               |  3 ++-
 include/linux/kmod.h        |  5 +++++
 init/do_mounts_initrd.c     |  3 ++-
 kernel/kmod.c               | 55 +++++++++++++++++++++++++++++++++++++----=
----
 lib/kobject_uevent.c        |  3 ++-
 security/keys/request_key.c |  4 ++--
 6 files changed, 59 insertions(+), 14 deletions(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index eb9c92c..9abf4e5 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -644,7 +644,8 @@ void do_coredump(const siginfo_t *siginfo)
 		retval =3D -ENOMEM;
 		sub_info =3D call_usermodehelper_setup(helper_argv[0],
 						helper_argv, NULL, GFP_KERNEL,
-						umh_pipe_setup, NULL, &cprm);
+						NULL, NULL, umh_pipe_setup,
+						NULL, &cprm);
 		if (sub_info)
 			retval =3D call_usermodehelper_exec(sub_info,
 							  UMH_WAIT_EXEC);
diff --git a/include/linux/kmod.h b/include/linux/kmod.h
index fcfd2bf..0e474d4 100644
--- a/include/linux/kmod.h
+++ b/include/linux/kmod.h
@@ -61,6 +61,9 @@ struct subprocess_info {
 	char **envp;
 	int wait;
 	int retval;
+	bool cleaned;
+	void (*init_intermediate)(struct subprocess_info *info);
+	void (*cleanup_intermediate)(struct subprocess_info *info);
 	int (*init)(struct subprocess_info *info, struct cred *new);
 	void (*cleanup)(struct subprocess_info *info);
 	void *data;
@@ -71,6 +74,8 @@ call_usermodehelper(char *path, char **argv, char **envp,=
 int wait);
 =

 extern struct subprocess_info *
 call_usermodehelper_setup(char *path, char **argv, char **envp, gfp_t gfp_=
mask,
+			  void (*init_intermediate)(struct subprocess_info *info),
+			  void (*cleanup_intermediate)(struct subprocess_info *info),
 			  int (*init)(struct subprocess_info *info, struct cred *new),
 			  void (*cleanup)(struct subprocess_info *), void *data);
 =

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index a1000ca..59d11c9 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -72,7 +72,8 @@ static void __init handle_initrd(void)
 	current->flags |=3D PF_FREEZER_SKIP;
 =

 	info =3D call_usermodehelper_setup("/linuxrc", argv, envp_init,
-					 GFP_KERNEL, init_linuxrc, NULL, NULL);
+					 GFP_KERNEL, NULL, NULL, init_linuxrc,
+					 NULL, NULL);
 	if (!info)
 		return;
 	call_usermodehelper_exec(info, UMH_WAIT_PROC);
diff --git a/kernel/kmod.c b/kernel/kmod.c
index 0277d12..dcaa17d 100644
--- a/kernel/kmod.c
+++ b/kernel/kmod.c
@@ -39,6 +39,7 @@
 #include <linux/rwsem.h>
 #include <linux/ptrace.h>
 #include <linux/async.h>
+#include <linux/delay.h>
 #include <asm/uaccess.h>
 =

 #include <trace/events/module.h>
@@ -91,7 +92,8 @@ static int call_modprobe(char *module_name, int wait)
 	argv[4] =3D NULL;
 =

 	info =3D call_usermodehelper_setup(modprobe_path, argv, envp, GFP_KERNEL,
-					 NULL, free_modprobe_argv, NULL);
+					 NULL, NULL, NULL, free_modprobe_argv,
+                                         NULL);
 	if (!info)
 		goto free_module_name;
 =

@@ -205,8 +207,15 @@ static void umh_complete(struct subprocess_info *sub_i=
nfo)
 	 */
 	if (comp)
 		complete(comp);
-	else
+	else {
+		for(;;) {
+			if (sub_info->cleaned =3D=3D false)
+				udelay(20);
+			else
+				break;
+		}
 		call_usermodehelper_freeinfo(sub_info);
+	}
 }
 =

 /*
@@ -301,6 +310,10 @@ static void call_usermodehelper_exec_sync(struct subpr=
ocess_info *sub_info)
 	/* Restore default kernel sig handler */
 	kernel_sigaction(SIGCHLD, SIG_IGN);
 =

+	if(sub_info->cleanup_intermediate) {
+		sub_info->cleanup_intermediate(sub_info);
+	}
+	sub_info->cleaned =3D true;
 	umh_complete(sub_info);
 }
 =

@@ -322,6 +335,9 @@ static void call_usermodehelper_exec_work(struct work_s=
truct *work)
 {
 	struct subprocess_info *sub_info =3D
 		container_of(work, struct subprocess_info, work);
+	if(sub_info->init_intermediate) {
+		sub_info->init_intermediate(sub_info);
+	}
 =

 	if (sub_info->wait & UMH_WAIT_PROC) {
 		call_usermodehelper_exec_sync(sub_info);
@@ -334,6 +350,11 @@ static void call_usermodehelper_exec_work(struct work_=
struct *work)
 		 */
 		pid =3D kernel_thread(call_usermodehelper_exec_async, sub_info,
 				    CLONE_PARENT | SIGCHLD);
+
+		if(sub_info->cleanup_intermediate) {
+			sub_info->cleanup_intermediate(sub_info);
+		}
+		sub_info->cleaned =3D true;
 		if (pid < 0) {
 			sub_info->retval =3D pid;
 			umh_complete(sub_info);
@@ -499,25 +520,38 @@ static void helper_unlock(void)
  * @argv: arg vector for process
  * @envp: environment for process
  * @gfp_mask: gfp mask for memory allocation
- * @cleanup: a cleanup function
+ * @init_intermediate: init function which is called in parent task
+ * @cleanup_intermediate: clean function which is called in parent task
  * @init: an init function
+ * @cleanup: a cleanup function
  * @data: arbitrary context sensitive data
  *
  * Returns either %NULL on allocation failure, or a subprocess_info
  * structure.  This should be passed to call_usermodehelper_exec to
  * exec the process and free the structure.
  *
- * The init function is used to customize the helper process prior to
- * exec.  A non-zero return code causes the process to error out, exit,
- * and return the failure to the calling process
+ * The init_intermediate is called in the parent task of user mode
+ * helper. It's designed for init works which must be done in
+ * parent task, like switching the pid_ns_for_children.
+ *
+ * The cleanup_intermediate is used when we want to cleanup what
+ * we have done in init_intermediate, it is also called in parent
+ * task.
  *
- * The cleanup function is just before ethe subprocess_info is about to
+ * The init function is called after fork. It is used to customize the
+ * helper process prior to exec.  A non-zero return code causes the
+ * process to error out, exit, and return the failure to the
+ * calling process.
+ *
+ * The cleanup function is just before the subprocess_info is about to
  * be freed.  This can be used for freeing the argv and envp.  The
  * Function must be runnable in either a process context or the
  * context in which call_usermodehelper_exec is called.
  */
 struct subprocess_info *call_usermodehelper_setup(char *path, char **argv,
 		char **envp, gfp_t gfp_mask,
+		void (*init_intermediate)(struct subprocess_info *info),
+		void (*cleanup_intermediate)(struct subprocess_info *info),
 		int (*init)(struct subprocess_info *info, struct cred *new),
 		void (*cleanup)(struct subprocess_info *info),
 		void *data)
@@ -532,8 +566,11 @@ struct subprocess_info *call_usermodehelper_setup(char=
 *path, char **argv,
 	sub_info->argv =3D argv;
 	sub_info->envp =3D envp;
 =

-	sub_info->cleanup =3D cleanup;
+	sub_info->init_intermediate =3D init_intermediate;
+	sub_info->cleaned =3D false;
+	sub_info->cleanup_intermediate =3D cleanup_intermediate;
 	sub_info->init =3D init;
+	sub_info->cleanup =3D cleanup;
 	sub_info->data =3D data;
   out:
 	return sub_info;
@@ -619,7 +656,7 @@ int call_usermodehelper(char *path, char **argv, char *=
*envp, int wait)
 	gfp_t gfp_mask =3D (wait =3D=3D UMH_NO_WAIT) ? GFP_ATOMIC : GFP_KERNEL;
 =

 	info =3D call_usermodehelper_setup(path, argv, envp, gfp_mask,
-					 NULL, NULL, NULL);
+					 NULL, NULL, NULL, NULL, NULL);
 	if (info =3D=3D NULL)
 		return -ENOMEM;
 =

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index f6c2c1e..7a7c57a 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -345,7 +345,8 @@ int kobject_uevent_env(struct kobject *kobj, enum kobje=
ct_action action,
 		retval =3D -ENOMEM;
 		info =3D call_usermodehelper_setup(env->argv[0], env->argv,
 						 env->envp, GFP_KERNEL,
-						 NULL, cleanup_uevent_env, env);
+						 NULL, NULL, NULL,
+						 cleanup_uevent_env, env);
 		if (info) {
 			retval =3D call_usermodehelper_exec(info, UMH_NO_WAIT);
 			env =3D NULL;	/* freed by cleanup_uevent_env */
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 43affcf..51dfb38 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -78,8 +78,8 @@ static int call_usermodehelper_keys(char *path, char **ar=
gv, char **envp,
 	struct subprocess_info *info;
 =

 	info =3D call_usermodehelper_setup(path, argv, envp, GFP_KERNEL,
-					  umh_keys_init, umh_keys_cleanup,
-					  session_keyring);
+					 NULL, NULL, umh_keys_init,
+					 umh_keys_cleanup, session_keyring);
 	if (!info)
 		return -ENOMEM;
 =

-- =

2.9.3




--===============7649831148106294791==--

