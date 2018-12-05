Content-Type: multipart/mixed; boundary="===============8257031616780674935=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 21:32:43 +0100
Message-ID: <20181205203243.GX1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812051142040.240991@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8257031616780674935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 05-12-18 11:49:26, David Rientjes wrote:
> On Wed, 5 Dec 2018, Michal Hocko wrote:
> =

> > > The revert is certainly needed to prevent the regression, yes, but I =

> > > anticipate that Andrea will report back that patch 2 at least improve=
s the =

> > > situation for the problem that he was addressing, specifically that i=
t is =

> > > pointless to thrash any node or reclaim unnecessarily when compaction=
 has =

> > > already failed.  This is what setting __GFP_NORETRY for all thp fault =

> > > allocations fixes.
> > =

> > Yes but earlier numbers from Mel and repeated again [1] simply show
> > that the swap storms are only handled in favor of an absolute drop of
> > THP success rate.
> >  =

> =

> As we've been over countless times, this is the desired effect for =

> workloads that fit on a single node.  We want local pages of the native =

> page size because they (1) are accessed faster than remote hugepages and =

> (2) are candidates for collapse by khugepaged.
> =

> For applications that do not fit in a single node, we have discussed =

> possible ways to extend the API to allow remote faulting of hugepages, =

> absent remote fragmentation as well, then the long-standing behavior is =

> preserved and large applications can use the API to increase their thp =

> success rate.

OK, I just give up. This doesn't lead anywhere. You keep repeating the
same stuff over and over, neglect other usecases and actually force them
to do something special just to keep your very specific usecase which
you clearly refuse to abstract into a form other people can experiment
with or at least provide more detailed broken down numbers for a more
serious analyses. Fault latency is only a part of the picture which is
much more complex. Look at Mel's report to get an impression of what
might be really useful for a _productive_ discussion.
-- =

Michal Hocko
SUSE Labs

--===============8257031616780674935==--

