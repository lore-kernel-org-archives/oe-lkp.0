Content-Type: multipart/mixed; boundary="===============8444434595433061337=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: efad4e475c [ 40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
Date: Mon, 18 Feb 2019 09:57:26 -0800
Message-ID: <20190218175726.GU12668@bombadil.infradead.org>
In-Reply-To: <20190218170558.GV4525@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8444434595433061337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 06:05:58PM +0100, Michal Hocko wrote:
> +	end_pfn =3D min(start_pfn + nr_pages,
> +			zone_end_pfn(page_zone(pfn_to_page(start_pfn))));
>  =

>  	/* Check the starting page of each pageblock within the range */
> -	for (; page < end_page; page =3D next_active_pageblock(page)) {
> -		if (!is_pageblock_removable_nolock(page))
> +	for (; start_pfn < end_pfn; start_pfn =3D next_active_pageblock(start_p=
fn)) {
> +		if (!is_pageblock_removable_nolock(start_pfn))

If you have a zone which contains pfns that run from ULONG_MAX-n to ULONG_M=
AX,
end_pfn is going to wrap around to 0 and this loop won't execute.  I think
you should use:

	max_pfn =3D min(start_pfn + nr_pages,
			zone_end_pfn(page_zone(pfn_to_page(start_pfn)))) - 1;

	for (; start_pfn <=3D max_pfn; ...)


--===============8444434595433061337==--

