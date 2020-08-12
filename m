Content-Type: multipart/mixed; boundary="===============2743968791991841287=="
MIME-Version: 1.0
From: Cyril Hrubis <chrubis@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
Date: Wed, 12 Aug 2020 11:31:14 +0200
Message-ID: <20200812093114.GA13676@yuki.lan>
In-Reply-To: <CALCETrVX=wxRrv0qw-Enbyg5CEQsy5TigbNt7sSs=MDO6uAnMw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2743968791991841287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!
> do_debug is a bit of a red herring here.  ptrace should not be able to
> put a breakpoint on a kernel address, period.  I would just pick a
> fixed address that's in the kernel text range or even just in the
> pre-KASLR text range and make sure it gets rejected.  Maybe try a few
> different addresses for good measure.

I've looked at the code and it seems like this would be a bit more
complicated since the breakpoint is set by an accident in a race and the
call still fails. Which is why the test triggers the breakpoint and
causes infinite loop in the kernel...

I guess that we could instead read back the address with
PTRACE_PEEKUSER, so something as:


break_addr =3D ptrace(PTRACE_PEEKUSER, child_pid,
                    (void *)offsetof(struct user, u_debugreg[0]),
                    NULL);

if (break_addr =3D=3D kernel_addr)
	tst_res(TFAIL, "ptrace() set break on a kernel address");

-- =

Cyril Hrubis
chrubis(a)suse.cz
--===============2743968791991841287==--

