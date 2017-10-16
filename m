Content-Type: multipart/mixed; boundary="===============0968002474696253666=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 91f9943e1c: aim7.jobs-per-min -26.6% regression
Date: Mon, 16 Oct 2017 09:34:18 +0200
Message-ID: <20171016073418.GA28778@lst.de>
In-Reply-To: <20171016024021.GH26196@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0968002474696253666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The only change for the non-nowait case is that we now do a trylock before
locking i_rwsem.  In the past that was the more optimal pattern.  Can you
test the patch below if that's not the case anymore?  We have a few more
instances like that which might also want to be changed then.

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 309e26c9dddb..ad61c78605d1 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -258,10 +258,11 @@ xfs_file_buffered_aio_read(
 	ssize_t			ret;
 =

 	trace_xfs_file_buffered_read(ip, iov_iter_count(to), iocb->ki_pos);
-
-	if (!xfs_ilock_nowait(ip, XFS_IOLOCK_SHARED)) {
-		if (iocb->ki_flags & IOCB_NOWAIT)
+		=

+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		if (!xfs_ilock_nowait(ip, XFS_IOLOCK_SHARED))
 			return -EAGAIN;
+	} else {
 		xfs_ilock(ip, XFS_IOLOCK_SHARED);
 	}
 	ret =3D generic_file_read_iter(iocb, to);

--===============0968002474696253666==--

