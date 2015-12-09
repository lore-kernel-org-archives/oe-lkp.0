Content-Type: multipart/mixed; boundary="===============5257235385835204178=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Wed, 09 Dec 2015 03:36:32 +0100
Message-ID: <20151209023632.GD19097@pox.localdomain>
In-Reply-To: <20151209022454.GA24515@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============5257235385835204178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/09/15 at 10:24am, Herbert Xu wrote:
> On Wed, Dec 09, 2015 at 03:18:26AM +0100, Thomas Graf wrote:
> > =

> > Assuming that we only encounter this scenario with very large
> > table sizes, it might be OK to assume that deferring the actual
> > resize via the worker thread while continuing to insert above
> > 100% utilization in atomic context is safe.
> =

> As test_rhashtable has demonstrated already this approach doesn't
> work.  There is nothing in the kernel that will ensure that the
> worker thread gets to run at all.

If we define work assuming that an insertion in atomic context
should never fail then yes.  I'm not sure you can guarantee that
with a segmented table either though. I agree though that the
insertion behaviour is much better defined.

My argument is that if we are in a situation in which a worker
thread is never invoked and we've grown 2x from the original
table size, do we still need entries to be inserted into the
table or can we fail?

Without knowing your exact implementation plans: introducing an
additional reference indirection for every lookup will have a
huge performance penalty as well.

Is your plan to only introduce the master table after an
allocation has failed?

--===============5257235385835204178==--

