Content-Type: multipart/mixed; boundary="===============5817686023631729127=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 14:27:18 -0800
Message-ID: <CAHk-=whDg5+e2-eXYo-jwC1spt2r7JjLQSaLm4OyfGMQHLTrdw@mail.gmail.com>
In-Reply-To: <CAHk-=wg=6uxAJMbvGJC-5CSikC8OdqsjE1vw+DsCMj=2SNSnZg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5817686023631729127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2018 at 2:04 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> so I think all of David's patch is somewhat sensible, even if that
> specific "order =3D=3D pageblock_order" test really looks like it might
> want to be clarified.

Side note: I think maybe people should just look at that whole
compaction logic for that block, because it doesn't make much sense to
me:

                /*
                 * Checks for costly allocations with __GFP_NORETRY, which
                 * includes THP page fault allocations
                 */
                if (costly_order && (gfp_mask & __GFP_NORETRY)) {
                        /*
                         * If compaction is deferred for high-order allocat=
ions,
                         * it is because sync compaction recently failed. If
                         * this is the case and the caller requested a THP
                         * allocation, we do not want to heavily disrupt the
                         * system, so we fail the allocation instead of ent=
ering
                         * direct reclaim.
                         */
                        if (compact_result =3D=3D COMPACT_DEFERRED)
                                goto nopage;

                        /*
                         * Looks like reclaim/compaction is worth trying, b=
ut
                         * sync compaction could be very expensive, so keep
                         * using async compaction.
                         */
                        compact_priority =3D INIT_COMPACT_PRIORITY;
                }

this is where David wants to add *his* odd test, and I think everybody
looks at that added case

+                       if (order =3D=3D pageblock_order &&
+                                       !(current->flags & PF_KTHREAD))
+                               goto nopage;

and just goes "Eww".

But I think the real problem is that it's the "goto nopage" thing that
makes _sense_, and the current cases for "let's try compaction" that
are the odd ones, and then David adds one new special case for the
sensible behavior.

For example, why would COMPACT_DEFERRED mean "don't bother", but not
all the other reasons it didn't really make sense?

So does it really make sense to fall through AT ALL to that "retry"
case, when we explicitly already had (gfp_mask & __GFP_NORETRY)?

Maybe the real fix is to instead of adding yet another special case
for "goto nopage", it should just be unconditional: simply don't try
to compact large-pages if __GFP_NORETRY was set.

Hmm? I dunno. Right now - for 4.20, I'd obviously want to keep changes
smallish, so a hacky added special case might be the right thing to
do. But the code does look odd, doesn't it?

I think part of it comes from the fact that we *used* to do the
compaction first, and then we did the reclaim, and then it was
re-orghanized to do reclaim first, but it tried to keep semantic
changes minimal and some of the above comes from that re-org.

I think.

                Linus

--===============5817686023631729127==--

