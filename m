Content-Type: multipart/mixed; boundary="===============6311819002657560672=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [jet.chen@intel.com: [bio] kernel BUG at drivers/block/virtio_blk.c:166!]
Date: Wed, 28 May 2014 23:16:17 +0800
Message-ID: <5385FDC1.2020800@intel.com>
In-Reply-To: <20140527112459.GF2205@dhcp-27-189.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6311819002657560672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/27/2014 07:24 PM, Maurizio Lombardi wrote:
> On Tue, May 27, 2014 at 10:43:59AM +0200, Maurizio Lombardi wrote:
>>
>> But now I'm suspicious of this part of commit 3979ef4dcf:
>>
>>  failed:
>>         bvec->bv_page =3D NULL;
>>         bvec->bv_len =3D 0;
>>         bvec->bv_offset =3D 0;
>>         bio->bi_vcnt--;  <----------------
>>         blk_recount_segments(q, bio);
>>         return 0;
>>
>> Is decreasing bi_vcnt sufficient to guarantee that blk_recount_segments()
>> recalculates the correct number of physical segments?
>> Looking at the __blk_recalc_rq_segments() it appears it may not be the c=
ase.
>>
>> The question is how can we restore the correct number of physical segmen=
ts in case
>> of failure without breaking anything...
>>
> =

> If my hypothesis is correct, the following patch should trigger a kernel =
panic,
> Jet Chen, can you try it and let me know whether the BUG_ON is hit or not?

Sorry for late respond. Dongsu has sent a patch for this issue.
	message-id <1401289778-9840-1-git-send-email-dongsu.park@profitbricks.co=
m>
Do you still need me to test the following patch ?

> =

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

>=20

--===============6311819002657560672==--

