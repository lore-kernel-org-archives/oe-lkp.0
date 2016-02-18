Content-Type: multipart/mixed; boundary="===============1454006829412012898=="
MIME-Version: 1.0
From: Darrick J. Wong <darrick.wong@oracle.com>
To: lkp@lists.01.org
Subject: Re: [direct] 187372a3b9: WARNING: CPU: 2 PID: 3999 at fs/ext4/inode.c:3315 ext4_direct_IO+0x56d/0x5b0()
Date: Wed, 17 Feb 2016 18:57:25 -0800
Message-ID: <20160218025725.GG6338@birch.djwong.org>
In-Reply-To: <20160218003929.GT14668@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============1454006829412012898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2016 at 11:39:29AM +1100, Dave Chinner wrote:
> On Tue, Feb 16, 2016 at 08:38:10AM +0800, kernel test robot wrote:
> > FYI, we noticed the below changes on
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> > commit 187372a3b9faff68ed61c291d0135e6739e0dbdf ("direct-io: always cal=
l ->end_io if non-NULL")
> > =

> > =

> > run fstests generic/299 at 2016-02-16 06:10:03
> > EXT4-fs (sda8): mounted filesystem with ordered data mode. Opts: acl,us=
er_xattr
> > ------------[ cut here ]------------
> > WARNING: CPU: 2 PID: 3999 at fs/ext4/inode.c:3315 ext4_direct_IO+0x56d/=
0x5b0()
> .....
> >  [<ffffffff81422e52>] dump_stack+0x4b/0x69
> >  [<ffffffff8107a476>] warn_slowpath_common+0x86/0xc0
> >  [<ffffffff8107a56a>] warn_slowpath_null+0x1a/0x20
> >  [<ffffffff81282a2d>] ext4_direct_IO+0x56d/0x5b0
> >  [<ffffffff811719ea>] generic_file_direct_write+0xaa/0x170
> >  [<ffffffff81171b70>] __generic_file_write_iter+0xc0/0x1f0
> >  [<ffffffff8127d201>] ext4_file_write_iter+0x141/0x430
> >  [<ffffffff81242436>] aio_run_iocb+0x226/0x290
> >  [<ffffffff8124353d>] do_io_submit+0x29d/0x530
> >  [<ffffffff812437e0>] SyS_io_submit+0x10/0x20
> >  [<ffffffff818e012e>] entry_SYSCALL_64_fastpath+0x12/0x71
> =

> 3309                 /*
> 3310                  * When no IO was submitted ext4_end_io_dio() was not
> 3311                  * called so we have to put iocb's reference.
> 3312                  */
> 3313                 if (ret <=3D 0 && ret !=3D -EIOCBQUEUED && iocb->pri=
vate) {
> 3314                         WARN_ON(iocb->private !=3D io_end);
> 3315  >>>>>>>>               WARN_ON(io_end->flag & EXT4_IO_END_UNWRITTEN=
);
> 3316                         ext4_put_io_end(io_end);
> 3317                         iocb->private =3D NULL;
> 3318                 }
> =

> Pre-existing ext4 issue. It assumes that unwritten extent conversion
> occurs even on IO submission error. i.e. when we avoid the stale
> data exposure bug that the bisect-blamed commit fixed, ext4 warns
> that it failed to expose stale data....
> =

> I'd just remove that warning, but I have no idea how that impacts on
> the rest of ext4's end IO handling. Christoph, Ted, the ball is in
> your court for this one.

Oh, heh, guess it's time to send my fixpatch for that one. :)

--D

> =

> Cheers,
> =

> Dave.
> -- =

> Dave Chinner
> david(a)fromorbit.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ext4" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--===============1454006829412012898==--

