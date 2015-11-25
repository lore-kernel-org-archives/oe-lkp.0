Content-Type: multipart/mixed; boundary="===============2931232566634635322=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Wed, 25 Nov 2015 13:44:58 +0100
Message-ID: <5655AD4A.4080001@suse.cz>
In-Reply-To: <20151124082941.GA4136@js1304-P5Q-DELUXE>
List-Id: <oe-lkp.lists.linux.dev>

--===============2931232566634635322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/24/2015 09:29 AM, Joonsoo Kim wrote:
> On Tue, Nov 24, 2015 at 03:27:43PM +0800, Aaron Lu wrote:
> =

> Thanks.
> =

> Okay. Output proves the theory. pagetypeinfo shows that there are
> too many unmovable pageblocks. isolate_freepages() should skip these
> so it's not easy to meet proper pageblock until need_resched(). Hence,
> updating cached pfn doesn't happen. (You can see unchanged free_pfn
> with 'grep compaction_begin tracepoint-output')

Hm to me it seems that the scanners meet a lot, so they restart at zone
boundaries and that's fine. There's nothing to cache.

> But, I don't think that updating cached pfn is enough to solve your probl=
em.
> More complex change would be needed, I guess.

One factor is probably that THP only use async compaction and those don't r=
esult
in deferred compaction, which should help here. It also means that
pageblock_skip bits are not being reset except by kswapd...

Oh and pageblock_pfn_to_page is done before checking the pageblock skip bit=
s, so
that's why it's prominent in the profiles. Although it was less prominent (=
9% vs
46% before) in the last data... was perf collected while tracing, thus
generating extra noise?

> Thanks.
> =

> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo(a)kvack.org.  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=3Dmailto:"dont@kvack.org"> email(a)kvack.org </a>
> =



--===============2931232566634635322==--

