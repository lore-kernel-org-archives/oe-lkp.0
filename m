Content-Type: multipart/mixed; boundary="===============5975520548217812166=="
MIME-Version: 1.0
From: Rik van Riel <riel@surriel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 09:51:51 -0400
Message-ID: <93308ea276cfe7997c29ce7132516e830e8fec40.camel@surriel.com>
In-Reply-To: <87lf9lqnit.fsf@yhuang6-desk1.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5975520548217812166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-14 at 16:27 +0800, Huang, Ying wrote:
> Yu Zhao <yuzhao@google.com> writes:
> =

> > On Wed, Apr 14, 2021 at 12:15 AM Huang, Ying <ying.huang@intel.com>
> > wrote:
> > > =

> > NUMA Optimization
> > -----------------
> > Support NUMA policies and per-node RSS counters.
> > =

> > We only can move forward one step at a time. Fair?
> =

> You don't need to implement that now definitely.  But we can discuss
> the
> possible solution now.

That was my intention, too. I want to make sure we don't
end up "painting ourselves into a corner" by moving in some
direction we have no way to get out of.

The patch set looks promising, but we need some plan to
avoid the worst case behaviors that forced us into rmap
based scanning initially.

> Note that it's possible that only some processes are bound to some
> NUMA
> nodes, while other processes aren't bound.

For workloads like PostgresQL or Oracle, it is common
to have maybe 70% of memory in a large shared memory
segment, spread between all the NUMA nodes, and mapped
into hundreds, if not thousands, of processes in the
system.

Now imagine we have an 8 node system, and memory
pressure in the DMA32 zone of node 0.

How will the current VM behave?

Wha
t will the virtual scanning need to do?

If we can come up with a solution to make virtual
scanning scale for that kind of workload, great.

If not ... if it turns out most of the benefits of
the multigeneratinal LRU framework come from sorting
the pages into multiple LRUs, and from being able
to easily reclaim unmapped pages before having to
scan mapped ones, could it be an idea to implement
that first, independently from virtual scanning?

I am all for improving
our page reclaim system, I
just want to make sure we don't revisit the old traps
that forced us where we are today :)

-- =

All Rights Reversed.

--===============5975520548217812166==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVLUjczcENDdEo1
WGozeUFEem5uZWtvVEUzb01GQW1CMjgzY0FDZ2tRem5uZWtvVEUKM29QSFRBZ0FpYlJqMjZEZzho
dWRiNFRiTmp6ZFVNV3hiY24wMXc2YktGQlhyZHZERitSMEw5R3BZRTVVamhhNwp4a2Vnb2N6Nlh5
VU5SVEh2ZnZMTDdaL0NzWmV6eGJlSm9lM1BJdlJMWjBEVjJMNVR4WUtGRGRxNUkrb2VZdUUyCmNS
cGs1aUU0ZXFaOGU5T0s1TlYydUZNQko5TS9zMWFqdkhMbFkzaXpOZlNBUFg4NnJqQU1GSTUwRGJv
SkNoTDUKK0FYQjNzMFFnbWc0VTlXbzl5eWVmVU5tYTNBQTl6TjhFOW1NZUtuSnVCc2ZWVDRTTHYr
RVp4SUlQYkxVUFYyNApiZDBiY2UyVTFCVmxiMVU2ZDRnSGdMRkRtVnJsS21IMU5LNE1vcFJRVTVz
UVNUWWxub2g1QklzSk85cHN0TkZwCkNCUDhUUVRxTWhXU0xEbnd2N3JCTVFvOFo1cHY5dz09Cj10
dlpCCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============5975520548217812166==--

