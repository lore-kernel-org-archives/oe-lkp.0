Content-Type: multipart/mixed; boundary="===============7265338735830892113=="
MIME-Version: 1.0
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: lkp@lists.01.org
Subject: [PATCH v2 1/4] dcache: sweep cached negative dentries to the end of list of siblings
Date: Mon, 31 Jan 2022 13:19:40 -0800
Message-ID: <20220131211943.34788-2-stephen.s.brennan@oracle.com>
In-Reply-To: <20220131211943.34788-1-stephen.s.brennan@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7265338735830892113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For disk filesystems result of every negative lookup is cached, content
of directories is usually cached too. Production of negative dentries
isn't limited with disk speed. It's really easy to generate millions of
them if system has enough memory. Negative dentries are linked into
siblings list along with normal positive dentries. Some operations walks
dcache tree but looks only for positive dentries: most important is
fsnotify/inotify.

This patch sweeps negative dentries to the end of list at final dput()
and marks with flag which tells that all following dentries are negative
too. We do this carefully to avoid corruption in case the dentry is
killed when we try to lock its parent. Reverse operation (recycle) is
required before instantiating tail negative dentry, or calling d_add()
with non-NULL inode.

(Fix issue in original patch reported by kernel test robot).

Reported-by: kernel test robot <oliver.sang@intel.com>
Co-authored-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Co-authored-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---

Notes:
    v2: Remove the sweep_negative() call in __d_add() when inode is NULL.
    Should address warning detected by 0-day bot.

 fs/dcache.c            | 80 +++++++++++++++++++++++++++++++++++++++---
 include/linux/dcache.h |  6 ++++
 2 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index c84269c6e8bf..26b28ac3de70 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -660,6 +660,58 @@ static inline struct dentry *lock_parent(struct dentry=
 *dentry)
 	return __lock_parent(dentry);
 }
 =

