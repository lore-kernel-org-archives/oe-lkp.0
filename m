Content-Type: multipart/mixed; boundary="===============3886885049254792171=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Fri, 04 Dec 2015 09:53:35 +0800
Message-ID: <87wpsvkmhs.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151203101719.GG2015@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3886885049254792171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mel Gorman <mgorman@techsingularity.net> writes:

> On Thu, Dec 03, 2015 at 04:46:53PM +0800, Huang, Ying wrote:
>> Mel Gorman <mgorman@techsingularity.net> writes:
>> =

>> > On Wed, Dec 02, 2015 at 03:15:29PM +0100, Michal Hocko wrote:
>> >> > > I didn't mention this allocation failure because I am not sure it=
 is
>> >> > > really related.
>> >> > > =

>> >> > =

>> >> > I'm fairly sure it is. The failure is an allocation site that cannot
>> >> > sleep but did not specify __GFP_HIGH.
>> >> =

>> >> yeah but this was the case even before your patch. As the caller used
>> >> GFP_ATOMIC then it got __GFP_ATOMIC after your patch so it still
>> >> managed to do ALLOC_HARDER. I would agree if this was an explicit
>> >> GFP_NOWAIT. Unless I am missing something your patch hasn't changed t=
he
>> >> behavior for this particular allocation.
>> >> =

>> >
>> > You're right. I think it's this hunk that is the problem.
>> >
>> > @@ -1186,7 +1186,7 @@ static struct request *blk_mq_map_request(struct
>> > request_queue *q,
>> >                 ctx =3D blk_mq_get_ctx(q);
>> >                 hctx =3D q->mq_ops->map_queue(q, ctx->cpu);
>> >                 blk_mq_set_alloc_data(&alloc_data, q,
>> > -                               __GFP_WAIT|GFP_ATOMIC, false, ctx, hct=
x);
>> > +                               __GFP_WAIT|__GFP_HIGH, false, ctx, hct=
x);
>> >                 rq =3D __blk_mq_alloc_request(&alloc_data, rw);
>> >                 ctx =3D alloc_data.ctx;
>> >                 hctx =3D alloc_data.hctx;
>> >
>> > This specific path at this patch is not waking kswapd any more when it
>> > should. A series of allocations there could hit the watermarks and nev=
er wake
>> > kswapd and then be followed by an atomic allocation failure that woke =
kswapd.
>> >
>> > This bug gets fixed later by the commit 71baba4b92dc ("mm, page_alloc:
>> > rename __GFP_WAIT to __GFP_RECLAIM") so it's not a bug in the current
>> > kernel. However, it happens to break bisection and would be caught if =
each
>> > individual commit was tested.
>> >
>> > Your __GFP_HIGH patch is still fine although not the direct fix for th=
is
>> > specific problem. Commit 71baba4b92dc is.
>> >
>> > Ying, does the page allocation failure messages happen when the whole
>> > series is applied? i.e. is 4.4-rc3 ok?
>> =

>> There are allocation errors for 4.4-rc3 too. dmesg is attached.
>> =

>
> What is the result of the __GFP_HIGH patch to give it access to
> reserves?

Applied Michal's patch on v4.4-rc3 and tested again, now there is no
page allocation failure.

Best Regards,
Huang, Ying

--===============3886885049254792171==--

