Content-Type: multipart/mixed; boundary="===============5031939628898873959=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 10:05:54 +0100
Message-ID: <20181205090554.GX1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812041356490.157466@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5031939628898873959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 04-12-18 14:04:10, David Rientjes wrote:
> On Tue, 4 Dec 2018, Vlastimil Babka wrote:
> =

> > So, AFAIK, the situation is:
> > =

> > - commit 5265047ac301 in 4.1 introduced __GFP_THISNODE for THP. The
> > intention came a bit earlier in 4.0 commit 077fcf116c8c. (I admit acking
> > both as it seemed to make sense).
> =

> Yes, both are based on the preference to fault local thp and fallback to =

> local pages before allocating remotely because it does not cause the =

> performance regression introduced by not setting __GFP_THISNODE.
> =

> > - The resulting node-reclaim-like behavior regressed Andrea's KVM
> > workloads, but reverting it (only for madvised or non-default
> > defrag=3Dalways THP by commit ac5b2c18911f) would regress David's
> > workloads starting with 4.20 to pre-4.1 levels.
> > =

> =

> Almost, but the defrag=3Dalways case had the subtle difference of also =

> setting __GFP_NORETRY whereas MADV_HUGEPAGE did not.  This was different =

> than the comment in __alloc_pages_slowpath() that expected thp fault =

> allocations to be caught by checking __GFP_NORETRY.
> =

> > If the decision is that it's too late to revert a 4.1 regression for one
> > kind of workload in 4.20 because it causes regression for another
> > workload, then I guess we just revert ac5b2c18911f (patch 1) for 4.20
> > and don't rush a different fix (patch 2) to 4.20. It's not a big
> > difference if a 4.1 regression is fixed in 4.20 or 4.21?
> > =

> =

> The revert is certainly needed to prevent the regression, yes, but I =

> anticipate that Andrea will report back that patch 2 at least improves th=
e =

> situation for the problem that he was addressing, specifically that it is =

> pointless to thrash any node or reclaim unnecessarily when compaction has =

> already failed.  This is what setting __GFP_NORETRY for all thp fault =

> allocations fixes.

Yes but earlier numbers from Mel and repeated again [1] simply show
that the swap storms are only handled in favor of an absolute drop of
THP success rate.
 =

> > Because there might be other unexpected consequences of patch 2 that
> > testing won't be able to catch in the remaining 4.20 rc's. And I'm not
> > even sure if it will fix Andrea's workloads. While it should prevent
> > node-reclaim-like thrashing, it will still mean that KVM (or anyone)
> > won't be able to allocate THP's remotely, even if the local node is
> > exhausted of both huge and base pages.
> > =

> =

> Patch 2 does nothing with respect to the remote allocation policy; it =

> simply prevents reclaim (and potentially thrashing).  Patch 1 sets =

> __GFP_THISNODE to prevent the remote allocation.

Yes, this is understood. So we are getting worst of both. We have a
numa locality side effect of MADV_HUGEPAGE and we have a poor THP
utilization. So how come this is an improvement. Especially when the
reported regression hasn't been demonstrated on a real or repeatable
workload but rather a very vague presumably worst case behavior where
the access penalty is absolutely prevailing.

[1] http://lkml.kernel.org/r/20181204104558.GV23260(a)techsingularity.net
-- =

Michal Hocko
SUSE Labs

--===============5031939628898873959==--

