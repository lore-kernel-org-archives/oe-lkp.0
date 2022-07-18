Content-Type: multipart/mixed; boundary="===============6466049153064244103=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Mon, 18 Jul 2022 11:30:34 +0800
Message-ID: <9df150bb-f4fd-7857-aea8-b2c7a06a8791@intel.com>
In-Reply-To: <26d913ea-7aa0-467d-4caf-a93f8ca5b3ff@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============6466049153064244103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On 7/15/2022 11:58 PM, Jens Axboe wrote:
> In terms of making this more obvious, does the below also fix it for
> you?

The regression is still there after applied the change you posted.


Your change can't be applied to v5.18 (the latest commit on master branch).
I changed it a little bit to be applied:

diff --git a/fs/io_uring.c b/fs/io_uring.c
index e0823f58f7959..0bf7f3d18d46e 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3762,9 +3762,6 @@ static int io_rw_init_file(struct io_kiocb *req, fmod=
e_t mode)
        if (unlikely(!file || !(file->f_mode & mode)))
                return -EBADF;

-       if (!io_req_ffs_set(req))
-               req->flags |=3D io_file_get_flags(file) << REQ_F_SUPPORT_NO=
WAIT_BIT;
-
        kiocb->ki_flags =3D iocb_flags(file);
        ret =3D kiocb_set_rw_flags(kiocb, req->rw.flags);
        if (unlikely(ret))
@@ -7114,8 +7111,13 @@ static bool io_assign_file(struct io_kiocb *req, uns=
igned int issue_flags)
                req->file =3D io_file_get_fixed(req, req->fd, issue_flags);
        else
                req->file =3D io_file_get_normal(req, req->fd);
-       if (req->file)
+       if (req->file) {
+               if (!io_req_ffs_set(req))
+                       req->flags |=3D io_file_get_flags(req->file) <<
+                                               REQ_F_SUPPORT_NOWAIT_BIT;
+
                return true;
+       }

        req_set_fail(req);
        req->result =3D -EBADF;


Regards
Yin, Fengwei
--===============6466049153064244103==--

