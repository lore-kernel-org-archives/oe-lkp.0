Content-Type: multipart/mixed; boundary="===============8329504714537751145=="
MIME-Version: 1.0
From: Darrick J. Wong <djwong@kernel.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 1fc3f2c3c9: xfstests.xfs.529.fail
Date: Wed, 23 Mar 2022 22:31:47 -0700
Message-ID: <20220324053147.GR8224@magnolia>
In-Reply-To: <20220323070834.GB16885@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8329504714537751145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[add chandan to cc since he wrote the extent count checking patches]

On Wed, Mar 23, 2022 at 03:08:34PM +0800, Oliver Sang wrote:
> hi, Darrick,
> =

> On Tue, Mar 22, 2022 at 09:27:33AM -0700, Darrick J. Wong wrote:
> > On Tue, Mar 22, 2022 at 09:54:02PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-9):
> > > =

> > > commit: 1fc3f2c3c928c88654d4716af5cc4dee07b3a1c4 ("xfs: only free pos=
teof blocks on first close")
> > > https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git vec=
torized-scrub
> > > =

> > > in testcase: xfstests
> > > version: xfstests-x86_64-1de1db8-1_20220217
> > > with following parameters:
> > > =

> > > 	disk: 4HDD
> > > 	fs: xfs
> > > 	test: xfs-group-52
> > > 	ucode: 0x21
> > > =

> > > test-description: xfstests is a regression test suite for xfs and oth=
er files ystems.
> > > test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> > > =

> > > =

> > > on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ =
3.30GHz with 8G memory
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > =

> > Could you export DIFF_LENGTH=3D0 in the test environment so that we get
> > the full diff here, please?
> =

> the full diff is as below (also attached dmesg, full log, log for 529 in =
case
> helpful):
> =

> xfs/529 [failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfs=
tests/results//xfs/529.out.bad)
>     --- tests/xfs/529.out       2022-02-17 11:55:00.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/529.out.bad       2022-03-2=
3 06:18:39.815036267 +0000
>     @@ -4,21 +4,4 @@
>      Inject reduce_max_iextents error tag
>      Create fragmented file
>      Verify $testfile's extent count
>     -Disable reduce_max_iextents error tag
>     -* Fallocate unwritten extents
>     -Inject reduce_max_iextents error tag
>     -Fallocate fragmented file
>     -Verify $testfile's extent count
>     -Disable reduce_max_iextents error tag
>     -* Directio write
>     -Inject reduce_max_iextents error tag
>     -Create fragmented file via directio writes
>     -Verify $testfile's extent count
>     -Disable reduce_max_iextents error tag
>     -* Extend quota inodes
>     -Consume free space
>     -Create fragmented filesystem
>     -Inject reduce_max_iextents error tag
>     -Inject bmap_alloc_minlen_extent error tag
>     -Extend uquota file
>     -Verify uquota inode's extent count
>     +Extent count overflow check failed: nextents =3D 15

Hey Chandan, could you take a look at this, please?

--D

> =

> =

> > =

> > --D
> > =



> 2022-03-23 06:18:24 export TEST_DIR=3D/fs/sdb1
> 2022-03-23 06:18:24 export TEST_DEV=3D/dev/sdb1
> 2022-03-23 06:18:24 export FSTYP=3Dxfs
> 2022-03-23 06:18:24 export SCRATCH_MNT=3D/fs/scratch
> 2022-03-23 06:18:24 mkdir /fs/scratch -p
> 2022-03-23 06:18:24 export SCRATCH_DEV=3D/dev/sdb4
> 2022-03-23 06:18:24 export SCRATCH_LOGDEV=3D/dev/sdb2
> 2022-03-23 06:18:24 export SCRATCH_XFS_LIST_METADATA_FIELDS=3Du3.sfdir3.h=
dr.parent.i4
> 2022-03-23 06:18:24 export SCRATCH_XFS_LIST_FUZZ_VERBS=3Drandom
> DIFF_LENGTH=3D
> 0
> END
> 2022-03-23 06:18:24 sed "s:^:xfs/:" //lkp/benchmarks/xfstests/tests/xfs-g=
roup-52
> 2022-03-23 06:18:24 ./check xfs/520 xfs/522 xfs/523 xfs/524 xfs/525 xfs/5=
26 xfs/527 xfs/529
> FSTYP         -- xfs (debug)
> PLATFORM      -- Linux/x86_64 lkp-ivb-d05 5.17.0-rc8-00340-g1fc3f2c3c928 =
#1 SMP Mon Mar 21 07:17:57 CST 2022
> MKFS_OPTIONS  -- -f /dev/sdb4
> MOUNT_OPTIONS -- /dev/sdb4 /fs/scratch
> =

> xfs/520	 3s
> xfs/522	[not run] need configuration file support in mkfs.xfs
> xfs/523	[not run] need configuration file support in mkfs.xfs
> xfs/524	[not run] need configuration file support in mkfs.xfs
> xfs/525	[not run] need configuration file support in mkfs.xfs
> xfs/526	[not run] need configuration file support in mkfs.xfs
> xfs/527	 2s
> xfs/529	[failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfs=
tests/results//xfs/529.out.bad)
>     --- tests/xfs/529.out	2022-02-17 11:55:00.000000000 +0000
>     +++ /lkp/benchmarks/xfstests/results//xfs/529.out.bad	2022-03-23 06:1=
8:39.815036267 +0000
>     @@ -4,21 +4,4 @@
>      Inject reduce_max_iextents error tag
>      Create fragmented file
>      Verify $testfile's extent count
>     -Disable reduce_max_iextents error tag
>     -* Fallocate unwritten extents
>     -Inject reduce_max_iextents error tag
>     -Fallocate fragmented file
>     -Verify $testfile's extent count
>     -Disable reduce_max_iextents error tag
>     -* Directio write
>     -Inject reduce_max_iextents error tag
>     -Create fragmented file via directio writes
>     -Verify $testfile's extent count
>     -Disable reduce_max_iextents error tag
>     -* Extend quota inodes
>     -Consume free space
>     -Create fragmented filesystem
>     -Inject reduce_max_iextents error tag
>     -Inject bmap_alloc_minlen_extent error tag
>     -Extend uquota file
>     -Verify uquota inode's extent count
>     +Extent count overflow check failed: nextents =3D 15
> Ran: xfs/520 xfs/522 xfs/523 xfs/524 xfs/525 xfs/526 xfs/527 xfs/529
> Not run: xfs/522 xfs/523 xfs/524 xfs/525 xfs/526
> Failures: xfs/529
> Failed 1 of 8 tests
> =


> meta-data=3D/dev/sdb4              isize=3D512    agcount=3D4, agsize=3D3=
2768 blks
>          =3D                       sectsz=3D4096  attr=3D2, projid32bit=
=3D1
>          =3D                       crc=3D1        finobt=3D1, sparse=3D1,=
 rmapbt=3D0
>          =3D                       reflink=3D0
> data     =3D                       bsize=3D4096   blocks=3D131072, imaxpc=
t=3D25
>          =3D                       sunit=3D0      swidth=3D0 blks
> naming   =3Dversion 2              bsize=3D4096   ascii-ci=3D0, ftype=3D1
> log      =3Dinternal log           bsize=3D4096   blocks=3D1605, version=
=3D2
>          =3D                       sectsz=3D4096  sunit=3D1 blks, lazy-co=
unt=3D1
> realtime =3Dnone                   extsz=3D4096   blocks=3D0, rtextents=
=3D0
> wrote 4096/4096 bytes at offset 0
> 4 KiB, 1 ops; 0.0185 sec (216.099 KiB/sec and 54.0249 ops/sec)
> wrote 4096/4096 bytes at offset 8192
> 4 KiB, 1 ops; 0.0157 sec (253.888 KiB/sec and 63.4719 ops/sec)
> wrote 4096/4096 bytes at offset 16384
> 4 KiB, 1 ops; 0.0158 sec (251.620 KiB/sec and 62.9050 ops/sec)
> wrote 4096/4096 bytes at offset 24576
> 4 KiB, 1 ops; 0.0160 sec (248.648 KiB/sec and 62.1620 ops/sec)
> wrote 4096/4096 bytes at offset 32768
> 4 KiB, 1 ops; 0.0160 sec (249.423 KiB/sec and 62.3558 ops/sec)
> wrote 4096/4096 bytes at offset 40960
> 4 KiB, 1 ops; 0.0158 sec (251.604 KiB/sec and 62.9010 ops/sec)
> wrote 4096/4096 bytes at offset 49152
> 4 KiB, 1 ops; 0.0161 sec (247.755 KiB/sec and 61.9387 ops/sec)
> wrote 4096/4096 bytes at offset 57344
> 4 KiB, 1 ops; 0.0159 sec (250.878 KiB/sec and 62.7195 ops/sec)
> pwrite: File too large
> pwrite: File too large
> pwrite: File too large
> pwrite: File too large
> pwrite: File too large
> pwrite: File too large
> pwrite: File too large

> QA output created by 529
> Format and mount fs
> * Delalloc to written extent conversion
> Inject reduce_max_iextents error tag
> Create fragmented file
> Verify $testfile's extent count
> Extent count overflow check failed: nextents =3D 15

--===============8329504714537751145==--

