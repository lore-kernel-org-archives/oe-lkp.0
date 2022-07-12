Content-Type: multipart/mixed; boundary="===============7079476145030973063=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Tue, 12 Jul 2022 16:06:54 +0800
Message-ID: <0d60aa42-a519-12ad-3c69-72ed12398865@intel.com>
In-Reply-To: <2085bfef-a91c-8adb-402b-242e8c5d5c55@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7079476145030973063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On 5/27/2022 9:50 PM, Jens Axboe wrote:
> I'm a bit skeptical on this, but I'd like to try and run the test case.
> Since it's just a fio test case, why can't I find it somewhere? Seems
> very convoluted to have to setup lkp-tests just for this. Besides, I
> tried, but it doesn't work on aarch64...
Recheck this regression report. The regression could be reproduced if
the following config file is used with fio (tag: fio-3.25) :

	[global]
	rw=3Dwrite
	ioengine=3Dio_uring
	iodepth=3D64
	size=3D1g
	direct=3D1
	buffered=3D1
	startdelay=3D5
	force_async=3D4
	ramp_time=3D5
	runtime=3D20
	time_based
	clat_percentiles=3D0
	disable_lat=3D1
	disable_clat=3D1
	disable_slat=3D1
	filename=3Dtest_fiofile
	[test]
	name=3Dtest
	bs=3D1M
	stonewall

Just FYI, a small change to commit: 584b0180f0f4d67d7145950fe68c625f06c88b1=
0:

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 969f65de9972..616d857f8fc6 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -3181,8 +3181,13 @@ static int io_prep_rw(struct io_kiocb *req, const st=
ruct io_uring_sqe *sqe)
 {
        struct kiocb *kiocb =3D &req->rw.kiocb;
        unsigned ioprio;
+       struct file *file =3D req->file;
        int ret;

+       if (likely(file && (file->f_mode & FMODE_WRITE)))
+               if (!io_req_ffs_set(req))
+                       req->flags |=3D io_file_get_flags(file) << REQ_F_SU=
PPORT_NOWAIT_BIT;
+
        kiocb->ki_pos =3D READ_ONCE(sqe->off);

        ioprio =3D READ_ONCE(sqe->ioprio);

could make regression gone. No idea how req->flags impact the write perform=
ance. Thanks.


Regards
Yin, Fengwei
--===============7079476145030973063==--

