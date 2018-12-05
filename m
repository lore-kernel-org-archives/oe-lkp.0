Content-Type: multipart/mixed; boundary="===============4284577032166871582=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 13:14:37 -0800
Message-ID: <alpine.DEB.2.21.1812051308330.9633@chino.kir.corp.google.com>
In-Reply-To: <20181205203243.GX1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4284577032166871582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Michal Hocko wrote:

> > As we've been over countless times, this is the desired effect for =

> > workloads that fit on a single node.  We want local pages of the native =

> > page size because they (1) are accessed faster than remote hugepages an=
d =

> > (2) are candidates for collapse by khugepaged.
> > =

> > For applications that do not fit in a single node, we have discussed =

> > possible ways to extend the API to allow remote faulting of hugepages, =

> > absent remote fragmentation as well, then the long-standing behavior is =

> > preserved and large applications can use the API to increase their thp =

> > success rate.
> =

> OK, I just give up. This doesn't lead anywhere. You keep repeating the
> same stuff over and over, neglect other usecases and actually force them
> to do something special just to keep your very specific usecase which
> you clearly refuse to abstract into a form other people can experiment
> with or at least provide more detailed broken down numbers for a more
> serious analyses. Fault latency is only a part of the picture which is
> much more complex. Look at Mel's report to get an impression of what
> might be really useful for a _productive_ discussion.

The other usecases is part of patch 2/2 in this series that is =

functionally similar to the __GFP_COMPACT_ONLY patch that Andrea proposed.  =

We can also work to extend the API to allow remote thp allocations.

Patch 1/2 reverts the behavior of commit ac5b2c18911f ("mm: thp: relax =

__GFP_THISNODE for MADV_HUGEPAGE mappings") which added NUMA locality on =

top of an already conflated madvise mode.  Prior to this commit that was =

merged for 4.20, *all* thp faults were constrained to the local node; this =

has been the case for three years and even prior to that in other kernels.  =

It turns out that allowing remote allocations introduces access latency in =

the presence of local fragmentation.

The solution is not to conflate MADV_HUGEPAGE with any sematic that =

suggests it allows remote thp allocations, especially when that changes =

long-standing behavior, regresses my usecase, and regresses the kernel =

test robot.

I'll change patch 1/2 to not touch new_page() so that we are only =

addressing thp faults and post a v2.

--===============4284577032166871582==--

