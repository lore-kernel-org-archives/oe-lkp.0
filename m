Content-Type: multipart/mixed; boundary="===============6980359063370097502=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 19:14:56 +0100
Message-ID: <20181203181456.GK31738@dhcp22.suse.cz>
In-Reply-To: <CAHk-=wjgpWOA7zQ9H5=Zj6KQijm5CBXZc7J=it6C5gdEV0hb5Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6980359063370097502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 03-12-18 10:01:18, Linus Torvalds wrote:
> On Wed, Nov 28, 2018 at 8:48 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, Nov 27, 2018 at 7:20 PM Huang, Ying <ying.huang@intel.com> wr=
ote:
> > >
> > > In general, memory allocation fairness among processes should be a go=
od
> > > thing.  So I think the report should have been a "performance
> > > improvement" instead of "performance regression".
> >
> > Hey, when you put it that way...
> >
> > Let's ignore this issue for now, and see if it shows up in some real
> > workload and people complain.
> =

> Well, David Rientjes points out that it *does* cause real problems in
> real workloads, so it's not just this benchmark run that shows the
> issue.

The thing is that there is no universal win here. There are two
different types of workloads and we cannot satisfy both. This has been
discussed at lenght during the review process. David's workload makes
some assumptions about the MADV_HUGEPAGE numa placement. There are other
workalods like KVM setups which do not really require that and those are
ones which regressed.

The prevalent consensus was that a NUMA placement is not really implied
by MADV_HUGEPAGE because a) this has never been documented or intended
behavior and b) it is not a universal win (basically the same as
node/zone_reclaim which used to be on by default on some NUMA setups).

Reverting the patch would regress another class of workloads. As we
cannot satisfy both I believe we should make the API clear and in favor
of a more relaxed workloads. Those with special requirements should have
a proper API to reflect that (this is our general NUMA policy pattern
already).
-- =

Michal Hocko
SUSE Labs

--===============6980359063370097502==--

