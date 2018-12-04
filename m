Content-Type: multipart/mixed; boundary="===============2687696674322120038=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Tue, 04 Dec 2018 14:04:10 -0800
Message-ID: <alpine.DEB.2.21.1812041356490.157466@chino.kir.corp.google.com>
In-Reply-To: <bb198d88-27be-0d5c-d871-1ffd26a08e29@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2687696674322120038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Dec 2018, Vlastimil Babka wrote:

> So, AFAIK, the situation is:
> =

> - commit 5265047ac301 in 4.1 introduced __GFP_THISNODE for THP. The
> intention came a bit earlier in 4.0 commit 077fcf116c8c. (I admit acking
> both as it seemed to make sense).

Yes, both are based on the preference to fault local thp and fallback to =

local pages before allocating remotely because it does not cause the =

performance regression introduced by not setting __GFP_THISNODE.

> - The resulting node-reclaim-like behavior regressed Andrea's KVM
> workloads, but reverting it (only for madvised or non-default
> defrag=3Dalways THP by commit ac5b2c18911f) would regress David's
> workloads starting with 4.20 to pre-4.1 levels.
> =


Almost, but the defrag=3Dalways case had the subtle difference of also =

setting __GFP_NORETRY whereas MADV_HUGEPAGE did not.  This was different =

than the comment in __alloc_pages_slowpath() that expected thp fault =

allocations to be caught by checking __GFP_NORETRY.

> If the decision is that it's too late to revert a 4.1 regression for one
> kind of workload in 4.20 because it causes regression for another
> workload, then I guess we just revert ac5b2c18911f (patch 1) for 4.20
> and don't rush a different fix (patch 2) to 4.20. It's not a big
> difference if a 4.1 regression is fixed in 4.20 or 4.21?
> =


The revert is certainly needed to prevent the regression, yes, but I =

anticipate that Andrea will report back that patch 2 at least improves the =

situation for the problem that he was addressing, specifically that it is =

pointless to thrash any node or reclaim unnecessarily when compaction has =

already failed.  This is what setting __GFP_NORETRY for all thp fault =

allocations fixes.

> Because there might be other unexpected consequences of patch 2 that
> testing won't be able to catch in the remaining 4.20 rc's. And I'm not
> even sure if it will fix Andrea's workloads. While it should prevent
> node-reclaim-like thrashing, it will still mean that KVM (or anyone)
> won't be able to allocate THP's remotely, even if the local node is
> exhausted of both huge and base pages.
> =


Patch 2 does nothing with respect to the remote allocation policy; it =

simply prevents reclaim (and potentially thrashing).  Patch 1 sets =

__GFP_THISNODE to prevent the remote allocation.

Note that the commit to be reverted in patch 1, if not reverted, would =

cause an even more severe regression from Andrea's case if remote memory =

is fragmented as well: it opens the door to thrashing both local and =

remote memory instead of only local memory.  I measured this as a 40% =

allocation latency regression when purposefully fragmenting all nodes and =

faulting without __GFP_THISNODE, and that was on Haswell; I can imagine it =

would be even greater on Rome.

--===============2687696674322120038==--

