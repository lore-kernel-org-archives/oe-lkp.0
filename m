Content-Type: multipart/mixed; boundary="===============6626593010751627708=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 08:40:52 +0100
Message-ID: <20181205074052.GU1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812041415270.159770@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6626593010751627708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 04-12-18 14:25:54, David Rientjes wrote:
> On Tue, 4 Dec 2018, Michal Hocko wrote:
> =

> > > This fixes a 13.9% of remote memory access regression and 40% remote
> > > memory allocation regression on Haswell when the local node is fragme=
nted
> > > for hugepage sized pages and memory is being faulted with either the =
thp
> > > defrag setting of "always" or has been madvised with MADV_HUGEPAGE.
> > > =

> > > The usecase that initially identified this issue were binaries that m=
remap
> > > their .text segment to be backed by transparent hugepages on startup.
> > > They do mmap(), madvise(MADV_HUGEPAGE), memcpy(), and mremap().
> > =

> > Do you have something you can share with so that other people can play
> > and try to reproduce?
> > =

> =

> This is a single MADV_HUGEPAGE usecase, there is nothing special about it=
.  =

> It would be the same as if you did mmap(), madvise(MADV_HUGEPAGE), and =

> faulted the memory with a fragmented local node and then measured the =

> remote access latency to the remote hugepage that occurs without setting =

> __GFP_THISNODE.  You can also measure the remote allocation latency by =

> fragmenting the entire system and then faulting.
> =

> (Remapping the text segment only involves parsing /proc/self/exe, mmap, =

> madvise, memcpy, and mremap.)

How does this reflect your real workload and regressions in it. It
certainly shows the worst case behavior where the access penalty is
prevalent while there are no other metrics which might be interesting or
even important. E.g. page table savings or the TLB pressure in general
when THP fail too eagerly.
As Anrea mentioned there are really valid cases where the remote latency
pays off.

Have you actually seen the advertised regression in the real workload
and do you have any means to simulate that workload.

> > > This requires a full revert and partial revert of commits merged duri=
ng
> > > the 4.20 rc cycle.  The full revert, of ac5b2c18911f ("mm: thp: relax
> > > __GFP_THISNODE for MADV_HUGEPAGE mappings"), was anticipated to fix l=
arge
> > > amounts of swap activity on the local zone when faulting hugepages by
> > > falling back to remote memory.  This remote allocation causes the acc=
ess
> > > regression and, if fragmented, the allocation regression.
> > =

> > Have you tried to measure any of the workloads Mel and Andrea have
> > pointed out during the previous review discussion? In other words what
> > is the impact on the THP success rate and allocation latencies for other
> > usecases?
> =

> It isn't a property of the workload, it's a property of the how fragmente=
d =

> both local and remote memory is.  In Andrea's case, I believe he has =

> stated that memory compaction has failed locally and the resulting reclai=
m =

> activity ends up looping and causing it the thrash the local node whereas =

> 75% of remote memory is free and not fragmented.  So we have local =

> fragmentation and reclaim is very expensive to enable compaction to =

> succeed, if it ever does succeed[*], and mostly free remote memory.
> =

> If remote memory is also fragmented, Andrea's case will run into a much =

> more severe swap storm as a result of not setting __GFP_THISNODE.  The =

> premise of the entire change is that his remote memory is mostly free so =

> fallback results in a quick allocation.  For balanced nodes, that's not =

> going to be the case.  The fix to prevent the heavy reclaim activity is t=
o =

> set __GFP_NORETRY as the page allocator suspects, which patch 2 here does.

You are not answering my question and I take it as you haven't actually
tested this in a variety of workload and base your assumptions on an
artificial worst case scenario. Please correct me if I am wrong.

-- =

Michal Hocko
SUSE Labs

--===============6626593010751627708==--

