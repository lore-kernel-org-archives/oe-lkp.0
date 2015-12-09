Content-Type: multipart/mixed; boundary="===============1000283493828889408=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Wed, 09 Dec 2015 10:24:54 +0800
Message-ID: <20151209022454.GA24515@gondor.apana.org.au>
In-Reply-To: <20151209021826.GC19097@pox.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============1000283493828889408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2015 at 03:18:26AM +0100, Thomas Graf wrote:
> =

> Assuming that we only encounter this scenario with very large
> table sizes, it might be OK to assume that deferring the actual
> resize via the worker thread while continuing to insert above
> 100% utilization in atomic context is safe.

As test_rhashtable has demonstrated already this approach doesn't
work.  There is nothing in the kernel that will ensure that the
worker thread gets to run at all.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============1000283493828889408==--

