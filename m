Content-Type: multipart/mixed; boundary="===============7974478757654120643=="
MIME-Version: 1.0
From: Vlad Dronov <vdronov@redhat.com>
To: lkp@lists.01.org
Subject: Re: include/crypto/chacha.h:100: undefined reference to `chacha_crypt_arch'
Date: Mon, 04 Jul 2022 21:25:04 +0200
Message-ID: <CAMusb+QrX+c7C21sC5Z=e-QuNtKvu6BJ=WbJenzx29Ut1PqrmA@mail.gmail.com>
In-Reply-To: <CAMusb+QN6BhAvBf-j+mv90ZGbKhGuSX9kM9eiOF2qVV_7T=bvw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7974478757654120643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 4, 2022 at 5:40 PM Vlad Dronov <vdronov@redhat.com> wrote:
> ...skip...
>
> JFYI: fed with a config in question, "make menuconfig" just silently chan=
ges
> CONFIG_CRYPTO_CHACHA_S390=3Dm to =3Dy
> and, accordingly,
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm to =3Dy
> thus allowing a correct build.
>
> This adjustment is not done by a kernel test robot (intentionally, I gues=
s).

Ok, I'm sorry for the traffic. False alarm indeed. The fix was posted:

https://lore.kernel.org/netdev/20220704191535.76006-1-vdronov(a)redhat.com/=
T/#u

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

--===============7974478757654120643==--

