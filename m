Content-Type: multipart/mixed; boundary="===============5385074225356530698=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] 795ae7a0de: pixz.throughput -9.1% regression
Date: Fri, 03 Jun 2016 10:00:46 +0100
Message-ID: <20160603090046.GF2469@suse.de>
In-Reply-To: <20160602160706.GA24004@cmpxchg.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5385074225356530698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2016 at 12:07:06PM -0400, Johannes Weiner wrote:
> right before the test is running? I wonder if it's mostly filled with
> cache, and the increase in watermarks causes a higher portion of the
> anon allocs and frees to spill to the remote node, but never enough to
> enter the allocator slowpath and waking kswapd to fix it.
> =

> Another suspect is the fair zone allocator, whose allocation batches
> increased as well. It shouldn't affect NUMA placement, but I wonder if
> there is a bug in there that causes false spilling to foreign nodes
> that was only bounded by the allocation batch of the foreign zone.
> Mel, does such a symptom sound familiar in any way?
> =


Unfortunately not. The closest I've seen recently is bugs in the page
allocator patches that artifically enters the slow path prematurely but
that does not appear to apply here.

-- =

Mel Gorman
SUSE Labs

--===============5385074225356530698==--

