Content-Type: multipart/mixed; boundary="===============7882606969641715979=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [vfs] WARNING: CPU: 3 PID: 2339 at mm/truncate.c:758 pagecache_isize_extended+0xdd/0x120()
Date: Mon, 27 Oct 2014 10:58:12 +0100
Message-ID: <20141027095812.GA16093@quack.suse.cz>
In-Reply-To: <20141027010422.GA16186@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============7882606969641715979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 27-10-14 12:04:22, Dave Chinner wrote:
> On Thu, Oct 16, 2014 at 01:01:27PM +0200, Jan Kara wrote:
> > From de3426d6495f4b44b14c09b7c7202e9a86d864b9 Mon Sep 17 00:00:00 2001
> > From: Jan Kara <jack@suse.cz>
> > Date: Thu, 16 Oct 2014 12:58:42 +0200
> > Subject: [PATCH] mm: Remove false WARN_ON from pagecache_isize_extended=
()
> > =

> > The WARN_ON checking whether i_mutex is held in
> > pagecache_isize_extended() was wrong because some filesystems (e.g.
> > XFS) use different locks for serialization of truncates / writes. So
> > just remove the check.
> > =

> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  mm/truncate.c | 1 -
> >  1 file changed, 1 deletion(-)
> > =

> > diff --git a/mm/truncate.c b/mm/truncate.c
> > index 261eaf6e5a19..c646084e5eec 100644
> > --- a/mm/truncate.c
> > +++ b/mm/truncate.c
> > @@ -755,7 +755,6 @@ void pagecache_isize_extended(struct inode *inode, =
loff_t from, loff_t to)
> >  	struct page *page;
> >  	pgoff_t index;
> >  =

> > -	WARN_ON(!mutex_is_locked(&inode->i_mutex));
> >  	WARN_ON(to > inode->i_size);
> >  =

> >  	if (from >=3D to || bsize =3D=3D PAGE_CACHE_SIZE)
> =

> Jan, Have you sent this patch upstream yet? I'm seeing it fire in
> my testing in 3.18-rc1 kernels, so I was wondering what your plans
> are for this...
  I did send it but it got lost somewhere. I'll resend it.

								Honza
-- =

Jan Kara <jack@suse.cz>
SUSE Labs, CR

--===============7882606969641715979==--

