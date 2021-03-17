Content-Type: multipart/mixed; boundary="===============0993942923893121529=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: [PATCH] objtool, static_call: Don't emit static_call_site for .exit.text
Date: Wed, 17 Mar 2021 13:45:57 +0100
Message-ID: <YFH6BR61b5GK8ITo@hirez.programming.kicks-ass.net>
In-Reply-To: <CAFA6WYNs-rQLUGPMwc-p0q_KRvR16rm-x55gDqw828c7-C1qeA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0993942923893121529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 05:25:48PM +0530, Sumit Garg wrote:
> Thanks Peter for this fix. It does work for me on qemu for x86. Can
> you turn this into a proper fix patch? BTW, feel free to add:

Per the below, the original patch ought to be fixed as well, to not use
static_call() in __exit.

---
Subject: objtool,static_call: Don't emit static_call_site for .exit.text
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed Mar 17 13:35:05 CET 2021

Functions marked __exit are (somewhat surprisingly) discarded at
runtime when built-in. This means that static_call(), when used in
__exit functions, will generate static_call_site entries that point
into reclaimed space.

Simply skip such sites and emit a WARN about it. By not emitting a
static_call_site the site will remain pointed at the trampoline, which
is also maintained, so things will work as expected, albeit with the
extra indirection.

The WARN is so that people are aware of this; and arguably it simply
isn't a good idea to use static_call() in __exit code anyway, since
module unload is never a performance critical path.

Reported-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Sumit Garg <sumit.garg@linaro.org>
---
 tools/objtool/check.c |   32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -850,6 +850,22 @@ static int add_ignore_alternatives(struc
 	return 0;
 }
 =

+static inline void static_call_add(struct instruction *insn,
+				   struct objtool_file *file)
+{
+	if (!insn->call_dest->static_call_tramp)
+		return;
+
+	if (!strcmp(insn->sec->name, ".exit.text")) {
+		WARN_FUNC("static_call in .exit.text, skipping inline patching",
+			  insn->sec, insn->offset);
+		return;
+	}
+
+	list_add_tail(&insn->static_call_node,
+		      &file->static_call_list);
+}
+
 /*
  * Find the destination instructions for all jumps.
  */
@@ -888,10 +904,7 @@ static int add_jump_destinations(struct
 		} else if (insn->func) {
 			/* internal or external sibling call (with reloc) */
 			insn->call_dest =3D reloc->sym;
-			if (insn->call_dest->static_call_tramp) {
-				list_add_tail(&insn->static_call_node,
-					      &file->static_call_list);
-			}
+			static_call_add(insn, file);
 			continue;
 		} else if (reloc->sym->sec->idx) {
 			dest_sec =3D reloc->sym->sec;
@@ -950,10 +963,7 @@ static int add_jump_destinations(struct
 =

 				/* internal sibling call (without reloc) */
 				insn->call_dest =3D insn->jump_dest->func;
-				if (insn->call_dest->static_call_tramp) {
-					list_add_tail(&insn->static_call_node,
-						      &file->static_call_list);
-				}
+				static_call_add(insn, file);
 			}
 		}
 	}
@@ -2746,10 +2756,8 @@ static int validate_branch(struct objtoo
 			if (dead_end_function(file, insn->call_dest))
 				return 0;
 =

-			if (insn->type =3D=3D INSN_CALL && insn->call_dest->static_call_tramp) {
-				list_add_tail(&insn->static_call_node,
-					      &file->static_call_list);
-			}
+			if (insn->type =3D=3D INSN_CALL)
+				static_call_add(insn, file);
 =

 			break;
=20
--===============0993942923893121529==--

