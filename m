Content-Type: multipart/mixed; boundary="===============7615644976649793877=="
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
To: lkp@lists.01.org
Subject: Re: Fix make.cross for 0day bot
Date: Thu, 01 Sep 2022 17:20:48 +0900
Message-ID: <CAK7LNAQYiRr2-m73bBK-Ly8Tg35SK+nJw5bxULhuFh1vG=nN8g@mail.gmail.com>
In-Reply-To: <YxBZ5wcGUSQ/VeHD@rli9-MOBL1.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7615644976649793877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 1, 2022 at 4:06 PM Philip Li <philip.li@intel.com> wrote:
>
> On Thu, Sep 01, 2022 at 03:55:52PM +0900, Masahiro Yamada wrote:
> > Hello,  maintainers of Intel 0day bot,
> >
> > make.cross is supposed to use the latest GCC by default
> > (according to the comment "use highest available version")
> > but actually chooses GCC 9.3.0 rather than gcc-12.1.0.
>
> thanks a lot for pointing out the issue and fixing it. Do you mind to send
> a PR to https://github.com/intel/lkp-tests, or you suggest we composing
> a patch based on your fix below?
>


Sure, I will make a PR.
Thanks.


-- =

Best Regards
Masahiro Yamada
--===============7615644976649793877==--

