Content-Type: multipart/mixed; boundary="===============1190196941202410038=="
MIME-Version: 1.0
From: Ondrej Mosnacek <omosnace@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH v4] kernfs: fix xattr name handling in LSM helpers
Date: Wed, 03 Apr 2019 09:29:41 +0200
Message-ID: <20190403072941.26520-1-omosnace@redhat.com>
In-Reply-To: <20190325145032.GB21359@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1190196941202410038==
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

Fix this by moving the xattr name reconstruction to the VFS xattr
handlers and replacing the kernfs_security_xattr_*() helpers with more
general kernfs_xattr_*() helpers that take full xattr name and allow
accessing all kernfs node's xattrs.

Reported-by: kernel test robot <rong.a.chen@intel.com>
Fixes: b230d5aba2d1 ("LSM: add new hook for kernfs node initialization")
Fixes: ec882da5cda9 ("selinux: implement the kernfs_init_security hook")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---

v4: fix function names and types to make it build...
v3: simplify kernfs xattr helpers as per Paul's suggestion
v2: just rebase to update diff context

 fs/kernfs/inode.c        | 62 ++++++++++++++--------------------------
 include/linux/kernfs.h   | 18 ++++++------
 security/selinux/hooks.c |  9 +++---
 3 files changed, 33 insertions(+), 56 deletions(-)

diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 673ef598d97d..f89a0f13840e 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -288,63 +288,57 @@ int kernfs_iop_permission(struct inode *inode, int ma=
sk)
 	return generic_permission(inode, mask);
 }
 =

-static int kernfs_node_xattr_get(const struct xattr_handler *handler,
-				 struct kernfs_node *kn, const char *suffix,
-				 void *value, size_t size)
+int kernfs_xattr_get(struct kernfs_node *kn, const char *name,
+		     void *value, size_t size)
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
-				 const void *value, size_t size, int flags)
+int kernfs_xattr_set(struct kernfs_node *kn, const char *name,
+		     const void *value, size_t size, int flags)
 {
-	const char *name =3D xattr_full_name(handler, suffix);
-	struct kernfs_iattrs *attrs;
-
-	attrs =3D kernfs_iattrs(kn);
+	struct kernfs_iattrs *attrs =3D kernfs_iattrs(kn);
 	if (!attrs)
 		return -ENOMEM;
 =

 	return simple_xattr_set(&attrs->xattrs, name, value, size, flags);
 }
 =

-static int kernfs_xattr_get(const struct xattr_handler *handler,
-			    struct dentry *unused, struct inode *inode,
-			    const char *suffix, void *value, size_t size)
+static int kernfs_vfs_xattr_get(const struct xattr_handler *handler,
+				struct dentry *unused, struct inode *inode,
+				const char *suffix, void *value, size_t size)
 {
+	const char *name =3D xattr_full_name(handler, suffix);
 	struct kernfs_node *kn =3D inode->i_private;
 =

-	return kernfs_node_xattr_get(handler, kn, suffix, value, size);
+	return kernfs_xattr_get(kn, name, value, size);
 }
 =

