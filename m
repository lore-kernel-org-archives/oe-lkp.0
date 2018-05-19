Content-Type: multipart/mixed; boundary="===============1765896001640090334=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rjw@rjwysocki.net>
To: lkp@lists.01.org
Subject: Re: "interesting" entry in hibernation code was Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Sat, 19 May 2018 10:35:27 +0200
Message-ID: <6938886.d705BbSbgG@aspire.rjw.lan>
In-Reply-To: <20180519070008.GC30676@amd>
List-Id: <oe-lkp.lists.linux.dev>

--===============1765896001640090334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Saturday, May 19, 2018 9:00:08 AM CEST Pavel Machek wrote:
> Hi!
> =

> > Side note: doing some grepping, I find some other sequences that are a =
bit
> > scary, like this:
> > =

> > arch/x86/kernel/acpi/wakeup_32.S-.data
> > arch/x86/kernel/acpi/wakeup_32.S-ALIGN
> > arch/x86/kernel/acpi/wakeup_32.S:ENTRY(saved_magic)     .long   0
> > arch/x86/kernel/acpi/wakeup_32.S:ENTRY(saved_eip)       .long   0
> > =

> > so apparently people are using ENTRY() for data too (the same pattern
> > exists in wakeup_64.S).
> > =

> > So we end up having those odd 0x90 bytes (now 0xcc) in the data section=
 as
> > "padding" between those two values. Crazy.
> =

> Sorry about that. I'm pretty sure intention was simply to use the
> variable from C code.. and ENTRY() worked. I was not aware that it has
> side effect of padding...
> =

> Let me see how this can be improved... (untested).
> =

> diff --git a/arch/x86/kernel/acpi/wakeup_32.S b/arch/x86/kernel/acpi/wake=
up_32.S
> index 0c26b1b..d6f477f 100644
> --- a/arch/x86/kernel/acpi/wakeup_32.S
> +++ b/arch/x86/kernel/acpi/wakeup_32.S
> @@ -89,8 +89,8 @@ ret_point:
>  =

>  .data
>  ALIGN
> -ENTRY(saved_magic)	.long	0
> -ENTRY(saved_eip)	.long	0
> +GLOBAL(saved_magic)	.long	0
> +saved_eip:	.long	0
>  =

>  # saved registers
>  saved_idt:	.long	0,0

The Jiri Slaby's annotation patches touch this:

https://patchwork.kernel.org/patch/10409073/

Thanks,
Rafael


--===============1765896001640090334==--

