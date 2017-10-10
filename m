Content-Type: multipart/mixed; boundary="===============8090643788606744932=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH 4/4] x86/unwind: Disable unwinder warnings on 32-bit
Date: Mon, 09 Oct 2017 20:20:05 -0500
Message-ID: <a69658760800bf281e6353248c23e0fa0acf5230.1507597785.git.jpoimboe@redhat.com>
In-Reply-To: <cover.1507597785.git.jpoimboe@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8090643788606744932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

x86-32 doesn't have stack validation, so in most cases it doesn't make
sense to warn about bad frame pointers.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 arch/x86/kernel/unwind_frame.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
index 81aca077fbb6..3dc26f95d46e 100644
--- a/arch/x86/kernel/unwind_frame.c
+++ b/arch/x86/kernel/unwind_frame.c
@@ -355,6 +355,13 @@ bool unwind_next_frame(struct unwind_state *state)
 	    state->regs->sp < (unsigned long)task_pt_regs(state->task))
 		goto the_end;
 =

+	/*
+	 * There are some known frame pointer issues on 32-bit.  Disable
+	 * unwinder warnings on 32-bit until it gets objtool support.
+	 */
+	if (IS_ENABLED(CONFIG_X86_32))
+		goto the_end;
+
 	if (state->regs) {
 		printk_deferred_once(KERN_WARNING
 			"WARNING: kernel stack regs at %p in %s:%d has bad 'bp' value %p\n",
-- =

2.13.6


--===============8090643788606744932==--

