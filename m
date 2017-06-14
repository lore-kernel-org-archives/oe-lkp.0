Content-Type: multipart/mixed; boundary="===============2520850064108342592=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: lkp@lists.01.org
Subject: Re: [Merge tag 'pci-v4.12-changes' of git] 857f864014: BUG: unable to handle kernel NULL pointer dereference at 00000000000000a8
Date: Wed, 14 Jun 2017 11:59:29 +0200
Message-ID: <CACRpkdZyup+dH6Yp747yLyaC8DSbA8bEnk37gJKnmnjBvjn=-A@mail.gmail.com>
In-Reply-To: <20170613043416.GB14217@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2520850064108342592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 6:34 AM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> Ah, that makes sense.  Well, someone can always work on expanding the
> range of dynamic char major numbers if they are running out of them on a
> real system, I'll gladly take patches for that :)

I started to take a stab at it at one point and incorporated some feedback
from Torvalds etc, it's here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commi=
t/?h=3Dchrdev-warn&id=3D65e5b1e9eb3f777ab7535b74b490e882eeec79d7

It tries to use all "holes" in the chardev major map to shun in a bit
more devices when we run out of the high dynamic major range.

Making them all dynamic seemed dangerous because I was afraid
of userspace ABI breakage because of old userlands with
static mknod:s.

I lost interest when it turned out that the zeroday QEMU stuff was
generating random machines that have no counterpart in the real
world, and then the exercise seemed a bit academic.

The last failures were due to (AFAICT) some relationship between
major and minor numbers that I didn't untangle.

If there is interest I could try to revive it.

Yours,
Linus Walleij

--===============2520850064108342592==--

