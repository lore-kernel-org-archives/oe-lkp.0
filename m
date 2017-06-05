Content-Type: multipart/mixed; boundary="===============0572982531681655877=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [btrfs] beeeccca9b: WARNING:at_mm/util.c:#kvmalloc_node
Date: Mon, 05 Jun 2017 13:43:06 +0200
Message-ID: <20170605114306.GR12135@suse.cz>
In-Reply-To: <20170605133023.57a82e4d@canb.auug.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============0572982531681655877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2017 at 01:30:23PM +1000, Stephen Rothwell wrote:
> Hi David,
> =

> On Wed, 31 May 2017 16:58:48 +0200 David Sterba <dsterba@suse.cz> wrote:
> >
> > On Wed, May 31, 2017 at 02:29:20AM -0700, Omar Sandoval wrote:
> > > diff --git a/fs/btrfs/free-space-tree.c b/fs/btrfs/free-space-tree.c
> > > index fc0bd8406758..5abd3cd71144 100644
> > > --- a/fs/btrfs/free-space-tree.c
> > > +++ b/fs/btrfs/free-space-tree.c
> > > @@ -153,21 +153,18 @@ static inline u32 free_space_bitmap_size(u64 si=
ze, u32 sectorsize)
> > >  =

> > >  static u8 *alloc_bitmap(u32 bitmap_size)
> > >  {
> > > -	void *mem;
> > > +	u8 *ret;
> > > +	unsigned int nofs_flag;
> > >  =

> > >  	/*
> > > -	 * The allocation size varies, observed numbers were < 4K up to 16K.
> > > -	 * Using vmalloc unconditionally would be too heavy, we'll try
> > > -	 * contiguous allocations first.
> > > +	 * GFP_NOFS doesn't work with kvmalloc(), but we really can't recur=
se
> > > +	 * into the filesystem as the free space bitmap can be modified in =
the
> > > +	 * critical section of a transaction commit.
> > >  	 */
> > > -	if  (bitmap_size <=3D PAGE_SIZE)
> > > -		return kzalloc(bitmap_size, GFP_NOFS);
> > > -
> > > -	mem =3D kzalloc(bitmap_size, GFP_NOFS | __GFP_NOWARN);
> > > -	if (mem)
> > > -		return mem;
> > > -
> > > -	return __vmalloc(bitmap_size, GFP_NOFS | __GFP_ZERO, PAGE_KERNEL);
> > > +	nofs_flag =3D memalloc_nofs_save();
> > > +	ret =3D kvmalloc(bitmap_size, GFP_KERNEL);
> > > +	memalloc_nofs_restore(nofs_flag);
> > > +	return ret;
> > >  }
> > >  =

> > >  int convert_free_space_to_bitmaps(struct btrfs_trans_handle *trans,
> > > =

> > > Dave, would you prefer to replace the patch we have now or do an
> > > incremental patch on top of it?  =

> > =

> > I'll drop the patch "btrfs: Use kvzalloc instead of kzalloc/vmalloc in
> > alloc_bitmap", please send an updated version.
> =

> Ping?

Now fixed, sorry. Top commit 736202ae51c50a6063087011073e91b6a6ae92e9. I
didn't notice the patch got back to for-next through another branch.

--===============0572982531681655877==--

