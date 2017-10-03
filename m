Content-Type: multipart/mixed; boundary="===============1622669962320090024=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 03 Oct 2017 12:34:02 -0500
Message-ID: <20171003173402.hq4aviy5hztgauyt@treble>
In-Reply-To: <20171003162815.2eatamg4h3tpsypl@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============1622669962320090024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 11:28:15AM -0500, Josh Poimboeuf wrote:
> There are two bugs:
> =

> 1) Somebody -- presumably lockdep -- is corrupting the stack.  Need the
>    lockdep people to look at that.
> =

> 2) The 32-bit FP unwinder isn't handling the corrupt stack very well,
>    It's blindly dereferencing untrusted data:
> =

> 	/* Is the next frame pointer an encoded pointer to pt_regs? */
> 	regs =3D decode_frame_pointer(next_bp);
> 	if (regs) {
> 		frame =3D (unsigned long *)regs;
> 		len =3D regs_size(regs);
> 		state->got_irq =3D true;
> =

>   On 32-bit, regs_size() dereferences the regs pointer before we know it
>   points to a valid stack.  I'll fix that, along with the other unwinder
>   improvements I discussed with Linus.

Tetsuo and/or Fengguang,

Would you mind testing with this patch?  It should at least prevent the
unwinder panic and should hopefully print a useful unwinder dump
instead.


diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
index d145a0b1f529..a0dd4df2234d 100644
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
@@ -178,7 +185,7 @@ static struct pt_regs *decode_frame_pointer(unsigned lo=
ng *bp)
 {
 	unsigned long regs =3D (unsigned long)bp;
 =

-	if (!(regs & 0x1))
+	if ((regs & (sizeof(long)-1)) !=3D 1)
 		return NULL;
 =

 	return (struct pt_regs *)(regs & ~0x1);
@@ -202,7 +209,7 @@ static bool update_stack_state(struct unwind_state *sta=
te,
 	regs =3D decode_frame_pointer(next_bp);
 	if (regs) {
 		frame =3D (unsigned long *)regs;
-		len =3D regs_size(regs);
+		len =3D KERNEL_REGS_SIZE;
 		state->got_irq =3D true;
 	} else {
 		frame =3D next_bp;
@@ -221,11 +228,23 @@ static bool update_stack_state(struct unwind_state *s=
tate,
 				   &state->stack_mask))
 			return false;
 =

+	/* Make sure the frame pointer is properly aligned: */
+	if ((unsigned long)frame & (sizeof(long)-1))
+		return false;
+
 	/* Make sure it only unwinds up and doesn't overlap the prev frame: */
 	if (state->orig_sp && state->stack_info.type =3D=3D prev_type &&
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

--===============1622669962320090024==--

