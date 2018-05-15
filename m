Content-Type: multipart/mixed; boundary="===============1190860097225394172=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Tue, 15 May 2018 15:52:21 -0700
Message-ID: <CA+55aFzTpkn_fokmm+ddi+cgk5K3EOftRmPad+NkUb5W2z0Fqg@mail.gmail.com>
In-Reply-To: <20180515224354.zmygmsnlqj5lrdbo@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============1190860097225394172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2018 at 3:43 PM Josh Poimboeuf <jpoimboe@redhat.com> wrot=
e:

> Glancing through the 32-bit and 64-bit entry code, I didn't see any more
> cases.  At least it will fail loudly if any such cases do still exist.

\Will it? Do we have objtool checks for it now?

Because without static checks, there could be things hiding that just don't
happen normally (think compat code etc that for most people is just dead
code).

              Linus

--===============1190860097225394172==--

