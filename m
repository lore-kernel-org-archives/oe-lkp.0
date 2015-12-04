Content-Type: multipart/mixed; boundary="===============4695534695290987798=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rhashtable: ENOMEM errors when hit with a flood of insertions
Date: Fri, 04 Dec 2015 08:07:02 +0800
Message-ID: <20151204000702.GA8863@gondor.apana.org.au>
In-Reply-To: <1449158919.6379.27.camel@edumazet-glaptop2.roam.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4695534695290987798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2015 at 08:08:39AM -0800, Eric Dumazet wrote:
>
> Well, it will fail before this point if memory is fragmented.

Indeed, I was surprised that it even worked up to that point,
possibly because the previous resizes might have actually been
done in process context.

> Anyway, __vmalloc() can be used with GFP_ATOMIC, have you tried this ?

Ah I didn't know that.  That would be much simpler.  I'll give it a
try.

Thanks Eric!
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4695534695290987798==--

