Content-Type: multipart/mixed; boundary="===============8834642412331660186=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/entry_32: Fix segment exceptions
Date: Wed, 12 Jan 2022 16:42:25 +0100
Message-ID: <Yd724f1Uv1GTZ+46@zn.tnic>
In-Reply-To: <Yd6zrbFBzSn3ducx@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8834642412331660186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 11:55:41AM +0100, Peter Zijlstra wrote:
> Full and proper patch below. Boris, if you could merge in x86/core that
> branch should then be ready for a pull req.

I've got this as the final version. Scream if something's wrong.

---
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 11 Jan 2022 12:11:14 +0100
Subject: [PATCH] x86/entry_32: Fix segment exceptions

The LKP robot reported that commit in Fixes: caused a failure. Turns out
the ldt_gdt_32 selftest turns into an infinite loop trying to clear the
segment.

As discovered by Sean, what happens is that PARANOID_EXIT_TO_KERNEL_MODE
in the handle_exception_return path overwrites the entry stack data with
the task stack data, restoring the "bad" segment value.

Instead of having the exception retry the instruction, have it emulate
the full instruction. Replace EX_TYPE_POP_ZERO with EX_TYPE_POP_REG
which will do the equivalent of: POP %reg; MOV $imm, %reg.

In order to encode the segment registers, add them as registers 8-11 for
32-bit.

By setting regs->[defg]s the (nested) RESTORE_REGS will pop this value
at the end of the exception handler and by increasing regs->sp, it will
have skipped the stack slot.

This was debugged by Sean Christopherson <seanjc@google.com>.

 [ bp: Add EX_REG_GS too. ]

Fixes: aa93e2ad7464 ("x86/entry_32: Remove .fixup usage")
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Link: https://lore.kernel.org/r/Yd1l0gInc4zRcnt/@hirez.programming.kicks-as=
s.net
---
 arch/x86/entry/entry_32.S                  | 13 +++++++++----
 arch/x86/include/asm/extable_fixup_types.h | 11 ++++++++++-
 arch/x86/lib/insn-eval.c                   |  5 +++++
 arch/x86/mm/extable.c                      | 17 +++--------------
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index e0a95d8a6553..a7ec22b1d06c 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -268,11 +268,16 @@
 1:	popl	%ds
 2:	popl	%es
 3:	popl	%fs
-	addl	$(4 + \pop), %esp	/* pop the unused "gs" slot */
+4:	addl	$(4 + \pop), %esp	/* pop the unused "gs" slot */
 	IRET_FRAME
-	_ASM_EXTABLE_TYPE(1b, 1b, EX_TYPE_POP_ZERO)
-	_ASM_EXTABLE_TYPE(2b, 2b, EX_TYPE_POP_ZERO)
-	_ASM_EXTABLE_TYPE(3b, 3b, EX_TYPE_POP_ZERO)
+
+	/*
+	 * There is no _ASM_EXTABLE_TYPE_REG() for ASM, however since this is
+	 * ASM the registers are known and we can trivially hard-code them.
+	 */
+	_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_POP_ZERO|EX_REG_DS)
+	_ASM_EXTABLE_TYPE(2b, 3b, EX_TYPE_POP_ZERO|EX_REG_ES)
+	_ASM_EXTABLE_TYPE(3b, 4b, EX_TYPE_POP_ZERO|EX_REG_FS)
 .endm
 =

 .macro RESTORE_ALL_NMI cr3_reg:req pop=3D0
diff --git a/arch/x86/include/asm/extable_fixup_types.h b/arch/x86/include/=
asm/extable_fixup_types.h
index b5ab333e064a..503622627400 100644
--- a/arch/x86/include/asm/extable_fixup_types.h
+++ b/arch/x86/include/asm/extable_fixup_types.h
@@ -16,9 +16,16 @@
 #define EX_DATA_FLAG_SHIFT		12
 #define EX_DATA_IMM_SHIFT		16
 =

+#define EX_DATA_REG(reg)		((reg) << EX_DATA_REG_SHIFT)
 #define EX_DATA_FLAG(flag)		((flag) << EX_DATA_FLAG_SHIFT)
 #define EX_DATA_IMM(imm)		((imm) << EX_DATA_IMM_SHIFT)
 =

+/* segment regs */
+#define EX_REG_DS			EX_DATA_REG(8)
+#define EX_REG_ES			EX_DATA_REG(9)
+#define EX_REG_FS			EX_DATA_REG(10)
+#define EX_REG_GS			EX_DATA_REG(11)
+
 /* flags */
 #define EX_FLAG_CLEAR_AX		EX_DATA_FLAG(1)
 #define EX_FLAG_CLEAR_DX		EX_DATA_FLAG(2)
@@ -41,7 +48,9 @@
 #define	EX_TYPE_RDMSR_IN_MCE		13
 #define	EX_TYPE_DEFAULT_MCE_SAFE	14
 #define	EX_TYPE_FAULT_MCE_SAFE		15
-#define	EX_TYPE_POP_ZERO		16
+
+#define	EX_TYPE_POP_REG			16 /* sp +=3D sizeof(long) */
+#define EX_TYPE_POP_ZERO		(EX_TYPE_POP_REG | EX_DATA_IMM(0))
 =

 #define	EX_TYPE_IMM_REG			17 /* reg :=3D (long)imm */
 #define	EX_TYPE_EFAULT_REG		(EX_TYPE_IMM_REG | EX_DATA_IMM(-EFAULT))
diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
index 7760d228041b..c8a962c2e653 100644
--- a/arch/x86/lib/insn-eval.c
+++ b/arch/x86/lib/insn-eval.c
@@ -430,6 +430,11 @@ static const int pt_regoff[] =3D {
 	offsetof(struct pt_regs, r13),
 	offsetof(struct pt_regs, r14),
 	offsetof(struct pt_regs, r15),
+#else
+	offsetof(struct pt_regs, ds),
+	offsetof(struct pt_regs, es),
+	offsetof(struct pt_regs, fs),
+	offsetof(struct pt_regs, gs),
 #endif
 };
 =

diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index 41eaa648349e..dba2197c05c3 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -126,18 +126,6 @@ static bool ex_handler_clear_fs(const struct exception=
_table_entry *fixup,
 	return ex_handler_default(fixup, regs);
 }
 =

-static bool ex_handler_pop_zero(const struct exception_table_entry *fixup,
-				struct pt_regs *regs)
-{
-	/*
-	 * Typically used for when "pop %seg" traps, in which case we'll clear
-	 * the stack slot and re-try the instruction, which will then succeed
-	 * to pop zero.
-	 */
-	*((unsigned long *)regs->sp) =3D 0;
-	return ex_handler_default(fixup, regs);
-}
-
 static bool ex_handler_imm_reg(const struct exception_table_entry *fixup,
 			       struct pt_regs *regs, int reg, int imm)
 {
@@ -218,8 +206,9 @@ int fixup_exception(struct pt_regs *regs, int trapnr, u=
nsigned long error_code,
 	case EX_TYPE_RDMSR_IN_MCE:
 		ex_handler_msr_mce(regs, false);
 		break;
-	case EX_TYPE_POP_ZERO:
-		return ex_handler_pop_zero(e, regs);
+	case EX_TYPE_POP_REG:
+		regs->sp +=3D sizeof(long);
+		fallthrough;
 	case EX_TYPE_IMM_REG:
 		return ex_handler_imm_reg(e, regs, reg, imm);
 	case EX_TYPE_FAULT_SGX:
-- =

2.29.2

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============8834642412331660186==--

