Content-Type: multipart/mixed; boundary="===============0712046615800600117=="
MIME-Version: 1.0
From: Luis Henriques <lhenriques@suse.de>
To: lkp@lists.01.org
Subject: Re: [vfs] 94a4dd06a6: xfstests.generic.263.fail
Date: Wed, 30 Jun 2021 17:06:27 +0100
Message-ID: <YNyWgxlX4xoQ8itu@suse.de>
In-Reply-To: <CAOQ4uxgde72YDADffihj1P-Kse_P6zkhrjBb1DhwVUC+yRJooQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0712046615800600117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2021 at 06:46:22PM +0300, Amir Goldstein wrote:
> On Fri, May 14, 2021 at 2:03 PM Luis Henriques <lhenriques@suse.de> wro=
te:
> >
> > kernel test robot <oliver.sang@intel.com> writes:
> >
> > > Greeting,
> > >
> > > FYI, we noticed the following commit (built with gcc-9):
> > >
> > > commit: 94a4dd06a6bbf3978b0bb1dddc2d8ec4e5bcad26 ("[PATCH v9] vfs: fi=
x copy_file_range regression in cross-fs copies")
> > > url: https://github.com/0day-ci/linux/commits/Luis-Henriques/vfs-fix-=
copy_file_range-regression-in-cross-fs-copies/20210510-170804
> > > base: https://git.kernel.org/cgit/linux/kernel/git/viro/vfs.git for-n=
ext
> > >
> > > in testcase: xfstests
> > > version: xfstests-x86_64-73c0871-1_20210401
> > > with following parameters:
> > >
> > >       disk: 4HDD
> > >       fs: xfs
> > >       test: generic-group-13
> > >       ucode: 0x21
> > >
> > > test-description: xfstests is a regression test suite for xfs and oth=
er files ystems.
> > > test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> > >
> > >
> > > on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ =
3.30GHz with 8G memory
> > >
> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > >
> > >
> > >
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > >
> > > 2021-05-11 11:28:23 export TEST_DIR=3D/fs/sda1
> > > 2021-05-11 11:28:23 export TEST_DEV=3D/dev/sda1
> > > 2021-05-11 11:28:23 export FSTYP=3Dxfs
> > > 2021-05-11 11:28:23 export SCRATCH_MNT=3D/fs/scratch
> > > 2021-05-11 11:28:23 mkdir /fs/scratch -p
> > > 2021-05-11 11:28:23 export SCRATCH_DEV=3D/dev/sda4
> > > 2021-05-11 11:28:23 export SCRATCH_LOGDEV=3D/dev/sda2
> > > 2021-05-11 11:28:23 sed "s:^:generic/:" //lkp/benchmarks/xfstests/tes=
ts/generic-group-13
> > > 2021-05-11 11:28:23 ./check generic/260 generic/261 generic/262 gener=
ic/263 generic/264 generic/265 generic/266 generic/267 generic/268 generic/=
269 generic/270 generic/271 generic/272 generic/273 generic/274 generic/275=
 generic/276 generic/277 generic/278 generic/279
> > > FSTYP         -- xfs (debug)
> > > PLATFORM      -- Linux/x86_64 lkp-ivb-d02 5.12.0-rc6-00061-g94a4dd06a=
6bb #1 SMP Tue May 11 00:58:17 CST 2021
> > > MKFS_OPTIONS  -- -f -bsize=3D4096 /dev/sda4
> > > MOUNT_OPTIONS -- /dev/sda4 /fs/scratch
> > >
> > > generic/260   [not run] FITRIM not supported on /fs/scratch
> > > generic/261   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/262   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/263   [failed, exit status 1]- output mismatch (see /lkp/benc=
hmarks/xfstests/results//generic/263.out.bad)
> > >     --- tests/generic/263.out 2021-04-01 03:07:08.000000000 +0000
> > >     +++ /lkp/benchmarks/xfstests/results//generic/263.out.bad 2021-05=
-11 11:28:29.773460096 +0000
> > >     @@ -1,3 +1,32 @@
> > >      QA output created by 263
> > >      fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
> > >     -fsx -N 10000 -o 128000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
> > >     +Seed set to 1
> > >     +main: filesystem does not support clone range, disabling!
> > >     +main: filesystem does not support dedupe range, disabling!
> > >     +skipping zero size read
> > >     ...
> > >     (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/263.out /lkp=
/benchmarks/xfstests/results//generic/263.out.bad'  to see the entire diff)
> > > generic/264   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/265   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/266   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/267   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/268   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/269    48s
> > > generic/270    61s
> > > generic/271   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/272   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/273    17s
> > > generic/274    14s
> > > generic/275    11s
> > > generic/276   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/277    3s
> > > generic/278   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > generic/279   [not run] Reflink not supported by scratch filesystem t=
ype: xfs
> > > Ran: generic/260 generic/261 generic/262 generic/263 generic/264 gene=
ric/265 generic/266 generic/267 generic/268 generic/269 generic/270 generic=
/271 generic/272 generic/273 generic/274 generic/275 generic/276 generic/27=
7 generic/278 generic/279
> > > Not run: generic/260 generic/261 generic/262 generic/264 generic/265 =
generic/266 generic/267 generic/268 generic/271 generic/272 generic/276 gen=
eric/278 generic/279
> > > Failures: generic/263
> > > Failed 1 of 20 tests
> >
> > OK, I see what's going on.  There are 2 issues: one with patch and anot=
her
> > one with the test itself.
> >
> > The CFR syscall should have been disabled in this test but it isn't
> > because the test tries to copy 1 byte from a zero-sized file:
> >
> > int
> > test_copy_range(void)
> > {
> >         loff_t o1 =3D 0, o2 =3D 1;
> >
> >         if (syscall(__NR_copy_file_range, fd, &o1, fd, &o2, 1, 0) =3D=
=3D -1 &&
> >             (errno =3D=3D ENOSYS || errno =3D=3D EOPNOTSUPP || errno =
=3D=3D ENOTTY)) {
> >                 if (!quiet)
> >                         fprintf(stderr,
> >                                 "main: filesystem does not support "
> >                                 "copy range, disabling!\n");
> >                 return 0;
> >         }
> >
> >         return 1;
> > }
> >
> > The syscall is doing an early '0' return because the file size is < len.
> >
> > Fixing the kernel should probably be as easy as removing the
> > short-circuiting check in vfs_copy_file_range():
> >
> >         if (len =3D=3D 0)
> >                 return 0;
> >
> > This will force the filesystems code to handle '0' size copies but will
> > also make sure -EOPNOTSUPP is returned in this case.
> >
> =

> Sorry for the late reply.
> The solution above is correct.
> That is aligned with the behavior of vfs_clone_file_range().
> Need to call into the filesystem method also with 0 length
> in order to learn about CFR support of this filesystem instance.

Yep, this makes sense (I've seen you're detailed explanation in the other
thread -- thanks!).  I'll send out v11 in a sec.

Cheers,
--
Lu=C3=ADs

> > Alternatively, we could have something like:
> >
> >         if (len =3D=3D 0) {
> >                 if (file_out->f_op->copy_file_range)
> >                         return 0;
> >                 else
> >                         return -EOPNOTSUPP;
> >         }
> >
> =

> This does not catch the case of a filesystem driver that has
> CFR method but a filesystem instance does not support CFR.
> For example, overlayfs with ext4 as upper fs.
> =

> > What do you guys think is the right thing to do?
> >
> > Additionally, the test should also be fixed with something as the patch
> > bellow.  By making sure we have 1 byte to copy we also ensure the sysca=
ll
> > will return -EOPNOTSUPP, even with the current version of the patch.
> >
> =

> I don't think that the test should be fixed.
> =

> Thanks,
> Amir.
> =

> > Cheers,
> > --
> > Luis
> >
> > diff --git a/ltp/fsx.c b/ltp/fsx.c
> > index cd0bae55aeb8..97db594ae142 100644
> > --- a/ltp/fsx.c
> > +++ b/ltp/fsx.c
> > @@ -1596,6 +1596,10 @@ int
> >  test_copy_range(void)
> >  {
> >         loff_t o1 =3D 0, o2 =3D 1;
> > +       int ret =3D 1;
> > +
> > +       /* Make sure we have 1 byte to copy */
> > +       ftruncate(fd, 1);
> >
> >         if (syscall(__NR_copy_file_range, fd, &o1, fd, &o2, 1, 0) =3D=
=3D -1 &&
> >             (errno =3D=3D ENOSYS || errno =3D=3D EOPNOTSUPP || errno =
=3D=3D ENOTTY)) {
> > @@ -1603,10 +1607,13 @@ test_copy_range(void)
> >                         fprintf(stderr,
> >                                 "main: filesystem does not support "
> >                                 "copy range, disabling!\n");
> > -               return 0;
> > +               ret =3D 0;
> >         }
> >
> > -       return 1;
> > +       /* Restore file size */
> > +       ftruncate(fd, 0);
> > +
> > +       return ret;
> >  }
> >
> >  void
--===============0712046615800600117==--

