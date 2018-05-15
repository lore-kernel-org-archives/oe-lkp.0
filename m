Content-Type: multipart/mixed; boundary="===============5490451078251626130=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Tue, 15 May 2018 17:43:54 -0500
Message-ID: <20180515224354.zmygmsnlqj5lrdbo@treble>
In-Reply-To: <CA+55aFw1MxjUKtrt-KyiNxmpuKUY273L5uy8ggzOFjBSYMwwog@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5490451078251626130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 03:28:19PM -0700, Linus Torvalds wrote:
> On Tue, May 15, 2018 at 3:22 PM Josh Poimboeuf <jpoimboe@redhat.com> wr=
ote:
> =

> > The padding isn't needed there, and the resume_userspace symbol is never
> > used, so wouldn't this fix it?
> =

> This looks like the correct fix for this case, but are we sure there aren=
't
> other cases where we have this same "fall through to an ENTRY" case?
> =

> Because we've definitely had that kind of code before too - sometimes
> simply because we want profiles and oopses to show which "part" of the asm
> we're faulting in (that could be the case here too).

Glancing through the 32-bit and 64-bit entry code, I didn't see any more
cases.  At least it will fail loudly if any such cases do still exist.

-- =

Josh

--===============5490451078251626130==--

