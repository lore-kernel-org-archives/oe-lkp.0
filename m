Content-Type: multipart/mixed; boundary="===============6241086076463017268=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 17:40:08 -0500
Message-ID: <20171004224008.3gbwuzn3zfwpidh3@treble>
In-Reply-To: <201710040644.GJE89219.FOHMFSFOVtOQLJ@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============6241086076463017268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2017 at 06:44:50AM +0900, Tetsuo Handa wrote:
> Josh Poimboeuf wrote:
> > On Tue, Oct 03, 2017 at 11:28:15AM -0500, Josh Poimboeuf wrote:
> > > There are two bugs:
> > > =

> > > 1) Somebody -- presumably lockdep -- is corrupting the stack.  Need t=
he
> > >    lockdep people to look at that.
> > > =

> > > 2) The 32-bit FP unwinder isn't handling the corrupt stack very well,
> > >    It's blindly dereferencing untrusted data:
> > > =

> > > 	/* Is the next frame pointer an encoded pointer to pt_regs? */
> > > 	regs =3D decode_frame_pointer(next_bp);
> > > 	if (regs) {
> > > 		frame =3D (unsigned long *)regs;
> > > 		len =3D regs_size(regs);
> > > 		state->got_irq =3D true;
> > > =

> > >   On 32-bit, regs_size() dereferences the regs pointer before we know=
 it
> > >   points to a valid stack.  I'll fix that, along with the other unwin=
der
> > >   improvements I discussed with Linus.
> > =

> > Tetsuo and/or Fengguang,
> > =

> > Would you mind testing with this patch?  It should at least prevent the
> > unwinder panic and should hopefully print a useful unwinder dump
> > instead.
> > =

> Here are two outputs.

Tetsuo, would you mind trying the following patch?


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
index d145a0b1f529..acefab447f00 100644
--- a/arch/x86/kernel/unwind_frame.c
+++ b/arch/x86/kernel/unwind_frame.c
@@ -44,7 +44,8 @@ static void unwind_dump(struct unwind_state *state)
 			state->stack_info.type, state->stack_info.next_sp,
 			state->stack_mask, state->graph_idx);
 =

-	for (sp =3D state->orig_sp; sp; sp =3D PTR_ALIGN(stack_info.next_sp, size=
of(long))) {
+	for (sp =3D PTR_ALIGN(state->orig_sp, sizeof(long)); sp;
+	     sp =3D PTR_ALIGN(stack_info.next_sp, sizeof(long))) {
 		if (get_stack_info(sp, state->task, &stack_info, &visit_mask))
 			break;
 =

@@ -77,6 +78,12 @@ static size_t regs_size(struct pt_regs *regs)
 	return sizeof(*regs);
 }
 =

+#ifdef CONFIG_X86_32
+#define KERNEL_REGS_SIZE (sizeof(struct pt_regs) - 2*sizeof(long))
+#else
+#define KERNEL_REGS_SIZE (sizeof(struct pt_regs))
+#endif
+
 static bool in_entry_code(unsigned long ip)
 {
 	char *addr =3D (char *)ip;
@@ -174,6 +181,7 @@ static bool is_last_task_frame(struct unwind_state *sta=
te)
  * This determines if the frame pointer actually contains an encoded point=
er to
  * pt_regs on the stack.  See ENCODE_FRAME_POINTER.
  */
+#ifdef CONFIG_X86_64
 static struct pt_regs *decode_frame_pointer(unsigned long *bp)
 {
 	unsigned long regs =3D (unsigned long)bp;
@@ -183,6 +191,17 @@ static struct pt_regs *decode_frame_pointer(unsigned l=
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

 static bool update_stack_state(struct unwind_state *state,
 			       unsigned long *next_bp)
@@ -202,7 +221,7 @@ static bool update_stack_state(struct unwind_state *sta=
te,
 	regs =3D decode_frame_pointer(next_bp);
 	if (regs) {
 		frame =3D (unsigned long *)regs;
-		len =3D regs_size(regs);
+		len =3D KERNEL_REGS_SIZE;
 		state->got_irq =3D true;
 	} else {
 		frame =3D next_bp;
@@ -226,6 +245,14 @@ static bool update_stack_state(struct unwind_state *st=
ate,
 	    frame < prev_frame_end)
 		return false;
 =

+	/*
+	 * On 32-bit with user mode regs, make sure the last two regs are safe
+	 * to access:
+	 */
+	if (IS_ENABLED(CONFIG_X86_32) && regs && user_mode(regs) &&
+	    !on_stack(info, frame, len + 2*sizeof(long)))
+		return false;
+
 	/* Move state to the next frame: */
 	if (regs) {
 		state->regs =3D regs;

--===============6241086076463017268==--

