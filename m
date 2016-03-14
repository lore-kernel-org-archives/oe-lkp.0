Content-Type: multipart/mixed; boundary="===============5550455764176038041=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [namei] fda89e6574: kernel BUG at fs/namei.c:679!
Date: Mon, 14 Mar 2016 03:10:01 +0000
Message-ID: <20160314031001.GY17997@ZenIV.linux.org.uk>
In-Reply-To: <871t7dhokl.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5550455764176038041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 08:48:26AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.lookups
> commit fda89e65743179d09e55bc6c265d06fa5efa8803 ("namei: untanlge lookup_=
fast()")

Unfortunately, while with my normal .config it reliably triggers an oops
in x86_pmu_enable() (with or without those patches), yours triggers nothing
but a pile of OOMs.  How much RAM do you give those suckers?  I'm _not_
testing those on bare hardware, obviously - it's KVM image.

FWIW, see below for hopefully cleaner fix (will fold once I manage to trigg=
er
the damn thing and verify that fix indeed fixes).  It's on top of offending
commit.  Folks, could you please check if it fixes that crap on your setup?

diff --git a/fs/namei.c b/fs/namei.c
index 7a5f79f..d721821 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1519,6 +1519,7 @@ static int lookup_fast(struct nameidata *nd,
 	struct vfsmount *mnt =3D nd->path.mnt;
 	struct dentry *dentry, *parent =3D nd->path.dentry;
 	int err;
+	int status =3D 1;
 =

 	/*
 	 * Rename seqlock is not required here because in the off chance
@@ -1555,54 +1556,45 @@ static int lookup_fast(struct nameidata *nd,
 			return -ECHILD;
 =

 		*seqp =3D seq;
-		if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE)) {
-			int status =3D d_revalidate(dentry, nd->flags);
-			if (unlikely(status <=3D 0)) {
-				if (unlazy_walk(nd, dentry, seq))
-					return -ECHILD;
-				if (status =3D=3D -ECHILD)
-					status =3D d_revalidate(dentry, nd->flags);
-				if (status <=3D 0) {
-					if (!status) {
-						d_invalidate(dentry);
-						status =3D 1;
-					}
-					dput(dentry);
-					return status;
-				}
-			}
+		if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE))
+			status =3D d_revalidate(dentry, nd->flags);
+		if (unlikely(status <=3D 0)) {
+			if (unlazy_walk(nd, dentry, seq))
+				return -ECHILD;
+			if (status =3D=3D -ECHILD)
+				status =3D d_revalidate(dentry, nd->flags);
+		} else {
+			/*
+			 * Note: do negative dentry check after revalidation in
+			 * case that drops it.
+			 */
+			if (unlikely(negative))
+				return -ENOENT;
+			path->mnt =3D mnt;
+			path->dentry =3D dentry;
+			if (likely(__follow_mount_rcu(nd, path, inode, seqp)))
+				return 0;
+			if (unlazy_walk(nd, dentry, seq))
+				return -ECHILD;
 		}
-		/*
-		 * Note: do negative dentry check after revalidation in
-		 * case that drops it.
-		 */
-		if (unlikely(negative))
-			return -ENOENT;
-		path->mnt =3D mnt;
-		path->dentry =3D dentry;
-		if (likely(__follow_mount_rcu(nd, path, inode, seqp)))
-			return 0;
-		if (unlazy_walk(nd, dentry, seq))
-			return -ECHILD;
 	} else {
 		dentry =3D __d_lookup(parent, &nd->last);
 		if (unlikely(!dentry))
 			return 1;
-		if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE)) {
-			int status =3D d_revalidate(dentry, nd->flags);
-			if (unlikely(status <=3D 0)) {
-				if (!status) {
-					d_invalidate(dentry);
-					status =3D 1;
-				}
-				dput(dentry);
-				return status;
-			}
-		}
-		if (unlikely(d_is_negative(dentry))) {
-			dput(dentry);
-			return -ENOENT;
+		if (unlikely(dentry->d_flags & DCACHE_OP_REVALIDATE))
+			status =3D d_revalidate(dentry, nd->flags);
+	}
+	if (unlikely(status <=3D 0)) {
+		if (!status) {
+			d_invalidate(dentry);
+			status =3D 1;
 		}
+		dput(dentry);
+		return status;
+	}
+	if (unlikely(d_is_negative(dentry))) {
+		dput(dentry);
+		return -ENOENT;
 	}
 =

 	path->mnt =3D mnt;

--===============5550455764176038041==--

