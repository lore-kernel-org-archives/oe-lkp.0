Content-Type: multipart/mixed; boundary="===============2796616289478722220=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [crypto] 7da6667077: kmsg.tcrypt:failed_to_load_transform_for_cfb(aes)
Date: Wed, 21 Nov 2018 16:19:19 +0800
Message-ID: <20181121081919.tcz3jygoujfk3i57@gondor.apana.org.au>
In-Reply-To: <20181121010126.GC18977@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2796616289478722220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 09:01:26AM +0800, kernel test robot wrote:
>
> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> # CONFIG_CRYPTO_CFB is not set

Enabling CFB should make your error go away.

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============2796616289478722220==--

