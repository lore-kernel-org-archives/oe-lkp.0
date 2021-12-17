Content-Type: multipart/mixed; boundary="===============4680264745072237331=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [security] d3b04a4398: WARNING:at_crypto/kdf_sp800108.c:#crypto_kdf108_init
Date: Fri, 17 Dec 2021 15:14:03 +1100
Message-ID: <20211217041403.GA19847@gondor.apana.org.au>
In-Reply-To: <3737408.Lz6Wf2Li4r@tauon.chronox.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4680264745072237331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 03:16:34PM +0100, Stephan Mueller wrote:
>
> Herbert, what is your preference in handling this:
> =

> - we could SELECT CRYPTO_SHA256 when the KDF is compiled. This would only=
 be =

> necessary to satisfy the self test. Yet, there is no guarantee that SHA-2=
56 =

> would truly be needed because the DH code that calls the KDF obtains the =

> reference to the hash from user space. In the end we could hard compile a =

> crypto algorithm into the kernel that may never be used.

...

> I would prefer to consider the first option to also statically compile =

> SHA-256.

I think KDF800108_CTR should select SHA256 instead of HASH.

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--===============4680264745072237331==--

