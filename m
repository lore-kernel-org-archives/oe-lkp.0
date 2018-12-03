Content-Type: multipart/mixed; boundary="===============3100121006476326758=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 13:53:21 -0800
Message-ID: <alpine.DEB.2.21.1812031345180.224765@chino.kir.corp.google.com>
In-Reply-To: <20181203212539.GR31738@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3100121006476326758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Dec 2018, Michal Hocko wrote:

> > I think extending functionality so thp can be allocated remotely if tru=
ly =

> > desired is worthwhile
> =

> This is a complete NUMA policy antipatern that we have for all other
> user memory allocations. So far you have to be explicit for your numa
> requirements. You are trying to conflate NUMA api with MADV and that is
> just conflating two orthogonal things and that is just wrong.
> =


No, the page allocator change for both my patch and __GFP_COMPACT_ONLY has =

nothing to do with any madvise() mode.  It has to do with where thp =

allocations are preferred.  Yes, this is different than other memory =

allocations where it doesn't cause a 13.9% access latency regression for =

the lifetime of a binary for users who back their text with hugepages.  =

MADV_HUGEPAGE still has its purpose to try synchronous memory compaction =

at fault time under all thp defrag modes other than "never".  The specific =

problem being reported here, and that both my patch and __GFP_COMPACT_ONLY =

address, is the pointless reclaim activity that does not assist in making =

compaction more successful.

> Let's put the __GFP_THISNODE issue aside. I do not remember you
> confirming that __GFP_COMPACT_ONLY patch is OK for you (sorry it might
> got lost in the emails storm from back then) but if that is the only
> agreeable solution for now then I can live with that.

The discussion between my patch and Andrea's patch seemed to only be about =

whether this should be a gfp bit or not

> __GFP_NORETRY hack
> was shown to not work properly by Mel AFAIR. Again if I misremember then
> I am sorry and I can live with that.

Andrea's patch as posted in this thread sets __GFP_NORETRY for =

__GFP_ONLY_COMPACT, so both my patch and his patch require it.  His patch =

gets this behavior for page faults by way of alloc_pages_vma(), mine gets =

it from modifying GFP_TRANSHUGE.

> But conflating MADV_TRANSHUGE with
> an implicit numa placement policy and/or adding an opt-in for remote
> NUMA placing is completely backwards and a broken API which will likely
> bites us later. I sincerely hope we are not going to repeat mistakes
> from the past.

Assuming s/MADV_TRANSHUGE/MADV_HUGEPAGE/.  Again, this is *not* about the =

madvise(); it's specifically about the role of direct reclaim in the =

allocation of a transparent hugepage at fault time regardless of any =

madvise() because you can get the same behavior with defrag=3Dalways (and =

the inconsistent use of __GFP_NORETRY there that is fixed by both of our =

patches).

--===============3100121006476326758==--

