Content-Type: multipart/mixed; boundary="===============6886151771677016927=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, page_alloc] b7ef62aa8a: BUG:kernel_hang_in_boot_stage
Date: Thu, 30 Mar 2017 15:40:26 -0700
Message-ID: <20170330154026.3ca919cf3b93da81c25724c4@linux-foundation.org>
In-Reply-To: <59d71b35-d556-4fc9-ee2e-1574259282fd@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6886151771677016927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> > BUG: kernel hang in boot stage
> =

> Thanks, I was able to reproduce and debug this.
> Andrew, please apply the following -fix. There will be conflicts on later
> patches, but with trivial resolution (pages -> free_pages). Thanks!
> =

> ...
>
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1977,6 +1977,9 @@ static void steal_suitable_fallback(struct zone *zo=
ne, struct page *page,
>  		goto single_page;
>  =

>  	pages =3D move_freepages_block(zone, page, start_type);
> +	/* moving whole block can fail due to zone boundary conditions */
> +	if (!pages)
> +		goto single_page;
>  =

>  	/* Claim the whole block if over half of it is free */
>  	if (pages >=3D (1 << (pageblock_order-1)) ||

The result is a bit odd:

	free_pages =3D move_freepages_block(zone, page, start_type,
						&movable_pages);
	/*
	 * Determine how many pages are compatible with our allocation.
	 * For movable allocation, it's the number of movable pages which
	 * we just obtained. For other types it's a bit more tricky.
	 */
	if (start_type =3D=3D MIGRATE_MOVABLE) {
		alike_pages =3D movable_pages;
	} else {
		/*
		 * If we are falling back a RECLAIMABLE or UNMOVABLE allocation
		 * to MOVABLE pageblock, consider all non-movable pages as
		 * compatible. If it's UNMOVABLE falling back to RECLAIMABLE or
		 * vice versa, be conservative since we can't distinguish the
		 * exact migratetype of non-movable pages.
		 */
		if (old_block_type =3D=3D MIGRATE_MOVABLE)
			alike_pages =3D pageblock_nr_pages
						- (free_pages + movable_pages);
		else
			alike_pages =3D 0;
	}

	/* moving whole block can fail due to zone boundary conditions */
	if (!free_pages)
		goto single_page;

should we do `goto single_page' as soon as the move_freepages_block()
call fails? =20

--===============6886151771677016927==--

