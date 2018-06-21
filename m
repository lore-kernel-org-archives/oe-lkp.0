Content-Type: multipart/mixed; boundary="===============8696302600142089905=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [Kbuild] 050e9baa9d: netperf.Throughput_total_tps -5.6% regression (FYI)
Date: Thu, 21 Jun 2018 17:15:09 +0900
Message-ID: <CA+55aFxXCD8qLfHcnshLR2_Feb=RLkOFfCeqPF_sShy7rK2cAw@mail.gmail.com>
In-Reply-To: <20180621080624.GO11011@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8696302600142089905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2018 at 5:10 PM kernel test robot <xiaolong.ye@intel.com>=
 wrote:
>
> FYI, we noticed a -5.6% regression of netperf.Throughput_total_tps due to=
 commit 050e9b ("Kbuild: rename CC_STACKPROTECTOR[_STRONG] config variables=
")

That's perhaps a surprisingly large cost to stack protector, but you
did move from "no stack protector at all":

> $ grep STACKPROTECTOR config-4.17.0-11782-gbe779f0
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy

To having the *strong* stack protector enabled:

> $ grep STACKPROTECTOR config-4.17.0-11783-g050e9baa
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy

so you're testing the "no overhead" case to the "worst overhead" case.

                Linus

--===============8696302600142089905==--

