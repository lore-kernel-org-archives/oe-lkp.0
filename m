Content-Type: multipart/mixed; boundary="===============1853858947841883245=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: 4879b7ae05 ("Merge tag 'dmaengine-4.12-rc1' of .."): WARNING: kernel stack regs at bd92bc2e in 01-cpu-hotplug:3811 has bad 'bp' value 000001be
Date: Mon, 02 Oct 2017 16:31:09 -0500
Message-ID: <20171002213109.5n3skzy76edhwkvf@treble>
In-Reply-To: <20171002212654.rsm4uj3hfioddldd@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============1853858947841883245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2017 at 04:26:54PM -0500, Josh Poimboeuf wrote:
> Fengguang, assuming it's reliably recreatable, any chance you could
> recreate with the following patch?

Sorry, here's a version which actually compiles.

diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
index d145a0b1f529..00234fa5a33a 100644
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
=20

--===============1853858947841883245==--

