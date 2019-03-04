Content-Type: multipart/mixed; boundary="===============1106137169356942775=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Tue, 05 Mar 2019 00:16:09 +0900
Message-ID: <20190305001609.10f950fd4f8089e1ae07c9f1@kernel.org>
In-Reply-To: <20190304180610.2d4f6f08d9ad89d6abae3597@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1106137169356942775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, 4 Mar 2019 18:06:10 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Sun, 3 Mar 2019 18:37:59 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> =

> > On Sun, Mar 3, 2019 at 5:14 PM Masami Hiramatsu <mhiramat@kernel.org>=
 wrote:
> > >
> > > I think it comes from WARN_ON_ONCE(!segment_eq(get_fs(), USER_DS)) in
> > > user_access_ok(). The call trace shows that strndup_user might be cal=
led
> > > from kernel daemon context.
> > =

> > Ahh, yes.
> > =

> > We've had this before. We've gotten rid of the actual "use system
> > calls", but we still have some of the init sequence in particular just
> > calling the wrappers instead.
> =

> Are those safe if we are in init sequence?
> =

> > =

> > And yes, ksys_mount() takes __user pointers.
> > =

> > It would be a lot better to use "do_mount()", which is the interface
> > that takes actual "char *" pointers.
> =

> Unfortunately, it still takes a __user pointer.
> =

> long do_mount(const char *dev_name, const char __user *dir_name,
>                 const char *type_page, unsigned long flags, void *data_pa=
ge)
> =

> So what we need is
> =

> long do_mount(const char *dev_name, struct path *dir_path,
>                 const char *type_page, unsigned long flags, void *data_pa=
ge)
> =

> or introduce kern_do_mount()?

Would this work?

( BTW, what is this code for? It seems totally insane termination.
  at least this should be done in copy_mount_options().
	if (data_page)
		((char *)data_page)[PAGE_SIZE - 1] =3D 0;
)

=3D=3D=3D=3D=3D=3D=3D
devtmpfs: Avoid passing kernel memory to __user parameter

From: Masami Hiramatsu <mhiramat@kernel.org>

Since ksys_mount(), ksys_chdir() and ksys_chroot() takes
__user parameters, devtmpfsd must not pass the kernel memory
to them. On some arch, it is not possible to pass th kernel
memory to them, since the memory address spaces can be
different.

This introduces kern_do_mount(), kern_chdir() and kern_chroot()
and replaces ksys_* in devtmpfsd().

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 drivers/base/devtmpfs.c  |   12 +++++++++---
 fs/namespace.c           |   31 +++++++++++++++++++++++++------
 fs/open.c                |   34 ++++++++++++++++++++++++++++++----
 include/linux/fs.h       |    2 ++
 include/linux/syscalls.h |    6 ++++++
 5 files changed, 72 insertions(+), 13 deletions(-)

diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
index 0dbc43068eeb..e418b004d6c6 100644
--- a/drivers/base/devtmpfs.c
+++ b/drivers/base/devtmpfs.c
@@ -381,14 +381,20 @@ static int devtmpfsd(void *p)
 {
 	char options[] =3D "mode=3D0755";
 	int *err =3D p;
+
 	*err =3D ksys_unshare(CLONE_NEWNS);
 	if (*err)
 		goto out;
-	*err =3D ksys_mount("devtmpfs", "/", "devtmpfs", MS_SILENT, options);
+
+	*err =3D kern_do_mount("devtmpfs", "/", "devtmpfs", MS_SILENT, options);
+	if (*err)
+		goto out;
+	*err =3D kern_chdir("/.."); /* will traverse into overmounted root */
+	if (*err)
+		goto out;
+	*err =3D kern_chroot(".");
 	if (*err)
 		goto out;
-	ksys_chdir("/.."); /* will traverse into overmounted root */
-	ksys_chroot(".");
 	complete(&setup_done);
 	while (1) {
 		spin_lock(&req_lock);
diff --git a/fs/namespace.c b/fs/namespace.c
index 678ef175d63a..68a6b573107d 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2761,8 +2761,9 @@ char *copy_mount_string(const void __user *data)
  * Therefore, if this magic number is present, it carries no information
  * and must be discarded.
  */
-long do_mount(const char *dev_name, const char __user *dir_name,
-		const char *type_page, unsigned long flags, void *data_page)
+static inline long __do_mount(const char *dev_name, const char *kdir_name,
+		const char __user *dir_name, const char *type_page,
+		unsigned long flags, void *data_page)
 {
 	struct path path;
 	unsigned int mnt_flags =3D 0, sb_flags;
@@ -2773,14 +2774,14 @@ long do_mount(const char *dev_name, const char __us=
er *dir_name,
 		flags &=3D ~MS_MGC_MSK;
 =

 	/* Basic sanity checks */
-	if (data_page)
-		((char *)data_page)[PAGE_SIZE - 1] =3D 0;
-
 	if (flags & MS_NOUSER)
 		return -EINVAL;
 =

 	/* ... and get the mountpoint */
-	retval =3D user_path(dir_name, &path);
+	if (kdir_name)
+		retval =3D kern_path(kdir_name, LOOKUP_FOLLOW, &path);
+	else
+		retval =3D user_path(dir_name, &path);
 	if (retval)
 		return retval;
 =

@@ -2849,6 +2850,24 @@ long do_mount(const char *dev_name, const char __use=
r *dir_name,
 	return retval;
 }
 =

+long kern_do_mount(const char *dev_name, const char *dir_name,
+		   const char *type_page, unsigned long flags, void *data_page)
+{
+	return __do_mount(dev_name, dir_name, NULL, type_page, flags,
+			  data_page);
+}
+
+long do_mount(const char *dev_name, const char __user *dir_name,
+	      const char *type_page, unsigned long flags, void *data_page)
+{
+	/* This must come from copy_mount_options */
+	if (data_page)
+		((char *)data_page)[PAGE_SIZE - 1] =3D 0;
+
+	return __do_mount(dev_name, NULL, dir_name, type_page, flags,
+			  data_page);
+}
+
 static struct ucounts *inc_mnt_namespaces(struct user_namespace *ns)
 {
 	return inc_ucount(ns, current_euid(), UCOUNT_MNT_NAMESPACES);
diff --git a/fs/open.c b/fs/open.c
index 0285ce7dbd51..2a9eee753d3a 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -430,13 +430,16 @@ SYSCALL_DEFINE2(access, const char __user *, filename=
, int, mode)
 	return do_faccessat(AT_FDCWD, filename, mode);
 }
 =

-int ksys_chdir(const char __user *filename)
+static int __do_chdir(const char *kfname, const char __user *ufname)
 {
 	struct path path;
 	int error;
 	unsigned int lookup_flags =3D LOOKUP_FOLLOW | LOOKUP_DIRECTORY;
 retry:
-	error =3D user_path_at(AT_FDCWD, filename, lookup_flags, &path);
+	if (kfname)
+		error =3D kern_path(kfname, lookup_flags, &path);
+	else
+		error =3D user_path_at(AT_FDCWD, ufname, lookup_flags, &path);
 	if (error)
 		goto out;
 =

@@ -456,6 +459,16 @@ int ksys_chdir(const char __user *filename)
 	return error;
 }
 =

+int kern_chdir(const char *filename)
+{
+	return __do_chdir(filename, NULL);
+}
+
+int ksys_chdir(const char __user *filename)
+{
+	return __do_chdir(NULL, filename);
+}
+
 SYSCALL_DEFINE1(chdir, const char __user *, filename)
 {
 	return ksys_chdir(filename);
@@ -483,13 +496,16 @@ SYSCALL_DEFINE1(fchdir, unsigned int, fd)
 	return error;
 }
 =

-int ksys_chroot(const char __user *filename)
+static int __do_chroot(const char *kfname, const char __user *ufname)
 {
 	struct path path;
 	int error;
 	unsigned int lookup_flags =3D LOOKUP_FOLLOW | LOOKUP_DIRECTORY;
 retry:
-	error =3D user_path_at(AT_FDCWD, filename, lookup_flags, &path);
+	if (kfname)
+		error =3D kern_path(kfname, lookup_flags, &path);
+	else
+		error =3D user_path_at(AT_FDCWD, ufname, lookup_flags, &path);
 	if (error)
 		goto out;
 =

@@ -516,6 +532,16 @@ int ksys_chroot(const char __user *filename)
 	return error;
 }
 =

+int kern_chroot(const char *filename)
+{
+	return __do_chroot(filename, NULL);
+}
+
+int ksys_chroot(const char __user *filename)
+{
+	return __do_chroot(NULL, filename);
+}
+
 SYSCALL_DEFINE1(chroot, const char __user *, filename)
 {
 	return ksys_chroot(filename);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 29d8e2cfed0e..38be90b86435 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2279,6 +2279,8 @@ extern int may_umount_tree(struct vfsmount *);
 extern int may_umount(struct vfsmount *);
 extern long do_mount(const char *, const char __user *,
 		     const char *, unsigned long, void *);
+extern long kern_do_mount(const char *, const char *,
+		     const char *, unsigned long, void *);
 extern struct vfsmount *collect_mounts(const struct path *);
 extern void drop_collected_mounts(struct vfsmount *);
 extern int iterate_mounts(int (*)(struct vfsmount *, void *), void *,
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 257cccba3062..ec8bfca990c9 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1146,6 +1146,10 @@ asmlinkage long sys_ni_syscall(void);
  * Kernel code should not call syscalls (i.e., sys_xyzyyz()) directly.
  * Instead, use one of the functions which work equivalently, such as
  * the ksys_xyzyyz() functions prototyped below.
+ * However, ksys_xyzxyz() functions should be used carefully, because
+ * kernel must not pass kernel memory to __user parameter. Force type
+ * casting is meaningless, since those address will be accessed by
+ * copy_from_user() etc. which will reject accessing kernel memory.
  */
 =

 int ksys_mount(char __user *dev_name, char __user *dir_name, char __user *=
type,
@@ -1153,8 +1157,10 @@ int ksys_mount(char __user *dev_name, char __user *d=
ir_name, char __user *type,
 int ksys_umount(char __user *name, int flags);
 int ksys_dup(unsigned int fildes);
 int ksys_chroot(const char __user *filename);
+int kern_chroot(const char *filename);
 ssize_t ksys_write(unsigned int fd, const char __user *buf, size_t count);
 int ksys_chdir(const char __user *filename);
+int kern_chdir(const char *filename);
 int ksys_fchmod(unsigned int fd, umode_t mode);
 int ksys_fchown(unsigned int fd, uid_t user, gid_t group);
 int ksys_getdents64(unsigned int fd, struct linux_dirent64 __user *dirent,
-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============1106137169356942775==--

