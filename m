Content-Type: multipart/mixed; boundary="===============7088007212301405224=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [PCI] dc83615370: will-it-scale.per_process_ops -1.2% regression
Date: Tue, 12 Jan 2021 09:30:46 -0800
Message-ID: <202101120927.B3345B30@keescook>
In-Reply-To: <20210112141045.GD30747@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7088007212301405224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 10:10:45PM +0800, kernel test robot wrote:
> FYI, we noticed a -1.2% regression of will-it-scale.per_process_ops due t=
o commit:
> =

> commit: dc83615370e7ebcb181a21a8ad13a77c278ab81c ("PCI: Fix PREL32 reloca=
tions for LTO")
> https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git for-next/kspp

O_o Well that's surprising. This only creates stubs.

>                                 will-it-scale.workload                   =
       =

>                                                                          =
       =

>   2.14e+07 +-------------------------------------------------------------=
---+   =

>            |.+. .+ :        +  +.+.               +.+. .+   +.+. .+  :   =
   |   =

>   2.13e+07 |-+ +    :    +.+       +             +    +         +    :   =
   |   =

>            |        :   :           + .+.+..+. .+                     +. =
   |   =

>   2.12e+07 |-+       :  :            +        +                         +=
.+.|   =

>            |         +.+                                                 =
   |   =

>   2.11e+07 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>    2.1e+07 |-+                   O O     O  O O   O     O                =
   |   =

>            |                 O O     O O        O   O O   O O            =
   |   =

>   2.09e+07 |-+         O                                                 =
   |   =

>            |         O   O                                               =
   |   =

>   2.08e+07 |-O O O O       O                                             =
   |   =

>            |                                                             =
   |   =

>   2.07e+07 +-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
       =

> [*] bisect-good sample
> [O] bisect-bad  sample

But it's pretty clear _something_ has happened. We'll investigate...

-- =

Kees Cook
--===============7088007212301405224==--

