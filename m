Content-Type: multipart/mixed; boundary="===============3694993020243466116=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 1808d65b55 ("asm-generic/tlb: Remove arch_tlb*_mmu()"): BUG: KASAN: stack-out-of-bounds in __change_page_attr_set_clr
Date: Fri, 12 Apr 2019 20:19:30 +0200
Message-ID: <20190412181930.GD12232@hirez.programming.kicks-ass.net>
In-Reply-To: <F18AF0D5-D8B4-4F4B-8469-F9DEC49683C7@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3694993020243466116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2019 at 03:11:22PM +0000, Nadav Amit wrote:
> > On Apr 12, 2019, at 4:17 AM, Peter Zijlstra <peterz@infradead.org> wr=
ote:

> > To clarify, 'that' is Nadav's patch:
> > =

> >  515ab7c41306 ("x86/mm: Align TLB invalidation info")
> > =

> > which turns out to be the real problem.
> =

> Sorry for that. I still think it should be aligned, especially with all t=
he
> effort the Intel puts around to avoid bus-locking on unaligned atomic
> operations.

No atomics anywhere in sight, so that's not a concern.

> So the right solution seems to me as putting this data structure off stac=
k.
> It would prevent flush_tlb_mm_range() from being reentrant, so we can kee=
p a
> few entries for this matter and atomically increase the entry number every
> time we enter flush_tlb_mm_range().
> =

> But my question is - should flush_tlb_mm_range() be reentrant, or can we
> assume no TLB shootdowns are initiated in interrupt handlers and #MC
> handlers?

There _should_ not be, but then don't look at those XPFO patches that
were posted (they're broken anyway).


--===============3694993020243466116==--

