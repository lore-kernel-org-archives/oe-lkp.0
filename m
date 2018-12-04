Content-Type: multipart/mixed; boundary="===============1924289449510618578=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Tue, 04 Dec 2018 14:25:54 -0800
Message-ID: <alpine.DEB.2.21.1812041415270.159770@chino.kir.corp.google.com>
In-Reply-To: <20181204073850.GW31738@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1924289449510618578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Dec 2018, Michal Hocko wrote:

> > This fixes a 13.9% of remote memory access regression and 40% remote
> > memory allocation regression on Haswell when the local node is fragment=
ed
> > for hugepage sized pages and memory is being faulted with either the thp
> > defrag setting of "always" or has been madvised with MADV_HUGEPAGE.
> > =

> > The usecase that initially identified this issue were binaries that mre=
map
> > their .text segment to be backed by transparent hugepages on startup.
> > They do mmap(), madvise(MADV_HUGEPAGE), memcpy(), and mremap().
> =

> Do you have something you can share with so that other people can play
> and try to reproduce?
> =


This is a single MADV_HUGEPAGE usecase, there is nothing special about it.  =

It would be the same as if you did mmap(), madvise(MADV_HUGEPAGE), and =

faulted the memory with a fragmented local node and then measured the =

remote access latency to the remote hugepage that occurs without setting =

__GFP_THISNODE.  You can also measure the remote allocation latency by =

fragmenting the entire system and then faulting.

(Remapping the text segment only involves parsing /proc/self/exe, mmap, =

madvise, memcpy, and mremap.)

> > This requires a full revert and partial revert of commits merged during
> > the 4.20 rc cycle.  The full revert, of ac5b2c18911f ("mm: thp: relax
> > __GFP_THISNODE for MADV_HUGEPAGE mappings"), was anticipated to fix lar=
ge
> > amounts of swap activity on the local zone when faulting hugepages by
> > falling back to remote memory.  This remote allocation causes the access
> > regression and, if fragmented, the allocation regression.
> =

> Have you tried to measure any of the workloads Mel and Andrea have
> pointed out during the previous review discussion? In other words what
> is the impact on the THP success rate and allocation latencies for other
> usecases?

It isn't a property of the workload, it's a property of the how fragmented =

both local and remote memory is.  In Andrea's case, I believe he has =

stated that memory compaction has failed locally and the resulting reclaim =

activity ends up looping and causing it the thrash the local node whereas =

75% of remote memory is free and not fragmented.  So we have local =

fragmentation and reclaim is very expensive to enable compaction to =

succeed, if it ever does succeed[*], and mostly free remote memory.

If remote memory is also fragmented, Andrea's case will run into a much =

more severe swap storm as a result of not setting __GFP_THISNODE.  The =

premise of the entire change is that his remote memory is mostly free so =

fallback results in a quick allocation.  For balanced nodes, that's not =

going to be the case.  The fix to prevent the heavy reclaim activity is to =

set __GFP_NORETRY as the page allocator suspects, which patch 2 here does.

That's an interesting memory state to

 [*] Reclaim here would only be beneficial if we fail the order-0 =

     watermark check in __compaction_suitable() *and* the reclaimed
     memory can be accessed during isolate_freepages().

--===============1924289449510618578==--

