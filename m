Content-Type: multipart/mixed; boundary="===============1698593016014388194=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: lkp@lists.01.org
Subject: Re: [of: unittest] 6204328380: [ INFO: possible recursive locking detected ]
Date: Fri, 20 May 2016 08:44:25 +0200
Message-ID: <CAMuHMdU2z4nhXng35vkQT_YpkfLdL8q6zhueg2sJqbtc-ieMyg@mail.gmail.com>
In-Reply-To: <573e2e34.7EVummcZ7DmvUFkD%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1698593016014388194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2016 at 11:20 PM, kernel test robot
<fengguang.wu@intel.com> wrote:
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 topic/renesas-overlays
>
> commit 6204328380f967f599f6120b7d5e348550d00110
> Author:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> AuthorDate: Wed Oct 14 13:16:15 2015 +0300
> Commit:     Geert Uytterhoeven <geert+renesas@glider.be>
> CommitDate: Tue May 17 10:21:53 2016 +0200
>
>     of: unittest: changeset helpers
>
>     Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>

Ah, it seems Pantelis has already a newer (fixed?) version in
https://github.com/pantoniou/linux-beagle-track-mainline.git bbb-overlays.

Will upgrade...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

--===============1698593016014388194==--

