Content-Type: multipart/mixed; boundary="===============5458338656836538987=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/readahead] a0b99df1aa: xfstests.xfs.421.fail
Date: Mon, 21 Feb 2022 21:10:20 +0000
Message-ID: <YhP/vPUcm4lUHzrg@casper.infradead.org>
In-Reply-To: <20220221205529.GH59715@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============5458338656836538987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 07:55:29AM +1100, Dave Chinner wrote:
> On Mon, Feb 21, 2022 at 01:56:55PM +0000, Matthew Wilcox wrote:
> > On Mon, Feb 21, 2022 at 04:02:18PM +0800, kernel test robot wrote:
> > > commit: a0b99df1aa37d714eb80be5fb54efd56c88a3336 ("mm/readahead: Add =
large folio readahead")
> > =

> > > xfs/420	- output mismatch (see /lkp/benchmarks/xfstests/results//xfs/=
420.out.bad)
> > >     --- tests/xfs/420.out	2022-02-17 11:55:00.000000000 +0000
> > >     +++ /lkp/benchmarks/xfstests/results//xfs/420.out.bad	2022-02-20 =
20:34:22.430378506 +0000
> > >     @@ -13,9 +13,7 @@
> > >      Seek holes and data in file2
> > >      Whence	Result
> > >      DATA	0
> > >     -HOLE	131072
> > >     -DATA	196608
> > >     -HOLE	262144
> > >     +HOLE	524288
> > =

> > Confirm this test now fails.  I don't think it's actually a bug,
> > though.  I think the test is now using larger pages to cache the
> > file, and it fails to report that there's a hole in the file.
> > Maybe there actually isn't a hole in the file any more; using
> > larger pages to cache the file means we'll now write more data
> > than we used to.
> > =

> > Adding XFS people for their thoughts.
> > =

> > Complete output:
> > =

> > $ diff -u ../ktest/tests/xfstests/tests/xfs/420.out ktest-out/xfstests/=
xfs/420.out.bad
> > --- ../ktest/tests/xfstests/tests/xfs/420.out	2021-07-05 15:49:45.53988=
7305 -0400
> > +++ ktest-out/xfstests/xfs/420.out.bad	2022-02-21 08:14:40.000000000 -0=
500
> > @@ -13,9 +13,7 @@
> >  Seek holes and data in file2
> >  Whence	Result
> >  DATA	0
> > -HOLE	131072
> > -DATA	196608
> > -HOLE	262144
> > +HOLE	524288
> >  Compare files
> >  c2803804acc9936eef8aab42c119bfac  SCRATCH_MNT/test-420/file1
> >  017c08a9320aad844ce86aa9631afb98  SCRATCH_MNT/test-420/file2
> > @@ -28,9 +26,7 @@
> >  Seek holes and data in file2
> >  Whence	Result
> >  DATA	0
> > -HOLE	131072
> > -DATA	196608
> > -HOLE	262144
> > +HOLE	524288
> >  Compare files
> >  c2803804acc9936eef8aab42c119bfac  SCRATCH_MNT/test-420/file1
> >  017c08a9320aad844ce86aa9631afb98  SCRATCH_MNT/test-420/file2
> > =

> > So the file checksums are right, which means I didn't break the COW
> > functionality.  But we're no longer reporting a hole at 128k.
> =

> Can you post the contents of the 420.full output file so we can see
> what the output of the various commands that are run are? e.g.
> things like cowextsize that is configured, etc?

Sure!  It's short, so I've included it inline.


meta-data=3D/dev/sdc               isize=3D512    agcount=3D4, agsize=3D367=
0016 blks
         =3D                       sectsz=3D512   attr=3D2, projid32bit=3D1
         =3D                       crc=3D1        finobt=3D1, sparse=3D1, r=
mapbt=3D1
         =3D                       reflink=3D1    bigtime=3D0
data     =3D                       bsize=3D1024   blocks=3D14680064, imaxpc=
t=3D25
         =3D                       sunit=3D0      swidth=3D0 blks
naming   =3Dversion 2              bsize=3D4096   ascii-ci=3D0, ftype=3D1
log      =3Dinternal log           bsize=3D1024   blocks=3D10240, version=
=3D2
         =3D                       sectsz=3D512   sunit=3D0 blks, lazy-coun=
t=3D1
realtime =3Dnone                   extsz=3D4096   blocks=3D0, rtextents=3D0
Discarding blocks...Done.
[0] /mnt/scratch/test-420
[524288] /mnt/scratch/test-420
wrote 131072/131072 bytes at offset 0
128 KiB, 128 ops; 0.0000 sec (1.327 GiB/sec and 1391304.3478 ops/sec)
wrote 524288/524288 bytes at offset 0
512 KiB, 512 ops; 0.0003 sec (1.341 GiB/sec and 1406593.4066 ops/sec)
wrote 131072/131072 bytes at offset 0
128 KiB, 128 ops; 0.0000 sec (1.822 GiB/sec and 1910447.7612 ops/sec)
CoW the shared part then write into the empty part
[524288] /mnt/scratch/test-420/file1
[524288] /mnt/scratch/test-420/file2
wrote 65536/65536 bytes at offset 0
64 KiB, 64 ops; 0.0001 sec (416.667 MiB/sec and 426666.6667 ops/sec)
wrote 65536/65536 bytes at offset 196608
64 KiB, 64 ops; 0.0000 sec (1.695 GiB/sec and 1777777.7778 ops/sec)
wrote 65536/65536 bytes at offset 0
64 KiB, 64 ops; 0.0000 sec (1.387 GiB/sec and 1454545.4545 ops/sec)
wrote 65536/65536 bytes at offset 196608
64 KiB, 64 ops; 0.0000 sec (1.526 GiB/sec and 1600000.0000 ops/sec)
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
1"]: Invalid argument
/mnt/scratch/test-420/file1:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..255]:        128..383          0 (128..383)         256 100000
   1: [256..1023]:     hole                                   768
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
2"]: Invalid argument
/mnt/scratch/test-420/file2:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..255]:        128..383          0 (128..383)         256 100000
   1: [256..1023]:     hole                                   768
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
3"]: Invalid argument
/mnt/scratch/test-420/file3:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..1023]:       512..1535         0 (512..1535)       1024
sync filesystem
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
1"]: Invalid argument
/mnt/scratch/test-420/file1:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..127]:        128..255          0 (128..255)         128
   1: [128..255]:      256..383          0 (256..383)         128 100000
   2: [256..1023]:     hole                                   768
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
2"]: Invalid argument
/mnt/scratch/test-420/file2:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..127]:        1536..1663        0 (1536..1663)       128
   1: [128..255]:      256..383          0 (256..383)         128 100000
   2: [256..383]:      hole                                   128
   3: [384..511]:      1920..2047        0 (1920..2047)       128
   4: [512..1023]:     hole                                   512
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
3"]: Invalid argument
/mnt/scratch/test-420/file3:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..1023]:       512..1535         0 (512..1535)       1024
Remount
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
1"]: Invalid argument
/mnt/scratch/test-420/file1:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..127]:        128..255          0 (128..255)         128
   1: [128..255]:      256..383          0 (256..383)         128 100000
   2: [256..1023]:     hole                                   768
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
2"]: Invalid argument
/mnt/scratch/test-420/file2:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..127]:        1536..1663        0 (1536..1663)       128
   1: [128..255]:      256..383          0 (256..383)         128 100000
   2: [256..383]:      hole                                   128
   3: [384..511]:      1920..2047        0 (1920..2047)       128
   4: [512..1023]:     hole                                   512
xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/file=
3"]: Invalid argument
/mnt/scratch/test-420/file3:
 EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
   0: [0..1023]:       512..1535         0 (512..1535)       1024
--===============5458338656836538987==--

