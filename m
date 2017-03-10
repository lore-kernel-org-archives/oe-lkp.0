Content-Type: multipart/mixed; boundary="===============5545116096761949521=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Fri, 10 Mar 2017 01:13:54 +0100
Message-ID: <58C1EFC2.7090309@iogearbox.net>
In-Reply-To: <20170309234411.wec53iexfz6skmpl@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============5545116096761949521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/10/2017 12:44 AM, Borislav Petkov wrote:
> On Thu, Mar 09, 2017 at 03:26:02PM -0800, Linus Torvalds wrote:
>> So should all of commit ("c109bf95992b x86/cpufeature: Remove
>> cpu_has_pge") just be reverted (and then marked for stable)?
>>
>> Or do we have some alternate plan?
>
> I think we want to do this:
>
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbfl=
ush.h
> index 6fa85944af83..fc5abff9b7fd 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -188,7 +188,7 @@ static inline void __native_flush_tlb_single(unsigned=
 long addr)
>
>   static inline void __flush_tlb_all(void)
>   {
> -	if (static_cpu_has(X86_FEATURE_PGE))
> +	if (boot_cpu_has(X86_FEATURE_PGE))
>   		__flush_tlb_global();
>   	else
>   		__flush_tlb();
> ---
>
> but it is late here so I'd prefer to do a real patch tomorrow when I'm
> not almost sleeping on the keyboard. Unless Daniel wants to write one
> and test it now.

I think we're in the same time zone. ;) I could send something
official tomorrow cooking a changelog with analysis, but I don't
mind at all if you want to go ahead with that either. Feel free
to add my SoB or Tested-by to it.

>> This has apparently been going on for a long while (it got merged into
>> 4.7), but presumably it only actually _matters_ if lguest is enabled
>> and used and we've triggered that lguest_arch_host_init() code.
>
> That's what I gather too, yes.
>
> What sane code would go and clear X86_FEATURE_PGE?!? :-)))
>
>> Maybe it's the lguest games with PGE that need to be removed?
>
> Well, as far as I can read the comment in lguest_arch_host_init(), it
> does some monkey business with switching to the guest kernel where
> global pages are not present anymore... or something. So it sounds to me
> like lguest would break if we removed the games but I have no idea what
> it does with that.
>
> And besides, the small hunk above restores the situation before
> ("c109bf95992b x86/cpufeature: Remove cpu_has_pge") so applying it would
> actually be a no-brainer.

Agree, looks only that hunk changed in behavior from c109bf95992b
("x86/cpufeature: Remove cpu_has_pge").

> Thanks.

--===============5545116096761949521==--

