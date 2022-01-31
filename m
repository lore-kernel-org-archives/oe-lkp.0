Content-Type: multipart/mixed; boundary="===============0685316762308153130=="
MIME-Version: 1.0
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: lkp@lists.01.org
Subject: [PATCH v2 4/4] dcache: stop walking siblings if remaining dentries all negative
Date: Mon, 31 Jan 2022 13:19:43 -0800
Message-ID: <20220131211943.34788-5-stephen.s.brennan@oracle.com>
In-Reply-To: <20220131211943.34788-1-stephen.s.brennan@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0685316762308153130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Most walkers are interested only in positive dentries.

Changes in simple_* libfs helpers are mostly cosmetic: it shouldn't cache
negative dentries unless uses d_delete other than always_delete_dentry().

Co-authored-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Co-authored-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 fs/dcache.c | 9 +++++++++
 fs/libfs.c  | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index a5a6c7654006..fadbecf93f78 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1530,6 +1530,8 @@ static enum d_walk_ret path_check_mount(void *data, s=
truct dentry *dentry)
 	struct check_mount *info =3D data;
 	struct path path =3D { .mnt =3D info->mnt, .dentry =3D dentry };
 =

+	if (d_is_tail_negative(dentry))
+		return D_WALK_SKIP_SIBLINGS;
 	if (likely(!d_mountpoint(dentry)))
 		return D_WALK_CONTINUE;
 	if (__path_is_mountpoint(&path)) {
@@ -1776,6 +1778,10 @@ void shrink_dcache_for_umount(struct super_block *sb)
 static enum d_walk_ret find_submount(void *_data, struct dentry *dentry)
 {
 	struct dentry **victim =3D _data;
+
+	if (d_is_tail_negative(dentry))
+		return D_WALK_SKIP_SIBLINGS;
+
 	if (d_mountpoint(dentry)) {
 		__dget_dlock(dentry);
 		*victim =3D dentry;
@@ -3253,6 +3259,9 @@ static enum d_walk_ret d_genocide_kill(void *data, st=
ruct dentry *dentry)
 {
 	struct dentry *root =3D data;
 	if (dentry !=3D root) {
+		if (d_is_tail_negative(dentry))
+			return D_WALK_SKIP_SIBLINGS;
+
 		if (d_unhashed(dentry) || !dentry->d_inode)
 			return D_WALK_SKIP;
 =

diff --git a/fs/libfs.c b/fs/libfs.c
index ba7438ab9371..13cb44cf158e 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -411,6 +411,9 @@ int simple_empty(struct dentry *dentry)
 =

 	spin_lock(&dentry->d_lock);
 	list_for_each_entry(child, &dentry->d_subdirs, d_child) {
+		if (d_is_tail_negative(child))
+			break;
+
 		spin_lock_nested(&child->d_lock, DENTRY_D_LOCK_NESTED);
 		if (simple_positive(child)) {
 			spin_unlock(&child->d_lock);
-- =

2.30.2

--===============0685316762308153130==--

