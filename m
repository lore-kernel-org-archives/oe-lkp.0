Content-Type: multipart/mixed; boundary="===============4697858622978565164=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, page_alloc] b7ef62aa8a: BUG:kernel_hang_in_boot_stage
Date: Fri, 31 Mar 2017 09:13:40 +0200
Message-ID: <0b64033c-fcf2-ace1-ceff-3e0139f75bb0@suse.cz>
In-Reply-To: <20170330154026.3ca919cf3b93da81c25724c4@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4697858622978565164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/31/2017 12:40 AM, Andrew Morton wrote:
>> > BUG: kernel hang in boot stage
>> =

>> Thanks, I was able to reproduce and debug this.
>> Andrew, please apply the following -fix. There will be conflicts on later
>> patches, but with trivial resolution (pages -> free_pages). Thanks!
>> =

>> ...
>>
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -1977,6 +1977,9 @@ static void steal_suitable_fallback(struct zone *z=
one, struct page *page,
>>  		goto single_page;
>>  =

>>  	pages =3D move_freepages_block(zone, page, start_type);
>> +	/* moving whole block can fail due to zone boundary conditions */
>> +	if (!pages)
>> +		goto single_page;
>>  =

>>  	/* Claim the whole block if over half of it is free */
>>  	if (pages >=3D (1 << (pageblock_order-1)) ||
> =

> The result is a bit odd:
> =

> 	free_pages =3D move_freepages_block(zone, page, start_type,
> 						&movable_pages);
> 	/*
> 	 * Determine how many pages are compatible with our allocation.
> 	 * For movable allocation, it's the number of movable pages which
> 	 * we just obtained. For other types it's a bit more tricky.
> 	 */
> 	if (start_type =3D=3D MIGRATE_MOVABLE) {
> 		alike_pages =3D movable_pages;
> 	} else {
> 		/*
> 		 * If we are falling back a RECLAIMABLE or UNMOVABLE allocation
> 		 * to MOVABLE pageblock, consider all non-movable pages as
> 		 * compatible. If it's UNMOVABLE falling back to RECLAIMABLE or
> 		 * vice versa, be conservative since we can't distinguish the
> 		 * exact migratetype of non-movable pages.
> 		 */
> 		if (old_block_type =3D=3D MIGRATE_MOVABLE)
> 			alike_pages =3D pageblock_nr_pages
> 						- (free_pages + movable_pages);
> 		else
> 			alike_pages =3D 0;
> 	}
> =

> 	/* moving whole block can fail due to zone boundary conditions */
> 	if (!free_pages)
> 		goto single_page;
> =

> should we do `goto single_page' as soon as the move_freepages_block()
> call fails?  =


Yeah, that would be more obvious. Thanks!


--===============4697858622978565164==--

