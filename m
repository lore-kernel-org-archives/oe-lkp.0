Content-Type: multipart/mixed; boundary="===============2534127029820031517=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: 7457c0da02 [ 0.733186] BUG: KASAN: unknown-crash in unwind_next_frame
Date: Tue, 09 Jul 2019 07:01:52 -0500
Message-ID: <20190709120152.2cu7bfockk5rv5zs@treble>
In-Reply-To: <20190709091454.GR3402@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2534127029820031517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2019 at 11:14:54AM +0200, Peter Zijlstra wrote:
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 9a9eb0805ac0..b789faf083b6 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -625,10 +625,22 @@ extern struct paravirt_patch_site __start_parainstr=
uctions[],
>   *
>   * See entry_{32,64}.S for more details.
>   */
> -static void __init int3_magic(unsigned int *ptr)
> -{
> -	*ptr =3D 1;
> -}
> +
> +/*
> + * We define the int3_magic() function in asm to control the calling con=
vention
> + * such that we can 'call' it from ASM.
> + */
> +
> +extern asmlinkage void int3_magic(unsigned int *ptr); /* defined in asm =
*/
> +
> +asm (	"	.pushsection	.init.text,\"ax\",@progbits\n"
> +	"	.type		int3_magic, @function\n"
> +	"int3_magic:\n"
> +	"	movl $1, (%" _ASM_ARG1 ")\n"
> +	"	ret\n"
> +	"	.size	int3_magic, .-int3_magic\n"
> +	"	.popsection\n"
> +	);
>  =

>  extern __initdata unsigned long int3_selftest_ip; /* defined in asm belo=
w */
>  =

> @@ -676,7 +688,9 @@ static void __init int3_selftest(void)
>  		      "int3_selftest_ip:\n\t"
>  		      __ASM_SEL(.long, .quad) " 1b\n\t"
>  		      ".popsection\n\t"
> -		      : : __ASM_SEL_RAW(a, D) (&val) : "memory");
> +		      : ASM_CALL_CONSTRAINT
> +		      : __ASM_SEL_RAW(a, D) (&val)
> +		      : "memory");
>  =

>  	BUG_ON(val !=3D 1);
>  =


Either way works for me.  Feel free to NACK the patch I posted :-)
Looks like I forgot the ASM_CALL_CONSTRAINT anyway.

-- =

Josh

--===============2534127029820031517==--

