Content-Type: multipart/mixed; boundary="===============4095264092670005286=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 15:12:14 -0500
Message-ID: <20181203201214.GB3540@redhat.com>
In-Reply-To: <CAHk-=wiNKLH2Pbnr9z2SvmDhf7XT==U6NPRkQNX13Sg-FRk0Yw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4095264092670005286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2018 at 11:28:07AM -0800, Linus Torvalds wrote:
> On Mon, Dec 3, 2018 at 10:59 AM Michal Hocko <mhocko@kernel.org> wrote:
> >
> > You are misinterpreting my words. I haven't dismissed anything. I do
> > recognize both usecases under discussion.
> >
> > I have merely said that a better THP locality needs more work and during
> > the review discussion I have even volunteered to work on that.
> =

> We have two known patches that seem to have no real downsides.
> =

> One is the patch posted by Andrea earlier in this thread, which seems
> to target just this known regression.

For the short term the important thing is to fix the VM regression one
way or another, I don't personally mind which way.

> The other seems to be to revert commit ac5b2c1891  and instead apply
> =

>   https://lore.kernel.org/lkml/alpine.DEB.2.21.1810081303060.221006(a)chi=
no.kir.corp.google.com/
> =

> which also seems to be sensible.

In my earlier review of David's patch, it looked runtime equivalent to
the __GFP_COMPACT_ONLY solution. It has the only advantage of adding a
new gfpflag until we're sure we need it but it's the worst solution
available for the long term in my view. It'd be ok to apply it as
stop-gap measure though.

The "order =3D=3D pageblock_order" hardcoding inside the allocator to
workaround the __GFP_THISNODE flag passed from outside the allocator
in the THP MADV_HUGEPAGE case, didn't look very attractive because
it's not just THP allocating order >0 pages.

It'd be nicer if whatever compaction latency optimization that applies
to THP could also apply to all other allocation orders too and the
hardcoding of the THP order prevents that.

On the same lines if __GFP_THISNODE is so badly needed by
MADV_HUGEPAGE, all other larger order allocations should also be able
to take advantage of __GFP_THISNODE without ending in the same VM
corner cases that required the "order =3D=3D pageblock_order" hardcoding
inside the allocator.

If you prefer David's patch I would suggest pageblock_order to be
replaced with HPAGE_PMD_ORDER so it's more likely to match the THP
order in all archs.

Thanks,
Andrea

--===============4095264092670005286==--

