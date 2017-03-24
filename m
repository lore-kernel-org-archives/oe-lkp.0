Content-Type: multipart/mixed; boundary="===============0447952032733194728=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm/gup] 2947ba054a [ 71.329069] kernel BUG at include/linux/pagemap.h:151!
Date: Fri, 24 Mar 2017 11:51:53 +0100
Message-ID: <20170324105153.xvy5rcuawicqoanl@hirez.programming.kicks-ass.net>
In-Reply-To: <20170324102436.xltop6udkx5pg4oq@node.shutemov.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============0447952032733194728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2017 at 01:24:36PM +0300, Kirill A. Shutemov wrote:

> I'm not sure what is the best way to fix this.
> Few options:
>  - Drop the VM_BUG();
>  - Bump preempt count during __get_user_pages_fast();
>  - Use get_page() instead of page_cache_get_speculative() on x86.
> =

> Any opinions?

I think I'm in favour of the first; either remove or amend to include
irqs_disabled() or so.

This in favour of keeping the variants of GUP down.

--===============0447952032733194728==--

