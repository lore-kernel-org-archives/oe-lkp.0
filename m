Content-Type: multipart/mixed; boundary="===============5169085622673684403=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 16:06:24 -0500
Message-ID: <20171004210624.yyi64y2o5cvbr3d3@treble>
In-Reply-To: <201710040644.GJE89219.FOHMFSFOVtOQLJ@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============5169085622673684403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2017 at 06:44:50AM +0900, Tetsuo Handa wrote:
> Josh Poimboeuf wrote:
> > On Tue, Oct 03, 2017 at 11:28:15AM -0500, Josh Poimboeuf wrote:
> > > There are two bugs:
> > > =

> > > 1) Somebody -- presumably lockdep -- is corrupting the stack.  Need t=
he
> > >    lockdep people to look at that.
> > > =

> > > 2) The 32-bit FP unwinder isn't handling the corrupt stack very well,
> > >    It's blindly dereferencing untrusted data:
> > > =

> > > 	/* Is the next frame pointer an encoded pointer to pt_regs? */
> > > 	regs =3D decode_frame_pointer(next_bp);
> > > 	if (regs) {
> > > 		frame =3D (unsigned long *)regs;
> > > 		len =3D regs_size(regs);
> > > 		state->got_irq =3D true;
> > > =

> > >   On 32-bit, regs_size() dereferences the regs pointer before we know=
 it
> > >   points to a valid stack.  I'll fix that, along with the other unwin=
der
> > >   improvements I discussed with Linus.
> > =

> > Tetsuo and/or Fengguang,
> > =

> > Would you mind testing with this patch?  It should at least prevent the
> > unwinder panic and should hopefully print a useful unwinder dump
> > instead.
> > =

> Here are two outputs.

Thanks, both outputs were helpful.

This is another unwinder-related issue, unrelated to lockdep this time.

I compiled the same kernel with a similar version of GCC.  It turns out
that GCC *does* create unaligned stacks with frame pointers enabled:

  c124a388 <acpi_rs_move_data>:
  c124a388:       55                      push   %ebp
  c124a389:       89 e5                   mov    %esp,%ebp
  c124a38b:       57                      push   %edi
  c124a38c:       56                      push   %esi
  c124a38d:       89 d6                   mov    %edx,%esi
  c124a38f:       53                      push   %ebx
  c124a390:       31 db                   xor    %ebx,%ebx
  c124a392:       83 ec 03                sub    $0x3,%esp
  ...
  c124a3e3:       83 c4 03                add    $0x3,%esp
  c124a3e6:       5b                      pop    %ebx
  c124a3e7:       5e                      pop    %esi
  c124a3e8:       5f                      pop    %edi
  c124a3e9:       5d                      pop    %ebp
  c124a3ea:       c3                      ret

This was a leaf function.  For no apparent reason, GCC 4.8 decided to
subtract 3 from the stack pointer in the prologue.

Then in the middle of the function, it got an interrupt.  On 64-bit,
interrupts always align the stack, but on 32-bit they don't.  So the
pt_regs were stored at an unaligned address (0xf60bbb25).

The frame pointer encoding logic assumes an aligned stack pointer, so it
didn't work as expected.

  .macro ENCODE_FRAME_POINTER
  #ifdef CONFIG_FRAME_POINTER
  	mov %esp, %ebp
  	orl $0x1, %ebp
  #endif
  .endm

That effectively cleared the LSB of the encoded pt_regs address,
confusing the unwinder.

So on 32-bit, maybe the encoding should clear the MSB instead of setting
the LSB.

-- =

Josh

--===============5169085622673684403==--

