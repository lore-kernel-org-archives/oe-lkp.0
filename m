Content-Type: multipart/mixed; boundary="===============1808674226866207402=="
MIME-Version: 1.0
From: David Laight <David.Laight@ACULAB.COM>
To: lkp@lists.01.org
Subject: Re: rhashtable: ENOMEM errors when hit with a flood of insertions
Date: Thu, 03 Dec 2015 15:08:20 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6D1CBE32C4@AcuExch.aculab.com>
In-Reply-To: <20151203125117.GB5505@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============1808674226866207402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Herbert Xu
> Sent: 03 December 2015 12:51
> On Mon, Nov 30, 2015 at 06:18:59PM +0800, Herbert Xu wrote:
> >
> > OK that's better.  I think I see the problem.  The test in
> > rhashtable_insert_rehash is racy and if two threads both try
> > to grow the table one of them may be tricked into doing a rehash
> > instead.
> >
> > I'm working on a fix.
> =

> While the EBUSY errors are gone for me, I can still see plenty
> of ENOMEM errors.  In fact it turns out that the reason is quite
> understandable.  When you pound the rhashtable hard so that it
> doesn't actually get a chance to grow the table in process context,
> then the table will only grow with GFP_ATOMIC allocations.
> =

> For me this starts failing regularly at around 2^19 entries, which
> requires about 1024 contiguous pages if I'm not mistaken.

ISTM that you should always let the insert succeed - even if it makes
the average/maximum chain length increase beyond some limit.
Any limit on the number of hashed items should have been done earlier
by the calling code.
The slight performance decrease caused by scanning longer chains
is almost certainly more 'user friendly' than an error return.

Hoping to get 1024+ contiguous VA pages does seem over-optimistic.

With a 2-level lookup you could make all the 2nd level tables
a fixed size (maybe 4 or 8 pages?) and extend the first level
table as needed.

	David

--===============1808674226866207402==--

