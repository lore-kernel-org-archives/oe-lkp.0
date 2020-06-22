Content-Type: multipart/mixed; boundary="===============5775397240870813924=="
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: lkp@lists.01.org
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
Date: Mon, 22 Jun 2020 15:46:32 +0530
Message-ID: <CA+G9fYu18y4iWOkTCDWi9dUj+FosStVTH-6swN7wE4GePZa=Ng@mail.gmail.com>
In-Reply-To: <87r1ucb0rt.fsf@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5775397240870813924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun 2020 at 01:32, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Cyril Hrubis <chrubis@suse.cz> writes:
> > What is does is to write:
> >
> >       (void*)1 to u_debugreg[0]
> >       (void*)1 to u_debugreg[7]
> >       do_debug addr to u_debugreg[0]
> >
> > Looking at the kernel code the write to register 7 enables the breakpoi=
nts and
> > what we attempt here is to change an invalid address to a valid one aft=
er we
> > enabled the breakpoint but that's as far I can go.
> >
> > So does anyone has an idea how to trigger the bug without the do_debug =
function
> > address? Would any valid kernel function address suffice?
>
> According to https://www.openwall.com/lists/oss-security/2018/05/01/3
> the trigger is to set the breakpoint to do_debug() and then execute
> INT1, aka. ICEBP which ends up in do_debug() ....
>
> In principle each kernel address is ok, but do_debug() is interesting
> due to the recursion issue because user space can reach it by executing
> INT1.
>
> So you might check for exc_debug() if do_debug() is not available and
> make the whole thing fail gracefully with a usefu error message.

My two cents,
LTP test case ptrace08 fails on x86_64 and i386.

ptrace08.c:62: BROK: Cannot find address of kernel symbol \"do_debug\"

This error is coming from test case setup
KERNEL_SYM =3D do_debug

if (strcmp(symname, KERNEL_SYM))
tst_brk(TBROK, "Cannot find address of kernel symbol \"%s\"",
KERNEL_SYM);

Test case got pass when DEBUG_INFO config enabled

CONFIG_DEBUG_INFO=3Dy

ptrace08.c:68: INFO: Kernel symbol \"do_debug\" found at 0xd8898410

Full test log,
https://lkft.validation.linaro.org/scheduler/job/1483117#L1325

ref:
https://bugs.linaro.org/show_bug.cgi?id=3D5651#c1
--===============5775397240870813924==--

