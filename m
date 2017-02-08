Content-Type: multipart/mixed; boundary="===============7009426692914896656=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: lkp@lists.01.org
Subject: Re: [auxdisplay: charlcd] cdcb352cdb: INFO: trying to register non-static key.
Date: Wed, 08 Feb 2017 13:11:23 +0100
Message-ID: <CAMuHMdUijSRq4XdiZm_Li3yZ1jmvVY0_XvxYNTY30fEAgQwp6g@mail.gmail.com>
In-Reply-To: <58991758.7VyH6bWdfYIgZO/a%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7009426692914896656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

On Tue, Feb 7, 2017 at 1:39 AM, kernel test robot
<fengguang.wu@intel.com> wrote:
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux Geert-Uytterhoeven/Add-HD44780-Character=
-LCD-support/20170206-225742
>
> commit cdcb352cdba7559c3e450f6dc0b365a1fc27faef
> Author:     Geert Uytterhoeven <geert@linux-m68k.org>
> AuthorDate: Mon Feb 6 15:38:11 2017 +0100
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Mon Feb 6 22:57:49 2017 +0800
>
>     auxdisplay: charlcd: Extract character LCD core from misc/panel

> [    6.923024] parport0: PC-style at 0x378, irq 7 [PCSPP(,...)]
> [    6.929389] ibmasm: IBM ASM Service Processor Driver version 1.0 loaded
> [    6.929389] ibmasm: IBM ASM Service Processor Driver version 1.0 loaded
> [    7.036785] INFO: trying to register non-static key.
> [    7.036785] INFO: trying to register non-static key.
> [    7.038916] the code is fine but needs lockdep annotation.
> [    7.038916] the code is fine but needs lockdep annotation.
> [    7.041191] turning off the locking correctness validator.
> [    7.041191] turning off the locking correctness validator.

Thanks, this is due to an uninitialized (initialized too late) mutex.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

--===============7009426692914896656==--

