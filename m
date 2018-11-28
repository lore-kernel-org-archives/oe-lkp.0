Content-Type: multipart/mixed; boundary="===============5781633364617213184=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 28 Nov 2018 07:30:40 +0100
Message-ID: <20181128063040.GF6923@dhcp22.suse.cz>
In-Reply-To: <CAHk-=wiEUPBzAOPkH1aHypnxW6+vVtmCw_vsOPgNZtOvQnrG8w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5781633364617213184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 27-11-18 14:50:05, Linus Torvalds wrote:
> On Tue, Nov 27, 2018 at 12:57 PM Andrea Arcangeli <aarcange@redhat.com>=
 wrote:
> >
> > This difference can only happen with defrag=3Dalways, and that's not the
> > current upstream default.
> =

> Ok, thanks. That makes it a bit less critical.
> =

> > That MADV_HUGEPAGE causes flights with NUMA balancing is not great
> > indeed, qemu needs NUMA locality too, but then the badness caused by
> > __GFP_THISNODE was a larger regression in the worst case for qemu.
> [...]
> > So the short term alternative again would be the alternate patch that
> > does __GFP_THISNODE|GFP_ONLY_COMPACT appended below.
> =

> Sounds like we should probably do this. Particularly since Vlastimil
> pointed out that we'd otherwise have issues with the back-port for 4.4
> where that "defrag=3Dalways" was the default.
> =

> The patch doesn't look horrible, and it directly addresses this
> particular issue.
> =

> Is there some reason we wouldn't want to do it?

We have discussed it previously and the biggest concern was that it
introduces a new GFP flag with a very weird and one-off semantic.
Anytime we have done that in the past it basically kicked back because
people have started to use such a flag and any further changes were
really hard to do. So I would really prefer some more systematic
solution. And I believe we can do that here. MADV_HUGEPAGE (resp. THP
always enabled) has gained a local memory policy with the patch which
got effectively reverted. I do believe that conflating "I want THP" with
"I want them local" is just wrong from the API point of view. There are
different classes of usecases which obviously disagree on the later.

So I believe that a long term solution should introduce a
MPOL_NODE_RECLAIM kind of policy. It would effectively reclaim local
nodes (within NODE_RECLAIM distance) before falling to other nodes.

Apart from that we need a less disruptive reclaim driven by compaction
and Mel is already working on that AFAIK.
-- =

Michal Hocko
SUSE Labs

--===============5781633364617213184==--

