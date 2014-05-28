Content-Type: multipart/mixed; boundary="===============9214816723801159459=="
MIME-Version: 1.0
From: Dongsu Park <dongsu.park@profitbricks.com>
To: lkp@lists.01.org
Subject: Re: [jet.chen@intel.com: [bio] kernel BUG at drivers/block/virtio_blk.c:166!]
Date: Wed, 28 May 2014 17:09:24 +0200
Message-ID: <20140528150924.GA5301@gmail.com>
In-Reply-To: <20140527112459.GF2205@dhcp-27-189.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9214816723801159459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 27.05.2014 13:24, Maurizio Lombardi wrote:
> On Tue, May 27, 2014 at 10:43:59AM +0200, Maurizio Lombardi wrote:
> > =

> > But now I'm suspicious of this part of commit 3979ef4dcf:
> > =

> >  failed:
> >         bvec->bv_page =3D NULL;
> >         bvec->bv_len =3D 0;
> >         bvec->bv_offset =3D 0;
> >         bio->bi_vcnt--;  <----------------
> >         blk_recount_segments(q, bio);
> >         return 0;
> > =

> > Is decreasing bi_vcnt sufficient to guarantee that blk_recount_segments=
()
> > recalculates the correct number of physical segments?
> > Looking at the __blk_recalc_rq_segments() it appears it may not be the =
case.
> > =

> > The question is how can we restore the correct number of physical segme=
nts in case
> > of failure without breaking anything...
> =

> If my hypothesis is correct, the following patch should trigger a kernel =
panic,
> Jet Chen, can you try it and let me know whether the BUG_ON is hit or not?

I was also able to reproduce this bug just as reported by Jet Chen,
and now I think I've found out a solution. I'll send out a patch.

Regards,
Dongsu

> diff --git a/block/bio.c b/block/bio.c
> index 0443694..763868f 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -701,6 +701,7 @@ static int __bio_add_page(struct request_queue *q, st=
ruct bio *bio, struct page
>  			  unsigned int max_sectors)
>  {
>  	int retried_segments =3D 0;
> +	unsigned int phys_segments_orig;
>  	struct bio_vec *bvec;
>  =

>  	/*
> @@ -751,6 +752,9 @@ static int __bio_add_page(struct request_queue *q, st=
ruct bio *bio, struct page
>  	if (bio->bi_vcnt >=3D bio->bi_max_vecs)
>  		return 0;
>  =

> +	blk_recount_segments(q, bio);
> +	phys_segments_orig =3D bio->bi_phys_segments;
> +
>  	/*
>  	 * setup the new entry, we might clear it again later if we
>  	 * cannot add the page
> @@ -811,6 +815,7 @@ static int __bio_add_page(struct request_queue *q, st=
ruct bio *bio, struct page
>  	bvec->bv_offset =3D 0;
>  	bio->bi_vcnt--;
>  	blk_recount_segments(q, bio);
> +	BUG_ON(phys_segments_orig !=3D bio->bi_phys_segments);
>  	return 0;
>  }
> =

> =

> Regards,
> Maurizio Lombardi =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--===============9214816723801159459==--

