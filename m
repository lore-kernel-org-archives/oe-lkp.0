Content-Type: multipart/mixed; boundary="===============6339570306717483117=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 1808d65b55 ("asm-generic/tlb: Remove arch_tlb*_mmu()"): BUG: KASAN: stack-out-of-bounds in __change_page_attr_set_clr
Date: Fri, 12 Apr 2019 20:15:57 +0200
Message-ID: <20190412181557.GC12232@hirez.programming.kicks-ass.net>
In-Reply-To: <5890.1555087830@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============6339570306717483117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2019 at 05:50:30PM +0100, David Howells wrote:
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> =

> > We should never have stack alignment bigger than 16 bytes.  And
> > preferably not even that.
> =

> At least one arch I know of (FRV) had instructions that could atomically
> load/store register pairs or register quads, but they had to be pair- or
> quad-aligned (ie. 8- or 16-byte), which made for more efficient code if y=
ou
> could use them.
> =

> I don't know whether any arch we currently support has features like this=
 (I
> know some have multi-reg load/stores, but they seem to require only
> word-alignment).

ARC (iirc) has u64 atomics with natural alignment requirements but
alignof(u64)=3D4 due it being a 32bit arch. Which is awkward.

ARMv7 can also do u64 ops when aligned right, but I forgot if they have
proper alignment or not.

--===============6339570306717483117==--

