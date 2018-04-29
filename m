Content-Type: multipart/mixed; boundary="===============6686705752453927175=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [crng_reseed] WARNING: inconsistent lock state
Date: Sun, 29 Apr 2018 03:07:06 +0000
Message-ID: <CA+55aFwwsHmfn7i9TjQW73RYDctBdt4QBgyUG-OJ=+on_n0f_Q@mail.gmail.com>
In-Reply-To: <20180429022606.267zucef42hm37m7@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6686705752453927175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 28, 2018 at 7:26 PM Fengguang Wu <fengguang.wu@intel.com> wro=
te:

> FYI this happens in mainline kernel 4.17.0-rc2.
> It looks like a new regression.

> It occurs in 3 out of 3 boots.

> There is another "[  294.642506] BUG: sleeping function called from
> invalid context at mm/slab.h:421" at the bottom of this long dmesg:

This should be fixed by commit 6c1e851c4edc ("random: fix possible sleeping
allocation from irq context").

                 Linus

--===============6686705752453927175==--

