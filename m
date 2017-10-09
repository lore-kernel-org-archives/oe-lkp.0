Content-Type: multipart/mixed; boundary="===============2754084309297297789=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 08:26:05 -0500
Message-ID: <20171009132605.6uosfs22qbg2bysj@treble>
In-Reply-To: <20171009125504.gpb3z4xtsstq756k@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2754084309297297789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 08:55:04PM +0800, Fengguang Wu wrote:
> On Mon, Oct 09, 2017 at 08:21:13PM +0800, Fengguang Wu wrote:
> > On Mon, Oct 09, 2017 at 12:50:55PM +0200, Peter Zijlstra wrote:
> > > > Fengguang, if you're still listening, could you please rerun the te=
sts
> > > > on top of ce07a9415f26, with the attached patches also applied?
> > > =

> > > Ping!? it would be very good to get feedback on this asap.
> > =

> > Sorry for the delay!
> > =

> > > > From e7840ad76515f0b5061fcdd098b57b7c01b61482 Mon Sep 17 00:00:00 2=
001
> > > > Message-Id: <e7840ad76515f0b5061fcdd098b57b7c01b61482.1507215196.gi=
t.jpoimboe@redhat.com>
> > > > From: Josh Poimboeuf <jpoimboe@redhat.com>
> > > > Date: Thu, 5 Oct 2017 09:43:59 -0500
> > > > Subject: [PATCH 1/2] unwinder fixes
> > > > =

> > > > ---
> > > >  arch/x86/kernel/unwind_frame.c | 33 ++++++++++++++++++++++++++++++=
---
> > =

> > I just test 316 boots and see 7 WARNINGs:
> > =

> > [  404.948035] WARNING: kernel stack frame pointer at c6ea3ecd in init:=
212 has bad value   (null)
> > [  298.118383] WARNING: kernel stack frame pointer at cde07dad in init:=
1 has bad value bc000000
> > [  112.848677] WARNING: kernel stack frame pointer at cde07dbd in swapp=
er/0:1 has bad value c2000000
> > [  127.942417] WARNING: kernel stack frame pointer at cf95de71 in rb_pr=
oducer:50 has bad value 03cf95de
> > [    4.736938] WARNING: kernel stack frame pointer at bf643d59 in kwork=
er/0:1:15 has bad value b5000000
> > [  308.260066] WARNING: kernel stack frame pointer at bde07da5 in udevd=
:155 has bad value b5bfa17b
> > =

> > [  277.473596] WARNING: CPU: 0 PID: 520 at kernel/locking/lockdep.c:384=
1 check_flags+0x119/0x1b0

The unwinder patch I sent had a few bugs: it broke frame pointer
encoding (causing the '?' entries on the lockdep stack trace) and it
didn't disable the frame pointer warnings.  Here's the fixed version.

Fengguang, can you do a round of tests with this patch and the lockdep
patch I sent before?  Thanks!


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
index d145a0b1f529..f157238528a6 100644
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
@@ -328,6 +355,13 @@ bool unwind_next_frame(struct unwind_state *state)
 	    state->regs->sp < (unsigned long)task_pt_regs(state->task))
 		goto the_end;
 =

+	/*
+	 * There are some known frame pointer issues on 32-bit.  Disable
+	 * unwinder warnings until it gets objtool support.
+	 */
+	if (IS_ENABLED(CONFIG_X86_32))
+		goto the_end;
+
 	if (state->regs) {
 		printk_deferred_once(KERN_WARNING
 			"WARNING: kernel stack regs at %p in %s:%d has bad 'bp' value %p\n",

--===============2754084309297297789==--