-static int kernfs_xattr_set(const struct xattr_handler *handler,
-			    struct dentry *unused, struct inode *inode,
-			    const char *suffix, const void *value,
-			    size_t size, int flags)
+static int kernfs_vfs_xattr_set(const struct xattr_handler *handler,
+				struct dentry *unused, struct inode *inode,
+				const char *suffix, const void *value,
+				size_t size, int flags)
 {
+	const char *name =3D xattr_full_name(handler, suffix);
 	struct kernfs_node *kn =3D inode->i_private;
 =

-	return kernfs_node_xattr_set(handler, kn, suffix, value, size, flags);
+	return kernfs_xattr_set(kn, name, value, size, flags);
 }
 =

 static const struct xattr_handler kernfs_trusted_xattr_handler =3D {
 	.prefix =3D XATTR_TRUSTED_PREFIX,
-	.get =3D kernfs_xattr_get,
-	.set =3D kernfs_xattr_set,
+	.get =3D kernfs_vfs_xattr_get,
+	.set =3D kernfs_vfs_xattr_set,
 };
 =

 static const struct xattr_handler kernfs_security_xattr_handler =3D {
 	.prefix =3D XATTR_SECURITY_PREFIX,
-	.get =3D kernfs_xattr_get,
-	.set =3D kernfs_xattr_set,
+	.get =3D kernfs_vfs_xattr_get,
+	.set =3D kernfs_vfs_xattr_set,
 };
 =

 const struct xattr_handler *kernfs_xattr_handlers[] =3D {
@@ -352,17 +346,3 @@ const struct xattr_handler *kernfs_xattr_handlers[] =
=3D {
 	&kernfs_security_xattr_handler,
 	NULL
 };
-
-int kernfs_security_xattr_get(struct kernfs_node *kn, const char *suffix,
-			      void *value, size_t size)
-{
-	return kernfs_node_xattr_get(&kernfs_security_xattr_handler,
-				     kn, suffix, value, size);
-}
-
-int kernfs_security_xattr_set(struct kernfs_node *kn, const char *suffix,
-			      void *value, size_t size, int flags)
-{
-	return kernfs_node_xattr_set(&kernfs_security_xattr_handler,
-				     kn, suffix, value, size, flags);
-}
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index 39eea07c2900..7987e0f89b69 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -371,10 +371,10 @@ __poll_t kernfs_generic_poll(struct kernfs_open_file =
*of,
 			     struct poll_table_struct *pt);
 void kernfs_notify(struct kernfs_node *kn);
 =

-int kernfs_security_xattr_get(struct kernfs_node *kn, const char *suffix,
-			      void *value, size_t size);
-int kernfs_security_xattr_set(struct kernfs_node *kn, const char *suffix,
-			      void *value, size_t size, int flags);
+int kernfs_xattr_get(struct kernfs_node *kn, const char *name,
+		     void *value, size_t size);
+int kernfs_xattr_set(struct kernfs_node *kn, const char *name,
+		     const void *value, size_t size, int flags);
 =

 const void *kernfs_super_ns(struct super_block *sb);
 int kernfs_get_tree(struct fs_context *fc);
@@ -478,14 +478,12 @@ static inline int kernfs_setattr(struct kernfs_node *=
kn,
 =

 static inline void kernfs_notify(struct kernfs_node *kn) { }
 =

-static inline int kernfs_security_xattr_get(struct kernfs_node *kn,
-					    const char *suffix, void *value,
-					    size_t size)
+static inline int kernfs_xattr_get(struct kernfs_node *kn, const char *nam=
e,
+				   void *value, size_t size)
 { return -ENOSYS; }
 =

-static inline int kernfs_security_xattr_set(struct kernfs_node *kn,
-					    const char *suffix, void *value,
-					    size_t size, int flags)
+static inline int kernfs_xattr_set(struct kernfs_node *kn, const char *nam=
e,
+				   const void *value, size_t size, int flags)
 { return -ENOSYS; }
 =

 static inline const void *kernfs_super_ns(struct super_block *sb)
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index b6e61524d68d..d5fdcb0d26fe 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3394,7 +3394,7 @@ static int selinux_kernfs_init_security(struct kernfs=
_node *kn_dir,
 	int rc;
 	char *context;
 =

-	rc =3D kernfs_security_xattr_get(kn_dir, XATTR_SELINUX_SUFFIX, NULL, 0);
+	rc =3D kernfs_xattr_get(kn_dir, XATTR_NAME_SELINUX, NULL, 0);
 	if (rc =3D=3D -ENODATA)
 		return 0;
 	else if (rc < 0)
@@ -3405,8 +3405,7 @@ static int selinux_kernfs_init_security(struct kernfs=
_node *kn_dir,
 	if (!context)
 		return -ENOMEM;
 =

-	rc =3D kernfs_security_xattr_get(kn_dir, XATTR_SELINUX_SUFFIX, context,
-				       clen);
+	rc =3D kernfs_xattr_get(kn_dir, XATTR_NAME_SELINUX, context, clen);
 	if (rc < 0) {
 		kfree(context);
 		return rc;
@@ -3439,8 +3438,8 @@ static int selinux_kernfs_init_security(struct kernfs=
_node *kn_dir,
 	if (rc)
 		return rc;
 =

-	rc =3D kernfs_security_xattr_set(kn, XATTR_SELINUX_SUFFIX, context, clen,
-				       XATTR_CREATE);
+	rc =3D kernfs_xattr_set(kn, XATTR_NAME_SELINUX, context, clen,
+			      XATTR_CREATE);
 	kfree(context);
 	return rc;
 }
-- =

2.20.1


--===============1190196941202410038==--

