Content-Type: multipart/mixed; boundary="===============0300567163953232906=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/entry_32: Fix segment exceptions
Date: Fri, 14 Jan 2022 15:48:31 -0800
Message-ID: <760ea801-8394-4e0c-9ec3-23e36e436551@www.fastmail.com>
In-Reply-To: <YeFdeZsTWDt9WU8f@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0300567163953232906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On Fri, Jan 14, 2022, at 3:24 AM, Borislav Petkov wrote:
> On Thu, Jan 13, 2022 at 08:55:37PM +0100, Peter Zijlstra wrote:
>> On IRC Andrew also noted that these EX_REG_* things should be __i386__
>> only. Previosly when they lived as open-coded EX_DATA_REG() usage in
>> entry_32.S that was implied, but now ...
>
> I guess that then below.
>
> amluto, I'd love it if we (and by that I mean you :-)) could document
> the rules for GS on 32-bit so that it is clear what's going on there...
>
> entry_32.S is only hinting at what's going on, we have comments here and
> there but not all concentrated into a single location.

Acked-by: Andy Lutomirski <luto@kernel.org>

>
> Thx.
>
> ---
> From: Borislav Petkov <bp@suse.de>
> Date: Fri, 14 Jan 2022 12:15:21 +0100
> Subject: [PATCH] x86/entry_32: Remove GS from the pt_regs offsets and fix=
up
>  regs
>
> GS is special on 32-bit and segment exceptions fixup through it won't
> work. Leave breadcrumbs for others not to walk into the same nasty.
>
> Fixes: 9cdbeec40968 ("x86/entry_32: Fix segment exceptions")
> Signed-off-by: Borislav Petkov <bp@suse.de>
> ---
>  arch/x86/include/asm/extable_fixup_types.h | 5 +++--
>  arch/x86/lib/insn-eval.c                   | 5 ++++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/include/asm/extable_fixup_types.h =

> b/arch/x86/include/asm/extable_fixup_types.h
> index 503622627400..0aa5f4d3234f 100644
> --- a/arch/x86/include/asm/extable_fixup_types.h
> +++ b/arch/x86/include/asm/extable_fixup_types.h
> @@ -20,11 +20,12 @@
>  #define EX_DATA_FLAG(flag)		((flag) << EX_DATA_FLAG_SHIFT)
>  #define EX_DATA_IMM(imm)		((imm) << EX_DATA_IMM_SHIFT)
> =

> -/* segment regs */
> +#ifdef CONFIG_X86_32
> +/* segment regs, valid only for 32-bit code, see pt_regoff */
>  #define EX_REG_DS			EX_DATA_REG(8)
>  #define EX_REG_ES			EX_DATA_REG(9)
>  #define EX_REG_FS			EX_DATA_REG(10)
> -#define EX_REG_GS			EX_DATA_REG(11)
> +#endif
> =

>  /* flags */
>  #define EX_FLAG_CLEAR_AX		EX_DATA_FLAG(1)
> diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
> index b781d324211b..34001eee7482 100644
> --- a/arch/x86/lib/insn-eval.c
> +++ b/arch/x86/lib/insn-eval.c
> @@ -432,7 +432,10 @@ static const int pt_regoff[] =3D {
>  	offsetof(struct pt_regs, ds),
>  	offsetof(struct pt_regs, es),
>  	offsetof(struct pt_regs, fs),
> -	offsetof(struct pt_regs, gs),
> +	/*
> +	 * Can't use that one - it is special - see entry_32.S
> +	 * offsetof(struct pt_regs, gs),
> +	 */
>  #endif
>  };
> =

> -- =

> 2.29.2
>
>
> -- =

> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
--===============0300567163953232906==--

