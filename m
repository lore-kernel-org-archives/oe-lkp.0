Content-Type: multipart/mixed; boundary="===============0991017782044443996=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Fri, 14 Dec 2018 12:32:41 +0100
Message-ID: <20181214113241.GC5343@dhcp22.suse.cz>
In-Reply-To: <20181212170016.GG1130@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0991017782044443996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 12-12-18 12:00:16, Andrea Arcangeli wrote:
[...]
> Adding MADV_THISNODE/MADV_NODE_RECLAIM, will guarantee his proprietary
> software binary will run at maximum performance without cache
> interference, and he's happy to accept the risk of massive slowdown in
> case the local node is truly OOM. The fallback, despite very
> inefficient, will still happen without OOM killer triggering.

I believe this fits much better into a MPOL_$FOO rather than MADV_$FOO.
But other than that I full agree. There are reasonable usecases for the
node reclaim like behavior. As a bonus you do not get local node only
but all nodes within reclaim distance as well.
-- =

Michal Hocko
SUSE Labs

--===============0991017782044443996==--

