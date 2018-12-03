Content-Type: multipart/mixed; boundary="===============9016063131065320332=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 22:25:39 +0100
Message-ID: <20181203212539.GR31738@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812031237340.192288@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9016063131065320332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 03-12-18 12:39:34, David Rientjes wrote:
> On Mon, 3 Dec 2018, Michal Hocko wrote:
> =

> > I have merely said that a better THP locality needs more work and during
> > the review discussion I have even volunteered to work on that. There
> > are other reclaim related fixes under work right now. All I am saying
> > is that MADV_TRANSHUGE having numa locality implications cannot satisfy
> > all the usecases and it is particurarly KVM that suffers from it.
> =

> I think extending functionality so thp can be allocated remotely if truly =

> desired is worthwhile

This is a complete NUMA policy antipatern that we have for all other
user memory allocations. So far you have to be explicit for your numa
requirements. You are trying to conflate NUMA api with MADV and that is
just conflating two orthogonal things and that is just wrong.

Let's put the __GFP_THISNODE issue aside. I do not remember you
confirming that __GFP_COMPACT_ONLY patch is OK for you (sorry it might
got lost in the emails storm from back then) but if that is the only
agreeable solution for now then I can live with that. __GFP_NORETRY hack
was shown to not work properly by Mel AFAIR. Again if I misremember then
I am sorry and I can live with that. But conflating MADV_TRANSHUGE with
an implicit numa placement policy and/or adding an opt-in for remote
NUMA placing is completely backwards and a broken API which will likely
bites us later. I sincerely hope we are not going to repeat mistakes
from the past.
-- =

Michal Hocko
SUSE Labs

--===============9016063131065320332==--

