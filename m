Content-Type: multipart/mixed; boundary="===============9071211910640408295=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 12 Dec 2018 12:00:16 -0500
Message-ID: <20181212170016.GG1130@redhat.com>
In-Reply-To: <20181212095051.GO1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============9071211910640408295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2018 at 10:50:51AM +0100, Michal Hocko wrote:
> I can be convinced that larger pages really require a different behavior
> than base pages but you should better show _real_ numbers on a wider
> variety workloads to back your claims. I have only heard hand waving and

I agree with your point about node_reclaim and I think David complaint
of "I got remote THP instead of local 4k" with our proposed fix, is
going to morph into "I got remote 4k instead of local 4k" with his
favorite fix.

Because David stopped calling reclaim with __GFP_THISNODE, the moment
the node is full of pagecache, node_reclaim behavior will go away and
even 4k pages will start to be allocated remote (and because of
__GFP_THISNODE set in the THP allocation, all readily available or
trivial to compact remote THP will be ignored too).

What David needs I think is a way to set __GFP_THISNODE for THP *and
4k* allocations and if both fails in a row with __GFP_THISNODE set, we
need to repeat the whole thing without __GFP_THISNODE set (ideally
with a mask to skip the node that we already scraped down to the
bottom during the initial __GFP_THISNODE pass). This way his
proprietary software binary will work even better than before when the
local node is fragmented and he'll finally be able to get the speedup
from remote THP too in case the local node is truly OOM, but all other
nodes are full of readily available THP.

To achieve this without a new MADV_THISNODE/MADV_NODE_RECLAIM, we'd
need a way to start with __GFP_THISNODE and then draw the line in
reclaim and decide to drop __GFP_THISNODE when too much pressure
mounts in the local node, but like you said it becomes like
node_reclaim and it would be better if it can be done with an opt-in,
like MADV_HUGEPAGE because not all workloads would benefit from such
extra pagecache reclaim cost (like not all workload benefits from
synchronous compaction).

I think some NUMA reclaim mode semantics ended up being embedded and
hidden in the THP MADV_HUGEPAGE, but they imposed massive slowdown to
all workloads that can't cope with the node_reclaim mode behavior
because they don't fit in a node.

Adding MADV_THISNODE/MADV_NODE_RECLAIM, will guarantee his proprietary
software binary will run at maximum performance without cache
interference, and he's happy to accept the risk of massive slowdown in
case the local node is truly OOM. The fallback, despite very
inefficient, will still happen without OOM killer triggering.

Thanks,
Andrea

--===============9071211910640408295==--

