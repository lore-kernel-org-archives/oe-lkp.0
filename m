Content-Type: multipart/mixed; boundary="===============8363393546686490973=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Tue, 19 Jul 2022 16:58:48 +0800
Message-ID: <2ec953da-78fd-df01-44cf-6f33a5e40864@intel.com>
In-Reply-To: <74d1f308-de03-fd5e-b7f0-0e17980f988e@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============8363393546686490973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On 7/19/2022 10:29 AM, Jens Axboe wrote:
> I'll poke at this tomorrow.

Just FYI. Another finding (test is based on commit 584b0180f0):
If the code block is put to different function, the fio performance result =
is
different:

Patch1:
diff --git a/fs/io_uring.c b/fs/io_uring.c
index 616d857f8fc6..b0578a3d063a 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3184,10 +3184,6 @@ static int io_prep_rw(struct io_kiocb *req, const st=
ruct io_uring_sqe *sqe)
        struct file *file =3D req->file;
        int ret;

-       if (likely(file && (file->f_mode & FMODE_WRITE)))
-               if (!io_req_ffs_set(req))
-                       req->flags |=3D io_file_get_flags(file) << REQ_F_SU=
PPORT_NOWAIT_BIT;
-
        kiocb->ki_pos =3D READ_ONCE(sqe->off);

        ioprio =3D READ_ONCE(sqe->ioprio);
@@ -7852,6 +7848,10 @@ static int io_submit_sqe(struct io_ring_ctx *ctx, st=
ruct io_kiocb *req,
                return 0;
        }

+       if (likely(req->file))
+               if (!io_req_ffs_set(req))
+                       req->flags |=3D io_file_get_flags(req->file) << REQ=
_F_SUPPORT_NOWAIT_BIT;
+
        io_queue_sqe(req);
        return 0;


Patch2:
diff --git a/fs/io_uring.c b/fs/io_uring.c
index b0578a3d063a..af705e7ba8d3 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -7639,6 +7639,11 @@ static void io_queue_sqe_fallback(struct io_kiocb *r=
eq)
 static inline void io_queue_sqe(struct io_kiocb *req)
        __must_hold(&req->ctx->uring_lock)
 {
+
+       if (likely(req->file))
+               if (!io_req_ffs_set(req))
+                       req->flags |=3D io_file_get_flags(req->file) << REQ=
_F_SUPPORT_NOWAIT_BIT;
+
        if (likely(!(req->flags & (REQ_F_FORCE_ASYNC | REQ_F_FAIL))))
                __io_queue_sqe(req);
        else
@@ -7848,10 +7853,6 @@ static int io_submit_sqe(struct io_ring_ctx *ctx, st=
ruct io_kiocb *req,
                return 0;
        }

-       if (likely(req->file))
-               if (!io_req_ffs_set(req))
-                       req->flags |=3D io_file_get_flags(req->file) << REQ=
_F_SUPPORT_NOWAIT_BIT;
-
        io_queue_sqe(req);
        return 0;
 }

Patch3:
diff --git a/fs/io_uring.c b/fs/io_uring.c
index af705e7ba8d3..5771d6d0ad8a 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -7598,6 +7598,10 @@ static inline void __io_queue_sqe(struct io_kiocb *r=
eq)
        struct io_kiocb *linked_timeout;
        int ret;

+       if (likely(req->file))
+               if (!io_req_ffs_set(req))
+                       req->flags |=3D io_file_get_flags(req->file) << REQ=
_F_SUPPORT_NOWAIT_BIT;
+
        ret =3D io_issue_sqe(req, IO_URING_F_NONBLOCK|IO_URING_F_COMPLETE_D=
EFER);

        if (req->flags & REQ_F_COMPLETE_INLINE) {
@@ -7640,10 +7644,6 @@ static inline void io_queue_sqe(struct io_kiocb *req)
        __must_hold(&req->ctx->uring_lock)
 {

-       if (likely(req->file))
-               if (!io_req_ffs_set(req))
-                       req->flags |=3D io_file_get_flags(req->file) << REQ=
_F_SUPPORT_NOWAIT_BIT;
-
        if (likely(!(req->flags & (REQ_F_FORCE_ASYNC | REQ_F_FAIL))))
                __io_queue_sqe(req);
        else


The test result (confirmed on my own test env and LKP):
    patch1 and patch2 have no regression. patch3 has regression.


Regards
Yin, Fengwei
--===============8363393546686490973==--

