Content-Type: multipart/mixed; boundary="===============5944855004049442865=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Mon, 18 Jul 2022 08:58:17 +0800
Message-ID: <6d70460d-0a85-4104-9abc-dd100af99e6f@intel.com>
In-Reply-To: <26d913ea-7aa0-467d-4caf-a93f8ca5b3ff@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5944855004049442865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 7/15/2022 11:58 PM, Jens Axboe wrote:
> I can't really explain that either, at least not immediately. I tried
> running with and without that patch, and don't see any difference here.
> In terms of making this more obvious, does the below also fix it for
> you?
I will try the fix and let you know the result.

> =

> And what filesystem is this being run on?
I am using ext4 and LKP are also using ext4. Thanks.


Regards
Yin, Fengwei

> =

> =

> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index a01ea49f3017..797fad99780d 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -4269,9 +4269,6 @@ static int io_rw_init_file(struct io_kiocb *req, fm=
ode_t mode)
>  	if (unlikely(!file || !(file->f_mode & mode)))
>  		return -EBADF;
>  =

> -	if (!io_req_ffs_set(req))
> -		req->flags |=3D io_file_get_flags(file) << REQ_F_SUPPORT_NOWAIT_BIT;
> -
>  	kiocb->ki_flags =3D iocb_flags(file);
>  	ret =3D kiocb_set_rw_flags(kiocb, req->rw.flags);
>  	if (unlikely(ret))
> @@ -8309,7 +8306,13 @@ static bool io_assign_file(struct io_kiocb *req, u=
nsigned int issue_flags)
>  	else
>  		req->file =3D io_file_get_normal(req, req->cqe.fd);
>  =

> -	return !!req->file;
> +	if (unlikely(!req->file))
> +		return false;
> +
> +	if (!io_req_ffs_set(req))
> +		req->flags |=3D io_file_get_flags(file) << REQ_F_SUPPORT_NOWAIT_BIT;
> +
> +	return true;
>  }
>  =

>  static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
--===============5944855004049442865==--

