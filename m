Content-Type: multipart/mixed; boundary="===============2419337413231030314=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH 2/4] x86/unwind: Use MSB for frame pointer encoding on 32-bit
Date: Mon, 09 Oct 2017 20:20:03 -0500
Message-ID: <279a26996a482ca716605c7dbc7f2db9d8d91e81.1507597785.git.jpoimboe@redhat.com>
In-Reply-To: <cover.1507597785.git.jpoimboe@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2419337413231030314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On x86-32, Tetsuo Handa and Fengguang Wu reported unwinder warnings
like:

  WARNING: kernel stack regs at f60bb9c8 in swapper:1 has bad 'bp' value 0b=
a00000

And also there were some stack dumps with a bunch of unreliable '?'
symbols after an apic_timer_interrupt symbol, meaning the unwinder got
confused when it tried to read the regs.

The cause of those issues is that, with GCC 4.8 (and possibly older),
there are cases where GCC misaligns the stack pointer in a leaf function
for no apparent reason:

  c124a388 <acpi_rs_move_data>:
  c124a388:       55                      push   %ebp
  c124a389:       89 e5                   mov    %esp,%ebp
  c124a38b:       57                      push   %edi
  c124a38c:       56                      push   %esi
  c124a38d:       89 d6                   mov    %edx,%esi
  c124a38f:       53                      push   %ebx
  c124a390:       31 db                   xor    %ebx,%ebx
  c124a392:       83 ec 03                sub    $0x3,%esp
  ...
  c124a3e3:       83 c4 03                add    $0x3,%esp
  c124a3e6:       5b                      pop    %ebx
  c124a3e7:       5e                      pop    %esi
  c124a3e8:       5f                      pop    %edi
  c124a3e9:       5d                      pop    %ebp
  c124a3ea:       c3                      ret

If an interrupt occurs in such a function, the regs on the stack will be
unaligned, which breaks the frame pointer encoding assumption.  So on
32-bit, use the MSB instead of the LSB to encode the regs.

This isn't an issue on 64-bit, because interrupts align the stack before
writing to it.

Reported-and-tested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Reported-and-tested-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 arch/x86/entry/entry_32.S      |  4 ++--
 arch/x86/kernel/unwind_frame.c | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index 8a13d468635a..50e0d2bc4528 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -176,7 +176,7 @@
 /*
  * This is a sneaky trick to help the unwinder find pt_regs on the stack. =
 The
  * frame pointer is replaced with an encoded pointer to pt_regs.  The enco=
ding
- * is just setting the LSB, which makes it an invalid stack address and is=
 also
+ * is just clearing the MSB, which makes it an invalid stack address and i=
s also
  * a signal to the unwinder that it's a pt_regs pointer in disguise.
  *
  * NOTE: This macro must be used *after* SAVE_ALL because it corrupts the
@@ -185,7 +185,7 @@
 .macro ENCODE_FRAME_POINTER
 #ifdef CONFIG_FRAME_POINTER
 	mov %esp, %ebp
-	orl $0x1, %ebp
+	andl $0x7fffffff, %ebp
 #endif
 .endm
 =

diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
index d05637726c10..4949bbc95f75 100644
--- a/arch/x86/kernel/unwind_frame.c
+++ b/arch/x86/kernel/unwind_frame.c
@@ -174,6 +174,7 @@ static bool is_last_task_frame(struct unwind_state *sta=
te)
  * This determines if the frame pointer actually contains an encoded point=
er to
  * pt_regs on the stack.  See ENCODE_FRAME_POINTER.
  */
+#ifdef CONFIG_X86_64
 static struct pt_regs *decode_frame_pointer(unsigned long *bp)
 {
 	unsigned long regs =3D (unsigned long)bp;
@@ -183,6 +184,17 @@ static struct pt_regs *decode_frame_pointer(unsigned l=
ong *bp)
 =

 	return (struct pt_regs *)(regs & ~0x1);
 }
+#else
+static struct pt_regs *decode_frame_pointer(unsigned long *bp)
+{
+	unsigned long regs =3D (unsigned long)bp;
+
+	if (regs & 0x80000000)
+		return NULL;
+
+	return (struct pt_regs *)(regs | 0x80000000);
+}
+#endif
 =

 #ifdef CONFIG_X86_32
 #define KERNEL_REGS_SIZE (sizeof(struct pt_regs) - 2*sizeof(long))
-- =

2.13.6


--===============2419337413231030314==--

