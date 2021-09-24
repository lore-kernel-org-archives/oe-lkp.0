Content-Type: multipart/mixed; boundary="===============5650503712909208476=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: /proc/$pid/chan kernel address exposures (was Re: [proc/wchan] 30a3a19273: leaking-addresses.proc.wchan./proc/bus/input/devices:B:KEY=1000000000007ff980000000007fffebeffdfffeffffffffffffffffffffe)
Date: Thu, 23 Sep 2021 18:01:51 -0700
Message-ID: <202109231746.7B4C306CEC@keescook>
In-Reply-To: <d15378c8-8702-47ba-65b7-450f728793ed@gmx.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5650503712909208476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 07:25:36PM +0100, Helge Deller wrote:
> On 1/3/21 3:27 PM, kernel test robot wrote:
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 30a3a192730a997bc4afff5765254175b6fb64f3 ("[PATCH] proc/wchan: =
Use printk format instead of lookup_symbol_name()")
> > url: https://github.com/0day-ci/linux/commits/Helge-Deller/proc-wchan-U=
se-printk-format-instead-of-lookup_symbol_name/20201218-010048
> > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 0=
9162bc32c880a791c6c0668ce0745cf7958f576
> >
> > in testcase: leaking-addresses
> > version: leaking-addresses-x86_64-4f19048-1_20201111
> > [...]
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> I don't see anything wrong with the wchan patch (30a3a192730a997bc4afff57=
65254175b6fb64f3),
> or that it could have leaked anything.
> =

> Maybe the kernel test robot picked up the wchan patch by mistake ?
>
> > [...]
> > [2 wchan] 0xffffc9000000003c
       ^^^^^

As the root cause of a kernel address exposure, Jann pointed out[2]
commit 152c432b128c, which I've tracked to here, only to discover this
regression was, indeed, reported. :(

So, we have a few things:

1) wchan has been reporting "0" in the default x86 config (ORC unwinder)
   for 4 years now.

2) non-x86 or non-ORC, wchan has been leaking raw kernel addresses since
   commit 152c432b128c (v5.12).

3) the output of scripts/leaking_addresses.pl is hard to read. :)

We can fix 1 and 2 with:
   https://lore.kernel.org/lkml/20210923233105.4045080-1-keescook(a)chromiu=
m.org/
(though that will need a Cc: stable now...)

If we don't do that, we still need to revert 152c432b128c in v5.12 and
later.

We should likely make leaking_addresses.pl a little more readable while
we're at it.

-Kees

[1] https://lore.kernel.org/lkml/20210921193249.el476vlhg5k6lfcq(a)shells.g=
nugeneration.com/
[2] https://lore.kernel.org/lkml/CAG48ez2zC=3D+PuNgezH53HBPZ8CXU5H=3DvkWx7n=
Js60G8RXt3w0Q(a)mail.gmail.com/

-- =

Kees Cook
--===============5650503712909208476==--

