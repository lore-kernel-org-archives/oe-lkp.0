Content-Type: multipart/mixed; boundary="===============2161520594117895650=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Thu, 19 Mar 2020 12:35:14 -0700
Message-ID: <CAHk-=whAWFw5vZB-krqUteHuAYCYypKG6683WEydOynBizpixQ@mail.gmail.com>
In-Reply-To: <7c10010c3d7745857ee1fba8eb06e7fe047eaa13.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2161520594117895650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 12:24 PM Jeff Layton <jlayton@kernel.org> wrote:
>
> >
> > If you have other things, send me a pull request, otherwise just let
> > me know and I'll apply the patch directly.
>
> That's it for now.

Lol. You confused me with your question of whether I wanted a pull
request or not.

I had already applied the patch as dcf23ac3e846 ("locks: reinstate
locks_delete_block optimization") yesterday ;)

            Linus
--===============2161520594117895650==--

