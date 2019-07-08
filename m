Content-Type: multipart/mixed; boundary="===============7952167894979819291=="
MIME-Version: 1.0
From: Brian Foster <bfoster@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] xfs: don't update lastino for FSBULKSTAT_SINGLE
Date: Mon, 08 Jul 2019 08:28:00 -0400
Message-ID: <20190708122800.GC51396@bfoster>
In-Reply-To: <20190706212517.GH1654093@magnolia>
List-Id: <oe-lkp.lists.linux.dev>

--===============7952167894979819291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2019 at 02:25:17PM -0700, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> =

> The kernel test robot found a regression of xfs/054 in the conversion of
> bulkstat to use the new iwalk infrastructure -- if a caller set *lastip
> =3D 128 and invoked FSBULKSTAT_SINGLE, the bstat info would be for inode
> 128, but *lastip would be increased by the kernel to 129.
> =

> FSBULKSTAT_SINGLE never incremented lastip before, so it's incorrect to
> make such an update to the internal lastino value now.
> =

> Fixes: 2810bd6840e463 ("xfs: convert bulkstat to new iwalk infrastructure=
")
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> ---

Reviewed-by: Brian Foster <bfoster@redhat.com>

>  fs/xfs/xfs_ioctl.c |    1 -
>  1 file changed, 1 deletion(-)
> =

> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index 6bf04e71325b..1876461e5104 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -797,7 +797,6 @@ xfs_ioc_fsbulkstat(
>  		breq.startino =3D lastino;
>  		breq.icount =3D 1;
>  		error =3D xfs_bulkstat_one(&breq, xfs_fsbulkstat_one_fmt);
> -		lastino =3D breq.startino;
>  	} else {	/* XFS_IOC_FSBULKSTAT */
>  		breq.startino =3D lastino ? lastino + 1 : 0;
>  		error =3D xfs_bulkstat(&breq, xfs_fsbulkstat_one_fmt);

--===============7952167894979819291==--

