Content-Type: multipart/mixed; boundary="===============5349879510940860440=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 19:54:25 -0500
Message-ID: <20181206005425.GB21159@redhat.com>
In-Reply-To: <alpine.DEB.2.21.1812051614410.50028@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5349879510940860440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 04:18:14PM -0800, David Rientjes wrote:
> On Wed, 5 Dec 2018, Andrea Arcangeli wrote:
> =

> > __GFP_COMPACT_ONLY gave an hope it could give some middle ground but
> > it shows awful compaction results, it basically destroys compaction
> > effectiveness and we know why (COMPACT_SKIPPED must call reclaim or
> > compaction can't succeed because there's not enough free memory in the
> > node). If somebody used MADV_HUGEPAGE compaction should still work and
> > not fail like that. Compaction would fail to be effective even in the
> > local node where __GFP_THISNODE didn't fail. Worst of all it'd fail
> > even on non-NUMA systems (that would be easy to fix though by making
> > the HPAGE_PMD_ORDER check conditional to NUMA being enabled at
> > runtime).
> > =

> =

> Note that in addition to COMPACT_SKIPPED that you mention, compaction can =

> fail with COMPACT_COMPLETE, meaning the full scan has finished without =

> freeing a hugepage, or COMPACT_DEFERRED, meaning that doing another scan =

> is unlikely to produce a different result.  COMPACT_SKIPPED makes sense t=
o =

> do reclaim if it can become accessible to isolate_freepages() and =

> hopefully another allocator does not allocate from these newly freed page=
s =

> before compaction can scan the zone again.  For COMPACT_COMPLETE and =

> COMPACT_DEFERRED, reclaim is unlikely to ever help.

The COMPACT_COMPLETE and (COMPACT_PARTIAL_SKIPPED for that matter)
seems just a mistake in the max() evaluation try_to_compact_pages()
that let it return COMPACT_COMPLETE and COMPACT_PARTIAL_SKIPPED. I
think it should just return COMPACT_DEFERRED in those two cases and it
should be enforced forced for all prio.

There are really only 3 cases that matter for the caller:

1) succeed -> we got the page
2) defer -> we failed (caller won't care about why)
3) skipped -> failed because not enough 4k freed -> reclaim must be invoked=
 then
   compaction can be retried

PARTIAL_SKIPPED/COMPLETE both fall into 2) above so for the caller
they should be treated the same way. It doesn't seem very concerning
that it may try like if it succeeded and do a spurious single reclaim
invocation, but it's good to fix this and take the COMPACT_DEFERRED
nopage path in the __GFP_NORETRY case.

--===============5349879510940860440==--

