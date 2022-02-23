Content-Type: multipart/mixed; boundary="===============0308112108590927300=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/readahead] a0b99df1aa: xfstests.xfs.421.fail
Date: Wed, 23 Feb 2022 20:19:26 +0000
Message-ID: <YhaWzsnreHHbJcmp@casper.infradead.org>
In-Reply-To: <YhaSK5C9rGVD+7OQ@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0308112108590927300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 07:59:39PM +0000, Matthew Wilcox wrote:
> > > /mnt/scratch/test-420/file2:
> > >  EXT: FILE-OFFSET      BLOCK-RANGE      AG AG-OFFSET        TOTAL
> > >    0: [0..255]:        128..383          0 (128..383)         256 100=
000
> > >    1: [256..1023]:     hole                                   768
> > =

> > So this is the extent list for file2 after the reflink. Note the
> > hole at 128-512kB. The flags tell us the 128kB data extent is
> > shared. There are no unwritten extents at all.
> =

> My debugging indicates otherwise:
> =

> +++ b/fs/iomap/seek.c
> @@ -15,6 +15,7 @@ static loff_t iomap_seek_hole_iter(const struct iomap_i=
ter *it
> er,
>  {
>         loff_t length =3D iomap_length(iter);
> =

> +printk("%s %ld %d:%lld,%lld\n", __func__, iter->inode->i_ino, iter->ioma=
p.type, iter->iomap.length);
>         switch (iter->iomap.type) {
>         case IOMAP_UNWRITTEN:
>                 *hole_pos =3D mapping_seek_hole_data(iter->inode->i_mappi=
ng,
> @@ -61,6 +62,7 @@ static loff_t iomap_seek_data_iter(const struct iomap_i=
ter *iter,
>  {
>         loff_t length =3D iomap_length(iter);
> =

> +printk("%s %ld %d:%lld,%lld\n", __func__, iter->inode->i_ino, iter->ioma=
p.type, iter->iomap.length);
>         switch (iter->iomap.type) {
>         case IOMAP_HOLE:
>                 return length;
> =

> gives me output:
> =

> 00016 iomap_seek_hole_iter 68 2:131072,-131387284454392
> 00016 iomap_seek_hole_iter 68 0:393216,-131387284454392
> 00016 iomap_seek_data_iter 68 2:131072,-131387284454392
> 00016 iomap_seek_hole_iter 68 2:131072,-131387284454392
> 00016 iomap_seek_hole_iter 68 0:393216,-131387284454392
> 00016 iomap_seek_data_iter 68 0:393216,-131387284454392
> 00016 iomap_seek_hole_iter 69 2:131072,-131387284455352
> 00016 iomap_seek_hole_iter 69 3:393216,4503599627239424
> 00016 iomap_seek_data_iter 69 2:131072,-131387284455352
> 00016 iomap_seek_hole_iter 69 2:131072,-131387284455352
> 00016 iomap_seek_hole_iter 69 3:393216,4503599627239424

I forgot to print 'offset' first, so that's showing (type:len,garbage)
With that fixed, and a call to dump_page() in folio_seek_hole_data(),
I see:

00016 iomap_seek_hole_iter 69 3:131072,65536
00016 page:00000000f7f02915 refcount:18 mapcount:0 mapping:000000008692207c=
 index:0x20 pfn:0x108750
00016 head:00000000f7f02915 order:4 compound_mapcount:0 compound_pincount:0
00016 aops:0xffffffff81c32a00 ino:45 dentry name:"file2"
00016 flags: 0x8000000000012014(uptodate|lru|private|head|zone=3D2)
00016 raw: 8000000000012014 ffffea000421e008 ffffea000421d008 ffff888103947=
520
00016 raw: 0000000000000020 ffff8881051cd2a0 00000012ffffffff 0000000000000=
000
00016 page dumped because: folio_seek_hole_data

(inode 69 decimal is 45 hex)

So I think this explains the output?  an order-4 page is 64kB, so it'll
report the entirety of 128kB-192kB as data.

--===============0308112108590927300==--

