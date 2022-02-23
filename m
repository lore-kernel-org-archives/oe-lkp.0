Content-Type: multipart/mixed; boundary="===============1694198660437188218=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/readahead] a0b99df1aa: xfstests.xfs.421.fail
Date: Wed, 23 Feb 2022 19:59:39 +0000
Message-ID: <YhaSK5C9rGVD+7OQ@casper.infradead.org>
In-Reply-To: <20220221214355.GI59715@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============1694198660437188218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 08:43:55AM +1100, Dave Chinner wrote:
> On Mon, Feb 21, 2022 at 09:10:20PM +0000, Matthew Wilcox wrote:
> > On Tue, Feb 22, 2022 at 07:55:29AM +1100, Dave Chinner wrote:
> > > On Mon, Feb 21, 2022 at 01:56:55PM +0000, Matthew Wilcox wrote:
> > > > On Mon, Feb 21, 2022 at 04:02:18PM +0800, kernel test robot wrote:
> > > > > commit: a0b99df1aa37d714eb80be5fb54efd56c88a3336 ("mm/readahead: =
Add large folio readahead")
> > > > =

> > > > > xfs/420	- output mismatch (see /lkp/benchmarks/xfstests/results//=
xfs/420.out.bad)
> > > > >     --- tests/xfs/420.out	2022-02-17 11:55:00.000000000 +0000
> > > > >     +++ /lkp/benchmarks/xfstests/results//xfs/420.out.bad	2022-02=
-20 20:34:22.430378506 +0000
> > > > >     @@ -13,9 +13,7 @@
> > > > >      Seek holes and data in file2
> > > > >      Whence	Result
> > > > >      DATA	0
> > > > >     -HOLE	131072
> > > > >     -DATA	196608
> > > > >     -HOLE	262144
> > > > >     +HOLE	524288
> > > > =

> > > > Confirm this test now fails.  I don't think it's actually a bug,
> > > > though.  I think the test is now using larger pages to cache the
> > > > file, and it fails to report that there's a hole in the file.
> > > > Maybe there actually isn't a hole in the file any more; using
> > > > larger pages to cache the file means we'll now write more data
> > > > than we used to.
> > > > =

> > > > Adding XFS people for their thoughts.
> > > > =

> > > > Complete output:
> > > > =

> > > > $ diff -u ../ktest/tests/xfstests/tests/xfs/420.out ktest-out/xfste=
sts/xfs/420.out.bad
> > > > --- ../ktest/tests/xfstests/tests/xfs/420.out	2021-07-05 15:49:45.5=
39887305 -0400
> > > > +++ ktest-out/xfstests/xfs/420.out.bad	2022-02-21 08:14:40.00000000=
0 -0500
> > > > @@ -13,9 +13,7 @@
> > > >  Seek holes and data in file2
> > > >  Whence	Result
> > > >  DATA	0
> > > > -HOLE	131072
> > > > -DATA	196608
> > > > -HOLE	262144
> > > > +HOLE	524288
> > > >  Compare files
> > > >  c2803804acc9936eef8aab42c119bfac  SCRATCH_MNT/test-420/file1
> > > >  017c08a9320aad844ce86aa9631afb98  SCRATCH_MNT/test-420/file2
> > > > @@ -28,9 +26,7 @@
> > > >  Seek holes and data in file2
> > > >  Whence	Result
> > > >  DATA	0
> > > > -HOLE	131072
> > > > -DATA	196608
> > > > -HOLE	262144
> > > > +HOLE	524288
> > > >  Compare files
> > > >  c2803804acc9936eef8aab42c119bfac  SCRATCH_MNT/test-420/file1
> > > >  017c08a9320aad844ce86aa9631afb98  SCRATCH_MNT/test-420/file2
> > > > =

> > > > So the file checksums are right, which means I didn't break the COW
> > > > functionality.  But we're no longer reporting a hole at 128k.
> > > =

> > > Can you post the contents of the 420.full output file so we can see
> > > what the output of the various commands that are run are? e.g.
> > > things like cowextsize that is configured, etc?
> > =

> > Sure!  It's short, so I've included it inline.
> =

> Ok, I'll cut this up so it makes sense...
> =

> > =

> > =

> > meta-data=3D/dev/sdc               isize=3D512    agcount=3D4, agsize=
=3D3670016 blks
> >          =3D                       sectsz=3D512   attr=3D2, projid32bit=
=3D1
> >          =3D                       crc=3D1        finobt=3D1, sparse=3D=
1, rmapbt=3D1
> >          =3D                       reflink=3D1    bigtime=3D0
> > data     =3D                       bsize=3D1024   blocks=3D14680064, im=
axpct=3D25
> >          =3D                       sunit=3D0      swidth=3D0 blks
> > naming   =3Dversion 2              bsize=3D4096   ascii-ci=3D0, ftype=
=3D1
> > log      =3Dinternal log           bsize=3D1024   blocks=3D10240, versi=
on=3D2
> >          =3D                       sectsz=3D512   sunit=3D0 blks, lazy-=
count=3D1
> > realtime =3Dnone                   extsz=3D4096   blocks=3D0, rtextents=
=3D0
> > Discarding blocks...Done.
> > [0] /mnt/scratch/test-420
> > [524288] /mnt/scratch/test-420
> > wrote 131072/131072 bytes at offset 0
> > 128 KiB, 128 ops; 0.0000 sec (1.327 GiB/sec and 1391304.3478 ops/sec)
> > wrote 524288/524288 bytes at offset 0
> > 512 KiB, 512 ops; 0.0003 sec (1.341 GiB/sec and 1406593.4066 ops/sec)
> > wrote 131072/131072 bytes at offset 0
> > 128 KiB, 128 ops; 0.0000 sec (1.822 GiB/sec and 1910447.7612 ops/sec)
> > CoW the shared part then write into the empty part
> > [524288] /mnt/scratch/test-420/file1
> > [524288] /mnt/scratch/test-420/file2
> > wrote 65536/65536 bytes at offset 0
> > 64 KiB, 64 ops; 0.0001 sec (416.667 MiB/sec and 426666.6667 ops/sec)
> > wrote 65536/65536 bytes at offset 196608
> > 64 KiB, 64 ops; 0.0000 sec (1.695 GiB/sec and 1777777.7778 ops/sec)
> > wrote 65536/65536 bytes at offset 0
> > 64 KiB, 64 ops; 0.0000 sec (1.387 GiB/sec and 1454545.4545 ops/sec)
> > wrote 65536/65536 bytes at offset 196608
> > 64 KiB, 64 ops; 0.0000 sec (1.526 GiB/sec and 1600000.0000 ops/sec)
> > xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/=
file1"]: Invalid argument
> > /mnt/scratch/test-420/file1:
> >  EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
> >    0: [0..255]:        128..383          0 (128..383)         256 100000
> >    1: [256..1023]:     hole                                   768
> > xfs_io: xfsctl(XFS_IOC_GETBMAPX) iflags=3D0x28 ["/mnt/scratch/test-420/=
file2"]: Invalid argument
> > /mnt/scratch/test-420/file2:
> >  EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
> >    0: [0..255]:        128..383          0 (128..383)         256 100000
> >    1: [256..1023]:     hole                                   768
> =

> So this is the extent list for file2 after the reflink. Note the
> hole at 128-512kB. The flags tell us the 128kB data extent is
> shared. There are no unwritten extents at all.

My debugging indicates otherwise:

+++ b/fs/iomap/seek.c
@@ -15,6 +15,7 @@ static loff_t iomap_seek_hole_iter(const struct iomap_ite=
r *it
er,
 {
        loff_t length =3D iomap_length(iter);

+printk("%s %ld %d:%lld,%lld\n", __func__, iter->inode->i_ino, iter->iomap.=
type, iter->iomap.length);
        switch (iter->iomap.type) {
        case IOMAP_UNWRITTEN:
                *hole_pos =3D mapping_seek_hole_data(iter->inode->i_mapping,
@@ -61,6 +62,7 @@ static loff_t iomap_seek_data_iter(const struct iomap_ite=
r *iter,
 {
        loff_t length =3D iomap_length(iter);

+printk("%s %ld %d:%lld,%lld\n", __func__, iter->inode->i_ino, iter->iomap.=
type, iter->iomap.length);
        switch (iter->iomap.type) {
        case IOMAP_HOLE:
                return length;

gives me output:

00016 iomap_seek_hole_iter 68 2:131072,-131387284454392
00016 iomap_seek_hole_iter 68 0:393216,-131387284454392
00016 iomap_seek_data_iter 68 2:131072,-131387284454392
00016 iomap_seek_hole_iter 68 2:131072,-131387284454392
00016 iomap_seek_hole_iter 68 0:393216,-131387284454392
00016 iomap_seek_data_iter 68 0:393216,-131387284454392
00016 iomap_seek_hole_iter 69 2:131072,-131387284455352
00016 iomap_seek_hole_iter 69 3:393216,4503599627239424
00016 iomap_seek_data_iter 69 2:131072,-131387284455352
00016 iomap_seek_hole_iter 69 2:131072,-131387284455352
00016 iomap_seek_hole_iter 69 3:393216,4503599627239424

This is after the first call to drop_caches, so in userspace, we're
doing:
echo 1 > /proc/sys/vm/drop_caches

echo "CoW the shared part then write into the empty part" | tee -a $seqres.=
full
$XFS_IO_PROG -c "cowextsize" $testdir/file1 >> $seqres.full
grep 'order=3D[^0]' /sys/kernel/debug/tracing/trace
$XFS_IO_PROG -c "cowextsize" $testdir/file2 >> $seqres.full
grep 'order=3D[^0]' /sys/kernel/debug/tracing/trace
$XFS_IO_PROG -c "pwrite -S 0x63 0 $blksz" $testdir/file2 >> $seqres.full
grep 'order=3D[^0]' /sys/kernel/debug/tracing/trace
$XFS_IO_PROG -c "pwrite -S 0x63 $((blksz * 3)) $blksz" $testdir/file2 >> $s=
eqres.full
grep 'order=3D[^0]' /sys/kernel/debug/tracing/trace

The calls to grep were added by me, and should show any order>0 pages
added to the page cache.  There are none, which seems like it would
exonerate large folios.  Of course, it must be this commit, so there
must be large pages.

Debugging continues ...
--===============1694198660437188218==--

