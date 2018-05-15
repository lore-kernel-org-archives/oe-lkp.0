Content-Type: multipart/mixed; boundary="===============0947179355343760007=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Tue, 15 May 2018 15:28:19 -0700
Message-ID: <CA+55aFw1MxjUKtrt-KyiNxmpuKUY273L5uy8ggzOFjBSYMwwog@mail.gmail.com>
In-Reply-To: <20180515222211.ods5hzne46hozojq@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============0947179355343760007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 3:22 PM Josh Poimboeuf <jpoimboe@redhat.com> wrot=
e:

> The padding isn't needed there, and the resume_userspace symbol is never
> used, so wouldn't this fix it?

This looks like the correct fix for this case, but are we sure there aren't
other cases where we have this same "fall through to an ENTRY" case?

Because we've definitely had that kind of code before too - sometimes
simply because we want profiles and oopses to show which "part" of the asm
we're faulting in (that could be the case here too).

              Linus

--===============0947179355343760007==--

