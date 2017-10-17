Content-Type: multipart/mixed; boundary="===============4970723222916982553=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 91f9943e1c: aim7.jobs-per-min -26.6% regression
Date: Tue, 17 Oct 2017 11:06:21 +0800
Message-ID: <20171017030621.GR26196@yexl-desktop>
In-Reply-To: <20171016073418.GA28778@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4970723222916982553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/16, Christoph Hellwig wrote:
>The only change for the non-nowait case is that we now do a trylock before
>locking i_rwsem.  In the past that was the more optimal pattern.  Can you
>test the patch below if that's not the case anymore?  We have a few more
>instances like that which might also want to be changed then.
>

The test result showed this fix patch helps recover the performance.

Below is the comparison (41d4b81 is the fix commit applied on top of 91f994=
3e1c).

$ compare -at 91f9943e1c7b6638f27312d03f 41d4b81c40b8873aa29b4b0224da3caf02=
42dd1c                                                                     =
                                                                           =
                                                  =

tests: 1
testcase/path_params/tbox_group/run: aim7/4BRD_12G-RAID1-xfs-disk_rd-9000-p=
erformance/lkp-ivb-ep01

91f9943e1c7b6638  41d4b81c40b8873aa29b4b0224  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

    353690              32%     467669        aim7.jobs-per-min
       153             -24%        116        aim7.time.elapsed_time
       153             -24%        116        aim7.time.elapsed_time.max
      5670             -26%       4184 =C2=B1  3%  aim7.time.system_time
     69648 =C2=B1 15%       -30%      48932 =C2=B1 11%  aim7.time.voluntary=
_context_switches
    774279 =C2=B1  4%       -33%     522402 =C2=B1  6%  aim7.time.involunta=
ry_context_switches
     63750             -20%      51085        interrupts.CAL:Function_call_=
interrupts
     43353               4%      45157        vmstat.system.in

Thanks,
Xiaolong

>diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
>index 309e26c9dddb..ad61c78605d1 100644
>--- a/fs/xfs/xfs_file.c
>+++ b/fs/xfs/xfs_file.c
>@@ -258,10 +258,11 @@ xfs_file_buffered_aio_read(
> 	ssize_t			ret;
> =

> 	trace_xfs_file_buffered_read(ip, iov_iter_count(to), iocb->ki_pos);
>-
>-	if (!xfs_ilock_nowait(ip, XFS_IOLOCK_SHARED)) {
>-		if (iocb->ki_flags & IOCB_NOWAIT)
>+		=

>+	if (iocb->ki_flags & IOCB_NOWAIT) {
>+		if (!xfs_ilock_nowait(ip, XFS_IOLOCK_SHARED))
> 			return -EAGAIN;
>+	} else {
> 		xfs_ilock(ip, XFS_IOLOCK_SHARED);
> 	}
> 	ret =3D generic_file_read_iter(iocb, to);

--===============4970723222916982553==--

