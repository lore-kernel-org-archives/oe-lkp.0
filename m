Content-Type: multipart/mixed; boundary="===============0645423908256765083=="
MIME-Version: 1.0
From: Alexey Dobriyan <adobriyan@gmail.com>
To: lkp@lists.01.org
Subject: [PATCH v2] x86/asm: Pad assembly functions with INT3 instructions
Date: Wed, 16 May 2018 01:58:45 +0300
Message-ID: <20180515225845.GB21902@avx2>
In-Reply-To: <20180515225028.GA21902@avx2>
List-Id: <oe-lkp.lists.linux.dev>

--===============0645423908256765083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use INT3 instead of NOP. All that padding between functions is
an illegal area, no legitimate code should jump into it.

I've checked x86_64 allyesconfig disassembly, all changes looks sane:
INT3 is only used after RET or unconditional JMP.

On i386:
* promote ret_from_exception into ENTRY as it has corresponding END,
* demote "resume_userspace" -- unused,
* delete ALIGN directive in page_fault. It is leftover from x86 assembly
  cleanups.

    commit d211af055d0c12dc3416c2886e6fbdc6eb74a381
    i386: get rid of the use of KPROBE_ENTRY / KPROBE_END

  has ALIGN directive before branch target which makes sense.
  All the code after ALIGN disappeared later.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/x86/entry/entry_32.S      |    6 +-----
 arch/x86/include/asm/linkage.h |    2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -320,8 +320,7 @@ END(ret_from_fork)
  */
 =

 	# userspace resumption stub bypassing syscall exit tracing
-	ALIGN
-ret_from_exception:
+ENTRY(ret_from_exception)
 	preempt_stop(CLBR_ANY)
 ret_from_intr:
 #ifdef CONFIG_VM86
@@ -337,8 +336,6 @@ ret_from_intr:
 #endif
 	cmpl	$USER_RPL, %eax
 	jb	resume_kernel			# not returning to v8086 or userspace
-
-ENTRY(resume_userspace)
 	DISABLE_INTERRUPTS(CLBR_ANY)
 	TRACE_IRQS_OFF
 	movl	%esp, %eax
@@ -910,7 +907,6 @@ BUILD_INTERRUPT3(hv_stimer0_callback_vector, HYPERV_STI=
MER0_VECTOR,
 ENTRY(page_fault)
 	ASM_CLAC
 	pushl	$do_page_fault
-	ALIGN
 	jmp common_exception
 END(page_fault)
 =

--- a/arch/x86/include/asm/linkage.h
+++ b/arch/x86/include/asm/linkage.h
@@ -18,7 +18,7 @@
 	name:
 =

 #if defined(CONFIG_X86_64) || defined(CONFIG_X86_ALIGNMENT_16)
-#define __ALIGN		.p2align 4, 0x90
+#define __ALIGN		.p2align 4, 0xCC
 #define __ALIGN_STR	__stringify(__ALIGN)
 #endif
=20

--===============0645423908256765083==--

