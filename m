Content-Type: multipart/mixed; boundary="===============5593371732000470098=="
MIME-Version: 1.0
From: Vlad Dronov <vdronov@redhat.com>
To: lkp@lists.01.org
Subject: Re: include/crypto/chacha.h:100: undefined reference to `chacha_crypt_arch'
Date: Mon, 04 Jul 2022 17:40:32 +0200
Message-ID: <CAMusb+QN6BhAvBf-j+mv90ZGbKhGuSX9kM9eiOF2qVV_7T=bvw@mail.gmail.com>
In-Reply-To: <CAMusb+Qd06E43b711WX-5xcbs6i_dNMzT8pUEx7ZjtN9OxR1bg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5593371732000470098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 4, 2022 at 5:21 PM Vlad Dronov <vdronov@redhat.com> wrote:
>
> Hi,
>
> False alarm, I apologize.
>
> CRYPTO_LIB_CHACHA20POLY1305=3Dy was indeed selected by:
>
> config WIREGUARD
>     tristate "WireGuard secure network tunnel"
>     depends on NET && INET
>     depends on IPV6 || !IPV6
>     select CRYPTO_LIB_CHACHA20POLY1305
>
> $ grep -e CONFIG_WIREGUARD=3D -e CONFIG_NETDEVICES=3D -e CONFIG_NET_CORE=
=3D
> -e CONFIG_NET=3D -e CONFIG_INET=3D -e CONFIG_IPV6=3D config
> CONFIG_NET=3Dy
> CONFIG_INET=3Dy
> CONFIG_IPV6=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> CONFIG_WIREGUARD=3Dy
>
> ( Which breaks the  "In general use select only for non-visible
> symbols (no prompts anywhere)
> and for symbols with no dependencies" rules from the "Kconfig
> Language" doc, but this is
> another story )

JFYI: fed with a config in question, "make menuconfig" just silently changes
CONFIG_CRYPTO_CHACHA_S390=3Dm to =3Dy
and, accordingly,
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm to =3Dy
thus allowing a correct build.

This adjustment is not done by a kernel test robot (intentionally, I guess).

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

--===============5593371732000470098==--

