Content-Type: multipart/mixed; boundary="===============4730087715155041896=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: lkp@lists.01.org
Subject: Re: [gpio] f69e00bd21: unixbench.score -24.2% regression
Date: Tue, 16 Jul 2019 23:42:15 +0200
Message-ID: <CACRpkdYmtgO_E-KKE8zjA04POawJ=4RN3xFUPY__7GF+gSNbNQ@mail.gmail.com>
In-Reply-To: <20190710121518.GR17490@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4730087715155041896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 2:15 PM kernel test robot <rong.a.chen@intel.com>=
 wrote:

> FYI, we noticed a -24.2% regression of unixbench.score due to commit:
> commit: f69e00bd21aa6a1961c521b6eb199137fcb8a76a ("gpio: mmio: Support tw=
o direction registers")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.g=
it master

That's pretty bogus since the test doesn't even seem to be using GPIO.
Further AFAIK Intel chips don't even use that driver.

Can you provide some rootcausing?

If you are using GPIOs from userspace in the test somehow I am
sure both me and Bartosz would be interested to hear how.

Yours,
Linus Walleij

--===============4730087715155041896==--

