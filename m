Content-Type: multipart/mixed; boundary="===============0259991548785881940=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sat, 13 Aug 2016 02:30:54 +0200
Message-ID: <20160813003054.GA3101@lst.de>
In-Reply-To: <20160812100208.GA16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============0259991548785881940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 08:02:08PM +1000, Dave Chinner wrote:
> Which says "no change". Oh well, back to the drawing board...

I don't see how it would change thing much - for all relevant calculations
we convert to block units first anyway.

But the whole xfs_iomap_write_delay is a giant mess anyway.  For a usual
call we do at least four lookups in the extent btree, which seems rather
costly.  Especially given that the low-level xfs_bmap_search_extents
interface would give us all required information in one single call.

Below is a patch I hacked up this morning to do just that.  It passes
xfstests, but I've not done any real benchmarking with it.  If the
reduced lookup overhead in it doesn't help enough we'll need to some
sort of look aside cache for the information, but I hope that we
can avoid that.  And yes, it's a rather large patch - but the old
path was so entangled that I couldn't come up with something lighter.

diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
index b060bca..614803b 100644
--- a/fs/xfs/libxfs/xfs_bmap.c
+++ b/fs/xfs/libxfs/xfs_bmap.c
@@ -1388,7 +1388,7 @@ xfs_bmap_search_multi_extents(
  * Else, *lastxp will be set to the index of the found
  * entry; *gotp will contain the entry.
  */
-STATIC xfs_bmbt_rec_host_t *                 /* pointer to found extent en=
try */
+xfs_bmbt_rec_host_t *                 /* pointer to found extent entry */
 xfs_bmap_search_extents(
 	xfs_inode_t     *ip,            /* incore inode pointer */
 	xfs_fileoff_t   bno,            /* block number searched for */
@@ -4074,7 +4074,7 @@ xfs_bmapi_read(
 	return 0;
 }
 =

-STATIC int
+int
 xfs_bmapi_reserve_delalloc(
 	struct xfs_inode	*ip,
 	xfs_fileoff_t		aoff,
@@ -4170,91 +4170,6 @@ out_unreserve_quota:
 	return error;
 }
 =

-/*
- * Map file blocks to filesystem blocks, adding delayed allocations as nee=
ded.
- */
-int
-xfs_bmapi_delay(
-	struct xfs_inode	*ip,	/* incore inode */
-	xfs_fileoff_t		bno,	/* starting file offs. mapped */
-	xfs_filblks_t		len,	/* length to map in file */
-	struct xfs_bmbt_irec	*mval,	/* output: map values */
-	int			*nmap,	/* i/o: mval size/count */
-	int			flags)	/* XFS_BMAPI_... */
-{
-	struct xfs_mount	*mp =3D ip->i_mount;
-	struct xfs_ifork	*ifp =3D XFS_IFORK_PTR(ip, XFS_DATA_FORK);
-	struct xfs_bmbt_irec	got;	/* current file extent record */
-	struct xfs_bmbt_irec	prev;	/* previous file extent record */
-	xfs_fileoff_t		obno;	/* old block number (offset) */
-	xfs_fileoff_t		end;	/* end of mapped file region */
-	xfs_extnum_t		lastx;	/* last useful extent number */
-	int			eof;	/* we've hit the end of extents */
-	int			n =3D 0;	/* current extent index */
-	int			error =3D 0;
-
-	ASSERT(*nmap >=3D 1);
-	ASSERT(*nmap <=3D XFS_BMAP_MAX_NMAP);
-	ASSERT(!(flags & ~XFS_BMAPI_ENTIRE));
-	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
-
-	if (unlikely(XFS_TEST_ERROR(
-	    (XFS_IFORK_FORMAT(ip, XFS_DATA_FORK) !=3D XFS_DINODE_FMT_EXTENTS &&
-	     XFS_IFORK_FORMAT(ip, XFS_DATA_FORK) !=3D XFS_DINODE_FMT_BTREE),
-	     mp, XFS_ERRTAG_BMAPIFORMAT, XFS_RANDOM_BMAPIFORMAT))) {
-		XFS_ERROR_REPORT("xfs_bmapi_delay", XFS_ERRLEVEL_LOW, mp);
-		return -EFSCORRUPTED;
-	}
-
-	if (XFS_FORCED_SHUTDOWN(mp))
-		return -EIO;
-
-	XFS_STATS_INC(mp, xs_blk_mapw);
-
-	if (!(ifp->if_flags & XFS_IFEXTENTS)) {
-		error =3D xfs_iread_extents(NULL, ip, XFS_DATA_FORK);
-		if (error)
-			return error;
-	}
-
-	xfs_bmap_search_extents(ip, bno, XFS_DATA_FORK, &eof, &lastx, &got, &prev=
);
-	end =3D bno + len;
-	obno =3D bno;
-
-	while (bno < end && n < *nmap) {
-		if (eof || got.br_startoff > bno) {
-			error =3D xfs_bmapi_reserve_delalloc(ip, bno, len, &got,
-							   &prev, &lastx, eof);
-			if (error) {
-				if (n =3D=3D 0) {
-					*nmap =3D 0;
-					return error;
-				}
-				break;
-			}
-		}
-
-		/* set up the extent map to return. */
-		xfs_bmapi_trim_map(mval, &got, &bno, len, obno, end, n, flags);
-		xfs_bmapi_update_map(&mval, &bno, &len, obno, end, &n, flags);
-
-		/* If we're done, stop now. */
-		if (bno >=3D end || n >=3D *nmap)
-			break;
-
-		/* Else go on to the next record. */
-		prev =3D got;
-		if (++lastx < ifp->if_bytes / sizeof(xfs_bmbt_rec_t))
-			xfs_bmbt_get_all(xfs_iext_get_ext(ifp, lastx), &got);
-		else
-			eof =3D 1;
-	}
-
-	*nmap =3D n;
-	return 0;
-}
-
-
 static int
 xfs_bmapi_allocate(
 	struct xfs_bmalloca	*bma)
diff --git a/fs/xfs/libxfs/xfs_bmap.h b/fs/xfs/libxfs/xfs_bmap.h
index 254034f..d660069 100644
--- a/fs/xfs/libxfs/xfs_bmap.h
+++ b/fs/xfs/libxfs/xfs_bmap.h
@@ -181,9 +181,6 @@ int	xfs_bmap_read_extents(struct xfs_trans *tp, struct =
xfs_inode *ip,
 int	xfs_bmapi_read(struct xfs_inode *ip, xfs_fileoff_t bno,
 		xfs_filblks_t len, struct xfs_bmbt_irec *mval,
 		int *nmap, int flags);
-int	xfs_bmapi_delay(struct xfs_inode *ip, xfs_fileoff_t bno,
-		xfs_filblks_t len, struct xfs_bmbt_irec *mval,
-		int *nmap, int flags);
 int	xfs_bmapi_write(struct xfs_trans *tp, struct xfs_inode *ip,
 		xfs_fileoff_t bno, xfs_filblks_t len, int flags,
 		xfs_fsblock_t *firstblock, xfs_extlen_t total,
@@ -202,5 +199,12 @@ int	xfs_bmap_shift_extents(struct xfs_trans *tp, struc=
t xfs_inode *ip,
 		struct xfs_defer_ops *dfops, enum shift_direction direction,
 		int num_exts);
 int	xfs_bmap_split_extent(struct xfs_inode *ip, xfs_fileoff_t split_offset=
);
+struct xfs_bmbt_rec_host *
+	xfs_bmap_search_extents(struct xfs_inode *ip, xfs_fileoff_t bno,
+		int fork, int *eofp, xfs_extnum_t *lastxp,
+		struct xfs_bmbt_irec *gotp, struct xfs_bmbt_irec *prevp);
+int	xfs_bmapi_reserve_delalloc(struct xfs_inode *ip, xfs_fileoff_t aoff,
+		xfs_filblks_t len, struct xfs_bmbt_irec *got,
+		struct xfs_bmbt_irec *prev, xfs_extnum_t *lastx, int eof);
 =

 #endif	/* __XFS_BMAP_H__ */
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 2114d53..b40e31b 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -42,11 +42,62 @@
 =

 #define XFS_WRITEIO_ALIGN(mp,off)	(((off) >> mp->m_writeio_log) \
 						<< mp->m_writeio_log)
-#define XFS_WRITE_IMAPS		XFS_BMAP_MAX_NMAP
+
+void
+xfs_bmbt_to_iomap(
+	struct xfs_inode	*ip,
+	struct iomap		*iomap,
+	struct xfs_bmbt_irec	*imap)
+{
+	struct xfs_mount	*mp =3D ip->i_mount;
+
+	if (imap->br_startblock =3D=3D HOLESTARTBLOCK) {
+		iomap->blkno =3D IOMAP_NULL_BLOCK;
+		iomap->type =3D IOMAP_HOLE;
+	} else if (imap->br_startblock =3D=3D DELAYSTARTBLOCK) {
+		iomap->blkno =3D IOMAP_NULL_BLOCK;
+		iomap->type =3D IOMAP_DELALLOC;
+	} else {
+		iomap->blkno =3D xfs_fsb_to_db(ip, imap->br_startblock);
+		if (imap->br_state =3D=3D XFS_EXT_UNWRITTEN)
+			iomap->type =3D IOMAP_UNWRITTEN;
+		else
+			iomap->type =3D IOMAP_MAPPED;
+	}
+	iomap->offset =3D XFS_FSB_TO_B(mp, imap->br_startoff);
+	iomap->length =3D XFS_FSB_TO_B(mp, imap->br_blockcount);
+	iomap->bdev =3D xfs_find_bdev_for_inode(VFS_I(ip));
+}
+
+static xfs_extlen_t
+xfs_align_eof(
+	struct xfs_inode	*ip)
+{
+	struct xfs_mount	*mp =3D ip->i_mount;
+	xfs_extlen_t		align =3D 0;
+
+	ASSERT(!XFS_IS_REALTIME_INODE(ip));
+
+	/*
+	 * Round up the allocation request to a stripe unit (m_dalign)
+	 * boundary if the file size is >=3D stripe unit size, and we are
+	 * allocating past the allocation eof.
+	 *
+	 * If mounted with the "-o swalloc" option the alignment is
+	 * increased from the strip unit size to the stripe width.
+	 */
+	if (mp->m_swidth && (mp->m_flags & XFS_MOUNT_SWALLOC))
+		align =3D mp->m_swidth;
+	else if (mp->m_dalign)
+		align =3D mp->m_dalign;
+
+	if (align && XFS_ISIZE(ip) < XFS_FSB_TO_B(mp, align))
+		align =3D 0;
+	return align;
+}
 =

 STATIC int
 xfs_iomap_eof_align_last_fsb(
-	xfs_mount_t	*mp,
 	xfs_inode_t	*ip,
 	xfs_extlen_t	extsize,
 	xfs_fileoff_t	*last_fsb)
@@ -54,23 +105,8 @@ xfs_iomap_eof_align_last_fsb(
 	xfs_extlen_t	align =3D 0;
 	int		eof, error;
 =

-	if (!XFS_IS_REALTIME_INODE(ip)) {
-		/*
-		 * Round up the allocation request to a stripe unit
-		 * (m_dalign) boundary if the file size is >=3D stripe unit
-		 * size, and we are allocating past the allocation eof.
-		 *
-		 * If mounted with the "-o swalloc" option the alignment is
-		 * increased from the strip unit size to the stripe width.
-		 */
-		if (mp->m_swidth && (mp->m_flags & XFS_MOUNT_SWALLOC))
-			align =3D mp->m_swidth;
-		else if (mp->m_dalign)
-			align =3D mp->m_dalign;
-
-		if (align && XFS_ISIZE(ip) < XFS_FSB_TO_B(mp, align))
-			align =3D 0;
-	}
+	if (!XFS_IS_REALTIME_INODE(ip))
+		align =3D xfs_align_eof(ip);
 =

 	/*
 	 * Always round up the allocation request to an extent boundary
@@ -154,7 +190,7 @@ xfs_iomap_write_direct(
 		 */
 		ASSERT(XFS_IFORK_PTR(ip, XFS_DATA_FORK)->if_flags &
 								XFS_IFEXTENTS);
-		error =3D xfs_iomap_eof_align_last_fsb(mp, ip, extsz, &last_fsb);
+		error =3D xfs_iomap_eof_align_last_fsb(ip, extsz, &last_fsb);
 		if (error)
 			goto out_unlock;
 	} else {
@@ -274,130 +310,6 @@ out_trans_cancel:
 	goto out_unlock;
 }
 =

-/*
- * If the caller is doing a write at the end of the file, then extend the
- * allocation out to the file system's write iosize.  We clean up any extra
- * space left over when the file is closed in xfs_inactive().
- *
- * If we find we already have delalloc preallocation beyond EOF, don't do =
more
- * preallocation as it it not needed.
- */
-STATIC int
-xfs_iomap_eof_want_preallocate(
-	xfs_mount_t	*mp,
-	xfs_inode_t	*ip,
-	xfs_off_t	offset,
-	size_t		count,
-	xfs_bmbt_irec_t *imap,
-	int		nimaps,
-	int		*prealloc)
-{
-	xfs_fileoff_t   start_fsb;
-	xfs_filblks_t   count_fsb;
-	int		n, error, imaps;
-	int		found_delalloc =3D 0;
-
-	*prealloc =3D 0;
-	if (offset + count <=3D XFS_ISIZE(ip))
-		return 0;
-
-	/*
-	 * If the file is smaller than the minimum prealloc and we are using
-	 * dynamic preallocation, don't do any preallocation@all as it is
-	 * likely this is the only write to the file that is going to be done.
-	 */
-	if (!(mp->m_flags & XFS_MOUNT_DFLT_IOSIZE) &&
-	    XFS_ISIZE(ip) < XFS_FSB_TO_B(mp, mp->m_writeio_blocks))
-		return 0;
-
-	/*
-	 * If there are any real blocks past eof, then don't
-	 * do any speculative allocation.
-	 */
-	start_fsb =3D XFS_B_TO_FSBT(mp, ((xfs_ufsize_t)(offset + count - 1)));
-	count_fsb =3D XFS_B_TO_FSB(mp, mp->m_super->s_maxbytes);
-	while (count_fsb > 0) {
-		imaps =3D nimaps;
-		error =3D xfs_bmapi_read(ip, start_fsb, count_fsb, imap, &imaps,
-				       0);
-		if (error)
-			return error;
-		for (n =3D 0; n < imaps; n++) {
-			if ((imap[n].br_startblock !=3D HOLESTARTBLOCK) &&
-			    (imap[n].br_startblock !=3D DELAYSTARTBLOCK))
-				return 0;
-			start_fsb +=3D imap[n].br_blockcount;
-			count_fsb -=3D imap[n].br_blockcount;
-
-			if (imap[n].br_startblock =3D=3D DELAYSTARTBLOCK)
-				found_delalloc =3D 1;
-		}
-	}
-	if (!found_delalloc)
-		*prealloc =3D 1;
-	return 0;
-}
-
-/*
- * Determine the initial size of the preallocation. We are beyond the curr=
ent
- * EOF here, but we need to take into account whether this is a sparse wri=
te or
- * an extending write when determining the preallocation size.  Hence we n=
eed to
- * look up the extent that ends@the current write offset and use the re=
sult
- * to determine the preallocation size.
- *
- * If the extent is a hole, then preallocation is essentially disabled.
- * Otherwise we take the size of the preceeding data extent as the basis f=
or the
- * preallocation size. If the size of the extent is greater than half the
- * maximum extent length, then use the current offset as the basis. This e=
nsures
- * that for large files the preallocation size always extends to MAXEXTLEN
- * rather than falling short due to things like stripe unit/width alignmen=
t of
- * real extents.
- */
-STATIC xfs_fsblock_t
-xfs_iomap_eof_prealloc_initial_size(
-	struct xfs_mount	*mp,
-	struct xfs_inode	*ip,
-	xfs_off_t		offset,
-	xfs_bmbt_irec_t		*imap,
-	int			nimaps)
-{
-	xfs_fileoff_t   start_fsb;
-	int		imaps =3D 1;
-	int		error;
-
-	ASSERT(nimaps >=3D imaps);
-
-	/* if we are using a specific prealloc size, return now */
-	if (mp->m_flags & XFS_MOUNT_DFLT_IOSIZE)
-		return 0;
-
-	/* If the file is small, then use the minimum prealloc */
-	if (XFS_ISIZE(ip) < XFS_FSB_TO_B(mp, mp->m_dalign))
-		return 0;
-
-	/*
-	 * As we write multiple pages, the offset will always align to the
-	 * start of a page and hence point to a hole at EOF. i.e. if the size is
-	 * 4096 bytes, we only have one block at FSB 0, but XFS_B_TO_FSB(4096)
-	 * will return FSB 1. Hence if there are blocks in the file, we want to
-	 * point to the block prior to the EOF block and not the hole that maps
-	 * directly at @offset.
-	 */
-	start_fsb =3D XFS_B_TO_FSB(mp, offset);
-	if (start_fsb)
-		start_fsb--;
-	error =3D xfs_bmapi_read(ip, start_fsb, 1, imap, &imaps, XFS_BMAPI_ENTIRE=
);
-	if (error)
-		return 0;
-
-	ASSERT(imaps =3D=3D 1);
-	if (imap[0].br_startblock =3D=3D HOLESTARTBLOCK)
-		return 0;
-	if (imap[0].br_blockcount <=3D (MAXEXTLEN >> 1))
-		return imap[0].br_blockcount << 1;
-	return XFS_B_TO_FSB(mp, offset);
-}
-
 STATIC bool
 xfs_quota_need_throttle(
 	struct xfs_inode *ip,
@@ -466,20 +378,37 @@ xfs_quota_calc_throttle(
  */
 STATIC xfs_fsblock_t
 xfs_iomap_prealloc_size(
-	struct xfs_mount	*mp,
 	struct xfs_inode	*ip,
 	xfs_off_t		offset,
-	struct xfs_bmbt_irec	*imap,
-	int			nimaps)
+	struct xfs_bmbt_irec	*prev)
 {
-	xfs_fsblock_t		alloc_blocks =3D 0;
+	struct xfs_mount	*mp =3D ip->i_mount;
 	int			shift =3D 0;
 	int64_t			freesp;
 	xfs_fsblock_t		qblocks;
 	int			qshift =3D 0;
+	xfs_fsblock_t		alloc_blocks =3D 0;
 =

-	alloc_blocks =3D xfs_iomap_eof_prealloc_initial_size(mp, ip, offset,
-							   imap, nimaps);
+	/*
+	 * Determine the initial size of the preallocation. We are beyond the
+	 * current EOF here, but we need to take into account whether this is
+	 * a sparse write or an extending write when determining the
+	 * preallocation size.  Hence we need to look up the extent that ends
+	 * at the current write offset and use the result to determine the
+	 * preallocation size.
+	 *
+	 * If the extent is a hole, then preallocation is essentially disabled.
+	 * Otherwise we take the size of the preceding data extent as the basis
+	 * for the preallocation size. If the size of the extent is greater than
+	 * half the maximum extent length, then use the current offset as the
+	 * basis. This ensures that for large files the preallocation size
+	 * always extends to MAXEXTLEN rather than falling short due to things
+	 * like stripe unit/width alignment of real extents.
+	 */
+	if (prev->br_blockcount <=3D (MAXEXTLEN >> 1))
+		alloc_blocks =3D prev->br_blockcount << 1;
+	else
+		alloc_blocks =3D XFS_B_TO_FSB(mp, offset);
 	if (!alloc_blocks)
 		goto check_writeio;
 	qblocks =3D alloc_blocks;
@@ -550,120 +479,166 @@ xfs_iomap_prealloc_size(
 	 */
 	while (alloc_blocks && alloc_blocks >=3D freesp)
 		alloc_blocks >>=3D 4;
-
 check_writeio:
 	if (alloc_blocks < mp->m_writeio_blocks)
 		alloc_blocks =3D mp->m_writeio_blocks;
-
 	trace_xfs_iomap_prealloc_size(ip, alloc_blocks, shift,
 				      mp->m_writeio_blocks);
-
 	return alloc_blocks;
 }
 =

-int
-xfs_iomap_write_delay(
-	xfs_inode_t	*ip,
-	xfs_off_t	offset,
-	size_t		count,
-	xfs_bmbt_irec_t *ret_imap)
+static int
+xfs_file_iomap_begin_delay(
+	struct inode		*inode,
+	loff_t			offset,
+	loff_t			count,
+	unsigned		flags,
+	struct iomap		*iomap)
 {
-	xfs_mount_t	*mp =3D ip->i_mount;
-	xfs_fileoff_t	offset_fsb;
-	xfs_fileoff_t	last_fsb;
-	xfs_off_t	aligned_offset;
-	xfs_fileoff_t	ioalign;
-	xfs_extlen_t	extsz;
-	int		nimaps;
-	xfs_bmbt_irec_t imap[XFS_WRITE_IMAPS];
-	int		prealloc;
-	int		error;
-
-	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
-
-	/*
-	 * Make sure that the dquots are there. This doesn't hold
-	 * the ilock across a disk read.
-	 */
-	error =3D xfs_qm_dqattach_locked(ip, 0);
-	if (error)
-		return error;
-
-	extsz =3D xfs_get_extsz_hint(ip);
-	offset_fsb =3D XFS_B_TO_FSBT(mp, offset);
+	struct xfs_inode	*ip =3D XFS_I(inode);
+	struct xfs_mount	*mp =3D ip->i_mount;
+	struct xfs_ifork	*ifp =3D XFS_IFORK_PTR(ip, XFS_DATA_FORK);
+	xfs_fileoff_t		offset_fsb =3D XFS_B_TO_FSBT(mp, offset);
+	xfs_fileoff_t		maxbytes_fsb =3D
+		XFS_B_TO_FSB(mp, mp->m_super->s_maxbytes);
+	xfs_fileoff_t		end_fsb, orig_end_fsb;
+	int			error =3D 0, eof =3D 0;
+	struct xfs_bmbt_irec	got;
+	struct xfs_bmbt_irec	prev;
+	xfs_extnum_t		idx;
+
+	ASSERT(!XFS_IS_REALTIME_INODE(ip));
+	ASSERT(!xfs_get_extsz_hint(ip));
 =

-	error =3D xfs_iomap_eof_want_preallocate(mp, ip, offset, count,
-				imap, XFS_WRITE_IMAPS, &prealloc);
-	if (error)
-		return error;
+	xfs_ilock(ip, XFS_ILOCK_EXCL);
 =

-retry:
-	if (prealloc) {
-		xfs_fsblock_t	alloc_blocks;
+	if (unlikely(XFS_TEST_ERROR(
+	    (XFS_IFORK_FORMAT(ip, XFS_DATA_FORK) !=3D XFS_DINODE_FMT_EXTENTS &&
+	     XFS_IFORK_FORMAT(ip, XFS_DATA_FORK) !=3D XFS_DINODE_FMT_BTREE),
+	     mp, XFS_ERRTAG_BMAPIFORMAT, XFS_RANDOM_BMAPIFORMAT))) {
+		XFS_ERROR_REPORT(__func__, XFS_ERRLEVEL_LOW, mp);
+		error =3D -EFSCORRUPTED;
+		goto out_unlock;
+	}
 =

-		alloc_blocks =3D xfs_iomap_prealloc_size(mp, ip, offset, imap,
-						       XFS_WRITE_IMAPS);
+	XFS_STATS_INC(mp, xs_blk_mapw);
 =

-		aligned_offset =3D XFS_WRITEIO_ALIGN(mp, (offset + count - 1));
-		ioalign =3D XFS_B_TO_FSBT(mp, aligned_offset);
-		last_fsb =3D ioalign + alloc_blocks;
-	} else {
-		last_fsb =3D XFS_B_TO_FSB(mp, ((xfs_ufsize_t)(offset + count)));
+	if (!(ifp->if_flags & XFS_IFEXTENTS)) {
+		error =3D xfs_iread_extents(NULL, ip, XFS_DATA_FORK);
+		if (error)
+			goto out_unlock;
 	}
 =

-	if (prealloc || extsz) {
-		error =3D xfs_iomap_eof_align_last_fsb(mp, ip, extsz, &last_fsb);
-		if (error)
-			return error;
+	xfs_bmap_search_extents(ip, offset_fsb, XFS_DATA_FORK, &eof, &idx,
+			&got, &prev);
+	if (!eof && got.br_startoff <=3D offset_fsb) {
+		trace_xfs_iomap_found(ip, offset, count, 0, &got);
+		goto done;
 	}
 =

+	error =3D xfs_qm_dqattach_locked(ip, 0);
+	if (error)
+		goto out_unlock;
+
 	/*
-	 * Make sure preallocation does not create extents beyond the range we
-	 * actually support in this filesystem.
+	 * We cap the maximum length we map here to MAX_WRITEBACK_PAGES pages
+	 * to keep the chunks of work done where somewhat symmetric with the
+	 * work writeback does. This is a completely arbitrary number pulled
+	 * out of thin air as a best guess for initial testing.
+	 *
+	 * Note that the values needs to be less than 32-bits wide until
+	 * the lower level functions are updated.
 	 */
-	if (last_fsb > XFS_B_TO_FSB(mp, mp->m_super->s_maxbytes))
-		last_fsb =3D XFS_B_TO_FSB(mp, mp->m_super->s_maxbytes);
+	count =3D min_t(loff_t, count, 1024 * PAGE_SIZE);
+	end_fsb =3D orig_end_fsb =3D
+		min(XFS_B_TO_FSB(mp, offset + count), maxbytes_fsb);
 =

-	ASSERT(last_fsb > offset_fsb);
+	/*
+	 * If we are doing a write at the end of the file and there are no
+	 * allocations past this one, then extend the allocation out to the
+	 * file system's write iosize.
+	 *
+	 * As an exception we don't do any preallocation at all if the file
+	 * is smaller than the minimum preallocation and we are using the
+	 * default dynamic preallocation scheme, as it is likely this is the
+	 * only write to the file that is going to be done.
+	 *
+	 * We clean up any extra space left over when the file is closed in
+	 * xfs_inactive().
+	 */
+	if (eof && offset + count > XFS_ISIZE(ip) &&
+	    ((mp->m_flags & XFS_MOUNT_DFLT_IOSIZE) ||
+	     XFS_ISIZE(ip) >=3D XFS_FSB_TO_B(mp, mp->m_writeio_blocks))) {
+		xfs_fsblock_t		alloc_blocks;
+		xfs_off_t		aligned_offset;
+		xfs_extlen_t		align;
 =

-	nimaps =3D XFS_WRITE_IMAPS;
-	error =3D xfs_bmapi_delay(ip, offset_fsb, last_fsb - offset_fsb,
-				imap, &nimaps, XFS_BMAPI_ENTIRE);
+		/*
+		 * If an explicit allocsize is set, the file is small, or we
+		 * are writing behind a hole, then use the minimum prealloc:
+		 */
+		if ((mp->m_flags & XFS_MOUNT_DFLT_IOSIZE) ||
+		    XFS_ISIZE(ip) < XFS_FSB_TO_B(mp, mp->m_dalign) ||
+		    prev.br_startoff + prev.br_blockcount < offset_fsb)
+			alloc_blocks =3D mp->m_writeio_blocks;
+		else
+			alloc_blocks =3D
+				xfs_iomap_prealloc_size(ip, offset, &prev);
+
+		aligned_offset =3D XFS_WRITEIO_ALIGN(mp, offset + count - 1);
+		end_fsb =3D XFS_B_TO_FSBT(mp, aligned_offset) + alloc_blocks;
+
+		align =3D xfs_align_eof(ip);
+		if (align)
+			end_fsb =3D roundup_64(end_fsb, align);
+
+		end_fsb =3D min(end_fsb, maxbytes_fsb);
+		ASSERT(end_fsb > offset_fsb);
+	}
+
+retry:
+	error =3D xfs_bmapi_reserve_delalloc(ip, offset_fsb,
+			end_fsb - offset_fsb, &got,
+			&prev, &idx, eof);
 	switch (error) {
 	case 0:
+		break;
 	case -ENOSPC:
 	case -EDQUOT:
-		break;
-	default:
-		return error;
-	}
-
-	/*
-	 * If bmapi returned us nothing, we got either ENOSPC or EDQUOT. Retry
-	 * without EOF preallocation.
-	 */
-	if (nimaps =3D=3D 0) {
+		/* retry without any preallocation */
 		trace_xfs_delalloc_enospc(ip, offset, count);
-		if (prealloc) {
-			prealloc =3D 0;
-			error =3D 0;
+		if (end_fsb !=3D orig_end_fsb) {
+			end_fsb =3D orig_end_fsb;
 			goto retry;
 		}
-		return error ? error : -ENOSPC;
+		/*FALLTHRU*/
+	default:
+		goto out_unlock;
 	}
 =

-	if (!(imap[0].br_startblock || XFS_IS_REALTIME_INODE(ip)))
-		return xfs_alert_fsblock_zero(ip, &imap[0]);
+	trace_xfs_iomap_alloc(ip, offset, count, 0, &got);
+done:
+	if (isnullstartblock(got.br_startblock))
+		got.br_startblock =3D DELAYSTARTBLOCK;
+
+	if (!got.br_startblock) {
+		error =3D xfs_alert_fsblock_zero(ip, &got);
+		if (error)
+			goto out_unlock;
+	}
+
+	xfs_bmbt_to_iomap(ip, iomap, &got);
 =

 	/*
 	 * Tag the inode as speculatively preallocated so we can reclaim this
 	 * space on demand, if necessary.
 	 */
-	if (prealloc)
+	if (end_fsb !=3D orig_end_fsb)
 		xfs_inode_set_eofblocks_tag(ip);
 =

-	*ret_imap =3D imap[0];
-	return 0;
+out_unlock:
+	xfs_iunlock(ip, XFS_ILOCK_EXCL);
+	return error;
 }
 =

 /*
@@ -943,32 +918,6 @@ error_on_bmapi_transaction:
 	return error;
 }
 =

-void
-xfs_bmbt_to_iomap(
-	struct xfs_inode	*ip,
-	struct iomap		*iomap,
-	struct xfs_bmbt_irec	*imap)
-{
-	struct xfs_mount	*mp =3D ip->i_mount;
-
-	if (imap->br_startblock =3D=3D HOLESTARTBLOCK) {
-		iomap->blkno =3D IOMAP_NULL_BLOCK;
-		iomap->type =3D IOMAP_HOLE;
-	} else if (imap->br_startblock =3D=3D DELAYSTARTBLOCK) {
-		iomap->blkno =3D IOMAP_NULL_BLOCK;
-		iomap->type =3D IOMAP_DELALLOC;
-	} else {
-		iomap->blkno =3D xfs_fsb_to_db(ip, imap->br_startblock);
-		if (imap->br_state =3D=3D XFS_EXT_UNWRITTEN)
-			iomap->type =3D IOMAP_UNWRITTEN;
-		else
-			iomap->type =3D IOMAP_MAPPED;
-	}
-	iomap->offset =3D XFS_FSB_TO_B(mp, imap->br_startoff);
-	iomap->length =3D XFS_FSB_TO_B(mp, imap->br_blockcount);
-	iomap->bdev =3D xfs_find_bdev_for_inode(VFS_I(ip));
-}
-
 static inline bool imap_needs_alloc(struct xfs_bmbt_irec *imap, int nimaps)
 {
 	return !nimaps ||
@@ -993,6 +942,11 @@ xfs_file_iomap_begin(
 	if (XFS_FORCED_SHUTDOWN(mp))
 		return -EIO;
 =

+	if ((flags & IOMAP_WRITE) && !xfs_get_extsz_hint(ip)) {
+		return xfs_file_iomap_begin_delay(inode, offset, length, flags,
+				iomap);
+	}
+
 	xfs_ilock(ip, XFS_ILOCK_EXCL);
 =

 	ASSERT(offset <=3D mp->m_super->s_maxbytes);
@@ -1020,19 +974,13 @@ xfs_file_iomap_begin(
 		 * the lower level functions are updated.
 		 */
 		length =3D min_t(loff_t, length, 1024 * PAGE_SIZE);
-		if (xfs_get_extsz_hint(ip)) {
-			/*
-			 * xfs_iomap_write_direct() expects the shared lock. It
-			 * is unlocked on return.
-			 */
-			xfs_ilock_demote(ip, XFS_ILOCK_EXCL);
-			error =3D xfs_iomap_write_direct(ip, offset, length, &imap,
-					nimaps);
-		} else {
-			error =3D xfs_iomap_write_delay(ip, offset, length, &imap);
-			xfs_iunlock(ip, XFS_ILOCK_EXCL);
-		}
-
+		/*
+		 * xfs_iomap_write_direct() expects the shared lock. It
+		 * is unlocked on return.
+		 */
+		xfs_ilock_demote(ip, XFS_ILOCK_EXCL);
+		error =3D xfs_iomap_write_direct(ip, offset, length, &imap,
+				nimaps);
 		if (error)
 			return error;
 =

diff --git a/fs/xfs/xfs_iomap.h b/fs/xfs/xfs_iomap.h
index e066d04..1fdf68d 100644
--- a/fs/xfs/xfs_iomap.h
+++ b/fs/xfs/xfs_iomap.h
@@ -25,8 +25,6 @@ struct xfs_bmbt_irec;
 =

 int xfs_iomap_write_direct(struct xfs_inode *, xfs_off_t, size_t,
 			struct xfs_bmbt_irec *, int);
-int xfs_iomap_write_delay(struct xfs_inode *, xfs_off_t, size_t,
-			struct xfs_bmbt_irec *);
 int xfs_iomap_write_allocate(struct xfs_inode *, xfs_off_t,
 			struct xfs_bmbt_irec *);
 int xfs_iomap_write_unwritten(struct xfs_inode *, xfs_off_t, xfs_off_t);

--===============0259991548785881940==--

