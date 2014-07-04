Content-Type: multipart/mixed; boundary="===============9068994552268907562=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/4] DRBG: fix memory corruption for AES192
Date: Fri, 04 Jul 2014 11:08:10 +0800
Message-ID: <20140704030810.GA22255@gondor.apana.org.au>
In-Reply-To: <3083657.SRQmeelhqi@myon.chronox.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============9068994552268907562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 01, 2014 at 05:08:48PM +0200, Stephan Mueller wrote:
> For the CTR DRBG, the drbg_state->scratchpad temp buffer (i.e. the
> memory location immediately before the drbg_state->tfm variable
> is the buffer that the BCC function operates on. BCC operates
> blockwise. Making the temp buffer drbg_statelen(drbg) in size is
> sufficient when the DRBG state length is a multiple of the block
> size. For AES192 this is not the case and the length for temp is
> insufficient (yes, that also means for such ciphers, the final
> output of all BCC rounds are truncated before used to update the
> state of the DRBG!!).
> =

> The patch enlarges the temp buffer from drbg_statelen to
> drbg_statelen + drbg_blocklen to have sufficient space.
> =

> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Stephan Mueller <smueller@chronox.de>

I have applied just this patch out of your series.  You patches
depend on the previous four patches which I have not yet applied
since there are still outstanding issues with two of them.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============9068994552268907562==--

