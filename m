Content-Type: multipart/mixed; boundary="===============6531019670657416118=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/4] DRBG: fix memory corruption for AES192
Date: Fri, 04 Jul 2014 05:36:03 +0200
Message-ID: <5854363.JdQPrZ9a72@myon.chronox.de>
In-Reply-To: <20140704031235.GA22340@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============6531019670657416118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Freitag, 4. Juli 2014, 11:12:35 schrieb Herbert Xu:

Hi Herbert,

> On Tue, Jul 01, 2014 at 05:08:48PM +0200, Stephan Mueller wrote:
> > For the CTR DRBG, the drbg_state->scratchpad temp buffer (i.e. the
> > memory location immediately before the drbg_state->tfm variable
> > is the buffer that the BCC function operates on. BCC operates
> > blockwise. Making the temp buffer drbg_statelen(drbg) in size is
> > sufficient when the DRBG state length is a multiple of the block
> > size. For AES192 this is not the case and the length for temp is
> > insufficient (yes, that also means for such ciphers, the final
> > output of all BCC rounds are truncated before used to update the
> > state of the DRBG!!).
> > =

> > The patch enlarges the temp buffer from drbg_statelen to
> > drbg_statelen + drbg_blocklen to have sufficient space.
> > =

> > Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> > Signed-off-by: Stephan Mueller <smueller@chronox.de>
> =

> BTW your patches were all corrupted by your mailer so I had to
> fix them by hand.  Please check the cryptodev tree to ensure
> that my fixes are correct.

The patch fixing the memory corruption is completely and correctly applied.

Apologies for sending broken patches. If I shall resend them corrected, ple=
ase =

let me know.
> =

> In future please test your patches by applying your own patches
> returned via the list.

I will do that.

-- =

Ciao
Stephan

--===============6531019670657416118==--

