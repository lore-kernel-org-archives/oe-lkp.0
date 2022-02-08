Content-Type: multipart/mixed; boundary="===============1444092158150650405=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86] 1099ce55b0: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 08 Feb 2022 11:03:26 -0800
Message-ID: <202202081100.8A27D97@keescook>
In-Reply-To: <CAKwvOdm1k51OxYqSq1v9UVp8ZptBkJj7FgOA_QhDjEC6vaU+RQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1444092158150650405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 09:44:48AM -0800, Nick Desaulniers wrote:
> On Mon, Feb 7, 2022 at 7:09 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Feb 07, 2022 at 04:23:06PM -0800, Nick Desaulniers wrote:
> > > On Fri, Feb 4, 2022 at 4:37 AM kernel test robot <oliver.sang@intel=
.com> wrote:
> > > > FYI, we noticed the following commit (built with clang-15):
> > > >
> > > > commit: 1099ce55b0530ff429312dc37362ad43aee8c5c0 ("x86: don't build=
 CONFIG_X86_32 as -ffreestanding")
> > > > https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git for-nex=
t/memcpy
> > > >
> > > > in testcase: boot
> > > [...]
> > > I've been having a hard time pinpointing via bisection when this
> > > stopped working.  I suspect it's actually the change on llvm's side
> > > that would replace memcmp with bcmp.  With this diff, we can boot
> > > ARCH=3Di386 defconfig
> > >
> > > ```
> > > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > > index 7ef211865239..5e4570495206 100644
> > > --- a/arch/x86/Makefile
> > > +++ b/arch/x86/Makefile
> > > @@ -88,6 +88,8 @@ ifeq ($(CONFIG_X86_32),y)
> > >          include $(srctree)/arch/x86/Makefile_32.cpu
> > >          KBUILD_CFLAGS +=3D $(cflags-y)
> > >
> > > +        KBUILD_CFLAGS +=3D -fno-builtin-bcmp
> > > +
> > >         ifeq ($(CONFIG_STACKPROTECTOR),y)
> > >                 ifeq ($(CONFIG_SMP),y)
> > >                         KBUILD_CFLAGS +=3D
> > > -mstack-protector-guard-reg=3Dfs
> > > -mstack-protector-guard-symbol=3D__stack_chk_guard
> > > ```
> > >
> > > It looks like the call argument setup in the _callers_ of memcmp is m=
essed up.
> > >
> > > Before:
> > > pushl %ecx
> > > pushl %ebx
> > > pushl -24(%ebp)
> > > calll bcmp
> > >
> > > After:
> > > movl  %ebx, %eax
> > > movl  %esi, %edx
> > > movl  %ecx, %ebx
> > > calll memcmp
> > >
> > > it looks like they're not obeying `-mregparm=3D3`.
> > >
> > > https://godbolt.org/z/z3fjveP4h
> > >
> > > Diffing the IR between `-mregparm=3D3` vs not, it looks like there's =
an
> > > LLVM IR function argument attribute inreg.
> > > https://llvm.org/docs/LangRef.html#parameter-attributes
> > > >> This indicates that this parameter or return value should be treat=
ed in a
> > > >> special target-dependent fashion while emitting code for a functio=
n call
> > > >> or return (usually, by putting it in a register as opposed to memo=
ry,
> > > >> though some targets use it to distinguish between two different ki=
nds of
> > > >> registers). Use of this attribute is target-specific.
> > >
> > > As is tradition, instcombine is not checking+carrying over the
> > > function argument attributes when replacing calls to memcmp w/ bcmp.
> > >
> > > Before:
> > >   %4 =3D call i32 @memcmp(i8* inreg noundef %3, i8* inreg noundef %0,
> > > i32 inreg noundef %1) #4, !dbg !22
> > >
> > > After:
> > >   %bcmp =3D call i32 @bcmp(i8* %3, i8* %0, i32 %1), !dbg !22
> > >
> > > Filed:
> > > https://github.com/llvm/llvm-project/issues/53645
> > [...]
> =

> Yeah, that's what I had in mind yesterday afternoon. Thinking more
> about this in the evening though, I think this is a pretty
> catastrophic compiler bug in LLVM.
> =

> The compiler does change the calling convention (somewhat) as part of
> optimizations when the caller and callee are visible within the same
> TU. Here, the callee is not visible, and yet the caller is modifying
> the calling convention with no corresponding change to the callee.
> =

> Essentially, -ffreestanding is holding -mregparam=3D3 together for
> ARCH=3Di386 LLVM=3D1 builds.  That my above diff that only avoided the
> issue for memcmp -> bcmp was able to boot to command line is kind of a
> miracle.  I'm sure there's all kind of things that don't work right,
> and we can't ship that since it will come back to bite us for 32b x86
> (such as Android Cuttlefish).
> =

> Do we need to remove -ffreestanding for ARCH=3Di386 for FORTIFY_SOURCE
> to work _for GCC_?

Nope!

> If yes, then perhaps we can only add -ffreestanding for clang for now?
> If no, then perhaps we should leave -ffreestanding for now?

i.e. disable FORTIFY on Clang+i386? Ok.

> Either way, I would shelve FORTIFY_SOURCE for ARCH=3Di386 LLVM=3D1 until
> this compiler bug is fixed (and drop my patch, or I can send a v2).
> https://github.com/llvm/llvm-project/issues/53645

I'm fine with that. I can't imagine the combination of
i386+Clang+FORTIFY being in high demand.

> That said, I would consider this lower priority than
> https://github.com/llvm/llvm-project/issues/53118, which looks like a
> very obvious clang-14 regression (the 14 release is almost done, so
> it's time to fix regression NOW) that produces an true positive
> objtool warning.

+1

I will adjust my series...

-- =

Kees Cook
--===============1444092158150650405==--

