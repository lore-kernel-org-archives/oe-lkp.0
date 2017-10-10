Content-Type: multipart/mixed; boundary="===============2842822942220513045=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH 3/4] x86/unwind: Align stack pointer in unwinder dump
Date: Mon, 09 Oct 2017 20:20:04 -0500
Message-ID: <2f540c515946ab09ed267e1a1d6421202a0cce08.1507597785.git.jpoimboe@redhat.com>
In-Reply-To: <cover.1507597785.git.jpoimboe@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2842822942220513045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When printing the unwinder dump, the stack pointer could be unaligned,
for one of two reasons:

- stack corruption; or

- GCC created an unaligned stack.

There's no way for the unwinder to tell the difference between the two,
so we have to assume one or the other.  GCC unaligned stacks are very
rare, and have only been spotted before GCC 5.  Presumably, if we're
doing an unwinder stack dump, stack corruption is more likely than a
GCC unaligned stack.  So always align the stack before starting the
dump.

Reported-and-tested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Reported-and-tested-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 arch/x86/kernel/unwind_frame.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
index 4949bbc95f75..81aca077fbb6 100644
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

-- =

2.13.6


--===============2842822942220513045==--

