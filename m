Content-Type: multipart/mixed; boundary="===============0207648978149773776=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Tue, 01 Sep 2015 19:43:00 +0800
Message-ID: <20150901114300.GB12691@gondor.apana.org.au>
In-Reply-To: <20150831110012.GO20760@orbit.nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============0207648978149773776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2015 at 01:00:12PM +0200, Phil Sutter wrote:
> =

> The variable would be used to track if the worker has failed to allocate
> memory in background.
> =

> Since the failing insertion will be retried, subsequent inserts are not
> necessary unrelated.

If an insertion fails it is never retried.  The only thing that is
retried is the expansion of the table.  So I have no idea what
you are talking about.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============0207648978149773776==--

