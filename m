Content-Type: multipart/mixed; boundary="===============5968712895687225087=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 14:10:47 -0800
Message-ID: <alpine.DEB.2.21.1812051402150.9633@chino.kir.corp.google.com>
In-Reply-To: <20181205214542.GC11899@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5968712895687225087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Andrea Arcangeli wrote:

> > High thp utilization is not always better, especially when those hugepa=
ges =

> > are accessed remotely and introduce the regressions that I've reported.=
  =

> > Seeking high thp utilization at all costs is not the goal if it causes =

> > workloads to regress.
> =

> Is it possible what you need is a defrag=3Dcompactonly_thisnode to set
> instead of the default defrag=3Dmadvise? The fact you seem concerned
> about page fault latencies doesn't make your workload an obvious
> candidate for MADV_HUGEPAGE to begin with. At least unless you decide
> to smooth the MADV_HUGEPAGE behavior with an mbind that will simply
> add __GFP_THISNODE to the allocations, perhaps you'll be even faster
> if you invoke reclaim in the local node for 4k allocations too.
> =


I've must have said this at least six or seven times: fault latency is =

secondary to the *access* latency.  We want to try hard for MADV_HUGEPAGE =

users to do synchronous compaction and try to make a hugepage available.  =

We really want to be backed by hugepages, but certainly not when the =

access latency becomes 13.9% worse as a result compared to local pages of =

the native page size.

This is not a system-wide configuration detail, it is specific to the =

workload: does it span more than one node or not?  No workload that can =

fit into a single node, which you also say is going to be the majority of =

workloads on today's platforms, is going to want to revert __GFP_THISNODE =

behavior of the past almost four years.  It perfectly makes sense, =

however, to be a new mempolicy mode, a new madvise mode, or a prctl.

> It looks like for your workload THP is a nice to have add-on, which is
> practically true of all workloads (with a few corner cases that must
> use MADV_NOHUGEPAGE), and it's what the defrag=3D default is about.
> =

> Is it possible that you just don't want to shut off completely
> compaction in the page fault and if you're ok to do it for your
> library, you may be ok with that for all other apps too?
> =


We enable synchronous compaction for MADV_HUGEPAGE users, yes, because we =

are not concerned with the fault latency but rather the access latency.

> That's a different stance from other MADV_HUGEPAGE users because you
> don't seem to mind a severely crippled THP utilization in your
> app.
> =


If access latency is really better for local pages of the native page =

size, we of course want to fault those instead.  For almost the past four =

years, the behavior of MADV_HUGEPAGE has been to compact and possibly =

reclaim locally and then fallback to local pages.  It is exactly what our =

users of MADV_HUGEPAGE want; I did not introduce this NUMA locality =

restriction but our users have used it.

Please: if we wish to change behavior from February 2015, let's extend the =

API to allow for remote allocations in several of the ways we have already =

brainstormed rather than cause regressions.

--===============5968712895687225087==--

