Content-Type: multipart/mixed; boundary="===============5771168758429636150=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Tue, 04 Dec 2018 16:07:27 -0800
Message-ID: <alpine.DEB.2.21.1812041551170.213718@chino.kir.corp.google.com>
In-Reply-To: <20181204084821.GB1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5771168758429636150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Dec 2018, Michal Hocko wrote:

> The thing I am really up to here is that reintroduction of
> __GFP_THISNODE, which you are pushing for, will conflate madvise mode
> resp. defrag=3Dalways with a numa placement policy because the allocation
> doesn't fallback to a remote node.
> =


It isn't specific to MADV_HUGEPAGE, it is the policy for all transparent =

hugepage allocations, including defrag=3Dalways.  We agree that =

MADV_HUGEPAGE is not exactly defined: does it mean try harder to allocate =

a hugepage locally, try compaction synchronous to the fault, allow remote =

fallback?  It's undefined.

The original intent was to be used when thp is disabled system wide =

(enabled set to "madvise") because its possible the rss of the process =

increases if backed by thp.  That occurs either if faulting on a hugepage =

aligned area or based on max_ptes_none.  So we have at least three =

possible policies that have evolved over time: preventing increased rss, =

direct compaction, remote fallback.  Certainly not something that fits =

under a single madvise mode.

> And that is a fundamental problem and the antipattern I am talking
> about. Look at it this way. All normal allocations are utilizing all the
> available memory even though they might hit a remote latency penalty. If
> you do care about NUMA placement you have an API to enforce a specific
> placement.  What is so different about THP to behave differently. Do
> we really want to later invent an API to actually allow to utilize all
> the memory? There are certainly usecases (that triggered the discussion
> previously) that do not mind the remote latency because all other
> benefits simply outweight it?
> =


What is different about THP is that on every platform I have measured, =

NUMA matters more than hugepages.  Obviously if on Broadwell, Haswell, and =

Rome, remote hugepages were a performance win over local pages, this =

discussion would not be happening.  Faulting local pages rather than =

local hugepages, if possible, is easy and doesn't require reclaim.  =

Faulting remote pages rather than reclaiming local pages is easy in your =

scenario, it's non-disruptive.

So to answer "what is so different about THP?", it's the performance data.  =

The NUMA locality matters more than whether the pages are huge or not.  We =

also have the added benefit of khugepaged being able to collapse pages =

locally if fragmentation improves rather than being stuck accessing a =

remote hugepage forever.

> That being said what should users who want to use all the memory do to
> use as many THPs as possible?

If those users want to accept the performance degradation of allocating =

remote hugepages instead of local pages, that should likely be an =

extension, either madvise or prctl.  That's not necessarily the usecase =

Andrea would have, I don't believe: he'd still prefer to compact memory =

locally and avoid the swap storm than allocate remotely.  If impossible to =

reclaim locally for regular pages, remote hugepages may be more beneficial =

than remote pages.

--===============5771168758429636150==--

