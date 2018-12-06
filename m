Content-Type: multipart/mixed; boundary="===============2651872745987989235=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: MADV_HUGEPAGE vs. NUMA semantic (was: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression)
Date: Thu, 06 Dec 2018 15:49:04 -0800
Message-ID: <alpine.DEB.2.21.1812061544360.162675@chino.kir.corp.google.com>
In-Reply-To: <20181206091405.GD1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2651872745987989235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Dec 2018, Michal Hocko wrote:

> MADV_HUGEPAGE changes the picture because the caller expressed a need
> for THP and is willing to go extra mile to get it. That involves
> allocation latency and as of now also a potential remote access. We do
> not have complete agreement on the later but the prevailing argument is
> that any strong NUMA locality is just reinventing node-reclaim story
> again or makes THP success rate down the toilet (to quote Mel). I agree
> that we do not want to fallback to a remote node overeagerly. I believe
> that something like the below would be sensible
> 	1) THP on a local node with compaction not giving up too early
> 	2) THP on a remote node in NOWAIT mode - so no direct
> 	   compaction/reclaim (trigger kswapd/kcompactd only for
> 	   defrag=3Ddefer+madvise)
> 	3) fallback to the base page allocation
> =


I disagree that MADV_HUGEPAGE should take on any new semantic that =

overrides the preference of node local memory for a hugepage, which is the =

nearly four year behavior.  The order of MADV_HUGEPAGE preferences listed =

above would cause current users to regress who rely on local small page =

fallback rather than remote hugepages because the access latency is much =

better.  I think the preference of remote hugepages over local small pages =

needs to be expressed differently to prevent regression.

--===============2651872745987989235==--

