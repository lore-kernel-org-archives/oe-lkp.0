Content-Type: multipart/mixed; boundary="===============3769269825253186499=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: [PATCH 4.9 30/92] x86/asm: Fix inline asm call constraints for GCC 4.4
Date: Fri, 09 Feb 2018 14:38:59 +0100
Message-ID: <20180209133933.368347262@linuxfoundation.org>
In-Reply-To: <20180209133931.211869118@linuxfoundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3769269825253186499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Josh Poimboeuf <jpoimboe@redhat.com>

commit 520a13c530aeb5f63e011d668c42db1af19ed349 upstream.

The kernel test bot (run by Xiaolong Ye) reported that the following commit:

  f5caf621ee35 ("x86/asm: Fix inline asm call constraints for Clang")

is causing double faults in a kernel compiled with GCC 4.4.

Linus subsequently diagnosed the crash pattern and the buggy commit and fou=
nd that
the issue is with this code:

  register unsigned int __asm_call_sp asm("esp");
  #define ASM_CALL_CONSTRAINT "+r" (__asm_call_sp)

Even on a 64-bit kernel, it's using ESP instead of RSP.  That causes GCC
to produce the following bogus code:

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

Reported-and-Bisected-and-Tested-by: kernel test robot <xiaolong.ye@intel=
.com>
Diagnosed-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitriy Vyukov <dvyukov@google.com>
Cc: LKP <lkp@01.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Miguel Bernal Marin <miguel.bernal.marin@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Fixes: f5caf621ee35 ("x86/asm: Fix inline asm call constraints for Clang")
Link: http://lkml.kernel.org/r/20170928215826.6sdpmwtkiydiytim(a)treble
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/x86/include/asm/asm.h |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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



--===============3769269825253186499==--

