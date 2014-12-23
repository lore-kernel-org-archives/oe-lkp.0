Content-Type: multipart/mixed; boundary="===============3984275179804514029=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: [0/5] hwrng: Fix kref warning and underlying bugs
Date: Tue, 23 Dec 2014 16:39:09 +1100
Message-ID: <20141223053909.GA28001@gondor.apana.org.au>
In-Reply-To: <20141223030956.GA26839@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3984275179804514029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2014 at 07:09:56PM -0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is

Sigh, looks like more work is needed on this.

Here is a series of patches that should fix this along with the
underlying issue exposed by it and some other related problems.

Thanks,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============3984275179804514029==--

