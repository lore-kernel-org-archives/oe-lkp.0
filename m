Content-Type: multipart/mixed; boundary="===============0104716972464791681=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: [PATCH 2/3] Enable capabilities of files from shared filesystem
Date: Thu, 22 Jun 2017 14:59:48 -0400
Message-ID: <1498157989-11814-3-git-send-email-stefanb@linux.vnet.ibm.com>
In-Reply-To: <1498157989-11814-1-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0104716972464791681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The previous patch changed existing behavior in so far as the
capabilities of files from a shared filesystem or bind-mounted files
were hidden from a user namespace. This patch makes these capabilties
visible to the user namespace again, unless the user namespace has set
its own capabilities, which will hide them until those set by the
user namespace are removed.

Also the listing of xattrs is adjusted. To avoid double listing of
names of extended attributes, which can happen if the container and the
host for example have security.capability, we now check that we do not
add the same extended attribute to the list twice.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: Serge Hallyn <serge@hallyn.com>
Reviewed-by: Serge Hallyn <serge@hallyn.com>
---
 fs/xattr.c | 90 ++++++++++++++++++++++++++++++++++++++++++++--------------=
----
 1 file changed, 64 insertions(+), 26 deletions(-)

diff --git a/fs/xattr.c b/fs/xattr.c
index 64c4b40..045be85 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -339,6 +339,26 @@ xattr_rewrite_userns_xattr(char *name)
 }
 =

 /*
+ * xattr_list_contains - check whether an xattr list already contains a ne=
edle
+ *
+ * @list    : 0-byte separated strings
+ * @listlen : length of the list
+ * @needle  : the needle to search for
+ */
+static int
+xattr_list_contains(const char *list, size_t listlen, const char *needle)
+{
+	size_t o =3D 0;
+
+	while (o < listlen) {
+		if (!strcmp(&list[o], needle))
+			return true;
+		o +=3D strlen(&list[o]) + 1;
+	}
+	return false;
+}
+
+/*
  * xattr_list_userns_rewrite - Rewrite list of xattr names for user namesp=
aces
  *                             or determine needed size for attribute list
  *                             in case size =3D=3D 0
@@ -377,12 +397,16 @@ xattr_list_userns_rewrite(char *list, ssize_t size, s=
ize_t list_maxlen)
 		if (!len)
 			break;
 =

-		newname =3D xattr_rewrite_userns_xattr(name);
-		if (IS_ERR(newname)) {
-			d_off =3D PTR_ERR(newname);
-			goto out_free;
+		if (xattr_is_userns_supported(name, false) >=3D 0)
+			newname =3D name;
+		else {
+			newname =3D xattr_rewrite_userns_xattr(name);
+			if (IS_ERR(newname)) {
+				d_off =3D PTR_ERR(newname);
+				goto out_free;
+			}
 		}
-		if (newname) {
+		if (newname && !xattr_list_contains(nlist, d_off, newname)) {
 			nlen =3D strlen(newname);
 =

 			if (nlist) {
@@ -413,13 +437,19 @@ xattr_list_userns_rewrite(char *list, ssize_t size, s=
ize_t list_maxlen)
  * security.foo to protect these extended attributes.
  *
  * Reading:
- * 1) Reading security.foo from a user namespace will read
- *    security.foo(a)uid=3D<uid> of the parent user namespace instead with=
 uid
- *    being the mapping of root in that parent user namespace. An
- *    exception is if root is mapped to uid 0 on the host, and in this case
- *    we will read security.foo directly.
- *    -> reading security.foo will read security.foo(a)uid=3D1000 for a uid
- *       mapping of root to 1000.
+ * 1a) Reading security.foo from a user namespace will read
+ *     security.foo(a)uid=3D<uid> of the parent user namespace instead wit=
h uid
+ *     being the mapping of root in that parent user namespace. An
+ *     exception is if root is mapped to uid 0 on the host, and in this ca=
se
+ *     we will read security.foo directly.
+ *     -> reading security.foo will read security.foo(a)uid=3D1000 for a u=
id
+ *        mapping of root to 1000.
+ *
+ * 1b) If security.foo(a)uid=3D<uid> is not available, the security.foo of=
 the
+ *     parent namespace is tried to be read. This procedure is repeated up=
 to
+ *     the init user namespace. This step only applies for reading of exte=
nded
+ *     attributes and provides the same behavior as older systems where the
+ *     host's extended attributes applied to user namespaces.
  *
  * 2) All security.foo(a)uid=3D<uid> with valid uid mappings in the user n=
amespace
  *    an be read. The uid within the user namespace will be mapped to the
@@ -434,7 +464,7 @@ xattr_list_userns_rewrite(char *list, ssize_t size, siz=
e_t list_maxlen)
  * 3) No other security.foo* can be read.
  *
  * Writing and removing:
- * The same rules for reading apply to writing and removing.
+ * The same rules for reading apply to writing and removing, except for 1b=
).
  *
  * This function returns a buffer with either the original name or the
  * user namespace adjusted name of the extended attribute.
@@ -444,11 +474,12 @@ xattr_list_userns_rewrite(char *list, ssize_t size, s=
ize_t list_maxlen)
  * @is_write: whether this is for writing an xattr
  */
 char *
