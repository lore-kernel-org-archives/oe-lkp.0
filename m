Content-Type: multipart/mixed; boundary="===============3159988250110197636=="
MIME-Version: 1.0
From: Cao Shufeng <caosf.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: [PATCH_v4.1_3_3] Make core_pattern support namespace
Date: Wed, 08 Feb 2017 11:00:57 +0800
Message-ID: <1486522857-9946-4-git-send-email-caosf.fnst@cn.fujitsu.com>
In-Reply-To: <1486522857-9946-1-git-send-email-caosf.fnst@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3159988250110197636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Zhao Lei <zhaolei@cn.fujitsu.com>

Currently, each container shared one copy of coredump setting
with the host system, if host system changed the setting, each
running containers will be affected.
Same story happened when container changed core_pattern, both
host and other container will be affected.

For container based on namespace design, it is good to allow
each container keeping their own coredump setting.

It will bring us following benefit:
1: Each container can change their own coredump setting
   based on operation on /proc/sys/kernel/core_pattern
2: Coredump setting changed in host will not affect
   running containers.
3: Support both case of "putting coredump in guest" and
   "putting curedump in host".

Each namespace-based software(lxc, docker, ..) can use this function
to custom their dump setting.

And this function makes each continer working as separate system,
it fit for design goal of namespace.

Test(in lxc):
 # In the host
 # ----------------
 # echo host_core >/proc/sys/kernel/core_pattern
 # cat /proc/sys/kernel/core_pattern
 host_core
 # ulimit -c 1024000
 # ./make_dump
 Segmentation fault (core dumped)
 # ls -l
 -rw------- 1 root root 331776 Feb  4 18:02 host_core.2175
 -rwxr-xr-x 1 root root 759731 Feb  4 18:01 make_dump
 #

 # In the container
 # ----------------
 # cat /proc/sys/kernel/core_pattern
 host_core
 # echo container_core >/proc/sys/kernel/core_pattern
 # ./make_dump
 Segmentation fault (core dumped)
 # ls -l
 -rwxr-xr-x    1 root     root       759731 Feb  4 10:45 make_dump
 -rw-------    1 root     root       331776 Feb  4 10:45 container_core.16
 #

 # Return to host
 # ----------------
 # cat /proc/sys/kernel/core_pattern
 host_core
 # ls
 host_core.2175  make_dump  make_dump.c
 # rm -f host_core.2175
 # ./make_dump
 Segmentation fault (core dumped)
 # ls -l
 -rw------- 1 root root 331776 Feb  4 18:49 host_core.2351
 -rwxr-xr-x 1 root root 759731 Feb  4 18:01 make_dump
 #

Signed-off-by: Zhao Lei <zhaolei@cn.fujitsu.com>
---
 fs/coredump.c                 | 25 ++++++++++++++++------
 include/linux/pid_namespace.h |  3 +++
 kernel/pid.c                  |  2 ++
 kernel/pid_namespace.c        |  2 ++
 kernel/sysctl.c               | 50 ++++++++++++++++++++++++++++++++++++++-=
