Content-Type: multipart/mixed; boundary="===============6337691801677683277=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
Date: Fri, 14 Aug 2020 09:42:11 -0700
Message-ID: <CALCETrUZO7ifrQPKks=LuUoTcPcM7nE_TjaCXWpwMm8TOZLzDg@mail.gmail.com>
In-Reply-To: <20200814145823.GA13646@yuki.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============6337691801677683277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 7:58 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > do_debug is a bit of a red herring here.  ptrace should not be able to
> > > put a breakpoint on a kernel address, period.  I would just pick a
> > > fixed address that's in the kernel text range or even just in the
> > > pre-KASLR text range and make sure it gets rejected.  Maybe try a few
> > > different addresses for good measure.
> >
> > I've looked at the code and it seems like this would be a bit more
> > complicated since the breakpoint is set by an accident in a race and the
> > call still fails. Which is why the test triggers the breakpoint and
> > causes infinite loop in the kernel...
> >
> > I guess that we could instead read back the address with
> > PTRACE_PEEKUSER, so something as:
> >
> >
> > break_addr =3D ptrace(PTRACE_PEEKUSER, child_pid,
> >                     (void *)offsetof(struct user, u_debugreg[0]),
> >                     NULL);
> >
> > if (break_addr =3D=3D kernel_addr)
> >       tst_res(TFAIL, "ptrace() set break on a kernel address");
>
> So this works actually nicely, even better than the original code.
>
> Any hints on how to select a fixed address in the kernel range as you
> pointed out in one of the previous emails? I guess that this would end
> up as a per-architecture mess of ifdefs if we wanted to hardcode it.
>

It's fundamentally architecture dependent.  Sane architectures like
s390x don't even have this concept.

--Andy
--===============6337691801677683277==--

