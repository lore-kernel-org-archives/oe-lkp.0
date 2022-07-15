Content-Type: multipart/mixed; boundary="===============7809534234937096266=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Fri, 15 Jul 2022 09:58:24 -0600
Message-ID: <26d913ea-7aa0-467d-4caf-a93f8ca5b3ff@kernel.dk>
In-Reply-To: <0d60aa42-a519-12ad-3c69-72ed12398865@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7809534234937096266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/12/22 2:06 AM, Yin Fengwei wrote:
> Hi Jens,
> =

> On 5/27/2022 9:50 PM, Jens Axboe wrote:
>> I'm a bit skeptical on this, but I'd like to try and run the test case.
>> Since it's just a fio test case, why can't I find it somewhere? Seems
>> very convoluted to have to setup lkp-tests just for this. Besides, I
>> tried, but it doesn't work on aarch64...
> Recheck this regression report. The regression could be reproduced if
> the following config file is used with fio (tag: fio-3.25) :
> =

> 	[global]
> 	rw=3Dwrite
> 	ioengine=3Dio_uring
> 	iodepth=3D64
> 	size=3D1g
> 	direct=3D1
> 	buffered=3D1
> 	startdelay=3D5
> 	force_async=3D4
> 	ramp_time=3D5
> 	runtime=3D20
> 	time_based
> 	clat_percentiles=3D0
> 	disable_lat=3D1
> 	disable_clat=3D1
> 	disable_slat=3D1
> 	filename=3Dtest_fiofile
> 	[test]
> 	name=3Dtest
> 	bs=3D1M
> 	stonewall
> =

> Just FYI, a small change to commit: 584b0180f0f4d67d7145950fe68c625f06c88=
b10:
> =

> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index 969f65de9972..616d857f8fc6 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -3181,8 +3181,13 @@ static int io_prep_rw(struct io_kiocb *req, const =
struct io_uring_sqe *sqe)
>  {
>         struct kiocb *kiocb =3D &req->rw.kiocb;
>         unsigned ioprio;
> +       struct file *file =3D req->file;
>         int ret;
> =

> +       if (likely(file && (file->f_mode & FMODE_WRITE)))
> +               if (!io_req_ffs_set(req))
> +                       req->flags |=3D io_file_get_flags(file) << REQ_F_=
SUPPORT_NOWAIT_BIT;
> +
>         kiocb->ki_pos =3D READ_ONCE(sqe->off);
> =

>         ioprio =3D READ_ONCE(sqe->ioprio);
> =

> could make regression gone. No idea how req->flags impact the write
> performance. Thanks.

I can't really explain that either, at least not immediately. I tried
running with and without that patch, and don't see any difference here.
In terms of making this more obvious, does the below also fix it for
you?

And what filesystem is this being run on?


diff --git a/fs/io_uring.c b/fs/io_uring.c
index a01ea49f3017..797fad99780d 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -4269,9 +4269,6 @@ static int io_rw_init_file(struct io_kiocb *req, fmod=
e_t mode)
 	if (unlikely(!file || !(file->f_mode & mode)))
 		return -EBADF;
 =

-	if (!io_req_ffs_set(req))
-		req->flags |=3D io_file_get_flags(file) << REQ_F_SUPPORT_NOWAIT_BIT;
-
 	kiocb->ki_flags =3D iocb_flags(file);
 	ret =3D kiocb_set_rw_flags(kiocb, req->rw.flags);
 	if (unlikely(ret))
@@ -8309,7 +8306,13 @@ static bool io_assign_file(struct io_kiocb *req, uns=
igned int issue_flags)
 	else
 		req->file =3D io_file_get_normal(req, req->cqe.fd);
 =

-	return !!req->file;
+	if (unlikely(!req->file))
+		return false;
+
+	if (!io_req_ffs_set(req))
+		req->flags |=3D io_file_get_flags(file) << REQ_F_SUPPORT_NOWAIT_BIT;
+
+	return true;
 }
 =

 static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)

-- =

Jens Axboe

--===============7809534234937096266==--

