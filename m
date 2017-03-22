Content-Type: multipart/mixed; boundary="===============2800114469764072290=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Wed, 22 Mar 2017 08:36:08 +0100
Message-ID: <20170322073608.GA5538@gmail.com>
In-Reply-To: <CAJcbSZEvR5GmxGt1K6JrA9KsDgv2TTbntwWFPZ+B01EhO9DSGQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2800114469764072290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Thomas Garnier <thgarnie@google.com> wrote:

> >  static inline void setup_fixmap_gdt(int cpu)
> >  {
> >         __set_fixmap(get_cpu_gdt_ro_index(cpu),
> > -                    __pa(get_cpu_gdt_rw(cpu)), pg_fixmap_gdt_flags);
> > +                    slow_virt_to_phys(get_cpu_gdt_rw(cpu)),
> > +                    pg_fixmap_gdt_flags);
> >  }
> >
> >  /* Load the original GDT from the per-cpu structure */
> >
> > This makes UP boot for me, but SMP (2 cpus) is still busted.
> =

> This change fixed boot for me:
> =

> diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
> index b65155cc3760..4e30707d9f9a 100644
> --- a/arch/x86/include/asm/fixmap.h
> +++ b/arch/x86/include/asm/fixmap.h
> @@ -104,7 +104,9 @@ enum fixed_addresses {
>         FIX_GDT_REMAP_BEGIN,
>         FIX_GDT_REMAP_END =3D FIX_GDT_REMAP_BEGIN + NR_CPUS - 1,
> =

> -       __end_of_permanent_fixed_addresses,
> +       __end_of_permanent_fixed_addresses =3D
> +               (FIX_GDT_REMAP_END + PTRS_PER_PTE - 1) &
> +               -PTRS_PER_PTE,
> =

> Just ensure PKMAP_BASE & FIX_WP_TEST are on a different PMD.
> =

> I don't think that the right fix but it might help understand the
> exact root cause.

Could this be related to the permission bits in the PMD itself getting out =
of sync =

with the PTEs? WP test marks a page writable/unwritable, and maybe we mess =
up the =

restoration. If they are on separate PMDs then this is worked around becaus=
e the =

fixmap GDT is on a separate PMD.

Thanks,

	Ingo

--===============2800114469764072290==--

