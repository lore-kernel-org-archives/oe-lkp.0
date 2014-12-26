Content-Type: multipart/mixed; boundary="===============5907663142467064068=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/5] hwrng: core - Do not register device opportunistically
Date: Fri, 26 Dec 2014 12:00:56 +1100
Message-ID: <20141226010056.GB20702@gondor.apana.org.au>
In-Reply-To: <87mw6egd22.fsf@rustcorp.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============5907663142467064068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2014 at 09:59:41AM +1030, Rusty Russell wrote:
>
> Does this break userspace by creating a device which will just return
> -ENODEV on read?  Sure, callers *should* handle it...

If somebody complains we could easily fix this by making open
fail.  In fact, if such applications exist then they're likely
to want to hold onto a reference to the RNG after then open...

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============5907663142467064068==--

