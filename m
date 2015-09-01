Content-Type: multipart/mixed; boundary="===============6900161870013175594=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Tue, 01 Sep 2015 21:50:19 +0800
Message-ID: <20150901135019.GA13629@gondor.apana.org.au>
In-Reply-To: <20150901134310.GB27550@orbit.nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============6900161870013175594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 03:43:11PM +0200, Phil Sutter wrote:
>
> Hmm. Since memory allocation is first tried with GFP_ATOMIC set and upon
> failure retried in background, this seems like a situation which might
> happen during normal use. If that already indicates a severe problem,
> why retry in background at all?

It should be tried in the background first at 70% and only when
that fails would we hit the 100% case and then we will try it
with GFP_ATOMIC.  If that fails then the insertion will fail.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============6900161870013175594==--

