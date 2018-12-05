Content-Type: multipart/mixed; boundary="===============2843774304934712885=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 16:45:42 -0500
Message-ID: <20181205214542.GC11899@redhat.com>
In-Reply-To: <alpine.DEB.2.21.1812051142040.240991@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2843774304934712885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 11:49:26AM -0800, David Rientjes wrote:
> High thp utilization is not always better, especially when those hugepage=
s =

> are accessed remotely and introduce the regressions that I've reported.  =

> Seeking high thp utilization at all costs is not the goal if it causes =

> workloads to regress.

Is it possible what you need is a defrag=3Dcompactonly_thisnode to set
instead of the default defrag=3Dmadvise? The fact you seem concerned
about page fault latencies doesn't make your workload an obvious
candidate for MADV_HUGEPAGE to begin with. At least unless you decide
to smooth the MADV_HUGEPAGE behavior with an mbind that will simply
add __GFP_THISNODE to the allocations, perhaps you'll be even faster
if you invoke reclaim in the local node for 4k allocations too.

It looks like for your workload THP is a nice to have add-on, which is
practically true of all workloads (with a few corner cases that must
use MADV_NOHUGEPAGE), and it's what the defrag=3D default is about.

Is it possible that you just don't want to shut off completely
compaction in the page fault and if you're ok to do it for your
library, you may be ok with that for all other apps too?

That's a different stance from other MADV_HUGEPAGE users because you
don't seem to mind a severely crippled THP utilization in your
app.

With your patch the utilization will go down a lot compared to the
previous __GFP_THISNODE swap storm capable and you're still very fine
with that. The fact you're fine with that points in the direction of
changing the default tuning for defrag=3D to something stronger than
madvise (that is precisely the default setting that is forcing you to
use MADV_HUGEPAGE to get a chance to get some THP once a in a while
during the page fault, after some uptime).

Considering mbind surprisingly isn't privileged (so I suppose it may
cause swap storms equivalent to __GFP_THISNODE if maliciously used
after all) you could even consider a defrag=3Dthisnode to force
compaction+defrag local to the node to retain your THP+NUMA dynamic
partitioning behavior that ends up swappin heavy in the local node.

--===============2843774304934712885==--

