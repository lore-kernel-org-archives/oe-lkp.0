Content-Type: multipart/mixed; boundary="===============4437163721459412641=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [io_uring] 584b0180f0: phoronix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDirectory.mb_s -10.2% regression
Date: Thu, 21 Jul 2022 10:59:39 +0800
Message-ID: <0863d7c1-1063-2a2a-d70d-764a7580c874@intel.com>
In-Reply-To: <299889df-db40-e0e2-6bc6-d9eb784ebe89@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4437163721459412641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On 7/21/2022 2:13 AM, Jens Axboe wrote:
> Can you try this? It's against 5.19-rc7.
> =

> =

> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index a01ea49f3017..34758e95990a 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -2015,6 +2015,64 @@ static inline void io_arm_ltimeout(struct io_kiocb=
 *req)
>  		__io_arm_ltimeout(req);
>  }
>  =

> +static bool io_bdev_nowait(struct block_device *bdev)
> +{
> +	return !bdev || blk_queue_nowait(bdev_get_queue(bdev));
> +}
> +
> +/*
> + * If we tracked the file through the SCM inflight mechanism, we could s=
upport
> + * any file. For now, just ensure that anything potentially problematic =
is done
> + * inline.
> + */
> +static bool __io_file_supports_nowait(struct file *file, umode_t mode)
> +{
> +	if (S_ISBLK(mode)) {
> +		if (IS_ENABLED(CONFIG_BLOCK) &&
> +		    io_bdev_nowait(I_BDEV(file->f_mapping->host)))
> +			return true;
> +		return false;
> +	}
> +	if (S_ISSOCK(mode))
> +		return true;
> +	if (S_ISREG(mode)) {
> +		if (IS_ENABLED(CONFIG_BLOCK) &&
> +		    io_bdev_nowait(file->f_inode->i_sb->s_bdev) &&
> +		    file->f_op !=3D &io_uring_fops)
> +			return true;
> +		return false;
> +	}
> +
> +	/* any ->read/write should understand O_NONBLOCK */
> +	if (file->f_flags & O_NONBLOCK)
> +		return true;
> +	return file->f_mode & FMODE_NOWAIT;
> +}
> +
> +static inline bool io_file_supports_nowait(struct io_kiocb *req)
> +{
> +	return req->flags & REQ_F_SUPPORT_NOWAIT;
> +}
> +
> +/*
> + * If we tracked the file through the SCM inflight mechanism, we could s=
upport
> + * any file. For now, just ensure that anything potentially problematic =
is done
> + * inline.
> + */
> +static unsigned int io_file_get_flags(struct file *file)
> +{
> +	umode_t mode =3D file_inode(file)->i_mode;
> +	unsigned int res =3D 0;
> +
> +	if (S_ISREG(mode))
> +		res |=3D FFS_ISREG;
> +	if (__io_file_supports_nowait(file, mode))
> +		res |=3D FFS_NOWAIT;
> +	if (io_file_need_scm(file))
> +		res |=3D FFS_SCM;
> +	return res;
> +}
> +
>  static void io_prep_async_work(struct io_kiocb *req)
>  {
>  	const struct io_op_def *def =3D &io_op_defs[req->opcode];
> @@ -2031,6 +2089,9 @@ static void io_prep_async_work(struct io_kiocb *req)
>  	if (req->flags & REQ_F_FORCE_ASYNC)
>  		req->work.flags |=3D IO_WQ_WORK_CONCURRENT;
>  =

> +	if (req->file && !io_req_ffs_set(req))
> +		req->flags |=3D io_file_get_flags(req->file) << REQ_F_SUPPORT_NOWAIT_B=
IT;
> +
>  	if (req->flags & REQ_F_ISREG) {
>  		if (def->hash_reg_file || (ctx->flags & IORING_SETUP_IOPOLL))
>  			io_wq_hash_work(&req->work, file_inode(req->file));
> @@ -3556,64 +3617,6 @@ static void io_iopoll_req_issued(struct io_kiocb *=
req, unsigned int issue_flags)
>  	}
>  }
>  =

