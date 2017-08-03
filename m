Content-Type: multipart/mixed; boundary="===============2974395447317010087=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mdio_bus] 95b80bf3db: WARNING:at_include/linux/gpio/consumer.h:#mdiobus_unregister
Date: Thu, 03 Aug 2017 09:49:47 +0200
Message-ID: <CACRpkdakFOryaTxyjkiWpE9o6XXbfn5o4k_CzUD8xbYvKgxprg@mail.gmail.com>
In-Reply-To: <20170724022007.GG32356@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2974395447317010087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 4:20 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:

> FYI, we noticed the following commit:
>
> commit: 95b80bf3db03c2bf572a357cf74b9a6aefef0a4a ("mdio_bus: Remove unnee=
ded gpiod NULL check")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

What needs to happen is to check why the MDIO driver in question does not
select GPIOLIB or depends on GPIOLIB in its Kconfig.

Yours,
Linus Walleij

--===============2974395447317010087==--

