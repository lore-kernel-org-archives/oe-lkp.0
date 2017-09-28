Content-Type: multipart/mixed; boundary="===============5556901392917484685=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] f5caf621ee: PANIC:double_fault
Date: Thu, 28 Sep 2017 12:01:21 -0500
Message-ID: <20170928170121.qpyyfjijuwdkfx7g@treble>
In-Reply-To: <20170928164422.sl4z4sfbkyscbxrk@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============5556901392917484685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 11:44:22AM -0500, Josh Poimboeuf wrote:
> Agreed, changing it to "unsigned long" and "rsp" will probably fix it.
> =

> I had made it "unsigned int" because of a clang issue with "unsigned
> long":
> =

>     CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
>   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:32:
>   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:15:
>   In file included from ./arch/x86/include/asm/vgtod.h:5:
>   In file included from ./include/linux/clocksource.h:12:
>   In file included from ./include/linux/timex.h:56:
>   In file included from ./include/uapi/linux/timex.h:56:
>   In file included from ./include/linux/time.h:5:
>   In file included from ./include/linux/seqlock.h:35:
>   In file included from ./include/linux/spinlock.h:50:
>   In file included from ./include/linux/preempt.h:10:
>   In file included from ./include/linux/list.h:8:
>   In file included from ./include/linux/kernel.h:10:
>   In file included from ./include/linux/bitops.h:37:
>   In file included from ./arch/x86/include/asm/bitops.h:16:
>   In file included from ./arch/x86/include/asm/alternative.h:9:
>   ./arch/x86/include/asm/asm.h:142:42: error: register 'rsp' unsuitable f=
or global register variables on this target
>   register unsigned long __asm_call_sp asm("rsp");
> =

> And I think we saw the same error in the realmode code.
> =

> So we may need to tweak the macro a bit.

Going to try the following patch.

diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
index c1eadbaf1115..30c3c9ac784a 100644
--- a/arch/x86/include/asm/asm.h
+++ b/arch/x86/include/asm/asm.h
@@ -11,10 +11,12 @@
 # define __ASM_FORM_COMMA(x) " " #x ","
 #endif
 =

-#ifdef CONFIG_X86_32
+#ifndef __x86_64__
+/* 32 bit */
 # define __ASM_SEL(a,b) __ASM_FORM(a)
 # define __ASM_SEL_RAW(a,b) __ASM_FORM_RAW(a)
 #else
+/* 64 bit */
 # define __ASM_SEL(a,b) __ASM_FORM(b)
 # define __ASM_SEL_RAW(a,b) __ASM_FORM_RAW(b)
 #endif
@@ -139,7 +141,7 @@
  * gets set up by the containing function.  If you forget to do this, objt=
ool
  * may print a "call without frame pointer save/setup" warning.
  */
-register unsigned int __asm_call_sp asm("esp");
+register unsigned long __asm_call_sp asm(_ASM_SP);
 #define ASM_CALL_CONSTRAINT "+r" (__asm_call_sp)
 #endif
=20

--===============5556901392917484685==--

