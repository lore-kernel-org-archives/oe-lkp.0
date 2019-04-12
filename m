Content-Type: multipart/mixed; boundary="===============1300204876336379661=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 1808d65b55 ("asm-generic/tlb: Remove arch_tlb*_mmu()"): BUG: KASAN: stack-out-of-bounds in __change_page_attr_set_clr
Date: Fri, 12 Apr 2019 20:13:35 +0200
Message-ID: <20190412181335.GB12232@hirez.programming.kicks-ass.net>
In-Reply-To: <E33FDED8-8B95-431D-9AC7-71D45AB49011@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1300204876336379661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2019 at 05:05:53PM +0000, Nadav Amit wrote:
> Peter, what do you say about this one? I assume there are no nested TLB
> flushes, but the code can easily be adapted (assuming there is a limit on
> the nesting level).

Possible. Althoug at this point I think we should just remove the
alignment, and them maybe do this on top later.

> -- >8 --
> =

> Subject: [PATCH] x86: Move flush_tlb_info off the stack
> ---
>  arch/x86/mm/tlb.c | 49 +++++++++++++++++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> =

> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index bc4bc7b2f075..15fe90d4e3e1 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -14,6 +14,7 @@
>  #include <asm/cache.h>
>  #include <asm/apic.h>
>  #include <asm/uv/uv.h>
> +#include <asm/local.h>
>  =

>  #include "mm_internal.h"
>  =

> @@ -722,43 +723,63 @@ void native_flush_tlb_others(const struct cpumask *=
cpumask,
>   */
>  unsigned long tlb_single_page_flush_ceiling __read_mostly =3D 33;
>  =

> +static DEFINE_PER_CPU_SHARED_ALIGNED(struct flush_tlb_info, flush_tlb_in=
fo);
> +#ifdef CONFIG_DEBUG_VM
> +static DEFINE_PER_CPU(local_t, flush_tlb_info_idx);
> +#endif
> +
>  void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
>  				unsigned long end, unsigned int stride_shift,
>  				bool freed_tables)
>  {
> +	struct flush_tlb_info *info;
>  	int cpu;
>  =

> -	struct flush_tlb_info info __aligned(SMP_CACHE_BYTES) =3D {
> -		.mm =3D mm,
> -		.stride_shift =3D stride_shift,
> -		.freed_tables =3D freed_tables,
> -	};
> -
>  	cpu =3D get_cpu();
>  =

> +	info =3D this_cpu_ptr(&flush_tlb_info);
> +
> +#ifdef CONFIG_DEBUG_VM
> +	/*
> +	 * Ensure that the following code is non-reentrant and flush_tlb_info
> +	 * is not overwritten. This means no TLB flushing is initiated by
> +	 * interrupt handlers and machine-check exception handlers. If needed,
> +	 * we can add additional flush_tlb_info entries.
> +	 */
> +	BUG_ON(local_inc_return(this_cpu_ptr(&flush_tlb_info_idx)) !=3D 1);

That's what we have this_cpu_inc_return() for.

> +#endif
> +
> +	info->mm =3D mm;
> +	info->stride_shift =3D stride_shift;
> +	info->freed_tables =3D freed_tables;
> +
>  	/* This is also a barrier that synchronizes with switch_mm(). */
> -	info.new_tlb_gen =3D inc_mm_tlb_gen(mm);
> +	info->new_tlb_gen =3D inc_mm_tlb_gen(mm);
>  =

>  	/* Should we flush just the requested range? */
>  	if ((end !=3D TLB_FLUSH_ALL) &&
>  	    ((end - start) >> stride_shift) <=3D tlb_single_page_flush_ceiling)=
 {
> -		info.start =3D start;
> -		info.end =3D end;
> +		info->start =3D start;
> +		info->end =3D end;
>  	} else {
> -		info.start =3D 0UL;
> -		info.end =3D TLB_FLUSH_ALL;
> +		info->start =3D 0UL;
> +		info->end =3D TLB_FLUSH_ALL;
>  	}
>  =

>  	if (mm =3D=3D this_cpu_read(cpu_tlbstate.loaded_mm)) {
> -		VM_WARN_ON(irqs_disabled());
> +		lockdep_assert_irqs_enabled();
>  		local_irq_disable();
> -		flush_tlb_func_local(&info, TLB_LOCAL_MM_SHOOTDOWN);
> +		flush_tlb_func_local(info, TLB_LOCAL_MM_SHOOTDOWN);
>  		local_irq_enable();
>  	}
>  =

>  	if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids)
> -		flush_tlb_others(mm_cpumask(mm), &info);
> +		flush_tlb_others(mm_cpumask(mm), info);
>  =

> +#ifdef CONFIG_DEBUG_VM
> +	barrier();
> +	local_dec(this_cpu_ptr(&flush_tlb_info_idx));

this_cpu_dec();

> +#endif
>  	put_cpu();
>  }
>  =

> -- =

> 2.17.1
> =

>=20

--===============1300204876336379661==--

