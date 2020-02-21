Content-Type: multipart/mixed; boundary="===============4608634153311927134=="
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
To: lkp@lists.01.org
Subject: Re: [kernel] 247f5d7caa: will-it-scale.per_process_ops 9.6% improvement
Date: Fri, 21 Feb 2020 16:55:42 +0100
Message-ID: <CAG48ez0N9rTEtrA1TrL07r5Om_yK-10XO2XtsWOn3Nde0PXsZA@mail.gmail.com>
In-Reply-To: <20200221115542.GL14493@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4608634153311927134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 12:56 PM kernel test robot
<rong.a.chen@intel.com> wrote:
> FYI, we noticed a 9.6% improvement of will-it-scale.per_process_ops due t=
o commit:
>
>
> commit: 247f5d7caa443d0ea5f1992aeda875e679e9bd35 ("kernel-hacking: Make D=
EBUG_{LIST,PLIST,SG,NOTIFIERS} non-debug options")
> https://git.kernel.org/cgit/linux/kernel/git/will/linux.git debug-list

I'm guessing this might mean that the test bot had the DEBUG_LIST
stuff enabled in its Kconfig, whereas after the rename, the default is
used, which is off?

This seems a bit problematic if people had DEBUG_LIST enabled in their
old kernel config and then try to reuse that config for a new kernel.
I wonder whether it'd be acceptable to keep the options under their
old names and let them "select" the new ones, or whether we have to
choose between "keep the old bad name" and "discard people's old
config flags".
--===============4608634153311927134==--

