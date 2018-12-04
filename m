Content-Type: multipart/mixed; boundary="===============1043004705669419474=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Tue, 04 Dec 2018 08:38:50 +0100
Message-ID: <20181204073850.GW31738@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812031545080.161134@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1043004705669419474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 03-12-18 15:50:18, David Rientjes wrote:
> This fixes a 13.9% of remote memory access regression and 40% remote
> memory allocation regression on Haswell when the local node is fragmented
> for hugepage sized pages and memory is being faulted with either the thp
> defrag setting of "always" or has been madvised with MADV_HUGEPAGE.
> =

> The usecase that initially identified this issue were binaries that mremap
> their .text segment to be backed by transparent hugepages on startup.
> They do mmap(), madvise(MADV_HUGEPAGE), memcpy(), and mremap().

Do you have something you can share with so that other people can play
and try to reproduce?

> This requires a full revert and partial revert of commits merged during
> the 4.20 rc cycle.  The full revert, of ac5b2c18911f ("mm: thp: relax
> __GFP_THISNODE for MADV_HUGEPAGE mappings"), was anticipated to fix large
> amounts of swap activity on the local zone when faulting hugepages by
> falling back to remote memory.  This remote allocation causes the access
> regression and, if fragmented, the allocation regression.

Have you tried to measure any of the workloads Mel and Andrea have
pointed out during the previous review discussion? In other words what
is the impact on the THP success rate and allocation latencies for other
usecases?
-- =

Michal Hocko
SUSE Labs

--===============1043004705669419474==--

