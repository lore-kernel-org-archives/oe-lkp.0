Content-Type: multipart/mixed; boundary="===============0504383900333680483=="
MIME-Version: 1.0
From: Chris Mason <clm@fb.com>
To: lkp@lists.01.org
Subject: [PATCH] Btrfs: fix filemap_flush call in btrfs_file_release
Date: Wed, 20 Aug 2014 10:48:53 -0400
Message-ID: <53F4B555.7060403@fb.com>
In-Reply-To: <53F47E07.3080807@cn.fujitsu.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0504383900333680483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


We should only be flushing on close if the file was flagged as needing
it during truncate.  I broke this with my ordered data vs transaction
commit deadlock fix.

Thanks to Miao Xie for catching this.

Signed-off-by: Chris Mason <clm@fb.com>
Reported-by: Miao Xie <miaox@cn.fujitsu.com>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index f15c13f..36861b7 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1840,7 +1840,15 @@ int btrfs_release_file(struct inode *inode, struct f=
ile *filp)
 {
 	if (filp->private_data)
 		btrfs_ioctl_trans_end(filp);
-	filemap_flush(inode->i_mapping);
+	/*
+	 * ordered_data_close is set by settattr when we are about to truncate
+	 * a file from a non-zero size to a zero size.  This tries to
+	 * flush down new bytes that may have been written if the
+	 * application were using truncate to replace a file in place.
+	 */
+	if (test_and_clear_bit(BTRFS_INODE_ORDERED_DATA_CLOSE,
+			       &BTRFS_I(inode)->runtime_flags))
+			filemap_flush(inode->i_mapping);
 	return 0;
 }
=20

--===============0504383900333680483==--

