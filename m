Content-Type: multipart/mixed; boundary="===============3772278785542583859=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: [PATCH] x86/entry_32: Fix segment exceptions
Date: Wed, 12 Jan 2022 11:55:41 +0100
Message-ID: <Yd6zrbFBzSn3ducx@hirez.programming.kicks-ass.net>
In-Reply-To: <Yd4u2rVVSdpEpwwM@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3772278785542583859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 01:28:58AM +0000, Sean Christopherson wrote:
> On Tue, Jan 11, 2022, Peter Zijlstra wrote:
> > On Thu, Jan 06, 2022 at 04:35:23PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with clang-14):
> > > =

> > > commit: aa93e2ad7464ffb90155a5ffdde963816f86d5dc ("x86/entry_32: Remo=
ve .fixup usage")
> > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/core
> > > =

> > > in testcase: kernel-selftests
> > > version: =

> > > with following parameters:
> > > =

> > > 	group: x86
> > > =

> > =

> > It would be very useful if this thing would also say which of the many
> > x86 selftests fails... it appears to be: ldt_gdt_32.
> > =

> > The below fixes it, but I'm still not entirely sure what the actual
> > problem is, although Andy did find a bug in that the exception handler
> > should do: *(ss:esp) =3D 0, adding ss-base (using insn_get_seg_base())
> > doesn't seem to cure things.
> =

> Because I was curious...
> =

> The issue is that PARANOID_EXIT_TO_KERNEL_MODE in the handle_exception_re=
turn
> path overwrites the entry stack data with the task stack data, restoring =
the "bad"
> segment value.

Full and proper patch below. Boris, if you could merge in x86/core that
branch should then be ready for a pull req.

---
Subject: x86/entry_32: Fix segment exceptions
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 11 Jan 2022 12:11:14 +0100

The LKP robot reported that commit aa93e2ad7464 ("x86/entry_32: Remove
.fixup usage") caused failure. Turns out the ldt_gdt_32 selftest turns
into an infinite loop trying to clear the segment.

As discovered by Sean; what happens is that
PARANOID_EXIT_TO_KERNEL_MODE in the handle_exception_return path
overwrites the entry stack data with the task stack data, restoring
the "bad" segment value.

Instead of having the exception re-take the instruction, have it
emulate the full instruction. Replace EX_TYPE_POP_ZERO with
EX_TYPE_POP_REG which will do the equivalent of: POP %reg;
MOV $imm, %reg.

In order to encode the segment registers, add them as registers 8-11
for 32bit.

By setting regs->[defg]s the (nested) RESTORE_REGS will pop this value
at the end of the exception handler and by increasing regs->sp we'll
have skipped the stack slot.

Fixes: aa93e2ad7464 ("x86/entry_32: Remove .fixup usage")
Reported-by: kernel test robot <oliver.sang@intel.com>
Debugged-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/Yd1l0gInc4zRcnt/@hirez.programming.kicks-as=
s.net
---
 arch/x86/entry/entry_32.S                  |   13 +++++++++----
 arch/x86/include/asm/extable_fixup_types.h |    5 ++++-
 arch/x86/lib/insn-eval.c                   |    5 +++++
 arch/x86/mm/extable.c                      |   17 +++--------------
 4 files changed, 21 insertions(+), 19 deletions(-)

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
+	_ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_POP_ZERO|EX_DATA_REG(8))
+	_ASM_EXTABLE_TYPE(2b, 3b, EX_TYPE_POP_ZERO|EX_DATA_REG(9))
+	_ASM_EXTABLE_TYPE(3b, 4b, EX_TYPE_POP_ZERO|EX_DATA_REG(10))
 .endm
 =

 .macro RESTORE_ALL_NMI cr3_reg:req pop=3D0
--- a/arch/x86/include/asm/extable_fixup_types.h
+++ b/arch/x86/include/asm/extable_fixup_types.h
@@ -16,6 +16,7 @@
 #define EX_DATA_FLAG_SHIFT		12
 #define EX_DATA_IMM_SHIFT		16
 =

+#define EX_DATA_REG(reg)		((reg) << EX_DATA_REG_SHIFT)
 #define EX_DATA_FLAG(flag)		((flag) << EX_DATA_FLAG_SHIFT)
 #define EX_DATA_IMM(imm)		((imm) << EX_DATA_IMM_SHIFT)
 =

@@ -41,7 +42,9 @@
 #define	EX_TYPE_RDMSR_IN_MCE		13
 #define	EX_TYPE_DEFAULT_MCE_SAFE	14
 #define	EX_TYPE_FAULT_MCE_SAFE		15
-#define	EX_TYPE_POP_ZERO		16
+
+#define	EX_TYPE_POP_REG			16 /* reg :=3D (long)imm */
+#define EX_TYPE_POP_ZERO		(EX_TYPE_POP_REG | EX_DATA_IMM(0))
 =

 #define	EX_TYPE_IMM_REG			17 /* reg :=3D (long)imm */
 #define	EX_TYPE_EFAULT_REG		(EX_TYPE_IMM_REG | EX_DATA_IMM(-EFAULT))
--- a/arch/x86/lib/insn-eval.c
+++ b/arch/x86/lib/insn-eval.c
@@ -428,6 +428,11 @@ static const int pt_regoff[] =3D {
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

--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -126,18 +126,6 @@ static bool ex_handler_clear_fs(const st
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
@@ -218,8 +206,9 @@ int fixup_exception(struct pt_regs *regs
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
--===============3772278785542583859==--

