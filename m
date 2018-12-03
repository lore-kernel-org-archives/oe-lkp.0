Content-Type: multipart/mixed; boundary="===============1005890906058572524=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 12:36:09 -0800
Message-ID: <alpine.DEB.2.21.1812031226510.192288@chino.kir.corp.google.com>
In-Reply-To: <20181203201214.GB3540@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1005890906058572524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Dec 2018, Andrea Arcangeli wrote:

> In my earlier review of David's patch, it looked runtime equivalent to
> the __GFP_COMPACT_ONLY solution. It has the only advantage of adding a
> new gfpflag until we're sure we need it but it's the worst solution
> available for the long term in my view. It'd be ok to apply it as
> stop-gap measure though.
> =

> The "order =3D=3D pageblock_order" hardcoding inside the allocator to
> workaround the __GFP_THISNODE flag passed from outside the allocator
> in the THP MADV_HUGEPAGE case, didn't look very attractive because
> it's not just THP allocating order >0 pages.
> =


We have two different things to consider: NUMA locality and the order of =

the allocation.  THP is preferred locally and we know the order.  For the =

other high-order pages you're referring to, I don't know if they are using =

__GFP_THISNODE or not (likely not).  I see them as two separate issues.

For thp on all platforms I have measured it on specifically for this patch =

(Broadwell, Haswell, Rome) there is a clear advantage to faulting local =

pages of the native page size over remote hugepages.  It also has the =

added effect of allowing khugepaged to collapse it into a hugepage later =

if fragmentation allows (the reason why khugepaged cares about NUMA =

locality, the same reason I do).  This is the rationale for __GFP_THISNODE =

for thp allocations.

For order =3D=3D pageblock_order (or more correctly order >=3D pageblock_or=
der), =

this is not based on NUMA whatsoever but is rather based on the =

implementation of memory compaction.  If it has already failed (or was =

deferred for order-HPAGE_PMD_ORDER), reclaim cannot be shown to help if =

memory compaction cannot utilize the freed memory in isolate_freepages(), =

so that reclaim has been pointless.  If compaction fails for other reasons =

(any unmovable page preventing a pageblock from becoming free), *all* =

reclaim activity has been pointless.  =


> It'd be nicer if whatever compaction latency optimization that applies
> to THP could also apply to all other allocation orders too and the
> hardcoding of the THP order prevents that.
> =

> On the same lines if __GFP_THISNODE is so badly needed by
> MADV_HUGEPAGE, all other larger order allocations should also be able
> to take advantage of __GFP_THISNODE without ending in the same VM
> corner cases that required the "order =3D=3D pageblock_order" hardcoding
> inside the allocator.
> =

> If you prefer David's patch I would suggest pageblock_order to be
> replaced with HPAGE_PMD_ORDER so it's more likely to match the THP
> order in all archs.
> =


That sounds fine and I will do that in my v2.

--===============1005890906058572524==--

