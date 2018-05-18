Content-Type: multipart/mixed; boundary="===============8517315857998100048=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool: Detect assembly code falling through to INT3 padding
Date: Fri, 18 May 2018 09:27:59 +0200
Message-ID: <20180518072759.GA4326@gmail.com>
In-Reply-To: <20180518071814.GB26358@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8517315857998100048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Ingo Molnar <mingo@kernel.org> wrote:

> =

> * Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> =

> > With the following commit:
> > =

> >   51bad67ffbce ("x86/asm: Pad assembly functions with INT3 instructions=
")
> > =

> > ... asm function alignments are padded with INT3, so it's no longer safe
> > to fall through to an aligned function.  Make sure we catch any such
> > cases with objtool.
> > =

> > Note this only adds checking for 64-bit, since objtool doesn't support
> > x86-32.
> > =

> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > ---
> >  arch/x86/kernel/head_64.S       |  2 --
> >  tools/objtool/arch.h            |  3 ++-
> >  tools/objtool/arch/x86/decode.c |  2 +-
> >  tools/objtool/check.c           | 11 ++++++++++-
> >  4 files changed, 13 insertions(+), 5 deletions(-)
> =

> Ok, this is cool, it addresses the robustness problem that INT3 padding i=
ntroduced =

> very nicely.
> =

> The concept of built-in kernel tooling working at the machine code level =
is just =

> so powerful - we should have added our own KCC compiler 20 years ago.

Hm, so a problem is that if we change the padding on 32-bit as well we won'=
t have =

this detection there, because objtool doesn't work on 32-bit.

Thanks,

	Ingo

--===============8517315857998100048==--

