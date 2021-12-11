Content-Type: multipart/mixed; boundary="===============3994771629475291771=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Fri, 10 Dec 2021 17:32:45 -0800
Message-ID: <CAHk-=wj4Cqs=2ZrJ0r-0ansaarD9wt88d73XVVQ4H12XwHgofg@mail.gmail.com>
In-Reply-To: <CAHk-=wh5iFv1MOx6r8zyGYkYGfgfxqcPSrUDwfuOCdis+VR+BQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3994771629475291771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 1:59 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This is an ENTIRELY UNTESTED patch to do that.

Oh, and I guess it's somewhat tested now. I've been running that patch
for the last couple of hours, and it seems to work fine.

Not that I actually stressed it in any particular way, but at least it
doesn't cause any obvious problems. So it's probably fine.

Famous last words.

              Linus
--===============3994771629475291771==--