----
 5 files changed, 70 insertions(+), 12 deletions(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index 83282d7..4bab7bf 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -50,7 +50,6 @@
 =

 int core_uses_pid;
 unsigned int core_pipe_limit;
-char core_pattern[CORENAME_MAX_SIZE] =3D "core";
 static int core_name_size =3D CORENAME_MAX_SIZE;
 =

 struct core_name {
@@ -58,8 +57,6 @@ struct core_name {
 	int used, size;
 };
 =

-/* The maximal length of core_pattern is also specified in sysctl.c */
-
 static int expand_corename(struct core_name *cn, int size)
 {
 	char *corename =3D krealloc(cn->corename, size, GFP_KERNEL);
@@ -184,10 +181,10 @@ static int cn_print_exe_file(struct core_name *cn)
  * name into corename, which must have space for at least
  * CORENAME_MAX_SIZE bytes plus one byte for the zero terminator.
  */
-static int format_corename(struct core_name *cn, struct coredump_params *c=
prm)
+static int format_corename(struct core_name *cn, const char *pat_ptr,
+			   struct coredump_params *cprm)
 {
 	const struct cred *cred =3D current_cred();
-	const char *pat_ptr =3D core_pattern;
 	int ispipe =3D (*pat_ptr =3D=3D '|');
 	int pid_in_pattern =3D 0;
 	int err =3D 0;
@@ -666,6 +663,8 @@ void do_coredump(const siginfo_t *siginfo)
 		 */
 		.mm_flags =3D mm->flags,
 	};
+	struct pid_namespace *pid_ns;
+	char core_pattern[CORENAME_MAX_SIZE];
 =

 	audit_core_dumps(siginfo->si_signo);
 =

@@ -675,6 +674,18 @@ void do_coredump(const siginfo_t *siginfo)
 	if (!__get_dumpable(cprm.mm_flags))
 		goto fail;
 =

+	pid_ns =3D task_active_pid_ns(current);
+	spin_lock(&pid_ns->core_pattern_lock);
+	while (pid_ns !=3D &init_pid_ns) {
+		if (pid_ns->core_pattern[0])
+			break;
+		spin_unlock(&pid_ns->core_pattern_lock);
+		pid_ns =3D pid_ns->parent,
+		spin_lock(&pid_ns->core_pattern_lock);
+	}
+	strcpy(core_pattern, pid_ns->core_pattern);
+	spin_unlock(&pid_ns->core_pattern_lock);
+
 	cred =3D prepare_creds();
 	if (!cred)
 		goto fail;
@@ -696,7 +707,7 @@ void do_coredump(const siginfo_t *siginfo)
 =

 	old_cred =3D override_creds(cred);
 =

-	ispipe =3D format_corename(&cn, &cprm);
+	ispipe =3D format_corename(&cn, core_pattern, &cprm);
 =

 	if (ispipe) {
 		int dump_count;
@@ -743,7 +754,7 @@ void do_coredump(const siginfo_t *siginfo)
 		}
 =

 		rcu_read_lock();
-		vinit_task =3D find_task_by_vpid(1);
+		vinit_task =3D find_task_by_pid_ns(1, pid_ns);
 		rcu_read_unlock();
 		if (!vinit_task) {
 			printk(KERN_WARNING "failed getting init task info, skipping core dump\=
n");
diff --git a/include/linux/pid_namespace.h b/include/linux/pid_namespace.h
index 34cce96..f0b0c21 100644
--- a/include/linux/pid_namespace.h
+++ b/include/linux/pid_namespace.h
@@ -9,6 +9,7 @@
 #include <linux/nsproxy.h>
 #include <linux/kref.h>
 #include <linux/ns_common.h>
+#include <linux/binfmts.h>
 =

 struct pidmap {
        atomic_t nr_free;
@@ -46,6 +47,8 @@ struct pid_namespace {
 	int hide_pid;
 	int reboot;	/* group exit code if this pidns was rebooted */
 	struct ns_common ns;
+	spinlock_t core_pattern_lock;
+	char core_pattern[CORENAME_MAX_SIZE];
 };
 =

 extern struct pid_namespace init_pid_ns;
diff --git a/kernel/pid.c b/kernel/pid.c
index f66162f..e7ee122 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -83,6 +83,8 @@ struct pid_namespace init_pid_ns =3D {
 #ifdef CONFIG_PID_NS
 	.ns.ops =3D &pidns_operations,
 #endif
+	.core_pattern_lock =3D __SPIN_LOCK_UNLOCKED(init_pid_ns.core_pattern_lock=
),
+	.core_pattern =3D "core",
 };
 EXPORT_SYMBOL_GPL(init_pid_ns);
 =

diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index df9e8e9..c70ca5d 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -137,6 +137,8 @@ static struct pid_namespace *create_pid_namespace(struc=
t user_namespace *user_ns
 	for (i =3D 1; i < PIDMAP_ENTRIES; i++)
 		atomic_set(&ns->pidmap[i].nr_free, BITS_PER_PAGE);
 =

+	spin_lock_init(&ns->core_pattern_lock);
+
 	return ns;
 =

 out_free_map:
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 706309f..c73ced5 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -484,7 +484,7 @@ static struct ctl_table kern_table[] =3D {
 	},
 	{
 		.procname	=3D "core_pattern",
-		.data		=3D core_pattern,
+		.data		=3D NULL,
 		.maxlen		=3D CORENAME_MAX_SIZE,
 		.mode		=3D 0644,
 		.proc_handler	=3D proc_dostring_coredump,
@@ -2401,12 +2401,20 @@ int proc_dointvec_minmax(struct ctl_table *table, i=
nt write,
 static void validate_coredump_safety(void)
 {
 #ifdef CONFIG_COREDUMP
+	struct pid_namespace *pid_ns =3D task_active_pid_ns(current);
+	const char *core_pattern;
+
+	spin_lock(&pid_ns->core_pattern_lock);
+	core_pattern =3D pid_ns->core_pattern;
+
 	if (suid_dumpable =3D=3D SUID_DUMP_ROOT &&
 	    core_pattern[0] !=3D '/' && core_pattern[0] !=3D '|') {
 		printk(KERN_WARNING "Unsafe core_pattern used with "\
 			"suid_dumpable=3D2. Pipe handler or fully qualified "\
 			"core dump path required.\n");
 	}
+
+	spin_unlock(&pid_ns->core_pattern_lock);
 #endif
 }
 =

@@ -2423,10 +2431,42 @@ static int proc_dointvec_minmax_coredump(struct ctl=
_table *table, int write,
 static int proc_dostring_coredump(struct ctl_table *table, int write,
 		  void __user *buffer, size_t *lenp, loff_t *ppos)
 {
-	int error =3D proc_dostring(table, write, buffer, lenp, ppos);
-	if (!error)
-		validate_coredump_safety();
-	return error;
+	int ret;
+	char core_pattern[CORENAME_MAX_SIZE];
+	struct pid_namespace *pid_ns =3D task_active_pid_ns(current);
+
+	if (write) {
+		if (*ppos && sysctl_writes_strict =3D=3D SYSCTL_WRITES_WARN)
+			warn_sysctl_write(table);
+
+		ret =3D _proc_do_string(core_pattern, table->maxlen, write,
+				      (char __user *)buffer, lenp, ppos);
+		if (ret)
+			return ret;
+
+		spin_lock(&pid_ns->core_pattern_lock);
+		strcpy(pid_ns->core_pattern, core_pattern);
+		spin_unlock(&pid_ns->core_pattern_lock);
+	} else {
+		spin_lock(&pid_ns->core_pattern_lock);
+		while (pid_ns !=3D &init_pid_ns) {
+			if (pid_ns->core_pattern[0])
+				break;
+			spin_unlock(&pid_ns->core_pattern_lock);
+			pid_ns =3D pid_ns->parent,
+			spin_lock(&pid_ns->core_pattern_lock);
+		}
+		strcpy(core_pattern, pid_ns->core_pattern);
+		spin_unlock(&pid_ns->core_pattern_lock);
+
+		ret =3D _proc_do_string(core_pattern, table->maxlen, write,
+				      (char __user *)buffer, lenp, ppos);
+		if (ret)
+			return ret;
+	}
+
+	validate_coredump_safety();
+	return 0;
 }
 #endif
 =

-- =

2.9.3




--===============3159988250110197636==--

