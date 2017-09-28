Content-Type: multipart/mixed; boundary="===============4446011792686414205=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] f5caf621ee: PANIC:double_fault
Date: Thu, 28 Sep 2017 14:10:32 -0500
Message-ID: <20170928191032.5fhnyrark5ebov4c@treble>
In-Reply-To: <20170928170121.qpyyfjijuwdkfx7g@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============4446011792686414205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 12:01:21PM -0500, Josh Poimboeuf wrote:
> On Thu, Sep 28, 2017 at 11:44:22AM -0500, Josh Poimboeuf wrote:
> > Agreed, changing it to "unsigned long" and "rsp" will probably fix it.
> > =

> > I had made it "unsigned int" because of a clang issue with "unsigned
> > long":
> > =

> >     CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
> >   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:32:
> >   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:=
15:
> >   In file included from ./arch/x86/include/asm/vgtod.h:5:
> >   In file included from ./include/linux/clocksource.h:12:
> >   In file included from ./include/linux/timex.h:56:
> >   In file included from ./include/uapi/linux/timex.h:56:
> >   In file included from ./include/linux/time.h:5:
> >   In file included from ./include/linux/seqlock.h:35:
> >   In file included from ./include/linux/spinlock.h:50:
> >   In file included from ./include/linux/preempt.h:10:
> >   In file included from ./include/linux/list.h:8:
> >   In file included from ./include/linux/kernel.h:10:
> >   In file included from ./include/linux/bitops.h:37:
> >   In file included from ./arch/x86/include/asm/bitops.h:16:
> >   In file included from ./arch/x86/include/asm/alternative.h:9:
> >   ./arch/x86/include/asm/asm.h:142:42: error: register 'rsp' unsuitable=
 for global register variables on this target
> >   register unsigned long __asm_call_sp asm("rsp");
> > =

> > And I think we saw the same error in the realmode code.
> > =

> > So we may need to tweak the macro a bit.
> =

> Going to try the following patch.
> =

> diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
> index c1eadbaf1115..30c3c9ac784a 100644
> --- a/arch/x86/include/asm/asm.h
> +++ b/arch/x86/include/asm/asm.h
> @@ -11,10 +11,12 @@
>  # define __ASM_FORM_COMMA(x) " " #x ","
>  #endif
>  =

> -#ifdef CONFIG_X86_32
> +#ifndef __x86_64__
> +/* 32 bit */
>  # define __ASM_SEL(a,b) __ASM_FORM(a)
>  # define __ASM_SEL_RAW(a,b) __ASM_FORM_RAW(a)
>  #else
> +/* 64 bit */
>  # define __ASM_SEL(a,b) __ASM_FORM(b)
>  # define __ASM_SEL_RAW(a,b) __ASM_FORM_RAW(b)
>  #endif
> @@ -139,7 +141,7 @@
>   * gets set up by the containing function.  If you forget to do this, ob=
jtool
>   * may print a "call without frame pointer save/setup" warning.
>   */
> -register unsigned int __asm_call_sp asm("esp");
> +register unsigned long __asm_call_sp asm(_ASM_SP);
>  #define ASM_CALL_CONSTRAINT "+r" (__asm_call_sp)
>  #endif

Confirmed that this patch works on both compilers, and fixes GCC 4.4.

GCC 4.4 before:

  ffffffff8147461d:       89 e0                   mov    %esp,%eax
  ffffffff8147461f:       4c 89 f7                mov    %r14,%rdi
  ffffffff81474622:       4c 89 fe                mov    %r15,%rsi
  ffffffff81474625:       ba 20 00 00 00          mov    $0x20,%edx
  ffffffff8147462a:       89 c4                   mov    %eax,%esp
  ffffffff8147462c:       e8 bf 52 05 00          callq  ffffffff814c98f0 <=
copy_user_generic_unrolled>

after:

  ffffffff8147461e:       48 89 e0                mov    %rsp,%rax
  ffffffff81474621:       4c 89 f7                mov    %r14,%rdi
  ffffffff81474624:       4c 89 fe                mov    %r15,%rsi
  ffffffff81474627:       ba 20 00 00 00          mov    $0x20,%edx
  ffffffff8147462c:       48 89 c4                mov    %rax,%rsp
  ffffffff8147462f:       e8 cc 52 05 00          callq  ffffffff814c9900 <=
copy_user_generic_unrolled>

It still has the "back up and restore the stack pointer just for the fun
of it" thing, but at least the corruption is gone.

Will finalize the patch and send it along to tip.

-- =

Josh

--===============4446011792686414205==--

