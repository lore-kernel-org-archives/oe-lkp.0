Content-Type: multipart/mixed; boundary="===============4397453813569051889=="
MIME-Version: 1.0
From: Sami Tolvanen <samitolvanen@google.com>
To: lkp@lists.01.org
Subject: Re: [x86, build] 6dafca9780: WARNING:at_arch/x86/kernel/ftrace.c:#ftrace_verify_code
Date: Mon, 01 Mar 2021 18:40:32 -0800
Message-ID: <YD2loOkd/AYqKPB6@google.com>
In-Reply-To: <20210301201526.65ce7f1c@oasis.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============4397453813569051889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 08:15:26PM -0500, Steven Rostedt wrote:
> On Mon, 1 Mar 2021 16:03:51 -0800
> Sami Tolvanen <samitolvanen@google.com> wrote:
> > =

> > >                 ret =3D ftrace_verify_code(rec->ip, old);
> > > +
> > > +               if (__is_defined(CC_USING_NOP_MCOUNT) && ret && old_n=
op) {
> > > +                       /* Compiler could have put in P6_NOP5 */
> > > +                       old =3D P6_NOP5;
> > > +                       ret =3D ftrace_verify_code(rec->ip, old);
> > > +               }
> > > +  =

> > =

> > Wouldn't that still hit WARN(1) in the initial ftrace_verify_code()
> > call if ideal_nops doesn't match?
> =

> That was too quickly written ;-)
> =

> Take 2:
> =

> [ with fixes for setting p6_nop ]

Thanks, I tested this with the config from the build bot, and I can
confirm that it fixes the issue for me.

I also tested a quick patch to disable the __fentry__ conversion in
objtool, and it seems to work too, but it's probably a good idea to
fix the issue with CC_USING_NOP_MCOUNT in any case.

diff --git a/Makefile b/Makefile
index f9b54da2fca0..536fea073d5b 100644
--- a/Makefile
+++ b/Makefile
@@ -863,9 +863,6 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_CC
     endif
   endif
 endif
-ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
-  CC_FLAGS_USING	+=3D -DCC_USING_NOP_MCOUNT
-endif
 ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
   ifdef CONFIG_HAVE_C_RECORDMCOUNT
     BUILD_C_RECORDMCOUNT :=3D y
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 068cdb41f76f..497e00c1cb69 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1047,21 +1047,9 @@ static int add_call_destinations(struct objtool_file=
 *file)
 			insn->type =3D INSN_NOP;
 		}
 =

-		if (mcount && !strcmp(insn->call_dest->name, "__fentry__")) {
-			if (reloc) {
-				reloc->type =3D R_NONE;
-				elf_write_reloc(file->elf, reloc);
-			}
-
-			elf_write_insn(file->elf, insn->sec,
-				       insn->offset, insn->len,
-				       arch_nop_insn(insn->len));
-
-			insn->type =3D INSN_NOP;
-
+		if (mcount && !strcmp(insn->call_dest->name, "__fentry__"))
 			list_add_tail(&insn->mcount_loc_node,
 				      &file->mcount_loc_list);
-		}
 =

 		/*
 		 * Whatever stack impact regular CALLs have, should be undone

Sami
--===============4397453813569051889==--

