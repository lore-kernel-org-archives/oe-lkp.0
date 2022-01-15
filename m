Content-Type: multipart/mixed; boundary="===============4671895081695059198=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/entry_32: Fix segment exceptions
Date: Sat, 15 Jan 2022 09:13:24 +0100
Message-ID: <YeKCJHju0owRVFoT@zn.tnic>
In-Reply-To: <760ea801-8394-4e0c-9ec3-23e36e436551@www.fastmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4671895081695059198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 03:48:31PM -0800, Andy Lutomirski wrote:
> Acked-by: Andy Lutomirski <luto@kernel.org>

I actually did this new version:

---
From: Borislav Petkov <bp@suse.de>
Subject: [PATCH] x86/entry_32: Remove GS from the pt_regs offsets and fixup=
 regs

Document how GS (and its stack slot) on 32-bit are used.

Fixes: 9cdbeec40968 ("x86/entry_32: Fix segment exceptions")
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 arch/x86/entry/entry_32.S                  | 4 +++-
 arch/x86/include/asm/extable_fixup_types.h | 5 +++--
 arch/x86/lib/insn-eval.c                   | 5 ++++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index a7ec22b1d06c..addc3966ee20 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -20,7 +20,9 @@
  *	1C(%esp) - %ds
  *	20(%esp) - %es
  *	24(%esp) - %fs
- *	28(%esp) - unused -- was %gs on old stackprotector kernels
+ *	28(%esp) - unused -- was %gs on old stackprotector kernels. %gs is unus=
ed in
+ *	kernel mode in 32-bit and holds the user value. When handling exception=
s, the
+ *	C-exception handler address is pushed into the GS-slot on the stack.
  *	2C(%esp) - orig_eax
  *	30(%esp) - %eip
  *	34(%esp) - %cs
diff --git a/arch/x86/include/asm/extable_fixup_types.h b/arch/x86/include/=
asm/extable_fixup_types.h
index 503622627400..0aa5f4d3234f 100644
--- a/arch/x86/include/asm/extable_fixup_types.h
+++ b/arch/x86/include/asm/extable_fixup_types.h
@@ -20,11 +20,12 @@
 #define EX_DATA_FLAG(flag)		((flag) << EX_DATA_FLAG_SHIFT)
 #define EX_DATA_IMM(imm)		((imm) << EX_DATA_IMM_SHIFT)
 =

-/* segment regs */
+#ifdef CONFIG_X86_32
+/* segment regs, valid only for 32-bit code, see pt_regoff */
 #define EX_REG_DS			EX_DATA_REG(8)
 #define EX_REG_ES			EX_DATA_REG(9)
 #define EX_REG_FS			EX_DATA_REG(10)
-#define EX_REG_GS			EX_DATA_REG(11)
+#endif
 =

 /* flags */
 #define EX_FLAG_CLEAR_AX		EX_DATA_FLAG(1)
diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
index b781d324211b..cfc4d13b7d5b 100644
--- a/arch/x86/lib/insn-eval.c
+++ b/arch/x86/lib/insn-eval.c
@@ -432,7 +432,10 @@ static const int pt_regoff[] =3D {
 	offsetof(struct pt_regs, ds),
 	offsetof(struct pt_regs, es),
 	offsetof(struct pt_regs, fs),
-	offsetof(struct pt_regs, gs),
+	/*
+	 * Can't use that one, see top of entry_32.S
+	 * offsetof(struct pt_regs, gs),
+	 */
 #endif
 };
 =

-- =

2.29.2


-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============4671895081695059198==--

