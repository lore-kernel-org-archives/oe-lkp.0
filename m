Content-Type: multipart/mixed; boundary="===============5167639388752972029=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
Date: Thu, 18 Jun 2020 22:02:30 +0200
Message-ID: <87r1ucb0rt.fsf@nanos.tec.linutronix.de>
In-Reply-To: <20200617131742.GD8389@yuki.lan>
List-Id: <oe-lkp.lists.linux.dev>

--===============5167639388752972029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Cyril Hrubis <chrubis@suse.cz> writes:
> What is does is to write:
>
> 	(void*)1 to u_debugreg[0]
> 	(void*)1 to u_debugreg[7]
> 	do_debug addr to u_debugreg[0]
>
> Looking at the kernel code the write to register 7 enables the breakpoint=
s and
> what we attempt here is to change an invalid address to a valid one after=
 we
> enabled the breakpoint but that's as far I can go.
>
> So does anyone has an idea how to trigger the bug without the do_debug fu=
nction
> address? Would any valid kernel function address suffice?

According to https://www.openwall.com/lists/oss-security/2018/05/01/3
the trigger is to set the breakpoint to do_debug() and then execute
INT1, aka. ICEBP which ends up in do_debug() ....

In principle each kernel address is ok, but do_debug() is interesting
due to the recursion issue because user space can reach it by executing
INT1.

So you might check for exc_debug() if do_debug() is not available and
make the whole thing fail gracefully with a usefu error message.

Thanks,

        tglx
--===============5167639388752972029==--

