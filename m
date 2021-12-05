Content-Type: multipart/mixed; boundary="===============3798354138339638048=="
MIME-Version: 1.0
From: Stephan Müller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: Re: [security] d3b04a4398: WARNING:at_crypto/kdf_sp800108.c:#crypto_kdf108_init
Date: Sun, 05 Dec 2021 11:21:56 +0100
Message-ID: <3438006.aCxCBeP46V@positron.chronox.de>
In-Reply-To: <20211130080419.GC29514@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3798354138339638048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Dienstag, 30. November 2021, 09:04:19 CET schrieb kernel test robot:

Hi,

...
> =

> =

> +------------------------------------------------------+------------+----=
---
> -----+
> |                                                      | d792134423 |
> |                                                      | d3b04a4398 |
> =

> +------------------------------------------------------+------------+----=
---
> -----+
> | boot_successes                                       | 14         | 0  =
   =

> |     | boot_failures                                        | 0         =
 |
> | 16         | WARNING:at_crypto/kdf_sp800108.c:#crypto_kdf108_init | 0  =
  =

> |      | 16         | EIP:crypto_kdf108_init                              =

> | | 0          | 16         |
> +------------------------------------------------------+------------+----=
---
> -----+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [ 18.648980][ T1] WARNING: CPU: 0 PID: 1 at crypto/kdf_sp800108.c:138
> crypto_kdf108_init (crypto/kdf_sp800108.c:136) [   18.649900][    T1]
> Modules linked in:

The issue is that the self-test fails for 16 out of 30 times, i.e. it is ki=
nd =

of random when it happens or not.

I am unable to reproduce it with i386 and clang-13. I can also not reproduc=
e =

it with GCC.

Nor do I see an obvious issue in the code that points to either uninitizliz=
ed =

memory or otherwise could affect the test result.

I keep trying with Clang-14


Ciao
Stephan


--===============3798354138339638048==--

