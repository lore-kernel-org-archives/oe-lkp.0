Content-Type: multipart/mixed; boundary="===============8832375931892011464=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Tue, 04 Dec 2018 10:22:26 +0100
Message-ID: <64a4aec6-3275-a716-8345-f021f6186d9b@suse.cz>
In-Reply-To: <CAHk-=whDg5+e2-eXYo-jwC1spt2r7JjLQSaLm4OyfGMQHLTrdw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8832375931892011464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/3/18 11:27 PM, Linus Torvalds wrote:
> On Mon, Dec 3, 2018 at 2:04 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> so I think all of David's patch is somewhat sensible, even if that
>> specific "order =3D=3D pageblock_order" test really looks like it might
>> want to be clarified.
> =

> Side note: I think maybe people should just look at that whole
> compaction logic for that block, because it doesn't make much sense to
> me:
> =

>                 /*
>                  * Checks for costly allocations with __GFP_NORETRY, which
>                  * includes THP page fault allocations
>                  */
>                 if (costly_order && (gfp_mask & __GFP_NORETRY)) {
>                         /*
>                          * If compaction is deferred for high-order alloc=
ations,
>                          * it is because sync compaction recently failed.=
 If
>                          * this is the case and the caller requested a THP
>                          * allocation, we do not want to heavily disrupt =
the
>                          * system, so we fail the allocation instead of e=
ntering
>                          * direct reclaim.
>                          */
>                         if (compact_result =3D=3D COMPACT_DEFERRED)
>                                 goto nopage;
> =

>                         /*
>                          * Looks like reclaim/compaction is worth trying,=
 but
>                          * sync compaction could be very expensive, so ke=
ep
>                          * using async compaction.
>                          */
>                         compact_priority =3D INIT_COMPACT_PRIORITY;
>                 }
> =

> this is where David wants to add *his* odd test, and I think everybody
> looks at that added case
> =

> +                       if (order =3D=3D pageblock_order &&
> +                                       !(current->flags & PF_KTHREAD))
> +                               goto nopage;
> =

> and just goes "Eww".
> =

> But I think the real problem is that it's the "goto nopage" thing that
> makes _sense_, and the current cases for "let's try compaction" that

More precisely it's "let's try reclaim + compaction".

> are the odd ones, and then David adds one new special case for the
> sensible behavior.
> =

> For example, why would COMPACT_DEFERRED mean "don't bother", but not
> all the other reasons it didn't really make sense?

COMPACT_DEFERRED means that compaction was failing recently, even with
sufficient free pages (e.g. freed by direct reclaim), so it doesn't make
sense to continue.
What are "all the other reasons"? __alloc_pages_direct_compact() could
have also returned COMPACT_SKIPPED, which means compaction actually
didn't happen at all, because there's not enough free pages.

> So does it really make sense to fall through AT ALL to that "retry"
> case, when we explicitly already had (gfp_mask & __GFP_NORETRY)?

Well if there was no free memory to begin with, and thus compaction
returned COMPACT_SKIPPED, then we didn't really "try" anything yet, so
there's nothing to "not retry".

> Maybe the real fix is to instead of adding yet another special case
> for "goto nopage", it should just be unconditional: simply don't try
> to compact large-pages if __GFP_NORETRY was set.

I think that would destroy THP success rates too much, in situations
where reclaim and compaction would succeed, because there's enough
easily reclaimable and migratable memory.

> Hmm? I dunno. Right now - for 4.20, I'd obviously want to keep changes
> smallish, so a hacky added special case might be the right thing to
> do. But the code does look odd, doesn't it?
> =

> I think part of it comes from the fact that we *used* to do the
> compaction first, and then we did the reclaim, and then it was
> re-orghanized to do reclaim first, but it tried to keep semantic
> changes minimal and some of the above comes from that re-org.

IIRC the point of reorg was that in typical case we actually do want to
try the reclaim first (or only), and the exception are those THP-ish
allocations where typically the problem is fragmentation, and not number
of free pages, so we check first if we can defragment the memory or
whether it makes sense to free pages in case the defragmentation is
expected to help afterwards. It seemed better to put this special case
out of the main reclaim/compaction retry-with-increasing-priority loop
for non-costly-order allocations that in general can't fail.

Vlastimil

> I think.
> =

>                 Linus
> =



--===============8832375931892011464==--

