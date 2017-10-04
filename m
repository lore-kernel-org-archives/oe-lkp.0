Content-Type: multipart/mixed; boundary="===============2618085441796334587=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 14:30:42 -0700
Message-ID: <CA+55aFy9r2GAFenswm92sdz0qnbazPcofm668JqYrxEVFALfZA@mail.gmail.com>
In-Reply-To: <20171004210624.yyi64y2o5cvbr3d3@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============2618085441796334587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 4, 2017 at 2:06 PM, Josh Poimboeuf <jpoimboe@redhat.com> wrot=
e:
>
> I compiled the same kernel with a similar version of GCC.  It turns out
> that GCC *does* create unaligned stacks with frame pointers enabled:

Christ. What a piece of crap.

It doesn't even seem to make any sense. Spill room for the "u16
item_count" and "u8 move_type"?

That function is disgusting anyway (the switch really should be
outside the loop, not inside it), but whatever. No excuse for that
kind of garbage code generation.

> This was a leaf function.  For no apparent reason, GCC 4.8 decided to
> subtract 3 from the stack pointer in the prologue.

Can you make objtool warn about unaligned stack pointer additions like that?

Maybe it only happens in very limited cases, and we can find a pattern
to why gcc generates garbage code like that? And perhaps even how to
just avoid it?

                    Linus

--===============2618085441796334587==--

