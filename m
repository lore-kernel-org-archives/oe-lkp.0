Content-Type: multipart/mixed; boundary="===============5598720190829007497=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 32678f1513: aim7.jobs-per-min -5.6% regression
Date: Sat, 07 May 2022 07:29:24 +1000
Message-ID: <20220506212924.GJ1098723@dread.disaster.area>
In-Reply-To: <20220506092250.GI23061@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5598720190829007497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2022 at 05:22:50PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -5.6% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: 32678f151338b9a321e9e27139a63c81f353acb7 ("[PATCH 1/4] xfs: detec=
t self referencing btree sibling pointers")
> url: https://github.com/intel-lab-lkp/linux/commits/Dave-Chinner/xfs-fix-=
random-format-verification-issues/20220502-162206
> base: https://git.kernel.org/cgit/fs/xfs/xfs-linux.git for-next
> patch link: https://lore.kernel.org/linux-xfs/20220502082018.1076561-2-da=
vid(a)fromorbit.com

Well, that answers the concern I had about the impact of =

changing the way endian conversions were done in that patch.

> a44a027a8b2a20fe 32678f151338b9a321e9e27139a =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     464232            -5.6%     438315        aim7.jobs-per-min
....
>       0.13 =C2=B1  5%      +0.2        0.33 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__xfs_btree_check_sblock
....
>       0.11 =C2=B1  4%      +0.2        0.30 =C2=B1  5%  perf-profile.self=
.cycles-pp.__xfs_btree_check_sblock

Because there is it, right at the bottom of the profile.

Can you try the patch below and see if that fixes the issue?

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com


xfs: avoid unnecessary runtime sibling pointer endian conversions

From: Dave Chinner <dchinner@redhat.com>

Commit dc04db2aa7c9 has caused a small aim7 regression, showing a
small increase in CPU usage in __xfs_btree_check_sblock() as a
result of the extra checking.

This is likely due to the endian conversion of the sibling poitners
being unconditional instead of relying on the compiler to endian
convert the NULL pointer at compile time and avoiding the runtime
conversion for this common case.

Rework the checks so that endian conversion of the sibling pointers
is only done if they are not null as the original code did.

Fixes: dc04db2aa7c9 ("xfs: detect self referencing btree sibling pointers")
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Dave Chinner <dchinner@redhat.com>
---
 fs/xfs/libxfs/xfs_btree.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
index 2aa300f7461f..4d673e943317 100644
--- a/fs/xfs/libxfs/xfs_btree.c
+++ b/fs/xfs/libxfs/xfs_btree.c
@@ -51,16 +51,25 @@ xfs_btree_magic(
 	return magic;
 }
 =

+/*
+ * These sibling pointer checks are optimised for null sibling pointers. T=
his
+ * happens a lot, and we don't need to byte swap at runtime if the sibling
+ * pointer is NULL.
+ */
 static xfs_failaddr_t
 xfs_btree_check_lblock_siblings(
 	struct xfs_mount	*mp,
 	struct xfs_btree_cur	*cur,
 	int			level,
 	xfs_fsblock_t		fsb,
-	xfs_fsblock_t		sibling)
+	__be64			dsibling)
 {
-	if (sibling =3D=3D NULLFSBLOCK)
+	xfs_fsblock_t		sibling;
+
+	if (dsibling =3D=3D cpu_to_be64(NULLFSBLOCK))
 		return NULL;
+
+	sibling =3D be64_to_cpu(dsibling);
 	if (sibling =3D=3D fsb)
 		return __this_address;
 	if (level >=3D 0) {
@@ -81,10 +90,14 @@ xfs_btree_check_sblock_siblings(
 	int			level,
 	xfs_agnumber_t		agno,
 	xfs_agblock_t		agbno,
-	xfs_agblock_t		sibling)
+	__be32			dsibling)
 {
-	if (sibling =3D=3D NULLAGBLOCK)
+	xfs_agblock_t		sibling;
+
+	if (dsibling =3D=3D cpu_to_be32(NULLAGBLOCK))
 		return NULL;
+
+	sibling =3D be32_to_cpu(dsibling);
 	if (sibling =3D=3D agbno)
 		return __this_address;
 	if (level >=3D 0) {
@@ -136,10 +149,10 @@ __xfs_btree_check_lblock(
 		fsb =3D XFS_DADDR_TO_FSB(mp, xfs_buf_daddr(bp));
 =

 	fa =3D xfs_btree_check_lblock_siblings(mp, cur, level, fsb,
-			be64_to_cpu(block->bb_u.l.bb_leftsib));
+			block->bb_u.l.bb_leftsib);
 	if (!fa)
 		fa =3D xfs_btree_check_lblock_siblings(mp, cur, level, fsb,
-				be64_to_cpu(block->bb_u.l.bb_rightsib));
+				block->bb_u.l.bb_rightsib);
 	return fa;
 }
 =

@@ -204,10 +217,10 @@ __xfs_btree_check_sblock(
 	}
 =

 	fa =3D xfs_btree_check_sblock_siblings(mp, cur, level, agno, agbno,
-			be32_to_cpu(block->bb_u.s.bb_leftsib));
+			block->bb_u.s.bb_leftsib);
 	if (!fa)
 		fa =3D xfs_btree_check_sblock_siblings(mp, cur, level, agno,
-				 agbno, be32_to_cpu(block->bb_u.s.bb_rightsib));
+				 agbno, block->bb_u.s.bb_rightsib);
 	return fa;
 }
 =

@@ -4523,10 +4536,10 @@ xfs_btree_lblock_verify(
 	/* sibling pointer verification */
 	fsb =3D XFS_DADDR_TO_FSB(mp, xfs_buf_daddr(bp));
 	fa =3D xfs_btree_check_lblock_siblings(mp, NULL, -1, fsb,
-			be64_to_cpu(block->bb_u.l.bb_leftsib));
+			block->bb_u.l.bb_leftsib);
 	if (!fa)
 		fa =3D xfs_btree_check_lblock_siblings(mp, NULL, -1, fsb,
-				be64_to_cpu(block->bb_u.l.bb_rightsib));
+				block->bb_u.l.bb_rightsib);
 	return fa;
 }
 =

@@ -4580,10 +4593,10 @@ xfs_btree_sblock_verify(
 	agno =3D xfs_daddr_to_agno(mp, xfs_buf_daddr(bp));
 	agbno =3D xfs_daddr_to_agbno(mp, xfs_buf_daddr(bp));
 	fa =3D xfs_btree_check_sblock_siblings(mp, NULL, -1, agno, agbno,
-			be32_to_cpu(block->bb_u.s.bb_leftsib));
+			block->bb_u.s.bb_leftsib);
 	if (!fa)
 		fa =3D xfs_btree_check_sblock_siblings(mp, NULL, -1, agno, agbno,
-				be32_to_cpu(block->bb_u.s.bb_rightsib));
+				block->bb_u.s.bb_rightsib);
 	return fa;
 }
=20
--===============5598720190829007497==--

