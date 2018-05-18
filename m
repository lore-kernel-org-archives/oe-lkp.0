Content-Type: multipart/mixed; boundary="===============9201628732698407600=="
MIME-Version: 1.0
From: Alexey Dobriyan <adobriyan@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] x86/asm: Pad assembly functions with INT3 instructions
Date: Fri, 18 May 2018 20:34:46 +0300
Message-ID: <20180518173446.GA2055@avx2>
In-Reply-To: <20180518130224.4bmp6s6wnjucypml@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============9201628732698407600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 08:02:24AM -0500, Josh Poimboeuf wrote:
> On Fri, May 18, 2018 at 09:36:44AM +0200, Ingo Molnar wrote:
> > =

> > * Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > =

> > > Use INT3 instead of NOP. All that padding between functions is
> > > an illegal area, no legitimate code should jump into it.
> > > =

> > > I've checked x86_64 allyesconfig disassembly, all changes looks sane:
> > > INT3 is only used after RET or unconditional JMP.
> > > =

> > > On i386:
> > > * promote ret_from_exception into ENTRY as it has corresponding END,
> > > * demote "resume_userspace" -- unused,
> > > * delete ALIGN directive in page_fault. It is leftover from x86 assem=
bly
> > >   cleanups.
> > > =

> > >     commit d211af055d0c12dc3416c2886e6fbdc6eb74a381
> > >     i386: get rid of the use of KPROBE_ENTRY / KPROBE_END
> > > =

> > >   has ALIGN directive before branch target which makes sense.
> > >   All the code after ALIGN disappeared later.
> > > =

> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > ---
> > > =

> > >  arch/x86/entry/entry_32.S      |    6 +-----
> > >  arch/x86/include/asm/linkage.h |    2 +-
> > >  2 files changed, 2 insertions(+), 6 deletions(-)
> > > =

> > > --- a/arch/x86/entry/entry_32.S
> > > +++ b/arch/x86/entry/entry_32.S
> > > @@ -320,8 +320,7 @@ END(ret_from_fork)
> > >   */
> > >  =

> > >  	# userspace resumption stub bypassing syscall exit tracing
> > > -	ALIGN
> > > -ret_from_exception:
> > > +ENTRY(ret_from_exception)
> > >  	preempt_stop(CLBR_ANY)
> > >  ret_from_intr:
> > >  #ifdef CONFIG_VM86
> > > @@ -337,8 +336,6 @@ ret_from_intr:
> > >  #endif
> > >  	cmpl	$USER_RPL, %eax
> > >  	jb	resume_kernel			# not returning to v8086 or userspace
> > > -
> > > -ENTRY(resume_userspace)
> > >  	DISABLE_INTERRUPTS(CLBR_ANY)
> > >  	TRACE_IRQS_OFF
> > >  	movl	%esp, %eax
> > > @@ -910,7 +907,6 @@ BUILD_INTERRUPT3(hv_stimer0_callback_vector, HYPE=
RV_STIMER0_VECTOR,
> > >  ENTRY(page_fault)
> > >  	ASM_CLAC
> > >  	pushl	$do_page_fault
> > > -	ALIGN
> > >  	jmp common_exception
> > >  END(page_fault)
> > >  =

> > > --- a/arch/x86/include/asm/linkage.h
> > > +++ b/arch/x86/include/asm/linkage.h
> > > @@ -18,7 +18,7 @@
> > >  	name:
> > >  =

> > >  #if defined(CONFIG_X86_64) || defined(CONFIG_X86_ALIGNMENT_16)
> > > -#define __ALIGN		.p2align 4, 0x90
> > > +#define __ALIGN		.p2align 4, 0xCC
> > >  #define __ALIGN_STR	__stringify(__ALIGN)
> > >  #endif
> > =

> > So the question is, without objtool support, how will we find INT3-padd=
ing related =

> > crash bugs on 32-bit kernels?
> =

> Is the INT3 padding really worth it, even on x86-64?  What problem are
> we trying to solve?

It is a start: manual padding, then compiler inserted padding, then
kernel CFI (in the future).

The only ways processor can end up in the padding are memory corruption,
exploit, some kind of miscompilation or CPU bug. In every case it is better
to crash immediately.

> I've seen cases with GCC functions falling through, but with asm code,
> falling through could just be working as designed.

Manual NOP align still can be inserted, fallthough is not the common case.

--===============9201628732698407600==--

