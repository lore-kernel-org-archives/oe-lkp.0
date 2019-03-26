Content-Type: multipart/mixed; boundary="===============0745268305209635243=="
MIME-Version: 1.0
From: Ondrej Mosnacek <omosnace@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH v2] kernfs: fix xattr name handling in LSM helpers
Date: Tue, 26 Mar 2019 13:12:10 +0100
Message-ID: <20190326121210.17414-1-omosnace@redhat.com>
In-Reply-To: <20190325145032.GB21359@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0745268305209635243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The implementation of kernfs_security_xattr_*() helpers reuses the
kernfs_node_xattr_*() functions, which take the suffix of the xattr name
and extract full xattr name from it using xattr_full_name(). However,
this function relies on the fact that the suffix passed to xattr
handlers from VFS is always constructed from the full name by just
incerementing the pointer. This doesn't necessarily hold for the callers
of kernfs_security_xattr_*(), so their usage will easily lead to
out-of-bounds access.

Fix this by converting the helpers to take the full xattr name instead
of just the suffix and moving the reconstruction to the xattr handlers.
We now need to check if the prefix is correct in the helpers, but it
saves us the difficulty of reconstructing the full name from just the
plain suffix.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Fixes: b230d5aba2d1 ("LSM: add new hook for kernfs node initialization")
Fixes: ec882da5cda9 ("selinux: implement the kernfs_init_security hook")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---

v2: Rebase on current selinux/next.

 fs/kernfs/inode.c        | 38 ++++++++++++++++++--------------------
 include/linux/kernfs.h   |  8 ++++----
 security/selinux/hooks.c |  6 +++---
 3 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 673ef598d97d..1daa8aa9ec96 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -288,28 +288,20 @@ int kernfs_iop_permission(struct inode *inode, int ma=
sk)
 	return generic_permission(inode, mask);
 }
 =

