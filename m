Content-Type: multipart/mixed; boundary="===============7969317289544281095=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] rhashtable-test: retry insert operations in threads
Date: Tue, 01 Sep 2015 21:00:57 +0800
Message-ID: <20150901130057.GA13230@gondor.apana.org.au>
In-Reply-To: <20150901124648.GA27550@orbit.nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============7969317289544281095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 02:46:48PM +0200, Phil Sutter wrote:
>
> This is not an inherent behaviour of the implementation but general
> agreement. The insertion may fail non-permanently (returning -EBUSY),
> users are expected to handle this by retrying the operation.

Absolutely not.  The only reason for an insertion to fail is if we
can't allocate enough memory.  Unless the user is also looping its
kmalloc calls it definitely shouldn't be retrying the insert.

If an expansion fails it means either that the system is suffering
a catastrophic memory shortage, or the user of rhashtable is doing
something wrong.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============7969317289544281095==--

