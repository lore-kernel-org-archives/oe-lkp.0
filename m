Content-Type: multipart/mixed; boundary="===============7536679693554949599=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [KEYS] 4a00e5e212: WARNING:at_arch/x86/kernel/static_call.c:#__static_call_validate
Date: Wed, 17 Mar 2021 09:59:32 +0100
Message-ID: <YFHE9CjanDAD4l5M@hirez.programming.kicks-ass.net>
In-Reply-To: <YFHAsgNhe8c3ZHQN@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7536679693554949599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 09:41:22AM +0100, Peter Zijlstra wrote:
> On Wed, Mar 17, 2021 at 12:55:02PM +0530, Sumit Garg wrote:
> > > [    0.000000] ------------[ cut here ]------------
> > > [    0.000000] unexpected static_call insn opcode 0xe9 at cleanup_tru=
sted+0x0/0x5
> > =

> > Here 0xe9 belongs to JMP32_INSN_OPCODE but I am not sure why it's
> > considered incorrect given following snippet and corresponding
> > objdump:
> > =

> > Snippet:
> > =

> > static void __exit cleanup_trusted(void)
> > {
> >         static_call_cond(trusted_key_exit)();
> > }
> > =

> > module_exit(cleanup_trusted);
> > =

> > Objdump:
> > =

> > ffffffff832d91fc <cleanup_trusted>:
> > ffffffff832d91fc:       e9 ef 83 b2 fe          jmpq
> > ffffffff81e015f0 <__SCT__trusted_key_exit>
> > =

> > Maintainers,
> > =

> > Do you have any clue here?
> =

> It's an __exit function.. and we have:
> =

> 	/*
> 	 * .exit.text is discarded at runtime, not link time, to deal with
> 	 *  references from .altinstructions
> 	 */
> 	.exit.text : AT(ADDR(.exit.text) - LOAD_OFFSET) {
> 		EXIT_TEXT
> 	}
> =

> So could it be the text is no longer actually there?
> =

> We have special handling for __init, but I don't think we have anything
> for __exit.

Does this help?

---
 tools/objtool/check.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 5e5388a38e2a..6fef1155e73a 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -850,6 +850,21 @@ static int add_ignore_alternatives(struct objtool_file=
 *file)
 	return 0;
 }
 =

+static inline void static_call_add(struct instruction *insn,
+				   struct objtool_file *file)
+{
+	if (!strcmp(insn->sec->name, ".exit.text")) {
+		WARN_FUNC("static_call in .exit.text, skipping inline paching",
+			  insn->sec, insn->offset);
+		return;
+	}
+
+	if (insn->call_dest->static_call_tramp) {
+		list_add_tail(&insn->static_call_node,
+			      &file->static_call_list);
+	}
+}
+
 /*
  * Find the destination instructions for all jumps.
  */
@@ -888,10 +903,7 @@ static int add_jump_destinations(struct objtool_file *=
file)
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
@@ -950,10 +962,7 @@ static int add_jump_destinations(struct objtool_file *=
file)
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
@@ -2746,10 +2755,8 @@ static int validate_branch(struct objtool_file *file=
, struct symbol *func,
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
--===============7536679693554949599==--

