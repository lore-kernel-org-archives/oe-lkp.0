Content-Type: multipart/mixed; boundary="===============1862988339029682727=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: lkp@lists.01.org
Subject: Re: [dmaengine: shdma] RIP: 0010:[<ffffffff8124ad42>] [<ffffffff8124ad42>] __asan_load8
Date: Mon, 29 Jun 2015 10:37:43 +0200
Message-ID: <CAMuHMdXKqT3yTSwnK8LSFS=heXwBZ+46ZONysdSVXGwrBtWivg@mail.gmail.com>
In-Reply-To: <558dc861.dfesYjLf7z0kCaCe%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1862988339029682727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2015 at 11:47 PM, kernel test robot
<fengguang.wu@intel.com> wrote:
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit b6d1778bc5485c55c6f5194b8b2ea84c0ce5adad
> Author:     Geert Uytterhoeven <geert+renesas@glider.be>
> AuthorDate: Thu Feb 26 11:26:34 2015 +0100
> Commit:     Vinod Koul <vinod.koul@intel.com>
> CommitDate: Mon Mar 2 22:10:44 2015 +0530
>
>     dmaengine: shdma: Move DMA stop to (runtime) suspend callbacks
>
>     During system reboot, the sh-dma-engine device may be runtime-suspend=
ed,
>     causing a crash:
>
>         Unhandled fault: imprecise external abort (0x1406) at 0x0002c02c
>         Internal error: : 1406 [#1] SMP ARM
>         ...
>         PC is at sh_dmae_ctl_stop+0x28/0x64
>         LR is at sh_dmae_ctl_stop+0x24/0x64
>
>     If the sh-dma-engine is runtime-suspended, its module clock is turned
>     off, and its registers cannot be accessed.
>
>     To fix this, move the call to sh_dmae_ctl_stop(), which touches the
>     DMAOR register, to the sh_dmae_suspend() and sh_dmae_runtime_suspend()
>     callbacks.  This makes PM operations more symmetric, as both
>     sh_dmae_resume() and sh_dmae_runtime_resume() already call sh_dmae_rs=
t()
>     to re-initialize the DMAOR register.
>
>     Remove sh_dmae_shutdown(), as it became empty.
>
>     Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>     Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>     Signed-off-by: Vinod Koul <vinod.koul@intel.com>

As the crash is on x86_64, and that commit affects sh/arm only, I'm
afraid your crash is due to an intermittent problem.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

--===============1862988339029682727==--