+/*
+ * Move cached negative dentry to the tail of parent->d_subdirs.
+ * This lets walkers skip them all together at first sight.
+ * Must be called at dput of negative dentry with d_lock held.
+ * Releases d_lock.
+ */
+static void sweep_negative(struct dentry *dentry)
+{
+	struct dentry *parent;
+
+	rcu_read_lock();
+	parent =3D lock_parent(dentry);
+	if (!parent) {
+		rcu_read_unlock();
+		return;
+	}
+
+	/*
+	 * If we did not hold a reference to dentry (as in the case of dput),
+	 * and dentry->d_lock was dropped in lock_parent(), then we could now be
+	 * holding onto a dead dentry. Be careful to check d_count and unlock
+	 * before dropping RCU lock, otherwise we could corrupt freed memory.
+	 */
+	if (!d_count(dentry) && d_is_negative(dentry) &&
+		!d_is_tail_negative(dentry)) {
+		dentry->d_flags |=3D DCACHE_TAIL_NEGATIVE;
+		list_move_tail(&dentry->d_child, &parent->d_subdirs);
+	}
+
+	spin_unlock(&parent->d_lock);
+	spin_unlock(&dentry->d_lock);
+	rcu_read_unlock();
+}
+
+/*
+ * Undo sweep_negative() and move to the head of parent->d_subdirs.
+ * Must be called before converting negative dentry into positive.
+ * Must hold dentry->d_lock, we may drop and re-grab it via lock_parent().
+ * Must be hold a reference or be otherwise sure the dentry cannot be kill=
ed.
+ */
+static void recycle_negative(struct dentry *dentry)
+{
+	struct dentry *parent;
+
+	parent =3D lock_parent(dentry);
+	dentry->d_flags &=3D ~DCACHE_TAIL_NEGATIVE;
+	if (parent) {
+		list_move(&dentry->d_child, &parent->d_subdirs);
+		spin_unlock(&parent->d_lock);
+	}
+}
+
 static inline bool retain_dentry(struct dentry *dentry)
 {
 	WARN_ON(d_in_lookup(dentry));
@@ -765,7 +817,7 @@ static struct dentry *dentry_kill(struct dentry *dentry)
 static inline bool fast_dput(struct dentry *dentry)
 {
 	int ret;
-	unsigned int d_flags;
+	unsigned int d_flags, required;
 =

 	/*
 	 * If we have a d_op->d_delete() operation, we sould not
@@ -813,6 +865,8 @@ static inline bool fast_dput(struct dentry *dentry)
 	 * a 'delete' op, and it's referenced and already on
 	 * the LRU list.
 	 *
+	 * Cached negative dentry must be swept to the tail.
+	 *
 	 * NOTE! Since we aren't locked, these values are
 	 * not "stable". However, it is sufficient that at
 	 * some point after we dropped the reference the
@@ -830,11 +884,16 @@ static inline bool fast_dput(struct dentry *dentry)
 	 */
 	smp_rmb();
 	d_flags =3D READ_ONCE(dentry->d_flags);
+
+	required =3D DCACHE_REFERENCED | DCACHE_LRU_LIST |
+		(d_flags_negative(d_flags) ? DCACHE_TAIL_NEGATIVE : 0);
+
 	d_flags &=3D DCACHE_REFERENCED | DCACHE_LRU_LIST |
-			DCACHE_DISCONNECTED | DCACHE_DONTCACHE;
+			DCACHE_DISCONNECTED | DCACHE_DONTCACHE |
+			DCACHE_TAIL_NEGATIVE;
 =

 	/* Nothing to do? Dropping the reference was all we needed? */
-	if (d_flags =3D=3D (DCACHE_REFERENCED | DCACHE_LRU_LIST) && !d_unhashed(d=
entry))
+	if (d_flags =3D=3D required && !d_unhashed(dentry))
 		return true;
 =

 	/*
@@ -906,7 +965,10 @@ void dput(struct dentry *dentry)
 		rcu_read_unlock();
 =

 		if (likely(retain_dentry(dentry))) {
-			spin_unlock(&dentry->d_lock);
+			if (d_is_negative(dentry) && !d_is_tail_negative(dentry))
+				sweep_negative(dentry); /* drops d_lock */
+			else
+				spin_unlock(&dentry->d_lock);
 			return;
 		}
 =

@@ -1998,6 +2060,8 @@ static void __d_instantiate(struct dentry *dentry, st=
ruct inode *inode)
 	WARN_ON(d_in_lookup(dentry));
 =

 	spin_lock(&dentry->d_lock);
+	if (d_is_tail_negative(dentry))
+		recycle_negative(dentry);
 	/*
 	 * Decrement negative dentry count if it was in the LRU list.
 	 */
@@ -2722,6 +2786,13 @@ static inline void __d_add(struct dentry *dentry, st=
ruct inode *inode)
 	struct inode *dir =3D NULL;
 	unsigned n;
 	spin_lock(&dentry->d_lock);
+	/*
+	 * Tail negative dentries must become positive before associating an
+	 * inode. recycle_negative() is safe to use because we hold a reference
+	 * to dentry.
+	 */
+	if (inode && d_is_tail_negative(dentry))
+		recycle_negative(dentry);
 	if (unlikely(d_in_lookup(dentry))) {
 		dir =3D dentry->d_parent->d_inode;
 		n =3D start_dir_add(dir);
@@ -2738,6 +2809,7 @@ static inline void __d_add(struct dentry *dentry, str=
uct inode *inode)
 	__d_rehash(dentry);
 	if (dir)
 		end_dir_add(dir, n);
+
 	spin_unlock(&dentry->d_lock);
 	if (inode)
 		spin_unlock(&inode->i_lock);
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index f5bba51480b2..7cc1bd384912 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -211,6 +211,7 @@ struct dentry_operations {
 #define DCACHE_PAR_LOOKUP		0x10000000 /* being looked up (with parent lock=
ed shared) */
 #define DCACHE_DENTRY_CURSOR		0x20000000
 #define DCACHE_NORCU			0x40000000 /* No RCU delay for freeing */
+#define DCACHE_TAIL_NEGATIVE		0x80000000 /* All following siblings are neg=
ative */
 =

 extern seqlock_t rename_lock;
 =

@@ -489,6 +490,11 @@ static inline int simple_positive(const struct dentry =
*dentry)
 	return d_really_is_positive(dentry) && !d_unhashed(dentry);
 }
 =

+static inline bool d_is_tail_negative(const struct dentry *dentry)
+{
+	return unlikely(dentry->d_flags & DCACHE_TAIL_NEGATIVE);
+}
+
 extern void d_set_fallthru(struct dentry *dentry);
 =

 static inline bool d_is_fallthru(const struct dentry *dentry)
-- =

2.30.2

--===============7265338735830892113==--

