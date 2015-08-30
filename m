Content-Type: multipart/mixed; boundary="===============2658845073176251893=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Sun, 30 Aug 2015 15:47:17 +0800
Message-ID: <20150830074717.GA25396@gondor.apana.org.au>
In-Reply-To: <20150829090701.GN20760@orbit.nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============2658845073176251893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Phil Sutter <phil@nwl.cc> wrote:
>
> Should we introduce a new field to struct rhashtable to track the
> internal state? This might allow to clean up some rather obscure tests,
> e.g. whether a table resize is in progress or not.

Why would we want to do that? The deferred expansion is done
on a best effort basis so its failure has nothing to do with
the failure of a subsequent insertion.

The insertion must have tried its own last-ditch synchronous
expansion and only fail if that fails.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============2658845073176251893==--

