Content-Type: multipart/mixed; boundary="===============8121575556087242353=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH] crypto: af_alg - Fix regression on empty requests
Date: Sat, 27 Jun 2020 18:31:47 +1000
Message-ID: <20200627083147.GA9365@gondor.apana.org.au>
In-Reply-To: <20200626062948.GA25285@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============8121575556087242353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 04:29:48PM +1000, Herbert Xu wrote:
>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Fixes: f3c802a1f300 ("crypto: algif_aead - Only wake up when...")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Reported-by: kernel test robot <rong.a.chen@intel.com>
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--===============8121575556087242353==--