> -static bool io_bdev_nowait(struct block_device *bdev)
> -{
> -	return !bdev || blk_queue_nowait(bdev_get_queue(bdev));
> -}
> -
> -/*
> - * If we tracked the file through the SCM inflight mechanism, we could s=
upport
> - * any file. For now, just ensure that anything potentially problematic =
is done
> - * inline.
> - */
> -static bool __io_file_supports_nowait(struct file *file, umode_t mode)
> -{
> -	if (S_ISBLK(mode)) {
> -		if (IS_ENABLED(CONFIG_BLOCK) &&
> -		    io_bdev_nowait(I_BDEV(file->f_mapping->host)))
> -			return true;
> -		return false;
> -	}
> -	if (S_ISSOCK(mode))
> -		return true;
> -	if (S_ISREG(mode)) {
> -		if (IS_ENABLED(CONFIG_BLOCK) &&
> -		    io_bdev_nowait(file->f_inode->i_sb->s_bdev) &&
> -		    file->f_op !=3D &io_uring_fops)
> -			return true;
> -		return false;
> -	}
> -
> -	/* any ->read/write should understand O_NONBLOCK */
> -	if (file->f_flags & O_NONBLOCK)
> -		return true;
> -	return file->f_mode & FMODE_NOWAIT;
> -}
> -
> -/*
> - * If we tracked the file through the SCM inflight mechanism, we could s=
upport
> - * any file. For now, just ensure that anything potentially problematic =
is done
> - * inline.
> - */
> -static unsigned int io_file_get_flags(struct file *file)
> -{
> -	umode_t mode =3D file_inode(file)->i_mode;
> -	unsigned int res =3D 0;
> -
> -	if (S_ISREG(mode))
> -		res |=3D FFS_ISREG;
> -	if (__io_file_supports_nowait(file, mode))
> -		res |=3D FFS_NOWAIT;
> -	if (io_file_need_scm(file))
> -		res |=3D FFS_SCM;
> -	return res;
> -}
> -
> -static inline bool io_file_supports_nowait(struct io_kiocb *req)
> -{
> -	return req->flags & REQ_F_SUPPORT_NOWAIT;
> -}
> -
>  static int io_prep_rw(struct io_kiocb *req, const struct io_uring_sqe *s=
qe)
>  {
>  	struct kiocb *kiocb =3D &req->rw.kiocb;
> =

> -- Jens Axboe
This change could make regression gone. The test result is as following:
28d3a5662d44077aa6eb42bfcfa is your patch


584b0180f0f4d67d                   v5.19-rc7 28d3a5662d44077aa6eb42bfcfa
---------------- --------------------------- ---------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |
        503:3         9297%         782:3          178%         509:3     d=
mesg.timestamp:last
          3:3            0%           3:3            0%           3:3     p=
meter.pmeter.fail
           :3          100%           3:3          100%           3:3     k=
msg.I/O_error,dev_loop#,sector#op#:(READ)flags#phys_seg#prio_class
           :3         3755%         112:3         4016%         120:3     k=
msg.timestamp:I/O_error,dev_loop#,sector#op#:(READ)flags#phys_seg#prio_class
        465:3         9221%         742:3          235%         473:3     k=
msg.timestamp:last
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
    972.00            -0.3%     968.67           +11.4%       1082        p=
horonix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDire=
ctory.iops
    975.00            -0.3%     972.33           +11.5%       1086        p=
horonix-test-suite.fio.SequentialWrite.IO_uring.Yes.Yes.1MB.DefaultTestDire=
ctory.mb_s

Comparing to v5.19-rc7 and 584b0180f0f4d67d, it could bring 11% regression =
back.
Thanks.


Regards
Yin, Fengwei
--===============4437163721459412641==--

