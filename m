Content-Type: multipart/mixed; boundary="===============2851815328014296766=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86] 1099ce55b0: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 07 Feb 2022 19:09:32 -0800
Message-ID: <202202071858.0B5538E7CB@keescook>
In-Reply-To: <CAKwvOdm0+bB=UY91V=ai2TPg3XCbNUZQfBzxrSUA0AtW=zM=LA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2851815328014296766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 04:23:06PM -0800, Nick Desaulniers wrote:
> On Fri, Feb 4, 2022 at 4:37 AM kernel test robot <oliver.sang@intel.com=
> wrote:
> > FYI, we noticed the following commit (built with clang-15):
> >
> > commit: 1099ce55b0530ff429312dc37362ad43aee8c5c0 ("x86: don't build CON=
FIG_X86_32 as -ffreestanding")
> > https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git for-next/me=
mcpy
> >
> > in testcase: boot
> [...]
> I've been having a hard time pinpointing via bisection when this
> stopped working.  I suspect it's actually the change on llvm's side
> that would replace memcmp with bcmp.  With this diff, we can boot
> ARCH=3Di386 defconfig

Thanks for spending the time on this!

> =

> ```
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 7ef211865239..5e4570495206 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -88,6 +88,8 @@ ifeq ($(CONFIG_X86_32),y)
>          include $(srctree)/arch/x86/Makefile_32.cpu
>          KBUILD_CFLAGS +=3D $(cflags-y)
> =

> +        KBUILD_CFLAGS +=3D -fno-builtin-bcmp
> +
>         ifeq ($(CONFIG_STACKPROTECTOR),y)
>                 ifeq ($(CONFIG_SMP),y)
>                         KBUILD_CFLAGS +=3D
> -mstack-protector-guard-reg=3Dfs
> -mstack-protector-guard-symbol=3D__stack_chk_guard
> ```
> =

> It looks like the call argument setup in the _callers_ of memcmp is messe=
d up.
> =

> Before:
> pushl %ecx
> pushl %ebx
> pushl -24(%ebp)
> calll bcmp
> =

> After:
> movl  %ebx, %eax
> movl  %esi, %edx
> movl  %ecx, %ebx
> calll memcmp
> =

> it looks like they're not obeying `-mregparm=3D3`.
> =

> https://godbolt.org/z/z3fjveP4h
> =

> Diffing the IR between `-mregparm=3D3` vs not, it looks like there's an
> LLVM IR function argument attribute inreg.
> https://llvm.org/docs/LangRef.html#parameter-attributes
> >> This indicates that this parameter or return value should be treated i=
n a
> >> special target-dependent fashion while emitting code for a function ca=
ll
> >> or return (usually, by putting it in a register as opposed to memory,
> >> though some targets use it to distinguish between two different kinds =
of
> >> registers). Use of this attribute is target-specific.
> =

> As is tradition, instcombine is not checking+carrying over the
> function argument attributes when replacing calls to memcmp w/ bcmp.
> =

> Before:
>   %4 =3D call i32 @memcmp(i8* inreg noundef %3, i8* inreg noundef %0,
> i32 inreg noundef %1) #4, !dbg !22
> =

> After:
>   %bcmp =3D call i32 @bcmp(i8* %3, i8* %0, i32 %1), !dbg !22
> =

> Filed:
> https://github.com/llvm/llvm-project/issues/53645
> =

> So I think the best course of action is to disable memcmp to bcmp
> BEFORE the removal of -ffreestanding, and only for clang until we have
> a fix in hand.

What do you mean about BEFORE the removal of -ffreestanding? As in, add
two patches, one to add -fno-builtin-bcmp and the next to remove
-ffreestanding? i.e.:


diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index e84cdd409b64..c92f69e916b4 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -90,6 +90,9 @@ ifeq ($(CONFIG_X86_32),y)
 =

         # temporary until string.h is fixed
         KBUILD_CFLAGS +=3D -ffreestanding
+        ifdef CONFIG_CC_IS_CLANG
+                KBUILD_CFLAGS +=3D -fno-builtin-bcmp
+        endif
 =

 	ifeq ($(CONFIG_STACKPROTECTOR),y)
 		ifeq ($(CONFIG_SMP),y)


then:



diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index c92f69e916b4..f56936aeed9e 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -88,8 +88,6 @@ ifeq ($(CONFIG_X86_32),y)
         include $(srctree)/arch/x86/Makefile_32.cpu
         KBUILD_CFLAGS +=3D $(cflags-y)
 =

-        # temporary until string.h is fixed
-        KBUILD_CFLAGS +=3D -ffreestanding
         ifdef CONFIG_CC_IS_CLANG
                 KBUILD_CFLAGS +=3D -fno-builtin-bcmp
         endif

?

-- =

Kees Cook
--===============2851815328014296766==--

