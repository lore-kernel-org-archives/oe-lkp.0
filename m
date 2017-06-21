Content-Type: multipart/mixed; boundary="===============6527707706452035021=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Wed, 21 Jun 2017 22:27:51 +0200
Message-ID: <20170621202751.GA29638@redhat.com>
In-Reply-To: <CA+55aFyTRPOuzo2-Q0xM4+D6naGxFtaE_7dbxXOOdwQ4QGPfpw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6527707706452035021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/21, Linus Torvalds wrote:
>
> On Wed, Jun 21, 2017 at 12:33 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> > -               if (unlikely(address + 65536 + 32 * sizeof(unsigned lon=
g) < regs->sp)) {
> > +if (0)         if (unlikely(address + 65536 + 32 * sizeof(unsigned lon=
g) < regs->sp)) {
>
> This smells bad.

Yes.

> That test is not about grow-down or even the guard page. That test is
> that it's always wrong to grow down the stack below %esp.

Sure.

but let me repeat that this test was essentially dismissed when the stack
guard page was introduced. Simply because do_page_pault() never hits (before
the recent patch) this need-to-grow-VM_GROWSDOWN-vma path if the stack grows
by less than PAGE_SIZE.

IOP. Suppose that an application does

	char * p =3D mmap(MAP_GROWSDOWN);
	for (;;)
		*p-- =3D 'x';
		=


before the "larger stack guard gap, between vmas" change the stack was
enlarged by do_anonymous_page(), __do_page_fault() didn't hit this path.

Now __do_page_fault() tries to expand the stack itself, and this check
fails.

Oleg.


--===============6527707706452035021==--

