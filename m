Content-Type: multipart/mixed; boundary="===============8538892329979656881=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: 1808d65b55 ("asm-generic/tlb: Remove arch_tlb*_mmu()"): BUG: KASAN: stack-out-of-bounds in __change_page_attr_set_clr
Date: Fri, 12 Apr 2019 08:32:38 -0700
Message-ID: <CAHk-=wieBr3G=_ZGoCndi8XnuG1wtkedaGqkWB+=AVq65=_8sQ@mail.gmail.com>
In-Reply-To: <20190412105633.GM14281@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8538892329979656881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2019 at 3:56 AM Peter Zijlstra <peterz@infradead.org> wro=
te:
>
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -728,7 +728,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigne=
d long start,
>  {
>         int cpu;
>
> -       struct flush_tlb_info info __aligned(SMP_CACHE_BYTES) =3D {
> +       struct flush_tlb_info info =3D {
>                 .mm =3D mm,
>                 .stride_shift =3D stride_shift,
>                 .freed_tables =3D freed_tables,
>

Ack.

We should never have stack alignment bigger than 16 bytes.  And
preferably not even that. Trying to align stack at a cacheline
boundary is wrong - if you *really* need things to be that aligned, do
something else (regular kmalloc, percpu temp area, static allocation -
whatever).

           Linus

--===============8538892329979656881==--

