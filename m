Content-Type: multipart/mixed; boundary="===============7486459673768764030=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Wed, 20 Jul 2022 12:13:27 -0600
Message-ID: <299889df-db40-e0e2-6bc6-d9eb784ebe89@kernel.dk>
In-Reply-To: <f5d20f6c-5363-231b-b208-b577a59b4ae9@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7486459673768764030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/20/22 11:24 AM, Jens Axboe wrote:
> On 7/19/22 2:58 AM, Yin Fengwei wrote:
>> Hi Jens,
>>
>> On 7/19/2022 10:29 AM, Jens Axboe wrote:
>>> I'll poke at this tomorrow.
>>
>> Just FYI. Another finding (test is based on commit 584b0180f0):
>> If the code block is put to different function, the fio performance resu=
lt is
>> different:
> =

> I think this turned out to be a little bit of a goose chase. What's
> happening here is that later kernels defer the file assignment, which
> means it isn't set if a request is queued with IOSQE_ASYNC. That in
> turn, for writes, means that we don't hash it on io-wq insertion, and
> then it doesn't get serialized with other writes to that file.
> =

> I'll come up with a patch for this that you can test.

Can you try this? It's against 5.19-rc7.


diff --git a/fs/io_uring.c b/fs/io_uring.c
index a01ea49f3017..34758e95990a 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2015,6 +2015,64 @@ static inline void io_arm_ltimeout(struct io_kiocb *=
req)
 		__io_arm_ltimeout(req);
 }
 =

+static bool io_bdev_nowait(struct block_device *bdev)
+{
+	return !bdev || blk_queue_nowait(bdev_get_queue(bdev));
+}
+
+/*
+ * If we tracked the file through the SCM inflight mechanism, we could sup=
port
+ * any file. For now, just ensure that anything potentially problematic is=
 done
+ * inline.
+ */
+static bool __io_file_supports_nowait(struct file *file, umode_t mode)
+{
+	if (S_ISBLK(mode)) {
+		if (IS_ENABLED(CONFIG_BLOCK) &&
+		    io_bdev_nowait(I_BDEV(file->f_mapping->host)))
+			return true;
+		return false;
+	}
+	if (S_ISSOCK(mode))
+		return true;
+	if (S_ISREG(mode)) {
+		if (IS_ENABLED(CONFIG_BLOCK) &&
+		    io_bdev_nowait(file->f_inode->i_sb->s_bdev) &&
+		    file->f_op !=3D &io_uring_fops)
+			return true;
+		return false;
+	}
+
+	/* any ->read/write should understand O_NONBLOCK */
+	if (file->f_flags & O_NONBLOCK)
+		return true;
+	return file->f_mode & FMODE_NOWAIT;
+}
+
+static inline bool io_file_supports_nowait(struct io_kiocb *req)
+{
+	return req->flags & REQ_F_SUPPORT_NOWAIT;
+}
+
+/*
+ * If we tracked the file through the SCM inflight mechanism, we could sup=
port
+ * any file. For now, just ensure that anything potentially problematic is=
 done
+ * inline.
+ */
+static unsigned int io_file_get_flags(struct file *file)
+{
+	umode_t mode =3D file_inode(file)->i_mode;
+	unsigned int res =3D 0;
+
+	if (S_ISREG(mode))
+		res |=3D FFS_ISREG;
+	if (__io_file_supports_nowait(file, mode))
+		res |=3D FFS_NOWAIT;
+	if (io_file_need_scm(file))
+		res |=3D FFS_SCM;
+	return res;
+}
+
 static void io_prep_async_work(struct io_kiocb *req)
 {
 	const struct io_op_def *def =3D &io_op_defs[req->opcode];
@@ -2031,6 +2089,9 @@ static void io_prep_async_work(struct io_kiocb *req)
 	if (req->flags & REQ_F_FORCE_ASYNC)
 		req->work.flags |=3D IO_WQ_WORK_CONCURRENT;
 =

+	if (req->file && !io_req_ffs_set(req))
+		req->flags |=3D io_file_get_flags(req->file) << REQ_F_SUPPORT_NOWAIT_BIT;
+
 	if (req->flags & REQ_F_ISREG) {
 		if (def->hash_reg_file || (ctx->flags & IORING_SETUP_IOPOLL))
 			io_wq_hash_work(&req->work, file_inode(req->file));
@@ -3556,64 +3617,6 @@ static void io_iopoll_req_issued(struct io_kiocb *re=
q, unsigned int issue_flags)
 	}
 }
 =

-static bool io_bdev_nowait(struct block_device *bdev)
-{
-	return !bdev || blk_queue_nowait(bdev_get_queue(bdev));
-}
-
-/*
- * If we tracked the file through the SCM inflight mechanism, we could sup=
port
- * any file. For now, just ensure that anything potentially problematic is=
 done
- * inline.
- */
-static bool __io_file_supports_nowait(struct file *file, umode_t mode)
-{
-	if (S_ISBLK(mode)) {
-		if (IS_ENABLED(CONFIG_BLOCK) &&
-		    io_bdev_nowait(I_BDEV(file->f_mapping->host)))
-			return true;
-		return false;
-	}
-	if (S_ISSOCK(mode))
-		return true;
-	if (S_ISREG(mode)) {
-		if (IS_ENABLED(CONFIG_BLOCK) &&
-		    io_bdev_nowait(file->f_inode->i_sb->s_bdev) &&
-		    file->f_op !=3D &io_uring_fops)
-			return true;
-		return false;
-	}
-
-	/* any ->read/write should understand O_NONBLOCK */
-	if (file->f_flags & O_NONBLOCK)
-		return true;
-	return file->f_mode & FMODE_NOWAIT;
-}
-
-/*
- * If we tracked the file through the SCM inflight mechanism, we could sup=
port
- * any file. For now, just ensure that anything potentially problematic is=
 done
- * inline.
- */
-static unsigned int io_file_get_flags(struct file *file)
-{
-	umode_t mode =3D file_inode(file)->i_mode;
-	unsigned int res =3D 0;
-
-	if (S_ISREG(mode))
-		res |=3D FFS_ISREG;
-	if (__io_file_supports_nowait(file, mode))
-		res |=3D FFS_NOWAIT;
-	if (io_file_need_scm(file))
-		res |=3D FFS_SCM;
-	return res;
-}
-
-static inline bool io_file_supports_nowait(struct io_kiocb *req)
-{
-	return req->flags & REQ_F_SUPPORT_NOWAIT;
-}
-
 static int io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 	struct kiocb *kiocb =3D &req->rw.kiocb;

-- =

Jens Axboe

--===============7486459673768764030==--

