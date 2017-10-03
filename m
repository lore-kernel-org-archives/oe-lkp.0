Content-Type: multipart/mixed; boundary="===============4503863948821132707=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: 4879b7ae05 ("Merge tag 'dmaengine-4.12-rc1' of .."): WARNING: kernel stack regs at bd92bc2e in 01-cpu-hotplug:3811 has bad 'bp' value 000001be
Date: Tue, 03 Oct 2017 08:21:25 -0500
Message-ID: <20171003132125.ulj3nnmiimamsm6w@treble>
In-Reply-To: <20171003034538.ntvuwtm2uha6wt6h@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4503863948821132707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 11:45:38AM +0800, Fengguang Wu wrote:
> Hi Josh,
> =

> On Mon, Oct 02, 2017 at 04:31:09PM -0500, Josh Poimboeuf wrote:
> > On Mon, Oct 02, 2017 at 04:26:54PM -0500, Josh Poimboeuf wrote:
> > > Fengguang, assuming it's reliably recreatable, any chance you could
> > > recreate with the following patch?
> =

> Sure, I'll try your patch on v4.14-rc3 since it looks the most
> reproducible kernel. For the bisected 4879b7ae05, the warning only
> shows up once out of 909 boots according to the below stats. So I'm
> not sure whether it's the _first_ bad commit. To double confirm, I
> just queued 5000 more boot tests for each of its parent commits.

Fengguang, here's an improved version of the patch based on Linus'
suggestions.  If you can use it instead, that would be helpful because
it has a better chance of dumping useful data.  Thanks!


diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
index d145a0b1f529..191012762aa0 100644
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

@@ -178,7 +179,7 @@ static struct pt_regs *decode_frame_pointer(unsigned lo=
ng *bp)
 {
 	unsigned long regs =3D (unsigned long)bp;
 =

-	if (!(regs & 0x1))
+	if ((regs & (sizeof(long)-1)) !=3D 1)
 		return NULL;
 =

 	return (struct pt_regs *)(regs & ~0x1);
@@ -221,6 +222,10 @@ static bool update_stack_state(struct unwind_state *st=
ate,
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

--===============4503863948821132707==--

