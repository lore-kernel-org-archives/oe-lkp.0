Content-Type: multipart/mixed; boundary="===============5204003073493189528=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 12 Dec 2018 10:50:51 +0100
Message-ID: <20181212095051.GO1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812111609060.255489@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5204003073493189528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 11-12-18 16:37:22, David Rientjes wrote:
[...]
> Since it depends on the workload, specifically workloads that fit within =
a =

> single node, I think the reasonable approach would be to have a sane =

> default regardless of the use of MADV_HUGEPAGE or thp defrag settings and =

> then optimzie for the minority of cases where the workload does not fit i=
n =

> a single node.  I'm assuming there is no debate about these larger =

> workloads being in the minority, although we have single machines where =

> this encompasses the totality of their workloads.

Your assumption is wrong I believe. This is the fundamental disagreement
we are discussing here. You are essentially arguing for node_reclaim
(formerly zone_reclaim) behavior for THP pages. All that without any
actual data on wider variety of workloads. As the matter of _fact_ we
know that node_reclaim behavior is not a suitable default. We did
that mistake in the past and we had to revert that default _exactly_
because a wider variety of workloads suffered from over reclaim and
performance issues as a result of constant reclaim

You have also haven't explained why you do care so much about remote THP
while you do not care about remote base bages (the page allocator
falls back to those as soon as the kswapd doesn't keep pace with the
allocation rate; THP or high order pages in general is analoguous with
kcompactd doing a pro-active compaction). Like the base pages we do not
want larger pages to fallback to a remote node too easily. There is no
question about that I believe.

I can be convinced that larger pages really require a different behavior
than base pages but you should better show _real_ numbers on a wider
variety workloads to back your claims. I have only heard hand waving and
a very vague and quite doubtful numbers for a non-disclosed benchmark
without a clear indication on how it relates to real world workloads. So
color me unconvinced.
-- =

Michal Hocko
SUSE Labs

--===============5204003073493189528==--

