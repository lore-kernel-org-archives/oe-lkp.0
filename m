Content-Type: multipart/mixed; boundary="===============0417636775550745510=="
MIME-Version: 1.0
From: Stephan Mueller <smueller@chronox.de>
To: lkp@lists.01.org
Subject: Re: [security] d3b04a4398: WARNING:at_crypto/kdf_sp800108.c:#crypto_kdf108_init
Date: Fri, 10 Dec 2021 15:16:34 +0100
Message-ID: <3737408.Lz6Wf2Li4r@tauon.chronox.de>
In-Reply-To: <766e5415-cc94-1b46-2326-d55343a80388@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0417636775550745510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Freitag, 10. Dezember 2021, 03:54:32 CET schrieb Yujie Liu:

Hi Yujie, Herbert,

> This table shows that we have tested commit d3b04a4398("security: DH - use
> KDF implementation from crypto API") for several runs of boot test in qemu
> but got 100% bad result. We have also tested its parent commit (i.e. comm=
it
> d792134423 "security: DH - remove dead code for zero padding") and all the
> runs got 100% good result. So this is not a random issue.
> =

> > I am unable to reproduce it with i386 and clang-13. I can also not
> > reproduce it with GCC.
> =

> We have tested the i386 kernel built by gcc-9 or clang-14, and confirmed
> both of them can reproduce this issue reliably.
> =

> Please be sure to follow the reproduce steps in original report mail. The
> full reproduce log is attached.

Thank you for your response. The key log info is:

alg: self-tests for CTR-KDF (hmac(sha256)) failed (rc=3D-12)

And I finally see what the problem is: you selected SHA-256 as module but t=
he =

KDF implementation is selected to be statically linked.

So the KDF self test tries to allocate the SHA-256 algorithm and fails whic=
h =

causes the ENOMEM error.


Herbert, what is your preference in handling this:

- we could SELECT CRYPTO_SHA256 when the KDF is compiled. This would only b=
e =

necessary to satisfy the self test. Yet, there is no guarantee that SHA-256 =

would truly be needed because the DH code that calls the KDF obtains the =

reference to the hash from user space. In the end we could hard compile a =

crypto algorithm into the kernel that may never be used.

- we could relax the KDF self test a bit and could prevent the self test be=
ing =

executed if we get an ENOENT back during the algorithm allocation. But that =

would imply that the KDF self test would never be executed. Even when SHA-2=
56 =

is compiled as module and insmod'ed at a later time the KDF self test is no=
t =

executed as it is only executed from the __init function.


I would prefer to consider the first option to also statically compile =

SHA-256.

Ciao
Stephan


--===============0417636775550745510==--

