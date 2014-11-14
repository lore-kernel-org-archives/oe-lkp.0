Content-Type: multipart/mixed; boundary="===============1308107784078129663=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: 0d5384f caused few tcrypt test failed to run
Date: Fri, 14 Nov 2014 12:47:30 -0800
Message-ID: <CAGXu5jL4nw3aNjyHJRzUwuVw_E9421eiXkh7PpsWrjgZE+7bkg@mail.gmail.com>
In-Reply-To: <20141114025544.GL300@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1308107784078129663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks! Yeah, I think I'm missing a few module aliases. Let me see
what I can do.

-Kees

On Thu, Nov 13, 2014 at 6:55 PM, Yuanhan Liu
<yuanhan.liu@linux.intel.com> wrote:
>
> Hi kees,
>
> FYI, we noticed that few tcrypt test failed to run due to changes on:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git zpool
> commit 0d5384f41382a5eab7d696a8232b7708b6a9f59f ("crypto: prefix module a=
utoloading with "crypto-"")
>
>     <3>[   49.816433] failed to load transform for md4: -2
>
>
> The testcase to reproduce this issue is:
>
>         for i in {401..417}; do
>                 modprobe tcrypt sec=3D2 mode=3D$i
>         done
>
> JFYI, here I attached both good and bad dmesg.
>
>         --yliu



-- =

Kees Cook
Chrome OS Security

--===============1308107784078129663==--