-static int kernfs_node_xattr_get(const struct xattr_handler *handler,
-				 struct kernfs_node *kn, const char *suffix,
+static int kernfs_node_xattr_get(struct kernfs_node *kn, const char *name,
 				 void *value, size_t size)
 {
-	const char *name =3D xattr_full_name(handler, suffix);
-	struct kernfs_iattrs *attrs;
-
-	attrs =3D kernfs_iattrs_noalloc(kn);
+	struct kernfs_iattrs *attrs =3D kernfs_iattrs_noalloc(kn);
 	if (!attrs)
 		return -ENODATA;
 =

 	return simple_xattr_get(&attrs->xattrs, name, value, size);
 }
 =

-static int kernfs_node_xattr_set(const struct xattr_handler *handler,
-				 struct kernfs_node *kn, const char *suffix,
+static int kernfs_node_xattr_set(struct kernfs_node *kn, const char *name,
 				 const void *value, size_t size, int flags)
 {
-	const char *name =3D xattr_full_name(handler, suffix);
-	struct kernfs_iattrs *attrs;
-
-	attrs =3D kernfs_iattrs(kn);
+	struct kernfs_iattrs *attrs =3D kernfs_iattrs(kn);
 	if (!attrs)
 		return -ENOMEM;
 =

@@ -320,9 +312,10 @@ static int kernfs_xattr_get(const struct xattr_handler=
 *handler,
 			    struct dentry *unused, struct inode *inode,
 			    const char *suffix, void *value, size_t size)
 {
+	const char *name =3D xattr_full_name(handler, suffix);
 	struct kernfs_node *kn =3D inode->i_private;
 =

-	return kernfs_node_xattr_get(handler, kn, suffix, value, size);
+	return kernfs_node_xattr_get(kn, name, value, size);
 }
 =

 static int kernfs_xattr_set(const struct xattr_handler *handler,
@@ -330,9 +323,10 @@ static int kernfs_xattr_set(const struct xattr_handler=
 *handler,
 			    const char *suffix, const void *value,
 			    size_t size, int flags)
 {
+	const char *name =3D xattr_full_name(handler, suffix);
 	struct kernfs_node *kn =3D inode->i_private;
 =

-	return kernfs_node_xattr_set(handler, kn, suffix, value, size, flags);
+	return kernfs_node_xattr_set(kn, name, value, size, flags);
 }
 =

 static const struct xattr_handler kernfs_trusted_xattr_handler =3D {
@@ -353,16 +347,20 @@ const struct xattr_handler *kernfs_xattr_handlers[] =
=3D {
 	NULL
 };
 =

-int kernfs_security_xattr_get(struct kernfs_node *kn, const char *suffix,
+int kernfs_security_xattr_get(struct kernfs_node *kn, const char *name,
 			      void *value, size_t size)
 {
-	return kernfs_node_xattr_get(&kernfs_security_xattr_handler,
-				     kn, suffix, value, size);
+	if (WARN_ON_ONCE(!strstarts(name, XATTR_SECURITY_PREFIX)))
+		return -EINVAL;
+
+	return kernfs_node_xattr_get(kn, name, value, size);
 }
 =

-int kernfs_security_xattr_set(struct kernfs_node *kn, const char *suffix,
+int kernfs_security_xattr_set(struct kernfs_node *kn, const char *name,
 			      void *value, size_t size, int flags)
 {
-	return kernfs_node_xattr_set(&kernfs_security_xattr_handler,
-				     kn, suffix, value, size, flags);
+	if (WARN_ON_ONCE(!strstarts(name, XATTR_SECURITY_PREFIX)))
+		return -EINVAL;
+
+	return kernfs_node_xattr_set(kn, name, value, size, flags);
 }
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index 39eea07c2900..196a98cf39ed 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -371,9 +371,9 @@ __poll_t kernfs_generic_poll(struct kernfs_open_file *o=
f,
 			     struct poll_table_struct *pt);
 void kernfs_notify(struct kernfs_node *kn);
 =

-int kernfs_security_xattr_get(struct kernfs_node *kn, const char *suffix,
+int kernfs_security_xattr_get(struct kernfs_node *kn, const char *name,
 			      void *value, size_t size);
-int kernfs_security_xattr_set(struct kernfs_node *kn, const char *suffix,
+int kernfs_security_xattr_set(struct kernfs_node *kn, const char *name,
 			      void *value, size_t size, int flags);
 =

 const void *kernfs_super_ns(struct super_block *sb);
@@ -479,12 +479,12 @@ static inline int kernfs_setattr(struct kernfs_node *=
kn,
 static inline void kernfs_notify(struct kernfs_node *kn) { }
 =

 static inline int kernfs_security_xattr_get(struct kernfs_node *kn,
-					    const char *suffix, void *value,
+					    const char *name, void *value,
 					    size_t size)
 { return -ENOSYS; }
 =

 static inline int kernfs_security_xattr_set(struct kernfs_node *kn,
-					    const char *suffix, void *value,
+					    const char *name, void *value,
 					    size_t size, int flags)
 { return -ENOSYS; }
 =

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index b6e61524d68d..43f1f244b7de 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3394,7 +3394,7 @@ static int selinux_kernfs_init_security(struct kernfs=
_node *kn_dir,
 	int rc;
 	char *context;
 =

-	rc =3D kernfs_security_xattr_get(kn_dir, XATTR_SELINUX_SUFFIX, NULL, 0);
+	rc =3D kernfs_security_xattr_get(kn_dir, XATTR_NAME_SELINUX, NULL, 0);
 	if (rc =3D=3D -ENODATA)
 		return 0;
 	else if (rc < 0)
@@ -3405,7 +3405,7 @@ static int selinux_kernfs_init_security(struct kernfs=
_node *kn_dir,
 	if (!context)
 		return -ENOMEM;
 =

-	rc =3D kernfs_security_xattr_get(kn_dir, XATTR_SELINUX_SUFFIX, context,
+	rc =3D kernfs_security_xattr_get(kn_dir, XATTR_NAME_SELINUX, context,
 				       clen);
 	if (rc < 0) {
 		kfree(context);
@@ -3439,7 +3439,7 @@ static int selinux_kernfs_init_security(struct kernfs=
_node *kn_dir,
 	if (rc)
 		return rc;
 =

-	rc =3D kernfs_security_xattr_set(kn, XATTR_SELINUX_SUFFIX, context, clen,
+	rc =3D kernfs_security_xattr_set(kn, XATTR_NAME_SELINUX, context, clen,
 				       XATTR_CREATE);
 	kfree(context);
 	return rc;
-- =

2.20.1


--===============0745268305209635243==--

