Content-Type: multipart/mixed; boundary="===============0575032431348284221=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool: Detect assembly code falling through to INT3 padding
Date: Thu, 17 May 2018 16:01:18 +0200
Message-ID: <20180517140118.GT12217@hirez.programming.kicks-ass.net>
In-Reply-To: <20180517134934.eog2fgoby5azq5a7@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============0575032431348284221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 08:49:34AM -0500, Josh Poimboeuf wrote:
> With the following commit:
> =

>   51bad67ffbce ("x86/asm: Pad assembly functions with INT3 instructions")
> =

> ... asm function alignments are padded with INT3, so it's no longer safe
> to fall through to an aligned function.  Make sure we catch any such
> cases with objtool.
> =

> Note this only adds checking for 64-bit, since objtool doesn't support
> x86-32.
> =

> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> ---
>  arch/x86/kernel/head_64.S       |  2 --
>  tools/objtool/arch.h            |  3 ++-
>  tools/objtool/arch/x86/decode.c |  2 +-
>  tools/objtool/check.c           | 11 ++++++++++-
>  4 files changed, 13 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index 8344dd2f310a..3ed8cec6e765 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -285,11 +285,9 @@ ENTRY(early_idt_handler_array)
>  	.endif
>  	pushq $i		# 72(%rsp) Vector number
>  	jmp early_idt_handler_common
> -	UNWIND_HINT_IRET_REGS
>  	i =3D i + 1
>  	.fill early_idt_handler_array + i*EARLY_IDT_HANDLER_SIZE - ., 1, 0xcc
>  	.endr
> -	UNWIND_HINT_IRET_REGS offset=3D16
>  END(early_idt_handler_array)
>  =

>  early_idt_handler_common:

As noted on IRC; I got slightly confused what this was about.

Other than that:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

--===============0575032431348284221==--

