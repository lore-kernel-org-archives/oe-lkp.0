Content-Type: multipart/mixed; boundary="===============0117690467572838027=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 14:04:39 -0800
Message-ID: <CAHk-=wg=6uxAJMbvGJC-5CSikC8OdqsjE1vw+DsCMj=2SNSnZg@mail.gmail.com>
In-Reply-To: <20181203201214.GB3540@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0117690467572838027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2018 at 12:12 PM Andrea Arcangeli <aarcange@redhat.com> wr=
ote:
>
> On Mon, Dec 03, 2018 at 11:28:07AM -0800, Linus Torvalds wrote:
> >
> > One is the patch posted by Andrea earlier in this thread, which seems
> > to target just this known regression.
>
> For the short term the important thing is to fix the VM regression one
> way or another, I don't personally mind which way.
>
> > The other seems to be to revert commit ac5b2c1891  and instead apply
> >
> >   https://lore.kernel.org/lkml/alpine.DEB.2.21.1810081303060.221006(a)c=
hino.kir.corp.google.com/
> >
> > which also seems to be sensible.
>
> In my earlier review of David's patch, it looked runtime equivalent to
> the __GFP_COMPACT_ONLY solution. It has the only advantage of adding a

I think there's a missing "not" in the above.

> new gfpflag until we're sure we need it but it's the worst solution
> available for the long term in my view. It'd be ok to apply it as
> stop-gap measure though.

So I have no really strong opinions either way.

I looking at the two options, I think I'd personally have a slight
preference for that patch by David, not so much because it doesn't add
a new GFP flag, but because it seems to make it a lot more explicit
that GFP_TRANSHUGE_LIGHT automatically implies __GFP_NORETRY.

I think that makes a whole lot of conceptual sense with the whole
meaning of GFP_TRANSHUGE_LIGHT. It's all about "no
reclaim/compaction", but honestly, doesn't __GFP_NORETRY make sense?

So I look at David's patch, and I go "that makes sense", and then I
compare it with ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for
MADV_HUGEPAGE mappings") and that makes me go "ok, that's a hack".

So *if* reverting ac5b2c18911f and applying David's patch instead
fixes the KVM latency issues (which I assume it really should do,
simply thanks to __GFP_NORETRY), then I think that makes more sense.

That said, I do agree that the

        if (order =3D=3D pageblock_order ...)

test in __alloc_pages_slowpath() in David's patch then argues for
"that looks hacky".  But that code *is* inside the test for

                if (costly_order && (gfp_mask & __GFP_NORETRY)) {

so within the context of that (not visible in the patch itself), it
looks like a sensible model. The whole point of that block is, as the
comment above it says

                /*
                 * Checks for costly allocations with __GFP_NORETRY, which
                 * includes THP page fault allocations
                 */

so I think all of David's patch is somewhat sensible, even if that
specific "order =3D=3D pageblock_order" test really looks like it might
want to be clarified.

BUT.

With all that said, I really don't mind that __GFP_COMPACT_ONLY
approach either. I think David's patch makes sense in a bigger
context, while the __GFP_COMPACT_ONLY patch makes sense in the context
of "let's just fix this _particular_ special case.

As long as both work (and apparently they do), either is perfectly find by =
me.

Some kind of "Thunderdome for patches" is needed, with an epic soundtrack.

   "Two patches enter, one patch leaves!"

I don't so much care which one.

             Linus

--===============0117690467572838027==--

