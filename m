Content-Type: multipart/mixed; boundary="===============5657872109283946443=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: MADV_HUGEPAGE vs. NUMA semantic (was: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression)
Date: Thu, 06 Dec 2018 10:14:06 +0100
Message-ID: <20181206091405.GD1286@dhcp22.suse.cz>
In-Reply-To: <CAHk-=wjm9V843eg0uesMrxKnCCq7UfWn8VJ+z-cNztb_0fVW6A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5657872109283946443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 05-12-18 16:58:02, Linus Torvalds wrote:
[...]
> I realize that we probably do want to just have explicit policies that
> do not exist right now, but what are (a) sane defaults, and (b) sane
> policies?

I would focus on the current default first (which is defrag=3Dmadvise).
This means that we only try the cheapest possible THP without
MADV_HUGEPAGE. If there is none we simply fallback. We do restrict to
the local node. I guess there is a general agreement that this is a sane
default.

MADV_HUGEPAGE changes the picture because the caller expressed a need
for THP and is willing to go extra mile to get it. That involves
allocation latency and as of now also a potential remote access. We do
not have complete agreement on the later but the prevailing argument is
that any strong NUMA locality is just reinventing node-reclaim story
again or makes THP success rate down the toilet (to quote Mel). I agree
that we do not want to fallback to a remote node overeagerly. I believe
that something like the below would be sensible
	1) THP on a local node with compaction not giving up too early
	2) THP on a remote node in NOWAIT mode - so no direct
	   compaction/reclaim (trigger kswapd/kcompactd only for
	   defrag=3Ddefer+madvise)
	3) fallback to the base page allocation

This would allow both full memory utilization and try to be as local as
possible. Whoever strongly prefers NUMA locality should be using
MPOL_NODE_RECLAIM (or similar) and that would skip 2 and make 1) and 2)
use more aggressive compaction and reclaim.

This will also fit into our existing NUMA api. MPOL_NODE_RECLAIM
wouldn't be restricted to THP obviously. It would act on base pages as
well and it would basically use the same implementation as we have for
the global node_reclaim and make it usable again.

Does this sound at least remotely sane?
-- =

Michal Hocko
SUSE Labs

--===============5657872109283946443==--

