Content-Type: multipart/mixed; boundary="===============9084175132133905062=="
MIME-Version: 1.0
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: lkp@lists.01.org
Subject: [PATCH v2 3/4] dcache: add action D_WALK_SKIP_SIBLINGS to d_walk()
Date: Mon, 31 Jan 2022 13:19:42 -0800
Message-ID: <20220131211943.34788-4-stephen.s.brennan@oracle.com>
In-Reply-To: <20220131211943.34788-1-stephen.s.brennan@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9084175132133905062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

This lets skip remaining siblings at seeing d_is_tail_negative().

Co-authored-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Co-authored-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 fs/dcache.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 26b28ac3de70..a5a6c7654006 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1391,12 +1391,14 @@ EXPORT_SYMBOL(shrink_dcache_sb);
  * @D_WALK_QUIT:	quit walk
  * @D_WALK_NORETRY:	quit when retry is needed
  * @D_WALK_SKIP:	skip this dentry and its children
+ * @D_WALK_SKIP_SIBLINGS: skip siblings and their children
  */
 enum d_walk_ret {
 	D_WALK_CONTINUE,
 	D_WALK_QUIT,
 	D_WALK_NORETRY,
 	D_WALK_SKIP,
+	D_WALK_SKIP_SIBLINGS,
 };
 =

 /**
@@ -1427,6 +1429,7 @@ static void d_walk(struct dentry *parent, void *data,
 		break;
 	case D_WALK_QUIT:
 	case D_WALK_SKIP:
+	case D_WALK_SKIP_SIBLINGS:
 		goto out_unlock;
 	case D_WALK_NORETRY:
 		retry =3D false;
@@ -1458,6 +1461,9 @@ static void d_walk(struct dentry *parent, void *data,
 		case D_WALK_SKIP:
 			spin_unlock(&dentry->d_lock);
 			continue;
+		case D_WALK_SKIP_SIBLINGS:
+			spin_unlock(&dentry->d_lock);
+			goto skip_siblings;
 		}
 =

 		if (!list_empty(&dentry->d_subdirs)) {
@@ -1469,6 +1475,7 @@ static void d_walk(struct dentry *parent, void *data,
 		}
 		spin_unlock(&dentry->d_lock);
 	}
+skip_siblings:
 	/*
 	 * All done at this level ... ascend and resume the search.
 	 */
-- =

2.30.2

--===============9084175132133905062==--

