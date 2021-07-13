Content-Type: multipart/mixed; boundary="===============4956060307882279410=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/vmalloc] 5c1f4e690e: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Tue, 13 Jul 2021 19:26:53 +0100
Message-ID: <YO3a7erVd2yXdaAK@casper.infradead.org>
In-Reply-To: <CAHk-=wiDif7SvA5DOWj9ssDuYHC4ujUFPd7ad-ydhY-WMLb-kQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4956060307882279410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 11:19:29AM -0700, Linus Torvalds wrote:
> Does anybody see what the problem is there?
> =

> There's an odd report _after_ the warning:
> =

> [  131.345319] raw_local_irq_restore() called with IRQs enabled
> [  131.366561] RIP: 0010:warn_bogus_irq_restore+0x1d/0x20
> [  131.433334]  __alloc_pages_bulk+0xbb8/0xf20

That's the key -- __alloc_pages_bulk has interrupts disabled and then
page_owner allocates memory for the stack dump.  Mel has a fix; I think
we're just waiting for it to hit your tree.

--===============4956060307882279410==--

