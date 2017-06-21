Content-Type: multipart/mixed; boundary="===============8050813423597263323=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 12:39:33 -0700
Message-ID: <CA+55aFyTRPOuzo2-Q0xM4+D6naGxFtaE_7dbxXOOdwQ4QGPfpw@mail.gmail.com>
In-Reply-To: <20170621193338.GA29222@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8050813423597263323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 12:33 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> -               if (unlikely(address + 65536 + 32 * sizeof(unsigned long)=
 < regs->sp)) {
> +if (0)         if (unlikely(address + 65536 + 32 * sizeof(unsigned long)=
 < regs->sp)) {

This smells bad.

That test is not about grow-down or even the guard page. That test is
that it's always wrong to grow down the stack below %esp.

Except we allow some slop, because certain instructions take the page
fault before actually updating %rsp.

So that patch is not correct. We want a page fault (and *not* expand
the stack) if somebody accesses below the stack pointer.

If we had a regression, it's due to something else.

                  Linus

--===============8050813423597263323==--

