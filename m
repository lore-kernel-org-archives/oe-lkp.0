Content-Type: multipart/mixed; boundary="===============3962138924258339211=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 14:57:55 -0800
Message-ID: <alpine.DEB.2.21.1812031452280.253907@chino.kir.corp.google.com>
In-Reply-To: <CAHk-=whDg5+e2-eXYo-jwC1spt2r7JjLQSaLm4OyfGMQHLTrdw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3962138924258339211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Dec 2018, Linus Torvalds wrote:

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
> are the odd ones, and then David adds one new special case for the
> sensible behavior.
> =

> For example, why would COMPACT_DEFERRED mean "don't bother", but not
> all the other reasons it didn't really make sense?
> =

> So does it really make sense to fall through AT ALL to that "retry"
> case, when we explicitly already had (gfp_mask & __GFP_NORETRY)?
> =

> Maybe the real fix is to instead of adding yet another special case
> for "goto nopage", it should just be unconditional: simply don't try
> to compact large-pages if __GFP_NORETRY was set.
> =


I think what is intended, which may not be represented by the code, is =

that if compaction is not suitable (__compaction_suitable() returns =

COMPACT_SKIPPED because of failing watermarks) that for non-hugepage =

allocations reclaim may be useful.  We just want to reclaim memory so that =

memory compaction has pages available for migration targets.

Note the same caveat I keep bringing up still applies, though: if reclaim =

frees memory that is iterated over by the compaction migration scanner, it =

was pointless.  That is a memory compaction implementation detail and can =

lead to a lot of unnecessary reclaim (or even thrashing) if unmovable page =

fragmentation cause compaction to fail even after it has migrated =

everything it could.  I think the likelihood of that happening increases =

by the allocation order.

--===============3962138924258339211==--

