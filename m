Content-Type: multipart/mixed; boundary="===============2314615889976767423=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Sun, 09 Dec 2018 14:44:23 -0800
Message-ID: <alpine.DEB.2.21.1812091420350.95551@chino.kir.corp.google.com>
In-Reply-To: <20181206003126.GA21159@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2314615889976767423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Andrea Arcangeli wrote:

> > I've must have said this at least six or seven times: fault latency is =

> =

> In your original regression report in this thread to Linus:
> =

> https://lkml.kernel.org/r/alpine.DEB.2.21.1811281504030.231719(a)chino.ki=
r.corp.google.com
> =

> you said "On a fragmented host, the change itself showed a 13.9%
> access latency regression on Haswell and up to 40% allocation latency
>                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> regression. This is more substantial on Naples and Rome.  I also
> ^^^^^^^^^^
> measured similar numbers to this for Haswell."
> =

> > secondary to the *access* latency.  We want to try hard for MADV_HUGEPA=
GE =

> > users to do synchronous compaction and try to make a hugepage available=
.  =

> =

> I'm glad you said it six or seven times now, because you forgot to
> mention in the above email that the "40% allocation/fault latency
> regression" you reported above, is actually a secondary concern because
> those must be long lived allocations and we can't yet generate
> compound pages for free after all..
> =


I've been referring to the long history of this discussion, namely my =

explicit Nacked-by in https://marc.info/?l=3Dlinux-kernel&m=3D1538684201267=
75 =

two months ago stating the 13.9% access latency regression.  The patch was =

nonetheless still merged and I proposed the revert for the same chief =

complaint, and it was reverted.

I brought up the access latency issue three months ago in
https://marc.info/?l=3Dlinux-kernel&m=3D153661012118046 and said allocation =

latency was a secondary concern, specifically that our users of =

MADV_HUGEPAGE are willing to accept the increased allocation latency for =

local hugepages.

> BTW, I never bothered to ask yet, but, did you enable NUMA balancing
> in your benchmarks? NUMA balancing would fix the access latency very
> easily too, so that 13.9% access latency must quickly disappear if you
> correctly have NUMA balancing enabled in a NUMA system.
> =


No, we do not have CONFIG_NUMA_BALANCING enabled.  The __GFP_THISNODE =

behavior for hugepages was added in 4.0 for the PPC usecase, not by me.  =

That had nothing to do with the madvise mode: the initial documentation =

referred to the mode as a way to prevent an increase in rss for configs =

where "enabled" was set to madvise.  The allocation policy was never about =

MADV_HUGEPAGE in any 4.x kernel, it was only an indication for certain =

defrag settings to determine how much work should be done to allocate =

*local* hugepages at fault.

If you are saying that the change in allocator policy in a patch from =

Aneesh almost four years ago and has gone unreported by anybody up until a =

few months ago, I can understand the frustration.  I do, however, support =

the __GFP_THISNODE change he made because his data shows the same results =

as mine.

I've suggested a very simple extension, specifically a prctl() mode that =

is inherited across fork, that would allow a workload to specify that it =

prefers remote allocations over local compaction/reclaim because it is too =

large to fit on a single node.  I'd value your feedback for that =

suggestion to fix your usecase.

--===============2314615889976767423==--

