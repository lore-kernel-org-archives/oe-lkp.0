Content-Type: multipart/mixed; boundary="===============3187017423633172616=="
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] crypto: af_alg - Fix regression on empty requests
Date: Mon, 29 Jun 2020 14:23:02 +0530
Message-ID: <CA+G9fYszuzVq5P+10OA1biMQHQ-4tTDtqoOBHHdVMQXrwnWFJQ@mail.gmail.com>
In-Reply-To: <20200627083147.GA9365@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============3187017423633172616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jun 2020 at 14:02, Herbert Xu <herbert@gondor.apana.org.au> wr=
ote:
>
> On Fri, Jun 26, 2020 at 04:29:48PM +1000, Herbert Xu wrote:
> >
> > Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Fixes: f3c802a1f300 ("crypto: algif_aead - Only wake up when...")
> > Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> Reported-by: kernel test robot <rong.a.chen@intel.com>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

I have applied your patch and tested on Linux-next on arm, x86_64 and i386.
All LTP crypto tests got passed.

---
patch -p1 <  crypto-af_alg---Fix-regression-on-empty-requests.diff
patching file crypto/af_alg.c
patching file crypto/algif_aead.c
patching file crypto/algif_skcipher.c
patching file include/crypto/if_alg.h

Test output:
af_alg02.c:33: PASS: Successfully \"encrypted\" an empty message
af_alg05.c:40: PASS: read() expectedly failed with EINVAL

Test results summary:
af_alg01: pass
af_alg02: pass
af_alg03: pass
af_alg04: pass
af_alg05: pass
af_alg06: pass

ref:
https://lkft.validation.linaro.org/scheduler/job/1532020#L1413
https://lkft.validation.linaro.org/scheduler/job/1532019#L1516
https://lkft.validation.linaro.org/scheduler/job/1532026#L935

-- =

Linaro LKFT
https://lkft.linaro.org
--===============3187017423633172616==--

