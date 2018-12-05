Content-Type: multipart/mixed; boundary="===============1927351598449920265=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 11:49:26 -0800
Message-ID: <alpine.DEB.2.21.1812051142040.240991@chino.kir.corp.google.com>
In-Reply-To: <20181205090554.GX1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1927351598449920265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Michal Hocko wrote:

> > The revert is certainly needed to prevent the regression, yes, but I =

> > anticipate that Andrea will report back that patch 2 at least improves =
the =

> > situation for the problem that he was addressing, specifically that it =
is =

> > pointless to thrash any node or reclaim unnecessarily when compaction h=
as =

> > already failed.  This is what setting __GFP_NORETRY for all thp fault =

> > allocations fixes.
> =

> Yes but earlier numbers from Mel and repeated again [1] simply show
> that the swap storms are only handled in favor of an absolute drop of
> THP success rate.
>  =


As we've been over countless times, this is the desired effect for =

workloads that fit on a single node.  We want local pages of the native =

page size because they (1) are accessed faster than remote hugepages and =

(2) are candidates for collapse by khugepaged.

For applications that do not fit in a single node, we have discussed =

possible ways to extend the API to allow remote faulting of hugepages, =

absent remote fragmentation as well, then the long-standing behavior is =

preserved and large applications can use the API to increase their thp =

success rate.

> Yes, this is understood. So we are getting worst of both. We have a
> numa locality side effect of MADV_HUGEPAGE and we have a poor THP
> utilization. So how come this is an improvement. Especially when the
> reported regression hasn't been demonstrated on a real or repeatable
> workload but rather a very vague presumably worst case behavior where
> the access penalty is absolutely prevailing.
> =


High thp utilization is not always better, especially when those hugepages =

are accessed remotely and introduce the regressions that I've reported.  =

Seeking high thp utilization at all costs is not the goal if it causes =

workloads to regress.

--===============1927351598449920265==--

