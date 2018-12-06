Content-Type: multipart/mixed; boundary="===============1464538083252395871=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 16:18:14 -0800
Message-ID: <alpine.DEB.2.21.1812051614410.50028@chino.kir.corp.google.com>
In-Reply-To: <20181205233632.GE11899@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1464538083252395871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Andrea Arcangeli wrote:

> __GFP_COMPACT_ONLY gave an hope it could give some middle ground but
> it shows awful compaction results, it basically destroys compaction
> effectiveness and we know why (COMPACT_SKIPPED must call reclaim or
> compaction can't succeed because there's not enough free memory in the
> node). If somebody used MADV_HUGEPAGE compaction should still work and
> not fail like that. Compaction would fail to be effective even in the
> local node where __GFP_THISNODE didn't fail. Worst of all it'd fail
> even on non-NUMA systems (that would be easy to fix though by making
> the HPAGE_PMD_ORDER check conditional to NUMA being enabled at
> runtime).
> =


Note that in addition to COMPACT_SKIPPED that you mention, compaction can =

fail with COMPACT_COMPLETE, meaning the full scan has finished without =

freeing a hugepage, or COMPACT_DEFERRED, meaning that doing another scan =

is unlikely to produce a different result.  COMPACT_SKIPPED makes sense to =

do reclaim if it can become accessible to isolate_freepages() and =

hopefully another allocator does not allocate from these newly freed pages =

before compaction can scan the zone again.  For COMPACT_COMPLETE and =

COMPACT_DEFERRED, reclaim is unlikely to ever help.

--===============1464538083252395871==--

