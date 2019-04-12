Content-Type: multipart/mixed; boundary="===============4057324176575625418=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: 1808d65b55 ("asm-generic/tlb: Remove arch_tlb*_mmu()"): BUG: KASAN: stack-out-of-bounds in __change_page_attr_set_clr
Date: Fri, 12 Apr 2019 19:42:37 +0000
Message-ID: <721948C9-0E56-4E70-B9C5-58F0A4A5C126@vmware.com>
In-Reply-To: <20190412181930.GD12232@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4057324176575625418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On Apr 12, 2019, at 11:19 AM, Peter Zijlstra <peterz@infradead.org> wro=
te:
> =

> On Fri, Apr 12, 2019 at 03:11:22PM +0000, Nadav Amit wrote:
>>> On Apr 12, 2019, at 4:17 AM, Peter Zijlstra <peterz@infradead.org> wr=
ote:
> =

>>> To clarify, 'that' is Nadav's patch:
>>> =

>>> 515ab7c41306 ("x86/mm: Align TLB invalidation info")
>>> =

>>> which turns out to be the real problem.
>> =

>> Sorry for that. I still think it should be aligned, especially with all =
the
>> effort the Intel puts around to avoid bus-locking on unaligned atomic
>> operations.
> =

> No atomics anywhere in sight, so that's not a concern.

You are right. I still think that at least TLB-wise it should be better to
have the argument off-stack. I=E2=80=99ll try to run some experiments, base=
d on
your feedback, and send a patch on top of your revert.

Sorry for the mess, again.



--===============4057324176575625418==--

