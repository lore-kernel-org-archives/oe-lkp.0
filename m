Content-Type: multipart/mixed; boundary="===============7051643864604533532=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Sat, 05 Dec 2015 15:06:03 +0800
Message-ID: <20151205070603.GB23255@gondor.apana.org.au>
In-Reply-To: <20151204181555.GC29598@orbit.nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============7051643864604533532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2015 at 07:15:55PM +0100, Phil Sutter wrote:
>
> > Only one should really do this, while others are waiting.
> =

> Sure, that was my previous understanding of how this thing works.

Yes that's clearly how it should be.  Unfortunately while adding
the locking to do this, I found out that you can't actually call
__vmalloc with BH disabled so this is a no-go.

Unless we can make __vmalloc work with BH disabled, I guess we'll
have to go back to multi-level lookups unless someone has a better
suggestion.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============7051643864604533532==--

