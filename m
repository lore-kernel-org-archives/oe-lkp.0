Content-Type: multipart/mixed; boundary="===============1163170855751955649=="
MIME-Version: 1.0
From: Rik van Riel <riel@surriel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Tue, 13 Apr 2021 22:29:44 -0400
Message-ID: <f4750f9431bd12b7338a47925de8b17015da51a7.camel@surriel.com>
In-Reply-To: <20210413231436.GF63242@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============1163170855751955649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-14 at 09:14 +1000, Dave Chinner wrote:
> On Tue, Apr 13, 2021 at 10:13:24AM -0600, Jens Axboe wrote:
> =

> > The initial posting of this patchset did no better, in fact it did
> > a bit
> > worse. Performance dropped to the same levels and kswapd was using
> > as
> > much CPU as before, but on top of that we also got excessive
> > swapping.
> > Not at a high rate, but 5-10MB/sec continually.
> > =

> > I had some back and forths with Yu Zhao and tested a few new
> > revisions,
> > and the current series does much better in this regard. Performance
> > still dips a bit when page cache fills, but not nearly as much, and
> > kswapd is using less CPU than before.
> =

> Profiles would be interesting, because it sounds to me like reclaim
> *might* be batching page cache removal better (e.g. fewer, larger
> batches) and so spending less time contending on the mapping tree
> lock...
> =

> IOWs, I suspect this result might actually be a result of less lock
> contention due to a change in batch processing characteristics of
> the new algorithm rather than it being a "better" algorithm...

That seems quite likely to me, given the issues we have
had with virtual scan reclaim algorithms in the past.

SeongJae, what is this algorithm supposed to do when faced
with situations like this:
1) Running on a system with 8 NUMA nodes, and
memory
   pressure in one of those nodes.
2) Running PostgresQL or Oracle, with hundreds of
   processes mapping the same (very large) shared
   memory segment.

How do you keep your algorithm from falling into the worst
case virtual scanning scenarios that were crippling the
2.4 kernel 15+ years ago on systems with just a few GB of
memory?

-- =

All Rights Reversed.

--===============1163170855751955649==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ0FBZEZpRUVLUjczcENDdEo1
WGozeUFEem5uZWtvVEUzb01GQW1CMlU1Z0FDZ2tRem5uZWtvVEUKM29QeE5nZ0FyV0FnM0JLakZO
RkNxVjZobVJKY1BiOE9pVFVVN002dXBjTWRTbytxVHQ1aXZQYlIxb3FuSENjNAo5QjQxTEZ3T2hL
NGpjMkxUaHRlNmJzU1ZMM0drUFRpYTlSQzVvWG91b1Vpd0pkcDU2dmhjNmZGbldjWHFqSlRKCk0y
RThtdTRpSktxN25ER1lxei93MjEyUEI5M3FEZnl2MDBuZXdtVUZ5YktqNlZhSm9KZjJpUjdXTGpw
VTR3aksKU05YSmN0MjFRTzdBZnRESFBHWXNYbVNxVks0dlFyb2RGMGI5UGw1Q1Z2ZmlkYS9TSmsw
ZGE3NjJhOVI4S3dxRgpwSUJXVm1HTkJEN3BaV3A3eHd2WWZmME9uSXQvNW40M08yWmRPaEtPd1Jh
NkgyakVkYUFCM0l2c1FTa25CVEpGCkZPKzZtYm1Cc2NBUDNqd2xiSGYyRGRkY2daS2g1QT09Cj0w
WWFkCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1163170855751955649==--