-xattr_userns_name(const char *fullname, const char *suffix)
+xattr_userns_name(const char *fullname, const char *suffix,
+		  struct user_namespace *userns)
 {
 	size_t buflen;
 	char *buffer, *ptr, *n_uidstr;
-	kuid_t root_uid =3D make_kuid(current_user_ns(), 0);
+	kuid_t root_uid =3D make_kuid(userns, 0);
 	int idx, error;
 	size_t len =3D 0, slen;
 =

@@ -467,7 +498,7 @@ xattr_userns_name(const char *fullname, const char *suf=
fix)
 		 * init_user_ns or userns with root mapped to uid 0
 		 * may read security.foo directly
 		 */
-		if (current_user_ns() =3D=3D &init_user_ns ||
+		if (userns =3D=3D &init_user_ns ||
 		    __kuid_val(root_uid) =3D=3D 0)
 			goto out_copy;
 =

@@ -485,7 +516,7 @@ xattr_userns_name(const char *fullname, const char *suf=
fix)
 	 * We must have fullname[len] =3D=3D '@'.
 	 */
 	error =3D xattr_parse_uid_make_kuid(&fullname[len],
-					  current_user_ns(),
+					  userns,
 					  &n_uidstr);
 	if (error)
 		return ERR_PTR(error);
@@ -540,7 +571,7 @@ __vfs_setxattr(struct dentry *dentry, struct inode *ino=
de, const char *name,
 		return -EOPNOTSUPP;
 	if (size =3D=3D 0)
 		value =3D "";  /* empty EA, do not remove */
-	nsuffix =3D xattr_userns_name(fullname, name);
+	nsuffix =3D xattr_userns_name(fullname, name, current_user_ns());
 	if (IS_ERR(nsuffix))
 		return PTR_ERR(nsuffix);
 	ret =3D handler->set(handler, dentry, inode, nsuffix, value, size, flags);
@@ -703,18 +734,24 @@ __vfs_getxattr(struct dentry *dentry, struct inode *i=
node, const char *name,
 	const struct xattr_handler *handler;
 	char *nsuffix;
 	const char *fullname =3D name;
-	int ret;
+	int ret, userns_supt_xattr;
+	struct user_namespace *userns =3D current_user_ns();
 =

 	handler =3D xattr_resolve_name(inode, &name);
 	if (IS_ERR(handler))
 		return PTR_ERR(handler);
 	if (!handler->get)
 		return -EOPNOTSUPP;
-	nsuffix =3D xattr_userns_name(fullname, name);
-	if (IS_ERR(nsuffix))
-		return PTR_ERR(nsuffix);
-	ret =3D handler->get(handler, dentry, inode, nsuffix, value, size);
-	kfree(nsuffix);
+	userns_supt_xattr =3D (xattr_is_userns_supported(fullname, false) >=3D 0);
+	do {
+		nsuffix =3D xattr_userns_name(fullname, name, userns);
+		if (IS_ERR(nsuffix))
+			return PTR_ERR(nsuffix);
+		ret =3D handler->get(handler, dentry, inode, nsuffix, value,
+				   size);
+		kfree(nsuffix);
+		userns =3D userns->parent;
+	} while ((ret =3D=3D -ENODATA) && userns && userns_supt_xattr);
 	return ret;
 }
 EXPORT_SYMBOL(__vfs_getxattr);
@@ -737,7 +774,8 @@ vfs_getxattr(struct dentry *dentry, const char *name, v=
oid *value, size_t size)
 				XATTR_SECURITY_PREFIX_LEN)) {
 		int ret;
 		const char *suffix =3D name + XATTR_SECURITY_PREFIX_LEN;
-		char *nsuffix =3D xattr_userns_name(name, suffix);
+		char *nsuffix =3D xattr_userns_name(name, suffix,
+						  current_user_ns());
 =

 		if (IS_ERR(nsuffix))
 			return PTR_ERR(nsuffix);
@@ -794,7 +832,7 @@ __vfs_removexattr(struct dentry *dentry, const char *na=
me)
 		return PTR_ERR(handler);
 	if (!handler->set)
 		return -EOPNOTSUPP;
-	nsuffix =3D xattr_userns_name(fullname, name);
+	nsuffix =3D xattr_userns_name(fullname, name, current_user_ns());
 	if (IS_ERR(nsuffix))
 		return PTR_ERR(nsuffix);
 	ret =3D handler->set(handler, dentry, inode, nsuffix, NULL, 0,
-- =

2.7.4


--===============0104716972464791681==--

