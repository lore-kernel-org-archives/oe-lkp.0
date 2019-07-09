Content-Type: multipart/mixed; boundary="===============2663183384523190594=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 7457c0da02 [ 0.733186] BUG: KASAN: unknown-crash in unwind_next_frame
Date: Tue, 09 Jul 2019 11:14:54 +0200
Message-ID: <20190709091454.GR3402@hirez.programming.kicks-ass.net>
In-Reply-To: <20190708192127.nqlcv6lmzfqc242u@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============2663183384523190594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2019 at 02:21:27PM -0500, Josh Poimboeuf wrote:
> On Mon, Jul 08, 2019 at 12:07:12PM -0500, Josh Poimboeuf wrote:
> > I recreated with the attached script.  It looks like the unwinder
> > encountered a corrupt frame pointer on the stack.  The unwinder thought
> > it was an "encoded" pt_regs pointer because it had bit 1 set, so it then
> > tried to read the embedded pt_regs (which wasn't actually there) on the
> > same stack, apparently causing the kasan error.
> > =

> > So, IIUC, the unwinder isn't trying to access memory beyond the stack
> > page, it's just trying to access memory in the middle of a stack frame,
> > which KASAN is flagging.  So the unwinder bounds checks don't seem to be
> > broken.  It isn't doing a "bad" memory access per se.
> > =

> > However... what I can't yet explain is why the original unwind failed,
> > but then the KASAN unwind succeeded.  With a corrupt frame pointer, the
> > KASAN unwind should have stopped early and fallen back to the "guess"
> > unwind, so the KASAN unwind should have had a lot of '?' entries.
> > =

> > So something doesn't quite add up, but at first glance it does seem to
> > be some kind of stack corruption, and the call emulation code is looking
> > quite guilty.
> > =

> > I can dig more into it later today.
> =

> Figured it out.  The KASAN-ified version of int3_magic() clobbers many
> more registers than you would imagine:
> =

> ffffffff850138ed <int3_magic>:
> ffffffff850138ed:       55                      push   %rbp
> ffffffff850138ee:       48 89 e5                mov    %rsp,%rbp
> ffffffff850138f1:       41 54                   push   %r12
> ffffffff850138f3:       53                      push   %rbx
> ffffffff850138f4:       49 89 fc                mov    %rdi,%r12
> ffffffff850138f7:       48 8b 1d e2 0e 51 ff    mov    -0xaef11e(%rip),%r=
bx        # ffffffff845247e0 <latent_entropy>
> ffffffff850138fe:       48 31 eb                xor    %rbp,%rbx
> ffffffff85013901:       e8 de 87 2d fc          callq  ffffffff812ec0e4 <=
__asan_store4>
> ffffffff85013906:       41 c7 04 24 01 00 00    movl   $0x1,(%r12)
> ffffffff8501390d:       00
> ffffffff8501390e:       48 8b 05 cb 0e 51 ff    mov    -0xaef135(%rip),%r=
ax        # ffffffff845247e0 <latent_entropy>
> ffffffff85013915:       48 ba 33 d9 81 a7 e7    movabs $0x1db2d7e7a781d93=
3,%rdx
> ffffffff8501391c:       d7 b2 1d
> ffffffff8501391f:       48 31 d3                xor    %rdx,%rbx
> ffffffff85013922:       48 01 c3                add    %rax,%rbx
> ffffffff85013925:       48 89 1d b4 0e 51 ff    mov    %rbx,-0xaef14c(%ri=
p)        # ffffffff845247e0 <latent_entropy>
> ffffffff8501392c:       5b                      pop    %rbx
> ffffffff8501392d:       41 5c                   pop    %r12
> ffffffff8501392f:       5d                      pop    %rbp
> ffffffff85013930:       c3                      retq
> =

> And it calls __asan_store4() which clobbers even more.
> =

> One way to fix it (doesn't compile on 32-bit obviously):
> =

> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 99ef8b6f9a1a..0a074d207720 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -676,7 +676,7 @@ static void __init int3_selftest(void)
>  		      "int3_selftest_ip:\n\t"
>  		      __ASM_SEL(.long, .quad) " 1b\n\t"
>  		      ".popsection\n\t"
> -		      : : __ASM_SEL_RAW(a, D) (&val) : "memory");
> +		      : : __ASM_SEL_RAW(a, D) (&val) : "memory", "rax", "rcx", "rdx", =
"rsi", "r8", "r9", "r10", "r11");

ARGH!!!

How about we stick int3_magic() in asm isntead and control the calling
convetion that way?

I say this after trying things like:

	__ASM_SEL_PURE((_ASM_REGS(dx, cx)), (_ASM_REGS(si, dx, cx, 8, 9, 10, 11, a=
x)))

And other horrible things. The main problem is that you're not allowed
to clobber a register used as input/output, so something 'generic' like:

#define _ASM_CALL_CLOBBER _ASM_ARGS, __ASM_REG(10), __ASM_REG(11)

doesn't work. Something like:

#ifdef CONFIG_X86_64
	"rsi", "rdx", "rcx", "r8", "r9", "r10", "r11", "rax"
#else
	"edx", "ecx"
#endif

obviously works, but is a bit crap too.

---
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 9a9eb0805ac0..b789faf083b6 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -625,10 +625,22 @@ extern struct paravirt_patch_site __start_parainstruc=
tions[],
  *
  * See entry_{32,64}.S for more details.
  */
-static void __init int3_magic(unsigned int *ptr)
-{
-	*ptr =3D 1;
-}
+
+/*
+ * We define the int3_magic() function in asm to control the calling conve=
ntion
+ * such that we can 'call' it from ASM.
+ */
+
+extern asmlinkage void int3_magic(unsigned int *ptr); /* defined in asm */
+
+asm (	"	.pushsection	.init.text,\"ax\",@progbits\n"
+	"	.type		int3_magic, @function\n"
+	"int3_magic:\n"
+	"	movl $1, (%" _ASM_ARG1 ")\n"
+	"	ret\n"
+	"	.size	int3_magic, .-int3_magic\n"
+	"	.popsection\n"
+	);
 =

 extern __initdata unsigned long int3_selftest_ip; /* defined in asm below =
*/
 =

@@ -676,7 +688,9 @@ static void __init int3_selftest(void)
 		      "int3_selftest_ip:\n\t"
 		      __ASM_SEL(.long, .quad) " 1b\n\t"
 		      ".popsection\n\t"
-		      : : __ASM_SEL_RAW(a, D) (&val) : "memory");
+		      : ASM_CALL_CONSTRAINT
+		      : __ASM_SEL_RAW(a, D) (&val)
+		      : "memory");
 =

 	BUG_ON(val !=3D 1);
=20

--===============2663183384523190594==--

