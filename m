Content-Type: multipart/mixed; boundary="===============7747628812716893392=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [btrfs] beeeccca9b: WARNING:at_mm/util.c:#kvmalloc_node
Date: Wed, 31 May 2017 12:30:32 +0200
Message-ID: <20170531103031.GG27783@dhcp22.suse.cz>
In-Reply-To: <20170531092920.GA1418@vader>
List-Id: <oe-lkp.lists.linux.dev>

--===============7747628812716893392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 31-05-17 02:29:20, Omar Sandoval wrote:
> On Wed, May 31, 2017 at 11:19:05AM +0200, Michal Hocko wrote:
> > On Wed 31-05-17 02:12:02, Omar Sandoval wrote:
> > > On Wed, May 31, 2017 at 08:51:28AM +0200, Michal Hocko wrote:
> > > > On Wed 31-05-17 14:30:33, kernel test robot wrote:
> > > > > =

> > > > > FYI, we noticed the following commit:
> > > > > =

> > > > > commit: beeeccca9bebcec386cc31c250cff8a06cf27034 ("btrfs: Use kvz=
alloc instead of kzalloc/vmalloc in alloc_bitmap")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git =
master
> > > > =

> > > > I have intentionally skipped alloc_bitmap because it relies on GFP_=
NOFS.
> > > > This doesn't work properly when falling back to vmalloc and that is=
 what
> > > > the warning reported here says. I believe the right approach is to =
check
> > > > whether the GFP_NOFS is _really_ needed and document why if yes.
> > > > Otherwise drop the NOFS part in one patch with the explanation and
> > > > convert it to kvmalloc in a separate patch.
> > > =

> > > Unfortunately we really do need GFP_NOFS here, the free space tree is
> > > modified while we are committing a fs transaction, sometimes in the
> > > critical section when we block new operations from joining the
> > > transaction.
> > =

> > OK, please document this.
> > =

> > > Looking at the comment in kvmalloc_node():
> > > =

> > > 	/*
> > > 	 * vmalloc uses GFP_KERNEL for some internal allocations (e.g page t=
ables)
> > > 	 * so the given set of flags has to be compatible.
> > > 	 */
> > > 	WARN_ON_ONCE((flags & GFP_KERNEL) !=3D GFP_KERNEL);
> > > =

> > > has alloc_bitmap() always been broken by virtue of calling vmalloc()
> > > with GFP_NOFS?
> > =

> > yes. vmalloc is simply not GFP_NOFS safe as it performs GFP_KERNEL
> > hardcoded allocations. The way out of this is to use
> > memalloc_nofs_{save,restore} around kvmalloc call.
> =

> Ok, thanks. Something like this untested patch instead of the one in
> linux-next?
> =

> diff --git a/fs/btrfs/free-space-tree.c b/fs/btrfs/free-space-tree.c
> index fc0bd8406758..5abd3cd71144 100644
> --- a/fs/btrfs/free-space-tree.c
> +++ b/fs/btrfs/free-space-tree.c
> @@ -153,21 +153,18 @@ static inline u32 free_space_bitmap_size(u64 size, =
u32 sectorsize)
>  =

>  static u8 *alloc_bitmap(u32 bitmap_size)
>  {
> -	void *mem;
> +	u8 *ret;
> +	unsigned int nofs_flag;
>  =

>  	/*
> -	 * The allocation size varies, observed numbers were < 4K up to 16K.
> -	 * Using vmalloc unconditionally would be too heavy, we'll try
> -	 * contiguous allocations first.
> +	 * GFP_NOFS doesn't work with kvmalloc(), but we really can't recurse
> +	 * into the filesystem as the free space bitmap can be modified in the
> +	 * critical section of a transaction commit.
>  	 */

I would just place
	 * TODO - make sure memalloc_nofs_{save,restore} is called at
	 * caller of this function - ideally when the transaction
	 * starts/stops.
	 */
> -	if  (bitmap_size <=3D PAGE_SIZE)
> -		return kzalloc(bitmap_size, GFP_NOFS);
> -
> -	mem =3D kzalloc(bitmap_size, GFP_NOFS | __GFP_NOWARN);
> -	if (mem)
> -		return mem;
> -
> -	return __vmalloc(bitmap_size, GFP_NOFS | __GFP_ZERO, PAGE_KERNEL);
> +	nofs_flag =3D memalloc_nofs_save();
> +	ret =3D kvmalloc(bitmap_size, GFP_KERNEL);
> +	memalloc_nofs_restore(nofs_flag);
> +	return ret;
>  }
>  =

>  int convert_free_space_to_bitmaps(struct btrfs_trans_handle *trans,
> =

> Dave, would you prefer to replace the patch we have now or do an
> incremental patch on top of it?
> =

> Michal, is there some reason we can't have kvmalloc() with
> !(gfp & __GFP_FS) just do the memalloc_nofs dance internally?

Yes, we really want to mark the transaction or other recursion dangerous
contexts at the places where the context starts/stops. kvmalloc is
definitely not the proper place to play those tricks.
-- =

Michal Hocko
SUSE Labs

--===============7747628812716893392==--

