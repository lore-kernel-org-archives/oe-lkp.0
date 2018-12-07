Content-Type: multipart/mixed; boundary="===============8679962059081920524=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: MADV_HUGEPAGE vs. NUMA semantic (was: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression)
Date: Fri, 07 Dec 2018 08:34:44 +0100
Message-ID: <20181207073444.GQ1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812061544360.162675@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8679962059081920524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 06-12-18 15:49:04, David Rientjes wrote:
> On Thu, 6 Dec 2018, Michal Hocko wrote:
> =

> > MADV_HUGEPAGE changes the picture because the caller expressed a need
> > for THP and is willing to go extra mile to get it. That involves
> > allocation latency and as of now also a potential remote access. We do
> > not have complete agreement on the later but the prevailing argument is
> > that any strong NUMA locality is just reinventing node-reclaim story
> > again or makes THP success rate down the toilet (to quote Mel). I agree
> > that we do not want to fallback to a remote node overeagerly. I believe
> > that something like the below would be sensible
> > 	1) THP on a local node with compaction not giving up too early
> > 	2) THP on a remote node in NOWAIT mode - so no direct
> > 	   compaction/reclaim (trigger kswapd/kcompactd only for
> > 	   defrag=3Ddefer+madvise)
> > 	3) fallback to the base page allocation
> > =

> =

> I disagree that MADV_HUGEPAGE should take on any new semantic that =

> overrides the preference of node local memory for a hugepage, which is th=
e =

> nearly four year behavior.  The order of MADV_HUGEPAGE preferences listed =

> above would cause current users to regress who rely on local small page =

> fallback rather than remote hugepages because the access latency is much =

> better.  I think the preference of remote hugepages over local small page=
s =

> needs to be expressed differently to prevent regression.

Such a model would be broken. It doesn't provide consistent semantic and
leads to surprising results. MADV_HUGEPAGE with local node binding will
not prevent remote base pages to be used and you are back to square one.

It has been a huge mistake to merge your __GFP_THISNODE patch back then
in 4.1. Especially with an absolute lack of numbers for a variety of
workloads. I still believe we can do better, offer a sane mem policy to
help workloads with higher locality demands but it is outright wrong
to confalte demand for THP with the locality semantic.

If this is absolutely no go then we need a MADV_HUGEPAGE_SANE...

-- =

Michal Hocko
SUSE Labs

--===============8679962059081920524==--

