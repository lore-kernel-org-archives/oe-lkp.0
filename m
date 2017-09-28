Content-Type: multipart/mixed; boundary="===============5888456857777264119=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH] x86/asm: Fix inline asm call constraints for GCC 4.4
Date: Thu, 28 Sep 2017 16:58:26 -0500
Message-ID: <20170928215826.6sdpmwtkiydiytim@treble>
In-Reply-To: <20170928191032.5fhnyrark5ebov4c@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============5888456857777264119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kernel test bot reported that

  f5caf621ee35 ("x86/asm: Fix inline asm call constraints for Clang")

is causing double faults in a kernel compiled with GCC 4.4.  The issue
is with this code:

  register unsigned int __asm_call_sp asm("esp");
  #define ASM_CALL_CONSTRAINT "+r" (__asm_call_sp)

Even on a 64-bit kernel, it's using ESP instead of RSP.  That causes GCC
to produce the following:

  ffffffff8147461d:       89 e0                   mov    %esp,%eax
  ffffffff8147461f:       4c 89 f7                mov    %r14,%rdi
  ffffffff81474622:       4c 89 fe                mov    %r15,%rsi
  ffffffff81474625:       ba 20 00 00 00          mov    $0x20,%edx
  ffffffff8147462a:       89 c4                   mov    %eax,%esp
  ffffffff8147462c:       e8 bf 52 05 00          callq  ffffffff814c98f0 <=
copy_user_generic_unrolled>

Despite the absurdity of it backing up and restoring the stack pointer
for no reason, the bug is actually the fact that it's only backing up
and restoring the lower 32 bits of the stack pointer.  The upper 32 bits
are getting cleared out, corrupting the stack pointer.

So change the '__asm_call_sp' register variable to be associated with
the actual full-size stack pointer.

This also requires changing the __ASM_SEL() macro to be based on the
actual compiled arch size, rather than the CONFIG value, because
CONFIG_X86_64 compiles some files with '-m32' (e.g., realmode and vdso).
Otherwise Clang fails to build the kernel because it complains about the
use of a 64-bit register (RSP) in a 32-bit file.

Reported-by: kernel test robot <xiaolong.ye@intel.com>
Fixes: f5caf621ee35 ("x86/asm: Fix inline asm call constraints for Clang")
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 arch/x86/include/asm/asm.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
 =

-- =

2.13.5


--===============5888456857777264119==--

