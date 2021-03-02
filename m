Content-Type: multipart/mixed; boundary="===============2723755611572557287=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86, build] 6dafca9780: WARNING:at_arch/x86/kernel/ftrace.c:#ftrace_verify_code
Date: Mon, 01 Mar 2021 20:15:26 -0500
Message-ID: <20210301201526.65ce7f1c@oasis.local.home>
In-Reply-To: <CABCJKudQme=bcNJtNCORUpBnVA_Pkr2Zk_3Nu2EsfnuoE7LJ3g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2723755611572557287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Mar 2021 16:03:51 -0800
Sami Tolvanen <samitolvanen@google.com> wrote:
> =

> >                 ret =3D ftrace_verify_code(rec->ip, old);
> > +
> > +               if (__is_defined(CC_USING_NOP_MCOUNT) && ret && old_nop=
) {
> > +                       /* Compiler could have put in P6_NOP5 */
> > +                       old =3D P6_NOP5;
> > +                       ret =3D ftrace_verify_code(rec->ip, old);
> > +               }
> > +  =

> =

> Wouldn't that still hit WARN(1) in the initial ftrace_verify_code()
> call if ideal_nops doesn't match?

That was too quickly written ;-)

Take 2:

[ with fixes for setting p6_nop ]

diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 7edbd5ee5ed4..e8afc765e00a 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -36,6 +36,7 @@
 #ifdef CONFIG_DYNAMIC_FTRACE
 =

 static int ftrace_poke_late =3D 0;
+static const char p6_nop[] =3D { P6_NOP5 };
 =

 int ftrace_arch_code_modify_prepare(void)
     __acquires(&text_mutex)
@@ -74,7 +75,7 @@ static const char *ftrace_call_replace(unsigned long ip, =
unsigned long addr)
 	return text_gen_insn(CALL_INSN_OPCODE, (void *)ip, (void *)addr);
 }
 =

-static int ftrace_verify_code(unsigned long ip, const char *old_code)
+static int ftrace_verify_code(unsigned long ip, const char *old_code, bool=
 warn)
 {
 	char cur_code[MCOUNT_INSN_SIZE];
 =

@@ -87,13 +88,13 @@ static int ftrace_verify_code(unsigned long ip, const c=
har *old_code)
 	 */
 	/* read the text we want to modify */
 	if (copy_from_kernel_nofault(cur_code, (void *)ip, MCOUNT_INSN_SIZE)) {
-		WARN_ON(1);
+		WARN_ON(warn);
 		return -EFAULT;
 	}
 =

 	/* Make sure it is what we expect it to be */
 	if (memcmp(cur_code, old_code, MCOUNT_INSN_SIZE) !=3D 0) {
-		WARN_ON(1);
+		WARN_ON(warn);
 		return -EINVAL;
 	}
 =

@@ -107,9 +108,9 @@ static int ftrace_verify_code(unsigned long ip, const c=
har *old_code)
  */
 static int __ref
 ftrace_modify_code_direct(unsigned long ip, const char *old_code,
-			  const char *new_code)
+			  const char *new_code, bool verify_warn)
 {
-	int ret =3D ftrace_verify_code(ip, old_code);
+	int ret =3D ftrace_verify_code(ip, old_code, verify_warn);
 	if (ret)
 		return ret;
 =

@@ -138,7 +139,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftra=
ce *rec, unsigned long ad
 	 * just modify the code directly.
 	 */
 	if (addr =3D=3D MCOUNT_ADDR)
-		return ftrace_modify_code_direct(ip, old, new);
+		return ftrace_modify_code_direct(ip, old, new, true);
 =

 	/*
 	 * x86 overrides ftrace_replace_code -- this function will never be used
@@ -152,12 +153,20 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned=
 long addr)
 {
 	unsigned long ip =3D rec->ip;
 	const char *new, *old;
+	bool verify_warn =3D !__is_defined(CC_USING_NOP_MCOUNT);
+	int ret;
 =

 	old =3D ftrace_nop_replace();
 	new =3D ftrace_call_replace(ip, addr);
 =

 	/* Should only be called when module is loaded */
-	return ftrace_modify_code_direct(rec->ip, old, new);
+	ret =3D ftrace_modify_code_direct(rec->ip, old, new, verify_warn);
+	if (ret && !verify_warn) {
+		/* Compiler could have put in P6_NOP5 */
+		old =3D p6_nop;
+		ret =3D ftrace_modify_code_direct(rec->ip, old, new, true);
+	}
+	return ret;
 }
 =

 /*
@@ -199,6 +208,8 @@ void ftrace_replace_code(int enable)
 	int ret;
 =

 	for_ftrace_rec_iter(iter) {
+		bool verify_warn =3D true;
+
 		rec =3D ftrace_rec_iter_record(iter);
 =

 		switch (ftrace_test_record(rec, enable)) {
@@ -208,6 +219,7 @@ void ftrace_replace_code(int enable)
 =

 		case FTRACE_UPDATE_MAKE_CALL:
 			old =3D ftrace_nop_replace();
+			verify_warn =3D !__is_defined(CC_USING_NOP_MCOUNT);
 			break;
 =

 		case FTRACE_UPDATE_MODIFY_CALL:
@@ -216,7 +228,14 @@ void ftrace_replace_code(int enable)
 			break;
 		}
 =

-		ret =3D ftrace_verify_code(rec->ip, old);
+		ret =3D ftrace_verify_code(rec->ip, old, verify_warn);
+
+		if (ret && !verify_warn) {
+			/* Compiler could have put in P6_NOP5 */
+			old =3D p6_nop;
+			ret =3D ftrace_verify_code(rec->ip, old, true);
+		}
+
 		if (ret) {
 			ftrace_bug(ret, rec);
 			return;


-- Steve
--===============2723755611572557287==--

