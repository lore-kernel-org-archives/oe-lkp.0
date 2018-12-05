Content-Type: multipart/mixed; boundary="===============6952289096911414460=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [patch 1/2 for-4.20] mm, thp: restore node-local hugepage allocations
Date: Wed, 05 Dec 2018 17:21:47 -0500
Message-ID: <20181205222147.GD11899@redhat.com>
In-Reply-To: <20181205201528.GW1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6952289096911414460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 09:15:28PM +0100, Michal Hocko wrote:
> If the __GFP_THISNODE should be really used then it should be applied to
> all other types of pages. Not only THP. And as such done in a separate
> patch. Not a part of the revert. The cleanup was meant to unify THP
> allocations and that is why I object to reverting it as a part of this
> work.

I also wonder if using __GFP_THISNODE for all pages and not only THP
may really help David's workload performance further if it's so NUMA
sensitive and short lived too (plus we know it most of the time fits
in a single node). It'll get rid of the cache in the local node before
allocating remote memory. Of course than the swap storms and
pathological performance for processes that don't fit in a node, will
also materialize without THP enabled. If this is true, that'd point
further to the need of a MPOL that can set __GFP_THISNODE not just for
THP but for all allocations, with the only difference that if it's the
regular page size failing, instead of hitting OOM it should do one
last fallback to a regular page size allocation without __GFP_THISNODE
set.

Regardless of the above I think it's still interesting to look into
adding more NUMA affinity to THP somehow, but I doubt we want to do
that at the price of crippling compaction in a way it can't generate
THP anymore once a node is full of cache, and certainly we don't want
to cripple compaction in non-NUMA hosts too like it'd be happening
with the current proposed patch. Furthermore whatever we do should
work for order 8 7 6 etc.. too. If we did a order 9 specialized trick
that cripples compaction effectiveness, it'd be a short term approach
and it'd be tailored to David's use case that seems to be sensitive to
allocation latency. Being sensitive to allocation latency doesn't make
that process a good fit for MADV_HUGEPAGE to begin with.

--===============6952289096911414460==--

