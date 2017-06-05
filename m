Content-Type: multipart/mixed; boundary="===============5204203459983847839=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [btrfs] beeeccca9b: WARNING:at_mm/util.c:#kvmalloc_node
Date: Mon, 05 Jun 2017 13:30:23 +1000
Message-ID: <20170605133023.57a82e4d@canb.auug.org.au>
In-Reply-To: <20170531145848.GB12135@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5204203459983847839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 31 May 2017 16:58:48 +0200 David Sterba <dsterba@suse.cz> wrote:
>
> On Wed, May 31, 2017 at 02:29:20AM -0700, Omar Sandoval wrote:
> > diff --git a/fs/btrfs/free-space-tree.c b/fs/btrfs/free-space-tree.c
> > index fc0bd8406758..5abd3cd71144 100644
> > --- a/fs/btrfs/free-space-tree.c
> > +++ b/fs/btrfs/free-space-tree.c
> > @@ -153,21 +153,18 @@ static inline u32 free_space_bitmap_size(u64 size=
, u32 sectorsize)
> >  =

> >  static u8 *alloc_bitmap(u32 bitmap_size)
> >  {
> > -	void *mem;
> > +	u8 *ret;
> > +	unsigned int nofs_flag;
> >  =

> >  	/*
> > -	 * The allocation size varies, observed numbers were < 4K up to 16K.
> > -	 * Using vmalloc unconditionally would be too heavy, we'll try
> > -	 * contiguous allocations first.
> > +	 * GFP_NOFS doesn't work with kvmalloc(), but we really can't recurse
> > +	 * into the filesystem as the free space bitmap can be modified in the
> > +	 * critical section of a transaction commit.
> >  	 */
> > -	if  (bitmap_size <=3D PAGE_SIZE)
> > -		return kzalloc(bitmap_size, GFP_NOFS);
> > -
> > -	mem =3D kzalloc(bitmap_size, GFP_NOFS | __GFP_NOWARN);
> > -	if (mem)
> > -		return mem;
> > -
> > -	return __vmalloc(bitmap_size, GFP_NOFS | __GFP_ZERO, PAGE_KERNEL);
> > +	nofs_flag =3D memalloc_nofs_save();
> > +	ret =3D kvmalloc(bitmap_size, GFP_KERNEL);
> > +	memalloc_nofs_restore(nofs_flag);
> > +	return ret;
> >  }
> >  =

> >  int convert_free_space_to_bitmaps(struct btrfs_trans_handle *trans,
> > =

> > Dave, would you prefer to replace the patch we have now or do an
> > incremental patch on top of it?  =

> =

> I'll drop the patch "btrfs: Use kvzalloc instead of kzalloc/vmalloc in
> alloc_bitmap", please send an updated version.

Ping?

-- =

Cheers,
Stephen Rothwell

--===============5204203459983847839==--

