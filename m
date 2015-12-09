Content-Type: multipart/mixed; boundary="===============3437196765312327599=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Wed, 09 Dec 2015 10:38:44 +0800
Message-ID: <20151209023844.GA24736@gondor.apana.org.au>
In-Reply-To: <20151209023632.GD19097@pox.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============3437196765312327599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2015 at 03:36:32AM +0100, Thomas Graf wrote:
> =

> Without knowing your exact implementation plans: introducing an
> additional reference indirection for every lookup will have a
> huge performance penalty as well.
> =

> Is your plan to only introduce the master table after an
> allocation has failed?

Right, obviously the extra indirections would only come into play
after a failed allocation.  As soon as we can run the worker thread
it'll try to remove the extra indirections by doing vmalloc.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============3437196765312327599==--

