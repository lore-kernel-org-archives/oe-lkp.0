Content-Type: multipart/mixed; boundary="===============1574749818884500739=="
MIME-Version: 1.0
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@lists.01.org
Subject: Re: [xfs] db962cd266: Assertion_failed
Date: Mon, 04 Jan 2021 18:42:41 +0800
Message-ID: <CALOAHbDTCm4XdCJdeN7bP6ChA=8EZi50x2hSA4eSWG-nSSKDsA@mail.gmail.com>
In-Reply-To: <20210101215353.GB331610@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============1574749818884500739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 2, 2021 at 5:53 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Fri, Jan 01, 2021 at 05:10:49PM +0800, Yafang Shao wrote:
> > On Thu, Dec 31, 2020 at 10:46 AM kernel test robot
> > <oliver.sang@intel.com> wrote:
> .....
> > > [  552.905799] XFS: Assertion failed: !current->journal_info, file: f=
s/xfs/xfs_trans.h, line: 280
> > > [  553.104459]  xfs_trans_reserve+0x225/0x320 [xfs]
> > > [  553.110556]  xfs_trans_roll+0x6e/0xe0 [xfs]
> > > [  553.116134]  xfs_defer_trans_roll+0x104/0x2a0 [xfs]
> > > [  553.122489]  ? xfs_extent_free_create_intent+0x62/0xc0 [xfs]
> > > [  553.129780]  xfs_defer_finish_noroll+0xb8/0x620 [xfs]
> > > [  553.136299]  xfs_defer_finish+0x11/0xa0 [xfs]
> > > [  553.142017]  xfs_itruncate_extents_flags+0x141/0x440 [xfs]
> > > [  553.149053]  xfs_setattr_size+0x3da/0x480 [xfs]
> > > [  553.154939]  ? setattr_prepare+0x6a/0x1e0
> > > [  553.160250]  xfs_vn_setattr+0x70/0x120 [xfs]
> > > [  553.165833]  notify_change+0x364/0x500
> > > [  553.170820]  ? do_truncate+0x76/0xe0
> > > [  553.175673]  do_truncate+0x76/0xe0
> > > [  553.180184]  path_openat+0xe6c/0x10a0
> > > [  553.184981]  do_filp_open+0x91/0x100
> > > [  553.189707]  ? __check_object_size+0x136/0x160
> > > [  553.195493]  do_sys_openat2+0x20d/0x2e0
> > > [  553.200481]  do_sys_open+0x44/0x80
> > > [  553.204926]  do_syscall_64+0x33/0x40
> > > [  553.209588]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >
> > Thanks for the report.
> >
> > At a first glance, it seems we should make a similar change as we did
> > in xfs_trans_context_clear().
> >
> > static inline void
> > xfs_trans_context_set(struct xfs_trans *tp)
> > {
> >     /*
> >      * We have already handed over the context via xfs_trans_context_sw=
ap().
> >      */
> >     if (current->journal_info)
> >         return;
> >     current->journal_info =3D tp;
> >     tp->t_pflags =3D memalloc_nofs_save();
> > }
>
> Ah, no.
>
> Remember how I said "split out the wrapping of transaction
> context setup in xfs_trans_reserve() from
> the lifting of the context setting into xfs_trans_alloc()"?
>
> Well, you did the former and dropped the latter out of the patch
> set.
>

I misunderstood what you mean.

> Now when a transaction rolls after xfs_trans_context_swap(), it
> calls xfs_trans_reserve() and tries to do transaction context setup
> work inside a transaction context that already exists.  IOWs, you
> need to put the patch that lifts of the context setting up into
> xfs_trans_alloc() back into the patchset before adding the
> current->journal functionality patch.
>

Sure.

> Also, you need to test XFS code with CONFIG_XFS_DEBUG=3Dy so that
> asserts are actually built into the code and exercised, because this
> ASSERT should have fired on the first rolling transaction that the
> kernel executes...
>

I really forgot to enable CONFIG_XFS_DEBUG...   -_-b


-- =

Thanks
Yafang
--===============1574749818884500739==--

